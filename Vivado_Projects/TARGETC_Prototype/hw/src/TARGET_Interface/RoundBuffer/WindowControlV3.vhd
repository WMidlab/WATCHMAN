library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.WindowCPU_PKG_old.all;
use work.TARGETC_pkg.all;

entity WindowControlV3 is
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
	BusA :			out t_CommandBus;
	BusB :			out t_CommandBus;
	BusC :			out t_CommandBus;
	BusD :			out t_CommandBus;

	TrigInfo_OUT:	out t_triggerinformation;

	WR_RS_S:		out std_logic_vector(1 downto 0);
	WR_CS_S:		out std_logic_vector(5 downto 0);

	CtrlBus_IxSL:		in 	T_CtrlBus_IxSL;

	CurAddr:		out	std_logic_vector(7 downto 0);
	NextBus_In:		in Bus_t(NBRWINDOWS-1 downto 0);
	PrevBus_In:		in Bus_t(NBRWINDOWS-1 downto 0);
	--NextAddr_in : 	in std_logic_vector(7 downto 0);
	--PrevAddr_in :	in std_logic_vector(7 downto 0);

    -- FIFO IN for Digiting
    DIG_Full	: out	std_logic;
    DIG_DataIn	: in	std_logic_vector(8 downto 0);
    DIG_WriteEn	: in	std_logic
	);

end WindowControlV3;

architecture Behavioral of WindowControlV3 is

	component LookupTable_LE_old is
	generic(
		MIN_LE_TIME : integer := 3	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
	);
	Port (
		SCnt:		in 	std_logic_vector(2 downto 0);
		prevWdo :	out	std_logic
	);
	end component LookupTable_LE_old;

	component LookupTable_TE_old is
	generic(
		MIN_TE_TIME : integer := 1
	);
	Port (
		SCnt:		in 	std_logic_vector(2 downto 0);
		NextWdo :	out	std_logic
	);
	end component LookupTable_TE_old;

	component WindowSelect is

		Port (
		--Clk        :in  std_logic;
		CurAddr :		in std_logic_vector(7 downto 0);

		NextBus_In:		in Bus_t(255 downto 0);
		PrevBus_In:		in Bus_t(255 downto 0);
		
		NextAddr:		out std_logic_vector(7 downto 0);
		PrevAddr:		out std_logic_vector(7 downto 0)
		);
	end component WindowSelect;

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

	component Counter_En is
		generic(
			NBITS : integer := 8
		);
		port(
			CLK : in  std_logic;
			RST : in  std_logic;
			EN : in std_logic;
			Q : out std_logic_vector(NBITS-1 downto 0)
		);

	end component Counter_En;


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
		TRIG_ENABLED
	);
	signal triggerA_stm : t_trigger_state;
	signal triggerB_stm : t_trigger_state;
	signal triggerC_stm : t_trigger_state;
	signal triggerD_stm : t_trigger_state;

	signal prevtrigger : std_logic_vector(3 downto 0);

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
	signal flgA_LE, flgB_LE, flgC_LE, flgD_LE: std_logic;
--	signal flgA_TE, flgB_TE, flgC_TE, flgD_TE: std_logic;
	type t_counter8bits is array (integer range <>) of std_logic_vector(7 downto 0);
	signal CntTrigPulse : t_counter8bits(3 downto 0);

	-- Optimization for LUT reduction
	signal cmp1_CntWindow512 : std_logic := '0';
	signal TrigInfo_A : t_triggerinformationSingle;
	signal TrigInfo_B : t_triggerinformationSingle;
	signal TrigInfo_C : t_triggerinformationSingle;
	signal TrigInfo_D : t_triggerinformationSingle;

	signal cmd_s : std_logic;
begin

	LE_LUT_inst : 	LookupTable_LE_old
	generic map(
		MIN_LE_TIME => MIN_LE_TIME
	)
	port map(
		SCnt	=>  Timecounter(2 downto 0),
		prevWdo => prevWdo_LE
	);

	TE_LUT_inst : 	LookupTable_TE_old
	generic map(
		MIN_TE_TIME => MIN_TE_TIME
	)
	port map(
		SCnt	=>  Timecounter(2 downto 0),
		nextWdo => nextWdo_TE
	);

	-- Cnt_TriggerA : Counter_En
	-- 	generic map(
	-- 		NBITS => 8
	-- 	)
	-- 	port map(
	-- 		CLK 	=> ClockBus.CLK250MHz,
	-- 		RST		=>  nRST,
	-- 		EN 		=> trigger(0),
	-- 		Q 		=> CntTrigPulse(0)
	-- 	);
	--
	-- Cnt_TriggerB : Counter_En
	-- 	generic map(
	-- 		NBITS => 8
	-- 	)
	-- 	port map(
	-- 		CLK 	=> ClockBus.CLK250MHz,
	-- 		RST		=>  nRST,
	-- 		EN 		=> trigger(1),
	-- 		Q 		=> CntTrigPulse(1)
	-- 	);
	--
	-- Cnt_TriggerC : Counter_En
	-- 	generic map(
	-- 		NBITS => 8
	-- 	)
	-- 	port map(
	-- 		CLK 	=> ClockBus.CLK250MHz,
	-- 		RST		=>  nRST,
	-- 		EN 		=> trigger(2),
	-- 		Q 		=> CntTrigPulse(2)
	-- 	);
	--
	-- Cnt_TriggerD : Counter_En
	-- 	generic map(
	-- 		NBITS => 8
	-- 	)
	-- 	port map(
	-- 		CLK 	=> ClockBus.CLK250MHz,
	-- 		RST		=>  nRST,
	-- 		EN 		=> trigger(3),
	-- 		Q 		=> CntTrigPulse(3)
	-- 	);

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

	-- WDOSS_Normal : AddressSelect
   -- 	Port map (
	-- nrst => nrst,
   -- 	clk			=> ClockBus.CLK250MHz,
   -- 	CurAddr 	=> WR_ADDR_S,
   --
   -- 	NextBus_In	=> NextBus_In,
   -- 	PrevBus_In	=> PrevBus_In,
   --
   -- 	NextAddr	=> NextAddr_intl,
   -- 	PrevAddr	=> PrevAddr_intl
   -- 	);
   --
   -- WDOSS_Search : AddressSelect
   -- 	Port map (
	-- nrst => nrst,
   -- 	clk			=> ClockBus.CLK250MHz,
   -- 	CurAddr 	=> MarkWindow,
   --
   -- 	NextBus_In	=> NextBus_In,
   -- 	PrevBus_In	=> PrevBus_In,
   --
   -- 	NextAddr	=> NextMarkWindow,
   -- 	PrevAddr	=> open
   -- 	);

	--NextAddr_intl <=	NextAddr_in;
	--PrevAddr_intl <= 	PrevAddr_in;

	WDOSS_Normal : WindowSelect
	 	Port map (
	 	--clk			=> ClockBus.CLK250MHz,
	 	CurAddr 	=> WR_ADDR_S,
	
	 	NextBus_In	=> NextBus_In,
	 	PrevBus_In	=> PrevBus_In,
	
	 	NextAddr	=> NextAddr_intl,
	 	PrevAddr	=> PrevAddr_intl
	 	);
	--
	-- WDOSS_Search : WindowSelect
	-- 	Port map (
	-- 	clk			=> ClockBus.CLK250MHz,
	-- 	CurAddr 	=> MarkWindow,
	--
	-- 	NextBus_In	=> NextBus_In,
	-- 	PrevBus_In	=> PrevBus_In,
	--
	-- 	NextAddr	=> NextMarkWindow,
	-- 	PrevAddr	=> open
	-- 	);

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
--	process(ClockBus.CLK250MHz, nRST, CtrlBus_IxSL.SWRESET)	-- Every 64 ns
--	begin
--	if nRST = '0' or CtrlBus_IxSL.SWRESET = '0' then
process(ClockBus.CLK250MHz, nRST)	-- Every 64 ns
	begin
	if nRST = '0' then
	
			storage_stm <= IDLE;
			FstWindow512 <= (others => '0');
			CntWindow512 <= (others => '0');

		--	cmdbus_intl <= (others => '0');
		--	cmdwdo_en_intl <= (others => '0');
			busy_intl <= '0';

			BusA.en <= '0';
			BusA.addr <= (others =>'0');
			flgA_LE <= '0';
			prevTrigger <= (others=>'0');

		else
			if rising_edge(ClockBus.CLK250MHz) then
				-- State Machine for Storing
--				cmdwdo_en_intl <= (others => '0');

				prevTrigger <= trigger;

				-- Trigger A
				case triggerA_stm is
					when TRIG_IDLE =>
						--cmdwdo_en_intl <= (others => '0');
						BusA.en <= '0';
						BusA.addr <= (others =>'0');
						BusA.cmd <= (others =>'0');

						--TrigInfo_Out.trig(0) <= '0';
						--TrigInfo_OUT.long(0) <= '0';
						--TrigInfo_OUT.last(0) <= '0';
						TrigInfo_A.trig <= '0';
						TrigInfo_A.last <= '0';
						TrigInfo_A.long <= '0';

						if prevTrigger(0) = '0' and trigger(0)= '1' then
							if prevWdo_LE = '1' and  Timecounter(3) = '0' and flgA_LE = '0' then
								-- Previous Window
								flgA_LE <= '1';
								--TrigInfo_OUT.trig(0) <= '1';
								--TrigInfo_A.trig <= '1';
								--cmdbus_intl <= CMD_WR2_MARKED;
								--cmdwdo_en_intl(to_integer(unsigned(PrevAddr_intl))) <= '1';
								BusA.cmd <= CMD_WR2_MARKED;
								BusA.addr <= PrevAddr_intl;
								BusA.en <= '1';

								--triggerA_stm <= TRIG_ENABLED;
							-- else
							-- 	 -- no need for previous window
							-- 	-- TrigInfo_OUT.trig(0) <= '1';
							-- 	TrigInfo_A.trig <= '1';
							-- 	 triggerA_stm <= TRIG_ENABLED;
							end if;
							TrigInfo_A.trig <= '1';
							triggerA_stm <= TRIG_ENABLED;
						end if;
					when TRIG_ENABLED =>
						BusA.en <= '1';

						-- TE
						if prevTrigger(0) = '1' and trigger(0)= '0' then

							--BusA.cmd
							-- if nextWdo_TE = '1' and  Timecounter(3) = '1' then
							-- 	BusA.cmd <= CMD_WR1_MARKED;
							-- elsif nextWdo_TE = '1' and  Timecounter(3) = '0' then
							-- 	BusA.cmd <= CMD_WR2_MARKED;
							-- elsif nextWdo_TE = '0' and  Timecounter(3) = '0' then
							-- 	BusA.cmd <= CMD_WR1_MARKED;
							-- elsif nextWdo_TE = '0' and  Timecounter(3) = '1' then
							-- 	BusA.cmd <= CMD_WR2_MARKED;
							-- end if;
							if cmd_s = '1' then
								BusA.cmd <= CMD_WR1_MARKED;
							else
								BusA.cmd <= CMD_WR2_MARKED;
							end if;

							--BusA.addr
							if nextWdo_TE = '1' and  Timecounter(3) = '1' then
								BusA.addr <= NextAddr_intl;
							else
								BusA.addr <= WR_ADDR_S;
							end if;

							TrigInfo_A.last <= '1';
							triggerA_stm <= TRIG_IDLE;
							flgA_LE <= '0';
						else -- Middle
							if  Timecounter(3) = '0' then
								BusA.cmd <= CMD_WR1_MARKED;
							else
								BusA.cmd <= CMD_WR2_MARKED;
							end if;

							BusA.addr <= WR_ADDR_S;
							triggerA_stm <= TRIG_ENABLED;
						end if;
					when others =>
				end case;


				-- Normal Storage Case from PS
				case storage_stm is
					when IDLE =>
						--cmdwdo_en_intl <= (others => '0');
						BusA.en <= '0';

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
								-- 		BusA.en <= '1';
								-- 		BusA.cmd <= CMD_WR1_MARKED;
								-- 		--cmdbus_intl <= CMD_WR1_MARKED;
								-- 		--cmdwdo_en_intl(to_integer(unsigned(NextAddr_intl))) <= '1';
								-- 		BusA.addr <= NextAddr_intl;
								-- 		CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);
								-- 	when others =>
								-- 		BusA.en <= '1';
								-- 		BusA.cmd <= CMD_BOTH_MARKED;
								-- 		BusA.addr <= NextAddr_intl;
								--
								-- 		--cmdbus_intl <= CMD_BOTH_MARKED;
								-- 		--cmdwdo_en_intl(to_integer(unsigned(NextAddr_intl))) <= '1';
								-- 		CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 2);
								-- end case;

								--Optimization for LUT reduction
								if cmp1_CntWindow512 = '1' then
									BusA.en <= '1';
									BusA.cmd <= CMD_WR1_MARKED;
									BusA.addr <= NextAddr_intl;
									CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);
								else
									BusA.en <= '1';
									BusA.cmd <= CMD_BOTH_MARKED;
									BusA.addr <= NextAddr_intl;
									CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 2);
								end if;
							else
								-- case CntWindow512 is
								-- 	when "000000000" =>
								-- 	when others =>
								-- 		BusA.en <= '1';
								-- 		BusA.cmd <= CMD_WR2_MARKED;
								-- 		BusA.addr <= NextAddr_intl;
								--
								-- 		--cmdbus_intl <= CMD_WR2_MARKED;
								-- 		--cmdwdo_en_intl(to_integer(unsigned(NextAddr_intl))) <= '1';
								-- 		CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);
								-- end case;

								--Optimization for LUT reduction
								BusA.en <= '1';
								BusA.cmd <= CMD_WR2_MARKED;
								BusA.addr <= NextAddr_intl;
								CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);

							end if;
							storage_stm <= MARK_WINDOW;
						else
							storage_stm <= EVALUATE;
						end if;

					when MARK_WINDOW =>
						--cmdwdo_en_intl <= (others => '0');
						BusA.en <= '0';
						MarkWindow <= NextMarkWindow;

						if to_integer(unsigned(CntWindow512)) /= 0 then
							-- Check if FSTWINDOW is ODD or EVEN
							if FstWindow512(0) = '0' then
								-- case CntWindow512 is
								-- 	when "000000000" =>
								-- 	when "000000001" =>
								-- 		--cmdbus_intl <= CMD_WR1_MARKED;
								-- 		--cmdwdo_en_intl(to_integer(unsigned(NextMarkWindow))) <= '1';
								-- 		BusA.en <= '1';
								-- 		BusA.cmd <= CMD_WR1_MARKED;
								-- 		BusA.addr <= NextMarkWindow;
								-- 		CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);
								-- 	when others =>
								-- 		--cmdbus_intl <= CMD_BOTH_MARKED;
								-- 		--cmdwdo_en_intl(to_integer(unsigned(NextMarkWindow))) <= '1';
								-- 		BusA.en <= '1';
								-- 		BusA.cmd <= CMD_BOTH_MARKED;
								-- 		BusA.addr <= NextMarkWindow;
								-- 		CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 2);
								-- end case;

								--Optimization for LUT reduction
								if cmp1_CntWindow512 = '1' then
									BusA.en <= '1';
									BusA.cmd <= CMD_WR1_MARKED;
									BusA.addr <= NextMarkWindow;
									CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);
								else
									BusA.en <= '1';
									BusA.cmd <= CMD_BOTH_MARKED;
									BusA.addr <= NextMarkWindow;
									CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 2);
								end if;
							else
								-- case CntWindow512 is
								-- 	when "000000000" =>
								-- 	when "000000001" =>
								-- 		--cmdbus_intl <= CMD_WR1_MARKED;
								-- 		--cmdwdo_en_intl(to_integer(unsigned(NextMarkWindow))) <= '1';
								-- 		BusA.en <= '1';
								-- 		BusA.cmd <= CMD_WR1_MARKED;
								-- 		BusA.addr <= NextMarkWindow;
								-- 		CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);
								-- 	when others =>
								-- 		--cmdbus_intl <= CMD_BOTH_MARKED;
								-- 		--cmdwdo_en_intl(to_integer(unsigned(NextMarkWindow))) <= '1';
								-- 		BusA.en <= '1';
								-- 		BusA.cmd <= CMD_BOTH_MARKED;
								-- 		BusA.addr <= NextMarkWindow;
								-- 		CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 2);
								-- end case;

								--Optimization for LUT reduction
								if cmp1_CntWindow512 = '1' then
									BusA.en <= '1';
									BusA.cmd <= CMD_WR1_MARKED;
									BusA.addr <= NextMarkWindow;
									CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);
								else
									BusA.en <= '1';
									BusA.cmd <= CMD_BOTH_MARKED;
									BusA.addr <= NextMarkWindow;
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
								BusA.cmd <= CMD_WR1_EN_DIS;
							else
								BusA.cmd <= CMD_WR2_EN_DIS;
							end if;

							BusA.en <= '1';
							BusA.addr <= DIG_DataOut_intl(8 downto 1);
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


	-- Process for triggerB_stm
--	process(ClockBus.CLK250MHz, nRST, CtrlBus_IxSL.SWRESET)	-- Every 64 ns
--	begin
--	if nRST = '0' or CtrlBus_IxSL.SWRESET = '0' then
	
	process(ClockBus.CLK250MHz, nRST)	-- Every 64 ns
		begin
		if nRST = '0' then
			BusB.en <= '0';
			BusB.addr <= (others =>'0');
			flgB_LE <= '0';
		else
			if rising_edge(ClockBus.CLK250MHz) then
				-- Trigger B
				case triggerB_stm is
					when TRIG_IDLE =>
						--cmdwdo_en_intl <= (others => '0');
						BusB.en <= '0';
						BusB.addr <= (others =>'0');
						BusB.cmd <= (others =>'0');
						TrigInfo_B.trig <= '0';
						TrigInfo_B.last <= '0';
						TrigInfo_B.long <= '0';

						if prevTrigger(1) = '0' and trigger(1)= '1' then
							if prevWdo_LE = '1' and  Timecounter(3) = '0' and flgB_LE = '0' then
								-- Previous Window
								flgB_LE <= '1';
								BusB.cmd <= CMD_WR2_MARKED;
								BusB.addr <= PrevAddr_intl;
								BusB.en <= '1';
							end if;
							TrigInfo_B.trig <= '1';
							triggerB_stm <= TRIG_ENABLED;
						end if;
					when TRIG_ENABLED =>
						BusB.en <= '1';

						-- TE
						if prevTrigger(1) = '1' and trigger(1)= '0' then

							--BusB.cmd
							-- if nextWdo_TE = '1' and  Timecounter(3) = '1' then
							-- 	BusB.cmd <= CMD_WR1_MARKED;
							-- elsif nextWdo_TE = '1' and  Timecounter(3) = '0' then
							-- 	BusB.cmd <= CMD_WR2_MARKED;
							-- elsif nextWdo_TE = '0' and  Timecounter(3) = '0' then
							-- 	BusB.cmd <= CMD_WR1_MARKED;
							-- elsif nextWdo_TE = '0' and  Timecounter(3) = '1' then
							-- 	BusB.cmd <= CMD_WR2_MARKED;
							-- end if;
							if cmd_s = '1' then
								BusB.cmd <= CMD_WR1_MARKED;
							else
								BusB.cmd <= CMD_WR2_MARKED;
							end if;

							--BusB.addr
							if nextWdo_TE = '1' and  Timecounter(3) = '1' then
								BusB.addr <= NextAddr_intl;
							else
								BusB.addr <= WR_ADDR_S;
							end if;

							TrigInfo_B.last <= '1';
							triggerB_stm <= TRIG_IDLE;
							flgB_LE <= '0';
						else -- Middle
							if  Timecounter(3) = '0' then
								BusB.cmd <= CMD_WR1_MARKED;
							else
								BusB.cmd <= CMD_WR2_MARKED;
							end if;

							BusB.addr <= WR_ADDR_S;
							triggerB_stm <= TRIG_ENABLED;
						end if;
					when others =>
				end case;
			end if;
		end if;
	end process;

	-- Process for triggerC_stm
--	process(ClockBus.CLK250MHz, nRST, CtrlBus_IxSL.SWRESET)	-- Every 64 ns
--	begin
--	if nRST = '0' or CtrlBus_IxSL.SWRESET = '0' then
process(ClockBus.CLK250MHz, nRST)	-- Every 64 ns
	begin
	if nRST = '0' then
			BusC.en <= '0';
			BusC.addr <= (others =>'0');
			flgC_LE <= '0';
		else
			if rising_edge(ClockBus.CLK250MHz) then
				-- Trigger C
				case triggerC_stm is
					when TRIG_IDLE =>
						--cmdwdo_en_intl <= (others => '0');
						BusC.en <= '0';
						BusC.addr <= (others =>'0');
						BusC.cmd <= (others =>'0');

						TrigInfo_C.trig <= '0';
						TrigInfo_C.last <= '0';
						TrigInfo_C.long <= '0';

						if prevTrigger(2) = '0' and trigger(2)= '1' then
							if prevWdo_LE = '1' and  Timecounter(3) = '0' and flgC_LE = '0' then
								-- Previous Window
								flgC_LE <= '1';
								BusC.cmd <= CMD_WR2_MARKED;
								BusC.addr <= PrevAddr_intl;
								BusC.en <= '1';

							end if;
							TrigInfo_C.trig <= '1';
							triggerC_stm <= TRIG_ENABLED;
						end if;
					when TRIG_ENABLED =>
						BusC.en <= '1';

						-- TE
						if prevTrigger(2) = '1' and trigger(2)= '0' then

							--BusC.cmd
							-- if nextWdo_TE = '1' and  Timecounter(3) = '1' then
							-- 	BusC.cmd <= CMD_WR1_MARKED;
							-- elsif nextWdo_TE = '1' and  Timecounter(3) = '0' then
							-- 	BusC.cmd <= CMD_WR2_MARKED;
							-- elsif nextWdo_TE = '0' and  Timecounter(3) = '0' then
							-- 	BusC.cmd <= CMD_WR1_MARKED;
							-- elsif nextWdo_TE = '0' and  Timecounter(3) = '1' then
							-- 	BusC.cmd <= CMD_WR2_MARKED;
							-- end if;
							if cmd_s = '1' then
								BusC.cmd <= CMD_WR1_MARKED;
							else
								BusC.cmd <= CMD_WR2_MARKED;
							end if;

							--BusC.addr
							if nextWdo_TE = '1' and  Timecounter(3) = '1' then
								BusC.addr <= NextAddr_intl;
							else
								BusC.addr <= WR_ADDR_S;
							end if;

							TrigInfo_C.last <= '1';
							triggerC_stm <= TRIG_IDLE;
							flgC_LE <= '0';
						else -- Middle
							if  Timecounter(3) = '0' then
								BusC.cmd <= CMD_WR1_MARKED;
							else
								BusC.cmd <= CMD_WR2_MARKED;
							end if;

							BusC.addr <= WR_ADDR_S;
							triggerC_stm <= TRIG_ENABLED;
						end if;
					when others =>
				end case;
			end if;
		end if;
	end process;

	-- Process for triggerD_stm
--	process(ClockBus.CLK250MHz, nRST, CtrlBus_IxSL.SWRESET)	-- Every 64 ns
--	begin
--	if nRST = '0' or CtrlBus_IxSL.SWRESET = '0' then
	
process(ClockBus.CLK250MHz, nRST)	-- Every 64 ns
		begin
		if nRST = '0' then	
			BusD.en <= '0';
			BusD.addr <= (others =>'0');
			flgD_LE <= '0';
		else
			if rising_edge(ClockBus.CLK250MHz) then
				-- Trigger D
				case triggerD_stm is
					when TRIG_IDLE =>
						--cmdwdo_en_intl <= (others => '0');
						BusD.en <= '0';
						BusD.addr <= (others =>'0');
						BusD.cmd <= (others =>'0');
						TrigInfo_D.trig <= '0';
						TrigInfo_D.last <= '0';
						TrigInfo_D.long <= '0';

						if prevTrigger(3) = '0' and trigger(3)= '1' then
							if prevWdo_LE = '1' and  Timecounter(3) = '0' and flgD_LE = '0' then
								flgD_LE <= '1';
								BusD.cmd <= CMD_WR2_MARKED;
								BusD.addr <= PrevAddr_intl;
								BusD.en <= '1';
							end if;
							triggerD_stm <= TRIG_ENABLED;
							TrigInfo_D.trig <= '1';
						end if;
					when TRIG_ENABLED =>
						BusD.en <= '1';

						-- TE
						if prevTrigger(3) = '1' and trigger(3)= '0' then

							--BusD.cmd
							-- if nextWdo_TE = '1' and  Timecounter(3) = '1' then
							-- 	BusD.cmd <= CMD_WR1_MARKED;
							-- elsif nextWdo_TE = '1' and  Timecounter(3) = '0' then
							-- 	BusD.cmd <= CMD_WR2_MARKED;
							-- elsif nextWdo_TE = '0' and  Timecounter(3) = '0' then
							-- 	BusD.cmd <= CMD_WR1_MARKED;
							-- elsif nextWdo_TE = '0' and  Timecounter(3) = '1' then
							-- 	BusD.cmd <= CMD_WR2_MARKED;
							-- end if;
							if cmd_s = '1' then
								BusD.cmd <= CMD_WR1_MARKED;
							else
								BusD.cmd <= CMD_WR2_MARKED;
							end if;

							--BusD.addr
							if nextWdo_TE = '1' and  Timecounter(3) = '1' then
								BusD.addr <= NextAddr_intl;
							else
								BusD.addr <= WR_ADDR_S;
							end if;

							TrigInfo_D.last <= '1';
							triggerD_stm <= TRIG_IDLE;
							flgD_LE <= '0';
						else -- Middle
							if  Timecounter(3) = '0' then
								BusD.cmd <= CMD_WR1_MARKED;
							else
								BusD.cmd <= CMD_WR2_MARKED;
							end if;

							BusD.addr <= WR_ADDR_S;
							triggerD_stm <= TRIG_ENABLED;
						end if;
					when others =>
				end case;
			end if;
		end if;
	end process;

	cmd_s <= nextWdo_TE  xnor  Timecounter(3);

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

end Behavioral;
