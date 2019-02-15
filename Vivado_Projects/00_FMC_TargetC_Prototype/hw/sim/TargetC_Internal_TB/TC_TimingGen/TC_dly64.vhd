Library IEEE;
USE IEEE.Std_logic_1164.all;

entity TC_dly64 is
   port(
      SSPIN :   in std_logic;
      SSTIN:    in std_logic;

      SSPOUT :  out std_logic;
      SSTOUT :  out std_logic ;

      SMTn:     out std_logic_vector(63 downto 0);
      SMTp:     out std_logic_vector(63 downto 0);

      TMK:      out std_logic_vector(63 downto 0)
   );
end TC_dly64;

architecture Behavioral of TC_dly64 is

    component TC_dly1 is
       port(
          SSPIN :   in std_logic;
          SSTIN:    in std_logic;

          SSPOUT :  out std_logic;
          SSTOUT :  out std_logic ;

          SMTn:     out std_logic;
          SMTp:     out std_logic;

          TMK:      out std_logic
       );
    end component;

        signal SSPIN_intl : std_logic_vector(63 downto 0);
        signal SSTIN_intl : std_logic_vector(63 downto 0);

begin

    SSPIN_intl(0) <= SSPIN;
    SSTIN_intl(0) <= SSTIN;

    GEN_dly1 : for I in 0 to 62 generate
        UX : TC_dly1
        port map(
            SSPIN   => SSPIN_intl(I),
            SSTIN   => SSTIN_intl(I),

            SSPOUT   => SSPIN_intl(I+1),
            SSTOUT   => SSTIN_intl(I+1),

            SMTn    => SMTn(I),
            SMTp    => SMTp(I),

            TMK    => TMK(I)
        );
    end generate;

    SSPOUT <= SSPIN_intl(63);
    SSTOUT <= SSTIN_intl(63);


end Behavioral;
