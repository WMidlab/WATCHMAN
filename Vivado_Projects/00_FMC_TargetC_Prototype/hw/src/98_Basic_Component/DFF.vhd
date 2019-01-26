-- -----------------------------------------------------------
--!@FILE: 	DFF.vhd
--!@AUTHOR: Jonathan Hendriks
--!@DATE: 	21st of January 2019
-- -----------------------------------------------------------
--!@DESCRIPTION:
--! D_Flip_Flop with Q and nQ with nRST
-- -----------------------------------------------------------

--Librairies
Library IEEE;
USE IEEE.Std_logic_1164.all;

-- Entity
entity DFF is
   port(
      Q : out std_logic;
      nQ: out std_logic;
      Clk :in std_logic;
      D :in  std_logic ;
      nrst : in std_logic
   );
end DFF;

-- architecture
architecture Behavioral of DFF is
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
