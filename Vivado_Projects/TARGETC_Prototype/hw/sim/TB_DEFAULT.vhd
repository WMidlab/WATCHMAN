library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;


entity TB_DEFAULT is
end TB_DEFAULT;

architecture implementation of TB_DEFAULT is
	

	signal rst_sync :  std_logic;
	signal clk      : std_logic;

	
	
    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';
	
	constant CLK_PERIOD : time := 10 ns;

	
begin

	
	-- Clock generation
    clock_generator(clk,simulation_end_s, CLK_PERIOD);

	
	tb : process
		variable test : integer	:= 0;	
	begin
		simulation_end_s <= '0';  
		rst <= '1';
		wait for 2* CLK_PERIOD;
		rst <= '0';
		
		
		-- USER DEFINE
		
		
		
		wait for 1 us;
		simulation_end_s <= '1'; 
    	wait;
	end process;
	   
end implementation;
