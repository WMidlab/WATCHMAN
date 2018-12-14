
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity TE_LUT8 is
	generic(
	--	SG_ID : std_logic := 0;
--		MIN_LE_TIME : integer := 3	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
		MIN_TE_TIME : integer := 1 -- 4 ns after falling of trigger
	--	MAX_LONGPULSE : integer := 16		-- If pulse is longer than 64 ns
	);
	Port (
	nrst : 		in	std_Logic;
	SCnt:		in 	std_logic_vector(3 downto 0);
	trigger :	in std_logic;
	
	wr1_trig :		out std_logic;
	wr2_trig :		out std_logic;
	prevWdo :	out	std_logic;
	nextWdo :	out	std_logic
	
	);

end TE_LUT8;

architecture Behavioral of TE_LUT8 is

	
begin

	process(trigger, nRST)
	begin
		if nrst = '0' then
			wr1_trig <= '1';
			wr2_trig <= '1';
			prevWdo <= '0';
			nextWdo <= '0';
		else
			if falling_edge(trigger) then
				
				prevWdo <= '0';
				
				if SCnt(3) = '0' then 
					wr1_trig <= '0';
					wr2_trig <= '1';
				else
					wr1_trig <= '1';
					wr2_trig <= '0';
				end if;
				
				-- Previous Window or not
				if to_integer(unsigned(Scnt(2 downto 0))) > (7-MIN_TE_TIME) then
					nextWdo <= '1';
				else
					nextWdo <= '0';
				end if;
					
			end if;
		end if;
	end process;
end Behavioral;
