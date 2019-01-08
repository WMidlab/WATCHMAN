library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.WindowCPU_PKG.all;
use work.TARGETC_pkg.all;

entity WindowControlV2 is
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

	trigger : 		in std_logic;
	-- Interface to WindowCPU
	cmdbus	:		out std_logic_vector(2 downto 0);
	cmdwdo_en :		out std_logic_vector(NBRWINDOWS-1 downto 0);
	TrigInfo_IN:	out t_triggerinformation;

	WR_RS_S:		out std_logic_vector(1 downto 0);
	WR_CS_S:		out std_logic_vector(5 downto 0);

	CtrlBus_IxSL:		in 	T_CtrlBus_IxSL; --Outputs from Control Master
--	CtrlBus_OxSL:		out T_CtrlBus_OxSL;
	SampleCnt:		out std_logic_vector(3 downto 0);
	CurAddr:		out	std_logic_vector(7 downto 0);
	NextBus_In:		in Bus_t;
	PrevBus_In:		in Bus_t;

    -- FIFO IN for Digiting
    DIG_Full	: out	std_logic;
    DIG_DataIn	: in	std_logic_vector(8 downto 0);
    DIG_WriteEn	: in	std_logic
	);

end WindowControlV2;

architecture Behavioral of WindowControlV2 is

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

	component WindowSelect is

		Port (
		CurAddr :		in std_logic_vector(7 downto 0);

		NextBus_In:		in Bus_t;
		PrevBus_In:		in Bus_t;

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

	signal prevtrigger : std_logic;

	signal PREVBus_intl :		Bus_t;
	signal NEXTBus_intl :		Bus_t;

	signal MarkWindow : std_logic_vector(7 downto 0);
	signal NextMarkWindow : std_logic_vector(7 downto 0);

	signal WR_ADDR_s : std_logic_vector(7 downto 0);
	signal busy_intl : std_logic;
	signal NextAddr_intl : std_logic_vector(7 downto 0);
	signal PrevAddr_intl : std_logic_vector(7 downto 0);

	signal cmdbus_intl : std_logic_vector(2 downto 0);
	signal cmdwdo_en_intl: std_logic_vector(NBRWINDOWS-1 downto 0);

	signal FstWindow512 : std_logic_vector(8 downto 0);
	signal CntWindow512 : std_logic_vector(8 downto 0);

	signal DIG_Empty_intl, STO_ReadEn : std_logic;
	signal DIG_DataOut_intl : std_logic_vector(8 downto 0);

	signal prevWdo_LE: std_logic;
	signal nextWdo_TE: std_logic;
	signal flg_LE: std_logic;
	signal flg_TE: std_logic;
	signal CntPulse : std_logic_vector(7 downto 0);

begin

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
	SampleCnt <= Timecounter(3 downto 0);

	CntTrigPulse : Counter_En
		generic map(
			NBITS => 8
		)
		port map(
			CLK 	=> ClockBus.CLK250MHz,
			RST		=>  nRST,
			EN 		=> trigger,
			Q 		=> CntPulse
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

	WDOSS_Normal : WindowSelect
		Port map (
		CurAddr 	=> WR_ADDR_S,

		NextBus_In	=> NextBus_In,
		PrevBus_In	=> PrevBus_In,

		NextAddr	=> NextAddr_intl,
		PrevAddr	=> PrevAddr_intl
		);

	WDOSS_Search : WindowSelect
		Port map (
		CurAddr 	=> MarkWindow,

		NextBus_In	=> NextBus_In,
		PrevBus_In	=> PrevBus_In,

		NextAddr	=> NextMarkWindow,
		PrevAddr	=> open
		);

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

			cmdbus_intl <= (others => '0');
			cmdwdo_en_intl <= (others => '0');
			busy_intl <= '0';

			flg_LE <= '0';
			flg_TE <= '0';
		else
			if rising_edge(ClockBus.CLK250MHz) then
				-- State Machine for Storing
				cmdwdo_en_intl <= (others => '0');

				prevTrigger <= trigger;

				-- Trigger A
				case trigger_stm is
					when TRIG_IDLE =>
						cmdwdo_en_intl <= (others => '0');

						if prevTrigger = '0' and trigger= '1' then
							if prevWdo_LE = '1' and  Timecounter(3) = '0' and flg_LE = '0' then
								-- Previous Window
								flg_LE <= '1';
								cmdbus_intl <= CMD_WR2_MARKED;
								cmdwdo_en_intl(to_integer(unsigned(PrevAddr_intl))) <= '1';
								trigger_stm <= TRIG_ENABLED;
							else
								 -- no need for previous window
								 trigger_stm <= TRIG_ENABLED;
							end if;
						end if;
					when TRIG_ENABLED =>
						cmdwdo_en_intl <= (others => '0');
						-- TE
						if prevTrigger = '1' and trigger= '0' then
							if nextWdo_TE = '1' and  Timecounter(3) = '1' then
								cmdbus_intl <= CMD_WR1_MARKED;
								cmdwdo_en_intl(to_integer(unsigned(NextAddr_intl))) <= '1';
							end if;
							trigger_stm <= TRIG_IDLE;
							flg_LE <= '0';
							flg_TE <= '0';
						else -- Middle
							if  Timecounter(3) = '0' then
								cmdbus_intl <= CMD_WR1_MARKED;
							else
								cmdbus_intl <= CMD_WR2_MARKED;
							end if;
							cmdwdo_en_intl(to_integer(unsigned(WR_ADDR_S))) <= '1';
							trigger_stm <= TRIG_ENABLED;
						end if;
					when others =>
				end case;

				case storage_stm is
					when IDLE =>
						cmdwdo_en_intl <= (others => '0');
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
						cmdwdo_en_intl <= (others => '0');
						-- Waiting to have the next window
						if NextAddr_intl = FstWindow512(8 downto 1) then
							storage_stm <= MARK_WINDOW;
							MarkWindow <= NextAddr_intl;

							if FstWindow512(0) = '0' then
								case CntWindow512 is
									when "000000000" =>
									when "000000001" =>
										cmdbus_intl <= CMD_WR1_MARKED;
										cmdwdo_en_intl(to_integer(unsigned(NextAddr_intl))) <= '1';
										CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);
									when others =>
										cmdbus_intl <= CMD_BOTH_MARKED;
										cmdwdo_en_intl(to_integer(unsigned(NextAddr_intl))) <= '1';
										CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 2);
								end case;
							else
								case CntWindow512 is
									when "000000000" =>
									when others =>
										cmdbus_intl <= CMD_WR2_MARKED;
										cmdwdo_en_intl(to_integer(unsigned(NextAddr_intl))) <= '1';
										CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);
								end case;
							end if;
							storage_stm <= MARK_WINDOW;
						else
							storage_stm <= EVALUATE;
						end if;

					when MARK_WINDOW =>
						cmdwdo_en_intl <= (others => '0');
						MarkWindow <= NextMarkWindow;

						if to_integer(unsigned(CntWindow512)) /= 0 then
							-- Check if FSTWINDOW is ODD or EVEN
							if FstWindow512(0) = '0' then
								case CntWindow512 is
									when "000000000" =>
									when "000000001" =>
										cmdbus_intl <= CMD_WR1_MARKED;
										cmdwdo_en_intl(to_integer(unsigned(NextMarkWindow))) <= '1';
										CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);
									when others =>
										cmdbus_intl <= CMD_BOTH_MARKED;
										cmdwdo_en_intl(to_integer(unsigned(NextMarkWindow))) <= '1';
										CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 2);
								end case;
							else
								case CntWindow512 is
									when "000000000" =>
									when "000000001" =>
										cmdbus_intl <= CMD_WR1_MARKED;
										cmdwdo_en_intl(to_integer(unsigned(NextMarkWindow))) <= '1';
										CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);
									when others =>
										cmdbus_intl <= CMD_BOTH_MARKED;
										cmdwdo_en_intl(to_integer(unsigned(NextMarkWindow))) <= '1';
										CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 2);
								end case;
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

							cmdwdo_en_intl(to_integer(unsigned(DIG_DataOut_intl(8 downto 1)))) <= '1';
							if DIG_DataOut_intl(0) = '0' then
								cmdbus_intl <= CMD_WR1_EN_DIS;
							else
								cmdbus_intl <= CMD_WR2_EN_DIS;
							end if;

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


	-- OUTPUT
	cmdbus <= cmdbus_intl;
	cmdwdo_en <= cmdwdo_en_intl;

end Behavioral;
