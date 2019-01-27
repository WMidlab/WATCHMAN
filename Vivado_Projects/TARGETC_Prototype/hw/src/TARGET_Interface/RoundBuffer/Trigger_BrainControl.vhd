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
	SCnt:			in	std_logic_vector(2 downto 0);

	trigger : 		in std_logic_vector(3 downto 0);

	-- Interface to WindowCPU
	CurAddr:		in std_logic_vector(7 downto 0);
	PrevAddr:		in std_logic_vector(7 downto 0);
	NextAddr:		in std_logic_vector(7 downto 0);

	CPUMode:		in 	std_logic;
	CPUBus:			out	std_logic_vector(10 downto 0);
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

	signal trig_intl, trigdly_intl, last_intl, LE_intl, TE_intl : std_logic;
	signal flg_TE, flg_LE : std_logic;
	signal CPUBus_intl:			std_logic_vector(10 downto 0);
	signal NextAddr_intl, PrevAddr_intl:			std_logic_vector(7 downto 0);
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
		prevWdo => LE_intl
	);

	TE_LUT_inst : 	LookupTable_TE
	generic map(
		MIN_TE_TIME => MIN_TE_TIME
	)
	port map(
		clk	=> ClockBus.CLK250MHz,
		SCnt	=>  SCnt(2 downto 0),
		nextWdo => TE_intl
	);

--CPUMode
	TriggerInfo <=	(others => '0')	when CPUMode = '0' else
				TrigInfo_Bus;


	Trig_intl <= TrigInfo_Bus(0) or TrigInfo_Bus(1) or TrigInfo_Bus(2) or TrigInfo_Bus(3);

	Last_intl <= 	'1' when TrigInfo_Bus(7 downto 4) = "0001" else
					'1' when TrigInfo_Bus(7 downto 4) = "0010" else
					'1' when TrigInfo_Bus(7 downto 4) = "0100" else
					'1' when TrigInfo_Bus(7 downto 4) = "1000" else
					'0';

	CPUBus <= CPUBus_intl when CPUMode = '1' else (others => 'Z');

	-- Process for Clock the Address
	process(ClockBus.SSTIN)
	begin
		if rising_edge(ClockBus.SSTIN) then
			PrevAddr_intl 	<= CurAddr;
		end if;
	end process;

	--Process to send on CPUBus
	process(ClockBus.CLK250MHz)
	begin
		if rising_edge(ClockBus.CLK250MHz) then

			TrigDly_intl <= Trig_intl;

			if Trig_intl = '1' then
				--                     ________
				-- SSTIN CLOCK  ______|        |_________|
				--				Even   Odd      Even      Odd ...

				if ClockBus.SSTIN = '1' then
					--LE
					if TrigDly_intl = '0' and LE_intl='1' and flg_LE='0'  then
						CPUBus_intl <= CMD_WR2_MARKED & PrevAddr_intl;
						flg_LE <= '1';
					else
						CPUBus_intl <= CMD_WR1_MARKED & CurAddr;
					end if;
				else
					--TE
					if Last_intl = '1' and TE_intl='1' and flg_TE = '0' then
						CPUBus_intl <= CMD_WR1_MARKED & NextAddr;
						flg_TE <= '1';
					else
						CPUBus_intl <= CMD_WR2_MARKED & CurAddr;
					end if;
				end if;





			else
				flg_TE <= '0';
				flg_LE <= '0';
				CPUBus_intl <= CMD_NOP & x"00";
			end if;
		end if;
	end process;

end Behavioral;
