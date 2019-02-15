Library IEEE;
USE IEEE.Std_logic_1164.all;

entity RisingEdge_DFlipFlop is 
   port(
      Q : out std_logic;
      nQ: out std_logic;    
      Clk :in std_logic;   
      D :in  std_logic ;
      nrst : in std_logic   
   );
end RisingEdge_DFlipFlop;
architecture Behavioral of RisingEdge_DFlipFlop is  
begin  
 process(Clk,nrst)
 begin 
 	if(nrst = '0') then
 		Q <= '0';
 		nQ <= '1';
    else
    	if(rising_edge(Clk)) then
   		Q <= D; 
   		nQ <= not D;
    	end if;
    end if;       
 end process;  
end Behavioral; 
