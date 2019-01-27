
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity WindowSelect is
	Port (
	clk:			in std_logic;
	CurAddr :		in std_logic_vector(7 downto 0);

	NextBus_In:		in Bus_t;
	PrevBus_In:		in Bus_t;

	NextAddr:		out std_logic_vector(7 downto 0);
	PrevAddr:		out std_logic_vector(7 downto 0)
	);

end WindowSelect;

architecture Behavioral of WindowSelect is

begin

	process(clk)
	BEGIN
		if rising_edge(clk) then
			NextAddr 	<= NextBus_In(to_integer(unsigned(CurAddr)));
			PrevAddr	<= PrevBus_In(to_integer(unsigned(CurAddr)));
		end if;
	end process;

end Behavioral;
