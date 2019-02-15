Library IEEE;
USE IEEE.Std_logic_1164.all;

entity TC_dly1 is
   port(
      SSPIN :   in std_logic;
      SSTIN:    in std_logic;

      SSPOUT :  out std_logic;
      SSTOUT :  out std_logic ;

      SMTn:     out std_logic;
      SMTp:     out std_logic;

      TMK:      out std_logic
   );
end TC_dly1;

architecture Behavioral of TC_dly1 is

    signal Thigh :  std_logic;
    signal Tlow:    std_logic;

begin

Thigh   <= transport SSPIN after 6 ns;
Tlow    <= transport SSTIN after 6 ns;

TMK     <= transport Tlow after 2 ns;

SSTOUT  <= transport SSTIN after 10 ns;
SSPOUT  <= transport SSPIN after 10 ns;

SMTn    <= transport Thigh nand not(Tlow) after 4 ns;
SMTp    <= transport Thigh and not(Tlow) after 4 ns;

end Behavioral;
