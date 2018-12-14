library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity TB_TriggerCell is
end TB_TriggerCell;

architecture implementation of TB_TriggerCell is

	
	component WindowTrigger is
	generic(	
		MIN_LE_TIME : integer := 3;	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
		MIN_TE_TIME : integer := 1; -- 4 ns after falling of trigger
		MAX_LONGPULSE : integer := 16		-- If pulse is longer than 64 ns
	);
	Port (
	nrst : 		in	std_Logic;
	clk  : 		in	std_logic;
	TriggerSignal :	in 	std_logic_vector(7 downto 0);
	
	wr_en :			out std_logic;
	last :			out std_logic;
	
	-- Next Side
	nexttrigger :	out	std_logic;
	NEXTWDO_OUT :	out	std_logic;
	PREVWDO_IN :	in	std_logic;
	
	-- Previous Side
	
	prevtrigger :	in	std_logic;
	PREVWDO_OUT :	out	std_logic;
	NEXTWDO_IN :	in	std_logic
	
	);
	end component WindowTrigger;

	
	-- -------------------------------------------------------------
	-- SIGNALS
	-- -------------------------------------------------------------

	signal nrst :  std_logic;
	signal clk      : std_logic;


	signal TriggerSignal : 	std_logic_vector(15 downto 0);
	signal last :		std_logic_vector(1 downto 0);
	
    signal wr1_trig, wr2_trig : std_logic;
    
    signal prevtrigger_sti: std_logic := '0';
    signal nexttrigger_obs: std_logic;
    
   	signal NEXTWDO_OUT_obs, NEXTWDO_IN_sti: std_logic;
	signal PREVWDO_OUT_obs, PREVWDO_IN_sti: std_logic;
    
    signal Next_EvenOdd, Prev_EvenOdd, Trig_EvenOdd :std_logic;
    
    
    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';
	signal Scnt : std_logic_vector(3 downto 0);

	constant CLK_PERIOD : time := 10 ns;
	
begin

	WT_EVEN : WindowTrigger
	generic map(	
		MIN_LE_TIME => 3,
		MIN_TE_TIME => 1,
		MAX_LONGPULSE => 16
	)
	Port map(
	nrst => nrst,
	clk  => clk,
	TriggerSignal => TriggerSignal(7 downto 0),
	
	wr_en 		=> wr1_trig,
	last 		=> last(0),
	
	-- Next Side
	nexttrigger => Trig_EvenOdd,
	NEXTWDO_OUT => Next_EvenOdd,
	PREVWDO_IN 	=> Prev_EvenOdd,
	
	-- Previous Side
	
	prevtrigger => prevtrigger_sti,
	PREVWDO_OUT => PREVWDO_OUT_obs,
	NEXTWDO_IN 	=> NEXTWDO_IN_sti
	
	);

	WT_ODD : WindowTrigger
	generic map(	
		MIN_LE_TIME => 3,
		MIN_TE_TIME => 1,
		MAX_LONGPULSE => 16
	)
	Port map(
	nrst => nrst,
	clk  => clk,
	TriggerSignal => TriggerSignal(15 downto 8),
	
	wr_en 		=> wr2_trig,
	last 		=> last(1),
	
	-- Next Side
	nexttrigger => nexttrigger_obs,
	NEXTWDO_OUT => NEXTWDO_OUT_obs,
	PREVWDO_IN 	=> PREVWDO_IN_sti,
	
	-- Previous Side
	
	prevtrigger => Trig_EvenOdd,
	PREVWDO_OUT => Prev_EvenOdd,
	NEXTWDO_IN 	=> Next_EvenOdd 
	
	);
	
	-- Clock generation
    clock_generator(clk,simulation_end_s, CLK_PERIOD);
	

	tb : process
		variable test : integer	:= 0;
	begin
		simulation_end_s <= '0';
		nrst <= '0';
		TriggerSignal <= (others => '0');
		NEXTWDO_IN_sti <= '0';
		PREVWDO_IN_sti <= '0';
		wait for 3 us;
		nrst <= '1';
		wait for 5 us;
		
		report "Trigger on All Stage";
		for I in 0 to 15 loop
			TriggerSignal(I) <= '1' after 1 ns;
			wait for CLK_PERIOD;
			TriggerSignal <= (others =>'0') after 1 ns;	
			wait for 16*CLK_PERIOD;
		end loop;
		
    	wait;
	end process;

end implementation;
