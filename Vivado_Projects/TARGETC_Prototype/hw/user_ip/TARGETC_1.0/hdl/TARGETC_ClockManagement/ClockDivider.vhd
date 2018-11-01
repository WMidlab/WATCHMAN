library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity ClkDivider is
	generic(
		MINFREQKHZ:	integer := 15625;
		OPFREQKHZ:	integer := 375000	
	);
	port ( 
		clk_i: 	in	std_logic;
		rst: 	in	std_logic;
		div:	in	std_logic_vector(31 downto 0);
		clk_o: 	out	std_logic
	);
end ClkDivider;
  
architecture behaviour of ClkDivider is
  
	signal cnt:		std_logic_vector(31 downto 0) := (others =>'0');
	signal maxcnt:	std_logic_vector(31 downto 0);
	signal tmp : std_logic := '0';
  
begin
  
  	process(clk_i)
  	begin
  		if (OPFREQKHZ/MINFREQKHZ) < to_integer(unsigned(div)) then
  			maxcnt <= std_logic_vector(to_unsigned(OPFREQKHZ/MINFREQKHZ, maxcnt'length));
  		else
  			maxcnt <= div;
  		end if;
  	end process;
  
	process(clk_i,rst)
	begin
		if(rst ='0') then
			cnt <= (others => '0');
			tmp<='0';
		else
			if rising_edge(clk_i) then
				cnt <= std_logic_vector(unsigned(cnt) + 1);
				if (cnt = std_logic_vector(unsigned (maxcnt)-1)) then
					tmp <= NOT tmp;
					cnt <= (others => '0');
				end if;
			end if;
		end if;
		
	end process;
  
  	clk_o <= clk_i when maxcnt = x"00000000" else tmp;
end behaviour;
