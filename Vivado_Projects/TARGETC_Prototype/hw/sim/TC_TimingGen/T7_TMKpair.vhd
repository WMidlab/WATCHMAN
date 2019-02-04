Library IEEE;
USE IEEE.Std_logic_1164.all;

entity T7_TMKpair is
   port(
      LE:   in  integer;
      TE:   in  integer;

      LE_SGN : in std_logic;
      TE_SGN : in std_logic;

      TMK:  in std_logic_vector(63 downto 0);

      TMK_pulse:      out std_logic
   );
end T7_TMKpair;

architecture Behavioral of T7_TMKpair is

        signal TMK_LE : std_logic;
        signal TMK_TE : std_logic;
        signal clk : std_logic;
        signal nrst : std_logic;
begin

TMK_LE   <= TMK(LE);
TMK_TE   <= TMK(TE);

clk <= TMK_LE xor LE_SGN;
nrst <= not (TMK_TE xor TE_SGN);


process(clk, nRST)
begin
    if nrst = '0' then
        TMK_pulse <= '0';
    else
        if rising_edge(clk) then
            TMK_pulse <= '1';
        end if;
    end if;
end process;


end Behavioral;
