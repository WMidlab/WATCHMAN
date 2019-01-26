-- -----------------------------------------------------------
--!@FILE: 	counter_En.vhd
--!@AUTHOR: Jonathan Hendriks
--!@DATE: 	24th of January 2019
-- -----------------------------------------------------------
--!@DESCRIPTION:
--! Counter with enable input
--! enable = 1 counter keeps counting
--! enable = 0 counter is equal to zero
-- -----------------------------------------------------------

--Librairies
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Entity
entity Counter_En is
	generic(
		NBITS : integer := 8
	);
	port(
		CLK : in  std_logic;
		RST : in  std_logic;
		EN : in std_logic;
		Q : out std_logic_vector(NBITS-1 downto 0)
	);
end Counter_En;

--architecture
architecture behavioral of Counter_En is

	-- -------------------------------------------------------------
	-- SIGNALS
	signal cnt: std_logic_vector(NBITS-1 downto 0);

begin

	process (CLK, RST)
	begin
		if RST = '0' then
			cnt <= (others => '0');
		else
			if rising_edge(clk) then
				if EN = '0' then
					cnt <= (others => '0');
				else
					cnt <= std_logic_vector(unsigned(cnt) + 1);
				end if;
			end if;
		end if;
	end process;

	Q <= cnt;

end architecture;
