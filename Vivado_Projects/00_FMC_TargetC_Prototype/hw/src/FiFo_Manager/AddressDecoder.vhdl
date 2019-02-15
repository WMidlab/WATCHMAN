library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AddressDecoder is
 port(
     address: 	in	std_logic_vector(3 downto 0);
     rd_en:		in	std_logic;
     decode:	out std_logic_vector(15 downto 0)
  );
end AddressDecoder;

architecture bhv of AddressDecoder is
begin

	decode(0)	<= '1' when rd_en = '1' and address = "0000" else '0';
	decode(1)	<= '1' when rd_en = '1' and address = "0001" else '0';
	decode(2)	<= '1' when rd_en = '1' and address = "0010" else '0';
	decode(3)	<= '1' when rd_en = '1' and address = "0011" else '0';
	
	decode(4)	<= '1' when rd_en = '1' and address = "0100" else '0';
	decode(5)	<= '1' when rd_en = '1' and address = "0101" else '0';
	decode(6)	<= '1' when rd_en = '1' and address = "0110" else '0';
	decode(7)	<= '1' when rd_en = '1' and address = "0111" else '0';
	
	decode(8)	<= '1' when rd_en = '1' and address = "1000" else '0';
	decode(9)	<= '1' when rd_en = '1' and address = "1001" else '0';
	decode(10)	<= '1' when rd_en = '1' and address = "1010" else '0';
	decode(11)	<= '1' when rd_en = '1' and address = "1011" else '0';
	
	decode(12)	<= '1' when rd_en = '1' and address = "1100" else '0';
	decode(13)	<= '1' when rd_en = '1' and address = "1101" else '0';
	decode(14)	<= '1' when rd_en = '1' and address = "1110" else '0';
	decode(15)	<= '1' when rd_en = '1' and address = "1111" else '0';
	
end bhv;
