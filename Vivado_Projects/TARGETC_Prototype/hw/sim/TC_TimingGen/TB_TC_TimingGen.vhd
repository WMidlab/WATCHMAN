library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;


entity TB_TC_TimingGen is
end TB_TC_TimingGen;

architecture implementation of TB_TC_TimingGen is

	component TC_dly64 is
	   port(
	      SSPIN :   in std_logic;
	      SSTIN:    in std_logic;

	      SSPOUT :  out std_logic;
	      SSTOUT :  out std_logic ;

	      SMTn:     out std_logic_vector(63 downto 0);
	      SMTp:     out std_logic_vector(63 downto 0);

	      TMK:      out std_logic_vector(63 downto 0)
	   );
	end component;

	signal SSPIN_sti	:std_logic;
	signal SSTIN_sti    : std_logic;


    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';

	constant SSTIN_sti_PERIOD : time := 64*10 ns;


begin
	DUT : TC_dly64
	   port map(
	      SSPIN 	=> SSPIN_sti,
	      SSTIN 	=> SSTIN_sti,

	      SSPOUT 	=> open,
	      SSTOUT 	=> open,

	      SMTn 	=> open,
	      SMTp 	=> open,

	      TMK 	=> open
	   );

	-- Clock generation
    clock_generator(SSTIN_sti,simulation_end_s, SSTIN_sti_PERIOD);

	SSPIN_sti <= transport SSTIN_sti after 2*10 ns;

	tb : process
		variable test : integer	:= 0;
	begin
		simulation_end_s <= '0';
		-- USER DEFINE



		wait;
		simulation_end_s <= '1';
    	wait;
	end process;

end implementation;
