
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity HAMMING_DECODERV2 is
	Port (
	nrst :		in 	std_logic;
	nclr:		in	std_logic;
	clk : 		in 	std_logic;
	data : 		in 	std_logic_vector(15 downto 0);
	valid : 	out std_logic;
	addr :		out	std_logic_vector(3 downto 0)
	);
end HAMMING_DECODERV2;

architecture Behavioral of HAMMING_DECODERV2 is

	signal cx : std_logic_vector(4 downto 0);

begin

	process(clk, nrst, nclr)
	begin
		if nrst = '0' or nclr = '0' then
			cx <= (others => '0');
		else
			if rising_edge(clk) then
				cx(0) <= data(0) xor data(1) xor data(3) xor data(4) xor data(6) xor data(8) xor data(10) xor data(11) xor data(13) xor data(15);
				cx(1) <= data(0) xor data(2) xor data(3) xor data(5) xor data(6) xor data(9) xor data(10) xor data(12) xor data(13);

				cx(2) <= data(1) xor data(2) xor data(3) xor data(7) xor data(8) xor data(9) xor data(10) xor  data(14) xor data(15);

				cx(3) <= data(4) xor data(5) xor data(6) xor data(7) xor data(8) xor data(9) xor data(10);
				cx(4) <= data(11) xor data(12) xor data(13) xor data(14) xor data(15);
			end if;
		end if;
	end process;

	valid <= '1' when cx /= "00000" else '0';

	process(clk, nrst, nclr)
	begin
		if nrst = '0' or nclr = '0' then
			--cx <= (others => '0');
			addr <= (others => '0');
		else
			if rising_edge(clk) then
				case cx is
					when "00011" =>
						addr <= "0000";
					when "00101" =>
						addr <= "0001";
					when "00110" =>
						addr <= "0010";
					when "00111" =>
						addr <= "0011";
					when "01001" =>
						addr <= "0100";
					when "01010" =>
						addr <=  "0101";
					when "01011" =>
						addr <= "0110";
					when "01100" =>
						addr <= "0111";
					when "01101" =>
						addr <= "1000";
					when "01110" =>
						addr <= "1001";
					when "01111" =>
						addr <= "1010";
					when "10001" =>
						addr <= "1011";
					when "10010" =>
						addr <= "1100";
					when "10011" =>
						addr <= "1101";
					when "10100" =>
						addr <= "1110";
					when "10101" =>
						addr <= "1111";
					when others =>
						addr <= "0000";
				end case;
			end if;
		end if;
	end process;

	-- addr <= "0000" when cx = "00011" else
	-- 		"0001" when cx = "00101" else
	-- 		"0010" when cx = "00110" else
	-- 		"0011" when cx = "00111" else
	--
	-- 		"0100" when cx = "01001" else
	-- 		"0101" when cx = "01010" else
	-- 		"0110" when cx = "01011" else
	-- 		"0111" when cx = "01100" else
	--
	-- 		"1000" when cx = "01101" else
	-- 		"1001" when cx = "01110" else
	-- 		"1010" when cx = "01111" else
	-- 		"1011" when cx = "10001" else
	--
	-- 		"1100" when cx = "10010" else
	-- 		"1101" when cx = "10011" else
	-- 		"1110" when cx = "10100" else
	-- 		"1111" when cx = "10101" else
	-- 		"0000";

	-- addr_intl <= std_logic_vector(unsigned(cx) - 5) when to_integer(unsigned(cx)) >= P5 else
	-- 		std_logic_vector(unsigned(cx) - 4) when to_integer(unsigned(cx)) >= P4 else
	-- 		std_logic_vector(unsigned(cx) - 3) when to_integer(unsigned(cx)) >= P3 else
	-- 		std_logic_vector(unsigned(cx) - 2) when to_integer(unsigned(cx)) >= P2 else
	-- 		std_logic_vector(unsigned(cx) - 1) when to_integer(unsigned(cx)) >= P1 else
	-- 		(others => '0');
	--
	-- addr <= addr_intl(3 downto 0);

end Behavioral;
