library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DataDecoder is
 port(
     address: 	in	std_logic_vector(3 downto 0);
     dataOut :		out std_logic_vector(31 downto 0);
     
     dataIN_0 :		in std_logic_vector(31 downto 0);
     dataIN_1 :		in std_logic_vector(31 downto 0);
     dataIN_2 :		in std_logic_vector(31 downto 0);
     dataIN_3 :		in std_logic_vector(31 downto 0);
     
     dataIN_4 :		in std_logic_vector(31 downto 0);
     dataIN_5 :		in std_logic_vector(31 downto 0);
     dataIN_6 :		in std_logic_vector(31 downto 0);
     dataIN_7 :		in std_logic_vector(31 downto 0);
     
     dataIN_8 :		in std_logic_vector(31 downto 0);
     dataIN_9 :		in std_logic_vector(31 downto 0);
     dataIN_10 :	in std_logic_vector(31 downto 0);
     dataIN_11 :	in std_logic_vector(31 downto 0);
     
     dataIN_12 :	in std_logic_vector(31 downto 0);
     dataIN_13 :	in std_logic_vector(31 downto 0);
     dataIN_14 :	in std_logic_vector(31 downto 0);
     dataIN_15 :	in std_logic_vector(31 downto 0)
     
    
  );
end DataDecoder;

architecture bhv of DataDecoder is
begin

	dataOut <=	dataIN_0 when address = "0000" else
				dataIN_1 when address = "0001" else
				dataIN_2 when address = "0010" else
				dataIN_3 when address = "0011" else
				dataIN_4 when address = "0100" else
				dataIN_5 when address = "0101" else
				dataIN_6 when address = "0110" else
				dataIN_7 when address = "0111" else
				dataIN_8 when address = "1000" else
				dataIN_9 when address = "1001" else
				dataIN_10 when address = "1010" else
				dataIN_11 when address = "1011" else
				dataIN_12 when address = "1100" else
				dataIN_13 when address = "1101" else
				dataIN_14 when address = "1110" else
				dataIN_15 when address = "1111" else
				(others => '0');
end bhv;
