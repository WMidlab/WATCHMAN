library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity RoundBufferV3 is
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
	    DIG_WriteEn	: in	std_logic

	);
end RoundBufferV3;

architecture implementation of RoundBufferV3 is

	component WindowBrain is
		generic(
			ADDRESS : integer := 0
		);
		Port (

		nrst : 			in	std_Logic;
	--	SSTIN:			in std_logic;
		CLK:			in 	std_logic;

		-- Interface to WindowCPU
		CPUMode:		in std_logic;
		CPUBus :		in std_logic_vector(11 downto 0);

		TrigInfo_OUT:	out std_logic_vector(11 downto 0);

		wr1_en :		out std_logic;
		wr2_en :		out	std_logic;
		valid_o	:		out std_logic;

		CurAddr:		in 	std_logic_vector(7 downto 0);
		-- PREVBus_IN :	in	std_logic_vector(7 downto 0);
		-- PREVBus_OUT :	out	std_logic_vector(7 downto 0);
		-- NEXTBus_IN :	in	std_logic_vector(7 downto 0);
		-- NEXTBus_OUT :	out	std_logic_vector(7 downto 0)
		PREVBus_IN :	in	std_logic;
		PREVBus_OUT :	out	std_logic;
		NEXTBus_IN :	in	std_logic;
		NEXTBus_OUT :	out	std_logic;

		NextAddr : 		out std_logic_vector(7 downto 0);
		PrevAddr :		out std_logic_vector(7 downto 0)
		);

	end component WindowBrain;

	component WindowSelect is

		Port (
		CurAddr :		in std_logic_vector(7 downto 0);

		NextBus_In:		in Bus_t;
		PrevBus_In:		in Bus_t;

		NextAddr:		out std_logic_vector(7 downto 0);
		PrevAddr:		out std_logic_vector(7 downto 0)
		);
	end component WindowSelect;

	component WindowStoreV2 is
		Generic(
			NBRWINDOWS : integer := 16
		);
		Port (
		nrst : 			in	std_Logic;

		ClockBus:		in T_ClockBus;
		Timecounter:	in std_logic_vector(63 downto 0);

		-- Normal Operation
		triginfo:	in t_TrigInfoBus(NBRWINDOWS-1 downto 0);
		valid:		in std_logic_vector(NBRWINDOWS-1 downto 0);
		wr1_en:		in std_logic_vector(NBRWINDOWS-1 downto 0);
		Wr2_en:		in std_logic_vector(NBRWINDOWS-1 downto 0);

		-- FIFO out for Reading RDAD
		RDAD_ReadEn  :in  std_logic;
		RDAD_DataOut : out std_logic_vector(85 downto 0);
		RDAD_Empty	: out std_logic
		);

	end component;

	component WindowBrainControl is
		Generic(
			NBRWINDOWS : integer := 16;
			MIN_LE_TIME : integer := 3;	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
			MIN_TE_TIME : integer := 1; -- 4 ns after falling of trigger
			MAX_TRIG_TIME: integer := 32
		);
		Port (
		nrst : 			in	STD_Logic;

		ClockBus:		in T_ClockBus;
		Timecounter:	in std_logic_vector(63 downto 0);

		trigger : 		in std_logic_vector(3 downto 0);

		-- Interface to WindowCPU
		CPUBus :		out std_logic_vector(11 downto 0);

		WR_RS_S:		out std_logic_vector(1 downto 0);
		WR_CS_S:		out std_logic_vector(5 downto 0);

		CtrlBus_IxSL:		in 	T_CtrlBus_IxSL;

		CurAddr:		out	std_logic_vector(7 downto 0);
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


	-- -------------------------------------------------------------
	-- SIGNALS
	-- -------------------------------------------------------------

	signal TrigInfo_intl:		t_triggerinformation;
	signal TrigInfoCell_intl:	t_TrigInfoBus(NBRWINDOWS-1 downto 0);

	signal Bus_intl :			t_CommandBus;

	--signal PREVBus_intl :		Bus_t(NBRWINDOWS-1 downto 0);
	--signal NEXTBus_intl :		Bus_t(NBRWINDOWS-1 downto 0);
	signal PREVBus_intl :		std_logic_vector(NBRWINDOWS-1 downto 0);
	signal NEXTBus_intl :		std_logic_vector(NBRWINDOWS-1 downto 0);

	signal NextAddrBus : 		std_logic_vector(7 downto 0);
	signal PrevAddrBus :		std_logic_vector(7 downto 0);

	signal CurWindowCnt :	std_logic_vector(7 downto 0);
	signal NextWindowCnt:	std_logic_vector(7 downto 0);
	signal PrevWindowCnt:	std_logic_vector(7 downto 0);

	--signal CtrlBus_IxSL_intl : T_CtrlBus_OxMS_Intl;

	signal valid :				std_logic_vector(NBRWINDOWS-1 downto 0);
	signal wr1_en :				std_logic_vector(NBRWINDOWS-1 downto 0);
	signal wr2_en :				std_logic_vector(NBRWINDOWS-1 downto 0);

begin

	GEN_CPU : for I in 1 to (NBRWINDOWS-2) generate
		CPUX : WindowCPUV3
			generic map(
				ADDRESS => I
			)
			Port map(
			nrst			=> nrst,
			CLK				=> ClockBus.CLK250MHz,

			CPUBus 			=> Bus_intl,

			TrigInfo_IN		=> TrigInfo_intl,
			TrigInfo_OUT	=> TrigInfoCell_intl(I),

			valid_o 		=> valid(I),
			wr1_en 			=> wr1_en(I),
			wr2_en			=> wr2_en(I),

			CurAddr			=> CurWindowCnt,
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

	CPU0 : WindowCPUV3
		generic map(
			ADDRESS => 0
		)
		Port map(
		nrst			=> nrst,
		CLK				=> ClockBus.CLK250MHz,

		CPUBus 			=> Bus_intl,

		TrigInfo_IN		=> TrigInfo_intl,
		TrigInfo_OUT	=> TrigInfoCell_intl(0),

		valid_o 		=> valid(0),
		wr1_en 			=> wr1_en(0),
		wr2_en			=> wr2_en(0),

		CurAddr			=> CurWindowCnt,

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(0),
		NEXTBus_IN 		=> NEXTBus_intl(NBRWINDOWS-1),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(1),
		NEXTBus_OUT 	=> NEXTBus_intl(0),

		NextAddr		=> NextAddrBus,
		PrevAddr		=> PrevAddrBus
		);

	CPULAST : WindowCPUV3
		generic map(
			ADDRESS => NBRWINDOWS-1
		)
		Port map(
		nrst			=> nrst,
		CLK				=> ClockBus.CLK250MHz,

		CPUBus 			=> Bus_intl,

		TrigInfo_IN		=> TrigInfo_intl,
		TrigInfo_OUT	=> TrigInfoCell_intl(NBRWINDOWS-1),

		valid_o 		=> valid(NBRWINDOWS-1),
		wr1_en 			=> wr1_en(NBRWINDOWS-1),
		wr2_en			=> wr2_en(NBRWINDOWS-1),

		CurAddr			=> CurWindowCnt,
		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(NBRWINDOWS-1),
		NEXTBus_IN 		=> NEXTBus_intl(NBRWINDOWS-2),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(0),
		NEXTBus_OUT 	=> NEXTBus_intl(NBRWINDOWS-1),

		NextAddr		=> NextAddrBus,
		PrevAddr		=> PrevAddrBus
		);

	WDOCONTROL : WindowControlV4
		Generic map(
			NBRWINDOWS => NBRWINDOWS,
			MIN_LE_TIME => 3,
			MIN_TE_TIME => 1
		)
		Port map (
		nrst			=> nrst,
		ClockBus		=> ClockBus,
		timecounter		=> timecounter,

		trigger =>	trigger,

		-- Interface to WindowCPU
		CPUBus 			=> Bus_intl,
		TrigInfo_Out		=> TrigInfo_intl,

		WR_RS_S			=> WR_RS_S,
		WR_CS_S			=> WR_CS_S,

		CtrlBus_IxSL => CtrlBus_IxSL,

		CurAddr		=> CurWindowCnt,
		--NextBus_In	=> NEXTBus_intl,
		--PrevBus_In	=> PREVBus_intl,
		NextAddr_in		=> NextAddrBus,
		PrevAddr_in		=> PrevAddrBus,

		-- FIFO IN for Digiting
		DIG_Full		=> DIG_Full,
		DIG_DataIn		=> DIG_DataIn,
		DIG_WriteEn		=> DIG_WriteEn
		);

	WDOSTORE : WindowStoreV2
		Generic map(
		NBRWINDOWS => NBRWINDOWS
		)
		Port map(
		nrst			=> nrst,

		ClockBus	=> ClockBus,
		timecounter	=> timecounter,

		triginfo	=> TrigInfoCell_intl,

		-- Normal Operation
		valid		=> valid,
		wr1_en		=> wr1_en,
		Wr2_en		=> wr2_en,
		-- FIFO out for Reading RDAD
		RDAD_ReadEn  => RDAD_ReadEn,
		RDAD_DataOut => RDAD_DataOut,
		RDAD_Empty	=> 	RDAD_Empty
		);

end implementation;
