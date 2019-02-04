
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity LookupTable_TE_old is
	generic(
		MIN_TE_TIME : integer := 3	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
	);
	Port (
		SCnt:		in 	std_logic_vector(2 downto 0);	
		nextWdo :	out	std_logic
	);
end LookupTable_TE_old;

architecture Behavioral of LookupTable_TE_old is

	
begin

	nextWdo <= 	'1' when (to_integer(unsigned(SCnt)) > (7-MIN_TE_TIME)) else
				'0';
				
end Behavioral;
