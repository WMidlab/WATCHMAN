library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;
use work.TARGETC_pkg.all;

entity TB_RoundBufferGray500MHz is
end TB_RoundBufferGray500MHz;

architecture implementation of TB_RoundBufferGray500MHz is
	

	component RoundBufferGray500MHz_Chained is
	Generic (
	MAXWINDOWS : integer := 4
	);
	Port (
	RST : 			in	STD_Logic;
	
	ClockBus:		in T_ClockBus;
	TimeCounter:	in std_logic_vector(63 downto 0);
	
	WR_RS_S:		out std_logic_vector(1 downto 0);
	WR_CS_S:		out std_logic_vector(5 downto 0);

	CtrlBus_IxSL:		in 	T_CtrlBus_IxSL; --Outputs from Control Master
	
	-- FIFO out for Reading RDAD
    RDAD_ReadEn  :in  std_logic;
    RDAD_DataOut : out std_logic_vector(105 downto 0);
    --RDAD_CLK     :in  std_logic;	-- RDAD CLK
    RDAD_Empty	: out std_logic;
     
    -- FIFO IN for Digiting
    DIG_Full	: out	std_logic;
    DIG_DataIn	: in	std_logic_vector(8 downto 0);
    DIG_WriteEn	: in	std_logic
    --DIG_CLK   	: in	std_logic
	);
	end component RoundBufferGray500MHz_Chained;
	
	component TC_ClockManagementV2 is

	port (
	-- TARGET C Ports for control and function
		nrst:			in	std_logic;
		clk1:			in 	std_logic;	-- Clock for the TARGETC SCLK
		clk2:			in 	std_logic;	-- Clock for the TARGETC SCLK
		
		WL_CLK_DIV:		in 	std_logic_vector(31 downto 0); -- Clock Divider Through DFF
		
		PLL_LOCKED:		out	std_logic;
		
		ClockBus:		out T_ClockBus;

		Timecounter:	out std_logic_vector(63 downto 0);		-- Pin 
		
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
	
	signal rst :  std_logic;
	signal clk      : std_logic;
	
	signal ClockBus_intl   :  T_ClockBus;
	
	signal CtrlBus_IxSL_intl : T_CtrlBus_OxMS_Intl;
	
    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';

	signal RDAD_ReadEn_sti, RDAD_Empty_obs  :  std_logic;
	signal RDAD_DataOut_obs : std_logic_vector(105 downto 0);
    signal RDAD_CLK_sti     :  std_logic;	-- RDAD CLK	
    
    signal DIG_DataIn_sti	: std_logic_vector(8 downto 0);
    signal DIG_WriteEn_sti	: std_logic;
    signal DIG_CLK_sti   	: std_logic;
    signal timecounter_intl : std_logic_vector(63 downto 0);
    
	constant CLK_PERIOD : time := 10 ns;
	constant CLK500_PERIOD : time := 2 ns;
	constant SSTIN_PERIOD : time := 64 ns;
	
begin


	DUT : RoundBufferGray500MHz_Chained
	generic map(
		MAXWINDOWS => 4
	)
	port map(
		RST => rst,
	
		ClockBus	=> ClockBus_intl,
		TimeCounter	=> timecounter_intl,
		
		
		WR_RS_S		=> open,
		WR_CS_S		=> open,
	
		CtrlBus_IxSL	=> CtrlBus_IxSL_intl,
	
		RDAD_ReadEn => RDAD_ReadEn_sti,
		RDAD_DataOut => RDAD_DataOut_obs,
		RDAD_Empty 	=> RDAD_Empty_obs,
		
		DIG_DataIn	=> DIG_DataIn_sti,
    	DIG_WriteEn	=> DIG_WriteEn_sti,
    	DIG_Full	=> open
	);
	
	CLK_MNG : TC_ClockManagementV2

	port map(
	-- TARGET C Ports for control and function
		nrst	=> rst,
		clk1	=> clk,
		clk2	=> clk,
		
		WL_CLK_DIV => (others => '0'),
		
		PLL_LOCKED => open,
		
		ClockBus =>		ClockBus_intl,

		Timecounter =>	timecounter_intl,		-- Pin 
		
		HSCLKdif =>		'0',	
		 
		-- LVDS Differential Pair
		HSCLK_P => open,
		HSCLK_N => open,		-- Pin#44
		
		WL_CLK_P => open,		-- Pin#57
		WL_CLK_N => open,		-- Pin#58
		
		SSTIN_P => open,		-- Pin#125 		
		SSTIN_N => open		-- Pin#126 		
		
	);
	
	-- Clock generation
    clock_generator(clk,simulation_end_s, CLK_PERIOD);
	
	------------------------------------------------------------------------------------------
	-- TESTBENCH -----------------------------------------------------------------------------
	------------------------------------------------------------------------------------------

	tb : process
		
		procedure PROCWDO(
			signal En	:	out std_logic;
			signal Clk	:	in std_logic) is
		begin
			wait until rising_edge(Clk);
			wait for SSTIN_PERIOD;
			En <= '1';
			wait for SSTIN_PERIOD;
			En <= '0';
		end procedure;
		
	begin
		simulation_end_s <= '0';
	
		CtrlBus_IxSL_intl.WindowStorage <= '0';
		CtrlBus_IxSL_intl.FSTWINDOW <= x"00000030";
		CtrlBus_IxSL_intl.NBRWINDOW <= x"00000004";
		
		rst <= '0';
		wait for 1 us;
		rst <= '1';		
		wait for 10 us;
		PROCWDO(CtrlBus_IxSL_intl.WindowStorage,ClockBus_intl.SSTIN);
		
		wait until RDAD_Empty_obs ='0';
		
		report "RDAD reading";
		wait until rising_edge(clk);
		wait for CLK_PERIOD;
		RDAD_ReadEn_sti <= '1';
		wait for CLK_PERIOD;
		RDAD_ReadEn_sti <= '0';
		wait for 10 us;

		report "RDAD_DataOut_obs: " & integer'image(to_integer(unsigned(RDAD_DataOut_obs)));
		report "Time WDO :" & integer'image(to_integer(unsigned(RDAD_DataOut_obs(63 downto 0))));
		report "WR_ADDR :" & integer'image(to_integer(unsigned(RDAD_DataOut_obs(66+5 downto 64))));
		report "WR1 :" & std_logic'image(RDAD_DataOut_obs(67+5));
		report "WR2 :" & std_logic'image(RDAD_DataOut_obs(68+5));
		
		wait for 10 us;
		
		report "DIG write WR1";
		wait until rising_edge(clk);
		wait for CLK_PERIOD;
		
		if RDAD_DataOut_obs(67+5) = '0' then
			DIG_DataIn_sti	<= RDAD_DataOut_obs(66+5 downto 64) & '0';
		else
			DIG_DataIn_sti	<= RDAD_DataOut_obs(66+5 downto 64) & '1';
		end if;

   		wait for CLK_PERIOD;
    	DIG_WriteEn_sti	<= '1';
    	wait for CLK_PERIOD;
    	DIG_WriteEn_sti	<= '0';	
    		
		wait for 10 us;
		
		report "DIG write WR2";
		wait until rising_edge(clk);
		wait for CLK_PERIOD;
		
		if RDAD_DataOut_obs(68+5) = '0' then
			DIG_DataIn_sti	<= RDAD_DataOut_obs(66+5 downto 64) & '1';

			wait for CLK_PERIOD;
			DIG_WriteEn_sti	<= '1';
			wait for CLK_PERIOD;
			DIG_WriteEn_sti	<= '0';
		end if;
		
		wait;
		
		wait for 1 us;
		CtrlBus_IxSL_intl.FSTWINDOW <= x"00000061";
		CtrlBus_IxSL_intl.NBRWINDOW <= x"00000002";
		PROCWDO(CtrlBus_IxSL_intl.WindowStorage,ClockBus_intl.SSTIN);
		
		wait for 50 us;
		
		CtrlBus_IxSL_intl.FSTWINDOW <= x"00000040";
		CtrlBus_IxSL_intl.NBRWINDOW <= x"00000001";
		PROCWDO(CtrlBus_IxSL_intl.WindowStorage,ClockBus_intl.SSTIN);
		wait for 50 us;

		CtrlBus_IxSL_intl.FSTWINDOW <= x"00000051";
		CtrlBus_IxSL_intl.NBRWINDOW <= x"00000001";
		PROCWDO(CtrlBus_IxSL_intl.WindowStorage,ClockBus_intl.SSTIN);
		wait for 50 us;
		
		CtrlBus_IxSL_intl.FSTWINDOW <= x"0000002F";
		CtrlBus_IxSL_intl.NBRWINDOW <= x"00000004";
		PROCWDO(CtrlBus_IxSL_intl.WindowStorage,ClockBus_intl.SSTIN);
		wait for 50 us;
			
		wait for 1 us;
		CtrlBus_IxSL_intl.FSTWINDOW <= x"00000010";
		CtrlBus_IxSL_intl.NBRWINDOW <= x"00000004";
		PROCWDO(CtrlBus_IxSL_intl.WindowStorage,ClockBus_intl.SSTIN);
		
		report "RDAD reading";
		wait until rising_edge(clk);
		wait for CLK_PERIOD;
		RDAD_ReadEn_sti <= '1';
		wait for CLK_PERIOD;
		RDAD_ReadEn_sti <= '0';
		wait for 10 us;

		report "RDAD_DataOut_obs: " & integer'image(to_integer(unsigned(RDAD_DataOut_obs)));
		report "Time WDO :" & integer'image(to_integer(unsigned(RDAD_DataOut_obs(63 downto 0))));
		report "WR_ADDR :" & integer'image(to_integer(unsigned(RDAD_DataOut_obs(66+5 downto 64))));
		report "WR1 :" & std_logic'image(RDAD_DataOut_obs(67+5));
		report "WR2 :" & std_logic'image(RDAD_DataOut_obs(68+5));
		

--		if RDAD_DataOut_obs(9) = '0' then
--			DIG_DataIn_sti <= RDAD_DataOut_obs(7 downto 0) & '0';
--		else
--			DIG_DataIn_sti <= RDAD_DataOut_obs(7 downto 0) & '1';
--		end if;
--		Dig_WriteEn_sti <= '1';
--		wait for CLK_PERIOD;
--		Dig_WriteEn_sti <= '0';
--		wait for 10 us;
				
		
		wait for 100 us; 
		 	
    	--simulation_end_s <= '1';
    	wait;
	end process;
	  
	  
	  
end implementation;
