library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--entity declaration with port definitions
entity compare is
port(    
	a : 	in std_logic_vector(3 downto 0);  --input 1
	b :	 	in std_logic_vector(3 downto 0);  --input 2
	clk:	in std_logic;
	nrst:	in std_logic;
	aLTb :   out std_logic;   -- indicates first number is small
	equal :  out std_logic;   -- both are equal
	aGTb :   out std_logic    -- indicates first number is bigger
);
end compare;

--architecture of entity
architecture Behavioral of compare is

	signal aLTb_s : std_logic;
	signal equal_s:  std_logic;
	signal aGTb_s : std_logic;
	
begin

	aLTb 	<= aLTb_s when  nRST = '1' else '0';
	equal <= equal_s when  nRST = '1' else '0';
	aGTb 	<= aGTb_s when nRST = '1' else '0';
	
	
	aLTb_s 	<= '1' when (a > b) else '0';
	equal_s <= '1' when (a = b) else '0';
	aGTb_s 	<= '1' when (a < b) else '0';
end Behavioral;
