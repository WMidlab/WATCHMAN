
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.TARGETC_pkg.all;

entity TARGETC_SamplingStorage is
	Port ( 
	CLK : 			in  STD_LOGIC;
	RST : 			in	STD_Logic;
	
	-- Control/Command inputs
	SSTIN :			out std_logic;
	--eTPG :			in std_logic;
	
	WR_CS_S:		out std_logic_vector(1 downto 0);
	WR_RS_S:		out std_logic_vector(4 downto 0);
	
	);
	
end TARGETC_SamplingStorage;

architecture Behavioral of TARGETC_SamplingStorage is

	
begin
	

	
end Behavioral;

