library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;
use work.TARGETC_pkg.all;

entity TB_TC_SerialDataOut is
end TB_TC_SerialDataOut;

architecture implementation of TB_TC_SerialDataOut is
	
	-- Component(s) to test
	component TARGETC_SERIAL_DATA_OUT is
	Port ( 
	HSCLKref : 			in  STD_LOGIC;
	HSCLK : 			out  STD_LOGIC;
	
	-- Control/Command inputs
	SS_start :			in std_logic;
	--eTPG :			in std_logic;
	
	DO_BUS :		out eDO_BUS_TYPE;
	
	-- Data Readout
	DO : 			in std_logic_vector(15 downto 0);
	eHSclk :		out std_logic;
	eSmplSl_Any:	out std_logic;
	eSS_Incr:		out std_logic
	);
	end component TARGETC_SERIAL_DATA_OUT;
	
    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';
	
	constant CLK_PERIOD : time := 10 ns;
	signal clk_sti : std_logic;
	signal eTPG_sti : std_logic;
	signal start_sti : std_logic;
	signal eDO_sti : std_logic_vector(15 downto 0) := x"FF00";
	signal HSclk_obs : std_logic;

begin


	-- Clock generation
    clock_generator(clk_sti,simulation_end_s, CLK_PERIOD);
    
	DUT : TARGETC_SERIAL_DATA_OUT
	Port map( 
		HSCLKref => clk_sti,
		HSCLK => HSclk_obs,
		-- Control/Command inputs
		ss_start => start_sti,
		--eTPG => eTPG_sti,
		DO_BUS => open,
	
		-- Data Readout
		DO => eDO_sti,
		eHSclk => open,
		eSmplSl_Any => open,
		eSS_Incr => open
	); 
	
	process(HSclk_obs)
	variable tmp : std_logic_vector(15 downto 0);
	begin
		if rising_edge(HSclk_obs) then
			tmp := eDO_sti(14 downto 0) & eDO_sti(15);
			eDO_sti <= tmp;
		end if;
	end process;

 
	------------------------------------------------------------------------------------------
	-- TESTBENCH -----------------------------------------------------------------------------
	------------------------------------------------------------------------------------------
	tb : process
	begin
		simulation_end_s <= '0';
		start_sti <= '0';
		eTPG_sti <= '0';
		wait for 2*clk_period;
		wait for 2 ns;
		start_sti <= '1';
		wait for clk_period;
		start_sti <= '0';
		
		wait for 1 us;   	
    	simulation_end_s <= '1';
    	wait;
	end process;
	  
	  
	  
end implementation;
