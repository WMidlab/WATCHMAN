
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity GRAY_ENCODER is
	generic(
		NBITS : integer := 8
	);
	Port (
	GRAY_OUT :		out 	std_logic_vector(NBITS-1 downto 0);
	BIN_IN:		in	std_logic_vector(NBITS-1 downto 0)
	);
end GRAY_ENCODER;

architecture Behavioral of GRAY_ENCODER is

begin

	GRAY_OUT(NBITS-1) <= BIN_IN(NBITS-1);

	GEN_XOR : for I in 0 to NBITS-2 generate
	GRAY_OUT(I) <= BIN_IN(I+1) xor BIN_IN(I);

	end generate;

end Behavioral;
