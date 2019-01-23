
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity XOR_GATE is
	Port (
	A :	in std_logic;
	B : in std_logic;
	Y : out std_logic
	);
end XOR_GATE;

architecture Behavioral of XOR_GATE is
begin

	Y = A xor B;

end Behavioral;
