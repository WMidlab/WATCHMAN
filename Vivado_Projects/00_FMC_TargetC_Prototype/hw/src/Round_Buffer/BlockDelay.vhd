library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.WindowCPU_pkg.all;
use work.TARGETC_pkg.all;

entity BlockDelay is
	generic(
		NBR : integer := 16
	);
	Port (
	nrst : 		in	STD_Logic;
	nclr :		in	std_logic;
	clk:		in std_logic;

	Scnt:		in	std_logic_vector(3 downto 0);

	D : 		in	std_logic;
	Q:			out	std_logic

	);

end BlockDelay;

architecture Behavioral of BlockDelay is

	component RisingEdge_DFlipFlop is
	   port(
	      Q : out std_logic;
	      nQ: out std_logic;
	      Clk :in std_logic;
	      D :in  std_logic ;
	      nrst : in std_logic
	   );
	end component RisingEdge_DFlipFlop;

	signal Qinter : std_logic_vector(NBR-1 downto 0);
	signal Dinter : std_logic_vector(NBR-1 downto 0);
	signal ClkInter: std_logic_vector(NBR-1 downto 0);
begin

	-- Dinter(0) <= Tinter(0);
	--
	-- DFFX : RisingEdge_DFlipFlop
	-- port map(
	-- 	nrst 	=> nrst,
	-- 	clk		=> clk,
	-- 	D		=> Tinter(0),
	-- 	Q		=> Qinter(0),
	-- 	nQ		=> open
	-- );

	DFF_GEN : for I in 0 to (NBR-1) generate

		DFFX : RisingEdge_DFlipFlop
		port map(
			nrst 	=> nRST,
			clk		=> ClkInter(I),
			D		=> D,
			Q		=> Qinter(I),
			nQ		=> open
		);

	end generate;

	Q <= 	'0' when Qinter = x"0000"else 
			'1';

	-- -- Demultiplexer
	-- DInter <= 	(0=> D, others => '0')	when SCnt = "0000" else
	-- 			(1=> D, others => '0')	when SCnt = "0001" else
	-- 			(2=> D, others => '0')	when SCnt = "0010" else
	-- 			(3=> D, others => '0')	when SCnt = "0011" else
	-- 			(4=> D, others => '0')	when SCnt = "0100" else
	-- 			(5=> D, others => '0')	when SCnt = "0101" else
	-- 			(6=> D, others => '0')	when SCnt = "0110" else
	-- 			(7=> D, others => '0')	when SCnt = "0111" else
	-- 			(8=> D, others => '0')	when SCnt = "1000" else
	-- 			(9=> D, others => '0')	when SCnt = "1001" else
	-- 			(10=> D, others => '0')	when SCnt = "1010" else
	-- 			(11=> D, others => '0')	when SCnt = "1011" else
	-- 			(12=> D, others => '0')	when SCnt = "1100" else
	-- 			(13=> D, others => '0')	when SCnt = "1101" else
	-- 			(14=> D, others => '0')	when SCnt = "1110" else
	-- 			(15=> D, others => '0')	when SCnt = "1111" else
	-- 			(others => '0');

	ClkInter <= (0=> '1', others => '0')	when SCnt = "0000" else
				(1=> '1', others => '0')	when SCnt = "0001" else
				(2=> '1', others => '0')	when SCnt = "0010" else
				(3=> '1', others => '0')	when SCnt = "0011" else
				(4=> '1', others => '0')	when SCnt = "0100" else
				(5=> '1', others => '0')	when SCnt = "0101" else
				(6=> '1', others => '0')	when SCnt = "0110" else
				(7=> '1', others => '0')	when SCnt = "0111" else
				(8=> '1', others => '0')	when SCnt = "1000" else
				(9=> '1', others => '0')	when SCnt = "1001" else
				(10=> '1', others => '0')	when SCnt = "1010" else
				(11=> '1', others => '0')	when SCnt = "1011" else
				(12=> '1', others => '0')	when SCnt = "1100" else
				(13=> '1', others => '0')	when SCnt = "1101" else
				(14=> '1', others => '0')	when SCnt = "1110" else
				(15=> '1', others => '0')	when SCnt = "1111" else
				(others => '0');

end Behavioral;
