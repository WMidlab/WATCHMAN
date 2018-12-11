Library IEEE;
USE IEEE.Std_logic_1164.all;

entity DFFEC is 
   port(
      Q : out std_logic;
      nQ: out std_logic;    
      Clk :in std_logic;   
      E: in std_logic;
      D :in  std_logic ;
      nrst : in std_logic   
   );
end DFFEC;
architecture Behavioral of DFFEC is  

	component MUX2x1 is 
	   port(
		  A: in std_logic;
		  B: in std_logic;
		  Y: out std_logic;
		  S0: in std_logic
	   );
	end component;
	
	component RisingEdge_DFlipFlop is 
   port(
      Q : out std_logic;
      nQ: out std_logic;    
      Clk :in std_logic;   
      D :in  std_logic ;
      nrst : in std_logic   
   );
	end component RisingEdge_DFlipFlop;
	
	signal b_intl, d_intl : std_logic;
begin  
 
	D1 : MUX2x1
	port map(
		A	=> D,
		B 	=> B_intl,
		Y	=> D_intl,
		S0	=> E
	);
	
	D2 : RisingEdge_DFlipFlop
   port(
      Q 	=> B_intl
      nQ	=> nQ,    
      Clk 	=> Clk,   
      D 	=> D_intl,
      nrst 	=> nrst  
   );
	
	Q <= B_intl;
	
end Behavioral; 
