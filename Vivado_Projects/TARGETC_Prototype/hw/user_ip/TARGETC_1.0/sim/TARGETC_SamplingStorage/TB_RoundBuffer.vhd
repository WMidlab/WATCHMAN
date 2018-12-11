library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;
use work.TARGETC_pkg.all;

entity TB_RoundBufferGray is
end TB_RoundBufferGray;

architecture implementation of TB_RoundBufferGray is
	

	component RoundBufferGray is
	Port ( 
	--CLK : 			in  STD_LOGIC;
	RST : 			in	STD_Logic;
	
	ClockBus:		in T_ClockBus;
	
	--eTPG :			in std_logic;
	
	WR_RS_S:		out std_logic_vector(1 downto 0);
	WR_CS_S:		out std_logic_vector(5 downto 0);

	
	CtrlBus_IxSL:		in 	T_CtrlBus_IxSL; --Outputs from Control Master
	CtrlBus_OxSL:		out	T_CtrlBus_OxSL; --Outputs from Control Master
	
	RDAD_ReadEn  :in  std_logic;
	RDAD_DataOut : out std_logic_vector(9 downto 0);
    RDAD_CLK        :in  std_logic;	-- RDAD CLK
    
    DIG_DataIn	: in	std_logic_vector(8 downto 0);
    DIG_WriteEn	: in	std_logic;
    DIG_CLK   	: in	std_logic
	);
	
	end component RoundBufferGray;

	signal rst :  std_logic;
	signal clk      : std_logic;
	signal clk500MHz :std_logic;
	
	signal ClockBus_intl   :  T_ClockBus;
	
	signal CtrlBus_IxSL_intl : T_CtrlBus_OxMS_Intl;
	
    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';

	signal RDAD_ReadEn_sti  :  std_logic;
	signal RDAD_DataOut_obs : std_logic_vector(9 downto 0);
    signal RDAD_CLK_sti     :  std_logic;	-- RDAD CLK	
    
    signal DIG_DataIn_sti	: std_logic_vector(8 downto 0);
    signal DIG_WriteEn_sti	: std_logic;
    signal DIG_CLK_sti   	: std_logic;
    
	constant CLK_PERIOD : time := 10 ns;
	constant CLK500_PERIOD : time := 2 ns;
	constant SSTIN_PERIOD : time := 64 ns;
	
begin


	DUT :RoundBufferGray
	port map(
		RST => rst,
	
		ClockBus	=> ClockBus_intl,
	
		--eTPG :			in std_logic;
	
		WR_RS_S		=> open,
		WR_CS_S		=> open,
	
		CtrlBus_IxSL	=> CtrlBus_IxSL_intl,
		CtrlBus_OxSL		=> open,
		
		RDAD_ReadEn => RDAD_ReadEn_sti,
		RDAD_DataOut => RDAD_DataOut_obs,
		RDAD_CLK	=> clk,
		
		DIG_DataIn	=> DIG_DataIn_sti,
    	DIG_WriteEn	=> DIG_WriteEn_sti,
    	DIG_CLK   	=> clk
	);
	
	-- Clock generation
    clock_generator(clk,simulation_end_s, CLK_PERIOD);
    clock_generator(clk500MHz,simulation_end_s, CLK500_PERIOD);
	clock_generator(ClockBus_intl.SSTIN,simulation_end_s, SSTIN_PERIOD);
	------------------------------------------------------------------------------------------
	-- TESTBENCH -----------------------------------------------------------------------------
	------------------------------------------------------------------------------------------

	tb : process
		
	begin
		simulation_end_s <= '0';
	
		CtrlBus_IxSL_intl.WindowStorage <= '0';
		CtrlBus_IxSL_intl.FSTWINDOW <= x"00000030";
		CtrlBus_IxSL_intl.NBRWINDOW <= x"00000004";
		
		rst <= '0';
		wait for 1 us;
		rst <= '1';		
		wait for 1 us;
		CtrlBus_IxSL_intl.WindowStorage <= '1';
		wait for SSTIN_PERIOD*3;
		CtrlBus_IxSL_intl.WindowStorage <= '0';
		wait for 1 us;
		CtrlBus_IxSL_intl.FSTWINDOW <= x"00000061";
		CtrlBus_IxSL_intl.NBRWINDOW <= x"00000002";
		CtrlBus_IxSL_intl.WindowStorage <= '1';
		wait for SSTIN_PERIOD*2;
		CtrlBus_IxSL_intl.WindowStorage <= '0';
		wait for 10 us;
		
		report "RDAD reading";
		wait until rising_edge(clk);
		wait for CLK_PERIOD;
		RDAD_ReadEn_sti <= '1';
		wait for CLK_PERIOD;
		RDAD_ReadEn_sti <= '0';
		wait for 10 us;

		report "DIG write";
		wait until rising_edge(clk);
		wait for CLK_PERIOD;
		
		if RDAD_DataOut_obs(9) = '0' then
			DIG_DataIn_sti <= RDAD_DataOut_obs(7 downto 0) & '0';
		else
			DIG_DataIn_sti <= RDAD_DataOut_obs(7 downto 0) & '1';
		end if;
		Dig_WriteEn_sti <= '1';
		wait for CLK_PERIOD;
		Dig_WriteEn_sti <= '0';
		wait for 10 us;
				
		
		wait for 100 us; 
		 	
    	--simulation_end_s <= '1';
    	wait;
	end process;
	  
	  
	  
end implementation;
