
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg_old.all;

entity WindowSelect is
	Port (
	CurAddr :		in std_logic_vector(7 downto 0);

	NextBus_In:		in Bus_t(255 downto 0);
	PrevBus_In:		in Bus_t(255 downto 0);

	NextAddr:		out std_logic_vector(7 downto 0);
	PrevAddr:		out std_logic_vector(7 downto 0)
	);

end WindowSelect;

architecture Behavioral of WindowSelect is

begin

	NextAddr 	<= NextBus_In(to_integer(unsigned(CurAddr)));
	PrevAddr	<= PrevBus_In(to_integer(unsigned(CurAddr)));

end Behavioral;
