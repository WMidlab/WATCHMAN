library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity TriggerCPU is
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

	response_i : 	in	std_logic;
	valid_o	:		out	std_logic;

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
	nclr : 		in	std_Logic;
	nrearm : 		in	std_Logic;
	Trigger :	in 	std_logic;
	cells_en:	in std_logic_vector(7 downto 0);
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
	signal cells_en_intl : 	std_logic_vector(15 downto 0);

	signal wr1_trig_intl, wr1_trig_reg : std_logic;
	signal wr2_trig_intl, wr2_trig_reg : std_logic;

	signal lastbus :		std_logic_vector(1 downto 0);
	signal nclr_intl, nREARM_intl, last_reg :		std_logic;
    signal Next_EvenOdd, Prev_EvenOdd, Trig_EvenOdd :std_logic;

	type state_t is (
		IDLE,
		UPDATE,
		VALID,
		RESPVALID,
		REARM
	);

	signal trigger_stm : state_t := IDLE;
	signal Trigger_REG, PREV_REG, NEXT_REG : std_logic_vector(1 downto 0);
begin

	process(nRST,CLK)
	begin
		if nRST = '0' then
			wr1_trig_reg <= '1';
			wr2_trig_reg <= '1';
			last_reg <= '0';

			nCLR_intl <= '1';
			nREARM_intl <= '1';
			--Update Outputs
			wr1_trig <= '1';
			wr2_trig <= '1';
			last <= 	'0';

			valid_o <= '0';

			trigger_stm <= IDLE;
		else
			if rising_edge(clk)  then

				Trigger_Reg <= Trigger_REG(0) & Trigger;
				PREV_Reg	<= PREV_Reg(0) & PREVWDO_IN;
				NEXT_Reg	<= NEXT_Reg(0) & NEXTWDO_IN;

				case trigger_stm is
					when IDLE =>
						if CurAddr = std_logic_vector(to_unsigned(ADDRESS,8)) then
							trigger_stm <= UPDATE;

							wr1_trig_reg <= wr1_trig_intl;
							wr2_trig_reg <= wr2_trig_intl;

							if lastbus /= "00" or last_reg = '1' then
								last_reg <= '1';
							else
								last_reg <= '0';
							end if;

						-- elsif PREVWDO_IN = '1' then
						-- 	trigger_stm <= VALID;
						--
						-- 	--Update Outputs
						-- 	wr1_trig <= '1';
						-- 	wr2_trig <= '0';
						-- 	last <= 	'0';
						--
						-- 	nCLR_intl <= '0';
						else
							if wr1_trig_intl = '0' or wr2_trig_intl = '0' then
								trigger_stm <= VALID;

								wr1_trig <= wr1_trig_intl;
								wr2_trig <= wr2_trig_intl;

								if lastbus /= "00" then
									last <= '1';
								else
									last <= '0';
								end if;

								nCLR_intl <= '0';
							else
								trigger_stm <= IDLE;
							end if;
						end if;
					when UPDATE =>
						if CurAddr = std_logic_vector(to_unsigned(ADDRESS,8)) then


							wr1_trig_reg <= wr1_trig_intl;
							wr2_trig_reg <= wr2_trig_intl;

							if lastbus /= "00" or last_reg = '1' then
								last_reg <= '1';
							else
								last_reg <= '0';
							end if;

							if SCnt /= "1111"  then
								trigger_stm <= UPDATE;
							else
								if wr1_trig_reg = '0' or wr2_trig_reg = '0' then
									trigger_stm <= VALID;

									--Update Outputs
									wr1_trig <= wr1_trig_reg;
									wr2_trig <= wr2_trig_reg;
									last <= 	last_reg;

									nCLR_intl <= '0';
								else
									trigger_stm <= IDLE;
								end if;
							end if;
						else
							trigger_stm <= VALID;
							valid_o <= '1';
							--Update Outputs
							wr1_trig <= wr1_trig_reg;
							wr2_trig <= wr2_trig_reg;
							last <= 	last_reg;

							nCLR_intl <= '0';
						end if;
					when VALID =>
						nCLR_intl <= '1';

						-- Waiting on WindowCPU for response
						if (response_i = '0') then
							valid_o <= '1';
							trigger_stm <= VALID;
						else
							valid_o <= '0';
							trigger_stm <= RESPVALID;
						end if;
					when RESPVALID =>
						if (response_i = '0') then
							nCLR_intl <= '1';
							if ((Trigger_Reg = "01") or (Trigger_Reg = "11")) or ((PREV_Reg="01")or(PREV_Reg="11")) then
								nREARM_intl <= '1';
								trigger_stm <= RESPVALID;
							else
								nREARM_intl <= '0';
								trigger_stm <= REARM;

							end if;
						end if;
					when REARM =>
						nREARM_intl <= '1';
						trigger_stm <= IDLE;
					when others =>
				end case;

			end if;
		end if;
	end process;


	process(nRST,CurAddr,SCnt)
	begin
		if nRST = '0' then
			cells_en_intl <= (others => '0');
		else
			if CurAddr = std_logic_vector(to_unsigned(ADDRESS,8)) then
				if SCnt = "0000" then
					cells_en_intl <= x"0001";
				else
					cells_en_intl <= cells_en_intl(14 downto 0) & cells_en_intl(15);
				end if;
			else
				cells_en_intl <= (others => '0');
			end if;
		end if;
	end process;

	--nCLR_intl <= '1' when CurAddr = std_logic_vector(to_unsigned(ADDRESS,8)) else '0';

	WT_EVEN : WindowTrigger
	generic map(
		MIN_LE_TIME => 3,
		MIN_TE_TIME => 1,
		MAX_LONGPULSE => 16
	)
	Port map(
	nrst => nrst,
	nCLR => nCLR_intl,
	nREARM => nREARM_intl,
	clk  => clk,
	Trigger => Trigger,
	cells_en => cells_en_intl(7 downto 0),
	wr_en 		=> wr1_trig_intl,
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
	nCLR => nCLR_intl,
	nREARM => nREARM_intl,
	clk  => clk,
	Trigger => Trigger,
	cells_en => cells_en_intl(15 downto 8),

	wr_en 		=> wr2_trig_intl,
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

end implementation;
