library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity RoundBufferV4 is
	generic(
		NBRWINDOWS : integer := 16
	);
	port(
		nrst : 			in	std_Logic;
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
end RoundBufferV4;

architecture implementation of RoundBufferV4 is

	component WindowBrain is
		generic(
			ADDRESS : integer := 0
		);
		Port (

		nrst : 			in	std_Logic;
	--	SSTIN:			in std_logic;
		CLK:			in 	std_logic;
		oddeven	:		in 	std_logic;

		--Window Part
		CPUMode:		in	std_logic;
		CPUBus :		inout	std_logic_vector(10 downto 0);

		wr1_en:			out	std_logic;
		wr2_en:			out	std_logic;

		--Trigger Information for Brain
		Trig:			in 	std_logic;
		TrigDly:		in std_logic;
		Last:			in	std_logic;
		LE : 			in	std_logic;
		TE : 			in	std_logic;

		--CurAddr:		in 	std_logic_vector(7 downto 0);
		CurAddrBit:		in std_logic;
		--OldAddr:		in	std_logic_vector(7 downto 0);
		OldAddrBit:		in std_logic;

		PREVBus_IN :	in	std_logic;
		PREVBus_OUT :	out	std_logic;
		NEXTBus_IN :	in	std_logic;
		NEXTBus_OUT :	out	std_logic;

		NextAddr : 		inout std_logic_vector(7 downto 0);
		PrevAddr :		inout std_logic_vector(7 downto 0)
		);

	end component WindowBrain;

	component WindowStoreV3 is
		Generic(
			NBRWINDOWS : integer := 16
		);
		Port (
		nrst : 			in	std_Logic;

		ClockBus:		in T_ClockBus;
		Timecounter:	in std_logic_vector(63 downto 0);

		CPUMode:	in	std_logic;
		TriggerInfo:	in 	std_logic_vector(11 downto 0);

		wr1_en:		in	std_logic;
		wr2_en:		in	std_logic;

		windowstore:	in std_logic_vector(7 downto 0);

		-- FIFO out for Reading RDAD
	    RDAD_ReadEn  :in  std_logic;
	    RDAD_DataOut : out std_logic_vector(85 downto 0);
	    RDAD_Empty	: out std_logic
		);
	end component;

	component WindowBrainControl is
		Generic(
			NBRWINDOWS : integer := 16
		);
		Port (
		nrst : 			in	STD_Logic;

		ClockBus:		in T_ClockBus;
		Timecounter:	in std_logic_vector(63 downto 0);

		-- Interface to WindowCPU
		CPUBus :		out std_logic_vector(10 downto 0);

		WR_RS_S:		out std_logic_vector(1 downto 0);
		WR_CS_S:		out std_logic_vector(5 downto 0);

		CtrlBus_IxSL:		in 	T_CtrlBus_IxSL;

		CurAddr:		out	std_logic_vector(7 downto 0);
		CurAddrBit:		out std_logic_vector(NBRWINDOWS-1 downto 0);
		OldAddr:		out	std_logic_vector(7 downto 0);
		OldAddrBit:		out std_logic_vector(NBRWINDOWS-1 downto 0);

		--	NextBus_In:		in Bus_t(NBRWINDOWS-1 downto 0);
		--	PrevBus_In:		in Bus_t(NBRWINDOWS-1 downto 0);
		NextAddr_in : 	in std_logic_vector(7 downto 0);
		PrevAddr_in :	in std_logic_vector(7 downto 0);

	    -- FIFO IN for Digiting
	    DIG_Full	: out	std_logic;
	    DIG_DataIn	: in	std_logic_vector(8 downto 0);
	    DIG_WriteEn	: in	std_logic
		);

	end component WindowBrainControl;

	component TriggerBrainControl is
		Generic(
			NBRWINDOWS : integer := 16;
			MIN_LE_TIME : integer := 3;	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
			MIN_TE_TIME : integer := 1; -- 4 ns after falling of trigger
			MAX_TRIG_TIME: integer := 32
		);
		Port (
		nrst : 			in	STD_Logic;
		ClockBus:		in T_ClockBus;
		SCnt:			in std_logic_vector(2 downto 0);

		trigger : 		in std_logic_vector(3 downto 0);

		Trig_out:		out	std_logic;
		TrigDly:		out std_logic;
		Last_out:		out	std_logic;
		prevWdo_LE: 	out	std_logic;
		nextWdo_TE: 	out	std_logic;

		-- Interface to WindowCPU
		CPUMode:		in std_logic;
		TriggerInfo :		out std_logic_vector(11 downto 0)

		);
	end component TriggerBrainControl;


	-- -------------------------------------------------------------
	-- SIGNALS
	-- -------------------------------------------------------------

	signal TrigInfo_intl:		std_logic_vector(11 downto 0);
	signal Bus_intl :			std_logic_vector(10 downto 0);


	--signal PREVBus_intl :		Bus_t(NBRWINDOWS-1 downto 0);
	--signal NEXTBus_intl :		Bus_t(NBRWINDOWS-1 downto 0);
	signal PREVBus_intl :		std_logic_vector(NBRWINDOWS-1 downto 0);
	signal NEXTBus_intl :		std_logic_vector(NBRWINDOWS-1 downto 0);

	signal NextAddrBus : 		std_logic_vector(7 downto 0);
	signal PrevAddrBus :		std_logic_vector(7 downto 0);

	signal CurWindowCnt :	std_logic_vector(7 downto 0);
	signal OldWindowCnt :	std_logic_vector(7 downto 0);
	signal NextWindowCnt:	std_logic_vector(7 downto 0);
	signal PrevWindowCnt:	std_logic_vector(7 downto 0);

	--signal CtrlBus_IxSL_intl : T_CtrlBus_OxMS_Intl;

	signal valid :				std_logic_vector(NBRWINDOWS-1 downto 0);
	signal wr1_en_bus :				std_logic;
	signal wr2_en_bus :				std_logic;
	signal Trig_intl, Last_intl, Te_intl, LE_intl, TrigDly_intl : std_logic;

	signal CurAddrBit_s:		std_logic_vector(NBRWINDOWS-1 downto 0);
	signal OldAddrBit_s:		std_logic_vector(NBRWINDOWS-1 downto 0);
begin

	GEN_CPU : for I in 1 to (NBRWINDOWS-2) generate
		CPUX : WindowBrain
			generic map(
				ADDRESS => I
			)
			Port map(
			nrst			=> nrst,
			CLK				=> ClockBus.CLK250MHz,
			oddeven			=> timecounter(3),
			CPUMode			=> CtrlBus_IxSL.CPUMode,
			CPUBus 			=> Bus_intl,

			wr1_en 			=> wr1_en_bus,
			wr2_en			=> wr2_en_bus,

			Trig			=> Trig_intl,
			TrigDly 		=> TrigDly_intl,
			Last			=> Last_intl,
			TE				=> TE_intl,
			LE				=> LE_intl,

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
			NextAddr		=> NextAddrBus,
			PrevAddr		=> PrevAddrBus
			);

	end generate;

	CPU0 : WindowBrain
		generic map(
			ADDRESS => 0
		)
		Port map(
		nrst			=> nrst,
		CLK				=> ClockBus.CLK250MHz,
		oddeven			=> timecounter(3),


		CPUMode			=> CtrlBus_IxSL.CPUMode,
		CPUBus 			=> Bus_intl,

		wr1_en 			=> wr1_en_bus,
		wr2_en			=> wr2_en_bus,

		Trig			=> Trig_intl,
		TrigDly 		=> TrigDly_intl,
		Last			=> Last_intl,
		TE				=> TE_intl,
		LE				=> LE_intl,

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

		NextAddr		=> NextAddrBus,
		PrevAddr		=> PrevAddrBus
		);

	CPULAST : WindowBrain
		generic map(
			ADDRESS => NBRWINDOWS-1
		)
		Port map(
		nrst			=> nrst,
		CLK				=> ClockBus.CLK250MHz,
		oddeven			=> timecounter(3),


		CPUMode			=> CtrlBus_IxSL.CPUMode,
		CPUBus 			=> Bus_intl,

		wr1_en 			=> wr1_en_bus,
		wr2_en			=> wr2_en_bus,

		Trig			=> Trig_intl,
		TrigDly 		=> TrigDly_intl,
		Last			=> Last_intl,
		TE				=> TE_intl,
		LE				=> LE_intl,

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

		NextAddr		=> NextAddrBus,
		PrevAddr		=> PrevAddrBus
		);

	WDOCONTROL : WindowBrainControl
		Generic map(
			NBRWINDOWS => NBRWINDOWS
		)
		Port map (
		nrst			=> nrst,
		ClockBus		=> ClockBus,
		timecounter		=> timecounter,

		-- Interface to WindowCPU
		CPUBus 			=> Bus_intl,

		WR_RS_S			=> WR_RS_S,
		WR_CS_S			=> WR_CS_S,

		CtrlBus_IxSL => CtrlBus_IxSL,

		CurAddr			=> CurWindowCnt,
		CurAddrBit		=> CurAddrBit_s,
		OldAddr			=> OldWindowCnt,
		OldAddrBit		=> OldAddrBit_s,

		--NextBus_In	=> NEXTBus_intl,
		--PrevBus_In	=> PREVBus_intl,
		NextAddr_in		=> NextAddrBus,
		PrevAddr_in		=> PrevAddrBus,

		-- FIFO IN for Digiting
		DIG_Full		=> DIG_Full,
		DIG_DataIn		=> DIG_DataIn,
		DIG_WriteEn		=> DIG_WriteEn
		);
	WDOTRIGGER : TriggerBrainControl
			Generic map(
				NBRWINDOWS => NBRWINDOWS,
				MIN_LE_TIME => 3,
				MIN_TE_TIME => 1
			)
			Port map(
			nrst			=> nrst,
			ClockBus		=> ClockBus,
			--timecounter		=> timecounter,
			SCnt	=> timecounter(2 downto 0),

			trigger 	=> trigger,

			Trig_out		=> Trig_intl,
			TrigDly 		=> TrigDly_intl,
			Last_out		=> Last_intl,
			prevWdo_LE		=> LE_intl,
			nextWdo_TE		=> TE_intl,

			-- Interface to WindowCPU
			CPUMode			=> Ctrlbus_ixsl.CPUMode,
			TriggerInfo		=> TrigInfo_intl

			);

	WDOSTORE : WindowStoreV3
		Generic map(
		NBRWINDOWS => NBRWINDOWS
		)
		Port map(
		nrst			=> nrst,

		ClockBus	=> ClockBus,
		timecounter	=> timecounter,

		CPUMode	=> CtrlBus_IxSL.CPUMode,
		TriggerInfo		=> TrigInfo_intl,

		-- Normal Operation
		wr1_en		=> wr1_en_bus,
		Wr2_en		=> wr2_en_bus,
		windowstore => CurWindowCnt,

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
