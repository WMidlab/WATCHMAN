library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;
use work.TARGETC_pkg.all;

entity TC_GCC_ShiftReg12 is
end TC_GCC_ShiftReg12;

architecture implementation of TC_GCC_ShiftReg12 is
	
	-- Component(s) to test
	component RisingEdge_DFlipFlop is 
	port(
		Q : out std_logic;
		nQ: out std_logic;    
		Clk :in std_logic;   
		D :in  std_logic ;
		nrst : in std_logic   
		);
	end component RisingEdge_DFlipFlop;
	
	component MUX2x1 is 
   	port(
      A: in std_logic;
      B: in std_logic;
      Y: out std_logic;
      S0: in std_logic
   	);
	end component MUX2x1;
    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';
	
	signal D : std_logic_vector(11 downto 0);
	signal Y_intl : std_logic_vector(11 downto 0);
	signal Q : std_logic_vector(11 downto 0);
	constant CLK_PERIOD : time := 10 ns;
	signal ss_incr : std_logic;
	signal n_ss_incr : std_logic;
	
	signal srclk : std_logic;
	signal n_srclk : std_logic;
	
	signal nrst : std_logic;
	
	signal DFF1_Q, DFF2_nQ, s, sdaout : std_logic;

begin

	GEN_BLK : for I in 0 to 10 generate
      BLKX : MUX2x1
      port map(
      	A	=> D(I+1),
      	B	=> Q(I),
      	Y	=> Y_intl(I),
      	S0	=> s
      );
      
      	DFFX : RisingEdge_DFlipFlop
		Port map( 
		Q 	=> D(I),
		nQ	=> open,   
		Clk => srclk, 
		D 	=> Y_intl(I),
		nrst => nRST
		);
     
   end generate GEN_BLK;
	
	  BLKX : MUX2x1
      port map(
      	A	=> '0',
      	B	=> Q(11),
      	Y	=> Y_intl(11),
      	S0	=> s
      );
      
      	DFFX : RisingEdge_DFlipFlop
		Port map( 
		Q 	=> D(11),
		nQ	=> open,   
		Clk => srclk, 
		D 	=> Y_intl(11),
		nrst => nRST
		);
	

	-- Clock generation
    clock_generator(srclk,simulation_end_s, CLK_PERIOD);
    
    n_srclk <= not srclk;
    n_ss_incr <= not ss_incr;
    
	DFF1 : RisingEdge_DFlipFlop
	Port map( 
		Q 	=> DFF1_Q,
		nQ	=> open,   
		Clk => n_srclk, 
		D 	=> n_ss_incr,
		nrst => nRST
	);
	
	DFF2 : RisingEdge_DFlipFlop
	Port map( 
		Q 	=> open,
		nQ	=> DFF2_nQ,   
		Clk => n_srclk, 
		D 	=> DFF1_Q,
		nrst => nRST
	);	 
	
	s <= not (DFF1_Q and DFF2_nQ);
	sdaout <= D(0);
 
	------------------------------------------------------------------------------------------
	-- TESTBENCH -----------------------------------------------------------------------------
	------------------------------------------------------------------------------------------
	tb : process
	begin
		simulation_end_s <= '0';
		nrst <= '0';
		ss_incr <= '0';
		Q <= "110110110011";
		wait for 2*clk_period;
		nrst <= '1';
		wait until rising_edge(srclk);
		wait for 20*clk_period;

		wait for 2*clk_period;
		wait for 2 ns;
		ss_incr <= '1';
		wait for clk_period;
		ss_incr <= '0';
		wait for 30*clk_period;
		ss_incr <= '1';
		wait for 2*clk_period;
		ss_incr <= '0';		
		wait for 30*clk_period;
		ss_incr <= '1';
		wait for 3*clk_period;
		ss_incr <= '0';
		wait for 30*clk_period;
		ss_incr <= '1';
		wait for 4*clk_period;
		ss_incr <= '0';
    	wait;
	end process;
	  
	  
	  
end implementation;
