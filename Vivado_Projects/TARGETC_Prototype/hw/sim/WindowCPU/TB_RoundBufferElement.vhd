library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg_old.all;
use std.textio.all;

entity TB_RoundBufferElement is
end TB_RoundBufferElement;

architecture implementation of TB_RoundBufferElement is

	component TC_ClockManagementV2 is
	port (
	-- TARGET C Ports for control and function
		nrst:			in	std_logic;
		clk1:			in 	std_logic;	-- Clock for the TARGETC SCLK
		clk2:			in 	std_logic;	-- Clock for the TARGETC SCLK

		WL_CLK_DIV:		in 	std_logic_vector(31 downto 0); -- Clock Divider Through DFF

		PLL_LOCKED:		out	std_logic;

		ClockBus:		out T_ClockBus;

		Timecounter:	out std_logic_vector(63 downto 0);

		HSCLKdif:		in std_logic;		-- Pin#43 to Pin#44

		-- LVDS Differential Pair
		HSCLK_P:		out std_logic;		-- Pin#43
		HSCLK_N:		out std_logic;		-- Pin#44

		WL_CLK_P:		out std_logic;		-- Pin#57
		WL_CLK_N:		out std_logic;		-- Pin#58

		SSTIN_P:		out std_logic;		-- Pin#125
		SSTIN_N:		out std_logic		-- Pin#126

	);
	end component TC_ClockManagementV2;

	component RoundBufferElement is
			Generic (
				ADDRESS : integer := 0;
				MIN_LE_TIME : integer := 3;
				MIN_TE_TIME : integer := 1; -- 4 ns after falling of trigger
				MAX_LONGPULSE : integer := 16
			);
			port (

			nrst : 			in	std_Logic;
			--	SSTIN:			in std_logic;
			CLK:			in 	std_logic;

			Scnt:			in	std_logic_vector(3 downto 0);

			trigger:		in	std_logic_vector(3 downto 0);

			--Window Part
			cmd :			in 	std_logic_vector(2 downto 0);
			cmd_en:			in 	std_logic;

			wr1_en :		out std_logic;
			wr2_en :		out	std_logic;
			valid_o	:		out std_logic;
			TrigInfo_OUT:	out std_logic_vector(11 downto 0);

			-- CPU
			CurAddr:		in 	std_logic_vector(7 downto 0);
			PREVBus_IN :	in	std_logic_vector(7 downto 0);
			PREVBus_OUT :	out	std_logic_vector(7 downto 0);
			NEXTBus_IN :	in	std_logic_vector(7 downto 0);
			NEXTBus_OUT :	out	std_logic_vector(7 downto 0);

			-- Next Side
			nexttrigger :	out	std_logic_vector(3 downto 0);
			NEXTWDO_OUT:	out	std_logic_vector(3 downto 0);
			PREVWDO_IN :	in	std_logic_vector(3 downto 0);

			-- Previous Side
			prevtrigger :	in	std_logic_vector(3 downto 0);
			PREVWDO_OUT:	out	std_logic_vector(3 downto 0);
			NEXTWDO_IN 	:	in	std_logic_vector(3 downto 0)
			);
	end component RoundBufferElement;

	component WindowSelect is

		Port (
		CurAddr :		in std_logic_vector(7 downto 0);

		NextBus_In:		in Bus_t;
		PrevBus_In:		in Bus_t;

		NextAddr:		out std_logic_vector(7 downto 0);
		PrevAddr:		out std_logic_vector(7 downto 0)
		);
	end component WindowSelect;

	component WindowStore is
		Generic(
			NBRWINDOWS : integer := 16
		);
		Port (
		nrst : 			in	std_Logic;

		ClockBus:		in T_ClockBus;
		Timecounter:	in std_logic_vector(63 downto 0);

		-- Normal Operation

		valid:		in std_logic_vector(NBRWINDOWS-1 downto 0);
		wr1_en:		in std_logic_vector(NBRWINDOWS-1 downto 0);
		Wr2_en:		in std_logic_vector(NBRWINDOWS-1 downto 0);

		--triginfo:	in TrigInfoBus_t(NBRWINDOWS-1 downto 0);

		-- FIFO out for Reading RDAD
		RDAD_ReadEn  :in  std_logic;
		RDAD_DataOut : out std_logic_vector(100+5 downto 0);
		RDAD_Empty	: out std_logic
		);

	end component;

	component WindowControl is
	Generic(
		NBRWINDOWS : integer := 16
	);
	Port (
	nrst : 			in	STD_Logic;

	ClockBus:		in T_ClockBus;
	Timecounter:	in std_logic_vector(63 downto 0);

	-- Interface to WindowCPU
	cmdbus	:		out std_logic_vector(2 downto 0);
	cmdwdo_en :		out std_logic_vector(NBRWINDOWS-1 downto 0);

	WR_RS_S:		out std_logic_vector(1 downto 0);
	WR_CS_S:		out std_logic_vector(5 downto 0);

	CtrlBus_IxSL:		in 	T_CtrlBus_IxSL; --Outputs from Control Master
	--	CtrlBus_OxSL:		out T_CtrlBus_OxSL;

	CurAddr:		out	std_logic_vector(7 downto 0);
	NextBus_In:		in Bus_t;
	PrevBus_In:		in Bus_t;

	-- FIFO IN for Digiting
	DIG_Full	: out	std_logic;
	DIG_DataIn	: in	std_logic_vector(8 downto 0);
	DIG_WriteEn	: in	std_logic
	);
	end component;
	-- -------------------------------------------------------------
	-- SIGNALS
	-- -------------------------------------------------------------

	signal nrst :  std_logic;
	signal clk      : std_logic;
	signal RefCLK :	std_logic;
	signal clockbus_intl: T_ClockBus;
	signal timecounter_intl : std_logic_vector(63 downto 0);

	signal cmd_sti :			std_logic_vector(2 downto 0);
	signal cmd_en:				std_logic_vector(15 downto 0);

	signal valid :				std_logic_vector(15 downto 0);
	signal response :			std_logic_vector(15 downto 0);
	signal wr1_en :				std_logic_vector(15 downto 0);
	signal wr2_en :				std_logic_vector(15 downto 0);

	signal prevwr1_en_intl :	std_logic;
	signal prevwr2_en_intl :	std_logic;

	signal PREVBus_intl :		Bus_t;
	signal NEXTBus_intl :		Bus_t;

	signal scnt_intl : std_logic_vector(3 downto 0);

	signal CurWindowCnt :	std_logic_vector(7 downto 0);
	signal NextWindowCnt:	std_logic_vector(7 downto 0);
	signal PrevWindowCnt:	std_logic_vector(7 downto 0);

	signal CtrlBus_IxSL_intl : T_CtrlBus_OxMS_Intl;

	signal RDAD_READEn_sti : std_logic;
	signal RDAD_DataOut_obs : std_logic_vector(100+5 downto 0);
	signal empty_obs:	std_logic;

	signal DIG_DataIn_sti : std_logic_vector(8 downto 0);
	signal DIG_WriteEn_sti : std_logic;

	type T_TriggerBusArray is array (15 downto 0) of std_logic_vector(3 downto 0);
	signal triggerbus : T_TriggerBusArray;
	signal NEXTTRIGBus : T_TriggerBusArray;
	signal PREVTRIGBus : T_TriggerBusArray;

	--signal 	triginfo_intl:	TrigInfoBus_t(16-1 downto 0);


	signal trigger_sti : std_logic_vector(3 downto 0);
	signal TrigInfo_OUT_obs : std_logic_vector(11 downto 0);

	-- Signals for simulation
    signal simulation_end_s : std_logic := '0';


	constant CLK_PERIOD : time := 4 ns;
	constant CLK100MHz_PERIOD	: time := 10 ns;

	--Variable for TB
	file fd : text open WRITE_MODE is "/home/jonathan/VivadoProjects/00_WATCHMANN/TARGETC_Prototype/hw/sim/00_Reports/TB_RoundBufferElement_REPORT.txt";

begin

	TC_ClockMgmt_inst : TC_ClockManagementV2
	port map(
		nrst				=> nrst,
		clk1		 		=> RefCLK,
		clk2		 		=> RefCLK,
		WL_CLK_DIV 		=> (others =>'0'),
		PLL_LOCKED		=> open,
		--PLL_LOCKED		=> Test,

		ClockBus	=> ClockBus_intl,

		timecounter		=> timecounter_intl,

		HSCLKdif		=> '0',
		-- LVDS Differential Pair
		HSCLK_P 		=> open,
		HSCLK_N 		=> open,

		WL_CLK_P 		=> open,
		WL_CLK_N 		=> open,

		SSTIN_P 		=> open,
		SSTIN_N 		=> open
	);

	Scnt_intl <= timecounter_intl(3 downto 0);

	RB_Ele_0 : RoundBufferElement
		Generic map(
			ADDRESS => 0,
			MIN_LE_TIME => 3,
			MIN_TE_TIME => 1, -- 4 ns after falling of trigger
			MAX_LONGPULSE => 16
		)
		port map(
		nrst			=> nrst,
		CLK				=> ClockBus_intl.CLK250MHz,
		cmd 			=> cmd_sti,
		cmd_en			=> cmd_en(0),
		valid_o 		=> valid(0),
		wr1_en 			=> wr1_en(0),
		wr2_en			=> wr2_en(0),
		Scnt			=> Scnt_intl,
		trigger			=> trigger_sti,
				--TrigInfo_OUT	=> triginfo_intl(0)
				
		TrigInfo_OUT	=> open,
		CurAddr			=> CurWindowCnt,

		PREVBus_IN 		=> PREVBus_intl(0),
		PREVBus_OUT 	=> PREVBus_intl(1),
		NEXTBus_IN 		=> NEXTBus_intl(0),
		NEXTBus_OUT 	=> NEXTBus_intl(15),

		-- Next Side
		nexttrigger 	=> triggerbus(0),
		NEXTWDO_OUT		=> NEXTTRIGBus(0),
		PREVWDO_IN 		=> PREVTRIGBus(0),

		-- Previous Side
		prevtrigger 	=> triggerbus(15),
		PREVWDO_OUT		=> PREVTRIGBus(15),
		NEXTWDO_IN 		=> NEXTTRIGBus(15)
		);

	GEN_Ele : for I in 1 to 14 generate
		RB_Ele_X : RoundBufferElement
			Generic map(
				ADDRESS => I,
				MIN_LE_TIME => 3,
				MIN_TE_TIME => 1, -- 4 ns after falling of trigger
				MAX_LONGPULSE => 16
			)
			port map(
			nrst			=> nrst,
			CLK				=> ClockBus_intl.CLK250MHz,
			cmd 			=> cmd_sti,
			cmd_en			=> cmd_en(I),
			valid_o 		=> valid(I),
			wr1_en 			=> wr1_en(I),
			wr2_en			=> wr2_en(I),
			Scnt			=> Scnt_intl,
			trigger			=> trigger_sti,
			--TrigInfo_OUT	=> triginfo_intl(I),
			TrigInfo_OUT	=> open,
			CurAddr			=> CurWindowCnt,

			PREVBus_IN 		=> PREVBus_intl(I),
			PREVBus_OUT 	=> PREVBus_intl(I+1),
			NEXTBus_IN 		=> NEXTBus_intl(I),
			NEXTBus_OUT 	=> NEXTBus_intl(I-1),

			-- Next Side
			nexttrigger 	=> triggerbus(I),
			NEXTWDO_OUT		=> NEXTTRIGBus(I),
			PREVWDO_IN 		=> PREVTRIGBus(I),

			-- Previous Side
			prevtrigger 	=> triggerbus(I-1),
			PREVWDO_OUT		=> PREVTRIGBus(I-1),
			NEXTWDO_IN 		=> NEXTTRIGBus(I-1)
			);
	end generate;

	RB_Ele_15 : RoundBufferElement
		Generic map(
			ADDRESS => 15,
			MIN_LE_TIME => 3,
			MIN_TE_TIME => 1, -- 4 ns after falling of trigger
			MAX_LONGPULSE => 16
		)
		port map(
		nrst			=> nrst,
		CLK				=> ClockBus_intl.CLK250MHz,
		cmd 			=> cmd_sti,
		cmd_en			=> cmd_en(15),
		valid_o 		=> valid(15),
		wr1_en 			=> wr1_en(15),
		wr2_en			=> wr2_en(15),
		Scnt			=> Scnt_intl,
		trigger			=> trigger_sti,
		--TrigInfo_OUT	=> triginfo_intl(15),
		TrigInfo_OUT	=> open,
		CurAddr			=> CurWindowCnt,
		PREVBus_IN => PREVBus_intl(15),
		PREVBus_OUT =>  PREVBus_intl(0),
		NEXTBus_IN 	=> NEXTBus_intl(15),
		NEXTBus_OUT => NEXTBus_intl(14),

		-- Next Side
		nexttrigger 	=> triggerbus(15),
		NEXTWDO_OUT		=> NEXTTRIGBus(15),
		PREVWDO_IN 		=> PREVTRIGBus(15),

		-- Previous Side
		prevtrigger 	=> triggerbus(14),
		PREVWDO_OUT		=> PREVTRIGBus(14),
		NEXTWDO_IN 		=> NEXTTRIGBus(14)
		);

	WDOCONTROL : WindowControl
		Port map (
		nrst			=> nrst,
		ClockBus		=> ClockBus_intl,
		timecounter		=> timecounter_intl,

		-- Interface to WindowCPU
		cmdbus			=> cmd_sti,
		cmdwdo_en		=> cmd_en,

		WR_RS_S			=> open,
		WR_CS_S			=> open,

		CtrlBus_IxSL => CtrlBus_IxSL_intl,

		CurAddr			=> CurWindowCnt,
--		NextAddr		=> NextWindowCnt,
--		PrevAddr		=> PrevWindowCnt,
		NextBus_In	=> NEXTBus_intl,
		PrevBus_In	=> PREVBus_intl,

		-- FIFO IN for Digiting
		DIG_Full		=> open,
		DIG_DataIn		=> DIG_DataIn_sti,
		DIG_WriteEn		=> DIG_WriteEn_sti
		);

	WDOSTORE : WindowStore
		Generic map(
		NBRWINDOWS => 16
		)
		Port map(
		nrst			=> nrst,

		ClockBus	=> ClockBus_intl,
		timecounter		=> timecounter_intl,

		-- Normal Operation
		valid		=> valid,
		wr1_en		=> wr1_en,
		Wr2_en		=> wr2_en,

		--TrigInfo 	=> triginfo_intl,
		--TrigInfo	=> (others => (others => '0')),
		-- FIFO out for Reading RDAD
		RDAD_ReadEn  => RDAD_ReadEn_sti,
		RDAD_DataOut => RDAD_DataOut_obs,
		RDAD_Empty	=> empty_obs
		);


	-- Clock generation
    clock_generator(clk,simulation_end_s, CLK_PERIOD);
	clock_generator(Refclk,simulation_end_s, CLK100MHz_PERIOD);

	RDADRead : Process
		variable L : Line;
	begin
		RDAD_READEn_sti <= '0';
		wait until nrst = '1';
		loop
			--wait until empty_obs = '0';
			if empty_obs = '0' then
				wait for 2 us ;
				wait until rising_Edge(ClockBus_intl.RDAD_CLK);
				RDAD_ReadEn_sti <= '1';
				wait until rising_Edge(ClockBus_intl.RDAD_CLK);
				RDAD_READEn_sti <= '0';
				wait until rising_Edge(ClockBus_intl.RDAD_CLK);

				WRITE(L,string'("RDAD_DataOut_obs: " & integer'image(to_integer(unsigned(RDAD_DataOut_obs))) & CR));
				WRITE(L,string'("Time WDO: " &  integer'image(to_integer(unsigned(RDAD_DataOut_obs(63 downto 0)))) & CR));
				WRITE(L,string'("WR_ADDR: " & integer'image(to_integer(unsigned(RDAD_DataOut_obs(66+5 downto 64)))) & CR));
				WRITE(L,string'("WR1: " & std_logic'image(RDAD_DataOut_obs(67+5)) & CR));
				WRITE(L,string'("WR2: " & std_logic'image(RDAD_DataOut_obs(68+5)) & CR));
				WRITE(L,string'(" " & CR));

				WRITELINE(fd,L);
			end if;
			wait for 2 us;
		end loop;
	end process;

	tb : process
		variable test : integer	:= 0;
	begin
		simulation_end_s <= '0';
		nrst <= '0';
		--CtrlBus_IxSL_intl.SWRESET <= '1';
		trigger_sti <= "0000";
		CtrlBus_IxSL_intl.WindowStorage <= '0';
		wait for 10 us;
		nrst <= '1';
		wait for 10 us;
		wait for 13 * 64 ns;
		wait for 32 ns;

		report "Trigger Test";
		wait until rising_edge(ClockBus_intl.CLK250MHz);
		trigger_sti <= "0001" after 1 ns;
		wait for 16*3 ns; -- Trigger long of 4 * 4 ns
		trigger_sti <= "0000" after 1 ns;

		wait;

	end process;

end implementation;
