library ieee;
use ieee.std_logic_1164.all;

entity clkcrossing_buf is
	port (
		nrst:	in	std_logic;
		DA: 	in	std_logic;                               
		QB:		out	std_logic;                             
		ClkA:	in	std_logic;
		ClkB:	in	std_logic
	);
end clkcrossing_buf;

architecture rtl of clkcrossing_buf is

	component RisingEdge_DFlipFlop is 
	   port(
		  Q : out std_logic;
		  nQ: out std_logic;    
		  Clk :in std_logic;   
		  D :in  std_logic ;
		  nrst : in std_logic   
	   );
	end component RisingEdge_DFlipFlop;
	
	-- ----------------------------------
	-- Signals
	
	signal A_intr : std_logic;
	signal B_intr : std_logic;
	
begin

	DFF_A : RisingEdge_DFlipFlop
	port map(
		Q 	=>	A_int,
		nQ	=>	open,
		CLK	=>	clkA,
		D	=>	DA,
		nrst=>	nrst
	);
	
	DFF_AB : RisingEdge_DFlipFlop
	port map(
		Q 	=>	B_int,
		nQ	=>	open,
		CLK	=>	clkB,
		D	=>	A_int,
		nrst=>	nrst
	);
	
	DFF_B : RisingEdge_DFlipFlop
	port map(
		Q 	=>	QB,
		nQ	=>	open,
		CLK	=>	clkB,
		D	=>	B_int,
		nrst=>	nrst
	);
	
end rtl;

