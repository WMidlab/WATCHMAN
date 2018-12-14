library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity TB_WindowCPU_Trigger is
end TB_WindowCPU_Trigger;

architecture implementation of TB_WindowCPU_Trigger is

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

	component WindowCPU is
		generic(
			ADDRESS : integer := 0
		);
		Port (
		nrst : 			in	std_Logic;

		CLK:			in 	std_logic;

		cmd :			in 	std_logic_vector(2 downto 0);
		cmd_en:			in 	std_logic;

		valid_o:		out std_logic;
		wr1_en :		out std_logic;
		wr2_en :		out std_logic;
		triginfo:		out std_logic_vector(11 downto 0);

		CurAddr :		in std_logic_vector(7 downto 0);
		PREVBus_IN :	in	std_logic_vector(7 downto 0);
		PREVBus_OUT :	out	std_logic_vector(7 downto 0);
		NEXTBus_IN :	in	std_logic_vector(7 downto 0);
		NEXTBus_OUT :	out	std_logic_vector(7 downto 0);
		
		--Trigger Part
		SampleCnt :		in std_logic_vector(3 downto 0);
		trigger :		in std_logic_vector(3 downto 0);
	
		PREVWDO_IN :	in	std_logic;
		PREVWDO_OUT :	out	std_logic;
		NEXTWDO_IN :	in	std_logic;
		NEXTWDO_OUT :	out	std_logic
		);

	end component WindowCPU;

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
	SampleCnt:		out std_logic_vector(3 downto 0);
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
	signal PREVWDO_intl : std_logic_vector(15 downto 0);
	signal NEXTWDO_intl : std_logic_vector(15 downto 0);
	
	signal SampleCnt_intl : std_logic_vector(3 downto 0);
	signal CurWindowCnt :	std_logic_vector(7 downto 0);
	signal NextWindowCnt:	std_logic_vector(7 downto 0);
	signal PrevWindowCnt:	std_logic_vector(7 downto 0);

	signal CtrlBus_IxSL_intl : T_CtrlBus_OxMS_Intl;

	signal RDAD_READEn_sti : std_logic;
	signal RDAD_DataOut_obs : std_logic_vector(100+5 downto 0);
	signal empty_obs:	std_logic;

	signal DIG_DataIn_sti : std_logic_vector(8 downto 0);
	signal DIG_WriteEn_sti : std_logic;

	signal trigger_sti : std_logic_vector(3 downto 0);
	
	signal triginfo_intl : TrigInfoBus_t;
	
    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';


	constant CLK_PERIOD : time := 4 ns;
	constant CLK100MHz_PERIOD	: time := 10 ns;

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

	GEN_CPU : for I in 1 to 14 generate
		CPUX : WindowCPU
			generic map(
				ADDRESS => I
			)
			Port map(
			nrst			=> nrst,
			CLK				=> ClockBus_intl.CLK250MHz,

			cmd 			=> cmd_sti,
			cmd_en			=> cmd_en(I),

			valid_o 		=> valid(I),
			wr1_en 			=> wr1_en(I),
			wr2_en			=> wr2_en(I),
			triginfo		=> triginfo_intl(I),

			CurAddr			=> CurWindowCnt,
			PREVBus_IN => PREVBus_intl(I),
			PREVBus_OUT =>  PREVBus_intl(I+1),
			NEXTBus_IN 	=> NEXTBus_intl(I),
			NEXTBus_OUT => NEXTBus_intl(I-1),
			
			--Trigger Part
			SampleCnt 	=> SampleCnt_intl,
			trigger 	=> trigger_sti,
	
			PREVWDO_IN 	=> PREVWDO_intl(I),
			PREVWDO_OUT => PREVWDO_intl(I-1),
			NEXTWDO_IN	=> NEXTWDO_intl(I),
			NEXTWDO_OUT	=> NEXTWDO_intl(I+1)
			);
	end generate;

	CPU0 : WindowCPU
		generic map(
			ADDRESS => 0
		)
		Port map(
		nrst			=> nrst,
		CLK				=> ClockBus_intl.CLK250MHz,

		cmd 			=> cmd_sti,
		cmd_en			=> cmd_en(0),

		valid_o 		=> valid(0),
		wr1_en 			=> wr1_en(0),
		wr2_en			=> wr2_en(0),
		triginfo		=> triginfo_intl(0),
		
		CurAddr			=> CurWindowCnt,

		PREVBus_IN => PREVBus_intl(0),
		PREVBus_OUT =>  PREVBus_intl(1),
		NEXTBus_IN 	=> NEXTBus_intl(0),
		NEXTBus_OUT => NEXTBus_intl(15),
		
		--Trigger Part
		SampleCnt 	=> SampleCnt_intl,
		trigger 	=> trigger_sti,

		PREVWDO_IN 	=> PREVWDO_intl(0),
		PREVWDO_OUT => PREVWDO_intl(15),
		NEXTWDO_IN	=> NEXTWDO_intl(0),
		NEXTWDO_OUT	=> NEXTWDO_intl(1)
		);

	CPU15 : WindowCPU
		generic map(
			ADDRESS => 15
		)
		Port map(
		nrst			=> nrst,
		CLK				=> ClockBus_intl.CLK250MHz,

		cmd 			=> cmd_sti,
		cmd_en			=> cmd_en(15),

		valid_o 		=> valid(15),
		wr1_en 			=> wr1_en(15),
		wr2_en			=> wr2_en(15),
		triginfo		=> triginfo_intl(15),

		CurAddr			=> CurWindowCnt,
		PREVBus_IN => PREVBus_intl(15),
		PREVBus_OUT =>  PREVBus_intl(0),
		NEXTBus_IN 	=> NEXTBus_intl(15),
		NEXTBus_OUT => NEXTBus_intl(14),
		
		--Trigger Part
		SampleCnt 	=> SampleCnt_intl,
		trigger 	=> trigger_sti,

		PREVWDO_IN 	=> PREVWDO_intl(15),
		PREVWDO_OUT => PREVWDO_intl(14),
		NEXTWDO_IN	=> NEXTWDO_intl(15),
		NEXTWDO_OUT	=> NEXTWDO_intl(0)		
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
		SampleCnt		=> SampleCnt_intl,
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
--		triginfo	=> triginfo_intl,
		-- FIFO out for Reading RDAD
		RDAD_ReadEn  => RDAD_ReadEn_sti,
		RDAD_DataOut => RDAD_DataOut_obs,
		RDAD_Empty	=> empty_obs
		);


	-- Clock generation
    clock_generator(clk,simulation_end_s, CLK_PERIOD);
	clock_generator(Refclk,simulation_end_s, CLK100MHz_PERIOD);


	tb : process
		variable test : integer	:= 0;
	begin
		simulation_end_s <= '0';
		nrst <= '0';
		trigger_sti <= (others => '0');
		CtrlBus_IxSL_intl.SWRESET <= '1';
		RDAD_READEn_sti <= '0';
		CtrlBus_IxSL_intl.WindowStorage <= '0';
		wait for 10 us;
		nrst <= '1';
		wait for 10 us;

		report "Start CMD : WINDOW 10 NBR 1";
		wait until rising_edge(ClockBus_intl.CLK250MHz);
		CtrlBus_IxSL_intl.WindowStorage <= '0';
		CtrlBus_IxSL_intl.FSTWINDOW <= x"0000000A";
		CtrlBus_IxSL_intl.NBRWINDOW <= x"00000001";
		wait until rising_edge(ClockBus_intl.CLK250MHz);
		CtrlBus_IxSL_intl.WindowStorage <= '1';
		wait for 1 us;
		CtrlBus_IxSL_intl.WindowStorage <= '0';
		--cmd_en(5) <= '0';
		wait until empty_obs = '0';
		wait for 2 us ;
		wait until rising_Edge(ClockBus_intl.RDAD_CLK);
		RDAD_ReadEn_sti <= '1';
		wait until rising_Edge(ClockBus_intl.RDAD_CLK);
		RDAD_READEn_sti <= '0';
		wait until rising_Edge(ClockBus_intl.RDAD_CLK);

		report "RDAD_DataOut_obs: " & integer'image(to_integer(unsigned(RDAD_DataOut_obs)));
		report "Time WDO :" & integer'image(to_integer(unsigned(RDAD_DataOut_obs(63 downto 0))));
		report "WR_ADDR :" & integer'image(to_integer(unsigned(RDAD_DataOut_obs(66+5 downto 64))));
		report "WR1 :" & std_logic'image(RDAD_DataOut_obs(67+5));
		report "WR2 :" & std_logic'image(RDAD_DataOut_obs(68+5));

		wait for 1 us;



		wait for 10 us;

		wait for 1 us ;
		report "Start CMD : WINDOW 4 NBR 1";
		wait until rising_edge(ClockBus_intl.CLK250MHz);
		CtrlBus_IxSL_intl.WindowStorage <= '0';
		CtrlBus_IxSL_intl.FSTWINDOW <= x"00000004";
		CtrlBus_IxSL_intl.NBRWINDOW <= x"00000003";
		wait until rising_edge(ClockBus_intl.CLK250MHz);
		CtrlBus_IxSL_intl.WindowStorage <= '1';
		wait for 1 us;
		CtrlBus_IxSL_intl.WindowStorage <= '0';
		if RDAD_DataOut_obs(67+5) = '0' then
			DIG_DataIn_sti	<= RDAD_DataOut_obs(66+5 downto 64) & '0';
		else
			DIG_DataIn_sti	<= RDAD_DataOut_obs(66+5 downto 64) & '1';
		end if;

   		wait until rising_Edge(ClockBus_intl.WL_CLK);
    	DIG_WriteEn_sti	<= '1';
    	wait until rising_Edge(ClockBus_intl.WL_CLK);
    	DIG_WriteEn_sti	<= '0';
		--cmd_en(5) <= '0';
		wait until empty_obs = '0';
		for I in 0 to 1 loop
			wait for 2 us ;
			wait until rising_Edge(ClockBus_intl.RDAD_CLK);
			RDAD_ReadEn_sti <= '1';
			wait until rising_Edge(ClockBus_intl.RDAD_CLK);
			RDAD_READEn_sti <= '0';
			wait until rising_Edge(ClockBus_intl.RDAD_CLK);

			report "RDAD_DataOut_obs: " & integer'image(to_integer(unsigned(RDAD_DataOut_obs)));
			report "Time WDO :" & integer'image(to_integer(unsigned(RDAD_DataOut_obs(63 downto 0))));
			report "WR_ADDR :" & integer'image(to_integer(unsigned(RDAD_DataOut_obs(66+5 downto 64))));
			report "WR1 :" & std_logic'image(RDAD_DataOut_obs(67+5));
			report "WR2 :" & std_logic'image(RDAD_DataOut_obs(68+5));

		end loop;
		
		wait for 5 us;
		report "Starting Trigger";
		
		wait until timecounter_intl(3 downto 0) = x"0";
		trigger_sti <= "0001" after 1 ns;
		wait for 4 ns;
		trigger_sti <= "0000" after 1 ns;
		
    	wait;
	end process;

end implementation;
