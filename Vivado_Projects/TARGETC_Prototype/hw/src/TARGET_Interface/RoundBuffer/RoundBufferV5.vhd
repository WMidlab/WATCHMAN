-- -----------------------------------------------------------
--!@FILE: 	RoundBufferV5.vhd
--!@AUTHOR: Jonathan Hendriks
--!@DATE: 	21st of January 2019
-- -----------------------------------------------------------
--!@DESCRIPTION:
--!
-- -----------------------------------------------------------
--!@VERSION:
--!
-- -----------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity RoundBufferV5 is
	generic(
		NBRWINDOWS : integer := 16
	);
	port(
	--	nrst : 			in	std_Logic;
		ClockBus:		in T_ClockBus;
		Timecounter:	in std_logic_vector(63 downto 0);

		trigger : 		in std_logic_vector(3 downto 0);

		WR_RS_S:		out std_logic_vector(1 downto 0);
		WR_CS_S:		out std_logic_vector(5 downto 0);

		CtrlBus_IxSL:		in 	T_CtrlBus_IxSL; --Outputs from Control Master

		RDAD_ReadEn  :in  std_logic;
		RDAD_DataOut : out std_logic_vector(85 downto 0);
		RDAD_Empty	: out std_logic;

		-- FIFO IN for Digiting
	    DIG_Full	: out	std_logic;
	    DIG_DataIn	: in	std_logic_vector(8 downto 0);
	    DIG_WriteEn	: in	std_logic;

		sDEBUG :	out std_logic_vector(7 downto 0)

	);
end RoundBufferV5;

architecture implementation of RoundBufferV5 is

	component WindowBrain is
		generic(
			ADDRESS : integer := 0
		);
		Port (

		nrst : 			in	std_Logic;
		nCLR :			in	std_Logic;
	--	SSTIN:			in std_logic;
		CLK:			in 	std_logic;

		--Window Part
		CPUBus :		in	std_logic_vector(10 downto 0);

		wr1_en:			out	std_logic;
		wr2_en:			out	std_logic;

		--CurAddr:		in 	std_logic_vector(7 downto 0);
		CurAddrBit:		in 	std_logic;
		--OldAddr:		in	std_logic_vector(7 downto 0);
		OldAddrBit:		in std_logic;

		PREVBus_IN :	in	std_logic;
		PREVBus_OUT :	out	std_logic;
		NEXTBus_IN :	in	std_logic;
		NEXTBus_OUT :	out	std_logic;

		NextAddr : 		out std_logic;
		PrevAddr :		out std_logic
		-- NextAddr : 		inout 	std_logic_vector(7 downto 0);
		-- PrevAddr :		inout 	std_logic_vector(7 downto 0)
		);

	end component WindowBrain;

	-- component WindowBrain_GEN is
	-- 	generic(
	-- 		NBRWINDOWS : integer := 16
	-- 	);
	-- 	Port (
	--
	-- 	nrst : 			in	std_Logic;
	-- 	CLR :			in	std_Logic;
	-- 	CLK:			in 	std_logic;
	--
	-- 	--Window Part
	-- 	CPUBus :		in	std_logic_vector(10 downto 0);
	--
	-- 	wr1_en:			out	std_logic;
	-- 	wr2_en:			out	std_logic;
	--
	-- 	CurAddrBit:		in 	std_logic_vector(NBRWINDOWS-1 downto 0);
	-- 	OldAddrBit:		in std_logic_vector(NBRWINDOWS-1 downto 0);
	--
	-- 	NextAddrBus : 		out std_logic_vector(7 downto 0);
	-- 	PrevAddrBus :		out std_logic_vector(7 downto 0)
	-- 	);
	-- end component WindowBrain_GEN;

	component WindowStoreV4 is
		Generic(
			NBRWINDOWS : integer := 16
		);
		Port (
		nrst : 			in	std_Logic;
		ClockBus:		in T_ClockBus;
		Timecounter:	in std_logic_vector(63 downto 0);

		ValidData:		in	std_logic;

		CPUBus:			in 	std_logic_vector(10 downto 0);
		CPUTime:		in	std_logic_vector(63 downto 0);
		TriggerInfo:	in 	std_logic_vector(11 downto 0);

		-- FIFO out for Reading RDAD
	    RDAD_ReadEn  :in  std_logic;
	    RDAD_DataOut : out std_logic_vector(85 downto 0);
	    RDAD_Empty	: out std_logic
		);
	end component;

	-- component WindowBrainControl is
	-- 	Generic(
	-- 		NBRWINDOWS : integer := 16
	-- 	);
	-- 	Port (
	-- 	nrst : 			in	STD_Logic;
	--
	-- 	ClockBus:		in T_ClockBus;
	-- 	Timecounter:	in std_logic_vector(63 downto 0);
	--
	-- 	-- Interface to WindowCPU
	-- 	CPUBus :		out std_logic_vector(10 downto 0);
	--
	-- 	WR_RS_S:		out std_logic_vector(1 downto 0);
	-- 	WR_CS_S:		out std_logic_vector(5 downto 0);
	--
	-- 	CtrlBus_IxSL:		in 	T_CtrlBus_IxSL;
	--
	-- 	CurAddr:		out	std_logic_vector(7 downto 0);
	-- 	CurAddrBit:		out std_logic_vector(NBRWINDOWS-1 downto 0);
	-- 	OldAddr:		out	std_logic_vector(7 downto 0);
	-- 	OldAddrBit:		out std_logic_vector(NBRWINDOWS-1 downto 0);
	--
	-- 	--	NextBus_In:		in Bus_t(NBRWINDOWS-1 downto 0);
	-- 	--	PrevBus_In:		in Bus_t(NBRWINDOWS-1 downto 0);
	-- 	NextAddr_in : 	in std_logic_vector(7 downto 0);
	-- 	PrevAddr_in :	in std_logic_vector(7 downto 0);
	--
	--     -- FIFO IN for Digiting
	--     DIG_Full	: out	std_logic;
	--     DIG_DataIn	: in	std_logic_vector(8 downto 0);
	--     DIG_WriteEn	: in	std_logic
	-- 	);
	--
	-- end component WindowBrainControl;

	-- component TriggerBrainControl is
	-- 	Generic(
	-- 		NBRWINDOWS : integer := 16;
	-- 		MIN_LE_TIME : integer := 3;	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
	-- 		MIN_TE_TIME : integer := 1; -- 4 ns after falling of trigger
	-- 		MAX_TRIG_TIME: integer := 32
	-- 	);
	-- 	Port (
	-- 	nrst : 			in	STD_Logic;
	-- 	ClockBus:		in T_ClockBus;
	-- 	SCnt:			in	std_logic_vector(2 downto 0);
	--
	-- 	trigger : 		in std_logic_vector(3 downto 0);
	--
	-- 	-- Interface to WindowCPU
	-- 	CurAddr:		in std_logic_vector(7 downto 0);
	-- 	PrevAddr:		in std_logic_vector(7 downto 0);
	-- 	NextAddr:		in std_logic_vector(7 downto 0);
	--
	-- 	CPUMode:		in 	std_logic;
	-- 	CPUBus:			out	std_logic_vector(10 downto 0);
	-- 	TriggerInfo :	out std_logic_vector(11 downto 0)
	--
	-- 	);
	-- end component TriggerBrainControl;

	-- component TriggerBrainControlV2 is
	-- 	Generic(
	-- 		NBRWINDOWS : integer := 16;
	-- 		MIN_LE_TIME : integer := 3;	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
	-- 		MIN_TE_TIME : integer := 1; -- 4 ns after falling of trigger
	-- 		MAX_TRIG_TIME: integer := 32
	-- 	);
	-- 	Port (
	-- 	nrst : 			in	STD_Logic;
	-- 	ClockBus:		in T_ClockBus;
	-- 	SCnt:			in	std_logic_vector(3 downto 0);
	--
	-- 	trigger : 		in std_logic_vector(3 downto 0);
	--
	-- 	-- Interface to WindowCPU
	-- 	CurAddr:		in 	std_logic_vector(7 downto 0);
	-- 	OldAddr:		in	std_logic_vector(7 downto 0);
	--
	-- 	CPUMode:		in 	std_logic;
	-- 	CPUBus:			out	std_logic_vector(10 downto 0);
	-- 	TriggerInfo :	out std_logic_vector(11 downto 0)
	--
	-- 	);
	-- end component TriggerBrainControlV2;

	component CPU_CONTROLLER is
		Generic(
			NBRWINDOWS : integer := 16
		);
		Port (
		nrst : 			in	STD_Logic;

		ClockBus:		in T_ClockBus;
		Timecounter:	in std_logic_vector(63 downto 0);

		trigger : 		in std_logic_vector(3 downto 0);

		-- Interface to WindowCPU
		CPUBus:			out	std_logic_vector(10 downto 0);
		CPUTime:		out	std_logic_vector(63 downto 0);
		TriggerInfo :	out std_logic_vector(11 downto 0);

		WR_RS_S:		out std_logic_vector(1 downto 0);
		WR_CS_S:		out std_logic_vector(5 downto 0);

		CtrlBus_IxSL:		in 	T_CtrlBus_IxSL;

		ValidData:		out std_logic;
		CurAddr:		out	std_logic_vector(7 downto 0);
		CurAddrBit:		out std_logic_vector(NBRWINDOWS-1 downto 0);
		OldAddr:		out	std_logic_vector(7 downto 0);
		OldAddrBit:		out std_logic_vector(NBRWINDOWS-1 downto 0);

		NextAddr_in : 	in std_logic_vector(7 downto 0);
		PrevAddr_in :	in std_logic_vector(7 downto 0);
		NextValid_in : 	in std_logic;
		PrevValid_in :	in std_logic;

	    -- FIFO IN for Digiting
	    DIG_Full	: out	std_logic;
	    DIG_DataIn	: in	std_logic_vector(8 downto 0);
	    DIG_WriteEn	: in	std_logic
		);

	end component CPU_CONTROLLER;

	component BIT_SELECTOR is
			Port (
			nrst :		in 	std_logic;
			nclr :		in	std_logic;
			clk : 		in 	std_logic;
			data : 		in 	std_logic_vector(255 downto 0);
			valid : 	out std_logic;
			addr :		out	std_logic_vector(7 downto 0)
			);
	end component BIT_SELECTOR;

	-- -------------------------------------------------------------
	-- SIGNALS
	-- -------------------------------------------------------------

	signal TrigInfo_intl:		std_logic_vector(11 downto 0);
	signal Bus_intl :			std_logic_vector(10 downto 0);


	signal PREVBus_intl :		std_logic_vector(NBRWINDOWS-1 downto 0);
	signal NEXTBus_intl :		std_logic_vector(NBRWINDOWS-1 downto 0);

	signal NextAddrBus : 		std_logic_vector(NBRWINDOWS-1 downto 0);
	signal PrevAddrBus :		std_logic_vector(NBRWINDOWS-1 downto 0);

	signal NextValid_s, PrevValid_s : std_logic;
	signal NextAddr_s,PrevAddr_s : std_logic_vector(7 downto 0);

	-- signal NextAddrBus : 		std_logic_vector(7 downto 0);
	-- signal PrevAddrBus :		std_logic_vector(7 downto 0);

	signal CurWindowCnt :	std_logic_vector(7 downto 0);
	signal OldWindowCnt :	std_logic_vector(7 downto 0);
	signal NextWindowCnt:	std_logic_vector(7 downto 0);
	signal PrevWindowCnt:	std_logic_vector(7 downto 0);

	--signal CtrlBus_IxSL_intl : T_CtrlBus_OxMS_Intl;

	signal wr1_en_bus :				std_logic_vector(NBRWINDOWS-1 downto 0);
	signal wr2_en_bus :				std_logic_vector(NBRWINDOWS-1 downto 0);

	signal wr1_en_single :				std_logic;
	signal wr2_en_single :				std_logic;

	signal Trig_intl, Last_intl, Te_intl, LE_intl, TrigDly_intl : std_logic;

	signal CurAddrBit_s:		std_logic_vector(NBRWINDOWS-1 downto 0);
	signal OldAddrBit_s:		std_logic_vector(NBRWINDOWS-1 downto 0);

	signal clr_intl : std_logic;
	signal ValidData_s : std_logic;
	signal time_intl:			std_logic_vector(63 downto 0);

	-- -------------------------------------------------------------
	-- Constraints on Signals
	-- -------------------------------------------------------------
	attribute DONT_TOUCH : string;
--	attribute DONT_TOUCH of GEN_CPU: label is "TRUE";
--	attribute DONT_TOUCH of CPU0: label is "TRUE";
--	attribute DONT_TOUCH of CPULast: label is "TRUE";
--	attribute DONT_TOUCH of CPU_CONTROLLER_inst: label is "TRUE";
--	attribute DONT_TOUCH of WDOTRIGGER: label is "TRUE";
--	attribute DONT_TOUCH of WDOSTORE: label is "TRUE";

--	attribute DONT_TOUCH of PREVBus_intl: signal is "TRUE";
--	attribute DONT_TOUCH of NEXTBus_intl: signal is "TRUE";

	attribute DONT_TOUCH of CurWindowCnt: signal is "TRUE";
	attribute DONT_TOUCH of OldWindowCnt: signal is "TRUE";

--	attribute DONT_TOUCH of NextAddrBus: signal is "TRUE";
--	attribute DONT_TOUCH of PrevAddrBus: signal is "TRUE";

	attribute DONT_TOUCH of wr1_en_bus: signal is "TRUE";
	attribute DONT_TOUCH of wr2_en_bus: signal is "TRUE";
	attribute DONT_TOUCH of wr1_en_single: signal is "TRUE";
	attribute DONT_TOUCH of wr2_en_single: signal is "TRUE";

	attribute DONT_TOUCH of NextAddr_s : signal is "TRUE";
	attribute DONT_TOUCH of PrevAddr_s : signal is "TRUE";
	attribute DONT_TOUCH of NextValid_s : signal is "TRUE";
	attribute DONT_TOUCH of PrevValid_s : signal is "TRUE";
begin

	-- --Valid signal for timing Constraints
	--clr_intl <= '1'	when timecounter(3 downto 0) = "0000" else '0';

	-- GEN_CPU : WindowBrain_GEN
	-- 	generic map(
	-- 		NBRWINDOWS => 256
	-- 	)
	-- 	Port map(
	-- 		nrst			=> nrst,
	-- 		clr				=> ValidAddr_s,
	-- 		CLK				=> ClockBus.CLK250MHz,
	-- 		CPUBus 			=> Bus_intl,
	--
	-- 		wr1_en 			=> wr1_en_bus,
	-- 		wr2_en			=> wr2_en_bus,
	--
	-- 		CurAddrBit			=> CurAddrBit_s,
	-- 		OldAddrBit			=> OldAddrBit_s,
	--
	-- 		NextAddrBus		=> NextAddrBus,
	-- 		PrevAddrBus		=> PrevAddrBus
	-- 	);
	--
	GEN_CPU : for I in 1 to (NBRWINDOWS-2) generate
		CPUX : WindowBrain
			generic map(
				ADDRESS => I
			)
			Port map(
			nrst			=> CtrlBus_IxSL.SW_nRST,
			nclr				=> ValidData_s,
			CLK				=> ClockBus.CLK250MHz,
			CPUBus 			=> Bus_intl,

			wr1_en 			=> wr1_en_bus(I),
			wr2_en			=> wr2_en_bus(I),

			--CurAddr			=> CurWindowCnt,
			CurAddrBit			=> CurAddrBit_s(I),
			--OldAddr			=> OldWindowCnt,
			OldAddrBit			=> OldAddrBit_s(I),
			-- Previous Side
			PREVBus_OUT 	=> PREVBus_intl(I),
			NEXTBus_IN 		=> NEXTBus_intl(I-1),

			-- Next Side
			PREVBus_IN 		=> PREVBus_intl(I+1),
			NEXTBus_OUT 	=> NEXTBus_intl(I),
			NextAddr		=> NextAddrBus(I),
			PrevAddr		=> PrevAddrBus(I)
			);

	end generate;

	CPU0 : WindowBrain
		generic map(
			ADDRESS => 0
		)
		Port map(
		nrst			=> CtrlBus_IxSL.SW_nRST,
		nclr			=> ValidData_s,
		CLK				=> ClockBus.CLK250MHz,
		CPUBus 			=> Bus_intl,

		wr1_en 			=> wr1_en_bus(0),
		wr2_en			=> wr2_en_bus(0),

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit_s(0),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit_s(0),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(0),
		NEXTBus_IN 		=> NEXTBus_intl(NBRWINDOWS-1),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(1),
		NEXTBus_OUT 	=> NEXTBus_intl(0),

		NextAddr		=> NextAddrBus(0),
		PrevAddr		=> PrevAddrBus(0)
		);

	CPULAST : WindowBrain
		generic map(
			ADDRESS => NBRWINDOWS-1
		)
		Port map(
		nrst			=> CtrlBus_IxSL.SW_nRST,
		nclr			=> ValidData_s,
		CLK				=> ClockBus.CLK250MHz,

		CPUBus 			=> Bus_intl,

		wr1_en 			=> wr1_en_bus(NBRWINDOWS-1),
		wr2_en			=> wr2_en_bus(NBRWINDOWS-1),

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit_s(NBRWINDOWS-1),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit_s(NBRWINDOWS-1),
		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(NBRWINDOWS-1),
		NEXTBus_IN 		=> NEXTBus_intl(NBRWINDOWS-2),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(0),
		NEXTBus_OUT 	=> NEXTBus_intl(NBRWINDOWS-1),

		NextAddr		=> NextAddrBus(NBRWINDOWS-1),
		PrevAddr		=> PrevAddrBus(NBRWINDOWS-1)
		);

	NEXTADDR_ints : BIT_SELECTOR
		Port map(
		nrst 	=> CtrlBus_IxSL.SW_nRST,
		nclr	=> ValidData_s,
		clk 	=> ClockBus.CLK250MHz,
		data 	=> NextAddrBus,
		valid 	=> NextValid_s,
		addr 	=> NextAddr_s
		);

	PREVADDR_ints : BIT_SELECTOR
		Port map(
		nrst 	=> CtrlBus_IxSL.SW_nRST,
		nclr	=> ValidData_s,
		clk 	=> ClockBus.CLK250MHz,
		data 	=> PrevAddrBus,
		valid 	=> PREVValid_s,
		addr 	=> PREVAddr_s
		);


	wr1_en_single <= wr1_en_bus(to_integer(unsigned(OldWindowCnt)));
	wr2_en_single <= wr2_en_bus(to_integer(unsigned(OldWindowCnt)));

	CPU_CONTROLLER_inst : CPU_CONTROLLER
			Generic map(
				NBRWINDOWS => 256
			)
			Port map(
			nrst			=> CtrlBus_IxSL.SW_nRST,
			ClockBus		=> ClockBus,
			timecounter		=> timecounter,

			trigger 	=> trigger,

			CPUBus		=> Bus_intl,
			CPUTime		=> Time_intl,
			TriggerInfo	=> TrigInfo_intl,

			WR_RS_S			=> WR_RS_S,
			WR_CS_S			=> WR_CS_S,

			CtrlBus_IxSL => CtrlBus_IxSL,

			ValidData		=> ValidData_s,
			CurAddr			=> CurWindowCnt,
			CurAddrBit		=> CurAddrBit_s,
			OldAddr			=> OldWindowCnt,
			OldAddrBit		=> OldAddrBit_s,

			-- NextAddr_in		=> NextAddrBus,
			--PrevAddr_in		=> PrevAddrBus,
			NextAddr_in		=> NextAddr_s,
			PrevAddr_in		=> PrevAddr_s,
			NextValid_in	=> NextValid_s,
			PrevValid_in	=> PrevValid_s,

			-- FIFO IN for Digiting
			DIG_Full		=> DIG_Full,
			DIG_DataIn		=> DIG_DataIn,
			DIG_WriteEn		=> DIG_WriteEn
			);



	-- WDOCONTROL : WindowBrainControl
	-- 	Generic map(
	-- 		NBRWINDOWS => NBRWINDOWS
	-- 	)
	-- 	Port map (
	-- 	nrst			=> nrst,
	-- 	ClockBus		=> ClockBus,
	-- 	timecounter		=> timecounter,
	--
	-- 	-- Interface to WindowCPU
	-- 	CPUBus 			=> Bus_intl,
	--
	-- 	WR_RS_S			=> WR_RS_S,
	-- 	WR_CS_S			=> WR_CS_S,
	--
	-- 	CtrlBus_IxSL => CtrlBus_IxSL,
	--
	-- 	CurAddr			=> CurWindowCnt,
	-- 	CurAddrBit		=> CurAddrBit_s,
	-- 	OldAddr			=> OldWindowCnt,
	-- 	OldAddrBit		=> OldAddrBit_s,
	--
	-- 	NextAddr_in		=> NextAddrBus,
	-- 	PrevAddr_in		=> PrevAddrBus,
	--
	-- 	-- FIFO IN for Digiting
	-- 	DIG_Full		=> DIG_Full,
	-- 	DIG_DataIn		=> DIG_DataIn,
	-- 	DIG_WriteEn		=> DIG_WriteEn
	-- 	);
		-- WDOTRIGGER : TriggerBrainControlV2
		-- 		Generic map(
		-- 			NBRWINDOWS => NBRWINDOWS,
		-- 			MIN_LE_TIME => 3,
		-- 			MIN_TE_TIME => 1
		-- 		)
		-- 		Port map(
		-- 		nrst			=> nrst,
		-- 		ClockBus		=> ClockBus,
		-- 		SCnt	=> timecounter(3 downto 0),
		--
		-- 		trigger 	=> trigger,
		--
		-- 		-- Interface to WindowCPU
		-- 		CPUMode			=> Ctrlbus_ixsl.CPUMode,
		-- 		CPUBus 			=> Bus_intl,
		-- 		TriggerInfo		=> TrigInfo_intl,
		-- 		curaddr  		=> CurWindowCnt,
		-- 		OldAddr			=> OldWindowCnt
		-- 		);
		-- WDOTRIGGER : TriggerBrainControl
		-- 		Generic map(
		-- 			NBRWINDOWS => NBRWINDOWS,
		-- 			MIN_LE_TIME => 3,
		-- 			MIN_TE_TIME => 1
		-- 		)
		-- 		Port map(
		-- 		nrst			=> nrst,
		-- 		ClockBus		=> ClockBus,
		-- 		SCnt	=> timecounter(2 downto 0),
		--
		-- 		trigger 	=> trigger,
		--
		-- 		-- Interface to WindowCPU
		-- 		CPUMode			=> Ctrlbus_ixsl.CPUMode,
		-- 		CPUBus 			=> Bus_intl,
		-- 		TriggerInfo		=> TrigInfo_intl,
		-- 		curaddr  		=> CurWindowCnt,
		-- 		NextAddr		=> NextAddrBus,
		-- 		PrevAddr		=> PrevAddrBus
		-- 		);

	WDOSTORE : WindowStoreV4
		Generic map(
		NBRWINDOWS => NBRWINDOWS
		)
		Port map(
		nrst			=> CtrlBus_IxSL.SW_nRST,
		ClockBus	=> ClockBus,
		timecounter		=> timecounter,
		ValidData	=> ValidData_s,

		CPUBus		=> Bus_intl,
		CPUTime		=> Time_intl,
		TriggerInfo	=> TrigInfo_intl,

		-- FIFO out for Reading RDAD
		RDAD_ReadEn  => RDAD_ReadEn,
		RDAD_DataOut => RDAD_DataOut,
		RDAD_Empty	=> 	RDAD_Empty
		);

		--Debug
		sDEBUG(0)	<= '0';
		sDEBUG(1)	<= '0';
		sDEBUG(2)	<= CtrlBus_IxSL.CPUMode;
		sDEBUG(3)	<= CtrlBus_IxSL.WindowStorage;
		sDEBUG(4)	<= Trig_intl;
		sDEBUG(5)	<= RDAD_ReadEn;
		sDEBUG(6)	<= '0';
		sDEBUG(7)	<= '0';

end implementation;
