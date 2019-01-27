library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.WindowCPU_PKG.all;
use work.TARGETC_pkg.all;

entity TriggerBrainControl is
	Generic(
		NBRWINDOWS : integer := 16;
		MIN_LE_TIME : integer := 3;	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
		MIN_TE_TIME : integer := 1; -- 4 ns after falling of trigger
		MAX_TRIG_TIME: integer := 32
	);
	Port (
	nrst : 			in	STD_Logic;
	ClockBus:		in T_ClockBus;
	--timecounter:	in std_logic_vector(63 downto 0);
	SCnt:			in	std_logic_vector(2 downto 0);

	trigger : 		in std_logic_vector(3 downto 0);

	Trig_out:		out	std_logic;
	TrigDly :		out std_logic;
	Last_out:		out	std_logic;
	prevWdo_LE: 	out	std_logic;
	nextWdo_TE: 	out	std_logic;

	-- Interface to WindowCPU
	CPUMode:		in 	std_logic;
--	CPUBus:			out	std_logic_vector(10 downto 0);
	TriggerInfo :		out std_logic_vector(11 downto 0)

	);

end TriggerBrainControl;

architecture Behavioral of TriggerBrainControl is

	component SingleTrigger is
		generic(
			LONG_TRIGGER : integer := 32
		);
		Port (
		nrst : 			in	STD_Logic;

		clk:		in std_logic;

		trigger : 		in std_logic;
		TrigInfo_OUT:	out t_triggerinformationSingle

		);
	end component SingleTrigger;

	component LookupTable_LE is
	generic(
		MIN_LE_TIME : integer := 3	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
	);
	Port (
		clk:		in	std_logic;
		SCnt:		in 	std_logic_vector(2 downto 0);
		prevWdo :	out	std_logic
	);
	end component LookupTable_LE;

	component LookupTable_TE is
	generic(
		MIN_TE_TIME : integer := 1
	);
	Port (
		clk:		in	std_logic;
		SCnt:		in 	std_logic_vector(2 downto 0);
		NextWdo :	out	std_logic
	);
	end component LookupTable_TE;

	-- Optimization for LUT reduction
	signal cmp1_CntWindow512 : std_logic := '0';
	signal TrigInfo_Bus : std_logic_vector(11 downto 0);
	signal TrigInfo_A : t_triggerinformationSingle;
	signal TrigInfo_B : t_triggerinformationSingle;
	signal TrigInfo_C : t_triggerinformationSingle;
	signal TrigInfo_D : t_triggerinformationSingle;

	signal trig_intl : std_logic;
begin

	TrigA_inst : SingleTrigger
	generic map(
		LONG_TRIGGER => 32	-- 250MHz = 4ns for 64 ns = 16 counts = 2 windows, max is 4 windows = 32 counts
	)
	Port map(
		nrst => nrst,

		clk	=> ClockBus.CLK250MHz,

		trigger => trigger(0),
		TrigInfo_OUT	=> TrigInfo_A
	);

	TrigB_inst : SingleTrigger
	generic map(
		LONG_TRIGGER => 32	-- 250MHz = 4ns for 64 ns = 16 counts = 2 windows, max is 4 windows = 32 counts
	)
	Port map(
		nrst => nrst,

		clk	=> ClockBus.CLK250MHz,

		trigger => trigger(1),
		TrigInfo_OUT	=> TrigInfo_B
	);

	TrigC_inst : SingleTrigger
	generic map(
		LONG_TRIGGER => 32	-- 250MHz = 4ns for 64 ns = 16 counts = 2 windows, max is 4 windows = 32 counts
	)
	Port map(
		nrst => nrst,

		clk	=> ClockBus.CLK250MHz,

		trigger => trigger(2),
		TrigInfo_OUT	=> TrigInfo_C
	);

	TrigD_inst : SingleTrigger
	generic map(
		LONG_TRIGGER => 32	-- 250MHz = 4ns for 64 ns = 16 counts = 2 windows, max is 4 windows = 32 counts
	)
	Port map(
		nrst => nrst,

		clk	=> ClockBus.CLK250MHz,

		trigger => trigger(3),
		TrigInfo_OUT	=> TrigInfo_D
	);

	TrigInfo_Bus(11) <= TrigInfo_D.long;
	TrigInfo_Bus(10) <= TrigInfo_C.long;
	TrigInfo_Bus(9) <= TrigInfo_B.long;
	TrigInfo_Bus(8) <= TrigInfo_A.long;

	TrigInfo_Bus(7) <= TrigInfo_D.last;
	TrigInfo_Bus(6) <= TrigInfo_C.last;
	TrigInfo_Bus(5) <= TrigInfo_B.last;
	TrigInfo_Bus(4) <= TrigInfo_A.last;

	TrigInfo_Bus(3) <= TrigInfo_D.trig;
	TrigInfo_Bus(2) <= TrigInfo_C.trig;
	TrigInfo_Bus(1) <= TrigInfo_B.trig;
	TrigInfo_Bus(0) <= TrigInfo_A.trig;

	LE_LUT_inst : 	LookupTable_LE
	generic map(
		MIN_LE_TIME => MIN_LE_TIME
	)
	port map(
		clk	=> ClockBus.CLK250MHz,
		SCnt	=>  SCnt(2 downto 0),
		prevWdo => prevWdo_LE
	);

	TE_LUT_inst : 	LookupTable_TE
	generic map(
		MIN_TE_TIME => MIN_TE_TIME
	)
	port map(
		clk	=> ClockBus.CLK250MHz,
		SCnt	=>  SCnt(2 downto 0),
		nextWdo => nextWdo_TE
	);

--CPUMode
	TriggerInfo <=	(others => '0')	when CPUMode = '0' else
				TrigInfo_Bus;

	Trig_intl <= TrigInfo_Bus(0) or TrigInfo_Bus(1) or TrigInfo_Bus(2) or TrigInfo_Bus(3);
	Trig_out <= Trig_intl;

	Last_out <= 	'1' when TrigInfo_Bus(7 downto 4) = "0001" else
					'1' when TrigInfo_Bus(7 downto 4) = "0010" else
					'1' when TrigInfo_Bus(7 downto 4) = "0100" else
					'1' when TrigInfo_Bus(7 downto 4) = "1000" else
					'0';

	process( ClockBus.CLK250MHz)
	begin
		if rising_edge( ClockBus.CLK250MHz) then
			TrigDly <= Trig_intl;
		end if;
	end process;

	--Process to send on CPUBus
	-- process(ClockBus.CLK250MHz)
	-- begin
	-- 	if rising_edge(ClockBus.CLK250MHz) then
	-- 		if Trig = '1' then
	-- 			if ClockBus.SSTIN = '0' then
	-- 				CPUBus <= CMD_WR1_MARKED & CurAddr;
	-- 			else
	-- 				CPUBus <= CMD_WR2_MARKED & CurAddr;
	-- 			end if;
	--
	-- 			--LE
	-- 			if Trigdly = '0' and LE='1' and flg_LE='0'  then
	-- 				CPUBus <= CMD_WR2_MARKED & PrevAddr;
	-- 				flg_LE <= '1';
	-- 			end if;
	--
	-- 			--TE
	-- 			if Last = '1' and TE='1' and flg_TE = '0' then
	-- 				CPUBus <= CMD_WR1_MARKED & NextAddr;
	-- 				flg_TE <= '1';
	-- 			end if;
	-- 		else
	-- 			CPUBus <= CMD_NOP & x"00";
	-- 		end if;
	-- 	end if;
	-- end process;

end Behavioral;
