library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;


entity TB_SampleSelect is
end TB_SampleSelect;

architecture implementation of TB_SampleSelect is
	

	signal nrst :  std_logic;
	signal clk      : std_logic;

	component DFFEC is 
   	port(
      Q : out std_logic;
      nQ: out std_logic;    
      Clk :in std_logic;   
      E: in std_logic;
      D :in  std_logic ;
      nrst : in std_logic   
   );
	end component DFFEC;
	
	component MUX2x1 is 
	   port(
		  A: in std_logic;
		  B: in std_logic;
		  Y: out std_logic;
		  S0: in std_logic
	   );
	end component;
    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';
	
	constant CLK_PERIOD : time := 10 ns;
	
	signal ss_sin, ss_dir : std_logic;
	
	signal Q, nQ, ena, d_intl : std_logic_vector(4 downto 0);
	signal arm : std_logic_vector(4 downto 0);
begin

	
	-- Clock generation
    clock_generator(clk,simulation_end_s, CLK_PERIOD);

	arm(0)	<= '0';
	arm(1)	<= '0';
	arm(2)	<= Q(1) and Q(2);
	arm(3)	<= arm(2) and Q(2);
	arm(4)	<= arm(3) and Q(3);
	
	ena(0) <= ss_dir or '1';
	ena(1) <= ss_dir or q(0);
	ena(2) <= ss_dir or arm(2);
	ena(3) <= ss_dir or arm(3);
	ena(4) <= ss_dir or arm(4);
	
	M0 : MUX2x1
	port map(
		A	=> SS_sin,
		B 	=> nQ(0),
		Y	=> d_intl(0),
		S0	=> ss_dir
	);
	
	
	DFFEC0 : DFFEC
   	port map(
      Q => Q(0),
      nQ	=> nQ(0),    
      Clk	=> clk,   
      E		=> ena(0),
      D 	=> d_intl(0),
      nrst 	=> nrst   
   );
   	
   	for I in 1 to 4 generate
	   	MX : MUX2x1
		port map(
			A	=> Q(I-1),
			B 	=> nQ(I),
			Y	=> d_intl(I),
			S0	=> ss_dir
		);
	
		DFFECX : DFFEC
	   	port map(
		  Q => Q(I),
		  nQ	=> nQ(I),    
		  Clk	=> clk,   
		  E		=> ena(I),
		  D 	=> d_intl(I),
		  nrst 	=> nrst   
	   );
	end generate;
	------------------------------------------------------------------------------------------
	-- TESTBENCH -----------------------------------------------------------------------------
	------------------------------------------------------------------------------------------

	tb : process
		variable test : integer	:= 0;	
	begin
		rst <= '0';
		simulation_end_s <= '0';  
		wait for 2* CLK_PERIOD;
		rst <= '1';
		wait for 10 * CLK_PERIOD;
		ss_dir <= '0';
		ss_sin <= '0';
		
		wait for 100 us;
		
    	wait;
	end process;
	   
end implementation;
