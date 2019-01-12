library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.WindowCPU_PKG.all;
use work.TARGETC_pkg.all;

entity WindowControlV4 is
	Generic(
		NBRWINDOWS : integer := 16;
		MIN_LE_TIME : integer := 3;	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
		MIN_TE_TIME : integer := 1; -- 4 ns after falling of trigger
		MAX_TRIG_TIME: integer := 32
	);
	Port (
	nrst : 			in	STD_Logic;

	ClockBus:		in T_ClockBus;
	Timecounter:	in std_logic_vector(63 downto 0);

	trigger : 		in std_logic_vector(3 downto 0);

	-- Interface to WindowCPU
	CPUBus :			out t_CommandBus;
	TrigInfo_OUT:	out t_triggerinformation;

	WR_RS_S:		out std_logic_vector(1 downto 0);
	WR_CS_S:		out std_logic_vector(5 downto 0);

	CtrlBus_IxSL:		in 	T_CtrlBus_IxSL;

	CurAddr:		out	std_logic_vector(7 downto 0);
	--	NextBus_In:		in Bus_t(NBRWINDOWS-1 downto 0);
	--	PrevBus_In:		in Bus_t(NBRWINDOWS-1 downto 0);
	NextAddr_in : 	in std_logic_vector(7 downto 0);
	PrevAddr_in :	in std_logic_vector(7 downto 0);

    -- FIFO IN for Digiting
    DIG_Full	: out	std_logic;
    DIG_DataIn	: in	std_logic_vector(8 downto 0);
    DIG_WriteEn	: in	std_logic
	);

end WindowControlV4;

architecture Behavioral of WindowControlV4 is

	component SingleTrigger is
		Port (
		nrst : 			in	STD_Logic;

		clk:		in std_logic;

		trigger : 		in std_logic;
		TrigInfo_OUT:	out t_triggerinformationSingle

		);
	end component SingleTrigger;

	component LookupTable_LE is
	generic(
		MIN_LE_TIME : integer := 3	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
	);
	Port (
		SCnt:		in 	std_logic_vector(2 downto 0);
		prevWdo :	out	std_logic
	);
	end component LookupTable_LE;

	component LookupTable_TE is
	generic(
		MIN_TE_TIME : integer := 1
	);
	Port (
		SCnt:		in 	std_logic_vector(2 downto 0);
		NextWdo :	out	std_logic
	);
	end component LookupTable_TE;

	component aFifo is
    generic (
        DATA_WIDTH :integer := 8;
        ADDR_WIDTH :integer := 4
    );
    port (
    	rst :		in std_logic;
        -- Reading port.
        Data_out    :out std_logic_vector (DATA_WIDTH-1 downto 0);
        Empty_out   :out std_logic;
        ReadEn_in   :in  std_logic;
        RClk        :in  std_logic;
        -- Writing port.
        Data_in     :in  std_logic_vector (DATA_WIDTH-1 downto 0);
        Full_out    :out std_logic;
        WriteEn_in  :in  std_logic;
        WClk        :in  std_logic
    );
	end component aFifo;

	type storagestate is (
		IDLE,
		READY,
		RESPREADY,

		EVALUATE,
		MARK_WINDOW
	);
	signal storage_stm : storagestate := IDLE;

	type digstoragestate is (
		IDLE,
		READING,
		WRITING
	);
	signal digsto_stm : digstoragestate;

	type t_trigger_state is (
		TRIG_IDLE,
		TRIG_ENABLED,
		TRIG_SEND
	);
	signal trigger_stm : t_trigger_state;

	signal prevtrigger : std_logic;
	signal trigger_intl : std_logic;
	signal trigger_last_intl : std_logic;

	signal PREVBus_intl :		Bus_t(NBRWINDOWS-1 downto 0);
	signal NEXTBus_intl :		Bus_t(NBRWINDOWS-1 downto 0);

	signal MarkWindow : std_logic_vector(7 downto 0);
	signal NextMarkWindow : std_logic_vector(7 downto 0);

	signal WR_ADDR_s : std_logic_vector(7 downto 0);
	signal busy_intl : std_logic;
	signal NextAddr_intl : std_logic_vector(7 downto 0);
	signal PrevAddr_intl : std_logic_vector(7 downto 0);

--	signal cmdbus_intl : std_logic_vector(2 downto 0);
--	signal cmdwdo_en_intl: std_logic_vector(NBRWINDOWS-1 downto 0);

	signal FstWindow512 : std_logic_vector(8 downto 0);
	signal CntWindow512 : std_logic_vector(8 downto 0);

	signal DIG_Empty_intl, STO_ReadEn : std_logic;
	signal DIG_DataOut_intl : std_logic_vector(8 downto 0);

	signal prevWdo_LE: std_logic;
	signal nextWdo_TE: std_logic;

	-- Optimization for LUT reduction
	signal cmp1_CntWindow512 : std_logic := '0';
	signal TrigInfo_A : t_triggerinformationSingle;
	signal TrigInfo_B : t_triggerinformationSingle;
	signal TrigInfo_C : t_triggerinformationSingle;
	signal TrigInfo_D : t_triggerinformationSingle;

	signal cmd_s : std_logic;
	signal Bus_intl : t_CommandBus;
	signal nClr_TrigInfo : std_logic;
begin

	TrigA_inst : SingleTrigger
	Port map(
		nrst => nrst,

		clk	=> ClockBus.CLK250MHz,

		trigger => trigger(0),
		TrigInfo_OUT	=> TrigInfo_A
	);

	TrigB_inst : SingleTrigger
	Port map(
		nrst => nrst,

		clk	=> ClockBus.CLK250MHz,

		trigger => trigger(1),
		TrigInfo_OUT	=> TrigInfo_B
	);

	TrigC_inst : SingleTrigger
	Port map(
		nrst => nrst,

		clk	=> ClockBus.CLK250MHz,

		trigger => trigger(2),
		TrigInfo_OUT	=> TrigInfo_C
	);

	TrigD_inst : SingleTrigger
	Port map(
		nrst => nrst,

		clk	=> ClockBus.CLK250MHz,

		trigger => trigger(3),
		TrigInfo_OUT	=> TrigInfo_D
	);

	LE_LUT_inst : 	LookupTable_LE
	generic map(
		MIN_LE_TIME => MIN_LE_TIME
	)
	port map(
		SCnt	=>  Timecounter(2 downto 0),
		prevWdo => prevWdo_LE
	);

	TE_LUT_inst : 	LookupTable_TE
	generic map(
		MIN_TE_TIME => MIN_TE_TIME
	)
	port map(
		SCnt	=>  Timecounter(2 downto 0),
		nextWdo => nextWdo_TE
	);

    -- Digitizing and Storage FIFO
	DIG_STO_AFIFO :  aFifo
    generic map(
        DATA_WIDTH => 9,
        ADDR_WIDTH => 4	--Maybe more ?
    )
    port map (
    	rst 	=> nrst,
        -- Reading port.
        Data_out    => DIG_DataOut_intl,
        Empty_out   => DIG_Empty_intl,
        ReadEn_in   => STO_ReadEn,
        RClk        => ClockBus.CLK250MHz,
        -- Writing port.
        Data_in     => DIG_DataIn,
        Full_out    => DIG_Full,
        WriteEn_in  => DIG_WriteEn,
        WClk        => ClockBus.WL_CLK
    );

	NextAddr_intl <=	NextAddr_in;
	PrevAddr_intl <= 	PrevAddr_in;

	trigger_intl <= TrigInfo_A.trig or TrigInfo_B.trig or TrigInfo_C.trig or TrigInfo_D.trig;
	trigger_last_intl <= TrigInfo_A.last or TrigInfo_B.last or TrigInfo_C.last or TrigInfo_D.last;

	CPUBus <= Bus_intl;

	-- Address Change Write Storage Area
	process(ClockBus.SSTIN,nRST)
	begin
		if nrst = '0' then
			WR_ADDR_S <= (others => '0');
		else
			if rising_edge(ClockBus.SSTIN) then
				WR_ADDR_S <= NextAddr_intl;
			end if;
		end if;
	end process;

	CurAddr	<= WR_ADDR_S;
	WR_RS_S <= WR_ADDR_S(1 downto 0);	-- TARGET C : Write Row Select
	WR_CS_S <= WR_ADDR_S(7 downto 2);

	-- Minimal State Machine For Windows select
	process(ClockBus.CLK250MHz, nRST, CtrlBus_IxSL.SWRESET)	-- Every 64 ns
	begin
	if nRST = '0' or CtrlBus_IxSL.SWRESET = '0' then
			storage_stm <= IDLE;
			FstWindow512 <= (others => '0');
			CntWindow512 <= (others => '0');

			busy_intl <= '0';

			Bus_intl.en <= '0';
			Bus_intl.addr <= (others => '0');
			prevTrigger <= '0';

			TrigInfo_OUT <= (others => (others=>'0'));
		else
			if rising_edge(ClockBus.CLK250MHz) then

				prevTrigger <= trigger_intl;
				-- Trigger is activ
				if trigger_intl = '1' then

					if trigger_last_intl = '0' then

						if prevTrigger = '0' and trigger_intl = '1' then
							if prevWdo_LE = '1' and  Timecounter(3) = '0' then
								Bus_intl.addr <= PrevAddr_intl;	-- Carefull with the steady of this address
								Bus_intl.cmd <= CMD_WR2_MARKED;
								Bus_intl.en <= '1';
							end if;
						else
							if  Timecounter(3) = '0' then
								Bus_intl.cmd <= CMD_WR1_MARKED;
							else
								Bus_intl.cmd <= CMD_WR2_MARKED;
							end if;

							Bus_intl.addr <= WR_ADDR_S;
							Bus_intl.en <= '1';
						end if;
					--TE
					else
						Bus_intl.en <= '1';
						if nextWdo_TE = '1'  and  Timecounter(3)='1' then --
							Bus_intl.cmd <= CMD_WR1_MARKED;
							Bus_intl.addr <= NextAddr_intl;
						else
							Bus_intl.addr <= WR_ADDR_S;
							if Timecounter(3)='1' then
								Bus_intl.cmd <= CMD_WR2_MARKED;
							else
								Bus_intl.cmd <= CMD_WR1_MARKED;
							end if;
						end if;
					end if;
				else
					Bus_intl.en <= '0';
				end if;

				-- Update the Triggering information
				TrigInfo_OUT.long(3) <= TrigInfo_D.long;
				TrigInfo_OUT.long(2) <= TrigInfo_C.long;
				TrigInfo_OUT.long(1) <= TrigInfo_B.long;
				TrigInfo_OUT.long(0) <= TrigInfo_A.long;

				TrigInfo_OUT.last(3) <= TrigInfo_D.last;
				TrigInfo_OUT.last(2) <= TrigInfo_C.last;
				TrigInfo_OUT.last(1) <= TrigInfo_B.last;
				TrigInfo_OUT.last(0) <= TrigInfo_A.last;

				TrigInfo_OUT.trig(3) <= TrigInfo_D.trig;
				TrigInfo_OUT.trig(2) <= TrigInfo_C.trig;
				TrigInfo_OUT.trig(1) <= TrigInfo_B.trig;
				TrigInfo_OUT.trig(0) <= TrigInfo_A.trig;

				-- Normal Storage Case from PS
				case storage_stm is
					when IDLE =>
						--cmdwdo_en_intl <= (others => '0');
						Bus_intl.en <= '0';

						storage_stm <= READY;
						busy_intl <= '0';
					when READY =>
						busy_intl <= '0';
						if(CtrlBus_IxSL.WindowStorage = '1') then
							-- First Window && Counter is on 512 windows (9bits)
							FstWindow512 	<= CtrlBus_IxSL.FSTWINDOW(8 downto 0);
							CntWindow512	<= CtrlBus_IxSL.NBRWINDOW(8 downto 0);
							storage_stm <= RESPREADY;
						else
							storage_stm <= READY;
						end if;

					when RESPREADY =>
						if(CtrlBus_IxSL.WindowStorage = '0') then
							--storage_stm <= STORAGE;
							busy_intl <= '1';
							storage_stm <= EVALUATE;

						else
							busy_intl <= '0';
							storage_stm <= RESPREADY;
						end if;

					when EVALUATE =>

						-- Waiting to have the next window
						if NextAddr_intl = FstWindow512(8 downto 1) then
							storage_stm <= MARK_WINDOW;
							MarkWindow <= NextAddr_intl;

							if FstWindow512(0) = '0' then
								-- case CntWindow512 is
								-- 	when "000000000" =>
								-- 	when "000000001" =>
								-- 		Bus_intl.en <= '1';
								-- 		Bus_intl.cmd <= CMD_WR1_MARKED;
								-- 		--cmdbus_intl <= CMD_WR1_MARKED;
								-- 		--cmdwdo_en_intl(to_integer(unsigned(NextAddr_intl))) <= '1';
								-- 		Bus_intl.addr <= NextAddr_intl;
								-- 		CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);
								-- 	when others =>
								-- 		Bus_intl.en <= '1';
								-- 		Bus_intl.cmd <= CMD_BOTH_MARKED;
								-- 		Bus_intl.addr <= NextAddr_intl;
								--
								-- 		--cmdbus_intl <= CMD_BOTH_MARKED;
								-- 		--cmdwdo_en_intl(to_integer(unsigned(NextAddr_intl))) <= '1';
								-- 		CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 2);
								-- end case;

								--Optimization for LUT reduction
								if cmp1_CntWindow512 = '1' then
									Bus_intl.en <= '1';
									Bus_intl.cmd <= CMD_WR1_MARKED;
									Bus_intl.addr <= NextAddr_intl;
									CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);
								else
									Bus_intl.en <= '1';
									Bus_intl.cmd <= CMD_BOTH_MARKED;
									Bus_intl.addr <= NextAddr_intl;
									CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 2);
								end if;
							else
								-- case CntWindow512 is
								-- 	when "000000000" =>
								-- 	when others =>
								-- 		Bus_intl.en <= '1';
								-- 		Bus_intl.cmd <= CMD_WR2_MARKED;
								-- 		Bus_intl.addr <= NextAddr_intl;
								--
								-- 		--cmdbus_intl <= CMD_WR2_MARKED;
								-- 		--cmdwdo_en_intl(to_integer(unsigned(NextAddr_intl))) <= '1';
								-- 		CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);
								-- end case;

								--Optimization for LUT reduction
								Bus_intl.en <= '1';
								Bus_intl.cmd <= CMD_WR2_MARKED;
								Bus_intl.addr <= NextAddr_intl;
								CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);

							end if;
							storage_stm <= MARK_WINDOW;
						else
							storage_stm <= EVALUATE;
						end if;

					when MARK_WINDOW =>
						--cmdwdo_en_intl <= (others => '0');
						Bus_intl.en <= '0';
						--MarkWindow <= NextMarkWindow;
						MarkWindow <= NextAddr_intl;

						if to_integer(unsigned(CntWindow512)) /= 0 then
							-- Check if FSTWINDOW is ODD or EVEN
							if FstWindow512(0) = '0' then
								-- case CntWindow512 is
								-- 	when "000000000" =>
								-- 	when "000000001" =>
								-- 		--cmdbus_intl <= CMD_WR1_MARKED;
								-- 		--cmdwdo_en_intl(to_integer(unsigned(NextMarkWindow))) <= '1';
								-- 		Bus_intl.en <= '1';
								-- 		Bus_intl.cmd <= CMD_WR1_MARKED;
								-- 		Bus_intl.addr <= NextMarkWindow;
								-- 		CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);
								-- 	when others =>
								-- 		--cmdbus_intl <= CMD_BOTH_MARKED;
								-- 		--cmdwdo_en_intl(to_integer(unsigned(NextMarkWindow))) <= '1';
								-- 		Bus_intl.en <= '1';
								-- 		Bus_intl.cmd <= CMD_BOTH_MARKED;
								-- 		Bus_intl.addr <= NextMarkWindow;
								-- 		CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 2);
								-- end case;

								--Optimization for LUT reduction
								if cmp1_CntWindow512 = '1' then
									Bus_intl.en <= '1';
									Bus_intl.cmd <= CMD_WR1_MARKED;
									Bus_intl.addr <= NextMarkWindow;
									CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);
								else
									Bus_intl.en <= '1';
									Bus_intl.cmd <= CMD_BOTH_MARKED;
									Bus_intl.addr <= NextMarkWindow;
									CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 2);
								end if;
							else
								-- case CntWindow512 is
								-- 	when "000000000" =>
								-- 	when "000000001" =>
								-- 		--cmdbus_intl <= CMD_WR1_MARKED;
								-- 		--cmdwdo_en_intl(to_integer(unsigned(NextMarkWindow))) <= '1';
								-- 		Bus_intl.en <= '1';
								-- 		Bus_intl.cmd <= CMD_WR1_MARKED;
								-- 		Bus_intl.addr <= NextMarkWindow;
								-- 		CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);
								-- 	when others =>
								-- 		--cmdbus_intl <= CMD_BOTH_MARKED;
								-- 		--cmdwdo_en_intl(to_integer(unsigned(NextMarkWindow))) <= '1';
								-- 		Bus_intl.en <= '1';
								-- 		Bus_intl.cmd <= CMD_BOTH_MARKED;
								-- 		Bus_intl.addr <= NextMarkWindow;
								-- 		CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 2);
								-- end case;

								--Optimization for LUT reduction
								if cmp1_CntWindow512 = '1' then
									Bus_intl.en <= '1';
									Bus_intl.cmd <= CMD_WR1_MARKED;
									Bus_intl.addr <= NextMarkWindow;
									CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);
								else
									Bus_intl.en <= '1';
									Bus_intl.cmd <= CMD_BOTH_MARKED;
									Bus_intl.addr <= NextMarkWindow;
									CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 2);
								end if;
							end if;
						else
							busy_intl <= '0';
							storage_stm <= IDLE;
						end if;
					when others =>
				end case;


				-- State Machine for Reading the windows digitized
				case digsto_stm is
					when IDLE =>
						if DIG_Empty_intl = '0' then
							digsto_stm <= READING;
							STO_ReadEn <= '1';
						else
							digsto_stm <= IDLE;
							STO_ReadEn <= '0';
						end if;
					when READING =>

						digsto_stm <= WRITING;
						STO_ReadEn <= '0';

					when WRITING =>
						if Busy_intl = '0' then

							if DIG_DataOut_intl(0) = '0' then
								Bus_intl.cmd <= CMD_WR1_EN_DIS;
							else
								Bus_intl.cmd <= CMD_WR2_EN_DIS;
							end if;

							Bus_intl.en <= '1';
							Bus_intl.addr <= DIG_DataOut_intl(8 downto 1);
							digsto_stm <= IDLE;
						else
							digsto_stm <= WRITING;
						end if;
					when others =>
						digsto_stm <= IDLE;
						STO_ReadEn <= '0';
				end case;
			end if;
		end if;
	end process;

-- Optimization for slice LUT reduction
	process(ClockBus.CLK250MHz)
	BEGIN
		if rising_edge(ClockBus.CLK250MHz) then
			if CntWindow512 = "000000001" then
				cmp1_CntWindow512 <= '1';
			else
				cmp1_CntWindow512 <= '0';
			end if;
		end if;
	end process;

end Behavioral;
