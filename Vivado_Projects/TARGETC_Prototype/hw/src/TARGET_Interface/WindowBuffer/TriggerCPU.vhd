library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity TriggerCPU is
	generic(	
		MIN_LE_TIME : integer := 3;	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
		MIN_TE_TIME : integer := 1; -- 4 ns after falling of trigger
		MAX_LONGPULSE : integer := 16		-- If pulse is longer than 64 ns
	);
	Port(
	nrst : 		in	std_Logic;
	clk  : 		in	std_logic;
	Trigger :	in 	std_logic;
	TrigCLR:	in 	std_logic;
	
	SCnt :		in	std_logic_vector(3 downto 0);
	
	wr1_trig:		out std_logic;
	wr2_trig:		out std_logic;
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
end TriggerCPU;

architecture implementation of TriggerCPU is

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

	signal TriggerSignal : 	std_logic_vector(15 downto 0);
	signal TriggerSignal_intl : 	std_logic_vector(15 downto 0);
		
	signal lastbus :		std_logic_vector(1 downto 0);
	
    signal Next_EvenOdd, Prev_EvenOdd, Trig_EvenOdd :std_logic;
    
begin

	-- Update Trigger Signals
	process(nRST,SCnt)
	begin
		if nRST = '0' then
			TriggerSignal_intl <= (others => '0');
		else
			case SCnt is
				when x"0" =>
					TriggerSignal_intl(0) <= Trigger;
				when x"1" =>
					TriggerSignal_intl(1) <= Trigger;
				when x"2" =>
					TriggerSignal_intl(2) <= Trigger;
				when x"3" =>
					TriggerSignal_intl(3) <= Trigger;
				when x"4" =>
					TriggerSignal_intl(4) <= Trigger;
				when x"5" =>
					TriggerSignal_intl(5) <= Trigger;
				when x"6" =>
					TriggerSignal_intl(6) <= Trigger;
				when x"7" =>
					TriggerSignal_intl(7) <= Trigger;
				when x"8" =>
					TriggerSignal_intl(8) <= Trigger;
				when x"9" =>
					TriggerSignal_intl(9) <= Trigger;
				when x"A" =>
					TriggerSignal_intl(10) <= Trigger;
				when x"B" =>
					TriggerSignal_intl(11) <= Trigger;
				when x"C" =>
					TriggerSignal_intl(12) <= Trigger;
				when x"D" =>
					TriggerSignal_intl(13) <= Trigger;
				when x"E" =>
					TriggerSignal_intl(14) <= Trigger;
				when x"F" =>
					TriggerSignal_intl(15) <= Trigger;
				when others =>
					TriggerSignal_intl <= (others => '0');
			end case;
		end if;
	end process;
	
	TriggerSignal <= TriggerSignal_intl when TrigCLR = '0' else (others => '0');

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
	last 		=> lastbus(0),
	
	-- Next Side
	nexttrigger => Trig_EvenOdd,
	NEXTWDO_OUT => Next_EvenOdd,
	PREVWDO_IN 	=> Prev_EvenOdd,
	
	-- Previous Side
	
	prevtrigger => prevtrigger,
	PREVWDO_OUT => PREVWDO_OUT,
	NEXTWDO_IN 	=> NEXTWDO_IN
	
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
	last 		=> lastbus(1),
	
	-- Next Side
	nexttrigger => nexttrigger,
	NEXTWDO_OUT => NEXTWDO_OUT,
	PREVWDO_IN 	=> PREVWDO_IN,
	
	-- Previous Side
	
	prevtrigger => Trig_EvenOdd,
	PREVWDO_OUT => Prev_EvenOdd,
	NEXTWDO_IN 	=> Next_EvenOdd 
	
	);
	
	last <= '0' when lastbus = "00" else '1';

end implementation;
