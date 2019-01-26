
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity LookupTable_TE is
	generic(
		MIN_TE_TIME : integer := 3	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
	);
	Port (
		clk:		in	std_logic;
		SCnt:		in 	std_logic_vector(3 downto 0);
		nextWdo :	out	std_logic
	);
end LookupTable_TE;

architecture Behavioral of LookupTable_TE is


begin
	-- process(clk)
	-- begin
	-- 	if rising_edge(clk) then
	-- 		if (to_integer(unsigned(SCnt)) > (7-MIN_TE_TIME)) then
	-- 			nextWdo <= '1';
	-- 		else
	-- 			nextWdo <= '0';
	-- 		end if;
	-- 	end if;
	-- end process;
	nextWdo <= 	'1' when (to_integer(unsigned(SCnt)) > (15-MIN_TE_TIME)) else
				'0';

end Behavioral;
