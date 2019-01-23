library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.WindowCPU_PKG.all;
use work.TARGETC_pkg.all;

entity TRIGGER_CONTROLLER is
	Generic(
		LONG_TRIGGER: integer := 32
	);
	Port (
	nrst : 			in	STD_Logic;
	clk:			in	std_Logic;

	trigger : 		in std_logic_vector(3 downto 0);
	TriggerInfo :		out std_logic_vector(11 downto 0)
	);

end TRIGGER_CONTROLLER;

architecture Behavioral of TRIGGER_CONTROLLER is

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

	-- Optimization for LUT reduction
	signal TrigInfo_A : t_triggerinformationSingle;
	signal TrigInfo_B : t_triggerinformationSingle;
	signal TrigInfo_C : t_triggerinformationSingle;
	signal TrigInfo_D : t_triggerinformationSingle;

begin

	TrigA_inst : SingleTrigger
	generic map(
		LONG_TRIGGER => LONG_TRIGGER	-- 250MHz = 4ns for 64 ns = 16 counts = 2 windows, max is 4 windows = 32 counts
	)
	Port map(
		nrst => nrst,
		clk	=> clk,

		trigger => trigger(0),
		TrigInfo_OUT	=> TrigInfo_A
	);

	TrigB_inst : SingleTrigger
	generic map(
		LONG_TRIGGER => LONG_TRIGGER	-- 250MHz = 4ns for 64 ns = 16 counts = 2 windows, max is 4 windows = 32 counts
	)
	Port map(
		nrst => nrst,
		clk	=> clk,

		trigger => trigger(1),
		TrigInfo_OUT	=> TrigInfo_B
	);

	TrigC_inst : SingleTrigger
	generic map(
		LONG_TRIGGER => LONG_TRIGGER	-- 250MHz = 4ns for 64 ns = 16 counts = 2 windows, max is 4 windows = 32 counts
	)
	Port map(
		nrst => nrst,
		clk	=> clk,

		trigger => trigger(2),
		TrigInfo_OUT	=> TrigInfo_C
	);

	TrigD_inst : SingleTrigger
	generic map(
		LONG_TRIGGER => LONG_TRIGGER	-- 250MHz = 4ns for 64 ns = 16 counts = 2 windows, max is 4 windows = 32 counts
	)
	Port map(
		nrst => nrst,
		clk	=> clk,

		trigger => trigger(3),
		TrigInfo_OUT	=> TrigInfo_D
	);

	TriggerInfo(11) <= TrigInfo_D.long;
	TriggerInfo(10) <= TrigInfo_C.long;
	TriggerInfo(9) <= TrigInfo_B.long;
	TriggerInfo(8) <= TrigInfo_A.long;

	TriggerInfo(7) <= TrigInfo_D.last;
	TriggerInfo(6) <= TrigInfo_C.last;
	TriggerInfo(5) <= TrigInfo_B.last;
	TriggerInfo(4) <= TrigInfo_A.last;

	TriggerInfo(3) <= TrigInfo_D.trig;
	TriggerInfo(2) <= TrigInfo_C.trig;
	TriggerInfo(1) <= TrigInfo_B.trig;
	TriggerInfo(0) <= TrigInfo_A.trig;

end Behavioral;
