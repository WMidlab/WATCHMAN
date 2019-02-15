library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clkcrossing_buf is
	generic(
		NBITS : integer := 32
	);
	port (
		nrst:	in	std_logic;
		DA: 	in	std_logic_vector(NBITS-1 downto 0);
		QB:		out	std_logic_vector(NBITS-1 downto 0);
		ClkA:	in	std_logic;
		ClkB:	in	std_logic
	);
end clkcrossing_buf;

architecture rtl of clkcrossing_buf is

	component RisingEdge_DFlipFlop is
	   port(
		  Q : out std_logic;
		  nQ: out std_logic;
		  Clk :in std_logic;
		  D :in  std_logic ;
		  nrst : in std_logic
	   );
	end component RisingEdge_DFlipFlop;

	-- ----------------------------------
	-- Signals

	signal A_intl : std_logic_vector(NBITS-1 downto 0);
	signal B_intl : std_logic_vector(NBITS-1 downto 0);
	signal QB_intl : std_logic_vector(NBITS-1 downto 0);

	-- -------------------------------------------------------------
	-- Constraints on Signals
	-- -------------------------------------------------------------
	attribute DONT_TOUCH : string;
	attribute DONT_TOUCH of A_intl: signal is "TRUE";
	attribute DONT_TOUCH of B_intl: signal is "TRUE";
	attribute DONT_TOUCH of QB_intl: signal is "TRUE";

begin

	DFF_GEN : for I in 0 to NBITS-1 generate
		DFF_A : RisingEdge_DFlipFlop
		port map(
			Q 	=>	A_intl(I),
			nQ	=>	open,
			CLK	=>	clkA,
			D	=>	DA(I),
			nrst=>	nrst
		);

		DFF_AB : RisingEdge_DFlipFlop
		port map(
			Q 	=>	B_intl(I),
			nQ	=>	open,
			CLK	=>	clkB,
			D	=>	A_intl(I),
			nrst=>	nrst
		);

		DFF_B : RisingEdge_DFlipFlop
		port map(
			Q 	=>	QB_intl(I),
			nQ	=>	open,
			CLK	=>	clkB,
			D	=>	B_intl(I),
			nrst=>	nrst
		);
	end generate;

	QB <= QB_intl;
end rtl;
