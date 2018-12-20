
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity WindowTrigger is
	generic(
		MIN_LE_TIME : integer := 3;	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
		MIN_TE_TIME : integer := 1; -- 4 ns after falling of trigger
		MAX_LONGPULSE : integer := 16		-- If pulse is longer than 64 ns
	);
	Port (
	nrst : 		in	std_Logic;
	nclr : 		in	std_Logic;
	nREARM:		in	std_logic;
	clk  : 		in	std_logic;
	cells_en:	in std_logic_vector(7 downto 0);
	Trigger :	in 	std_logic;

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

end WindowTrigger;

architecture Behavioral of WindowTrigger is

	component TriggerCell is
	generic(
		SG_ID : integer := 0;
		MIN_LE_TIME : integer := 3;	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
		MIN_TE_TIME : integer := 1; -- 4 ns after falling of trigger
		MAX_LONGPULSE : integer := 16		-- If pulse is longer than 64 ns
	);
	Port (
	nrst : 		in	std_Logic;
	nclr : 		in	std_Logic;
	nREARM :	in std_logic;
	cell_en:	in std_logic;
	clk      : 	in	std_logic;

	trigger :	in 	std_logic;

	wr_trig :		out std_logic;
	last :			out std_logic;

	-- Next Side
	NEXTWDO_OUT :	out	std_logic;
	PREVWDO_IN :	in	std_logic;

	-- Previous Side
	nexttrigger :	out	std_logic;
	prevtrigger :	in	std_logic;
	PREVWDO_OUT :	out	std_logic;
	NEXTWDO_IN :	in	std_logic

	);

	end component TriggerCell;

	signal wrtrigBus :		std_logic_vector(7 downto 0);
	signal lastBus :		std_logic_vector(7 downto 0);


	signal NEXTWDO_intl:	std_logic_vector(7 downto 0);
    signal PREVWDO_intl:	std_logic_vector(7 downto 0);

    signal TriggerBus:		std_logic_vector(6 downto 0);
begin

	TrigCell0 : TriggerCell
	generic map(
		SG_ID => 0,
		MIN_LE_TIME => 3,	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
		MIN_TE_TIME => 1, -- 4 ns after falling of trigger
		MAX_LONGPULSE => 16	-- If pulse is longer than 64 ns
	)
	Port map(
	nrst 	=> nrst,
	nCLR => nCLR,
	nREARM => nREARM,
	clk		=> clk,
	trigger 	=> Trigger,
	wr_trig 	=> wrtrigBus(0),
	last		=> lastBus(0),
	cell_en	=> cells_en(0),
	-- Next Side
	NEXTWDO_OUT => NEXTWDO_intl(0),
	PREVWDO_IN => '0',
	nexttrigger => TriggerBus(0),

	-- Previous Side
	prevtrigger => prevtrigger,
	PREVWDO_OUT => PREVWDO_intl(0),
	NEXTWDO_IN	=> NEXTWDO_IN
	);

	GEN_TriggerCell : for I in 1 to 6 generate
	TriggerCellX : TriggerCell
	generic map(
		SG_ID => I,
		MIN_LE_TIME => 3,	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
		MIN_TE_TIME => 1, -- 4 ns after falling of trigger
		MAX_LONGPULSE => 16	-- If pulse is longer than 64 ns
	)
	Port map(
	nrst 	=> nrst,
	nCLR => nCLR,
	nREARM => nREARM,
	clk		=> clk,
	trigger 	=> Trigger,
	wr_trig 	=> wrtrigBus(I),
	last		=> lastBus(I),
	cell_en	=> cells_en(I),
	-- Next Side
	NEXTWDO_OUT => NEXTWDO_intl(I),
	PREVWDO_IN => '0',
	nexttrigger => TriggerBus(I),

	-- Previous Side
	prevtrigger => TriggerBus(I-1),
	PREVWDO_OUT => PREVWDO_intl(I),
	NEXTWDO_IN	=> '0'
	);
	end generate;

	TrigCell7 : TriggerCell
	generic map(
		SG_ID => 7,
		MIN_LE_TIME => 3,	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
		MIN_TE_TIME => 1, -- 4 ns after falling of trigger
		MAX_LONGPULSE => 16	-- If pulse is longer than 64 ns
	)
	Port map(
	nrst 	=> nrst,
	nCLR => nCLR,
	nREARM => nREARM,
	clk		=> clk,
	trigger 	=> Trigger,
	wr_trig 	=> wrtrigBus(7),
	last		=> lastBus(7),
	cell_en	=> cells_en(7),

	-- Next Side
	NEXTWDO_OUT => NEXTWDO_intl(7),
	PREVWDO_IN => PREVWDO_IN,
	nexttrigger => nexttrigger,

	-- Previous Side
	prevtrigger => TriggerBus(6),
	PREVWDO_OUT => PREVWDO_intl(7),
	NEXTWDO_IN	=> '0'
	);

	PREVWDO_OUT <= '0' when PREVWDO_intl = x"00" else '1';
	NEXTWDO_OUT <= '0' when NEXTWDO_intl = x"00" else '1';

	wr_en 	<= '1' when wrtrigBus = x"FF" else '0';
	last 	<= '0' when lastBus = x"00" else '1';

end Behavioral;
