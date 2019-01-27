library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.WindowCPU_PKG.all;
use work.TARGETC_pkg.all;

entity TriggerBrainControlV2 is
	Generic(
		NBRWINDOWS : integer := 16;
		MIN_LE_TIME : integer := 3;	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
		MIN_TE_TIME : integer := 1; -- 4 ns after falling of trigger
		MAX_TRIG_TIME: integer := 32
	);
	Port (
	nrst : 			in	STD_Logic;
	ClockBus:		in T_ClockBus;
	SCnt:			in	std_logic_vector(3 downto 0);

	trigger : 		in std_logic_vector(3 downto 0);

	-- Interface to WindowCPU
	CurAddr:		in std_logic_vector(7 downto 0);
	OldAddr:		in std_logic_vector(7 downto 0);

	CPUMode:		in 	std_logic;
	CPUBus:			out	std_logic_vector(10 downto 0);
	TriggerInfo :		out std_logic_vector(11 downto 0)

	);

end TriggerBrainControlV2;

architecture Behavioral of TriggerBrainControlV2 is

	component BlockDelay is
		generic(
			NBR : integer := 16
		);
		Port (
		nrst : 		in	STD_Logic;
		clk:		in std_logic;

		Scnt:		in	std_logic_vector(3 downto 0);

		D : 		in	std_logic;
		Q:			out	std_logic

		);

	end component BlockDelay;

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
	signal TrigInfo_Bus,TrigInfo_Bus_dly, old_triginfo, TrigInfoLE_Bus : std_logic_vector(11 downto 0);
	signal TrigInfo_A : t_triggerinformationSingle;
	signal TrigInfo_B : t_triggerinformationSingle;
	signal TrigInfo_C : t_triggerinformationSingle;
	signal TrigInfo_D : t_triggerinformationSingle;

	signal trig_intl, trigdly_intl, last_intl, LE_intl, TE_intl : std_logic;
	signal flg_TE, flg_LE : std_logic;
	signal CPUBus_intl:			std_logic_vector(10 downto 0);
	signal NextAddr_intl, PrevAddr_intl:			std_logic_vector(7 downto 0);

	signal prev_OldAddr_intl :	std_logic_vector(7 downto 0);
	signal D_wr1_en, Wr1_en_dly : std_logic;
	signal D_wr2_en, Wr2_en_dly : std_logic;
	signal Old_Wr_en : std_logic_vector(1 downto 0);
	signal prevTrigger : std_logic;

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
					--TrigInfoLE_Bus when flg_LE = '1' else
					Old_TrigInfo;


	Trig_intl <= TrigInfo_Bus(0) or TrigInfo_Bus(1) or TrigInfo_Bus(2) or TrigInfo_Bus(3);

	Last_intl <= TrigInfo_Bus(4) or TrigInfo_Bus(5) or TrigInfo_Bus(6) or TrigInfo_Bus(7);
	-- Last_intl <= 	'1' when TrigInfo_Bus(7 downto 4) = "0001" else
	-- 				'1' when TrigInfo_Bus(7 downto 4) = "0010" else
	-- 				'1' when TrigInfo_Bus(7 downto 4) = "0100" else
	-- 				'1' when TrigInfo_Bus(7 downto 4) = "1000" else
	-- 				'0';

	CPUBus <= CPUBus_intl when CPUMode = '1' else (others => 'Z');

	-- Process for Clock the Address
	process(ClockBus.SSTIN,nrst)
	begin
		if nrst='0' then
			Old_Wr_en <= (others => '1');
			Old_TrigInfo <= (others => '0');
		else
			if rising_edge(ClockBus.SSTIN) then
				Old_TrigInfo <= TrigInfo_Bus_dly;
				Old_Wr_en	<= not(wr2_en_dly) & not(wr1_en_dly);
				-- Old_Wr1_en		<= wr1_en_dly;
				-- Old_Wr2_en		<= wr2_en_dly;
			end if;
		end if;
	end process;

	--Process to send on CPUBus
	process(ClockBus.CLK250MHz,nrst)
	begin
		if nrst='0' then
				CPUBus_intl <= CMD_NOP & x"00";
				prev_OldAddr_intl <= OldAddr;
				TrigDly_intl <= '0';
		else
			if rising_edge(ClockBus.CLK250MHz) then

				TrigDly_intl <= Trig_intl;

				if OldAddr /= prev_OldAddr_intl then
					prev_OldAddr_intl <= OldAddr;

					--flg_LE <= '0';

					--Send the command
					if Old_TrigInfo /= "000000000000" then
						case Old_Wr_en is
							when "00" =>
								CPUBus_intl <= CMD_BOTH_MARKED & OldAddr;
							when "01" =>
								CPUBus_intl <= CMD_WR2_MARKED & OldAddr;
							when "10" =>
								CPUBus_intl <= CMD_WR1_MARKED & OldAddr;
							when "11" =>
								CPUBus_intl <= CMD_NOP & OldAddr;
							when others =>
						end case;
					else
						CPUBus_intl <= CMD_NOP & OldAddr;
					end if;
				else

					-- if Trig_intl = '1' then
					--
					-- 	--LE
					-- 	if TrigDly_intl = '0' and LE_intl='1' and flg_LE='0'  then
					-- 		CPUBus_intl <= CMD_WR2_MARKED & OldAddr;
					-- 		TrigInfoLE_Bus <= TrigInfo_Bus;
					-- 		flg_LE <= '1';
					-- 	end if;
					-- else
					-- 	CPUBus_intl <= CMD_NOP & x"00";
					-- 	TrigInfoLE_Bus <= (others => '0');
					-- 	flg_LE <= '0';
					-- end if;
					CPUBus_intl <= CMD_NOP & x"00";
				end if;

			end if;
		end if;
	end process;

	--Block Delay generation For :
	--	- All trigger signals
	--	- LE and TE
	--	- Wr1 and Wr2



	GEN_DLY_TRIG : for I in 0 to 11 generate
		Dly_Trig : BlockDelay
			generic map(
				NBR => 16
			)
			port map(
				nrst 	=> nrst,
				clk		=> ClockBus.Clk250Mhz,

				SCnt	=> SCnt,
				D		=> TrigInfo_Bus(I),
				Q		=> TrigInfo_Bus_dly(I)
			);
	end generate;

	Dly_WR1 : BlockDelay
		generic map(
			NBR => 16
		)
		port map(
			nrst 	=> nrst,
			clk		=> ClockBus.Clk250Mhz,

			SCnt	=> SCnt,
			D		=> D_wr1_en,
			Q		=> wr1_en_dly
		);

	Dly_WR2 : BlockDelay
		generic map(
			NBR => 16
		)
		port map(
			nrst 	=> nrst,
			clk		=> ClockBus.Clk250Mhz,

			SCnt	=> SCnt,
			D		=> D_wr2_en,
			Q		=> wr2_en_dly
		);
	-- Process for the wr signals
	process(ClockBus.CLK250MHz,nrst)	-- Every 64 ns
	begin
		if nRST = '0' then
			prevTrigger <= '0';

			D_wr1_en <= '0';
			D_wr2_en <= '0';
		else
			if rising_edge(ClockBus.CLK250MHz) then
				prevTrigger <= Trig_intl;

				if prevTrigger = '1' or Trig_intl = '1' then
					if SCnt(3) = '1' then
						D_wr1_en <= '1';
					else
						D_wr2_en <= '1';
					end if;
				else
					D_wr1_en <= '0';
					D_wr2_en <= '0';
				end if;

			end if;
		end if;
	end process;


end Behavioral;
