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

	component T7_TMKpair is
	   port(
	      LE:   in  integer;
	      TE:   in  integer;

	      LE_SGN : in std_logic;
	      TE_SGN : in std_logic;

	      TMK:  in std_logic_vector(63 downto 0);

	      TMK_pulse:      out std_logic
	   );
   end component T7_TMKpair;

	signal SSPIN_sti	:std_logic;
	signal SSTIN_sti    : std_logic;

	signal SSPIN : std_logic;
	signal WR1_ADDR : std_logic;
	signal WR2_ADDR : std_logic;
	signal WR_STRB1 : std_logic;
	signal WR_STRB2 : std_logic;

	signal TMK_intl : std_logic_vector(63 downto 0);
	signal DlyCnt : integer := 0;
    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';

	constant SSTIN_sti_PERIOD : time := 64*10 ns;

	constant SSPIN_LE: 		integer := 51;
	constant SSPIN_TE: 		integer := 7;
	constant WR_STRB2_LE: 	integer := 56;
	constant WR_STRB2_TE: 	integer := 12;
	constant WR2_ADDR_LE: 	integer := 33;
	constant WR2_ADDR_TE: 	integer := 53;
	constant WR_STRB1_LE: 	integer := 20;
	constant WR_STRB1_TE: 	integer := 40;
	constant WR1_ADDR_LE: 	integer := 5;
	constant WR1_ADDR_TE: 	integer := 25;

begin
	DUT : TC_dly64
	   port map(
	      SSPIN 	=> SSPIN,
	      SSTIN 	=> SSTIN_sti,

	      SSPOUT 	=> open,
	      SSTOUT 	=> open,

	      SMTn 	=> open,
	      SMTp 	=> open,

	      TMK 	=> TMK_intl
	   );

	   SSPIN_inst : T7_TMKpair
    	   port map(
    	      LE	=> SSPIN_LE,
    	      TE	=> SSPIN_TE,
    	      LE_SGN => '0',
    	      TE_SGN => '0',
    	      TMK	=> TMK_intl,
    	      TMK_pulse	=> SSPIN
    	   );

		   WR1_ADDR_inst : T7_TMKpair
		    port map(
		  	 LE	=> WR1_ADDR_LE,
		  	 TE	=> WR1_ADDR_TE,
		  	 LE_SGN => '0',
		  	 TE_SGN => '0',
		  	 TMK	=> TMK_intl,
		  	 TMK_pulse	=> WR1_ADDR
		    );
			WR2_ADDR_inst : T7_TMKpair
		     port map(
		      LE	=> WR2_ADDR_LE,
		      TE	=> WR2_ADDR_TE,
		      LE_SGN => '0',
		      TE_SGN => '0',
		      TMK	=> TMK_intl,
		      TMK_pulse	=> WR2_ADDR
		     );
			 WR_STRB1_inst : T7_TMKpair
 		     port map(
 		      LE	=> WR_STRB1_LE,
 		      TE	=> WR_STRB1_TE,
 		      LE_SGN => '0',
 		      TE_SGN => '0',
 		      TMK	=> TMK_intl,
 		      TMK_pulse	=> WR_STRB1
 		     );
			 WR_STRB2_inst : T7_TMKpair
 		     port map(
 		      LE	=> WR_STRB2_LE,
 		      TE	=> WR_STRB2_TE,
 		      LE_SGN => '0',
 		      TE_SGN => '0',
 		      TMK	=> TMK_intl,
 		      TMK_pulse	=> WR_STRB2
 		     );
	-- Clock generation
    clock_generator(SSTIN_sti,simulation_end_s, SSTIN_sti_PERIOD);

	process
	begin
		DlyCnt <= 0;
		wait for 33*10 ns;
		loop
			DlyCnt <= DlyCnt + 1;
			if dlycnt >= 63 then
				dlycnt <= 0;
			end if;
			wait for 10 ns;
		end loop;
	end process;

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
