library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg_old.all;
use std.textio.all;

entity TB_RoundBuffer_OLD is
end TB_RoundBuffer_OLD;

architecture implementation of TB_RoundBuffer_OLD is
	component TC_ClockManagementV3 is
	port (
	-- TARGET C Ports for control and function
		nrst:			in	std_logic;
		clk1:			in 	std_logic;	-- Clock for the TARGETC SCLK
		clk2:			in 	std_logic;	-- Clock for the TARGETC SCLK
		AXI_CLK:		in	std_logic;

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
	end component TC_ClockManagementV3;

	component RoundBuffer is
	generic(
		NBRWINDOWS : integer := 16
	);
	port(
		nrst : 			in	std_Logic;
		ClockBus:		in T_ClockBus;
		Timecounter:	in std_logic_vector(63 downto 0);

		trigger : 		in std_logic_vector(3 downto 0);

		WR_RS_S:		out std_logic_vector(1 downto 0);
		WR_CS_S:		out std_logic_vector(5 downto 0);

		CtrlBus_IxSL:		in 	T_CtrlBus_IxSL; --Outputs from Control Master

		RDAD_ReadEn  :in  std_logic;
		RDAD_DataOut : out std_logic_vector(100+5 downto 0);
		RDAD_Empty	: out std_logic;

		-- FIFO IN for Digiting
	    DIG_Full	: out	std_logic;
	    DIG_DataIn	: in	std_logic_vector(8 downto 0);
	    DIG_WriteEn	: in	std_logic

	);
	end component RoundBuffer;

	-- -------------------------------------------------------------
	-- Constant
	-- -------------------------------------------------------------
	constant NBRWINDOWS : integer := 256;

	-- -------------------------------------------------------------
	-- SIGNALS
	-- -------------------------------------------------------------

	signal nrst :  std_logic;
	signal Refclk     : std_logic;

	signal trigger_sti : std_logic_vector(3 downto 0);
    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';

	signal 	triginfo_intl:	t_triginfobus(NBRWINDOWS-1 downto 0);

	signal CtrlBus_IxSL_intl : T_CtrlBus_OxMS_Intl;

	signal RDAD_READEn_sti : std_logic;
	signal RDAD_DataOut_obs : std_logic_vector(100+5 downto 0);
	signal RDAD_Empty_obs:	std_logic;

	signal DIG_Full_obs:	std_logic;
	signal DIG_DataIn_sti : std_logic_vector(8 downto 0);
	signal DIG_WriteEn_sti : std_logic;

	constant CLK100MHz_PERIOD	: time := 10 ns;

	signal ClockBus_intl:		T_ClockBus;
	signal timecounter_intl : std_logic_vector(63 downto 0);

	--Variable for TB
	file fd : text open WRITE_MODE is "/home/jonathan/VivadoProjects/00_WATCHMANN/TARGETC_Prototype/hw/sim/00_Reports/TB_RoundBufferElement_REPORT.txt";

begin

	TC_ClockMgmt_inst : TC_ClockManagementV3
	port map(
		nrst				=> CtrlBus_IxSL_intl.SW_nRST,
		clk1		 		=> RefCLK,
		clk2		 		=> RefCLK,
		axi_clk				=> RefCLK,

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

	TC_RoundBuffer : RoundBuffer
		generic map(
			NBRWINDOWS => NBRWINDOWS
		)
		port map(
			nrst 		=> nrst,
			ClockBus	=> 	ClockBus_intl,
			Timecounter	=> timecounter_intl,

			trigger		=> trigger_sti,

			WR_RS_S		=> open,
			WR_CS_S		=> open,

			CtrlBus_IxSL=> CtrlBus_IxSL_intl,

			RDAD_ReadEn  => RDAD_ReadEn_sti,
			RDAD_DataOut => RDAD_DataOut_obs,
			RDAD_Empty	=> RDAD_Empty_obs,

			-- FIFO IN for Digiting
		    DIG_Full	=> DIG_Full_obs,
		    DIG_DataIn	=> DIG_DataIn_sti,
		    DIG_WriteEn	=> DIG_WriteEn_sti

		);

	-- Clock generation
	clock_generator(Refclk,simulation_end_s, CLK100MHz_PERIOD);

	RDADRead : Process
		variable L : Line;
	begin
		RDAD_READEn_sti <= '0';
		wait until nrst = '1';
		loop
			--wait until empty_obs = '0';
			if RDAD_Empty_obs = '0' then

				wait until rising_Edge(ClockBus_intl.RDAD_CLK);
				RDAD_ReadEn_sti <= '1';
				wait until rising_Edge(ClockBus_intl.RDAD_CLK);
				RDAD_READEn_sti <= '0';
				wait until rising_Edge(ClockBus_intl.RDAD_CLK);

--	Data_in_intl(63 downto 0)		<= prev_TimeCounter;
--	Data_in_intl(71 downto 64)	<= windowstore;
--	Data_in_intl(72)				<= wr1_en(to_integer(unsigned(windowstore)));
--	Data_in_intl(73)				<= wr2_en(to_integer(unsigned(windowstore)));
--	Data_in_intl(85 downto 74)	<= (others => '0');


				 WRITE(L,string'("RDAD_DataOut_obs: " & integer'image(to_integer(unsigned(RDAD_DataOut_obs))) & CR));
				WRITE(L,string'("Time WDO: " &  integer'image(to_integer(unsigned(RDAD_DataOut_obs(63 downto 0)))) & CR));
				WRITE(L,string'("WR_ADDR: " & integer'image(to_integer(unsigned(RDAD_DataOut_obs(71 downto 64)))) & CR));
				WRITE(L,string'("WR1: " & std_logic'image(RDAD_DataOut_obs(72)) & CR));
				WRITE(L,string'("WR2: " & std_logic'image(RDAD_DataOut_obs(73)) & CR));
				--
				-- WRITE(L,string'("Trig Long: " & integer'image(to_integer(unsigned(RDAD_DataOut_obs(85 downto 82)))) & CR));
				-- WRITE(L,string'("Trig Last: " & integer'image(to_integer(unsigned(RDAD_DataOut_obs(81 downto 78)))) & CR));
				-- WRITE(L,string'("Trig : " & integer'image(to_integer(unsigned(RDAD_DataOut_obs(77 downto 74)))) & CR));
				-- WRITE(L,string'(" " & CR));

				WRITELINE(fd,L);

				wait for 1 ns;
				--DIG back Process
				DIG_WriteEn_sti <= '0';
				if RDAD_DataOut_obs(73 downto 72) = "00" then
					DIG_DataIn_sti	<= RDAD_DataOut_obs(71 downto 64) & '0';
					wait until rising_Edge(ClockBus_intl.WL_CLK);
					DIG_WriteEn_sti <= '1';
					wait until rising_Edge(ClockBus_intl.WL_CLK);
					DIG_WriteEn_sti <= '0';
					wait until rising_Edge(ClockBus_intl.WL_CLK);

					wait for 1 us;

					DIG_DataIn_sti	<= RDAD_DataOut_obs(71 downto 64) & '1';
					wait until rising_Edge(ClockBus_intl.WL_CLK);
					DIG_WriteEn_sti <= '1';
					wait until rising_Edge(ClockBus_intl.WL_CLK);
					DIG_WriteEn_sti <= '0';
					wait until rising_Edge(ClockBus_intl.WL_CLK);

				elsif  RDAD_DataOut_obs(73 downto 72) = "01" then
					DIG_DataIn_sti	<= RDAD_DataOut_obs(71 downto 64) & '1';
					wait until rising_Edge(ClockBus_intl.WL_CLK);
					DIG_WriteEn_sti <= '1';
					wait until rising_Edge(ClockBus_intl.WL_CLK);
					DIG_WriteEn_sti <= '0';
					wait until rising_Edge(ClockBus_intl.WL_CLK);

				elsif  RDAD_DataOut_obs(73 downto 72) = "10" then
					DIG_DataIn_sti	<= RDAD_DataOut_obs(71 downto 64) & '0';
					wait until rising_Edge(ClockBus_intl.WL_CLK);
					DIG_WriteEn_sti <= '1';
					wait until rising_Edge(ClockBus_intl.WL_CLK);
					DIG_WriteEn_sti <= '0';
					wait until rising_Edge(ClockBus_intl.WL_CLK);
				end if;


			end if;
			wait for 10 ns;
		end loop;
	end process;

	tb : process
		variable test : integer	:= 0;
	begin
		simulation_end_s <= '0';
		nrst <= '0';
		CtrlBus_IxSL_intl.SW_nRST <= '0';

		trigger_sti <= (others =>'0');
		CtrlBus_IxSL_intl.WindowStorage <= '0';
		CtrlBus_IxSL_intl.CPUMode <= '1';
		wait for 10 us;
		nrst <= '1';
		CtrlBus_IxSL_intl.SW_nRST <= '1';
		wait for 10 us;

		wait for 10 us;
		CtrlBus_IxSL_intl.CPUMode <= '0';
		wait for 1 us;

		CtrlBus_IxSL_intl.FSTWINDOW <= x"00000000";
		CtrlBus_IxSL_intl.NBRWINDOW <= x"00000001";

		CtrlBus_IxSL_intl.WindowStorage <= '1';
		wait for 10 ns;
		CtrlBus_IxSL_intl.WindowStorage <= '0';
		wait for 1 us;

		wait for 20 us;
		CtrlBus_IxSL_intl.FSTWINDOW <= x"0000000A";
		CtrlBus_IxSL_intl.NBRWINDOW <= x"00000003";

		CtrlBus_IxSL_intl.WindowStorage <= '1';
		wait for 10 ns;
		CtrlBus_IxSL_intl.WindowStorage <= '0';
		wait for 1 us;
		wait for 20 us;
		report " Read window 0";
		CtrlBus_IxSL_intl.FSTWINDOW <= x"00000000";
		CtrlBus_IxSL_intl.NBRWINDOW <= x"00000001";

		CtrlBus_IxSL_intl.WindowStorage <= '1';
		wait for 10 ns;
		CtrlBus_IxSL_intl.WindowStorage <= '0';
		wait for 1 us;
		wait for 20 us;
		report " Read window 1";
		CtrlBus_IxSL_intl.FSTWINDOW <= x"00000001";
		CtrlBus_IxSL_intl.NBRWINDOW <= x"00000001";

		CtrlBus_IxSL_intl.WindowStorage <= '1';
		wait for 10 ns;
		CtrlBus_IxSL_intl.WindowStorage <= '0';
		wait for 1 us;

		wait for 20 us;
		report " Read window 5 with 10";
		CtrlBus_IxSL_intl.FSTWINDOW <= x"00000005";
		CtrlBus_IxSL_intl.NBRWINDOW <= x"0000000A";

		CtrlBus_IxSL_intl.WindowStorage <= '1';
		wait for 10 ns;
		CtrlBus_IxSL_intl.WindowStorage <= '0';
		wait for 1 us;


    	wait;
	end process;

end implementation;
