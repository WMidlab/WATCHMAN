library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DebugCore is
	port(
		O : 		out std_logic ;
		sel:		in	std_logic_vector(2 downto 0);
		I : 		in std_logic_vector(7 downto 0)
		);
end DebugCore;

architecture archi of DebugCore is
begin

	O <= 	I(0) when sel = "000" else
			I(1) when sel = "001" else
			I(2) when sel = "010" else
			I(3) when sel = "011" else
			I(4) when sel = "100" else
			I(5) when sel = "101" else
			I(6) when sel = "110" else
			I(7) when sel = "111" else
			'0';
end archi;
