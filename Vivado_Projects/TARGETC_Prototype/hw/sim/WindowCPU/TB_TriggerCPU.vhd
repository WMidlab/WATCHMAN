library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity TB_TriggerCPU is
end TB_TriggerCPU;

architecture implementation of TB_TriggerCPU is


	component TriggerCPU is
	generic(
		ADDRESS : integer := 0;
		MIN_LE_TIME : integer := 3;	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
		MIN_TE_TIME : integer := 1; -- 4 ns after falling of trigger
		MAX_LONGPULSE : integer := 16		-- If pulse is longer than 64 ns
	);
	Port(
	nrst : 		in	std_Logic;
	clk  : 		in	std_logic;
	Trigger :	in 	std_logic;
	--TrigCLR:	in 	std_logic;

	CurAddr:	in 	std_logic_vector(7 downto 0);
	SCnt :		in	std_logic_vector(3 downto 0);

	wr1_trig:		out std_logic;
	wr2_trig:		out std_logic;
	last :			out std_logic;

	valid_o		: out std_logic;
	response_i	: in std_logic;

	-- Next Side
	nexttrigger :	out	std_logic;
	NEXTWDO_OUT :	out	std_logic;
	PREVWDO_IN :	in	std_logic;

	-- Previous Side

	prevtrigger :	in	std_logic;
	PREVWDO_OUT :	out	std_logic;
	NEXTWDO_IN :	in	std_logic
	);
	end component TriggerCPU;


	-- -------------------------------------------------------------
	-- SIGNALS
	-- -------------------------------------------------------------

	signal nrst :  std_logic;
	signal clk      : std_logic;

	signal Trigger_sti, TrigCLR_sti : std_logic;

    signal prevtrigger_sti: std_logic;
    signal nexttrigger_obs: std_logic;

   	signal NEXTWDO_OUT_obs, NEXTWDO_IN_sti: std_logic;
	signal PREVWDO_OUT_obs, PREVWDO_IN_sti: std_logic;

	signal valid_obs, response_sti : std_logic;

    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';
	signal Scnt : std_logic_vector(3 downto 0);
	signal CurAddr : std_logic_vector(7 downto 0);

	constant CLK_PERIOD : time := 10 ns;

begin

	DUT : TriggerCPU
	generic map(
		ADDRESS => 0,
		MIN_LE_TIME => 3,
		MIN_TE_TIME => 1,
		MAX_LONGPULSE => 16
	)
	Port map(
	nrst => nrst,
	clk  => clk,
	Trigger 	=> Trigger_sti,
	--TrigCLR		=> TrigCLR_sti,

	CurAddr => CurAddr,
	SCnt 	=> SCnt,

	wr1_trig	=> open,
	wr2_trig	=> open,
	last		=> open,

	valid_o		=> valid_obs,
	response_i	=> response_sti,

	-- Next Side
	nexttrigger => nexttrigger_obs,
	NEXTWDO_OUT => NEXTWDO_OUT_obs,
	PREVWDO_IN 	=> PREVWDO_IN_sti,

	-- Previous Side

	prevtrigger => prevtrigger_sti,
	PREVWDO_OUT => PREVWDO_OUT_obs,
	NEXTWDO_IN 	=> NEXTWDO_IN_sti
	);

	-- Clock generation
    clock_generator(clk,simulation_end_s, CLK_PERIOD);


	process(clk,nRST)
	begin
		if nRST = '0' then
			SCnt <= (others => '0');
			CurAddr <= (others => '0');
		else
			if rising_edge(clk) then
				SCnt <= std_logic_vector(unsigned(SCnt)+1);
				if SCnt = x"F" then
					CurAddr <= std_logic_vector(unsigned(CurAddr)+1);
					if CurAddr = x"10" then
						CurAddr <= (others => '0');
					end if;
				end if;
			end if;
		end if;
	end process;

	tb : process
	begin
		simulation_end_s <= '0';
		prevtrigger_sti <= '0';
		nrst <= '0';
		response_sti <= '0';
		Trigger_sti <= '0';
		TrigCLR_sti  <= '0';
		NEXTWDO_IN_sti <= '0';
		PREVWDO_IN_sti <= '0';
		wait for 3 us;
		nrst <= '1';
		wait for 5 us;

		report "Trigger on PREV";
		wait until rising_edge(Clk);
		wait until CurAddr = x"00";
		wait for CLK_PERIOD;
		trigger_sti <= '1';
		wait for 2*CLK_PERIOD;
		--trigger_sti <= '0';

		wait until valid_obs = '1';

		wait for 20*CLK_PERIOD;

		response_sti <= '1';
		wait until valid_obs = '0';
		wait for CLK_PERIOD;
		response_sti <= '0';
		wait for 10*CLK_PERIOD;
		trigger_sti <= '0';

		wait for 5 us;
		report "Trigger";
		wait until rising_edge(Clk);
		wait until CurAddr = x"00";
		wait for 9*CLK_PERIOD;
		trigger_sti <= '1';
		wait for 7*CLK_PERIOD;
		trigger_sti <= '0';


    	wait;
	end process;

end implementation;
