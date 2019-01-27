
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity WindowBrain_GEN is
	generic(
		NBRWINDOWS : integer := 16
	);
	Port (

	nrst : 			in	std_Logic;
	CLR :			in	std_Logic;
--	SSTIN:			in std_logic;
	CLK:			in 	std_logic;

	--Window Part
	CPUBus :		in	std_logic_vector(10 downto 0);

	wr1_en:			out	std_logic;
	wr2_en:			out	std_logic;

	--CurAddr:		in 	std_logic_vector(7 downto 0);
	CurAddrBit:		in 	std_logic_vector(NBRWINDOWS-1 downto 0);
	--OldAddr:		in	std_logic_vector(7 downto 0);
	OldAddrBit:		in std_logic_vector(NBRWINDOWS-1 downto 0);

	NextAddrBus : 		out std_logic_vector(7 downto 0);
	PrevAddrBus :		out std_logic_vector(7 downto 0)
	);

end WindowBrain_GEN;

architecture Behavioral of WindowBrain_GEN is

	component WindowBrain is
		generic(
			ADDRESS : integer := 0
		);
		Port (

		nrst : 			in	std_Logic;
		CLR :			in	std_Logic;
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

		NextAddr : 		inout 	std_logic_vector(7 downto 0);
		PrevAddr :		inout 	std_logic_vector(7 downto 0)
		);

	end component WindowBrain;

	signal PREVBus_intl :		std_logic_vector(NBRWINDOWS-1 downto 0);
	signal NEXTBus_intl :		std_logic_vector(NBRWINDOWS-1 downto 0);

	signal PrevAddrBus_s :		std_logic_vector(7 downto 0);
	signal NextAddrBus_s :		std_logic_vector(7 downto 0);

	signal wr1_en_intl : std_logic;
	signal wr2_en_intl : std_logic;

	-- -------------------------------------------------------------
	-- Constraints on Signals
	-- -------------------------------------------------------------
	attribute DONT_TOUCH : string;

	attribute DONT_TOUCH of PREVBus_intl: signal is "TRUE";
	attribute DONT_TOUCH of NEXTBus_intl: signal is "TRUE";

--	attribute DONT_TOUCH of PrevAddrBus_s: signal is "TRUE";
--	attribute DONT_TOUCH of NextAddrBus_s: signal is "TRUE";

	-- attribute DONT_TOUCH of CPU0: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU1: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU2: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU3: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU4: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU5: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU6: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU7: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU8: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU9: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU10: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU11: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU12: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU13: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU14: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU15: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU16: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU17: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU18: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU19: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU20: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU21: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU22: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU23: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU24: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU25: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU26: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU27: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU28: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU29: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU30: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU31: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU32: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU33: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU34: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU35: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU36: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU37: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU38: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU39: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU40: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU41: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU42: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU43: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU44: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU45: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU46: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU47: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU48: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU49: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU50: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU51: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU52: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU53: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU54: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU55: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU56: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU57: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU58: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU59: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU60: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU61: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU62: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU63: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU64: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU65: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU66: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU67: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU68: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU69: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU70: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU71: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU72: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU73: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU74: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU75: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU76: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU77: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU78: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU79: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU80: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU81: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU82: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU83: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU84: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU85: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU86: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU87: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU88: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU89: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU90: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU91: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU92: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU93: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU94: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU95: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU96: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU97: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU98: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU99: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU100: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU101: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU102: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU103: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU104: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU105: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU106: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU107: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU108: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU109: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU110: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU111: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU112: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU113: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU114: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU115: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU116: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU117: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU118: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU119: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU120: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU121: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU122: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU123: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU124: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU125: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU126: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU127: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU128: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU129: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU130: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU131: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU132: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU133: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU134: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU135: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU136: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU137: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU138: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU139: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU140: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU141: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU142: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU143: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU144: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU145: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU146: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU147: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU148: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU149: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU150: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU151: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU152: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU153: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU154: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU155: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU156: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU157: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU158: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU159: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU160: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU161: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU162: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU163: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU164: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU165: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU166: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU167: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU168: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU169: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU170: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU171: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU172: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU173: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU174: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU175: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU176: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU177: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU178: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU179: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU180: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU181: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU182: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU183: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU184: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU185: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU186: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU187: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU188: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU189: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU190: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU191: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU192: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU193: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU194: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU195: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU196: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU197: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU198: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU199: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU200: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU201: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU202: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU203: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU204: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU205: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU206: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU207: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU208: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU209: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU210: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU211: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU212: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU213: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU214: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU215: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU216: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU217: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU218: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU219: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU220: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU221: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU222: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU223: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU224: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU225: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU226: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU227: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU228: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU229: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU230: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU231: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU232: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU233: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU234: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU235: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU236: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU237: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU238: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU239: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU240: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU241: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU242: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU243: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU244: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU245: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU246: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU247: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU248: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU249: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU250: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU251: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU252: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU253: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU254: label is  "TRUE";
	-- attribute DONT_TOUCH of CPU255: label is  "TRUE";
begin

	NextAddrBus <= NextAddrBus_s;
	PrevAddrBus <= PrevAddrBus_s;

	wr1_en <= wr1_en_intl;
	wr2_en <= wr2_en_intl;

	CPU0 : WindowBrain
		generic map(
			ADDRESS => 0
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(0),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(0),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(0),
		NEXTBus_IN 		=> NEXTBus_intl(255),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(1),
		NEXTBus_OUT 	=> NEXTBus_intl(0),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU1 : WindowBrain
		generic map(
			ADDRESS => 1
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(1),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(1),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(1),
		NEXTBus_IN 		=> NEXTBus_intl(0),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(2),
		NEXTBus_OUT 	=> NEXTBus_intl(1),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU2 : WindowBrain
		generic map(
			ADDRESS => 2
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(2),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(2),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(2),
		NEXTBus_IN 		=> NEXTBus_intl(1),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(3),
		NEXTBus_OUT 	=> NEXTBus_intl(2),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU3 : WindowBrain
		generic map(
			ADDRESS => 3
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(3),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(3),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(3),
		NEXTBus_IN 		=> NEXTBus_intl(2),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(4),
		NEXTBus_OUT 	=> NEXTBus_intl(3),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU4 : WindowBrain
		generic map(
			ADDRESS => 4
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(4),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(4),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(4),
		NEXTBus_IN 		=> NEXTBus_intl(3),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(5),
		NEXTBus_OUT 	=> NEXTBus_intl(4),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU5 : WindowBrain
		generic map(
			ADDRESS => 5
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(5),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(5),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(5),
		NEXTBus_IN 		=> NEXTBus_intl(4),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(6),
		NEXTBus_OUT 	=> NEXTBus_intl(5),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU6 : WindowBrain
		generic map(
			ADDRESS => 6
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(6),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(6),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(6),
		NEXTBus_IN 		=> NEXTBus_intl(5),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(7),
		NEXTBus_OUT 	=> NEXTBus_intl(6),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU7 : WindowBrain
		generic map(
			ADDRESS => 7
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(7),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(7),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(7),
		NEXTBus_IN 		=> NEXTBus_intl(6),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(8),
		NEXTBus_OUT 	=> NEXTBus_intl(7),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU8 : WindowBrain
		generic map(
			ADDRESS => 8
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(8),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(8),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(8),
		NEXTBus_IN 		=> NEXTBus_intl(7),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(9),
		NEXTBus_OUT 	=> NEXTBus_intl(8),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU9 : WindowBrain
		generic map(
			ADDRESS => 9
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(9),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(9),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(9),
		NEXTBus_IN 		=> NEXTBus_intl(8),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(10),
		NEXTBus_OUT 	=> NEXTBus_intl(9),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU10 : WindowBrain
		generic map(
			ADDRESS => 10
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(10),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(10),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(10),
		NEXTBus_IN 		=> NEXTBus_intl(9),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(11),
		NEXTBus_OUT 	=> NEXTBus_intl(10),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU11 : WindowBrain
		generic map(
			ADDRESS => 11
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(11),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(11),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(11),
		NEXTBus_IN 		=> NEXTBus_intl(10),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(12),
		NEXTBus_OUT 	=> NEXTBus_intl(11),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU12 : WindowBrain
		generic map(
			ADDRESS => 12
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(12),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(12),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(12),
		NEXTBus_IN 		=> NEXTBus_intl(11),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(13),
		NEXTBus_OUT 	=> NEXTBus_intl(12),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU13 : WindowBrain
		generic map(
			ADDRESS => 13
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(13),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(13),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(13),
		NEXTBus_IN 		=> NEXTBus_intl(12),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(14),
		NEXTBus_OUT 	=> NEXTBus_intl(13),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU14 : WindowBrain
		generic map(
			ADDRESS => 14
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(14),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(14),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(14),
		NEXTBus_IN 		=> NEXTBus_intl(13),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(15),
		NEXTBus_OUT 	=> NEXTBus_intl(14),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU15 : WindowBrain
		generic map(
			ADDRESS => 15
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(15),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(15),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(15),
		NEXTBus_IN 		=> NEXTBus_intl(14),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(16),
		NEXTBus_OUT 	=> NEXTBus_intl(15),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU16 : WindowBrain
		generic map(
			ADDRESS => 16
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(16),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(16),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(16),
		NEXTBus_IN 		=> NEXTBus_intl(15),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(17),
		NEXTBus_OUT 	=> NEXTBus_intl(16),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU17 : WindowBrain
		generic map(
			ADDRESS => 17
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(17),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(17),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(17),
		NEXTBus_IN 		=> NEXTBus_intl(16),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(18),
		NEXTBus_OUT 	=> NEXTBus_intl(17),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU18 : WindowBrain
		generic map(
			ADDRESS => 18
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(18),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(18),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(18),
		NEXTBus_IN 		=> NEXTBus_intl(17),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(19),
		NEXTBus_OUT 	=> NEXTBus_intl(18),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU19 : WindowBrain
		generic map(
			ADDRESS => 19
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(19),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(19),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(19),
		NEXTBus_IN 		=> NEXTBus_intl(18),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(20),
		NEXTBus_OUT 	=> NEXTBus_intl(19),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU20 : WindowBrain
		generic map(
			ADDRESS => 20
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(20),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(20),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(20),
		NEXTBus_IN 		=> NEXTBus_intl(19),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(21),
		NEXTBus_OUT 	=> NEXTBus_intl(20),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU21 : WindowBrain
		generic map(
			ADDRESS => 21
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(21),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(21),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(21),
		NEXTBus_IN 		=> NEXTBus_intl(20),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(22),
		NEXTBus_OUT 	=> NEXTBus_intl(21),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU22 : WindowBrain
		generic map(
			ADDRESS => 22
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(22),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(22),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(22),
		NEXTBus_IN 		=> NEXTBus_intl(21),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(23),
		NEXTBus_OUT 	=> NEXTBus_intl(22),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU23 : WindowBrain
		generic map(
			ADDRESS => 23
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(23),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(23),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(23),
		NEXTBus_IN 		=> NEXTBus_intl(22),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(24),
		NEXTBus_OUT 	=> NEXTBus_intl(23),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU24 : WindowBrain
		generic map(
			ADDRESS => 24
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(24),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(24),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(24),
		NEXTBus_IN 		=> NEXTBus_intl(23),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(25),
		NEXTBus_OUT 	=> NEXTBus_intl(24),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU25 : WindowBrain
		generic map(
			ADDRESS => 25
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(25),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(25),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(25),
		NEXTBus_IN 		=> NEXTBus_intl(24),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(26),
		NEXTBus_OUT 	=> NEXTBus_intl(25),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU26 : WindowBrain
		generic map(
			ADDRESS => 26
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(26),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(26),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(26),
		NEXTBus_IN 		=> NEXTBus_intl(25),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(27),
		NEXTBus_OUT 	=> NEXTBus_intl(26),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU27 : WindowBrain
		generic map(
			ADDRESS => 27
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(27),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(27),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(27),
		NEXTBus_IN 		=> NEXTBus_intl(26),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(28),
		NEXTBus_OUT 	=> NEXTBus_intl(27),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU28 : WindowBrain
		generic map(
			ADDRESS => 28
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(28),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(28),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(28),
		NEXTBus_IN 		=> NEXTBus_intl(27),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(29),
		NEXTBus_OUT 	=> NEXTBus_intl(28),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU29 : WindowBrain
		generic map(
			ADDRESS => 29
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(29),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(29),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(29),
		NEXTBus_IN 		=> NEXTBus_intl(28),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(30),
		NEXTBus_OUT 	=> NEXTBus_intl(29),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU30 : WindowBrain
		generic map(
			ADDRESS => 30
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(30),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(30),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(30),
		NEXTBus_IN 		=> NEXTBus_intl(29),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(31),
		NEXTBus_OUT 	=> NEXTBus_intl(30),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU31 : WindowBrain
		generic map(
			ADDRESS => 31
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(31),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(31),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(31),
		NEXTBus_IN 		=> NEXTBus_intl(30),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(32),
		NEXTBus_OUT 	=> NEXTBus_intl(31),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU32 : WindowBrain
		generic map(
			ADDRESS => 32
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(32),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(32),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(32),
		NEXTBus_IN 		=> NEXTBus_intl(31),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(33),
		NEXTBus_OUT 	=> NEXTBus_intl(32),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU33 : WindowBrain
		generic map(
			ADDRESS => 33
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(33),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(33),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(33),
		NEXTBus_IN 		=> NEXTBus_intl(32),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(34),
		NEXTBus_OUT 	=> NEXTBus_intl(33),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU34 : WindowBrain
		generic map(
			ADDRESS => 34
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(34),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(34),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(34),
		NEXTBus_IN 		=> NEXTBus_intl(33),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(35),
		NEXTBus_OUT 	=> NEXTBus_intl(34),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU35 : WindowBrain
		generic map(
			ADDRESS => 35
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(35),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(35),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(35),
		NEXTBus_IN 		=> NEXTBus_intl(34),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(36),
		NEXTBus_OUT 	=> NEXTBus_intl(35),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU36 : WindowBrain
		generic map(
			ADDRESS => 36
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(36),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(36),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(36),
		NEXTBus_IN 		=> NEXTBus_intl(35),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(37),
		NEXTBus_OUT 	=> NEXTBus_intl(36),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU37 : WindowBrain
		generic map(
			ADDRESS => 37
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(37),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(37),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(37),
		NEXTBus_IN 		=> NEXTBus_intl(36),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(38),
		NEXTBus_OUT 	=> NEXTBus_intl(37),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU38 : WindowBrain
		generic map(
			ADDRESS => 38
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(38),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(38),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(38),
		NEXTBus_IN 		=> NEXTBus_intl(37),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(39),
		NEXTBus_OUT 	=> NEXTBus_intl(38),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU39 : WindowBrain
		generic map(
			ADDRESS => 39
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(39),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(39),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(39),
		NEXTBus_IN 		=> NEXTBus_intl(38),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(40),
		NEXTBus_OUT 	=> NEXTBus_intl(39),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU40 : WindowBrain
		generic map(
			ADDRESS => 40
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(40),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(40),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(40),
		NEXTBus_IN 		=> NEXTBus_intl(39),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(41),
		NEXTBus_OUT 	=> NEXTBus_intl(40),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU41 : WindowBrain
		generic map(
			ADDRESS => 41
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(41),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(41),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(41),
		NEXTBus_IN 		=> NEXTBus_intl(40),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(42),
		NEXTBus_OUT 	=> NEXTBus_intl(41),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU42 : WindowBrain
		generic map(
			ADDRESS => 42
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(42),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(42),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(42),
		NEXTBus_IN 		=> NEXTBus_intl(41),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(43),
		NEXTBus_OUT 	=> NEXTBus_intl(42),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU43 : WindowBrain
		generic map(
			ADDRESS => 43
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(43),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(43),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(43),
		NEXTBus_IN 		=> NEXTBus_intl(42),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(44),
		NEXTBus_OUT 	=> NEXTBus_intl(43),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU44 : WindowBrain
		generic map(
			ADDRESS => 44
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(44),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(44),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(44),
		NEXTBus_IN 		=> NEXTBus_intl(43),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(45),
		NEXTBus_OUT 	=> NEXTBus_intl(44),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU45 : WindowBrain
		generic map(
			ADDRESS => 45
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(45),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(45),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(45),
		NEXTBus_IN 		=> NEXTBus_intl(44),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(46),
		NEXTBus_OUT 	=> NEXTBus_intl(45),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU46 : WindowBrain
		generic map(
			ADDRESS => 46
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(46),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(46),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(46),
		NEXTBus_IN 		=> NEXTBus_intl(45),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(47),
		NEXTBus_OUT 	=> NEXTBus_intl(46),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU47 : WindowBrain
		generic map(
			ADDRESS => 47
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(47),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(47),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(47),
		NEXTBus_IN 		=> NEXTBus_intl(46),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(48),
		NEXTBus_OUT 	=> NEXTBus_intl(47),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU48 : WindowBrain
		generic map(
			ADDRESS => 48
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(48),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(48),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(48),
		NEXTBus_IN 		=> NEXTBus_intl(47),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(49),
		NEXTBus_OUT 	=> NEXTBus_intl(48),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU49 : WindowBrain
		generic map(
			ADDRESS => 49
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(49),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(49),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(49),
		NEXTBus_IN 		=> NEXTBus_intl(48),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(50),
		NEXTBus_OUT 	=> NEXTBus_intl(49),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU50 : WindowBrain
		generic map(
			ADDRESS => 50
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(50),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(50),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(50),
		NEXTBus_IN 		=> NEXTBus_intl(49),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(51),
		NEXTBus_OUT 	=> NEXTBus_intl(50),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU51 : WindowBrain
		generic map(
			ADDRESS => 51
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(51),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(51),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(51),
		NEXTBus_IN 		=> NEXTBus_intl(50),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(52),
		NEXTBus_OUT 	=> NEXTBus_intl(51),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU52 : WindowBrain
		generic map(
			ADDRESS => 52
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(52),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(52),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(52),
		NEXTBus_IN 		=> NEXTBus_intl(51),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(53),
		NEXTBus_OUT 	=> NEXTBus_intl(52),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU53 : WindowBrain
		generic map(
			ADDRESS => 53
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(53),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(53),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(53),
		NEXTBus_IN 		=> NEXTBus_intl(52),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(54),
		NEXTBus_OUT 	=> NEXTBus_intl(53),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU54 : WindowBrain
		generic map(
			ADDRESS => 54
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(54),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(54),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(54),
		NEXTBus_IN 		=> NEXTBus_intl(53),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(55),
		NEXTBus_OUT 	=> NEXTBus_intl(54),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU55 : WindowBrain
		generic map(
			ADDRESS => 55
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(55),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(55),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(55),
		NEXTBus_IN 		=> NEXTBus_intl(54),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(56),
		NEXTBus_OUT 	=> NEXTBus_intl(55),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU56 : WindowBrain
		generic map(
			ADDRESS => 56
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(56),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(56),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(56),
		NEXTBus_IN 		=> NEXTBus_intl(55),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(57),
		NEXTBus_OUT 	=> NEXTBus_intl(56),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU57 : WindowBrain
		generic map(
			ADDRESS => 57
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(57),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(57),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(57),
		NEXTBus_IN 		=> NEXTBus_intl(56),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(58),
		NEXTBus_OUT 	=> NEXTBus_intl(57),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU58 : WindowBrain
		generic map(
			ADDRESS => 58
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(58),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(58),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(58),
		NEXTBus_IN 		=> NEXTBus_intl(57),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(59),
		NEXTBus_OUT 	=> NEXTBus_intl(58),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU59 : WindowBrain
		generic map(
			ADDRESS => 59
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(59),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(59),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(59),
		NEXTBus_IN 		=> NEXTBus_intl(58),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(60),
		NEXTBus_OUT 	=> NEXTBus_intl(59),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU60 : WindowBrain
		generic map(
			ADDRESS => 60
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(60),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(60),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(60),
		NEXTBus_IN 		=> NEXTBus_intl(59),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(61),
		NEXTBus_OUT 	=> NEXTBus_intl(60),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU61 : WindowBrain
		generic map(
			ADDRESS => 61
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(61),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(61),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(61),
		NEXTBus_IN 		=> NEXTBus_intl(60),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(62),
		NEXTBus_OUT 	=> NEXTBus_intl(61),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU62 : WindowBrain
		generic map(
			ADDRESS => 62
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(62),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(62),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(62),
		NEXTBus_IN 		=> NEXTBus_intl(61),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(63),
		NEXTBus_OUT 	=> NEXTBus_intl(62),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU63 : WindowBrain
		generic map(
			ADDRESS => 63
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(63),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(63),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(63),
		NEXTBus_IN 		=> NEXTBus_intl(62),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(64),
		NEXTBus_OUT 	=> NEXTBus_intl(63),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU64 : WindowBrain
		generic map(
			ADDRESS => 64
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(64),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(64),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(64),
		NEXTBus_IN 		=> NEXTBus_intl(63),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(65),
		NEXTBus_OUT 	=> NEXTBus_intl(64),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU65 : WindowBrain
		generic map(
			ADDRESS => 65
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(65),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(65),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(65),
		NEXTBus_IN 		=> NEXTBus_intl(64),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(66),
		NEXTBus_OUT 	=> NEXTBus_intl(65),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU66 : WindowBrain
		generic map(
			ADDRESS => 66
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(66),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(66),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(66),
		NEXTBus_IN 		=> NEXTBus_intl(65),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(67),
		NEXTBus_OUT 	=> NEXTBus_intl(66),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU67 : WindowBrain
		generic map(
			ADDRESS => 67
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(67),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(67),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(67),
		NEXTBus_IN 		=> NEXTBus_intl(66),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(68),
		NEXTBus_OUT 	=> NEXTBus_intl(67),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU68 : WindowBrain
		generic map(
			ADDRESS => 68
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(68),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(68),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(68),
		NEXTBus_IN 		=> NEXTBus_intl(67),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(69),
		NEXTBus_OUT 	=> NEXTBus_intl(68),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU69 : WindowBrain
		generic map(
			ADDRESS => 69
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(69),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(69),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(69),
		NEXTBus_IN 		=> NEXTBus_intl(68),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(70),
		NEXTBus_OUT 	=> NEXTBus_intl(69),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU70 : WindowBrain
		generic map(
			ADDRESS => 70
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(70),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(70),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(70),
		NEXTBus_IN 		=> NEXTBus_intl(69),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(71),
		NEXTBus_OUT 	=> NEXTBus_intl(70),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU71 : WindowBrain
		generic map(
			ADDRESS => 71
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(71),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(71),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(71),
		NEXTBus_IN 		=> NEXTBus_intl(70),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(72),
		NEXTBus_OUT 	=> NEXTBus_intl(71),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU72 : WindowBrain
		generic map(
			ADDRESS => 72
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(72),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(72),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(72),
		NEXTBus_IN 		=> NEXTBus_intl(71),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(73),
		NEXTBus_OUT 	=> NEXTBus_intl(72),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU73 : WindowBrain
		generic map(
			ADDRESS => 73
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(73),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(73),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(73),
		NEXTBus_IN 		=> NEXTBus_intl(72),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(74),
		NEXTBus_OUT 	=> NEXTBus_intl(73),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU74 : WindowBrain
		generic map(
			ADDRESS => 74
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(74),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(74),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(74),
		NEXTBus_IN 		=> NEXTBus_intl(73),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(75),
		NEXTBus_OUT 	=> NEXTBus_intl(74),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU75 : WindowBrain
		generic map(
			ADDRESS => 75
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(75),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(75),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(75),
		NEXTBus_IN 		=> NEXTBus_intl(74),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(76),
		NEXTBus_OUT 	=> NEXTBus_intl(75),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU76 : WindowBrain
		generic map(
			ADDRESS => 76
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(76),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(76),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(76),
		NEXTBus_IN 		=> NEXTBus_intl(75),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(77),
		NEXTBus_OUT 	=> NEXTBus_intl(76),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU77 : WindowBrain
		generic map(
			ADDRESS => 77
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(77),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(77),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(77),
		NEXTBus_IN 		=> NEXTBus_intl(76),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(78),
		NEXTBus_OUT 	=> NEXTBus_intl(77),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU78 : WindowBrain
		generic map(
			ADDRESS => 78
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(78),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(78),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(78),
		NEXTBus_IN 		=> NEXTBus_intl(77),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(79),
		NEXTBus_OUT 	=> NEXTBus_intl(78),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU79 : WindowBrain
		generic map(
			ADDRESS => 79
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(79),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(79),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(79),
		NEXTBus_IN 		=> NEXTBus_intl(78),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(80),
		NEXTBus_OUT 	=> NEXTBus_intl(79),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU80 : WindowBrain
		generic map(
			ADDRESS => 80
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(80),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(80),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(80),
		NEXTBus_IN 		=> NEXTBus_intl(79),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(81),
		NEXTBus_OUT 	=> NEXTBus_intl(80),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU81 : WindowBrain
		generic map(
			ADDRESS => 81
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(81),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(81),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(81),
		NEXTBus_IN 		=> NEXTBus_intl(80),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(82),
		NEXTBus_OUT 	=> NEXTBus_intl(81),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU82 : WindowBrain
		generic map(
			ADDRESS => 82
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(82),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(82),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(82),
		NEXTBus_IN 		=> NEXTBus_intl(81),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(83),
		NEXTBus_OUT 	=> NEXTBus_intl(82),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU83 : WindowBrain
		generic map(
			ADDRESS => 83
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(83),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(83),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(83),
		NEXTBus_IN 		=> NEXTBus_intl(82),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(84),
		NEXTBus_OUT 	=> NEXTBus_intl(83),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU84 : WindowBrain
		generic map(
			ADDRESS => 84
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(84),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(84),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(84),
		NEXTBus_IN 		=> NEXTBus_intl(83),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(85),
		NEXTBus_OUT 	=> NEXTBus_intl(84),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU85 : WindowBrain
		generic map(
			ADDRESS => 85
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(85),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(85),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(85),
		NEXTBus_IN 		=> NEXTBus_intl(84),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(86),
		NEXTBus_OUT 	=> NEXTBus_intl(85),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU86 : WindowBrain
		generic map(
			ADDRESS => 86
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(86),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(86),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(86),
		NEXTBus_IN 		=> NEXTBus_intl(85),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(87),
		NEXTBus_OUT 	=> NEXTBus_intl(86),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU87 : WindowBrain
		generic map(
			ADDRESS => 87
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(87),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(87),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(87),
		NEXTBus_IN 		=> NEXTBus_intl(86),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(88),
		NEXTBus_OUT 	=> NEXTBus_intl(87),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU88 : WindowBrain
		generic map(
			ADDRESS => 88
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(88),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(88),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(88),
		NEXTBus_IN 		=> NEXTBus_intl(87),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(89),
		NEXTBus_OUT 	=> NEXTBus_intl(88),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU89 : WindowBrain
		generic map(
			ADDRESS => 89
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(89),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(89),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(89),
		NEXTBus_IN 		=> NEXTBus_intl(88),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(90),
		NEXTBus_OUT 	=> NEXTBus_intl(89),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU90 : WindowBrain
		generic map(
			ADDRESS => 90
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(90),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(90),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(90),
		NEXTBus_IN 		=> NEXTBus_intl(89),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(91),
		NEXTBus_OUT 	=> NEXTBus_intl(90),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU91 : WindowBrain
		generic map(
			ADDRESS => 91
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(91),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(91),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(91),
		NEXTBus_IN 		=> NEXTBus_intl(90),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(92),
		NEXTBus_OUT 	=> NEXTBus_intl(91),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU92 : WindowBrain
		generic map(
			ADDRESS => 92
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(92),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(92),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(92),
		NEXTBus_IN 		=> NEXTBus_intl(91),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(93),
		NEXTBus_OUT 	=> NEXTBus_intl(92),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU93 : WindowBrain
		generic map(
			ADDRESS => 93
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(93),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(93),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(93),
		NEXTBus_IN 		=> NEXTBus_intl(92),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(94),
		NEXTBus_OUT 	=> NEXTBus_intl(93),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU94 : WindowBrain
		generic map(
			ADDRESS => 94
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(94),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(94),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(94),
		NEXTBus_IN 		=> NEXTBus_intl(93),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(95),
		NEXTBus_OUT 	=> NEXTBus_intl(94),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU95 : WindowBrain
		generic map(
			ADDRESS => 95
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(95),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(95),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(95),
		NEXTBus_IN 		=> NEXTBus_intl(94),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(96),
		NEXTBus_OUT 	=> NEXTBus_intl(95),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU96 : WindowBrain
		generic map(
			ADDRESS => 96
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(96),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(96),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(96),
		NEXTBus_IN 		=> NEXTBus_intl(95),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(97),
		NEXTBus_OUT 	=> NEXTBus_intl(96),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU97 : WindowBrain
		generic map(
			ADDRESS => 97
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(97),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(97),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(97),
		NEXTBus_IN 		=> NEXTBus_intl(96),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(98),
		NEXTBus_OUT 	=> NEXTBus_intl(97),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU98 : WindowBrain
		generic map(
			ADDRESS => 98
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(98),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(98),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(98),
		NEXTBus_IN 		=> NEXTBus_intl(97),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(99),
		NEXTBus_OUT 	=> NEXTBus_intl(98),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU99 : WindowBrain
		generic map(
			ADDRESS => 99
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(99),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(99),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(99),
		NEXTBus_IN 		=> NEXTBus_intl(98),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(100),
		NEXTBus_OUT 	=> NEXTBus_intl(99),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU100 : WindowBrain
		generic map(
			ADDRESS => 100
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(100),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(100),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(100),
		NEXTBus_IN 		=> NEXTBus_intl(99),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(101),
		NEXTBus_OUT 	=> NEXTBus_intl(100),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU101 : WindowBrain
		generic map(
			ADDRESS => 101
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(101),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(101),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(101),
		NEXTBus_IN 		=> NEXTBus_intl(100),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(102),
		NEXTBus_OUT 	=> NEXTBus_intl(101),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU102 : WindowBrain
		generic map(
			ADDRESS => 102
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(102),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(102),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(102),
		NEXTBus_IN 		=> NEXTBus_intl(101),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(103),
		NEXTBus_OUT 	=> NEXTBus_intl(102),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU103 : WindowBrain
		generic map(
			ADDRESS => 103
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(103),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(103),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(103),
		NEXTBus_IN 		=> NEXTBus_intl(102),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(104),
		NEXTBus_OUT 	=> NEXTBus_intl(103),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU104 : WindowBrain
		generic map(
			ADDRESS => 104
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(104),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(104),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(104),
		NEXTBus_IN 		=> NEXTBus_intl(103),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(105),
		NEXTBus_OUT 	=> NEXTBus_intl(104),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU105 : WindowBrain
		generic map(
			ADDRESS => 105
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(105),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(105),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(105),
		NEXTBus_IN 		=> NEXTBus_intl(104),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(106),
		NEXTBus_OUT 	=> NEXTBus_intl(105),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU106 : WindowBrain
		generic map(
			ADDRESS => 106
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(106),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(106),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(106),
		NEXTBus_IN 		=> NEXTBus_intl(105),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(107),
		NEXTBus_OUT 	=> NEXTBus_intl(106),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU107 : WindowBrain
		generic map(
			ADDRESS => 107
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(107),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(107),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(107),
		NEXTBus_IN 		=> NEXTBus_intl(106),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(108),
		NEXTBus_OUT 	=> NEXTBus_intl(107),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU108 : WindowBrain
		generic map(
			ADDRESS => 108
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(108),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(108),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(108),
		NEXTBus_IN 		=> NEXTBus_intl(107),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(109),
		NEXTBus_OUT 	=> NEXTBus_intl(108),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU109 : WindowBrain
		generic map(
			ADDRESS => 109
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(109),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(109),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(109),
		NEXTBus_IN 		=> NEXTBus_intl(108),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(110),
		NEXTBus_OUT 	=> NEXTBus_intl(109),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU110 : WindowBrain
		generic map(
			ADDRESS => 110
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(110),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(110),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(110),
		NEXTBus_IN 		=> NEXTBus_intl(109),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(111),
		NEXTBus_OUT 	=> NEXTBus_intl(110),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU111 : WindowBrain
		generic map(
			ADDRESS => 111
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(111),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(111),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(111),
		NEXTBus_IN 		=> NEXTBus_intl(110),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(112),
		NEXTBus_OUT 	=> NEXTBus_intl(111),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU112 : WindowBrain
		generic map(
			ADDRESS => 112
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(112),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(112),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(112),
		NEXTBus_IN 		=> NEXTBus_intl(111),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(113),
		NEXTBus_OUT 	=> NEXTBus_intl(112),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU113 : WindowBrain
		generic map(
			ADDRESS => 113
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(113),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(113),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(113),
		NEXTBus_IN 		=> NEXTBus_intl(112),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(114),
		NEXTBus_OUT 	=> NEXTBus_intl(113),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU114 : WindowBrain
		generic map(
			ADDRESS => 114
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(114),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(114),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(114),
		NEXTBus_IN 		=> NEXTBus_intl(113),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(115),
		NEXTBus_OUT 	=> NEXTBus_intl(114),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU115 : WindowBrain
		generic map(
			ADDRESS => 115
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(115),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(115),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(115),
		NEXTBus_IN 		=> NEXTBus_intl(114),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(116),
		NEXTBus_OUT 	=> NEXTBus_intl(115),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU116 : WindowBrain
		generic map(
			ADDRESS => 116
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(116),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(116),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(116),
		NEXTBus_IN 		=> NEXTBus_intl(115),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(117),
		NEXTBus_OUT 	=> NEXTBus_intl(116),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU117 : WindowBrain
		generic map(
			ADDRESS => 117
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(117),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(117),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(117),
		NEXTBus_IN 		=> NEXTBus_intl(116),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(118),
		NEXTBus_OUT 	=> NEXTBus_intl(117),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU118 : WindowBrain
		generic map(
			ADDRESS => 118
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(118),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(118),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(118),
		NEXTBus_IN 		=> NEXTBus_intl(117),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(119),
		NEXTBus_OUT 	=> NEXTBus_intl(118),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU119 : WindowBrain
		generic map(
			ADDRESS => 119
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(119),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(119),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(119),
		NEXTBus_IN 		=> NEXTBus_intl(118),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(120),
		NEXTBus_OUT 	=> NEXTBus_intl(119),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU120 : WindowBrain
		generic map(
			ADDRESS => 120
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(120),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(120),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(120),
		NEXTBus_IN 		=> NEXTBus_intl(119),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(121),
		NEXTBus_OUT 	=> NEXTBus_intl(120),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU121 : WindowBrain
		generic map(
			ADDRESS => 121
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(121),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(121),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(121),
		NEXTBus_IN 		=> NEXTBus_intl(120),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(122),
		NEXTBus_OUT 	=> NEXTBus_intl(121),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU122 : WindowBrain
		generic map(
			ADDRESS => 122
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(122),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(122),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(122),
		NEXTBus_IN 		=> NEXTBus_intl(121),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(123),
		NEXTBus_OUT 	=> NEXTBus_intl(122),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU123 : WindowBrain
		generic map(
			ADDRESS => 123
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(123),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(123),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(123),
		NEXTBus_IN 		=> NEXTBus_intl(122),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(124),
		NEXTBus_OUT 	=> NEXTBus_intl(123),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU124 : WindowBrain
		generic map(
			ADDRESS => 124
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(124),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(124),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(124),
		NEXTBus_IN 		=> NEXTBus_intl(123),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(125),
		NEXTBus_OUT 	=> NEXTBus_intl(124),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU125 : WindowBrain
		generic map(
			ADDRESS => 125
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(125),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(125),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(125),
		NEXTBus_IN 		=> NEXTBus_intl(124),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(126),
		NEXTBus_OUT 	=> NEXTBus_intl(125),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU126 : WindowBrain
		generic map(
			ADDRESS => 126
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(126),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(126),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(126),
		NEXTBus_IN 		=> NEXTBus_intl(125),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(127),
		NEXTBus_OUT 	=> NEXTBus_intl(126),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU127 : WindowBrain
		generic map(
			ADDRESS => 127
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(127),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(127),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(127),
		NEXTBus_IN 		=> NEXTBus_intl(126),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(128),
		NEXTBus_OUT 	=> NEXTBus_intl(127),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU128 : WindowBrain
		generic map(
			ADDRESS => 128
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(128),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(128),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(128),
		NEXTBus_IN 		=> NEXTBus_intl(127),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(129),
		NEXTBus_OUT 	=> NEXTBus_intl(128),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU129 : WindowBrain
		generic map(
			ADDRESS => 129
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(129),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(129),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(129),
		NEXTBus_IN 		=> NEXTBus_intl(128),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(130),
		NEXTBus_OUT 	=> NEXTBus_intl(129),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU130 : WindowBrain
		generic map(
			ADDRESS => 130
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(130),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(130),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(130),
		NEXTBus_IN 		=> NEXTBus_intl(129),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(131),
		NEXTBus_OUT 	=> NEXTBus_intl(130),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU131 : WindowBrain
		generic map(
			ADDRESS => 131
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(131),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(131),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(131),
		NEXTBus_IN 		=> NEXTBus_intl(130),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(132),
		NEXTBus_OUT 	=> NEXTBus_intl(131),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU132 : WindowBrain
		generic map(
			ADDRESS => 132
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(132),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(132),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(132),
		NEXTBus_IN 		=> NEXTBus_intl(131),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(133),
		NEXTBus_OUT 	=> NEXTBus_intl(132),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU133 : WindowBrain
		generic map(
			ADDRESS => 133
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(133),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(133),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(133),
		NEXTBus_IN 		=> NEXTBus_intl(132),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(134),
		NEXTBus_OUT 	=> NEXTBus_intl(133),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU134 : WindowBrain
		generic map(
			ADDRESS => 134
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(134),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(134),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(134),
		NEXTBus_IN 		=> NEXTBus_intl(133),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(135),
		NEXTBus_OUT 	=> NEXTBus_intl(134),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU135 : WindowBrain
		generic map(
			ADDRESS => 135
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(135),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(135),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(135),
		NEXTBus_IN 		=> NEXTBus_intl(134),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(136),
		NEXTBus_OUT 	=> NEXTBus_intl(135),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU136 : WindowBrain
		generic map(
			ADDRESS => 136
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(136),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(136),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(136),
		NEXTBus_IN 		=> NEXTBus_intl(135),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(137),
		NEXTBus_OUT 	=> NEXTBus_intl(136),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU137 : WindowBrain
		generic map(
			ADDRESS => 137
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(137),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(137),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(137),
		NEXTBus_IN 		=> NEXTBus_intl(136),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(138),
		NEXTBus_OUT 	=> NEXTBus_intl(137),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU138 : WindowBrain
		generic map(
			ADDRESS => 138
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(138),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(138),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(138),
		NEXTBus_IN 		=> NEXTBus_intl(137),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(139),
		NEXTBus_OUT 	=> NEXTBus_intl(138),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU139 : WindowBrain
		generic map(
			ADDRESS => 139
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(139),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(139),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(139),
		NEXTBus_IN 		=> NEXTBus_intl(138),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(140),
		NEXTBus_OUT 	=> NEXTBus_intl(139),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU140 : WindowBrain
		generic map(
			ADDRESS => 140
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(140),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(140),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(140),
		NEXTBus_IN 		=> NEXTBus_intl(139),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(141),
		NEXTBus_OUT 	=> NEXTBus_intl(140),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU141 : WindowBrain
		generic map(
			ADDRESS => 141
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(141),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(141),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(141),
		NEXTBus_IN 		=> NEXTBus_intl(140),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(142),
		NEXTBus_OUT 	=> NEXTBus_intl(141),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU142 : WindowBrain
		generic map(
			ADDRESS => 142
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(142),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(142),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(142),
		NEXTBus_IN 		=> NEXTBus_intl(141),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(143),
		NEXTBus_OUT 	=> NEXTBus_intl(142),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU143 : WindowBrain
		generic map(
			ADDRESS => 143
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(143),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(143),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(143),
		NEXTBus_IN 		=> NEXTBus_intl(142),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(144),
		NEXTBus_OUT 	=> NEXTBus_intl(143),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU144 : WindowBrain
		generic map(
			ADDRESS => 144
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(144),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(144),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(144),
		NEXTBus_IN 		=> NEXTBus_intl(143),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(145),
		NEXTBus_OUT 	=> NEXTBus_intl(144),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU145 : WindowBrain
		generic map(
			ADDRESS => 145
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(145),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(145),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(145),
		NEXTBus_IN 		=> NEXTBus_intl(144),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(146),
		NEXTBus_OUT 	=> NEXTBus_intl(145),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU146 : WindowBrain
		generic map(
			ADDRESS => 146
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(146),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(146),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(146),
		NEXTBus_IN 		=> NEXTBus_intl(145),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(147),
		NEXTBus_OUT 	=> NEXTBus_intl(146),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU147 : WindowBrain
		generic map(
			ADDRESS => 147
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(147),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(147),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(147),
		NEXTBus_IN 		=> NEXTBus_intl(146),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(148),
		NEXTBus_OUT 	=> NEXTBus_intl(147),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU148 : WindowBrain
		generic map(
			ADDRESS => 148
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(148),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(148),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(148),
		NEXTBus_IN 		=> NEXTBus_intl(147),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(149),
		NEXTBus_OUT 	=> NEXTBus_intl(148),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU149 : WindowBrain
		generic map(
			ADDRESS => 149
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(149),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(149),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(149),
		NEXTBus_IN 		=> NEXTBus_intl(148),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(150),
		NEXTBus_OUT 	=> NEXTBus_intl(149),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU150 : WindowBrain
		generic map(
			ADDRESS => 150
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(150),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(150),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(150),
		NEXTBus_IN 		=> NEXTBus_intl(149),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(151),
		NEXTBus_OUT 	=> NEXTBus_intl(150),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU151 : WindowBrain
		generic map(
			ADDRESS => 151
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(151),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(151),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(151),
		NEXTBus_IN 		=> NEXTBus_intl(150),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(152),
		NEXTBus_OUT 	=> NEXTBus_intl(151),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU152 : WindowBrain
		generic map(
			ADDRESS => 152
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(152),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(152),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(152),
		NEXTBus_IN 		=> NEXTBus_intl(151),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(153),
		NEXTBus_OUT 	=> NEXTBus_intl(152),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU153 : WindowBrain
		generic map(
			ADDRESS => 153
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(153),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(153),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(153),
		NEXTBus_IN 		=> NEXTBus_intl(152),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(154),
		NEXTBus_OUT 	=> NEXTBus_intl(153),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU154 : WindowBrain
		generic map(
			ADDRESS => 154
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(154),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(154),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(154),
		NEXTBus_IN 		=> NEXTBus_intl(153),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(155),
		NEXTBus_OUT 	=> NEXTBus_intl(154),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU155 : WindowBrain
		generic map(
			ADDRESS => 155
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(155),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(155),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(155),
		NEXTBus_IN 		=> NEXTBus_intl(154),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(156),
		NEXTBus_OUT 	=> NEXTBus_intl(155),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU156 : WindowBrain
		generic map(
			ADDRESS => 156
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(156),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(156),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(156),
		NEXTBus_IN 		=> NEXTBus_intl(155),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(157),
		NEXTBus_OUT 	=> NEXTBus_intl(156),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU157 : WindowBrain
		generic map(
			ADDRESS => 157
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(157),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(157),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(157),
		NEXTBus_IN 		=> NEXTBus_intl(156),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(158),
		NEXTBus_OUT 	=> NEXTBus_intl(157),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU158 : WindowBrain
		generic map(
			ADDRESS => 158
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(158),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(158),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(158),
		NEXTBus_IN 		=> NEXTBus_intl(157),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(159),
		NEXTBus_OUT 	=> NEXTBus_intl(158),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU159 : WindowBrain
		generic map(
			ADDRESS => 159
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(159),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(159),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(159),
		NEXTBus_IN 		=> NEXTBus_intl(158),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(160),
		NEXTBus_OUT 	=> NEXTBus_intl(159),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU160 : WindowBrain
		generic map(
			ADDRESS => 160
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(160),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(160),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(160),
		NEXTBus_IN 		=> NEXTBus_intl(159),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(161),
		NEXTBus_OUT 	=> NEXTBus_intl(160),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU161 : WindowBrain
		generic map(
			ADDRESS => 161
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(161),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(161),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(161),
		NEXTBus_IN 		=> NEXTBus_intl(160),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(162),
		NEXTBus_OUT 	=> NEXTBus_intl(161),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU162 : WindowBrain
		generic map(
			ADDRESS => 162
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(162),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(162),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(162),
		NEXTBus_IN 		=> NEXTBus_intl(161),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(163),
		NEXTBus_OUT 	=> NEXTBus_intl(162),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU163 : WindowBrain
		generic map(
			ADDRESS => 163
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(163),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(163),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(163),
		NEXTBus_IN 		=> NEXTBus_intl(162),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(164),
		NEXTBus_OUT 	=> NEXTBus_intl(163),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU164 : WindowBrain
		generic map(
			ADDRESS => 164
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(164),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(164),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(164),
		NEXTBus_IN 		=> NEXTBus_intl(163),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(165),
		NEXTBus_OUT 	=> NEXTBus_intl(164),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU165 : WindowBrain
		generic map(
			ADDRESS => 165
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(165),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(165),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(165),
		NEXTBus_IN 		=> NEXTBus_intl(164),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(166),
		NEXTBus_OUT 	=> NEXTBus_intl(165),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU166 : WindowBrain
		generic map(
			ADDRESS => 166
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(166),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(166),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(166),
		NEXTBus_IN 		=> NEXTBus_intl(165),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(167),
		NEXTBus_OUT 	=> NEXTBus_intl(166),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU167 : WindowBrain
		generic map(
			ADDRESS => 167
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(167),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(167),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(167),
		NEXTBus_IN 		=> NEXTBus_intl(166),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(168),
		NEXTBus_OUT 	=> NEXTBus_intl(167),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU168 : WindowBrain
		generic map(
			ADDRESS => 168
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(168),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(168),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(168),
		NEXTBus_IN 		=> NEXTBus_intl(167),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(169),
		NEXTBus_OUT 	=> NEXTBus_intl(168),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU169 : WindowBrain
		generic map(
			ADDRESS => 169
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(169),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(169),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(169),
		NEXTBus_IN 		=> NEXTBus_intl(168),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(170),
		NEXTBus_OUT 	=> NEXTBus_intl(169),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU170 : WindowBrain
		generic map(
			ADDRESS => 170
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(170),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(170),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(170),
		NEXTBus_IN 		=> NEXTBus_intl(169),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(171),
		NEXTBus_OUT 	=> NEXTBus_intl(170),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU171 : WindowBrain
		generic map(
			ADDRESS => 171
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(171),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(171),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(171),
		NEXTBus_IN 		=> NEXTBus_intl(170),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(172),
		NEXTBus_OUT 	=> NEXTBus_intl(171),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU172 : WindowBrain
		generic map(
			ADDRESS => 172
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(172),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(172),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(172),
		NEXTBus_IN 		=> NEXTBus_intl(171),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(173),
		NEXTBus_OUT 	=> NEXTBus_intl(172),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU173 : WindowBrain
		generic map(
			ADDRESS => 173
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(173),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(173),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(173),
		NEXTBus_IN 		=> NEXTBus_intl(172),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(174),
		NEXTBus_OUT 	=> NEXTBus_intl(173),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU174 : WindowBrain
		generic map(
			ADDRESS => 174
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(174),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(174),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(174),
		NEXTBus_IN 		=> NEXTBus_intl(173),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(175),
		NEXTBus_OUT 	=> NEXTBus_intl(174),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU175 : WindowBrain
		generic map(
			ADDRESS => 175
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(175),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(175),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(175),
		NEXTBus_IN 		=> NEXTBus_intl(174),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(176),
		NEXTBus_OUT 	=> NEXTBus_intl(175),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU176 : WindowBrain
		generic map(
			ADDRESS => 176
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(176),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(176),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(176),
		NEXTBus_IN 		=> NEXTBus_intl(175),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(177),
		NEXTBus_OUT 	=> NEXTBus_intl(176),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU177 : WindowBrain
		generic map(
			ADDRESS => 177
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(177),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(177),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(177),
		NEXTBus_IN 		=> NEXTBus_intl(176),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(178),
		NEXTBus_OUT 	=> NEXTBus_intl(177),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU178 : WindowBrain
		generic map(
			ADDRESS => 178
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(178),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(178),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(178),
		NEXTBus_IN 		=> NEXTBus_intl(177),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(179),
		NEXTBus_OUT 	=> NEXTBus_intl(178),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU179 : WindowBrain
		generic map(
			ADDRESS => 179
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(179),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(179),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(179),
		NEXTBus_IN 		=> NEXTBus_intl(178),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(180),
		NEXTBus_OUT 	=> NEXTBus_intl(179),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU180 : WindowBrain
		generic map(
			ADDRESS => 180
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(180),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(180),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(180),
		NEXTBus_IN 		=> NEXTBus_intl(179),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(181),
		NEXTBus_OUT 	=> NEXTBus_intl(180),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU181 : WindowBrain
		generic map(
			ADDRESS => 181
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(181),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(181),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(181),
		NEXTBus_IN 		=> NEXTBus_intl(180),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(182),
		NEXTBus_OUT 	=> NEXTBus_intl(181),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU182 : WindowBrain
		generic map(
			ADDRESS => 182
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(182),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(182),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(182),
		NEXTBus_IN 		=> NEXTBus_intl(181),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(183),
		NEXTBus_OUT 	=> NEXTBus_intl(182),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU183 : WindowBrain
		generic map(
			ADDRESS => 183
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(183),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(183),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(183),
		NEXTBus_IN 		=> NEXTBus_intl(182),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(184),
		NEXTBus_OUT 	=> NEXTBus_intl(183),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU184 : WindowBrain
		generic map(
			ADDRESS => 184
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(184),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(184),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(184),
		NEXTBus_IN 		=> NEXTBus_intl(183),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(185),
		NEXTBus_OUT 	=> NEXTBus_intl(184),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU185 : WindowBrain
		generic map(
			ADDRESS => 185
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(185),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(185),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(185),
		NEXTBus_IN 		=> NEXTBus_intl(184),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(186),
		NEXTBus_OUT 	=> NEXTBus_intl(185),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU186 : WindowBrain
		generic map(
			ADDRESS => 186
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(186),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(186),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(186),
		NEXTBus_IN 		=> NEXTBus_intl(185),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(187),
		NEXTBus_OUT 	=> NEXTBus_intl(186),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU187 : WindowBrain
		generic map(
			ADDRESS => 187
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(187),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(187),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(187),
		NEXTBus_IN 		=> NEXTBus_intl(186),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(188),
		NEXTBus_OUT 	=> NEXTBus_intl(187),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU188 : WindowBrain
		generic map(
			ADDRESS => 188
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(188),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(188),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(188),
		NEXTBus_IN 		=> NEXTBus_intl(187),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(189),
		NEXTBus_OUT 	=> NEXTBus_intl(188),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU189 : WindowBrain
		generic map(
			ADDRESS => 189
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(189),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(189),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(189),
		NEXTBus_IN 		=> NEXTBus_intl(188),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(190),
		NEXTBus_OUT 	=> NEXTBus_intl(189),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU190 : WindowBrain
		generic map(
			ADDRESS => 190
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(190),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(190),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(190),
		NEXTBus_IN 		=> NEXTBus_intl(189),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(191),
		NEXTBus_OUT 	=> NEXTBus_intl(190),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU191 : WindowBrain
		generic map(
			ADDRESS => 191
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(191),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(191),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(191),
		NEXTBus_IN 		=> NEXTBus_intl(190),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(192),
		NEXTBus_OUT 	=> NEXTBus_intl(191),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU192 : WindowBrain
		generic map(
			ADDRESS => 192
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(192),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(192),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(192),
		NEXTBus_IN 		=> NEXTBus_intl(191),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(193),
		NEXTBus_OUT 	=> NEXTBus_intl(192),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU193 : WindowBrain
		generic map(
			ADDRESS => 193
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(193),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(193),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(193),
		NEXTBus_IN 		=> NEXTBus_intl(192),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(194),
		NEXTBus_OUT 	=> NEXTBus_intl(193),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU194 : WindowBrain
		generic map(
			ADDRESS => 194
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(194),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(194),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(194),
		NEXTBus_IN 		=> NEXTBus_intl(193),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(195),
		NEXTBus_OUT 	=> NEXTBus_intl(194),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU195 : WindowBrain
		generic map(
			ADDRESS => 195
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(195),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(195),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(195),
		NEXTBus_IN 		=> NEXTBus_intl(194),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(196),
		NEXTBus_OUT 	=> NEXTBus_intl(195),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU196 : WindowBrain
		generic map(
			ADDRESS => 196
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(196),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(196),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(196),
		NEXTBus_IN 		=> NEXTBus_intl(195),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(197),
		NEXTBus_OUT 	=> NEXTBus_intl(196),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU197 : WindowBrain
		generic map(
			ADDRESS => 197
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(197),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(197),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(197),
		NEXTBus_IN 		=> NEXTBus_intl(196),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(198),
		NEXTBus_OUT 	=> NEXTBus_intl(197),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU198 : WindowBrain
		generic map(
			ADDRESS => 198
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(198),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(198),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(198),
		NEXTBus_IN 		=> NEXTBus_intl(197),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(199),
		NEXTBus_OUT 	=> NEXTBus_intl(198),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU199 : WindowBrain
		generic map(
			ADDRESS => 199
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(199),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(199),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(199),
		NEXTBus_IN 		=> NEXTBus_intl(198),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(200),
		NEXTBus_OUT 	=> NEXTBus_intl(199),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU200 : WindowBrain
		generic map(
			ADDRESS => 200
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(200),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(200),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(200),
		NEXTBus_IN 		=> NEXTBus_intl(199),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(201),
		NEXTBus_OUT 	=> NEXTBus_intl(200),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU201 : WindowBrain
		generic map(
			ADDRESS => 201
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(201),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(201),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(201),
		NEXTBus_IN 		=> NEXTBus_intl(200),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(202),
		NEXTBus_OUT 	=> NEXTBus_intl(201),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU202 : WindowBrain
		generic map(
			ADDRESS => 202
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(202),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(202),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(202),
		NEXTBus_IN 		=> NEXTBus_intl(201),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(203),
		NEXTBus_OUT 	=> NEXTBus_intl(202),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU203 : WindowBrain
		generic map(
			ADDRESS => 203
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(203),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(203),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(203),
		NEXTBus_IN 		=> NEXTBus_intl(202),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(204),
		NEXTBus_OUT 	=> NEXTBus_intl(203),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU204 : WindowBrain
		generic map(
			ADDRESS => 204
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(204),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(204),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(204),
		NEXTBus_IN 		=> NEXTBus_intl(203),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(205),
		NEXTBus_OUT 	=> NEXTBus_intl(204),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU205 : WindowBrain
		generic map(
			ADDRESS => 205
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(205),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(205),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(205),
		NEXTBus_IN 		=> NEXTBus_intl(204),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(206),
		NEXTBus_OUT 	=> NEXTBus_intl(205),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU206 : WindowBrain
		generic map(
			ADDRESS => 206
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(206),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(206),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(206),
		NEXTBus_IN 		=> NEXTBus_intl(205),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(207),
		NEXTBus_OUT 	=> NEXTBus_intl(206),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU207 : WindowBrain
		generic map(
			ADDRESS => 207
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(207),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(207),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(207),
		NEXTBus_IN 		=> NEXTBus_intl(206),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(208),
		NEXTBus_OUT 	=> NEXTBus_intl(207),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU208 : WindowBrain
		generic map(
			ADDRESS => 208
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(208),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(208),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(208),
		NEXTBus_IN 		=> NEXTBus_intl(207),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(209),
		NEXTBus_OUT 	=> NEXTBus_intl(208),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU209 : WindowBrain
		generic map(
			ADDRESS => 209
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(209),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(209),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(209),
		NEXTBus_IN 		=> NEXTBus_intl(208),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(210),
		NEXTBus_OUT 	=> NEXTBus_intl(209),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU210 : WindowBrain
		generic map(
			ADDRESS => 210
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(210),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(210),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(210),
		NEXTBus_IN 		=> NEXTBus_intl(209),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(211),
		NEXTBus_OUT 	=> NEXTBus_intl(210),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU211 : WindowBrain
		generic map(
			ADDRESS => 211
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(211),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(211),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(211),
		NEXTBus_IN 		=> NEXTBus_intl(210),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(212),
		NEXTBus_OUT 	=> NEXTBus_intl(211),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU212 : WindowBrain
		generic map(
			ADDRESS => 212
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(212),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(212),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(212),
		NEXTBus_IN 		=> NEXTBus_intl(211),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(213),
		NEXTBus_OUT 	=> NEXTBus_intl(212),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU213 : WindowBrain
		generic map(
			ADDRESS => 213
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(213),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(213),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(213),
		NEXTBus_IN 		=> NEXTBus_intl(212),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(214),
		NEXTBus_OUT 	=> NEXTBus_intl(213),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU214 : WindowBrain
		generic map(
			ADDRESS => 214
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(214),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(214),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(214),
		NEXTBus_IN 		=> NEXTBus_intl(213),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(215),
		NEXTBus_OUT 	=> NEXTBus_intl(214),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU215 : WindowBrain
		generic map(
			ADDRESS => 215
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(215),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(215),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(215),
		NEXTBus_IN 		=> NEXTBus_intl(214),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(216),
		NEXTBus_OUT 	=> NEXTBus_intl(215),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU216 : WindowBrain
		generic map(
			ADDRESS => 216
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(216),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(216),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(216),
		NEXTBus_IN 		=> NEXTBus_intl(215),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(217),
		NEXTBus_OUT 	=> NEXTBus_intl(216),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU217 : WindowBrain
		generic map(
			ADDRESS => 217
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(217),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(217),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(217),
		NEXTBus_IN 		=> NEXTBus_intl(216),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(218),
		NEXTBus_OUT 	=> NEXTBus_intl(217),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU218 : WindowBrain
		generic map(
			ADDRESS => 218
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(218),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(218),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(218),
		NEXTBus_IN 		=> NEXTBus_intl(217),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(219),
		NEXTBus_OUT 	=> NEXTBus_intl(218),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU219 : WindowBrain
		generic map(
			ADDRESS => 219
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(219),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(219),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(219),
		NEXTBus_IN 		=> NEXTBus_intl(218),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(220),
		NEXTBus_OUT 	=> NEXTBus_intl(219),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU220 : WindowBrain
		generic map(
			ADDRESS => 220
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(220),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(220),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(220),
		NEXTBus_IN 		=> NEXTBus_intl(219),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(221),
		NEXTBus_OUT 	=> NEXTBus_intl(220),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU221 : WindowBrain
		generic map(
			ADDRESS => 221
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(221),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(221),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(221),
		NEXTBus_IN 		=> NEXTBus_intl(220),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(222),
		NEXTBus_OUT 	=> NEXTBus_intl(221),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU222 : WindowBrain
		generic map(
			ADDRESS => 222
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(222),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(222),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(222),
		NEXTBus_IN 		=> NEXTBus_intl(221),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(223),
		NEXTBus_OUT 	=> NEXTBus_intl(222),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU223 : WindowBrain
		generic map(
			ADDRESS => 223
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(223),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(223),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(223),
		NEXTBus_IN 		=> NEXTBus_intl(222),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(224),
		NEXTBus_OUT 	=> NEXTBus_intl(223),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU224 : WindowBrain
		generic map(
			ADDRESS => 224
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(224),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(224),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(224),
		NEXTBus_IN 		=> NEXTBus_intl(223),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(225),
		NEXTBus_OUT 	=> NEXTBus_intl(224),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU225 : WindowBrain
		generic map(
			ADDRESS => 225
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(225),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(225),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(225),
		NEXTBus_IN 		=> NEXTBus_intl(224),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(226),
		NEXTBus_OUT 	=> NEXTBus_intl(225),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU226 : WindowBrain
		generic map(
			ADDRESS => 226
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(226),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(226),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(226),
		NEXTBus_IN 		=> NEXTBus_intl(225),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(227),
		NEXTBus_OUT 	=> NEXTBus_intl(226),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU227 : WindowBrain
		generic map(
			ADDRESS => 227
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(227),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(227),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(227),
		NEXTBus_IN 		=> NEXTBus_intl(226),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(228),
		NEXTBus_OUT 	=> NEXTBus_intl(227),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU228 : WindowBrain
		generic map(
			ADDRESS => 228
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(228),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(228),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(228),
		NEXTBus_IN 		=> NEXTBus_intl(227),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(229),
		NEXTBus_OUT 	=> NEXTBus_intl(228),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU229 : WindowBrain
		generic map(
			ADDRESS => 229
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(229),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(229),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(229),
		NEXTBus_IN 		=> NEXTBus_intl(228),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(230),
		NEXTBus_OUT 	=> NEXTBus_intl(229),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU230 : WindowBrain
		generic map(
			ADDRESS => 230
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(230),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(230),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(230),
		NEXTBus_IN 		=> NEXTBus_intl(229),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(231),
		NEXTBus_OUT 	=> NEXTBus_intl(230),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU231 : WindowBrain
		generic map(
			ADDRESS => 231
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(231),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(231),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(231),
		NEXTBus_IN 		=> NEXTBus_intl(230),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(232),
		NEXTBus_OUT 	=> NEXTBus_intl(231),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU232 : WindowBrain
		generic map(
			ADDRESS => 232
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(232),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(232),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(232),
		NEXTBus_IN 		=> NEXTBus_intl(231),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(233),
		NEXTBus_OUT 	=> NEXTBus_intl(232),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU233 : WindowBrain
		generic map(
			ADDRESS => 233
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(233),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(233),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(233),
		NEXTBus_IN 		=> NEXTBus_intl(232),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(234),
		NEXTBus_OUT 	=> NEXTBus_intl(233),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU234 : WindowBrain
		generic map(
			ADDRESS => 234
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(234),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(234),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(234),
		NEXTBus_IN 		=> NEXTBus_intl(233),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(235),
		NEXTBus_OUT 	=> NEXTBus_intl(234),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU235 : WindowBrain
		generic map(
			ADDRESS => 235
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(235),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(235),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(235),
		NEXTBus_IN 		=> NEXTBus_intl(234),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(236),
		NEXTBus_OUT 	=> NEXTBus_intl(235),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU236 : WindowBrain
		generic map(
			ADDRESS => 236
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(236),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(236),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(236),
		NEXTBus_IN 		=> NEXTBus_intl(235),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(237),
		NEXTBus_OUT 	=> NEXTBus_intl(236),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU237 : WindowBrain
		generic map(
			ADDRESS => 237
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(237),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(237),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(237),
		NEXTBus_IN 		=> NEXTBus_intl(236),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(238),
		NEXTBus_OUT 	=> NEXTBus_intl(237),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU238 : WindowBrain
		generic map(
			ADDRESS => 238
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(238),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(238),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(238),
		NEXTBus_IN 		=> NEXTBus_intl(237),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(239),
		NEXTBus_OUT 	=> NEXTBus_intl(238),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU239 : WindowBrain
		generic map(
			ADDRESS => 239
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(239),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(239),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(239),
		NEXTBus_IN 		=> NEXTBus_intl(238),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(240),
		NEXTBus_OUT 	=> NEXTBus_intl(239),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU240 : WindowBrain
		generic map(
			ADDRESS => 240
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(240),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(240),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(240),
		NEXTBus_IN 		=> NEXTBus_intl(239),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(241),
		NEXTBus_OUT 	=> NEXTBus_intl(240),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU241 : WindowBrain
		generic map(
			ADDRESS => 241
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(241),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(241),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(241),
		NEXTBus_IN 		=> NEXTBus_intl(240),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(242),
		NEXTBus_OUT 	=> NEXTBus_intl(241),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU242 : WindowBrain
		generic map(
			ADDRESS => 242
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(242),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(242),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(242),
		NEXTBus_IN 		=> NEXTBus_intl(241),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(243),
		NEXTBus_OUT 	=> NEXTBus_intl(242),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU243 : WindowBrain
		generic map(
			ADDRESS => 243
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(243),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(243),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(243),
		NEXTBus_IN 		=> NEXTBus_intl(242),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(244),
		NEXTBus_OUT 	=> NEXTBus_intl(243),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU244 : WindowBrain
		generic map(
			ADDRESS => 244
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(244),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(244),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(244),
		NEXTBus_IN 		=> NEXTBus_intl(243),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(245),
		NEXTBus_OUT 	=> NEXTBus_intl(244),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU245 : WindowBrain
		generic map(
			ADDRESS => 245
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(245),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(245),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(245),
		NEXTBus_IN 		=> NEXTBus_intl(244),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(246),
		NEXTBus_OUT 	=> NEXTBus_intl(245),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU246 : WindowBrain
		generic map(
			ADDRESS => 246
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(246),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(246),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(246),
		NEXTBus_IN 		=> NEXTBus_intl(245),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(247),
		NEXTBus_OUT 	=> NEXTBus_intl(246),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU247 : WindowBrain
		generic map(
			ADDRESS => 247
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(247),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(247),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(247),
		NEXTBus_IN 		=> NEXTBus_intl(246),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(248),
		NEXTBus_OUT 	=> NEXTBus_intl(247),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU248 : WindowBrain
		generic map(
			ADDRESS => 248
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(248),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(248),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(248),
		NEXTBus_IN 		=> NEXTBus_intl(247),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(249),
		NEXTBus_OUT 	=> NEXTBus_intl(248),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU249 : WindowBrain
		generic map(
			ADDRESS => 249
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(249),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(249),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(249),
		NEXTBus_IN 		=> NEXTBus_intl(248),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(250),
		NEXTBus_OUT 	=> NEXTBus_intl(249),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU250 : WindowBrain
		generic map(
			ADDRESS => 250
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(250),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(250),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(250),
		NEXTBus_IN 		=> NEXTBus_intl(249),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(251),
		NEXTBus_OUT 	=> NEXTBus_intl(250),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU251 : WindowBrain
		generic map(
			ADDRESS => 251
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(251),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(251),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(251),
		NEXTBus_IN 		=> NEXTBus_intl(250),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(252),
		NEXTBus_OUT 	=> NEXTBus_intl(251),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU252 : WindowBrain
		generic map(
			ADDRESS => 252
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(252),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(252),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(252),
		NEXTBus_IN 		=> NEXTBus_intl(251),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(253),
		NEXTBus_OUT 	=> NEXTBus_intl(252),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU253 : WindowBrain
		generic map(
			ADDRESS => 253
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(253),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(253),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(253),
		NEXTBus_IN 		=> NEXTBus_intl(252),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(254),
		NEXTBus_OUT 	=> NEXTBus_intl(253),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU254 : WindowBrain
		generic map(
			ADDRESS => 254
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(254),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(254),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(254),
		NEXTBus_IN 		=> NEXTBus_intl(253),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(255),
		NEXTBus_OUT 	=> NEXTBus_intl(254),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

	CPU255 : WindowBrain
		generic map(
			ADDRESS => 255
		)
		Port map(
		nrst			=> nrst,
		clr				=> CLR,
		CLK				=> CLK,
		CPUBus 			=> CPUBus,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,

		--CurAddr			=> CurWindowCnt,
		CurAddrBit			=> CurAddrBit(255),
		--OldAddr			=> OldWindowCnt,
		OldAddrBit			=> OldAddrBit(255),

		-- Previous Side
		PREVBus_OUT 	=> PREVBus_intl(255),
		NEXTBus_IN 		=> NEXTBus_intl(254),

		-- Next Side
		PREVBus_IN 		=> PREVBus_intl(0),
		NEXTBus_OUT 	=> NEXTBus_intl(255),

		NextAddr		=> NextAddrBus_s,
		PrevAddr		=> PrevAddrBus_s
		);

end Behavioral;
