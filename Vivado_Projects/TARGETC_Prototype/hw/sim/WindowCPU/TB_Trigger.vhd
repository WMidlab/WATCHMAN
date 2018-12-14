library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity TB_Trigger is
end TB_Trigger;

architecture implementation of TB_Trigger is

	component TC_ClockManagementV2 is
	port (
	-- TARGET C Ports for control and function
		nrst:			in	std_logic;
		clk1:			in 	std_logic;	-- Clock for the TARGETC SCLK
		clk2:			in 	std_logic;	-- Clock for the TARGETC SCLK

		WL_CLK_DIV:		in 	std_logic_vector(31 downto 0); -- Clock Divider Through DFF

		PLL_LOCKED:		out	std_logic;

		ClockBus:		out T_ClockBus;

		Timecounter:	out std_logic_vector(63 downto 0);

		HSCLKdif:		in std_logic;		-- Pin#43 to Pin#44

		-- LVDS Differential Pair
		HSCLK_P:		out std_logic;		-- Pin#43
		HSCLK_N:		out std_logic;		-- Pin#44

		WL_CLK_P:		out std_logic;		-- Pin#57
		WL_CLK_N:		out std_logic;		-- Pin#58

		SSTIN_P:		out std_logic;		-- Pin#125
		SSTIN_N:		out std_logic		-- Pin#126

	);
	end component TC_ClockManagementV2;

	component Trigger is
		generic(
			MIN_LE_TIME : integer := 2;			-- All times are x4 ns so 2 is equal to 8ns = 8 samples
			MIN_TE_TIME : integer := 1;
			MAX_LONGPULSE : integer := 16		-- If pulse is longer than 64 ns
		);
		Port (
		nrst : 			in	std_Logic;

	--	SSTIN:			in std_logic;
		CLK:			in 	std_logic;

		trigger :		in 	std_logic;
		samplecnt:		in 	std_logic_vector(3 downto 0);

		longpulse:		out std_logic;
		prevWdo :		out std_logic;
		currWdo :		out std_logic;
		nextWdo :		out std_logic
		);

	end component Trigger;


	-- -------------------------------------------------------------
	-- SIGNALS
	-- -------------------------------------------------------------

	signal nrst :  std_logic;
	signal clk      : std_logic;
	signal RefCLK :	std_logic;
	signal clockbus_intl: T_ClockBus;
	signal timecounter_intl : std_logic_vector(63 downto 0);

	signal trigger_sti : std_logic;
    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';


	constant CLK_PERIOD : time := 4 ns;
	constant CLK100MHz_PERIOD	: time := 10 ns;
	
	signal clk1GHz      : std_logic;
	signal PLL_LOCKED_intl : std_logic;
	constant CLK1GHz_Period : time := 1 ns;
	signal cnt1ns : integer;
	
	signal sync : std_logic;
begin

	sync <= '1' when timecounter_intl(3 downto 0) = "0000" and ClockBus_intl.SSTIN = '1' else '0';
	
	TC_ClockMgmt_inst : TC_ClockManagementV2
	port map(
		nrst				=> nrst,
		clk1		 		=> RefCLK,
		clk2		 		=> RefCLK,
		WL_CLK_DIV 		=> (others =>'0'),
		PLL_LOCKED		=> PLL_LOCKED_intl,
		--PLL_LOCKED		=> Test,

		ClockBus	=> ClockBus_intl,

		timecounter		=> timecounter_intl,

		HSCLKdif		=> '0',
		-- LVDS Differential Pair
		HSCLK_P 		=> open,
		HSCLK_N 		=> open,

		WL_CLK_P 		=> open,
		WL_CLK_N 		=> open,

		SSTIN_P 		=> open,
		SSTIN_N 		=> open
	);

	Trigger_inst : Trigger
	generic map(
		MIN_LE_TIME => 2,			-- All times are x4 ns so 2 is equal to 8ns = 8 samples
		MIN_TE_TIME =>	2,
		MAX_LONGPULSE =>	16		-- If pulse is longer than 64 ns
	)
	Port map(
		nrst 	=> nrst,
		CLK		=> ClockBus_intl.CLK250MHz,

		trigger => trigger_sti,
		samplecnt	=> timecounter_intl(3 downto 0),

		longpulse	=> open,
		prevWdo	=> open,
		currWdo => open,
		nextWdo	=> open
		);

	-- Clock generation
    clock_generator(clk,simulation_end_s, CLK_PERIOD);
	clock_generator(Refclk,simulation_end_s, CLK100MHz_PERIOD);
	clock_generator(Clk1Ghz,simulation_end_s, CLK1Ghz_PERIOD);

	process(Clk1Ghz,nRST,sync)
	begin
		if nRST = '0' then
			cnt1ns <= 0;
		else
			if falling_edge(CLK1GHz) and PLL_LOCKED_intl = '1' then
				cnt1ns <= cnt1ns + 1;
			end if;
			
			if rising_edge(sync) then
				cnt1ns <= 0;
			end if;
		end if;
	end process;


	tb : process
	
		procedure SET_TRIGGER(
			--signal Cnt : in std_ulogic_vector(3 downto 0);
			Ref : in integer;
			signal Clk	: in std_logic;
			length : in integer;
			signal trig : out std_ulogic
		) is
		
		begin
			wait until rising_edge(clk);
			wait until timecounter_intl(3 downto 0) = std_logic_vector(to_unsigned(Ref,4));
			trig <= '1';
			for I in 0 to length-1 loop
				wait until rising_edge(clk);	
			end loop;
			trig <= '0';
		end SET_TRIGGER;
	
		variable test : integer	:= 0;
	begin
		simulation_end_s <= '0';
		nrst <= '0';
		trigger_sti <= '0';
		wait for 1 us;
		nrst <= '1';
		wait for 2 us;

		for I in 0 to 16 loop
			SET_TRIGGER(I,ClockBus_intl.CLK250MHz,1,trigger_sti);
			wait for 500 ns;
		end loop;

    	wait;
	end process;

end implementation;
