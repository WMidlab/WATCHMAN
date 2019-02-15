
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LookupTable_LE is
	generic(
		MIN_LE_TIME : integer := 3	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
	);
	Port (
		Clk:		in 	std_logic;
		SCnt:		in 	std_logic_vector(3 downto 0);
		prevWdo :	out	std_logic
	);
end LookupTable_LE;

architecture Behavioral of LookupTable_LE is
begin

	-- process(clk)
	-- begin
	-- 	if rising_edge(clk) then
	-- 		if to_integer(unsigned(SCnt)) < MIN_LE_TIME then
	-- 			prevWdo <= '1';
	-- 		else
	-- 			prevWdo <= '0';
	-- 		end if;
	-- 	end if;
	-- end process;

	prevWdo <= 	'1' when (to_integer(unsigned(SCnt)) < MIN_LE_TIME) else
				'0';

end Behavioral;
