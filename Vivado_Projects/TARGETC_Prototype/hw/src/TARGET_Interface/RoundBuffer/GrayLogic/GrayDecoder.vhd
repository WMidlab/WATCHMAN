
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity GRAY_DECODER is
	generic(
		NBITS : integer := 8
	);
	Port (
	GRAY_IN :		in 	std_logic_vector(NBITS-1 downto 0);
	BIN_OUT:		out	std_logic_vector(NBITS-1 downto 0)
	);
end GRAY_DECODER;

architecture Behavioral of GRAY_DECODER is

	signal XOR_intl : std_logic_vector(NBITS-1 downto 0);
begin

	XOR_intl(NBITS-1) <= GRAY_IN(NBITS-1);

	GEN_XOR : for I in 0 to NBITS-2 generate
		XOR_intl(I) <= GRAY_IN(I) xor XOR_intl(I+1);

	end generate;

	BIN_OUT <= XOR_intl;

end Behavioral;
