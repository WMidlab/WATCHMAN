library ieee; 
use ieee.std_logic_1164.all; 
 
entity shift is 
  port(
  	C, SI : in  std_logic; 
    SO : out std_logic); 
end shift; 
architecture archi of shift is 
  signal tmp: std_logic_vector(18 downto 0) := (others => '0'); 
  begin 
    process (C) 
      begin 
        if (C'event and C='1') then 
          for i in 0 to 17 loop 
            tmp(i+1) <= tmp(i); 
          end loop; 
          tmp(0) <= SI;
          SO <= tmp(18);  
        end if; 
    end process; 
end archi; 

