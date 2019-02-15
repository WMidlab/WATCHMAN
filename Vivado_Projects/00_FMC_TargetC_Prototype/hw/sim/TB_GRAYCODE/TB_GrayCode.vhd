library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;
use std.textio.all;

entity TB_GRAYCODE is
end TB_GRAYCODE;

architecture implementation of TB_GRAYCODE is

	component GRAY_ENCODER is
		generic(
			NBITS : integer := 8
		);
		Port (
		GRAY_OUT :		out 	std_logic_vector(NBITS-1 downto 0);
		BIN_IN:		in	std_logic_vector(NBITS-1 downto 0)
		);
	end component GRAY_ENCODER;

	component GRAY_DECODER is
		generic(
			NBITS : integer := 8
		);
		Port (
		GRAY_IN :		in 	std_logic_vector(NBITS-1 downto 0);
		BIN_OUT:		out	std_logic_vector(NBITS-1 downto 0)
		);
	end component GRAY_DECODER;
	-- -------------------------------------------------------------
	-- Constant
	-- -------------------------------------------------------------
	constant NBRWINDOWS : integer := 256;
	constant CLK100MHz_PERIOD : time := 4 ns;

	constant NBITS : integer := 8;
	-- -------------------------------------------------------------
	-- SIGNALS
	-- -------------------------------------------------------------
	signal ADDRESS_STI : std_logic_vector(NBITS-1 downto 0);
	signal GRAY_INTER : std_logic_vector(NBITS-1 downto 0);
	signal ADDRESS_OBS : std_logic_vector(NBITS-1 downto 0);

	--Variable for TB
	file fd : text open WRITE_MODE is "/home/jonathan/VivadoProjects/00_WATCHMANN/TARGETC_Prototype/hw/sim/00_Reports/TB_GRAYCODE.txt";
begin


	DUT1:  GRAY_ENCODER
		generic map(
			NBITS => NBITS
		)
		Port map(
		BIN_IN  => ADDRESS_STI,
		GRAY_OUT => GRAY_INTER
		);

	DUT2:  GRAY_DECODER
		generic map(
			NBITS => NBITS
		)
		Port map(
		GRAY_IN => GRAY_INTER,
		BIN_OUT	=> ADDRESS_OBS
		);

	tb : process
		variable L : Line;
	begin
		ADDRESS_STI <= (others => '0');
		for I in 0 to 256 loop
			ADDRESS_STI <= std_logic_vector(to_unsigned(I,NBITS));
			wait for 1 us;
			WRITE(L,string'(integer'image(to_integer(unsigned(ADDRESS_STI))) & " "));
			WRITE(L,string'(integer'image(to_integer(unsigned(GRAY_INTER))) & " " ));
			WRITE(L,string'(integer'image(to_integer(unsigned(ADDRESS_OBS))) & CR));
			WRITELINE(fd,L);
		end loop;
    	wait;
	end process;

end implementation;
