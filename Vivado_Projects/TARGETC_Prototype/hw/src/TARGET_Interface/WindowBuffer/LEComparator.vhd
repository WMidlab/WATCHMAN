
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity LEComparator is
	generic(
		MIN_LE_TIME : integer := 2	-- All times are x4 ns so 2 is equal to 8ns = 8 samples before rise of trigger
	);
	Port (
	nrst : 			in	std_Logic;

	trigger :		in 	std_logic;
	samplecnt:		in 	std_logic_vector(3 downto 0);

	state :			out	std_logic_vector(3 downto 0)
	);

end LEComparator;

architecture Behavioral of LEComparator is

	component compare is
	port(    
		a : 	in std_logic_vector(3 downto 0);  --input 1
		b :	 	in std_logic_vector(3 downto 0);  --input 2
		clk:	in std_logic;
		nrst:	in std_logic;
		aLTb :   out std_logic;   -- indicates first number is small
		equal :  out std_logic;   -- both are equal
		aGTb :   out std_logic    -- indicates first number is bigger
	);
	end component compare;
	
	signal CntWDO512 : std_logic_vector(3 downto 0);

	signal state_intl : std_logic_vector(3 downto 0);
	signal samplecnt_intl : std_logic_vector(3 downto 0);
	signal trigger_dly : std_logic;
begin
	
	process(trigger)
	begin
		if trigger = '1' then
			samplecnt_intl <= samplecnt;
			trigger_dly <= '1';
		end if;
		trigger_dly <= '0';
	end process;
		


	LE512 : compare
	port map(    
		a 		=> CntWdo512,
		b 		=> std_logic_vector(to_unsigned(MIN_LE_TIME,4)),
		clk		=> trigger_dly,
		nrst	=> nrst,
		aLTb 	=> state_intl(2),
		equal 	=> state_intl(1),
		aGTb 	=> state_intl(0)
	);	
	
	
	CntWdo512 <= '0' & samplecnt_intl(2 downto 0);
	state_intl(3) <= samplecnt_intl(3);
	
	state <= state_intl;
	
	
end Behavioral;
