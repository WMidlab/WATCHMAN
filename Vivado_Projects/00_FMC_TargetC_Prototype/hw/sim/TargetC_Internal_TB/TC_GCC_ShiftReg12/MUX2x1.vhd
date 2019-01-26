Library IEEE;
USE IEEE.Std_logic_1164.all;

entity MUX2x1 is 
   port(
      A: in std_logic;
      B: in std_logic;
      Y: out std_logic;
      S0: in std_logic
   );
end MUX2x1;
architecture Behavioral of MUX2x1 is  
begin  
	Y <= 	A when S0 = '1' else
			B when S0 = '0' else
			'U';
end Behavioral; 
