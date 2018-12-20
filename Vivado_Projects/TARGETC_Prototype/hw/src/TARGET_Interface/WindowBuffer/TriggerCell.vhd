
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity TriggerCell is
	generic(
		SG_ID : integer := 0;
		MIN_LE_TIME : integer := 3;	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
		MIN_TE_TIME : integer := 1; -- 4 ns after falling of trigger
		MAX_LONGPULSE : integer := 16		-- If pulse is longer than 64 ns
	);
	Port (
	nrst : 		in	std_Logic;
	clk  : 		in	std_logic;
	trigger :	in 	std_logic;
	nCLR :		in	std_logic;
	nREARM:		in 	std_logic;

	cell_en:	in  std_logic;

	wr_trig :		out std_logic;
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

end TriggerCell;

architecture Behavioral of TriggerCell is

	component LookupTable_LE is
	generic(
		MIN_LE_TIME : integer := 3	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
	);
	Port (
		SCnt:		in 	std_logic_vector(2 downto 0);
		prevWdo :	out	std_logic
	);
	end component LookupTable_LE;

	component LookupTable_TE is
	generic(
		MIN_TE_TIME : integer := 1
	);
	Port (
		SCnt:		in 	std_logic_vector(2 downto 0);
		NextWdo :	out	std_logic
	);
	end component LookupTable_TE;

	signal prevWdo_LE: std_logic;
	signal nextWdo_TE: std_logic;

	signal wr_trig_intl :		 std_logic;
	signal last_intl : std_logic;
	-- Next Side
	signal NEXTWDO_intl :		std_logic;
	signal trigger_intl : 		std_logic;

	-- Previous Side
	signal PREVWDO_intl :		std_logic;

	type t_cell_state is (
		IDLE,
		ENABLED,
		CLEARED,
		REARMED
	);
	signal Cell_stm : t_cell_state := IDLE;

begin

	LE_LUT_inst : 	LookupTable_LE
	generic map(
		MIN_LE_TIME => MIN_LE_TIME
	)
	port map(
		SCnt	=> std_logic_vector(to_unsigned(SG_ID,3)),
		prevWdo => prevWdo_LE
	);

	TE_LUT_inst : 	LookupTable_TE
	generic map(
		MIN_TE_TIME => MIN_TE_TIME
	)
	port map(
		SCnt	=> std_logic_vector(to_unsigned(SG_ID,3)),
		nextWdo => nextWdo_TE
	);


	process(nRST,CLK)
	begin
		if nRST = '0' then
			PREVWDO_intl <= '0';
			NEXTWDO_intl <= '0';

			last_intl <= '0';
			wr_trig_intl <= '1';
			trigger_intl <= '0';

			Cell_stm <= IDLE;
		else
			if falling_edge(CLK) then

				if cell_en = '1' then
					trigger_intl <= trigger;

					Cell_stm <= ENABLED;

					-- Leading Edge
					if trigger = '1' and prevTrigger = '0' then
						wr_trig_intl <= '0';
						PREVWDO_intl <= prevWdo_LE;
						NEXTWDO_intl <= '0';
						last_intl <= '0';
					end if;

					-- Middle
					--if (trigger = '1' and prevTrigger = '1') or (NEXTWDO_IN = '1') or (PREVWDO_IN = '1') then
					if (trigger = '1' and prevTrigger = '1') then
						wr_trig_intl <= '0';
						PREVWDO_intl <= '0';
						NEXTWDO_intl <= '0';
						last_intl <= '0';
					end if;

					-- Trailling Edge
					if trigger = '0' and prevTrigger = '1' then
							wr_trig_intl <= '0';
							PREVWDO_intl <= '0';
							NEXTWDO_intl <= nextWdo_TE;
							if(nextWdo_TE = '1' ) then
								last_intl <= '0';
							else
								last_intl <= '1';
							end if;
					end if;

					if trigger = '0' and prevTrigger = '0' then
						if NEXTWDO_IN = '1' or PREVWDO_IN = '1' then
							wr_trig_intl <= '0';
							if NEXTWDO_IN = '1' then
								last_intl <= '1';
							end if;
						else
							last_intl <= '0';
							PREVWDO_intl <= '0';
							NEXTWDO_intl <= '0';
							wr_trig_intl <= '1';
						end if;
					end if;
				else

					if ((NEXTWDO_IN = '1') or (PREVWDO_IN = '1')) and ((Cell_stm = IDLE) or (Cell_stm = ENABLED)) then
						Cell_stm <= ENABLED;
						wr_trig_intl <= '0';
						if NEXTWDO_IN = '1' then
							last_intl <= '1';
						end if;
					end if;

					if nCLR = '0' and Cell_stm = ENABLED then
						Cell_stm <= CLEARED;
						last_intl <= '0';
						wr_trig_intl <= '1';
						--trigger_intl <= '0';
					end if;

					if nREARM = '0' and Cell_stm = CLEARED then
						Cell_stm <= REARMED;
						PREVWDO_intl <= '0';
						NEXTWDO_intl <= '0';
						last_intl <= '0';
						wr_trig_intl <= '1';
						trigger_intl <= '0';
					end if;

					if Cell_stm = REARMED then
						Cell_stm <= IDLE;
					end if;

				end if;
			end if;
		end if;
	end process;

	last <= last_intl;
	nexttrigger <= trigger_intl;
	--nexttrigger <= trigger;
	wr_trig <= wr_trig_intl;
	PREVWDO_OUT <= PREVWDO_intl;
	NEXTWDO_OUT <= NEXTWDO_intl;

end Behavioral;
