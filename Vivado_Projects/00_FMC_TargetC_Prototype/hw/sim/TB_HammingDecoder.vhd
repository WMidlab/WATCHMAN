library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;
use std.textio.all;

entity TB_HAMMING is
end TB_HAMMING;

architecture implementation of TB_HAMMING is

	component HAMMING_DECODER is
		Port (
		nrst :		in 	std_logic;
		nclr : 		in 	std_logic;
		clk : 		in 	std_logic;
		data : 		in 	std_logic_vector(15 downto 0);
		valid : 	out std_logic;
		addr :		out	std_logic_vector(3 downto 0)
		);
	end component HAMMING_DECODER;
	-- -------------------------------------------------------------
	-- Constant
	-- -------------------------------------------------------------
	constant NBRWINDOWS : integer := 256;
	constant CLK100MHz_PERIOD : time := 4 ns;
	-- -------------------------------------------------------------
	-- SIGNALS
	-- -------------------------------------------------------------

	signal nrst :  std_logic;
	signal Refclk     : std_logic;
	signal simulation_end_s : std_logic;

	signal data_sti : std_logic_vector(255 downto 0);

	type T_AddrBus is array (integer range <>)  of std_logic_vector(3 downto 0);
	signal AddrBus : T_AddrBus(15 downto 0);
	signal valid_intl : std_logic_vector(15 downto 0);
	signal valid_s : std_logic;
	signal AddrData : std_logic_vector(3 downto 0);

	signal FullAddr : std_logic_vector(7 downto 0);

	--Variable for TB
	file fd : text open WRITE_MODE is "/home/jonathan/VivadoProjects/00_WATCHMANN/TARGETC_Prototype/hw/sim/00_Reports/TB_Hamming_REPORT.txt";

begin

	H_GEN : for I in 0 to 15 generate
		DATAH : HAMMING_DECODER
			Port map(
			nrst 		=> nrst,
			nclr		=> nrst,
			clk  		=> Refclk,
			data 		=> data_sti(((I+1)*16)-1 downto (I*16)),
			valid		=> valid_intl(I),
			addr 		=> AddrBus(I)
			);
		end generate;

	VALIDH : HAMMING_DECODER
		Port map(
		nrst 		=> nrst,
		nclr		=> nrst,
		clk  		=> Refclk,
		data 		=> valid_intl,
		valid		=> valid_s,
		addr 		=> AddrData
		);

	FullAddr <= AddrData & AddrBus(to_integer(unsigned(AddrData)));

	-- Clock generation
	clock_generator(Refclk,simulation_end_s, CLK100MHz_PERIOD);



	tb : process
		variable L : Line;
		variable err : integer := 0;
		variable success : integer := 0;
	begin
		simulation_end_s <= '0';
		nrst <= '0';

		wait for 1 us;
		data_sti <= (others => '0');
		wait for 1 us;
		nrst <= '1';
		wait for 1 us;
		
		WRITE(L,string'("Hamming TestBench:" & CR));
		for I in 0 to 255 loop
			data_sti <= (I => '1', others => '0');
			
			while valid_s = '0' loop
				wait until rising_edge(RefClk);
			end loop;
			
			if FullAddr = std_logic_vector(to_unsigned(I,8)) then
				WRITE(L,string'("OK: Addr ="& integer'image(to_integer(unsigned(FullAddr))) & " Bit : " & integer'image(I) & CR));
				success := success + 1;
			else
				--Error
				WRITE(L,string'("FAIL: Addr ="& integer'image(to_integer(unsigned(FullAddr))) & " Bit : " & integer'image(I) & CR));
				err := err + 1;
			end if;
			WRITELINE(fd,L);
			wait for 1 us;
			nrst <= '0';
			data_sti <= (others => '0');
			wait for 1 us;
			nrst <= '1';
		end loop;

		WRITE(L,string'("Hamming TestBench Simulation End" & CR));
		WRITE(L,string'("Success : " &integer'image(success) & "/256 = " & integer'image(success*100/256) &"%" & CR));
		WRITE(L,string'("Error : " &integer'image(err) & "/256 =" & integer'image(err*100/256)&"%" & CR));
		WRITELINE(fd,L);
    	wait;
	end process;

end implementation;
