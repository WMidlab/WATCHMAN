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
	SSTIN :			out std_logic;
	TimeCounter:	out std_logic_vector(63 downto 0);
	
	WR_RS_S:		out std_logic_vector(1 downto 0);
	WR_CS_S:		out std_logic_vector(5 downto 0);

	CtrlBus_IxSL:		in 	T_CtrlBus_IxSL; --Outputs from Control Master
	
	-- FIFO out for Reading RDAD
    RDAD_ReadEn  :in  std_logic;
    RDAD_DataOut : out std_logic_vector(100 downto 0);
    --RDAD_CLK     :in  std_logic;	-- RDAD CLK
    RDAD_Empty	: out std_logic;
     
    -- FIFO IN for Digiting
    DIG_Full	: out	std_logic;
    DIG_DataIn	: in	std_logic_vector(8 downto 0);
    DIG_WriteEn	: in	std_logic
    --DIG_CLK   	: in	std_logic
	);
	
	end component RoundBufferGray500MHz_Chained;
	
	signal rst :  std_logic;
	signal clk      : std_logic;
	signal clk500MHz :std_logic;
	
	signal ClockBus_intl   :  T_ClockBus;
	
	signal CtrlBus_IxSL_intl : T_CtrlBus_OxMS_Intl;
	
    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';

	signal RDAD_ReadEn_sti  :  std_logic;
	signal RDAD_DataOut_obs : std_logic_vector(100 downto 0);
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
		SSTIN		=> ClockBus_intl.SSTIN,
		TimeCounter	=> timecounter_intl,
		--eTPG :			in std_logic;
	
		WR_RS_S		=> open,
		WR_CS_S		=> open,
	
		CtrlBus_IxSL	=> CtrlBus_IxSL_intl,
	
		RDAD_ReadEn => RDAD_ReadEn_sti,
		RDAD_DataOut => RDAD_DataOut_obs,
		RDAD_Empty 	=> open,
		
		DIG_DataIn	=> DIG_DataIn_sti,
    	DIG_WriteEn	=> DIG_WriteEn_sti,
    	DIG_Full	=> open
	);
	
	-- Clock generation
    clock_generator(ClockBus_intl.RDAD_CLK,simulation_end_s, CLK_PERIOD);
    clock_generator(ClockBus_intl.clk500MHz,simulation_end_s, CLK500_PERIOD);
	
	--ClockBus_intl.SSTIN <= SSTIN_intl;
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
		wait for 1 us;
		PROCWDO(CtrlBus_IxSL_intl.WindowStorage,ClockBus_intl.SSTIN);
		
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
		report "Time WDO :" & integer'image(to_integer(unsigned(RDAD_DataOut_obs(58 downto 0))));
		report "WR_ADDR :" & integer'image(to_integer(unsigned(RDAD_DataOut_obs(66 downto 59))));
		report "WR1 :" & std_logic'image(RDAD_DataOut_obs(67));
		report "WR2 :" & std_logic'image(RDAD_DataOut_obs(68));
		
		report "DIG write";
		wait until rising_edge(clk);
		wait for CLK_PERIOD;
		
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
