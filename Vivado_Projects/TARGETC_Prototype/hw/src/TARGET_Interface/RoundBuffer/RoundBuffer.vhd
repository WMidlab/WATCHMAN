library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg_old.all;

entity RoundBuffer is
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
		RDAD_DataOut : out std_logic_vector(100+5 downto 0);
		RDAD_Empty	: out std_logic;

		-- FIFO IN for Digiting
	    DIG_Full	: out	std_logic;
	    DIG_DataIn	: in	std_logic_vector(8 downto 0);
	    DIG_WriteEn	: in	std_logic

	);
end RoundBuffer;

architecture implementation of RoundBuffer is

	component WindowCPUV2 is
		generic(
			ADDRESS : integer := 0
		);
		Port (

		nrst : 			in	std_Logic;
	--	SSTIN:			in std_logic;
		CLK:			in 	std_logic;

		--Window Part
		BusA :			in t_CommandBus;
		BusB :			in t_CommandBus;
		BusC :			in t_CommandBus;
		BusD :			in t_CommandBus;

		TrigInfo_IN:	in t_triggerinformation;
		TrigInfo_OUT:	out std_logic_vector(11 downto 0);

		wr1_en :		out std_logic;
		wr2_en :		out	std_logic;
		valid_o	:		out std_logic;

		CurAddr:		in 	std_logic_vector(7 downto 0);
		PREVBus_IN :	in	std_logic_vector(7 downto 0);
		PREVBus_OUT :	out	std_logic_vector(7 downto 0);
		NEXTBus_IN :	in	std_logic_vector(7 downto 0);
		NEXTBus_OUT :	out	std_logic_vector(7 downto 0)
		);

	end component WindowCPUV2;

	component WindowSelect is

		Port (
		CurAddr :		in std_logic_vector(7 downto 0);

		NextBus_In:		in Bus_t;
		PrevBus_In:		in Bus_t;

		NextAddr:		out std_logic_vector(7 downto 0);
		PrevAddr:		out std_logic_vector(7 downto 0)
		);
	end component WindowSelect;

	component WindowStore is
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
		RDAD_DataOut : out std_logic_vector(100+5 downto 0);
		RDAD_Empty	: out std_logic
		);

	end component;

	component WindowControlV3 is
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
		BusA :			out t_CommandBus;
		BusB :			out t_CommandBus;
		BusC :			out t_CommandBus;
		BusD :			out t_CommandBus;

		TrigInfo_Out:	out t_triggerinformation;

		WR_RS_S:		out std_logic_vector(1 downto 0);
		WR_CS_S:		out std_logic_vector(5 downto 0);

		CtrlBus_IxSL:		in 	T_CtrlBus_IxSL;

		CurAddr:		out	std_logic_vector(7 downto 0);
		NextBus_In:		in Bus_t(NBRWINDOWS-1 downto 0);
		PrevBus_In:		in Bus_t(NBRWINDOWS-1 downto 0);

	    -- FIFO IN for Digiting
	    DIG_Full	: out	std_logic;
	    DIG_DataIn	: in	std_logic_vector(8 downto 0);
	    DIG_WriteEn	: in	std_logic
		);

	end component WindowControlV3;


	-- -------------------------------------------------------------
	-- SIGNALS
	-- -------------------------------------------------------------

	signal TrigInfo_intl:		t_triggerinformation;
	signal TrigInfoCell_intl:	t_TrigInfoBus(NBRWINDOWS-1 downto 0);

	signal BusA_intl :			t_CommandBus;
	signal BusB_intl :			t_CommandBus;
	signal BusC_intl :			t_CommandBus;
	signal BusD_intl :			t_CommandBus;

	signal PREVBus_intl :		Bus_t(NBRWINDOWS-1 downto 0);
	signal NEXTBus_intl :		Bus_t(NBRWINDOWS-1 downto 0);

	signal CurWindowCnt :	std_logic_vector(7 downto 0);
	signal NextWindowCnt:	std_logic_vector(7 downto 0);
	signal PrevWindowCnt:	std_logic_vector(7 downto 0);

	--signal CtrlBus_IxSL_intl : T_CtrlBus_OxMS_Intl;

	signal valid :				std_logic_vector(NBRWINDOWS-1 downto 0);
	signal wr1_en :				std_logic_vector(NBRWINDOWS-1 downto 0);
	signal wr2_en :				std_logic_vector(NBRWINDOWS-1 downto 0);

begin

	GEN_CPU : for I in 1 to (NBRWINDOWS-2) generate
		CPUX : WindowCPUV2
			generic map(
				ADDRESS => I
			)
			Port map(
			nrst			=> nrst,
			CLK				=> ClockBus.CLK250MHz,

			BusA 			=> BusA_intl,
			BusB 			=> BusB_intl,
			BusC 			=> BusC_intl,
			BusD 			=> BusD_intl,

			TrigInfo_IN		=> TrigInfo_intl,
			TrigInfo_OUT	=> TrigInfoCell_intl(I),

			valid_o 		=> valid(I),
			wr1_en 			=> wr1_en(I),
			wr2_en			=> wr2_en(I),

			CurAddr			=> CurWindowCnt,
			PREVBus_IN 		=> PREVBus_intl(I),
			PREVBus_OUT 	=> PREVBus_intl(I+1),
			NEXTBus_IN 		=> NEXTBus_intl(I),
			NEXTBus_OUT 	=> NEXTBus_intl(I-1)
			);

	end generate;

	CPU0 : WindowCPUV2
		generic map(
			ADDRESS => 0
		)
		Port map(
		nrst			=> nrst,
		CLK				=> ClockBus.CLK250MHz,

		BusA 			=> BusA_intl,
		BusB 			=> BusB_intl,
		BusC 			=> BusC_intl,
		BusD 			=> BusD_intl,

		TrigInfo_IN		=> TrigInfo_intl,
		TrigInfo_OUT	=> TrigInfoCell_intl(0),

		valid_o 		=> valid(0),
		wr1_en 			=> wr1_en(0),
		wr2_en			=> wr2_en(0),

		CurAddr			=> CurWindowCnt,

		PREVBus_IN => PREVBus_intl(0),
		PREVBus_OUT =>  PREVBus_intl(1),
		NEXTBus_IN 	=> NEXTBus_intl(0),
		NEXTBus_OUT => NEXTBus_intl(NBRWINDOWS-1)
		);

	CPULAST : WindowCPUV2
		generic map(
			ADDRESS => NBRWINDOWS-1
		)
		Port map(
		nrst			=> nrst,
		CLK				=> ClockBus.CLK250MHz,

		BusA 			=> BusA_intl,
		BusB 			=> BusB_intl,
		BusC 			=> BusC_intl,
		BusD 			=> BusD_intl,

		TrigInfo_IN		=> TrigInfo_intl,
		TrigInfo_OUT	=> TrigInfoCell_intl(NBRWINDOWS-1),

		valid_o 		=> valid(NBRWINDOWS-1),
		wr1_en 			=> wr1_en(NBRWINDOWS-1),
		wr2_en			=> wr2_en(NBRWINDOWS-1),

		CurAddr			=> CurWindowCnt,
		PREVBus_IN => PREVBus_intl(NBRWINDOWS-1),
		PREVBus_OUT =>  PREVBus_intl(0),
		NEXTBus_IN 	=> NEXTBus_intl(NBRWINDOWS-1),
		NEXTBus_OUT => NEXTBus_intl(NBRWINDOWS-2)
		);

	WDOCONTROL : WindowControlV3
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
		BusA 			=> BusA_intl,
		BusB 			=> BusB_intl,
		BusC 			=> BusC_intl,
		BusD 			=> BusD_intl,

		TrigInfo_Out		=> TrigInfo_intl,

		WR_RS_S			=> WR_RS_S,
		WR_CS_S			=> WR_CS_S,

		CtrlBus_IxSL => CtrlBus_IxSL,

		CurAddr		=> CurWindowCnt,
		NextBus_In	=> NEXTBus_intl,
		PrevBus_In	=> PREVBus_intl,

		-- FIFO IN for Digiting
		DIG_Full		=> DIG_Full,
		DIG_DataIn		=> DIG_DataIn,
		DIG_WriteEn		=> DIG_WriteEn
		);

	WDOSTORE : WindowStore
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
