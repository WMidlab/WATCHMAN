
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity HAMMING_DECODER is
	Port (
	nrst :		in 	std_logic;
	nclr:		in	std_logic;
	clk : 		in 	std_logic;
	data : 		in 	std_logic_vector(15 downto 0);
	valid : 	out std_logic;
	addr :		out	std_logic_vector(3 downto 0)
	);
end HAMMING_DECODER;

architecture Behavioral of HAMMING_DECODER is

	constant P1 : integer := 1;
	constant P2 : integer := 2;
	constant P3 : integer := 4;
	constant P4 : integer := 8;
	constant P5 : integer := 16;
	-- component XOR_GATE is
	-- Port (
	-- 	A :	in std_logic;
	-- 	B : in std_logic;
	-- 	Y : out std_logic
	-- );
	-- end component;

	signal H : std_logic_vector(15+5 downto 0);
	signal cx : std_logic_vector(4 downto 0);

begin

	process(clk, nrst)
	begin
		if nrst = '0' or nclr = '0' then
			H <= (others => '0');
		else
			if rising_edge(clk) then
					H(0) <= '0';	--1
					H(1) <= '0'; 	--2
				H(2) <= data(0);	--3
					H(3) <= '0';	--4
				H(4) <= data(1);
				H(5) <= data(2);
				H(6) <= data(3);
					H(7) <= '0'; 	--8

				H(8) <= data(4);
				H(9) <= data(5);
				H(10) <= data(6);
				H(11) <= data(7);
				H(12) <= data(8);
				H(13) <= data(9);
				H(14) <= data(10);
					H(15) <= '0';	--16

				H(16) <= data(11);
				H(17) <= data(12);
				H(18) <= data(13);
				H(19) <= data(14);
				H(20) <= data(15);
			end if;
		end if;
	end process;

	process(clk, nrst)
	begin
		if nrst = '0' or nclr = '0' then
			cx <= (others => '0');
		else
			if rising_edge(clk) then
				cx(0) <= '0' xor data(0) xor data(1) xor data(3) xor data(4) xor data(6) xor data(8) xor data(10) xor data(11) xor data(13) xor data(15);
				cx(1) <= '0' xor data(0) xor data(2) xor data(3) xor data(5) xor data(6) xor data(9) xor data(10) xor data(12) xor data(13);

				cx(2) <= '0' xor data(1) xor data(2) xor data(3) xor data(7) xor data(8) xor data(9) xor data(10) xor  data(14) xor data(15);
				--cx(3) <= H(7) xor H(8) xor H(9) xor H(10) xor H(11) xor H(12) xor H(13) xor H(14) xor H(15);
				cx(3) <= '0' xor data(4) xor data(5) xor data(6) xor data(7) xor data(8) xor data(9) xor data(10);
				cx(4) <= '0' xor data(11) xor data(12) xor data(13) xor data(14) xor data(15);
				-- cx(0) <= H(0) xor H(2) xor H(4) xor H(6) xor H(8) xor H(10) xor H(12) xor H(14) xor H(16) xor H(18) xor H(20);
				-- cx(1) <= H(1) xor H(2) xor H(5) xor H(6) xor H(9) xor H(10) xor H(13) xor H(14) xor H(17) xor H(18);
				--
				-- cx(2) <= H(3) xor H(4) xor H(5) xor H(6) xor H(11) xor H(12) xor H(13) xor H(14) xor  H(19) xor H(20);
				-- --cx(3) <= H(7) xor H(8) xor H(9) xor H(10) xor H(11) xor H(12) xor H(13) xor H(14) xor H(15);
				-- cx(3) <= H(7) xor H(8) xor H(9) xor H(10) xor H(11) xor H(12) xor H(13) xor H(14);
				-- cx(4) <= H(15) xor H(16) xor H(17) xor H(18) xor H(19) xor H(20);
				--using DATA

			end if;
		end if;
	end process;

	valid <= '1' when cx /= "00000" else '0';

	addr <= "0000" when cx = "00011" else
			"0001" when cx = "00101" else
			"0010" when cx = "00110" else
			"0011" when cx = "00111" else

			"0100" when cx = "01001" else
			"0101" when cx = "01010" else
			"0110" when cx = "01011" else
			"0111" when cx = "01100" else

			"1000" when cx = "01101" else
			"1001" when cx = "01110" else
			"1010" when cx = "01111" else
			"1011" when cx = "10001" else

			"1100" when cx = "10010" else
			"1101" when cx = "10011" else
			"1110" when cx = "10100" else
			"1111" when cx = "10101" else
			"0000";

	-- addr_intl <= std_logic_vector(unsigned(cx) - 5) when to_integer(unsigned(cx)) >= P5 else
	-- 		std_logic_vector(unsigned(cx) - 4) when to_integer(unsigned(cx)) >= P4 else
	-- 		std_logic_vector(unsigned(cx) - 3) when to_integer(unsigned(cx)) >= P3 else
	-- 		std_logic_vector(unsigned(cx) - 2) when to_integer(unsigned(cx)) >= P2 else
	-- 		std_logic_vector(unsigned(cx) - 1) when to_integer(unsigned(cx)) >= P1 else
	-- 		(others => '0');
	--
	-- addr <= addr_intl(3 downto 0);

end Behavioral;
