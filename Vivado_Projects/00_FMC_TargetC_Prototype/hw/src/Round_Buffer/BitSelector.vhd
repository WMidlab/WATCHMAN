library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity BIT_SELECTOR is
		Port (
		nrst :		in 	std_logic;
		nclr:		in	std_logic;
		clk : 		in 	std_logic;
		data : 		in 	std_logic_vector(255 downto 0);
		valid : 	out std_logic;
		addr :		out	std_logic_vector(7 downto 0)
		);
end BIT_SELECTOR;

architecture implementation of BIT_SELECTOR is

	component HAMMING_DECODERV2 is
		Port (
		nrst :		in 	std_logic;
		nclr:		in	std_logic;
		clk : 		in 	std_logic;
		data : 		in 	std_logic_vector(15 downto 0);
		valid : 	out std_logic;
		addr :		out	std_logic_vector(3 downto 0)
		);
	end component HAMMING_DECODERV2;

	-- -------------------------------------------------------------
	-- SIGNALS
	-- -------------------------------------------------------------

	type T_AddrBus is array (integer range <>)  of std_logic_vector(3 downto 0);
	signal AddrBus : T_AddrBus(15 downto 0);
	signal valid_intl : std_logic_vector(15 downto 0);
	signal valid_s : std_logic;
	signal AddrData : std_logic_vector(3 downto 0);

	signal FullAddr : std_logic_vector(7 downto 0);

begin

	H_GEN : for I in 0 to 15 generate
		DATAH : HAMMING_DECODERV2
			Port map(
			nrst 		=> nrst,
			nclr		=> nclr,
			clk  		=> clk,
			data 		=> data(((I+1)*16)-1 downto (I*16)),
			valid		=> valid_intl(I),
			addr 		=> AddrBus(I)
			);
		end generate;

	VALIDH : HAMMING_DECODERV2
		Port map(
		nrst 		=> nrst,
		nclr		=> nclr,
		clk  		=> clk,
		data 		=> valid_intl,
		valid		=> valid,
		addr 		=> AddrData
		);

	Addr <= AddrData & AddrBus(to_integer(unsigned(AddrData)));

end implementation;
