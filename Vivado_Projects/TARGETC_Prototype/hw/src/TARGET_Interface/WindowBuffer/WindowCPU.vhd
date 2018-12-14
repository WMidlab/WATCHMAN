
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity WindowCPU is
	generic(
		ADDRESS : integer := 0;
		MIN_LE_TIME : integer := 3;	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
		MIN_TE_TIME : integer := 1; -- 4 ns after falling of trigger
		MAX_LONGPULSE : integer := 16
	);
	Port (
	
	nrst : 			in	std_Logic;
--	SSTIN:			in std_logic;
	CLK:			in 	std_logic;
	
	--Window Part
	cmd :			in 	std_logic_vector(2 downto 0);
	cmd_en:			in 	std_logic;

	wr1_en :		out std_logic;
	wr2_en :		out	std_logic;
	valid_o	:		out std_logic;
	triginfo:		out std_logic_vector(11 downto 0);

	
	CurAddr:		in 	std_logic_vector(7 downto 0);
	PREVBus_IN :	in	std_logic_vector(7 downto 0);
	PREVBus_OUT :	out	std_logic_vector(7 downto 0);
	NEXTBus_IN :	in	std_logic_vector(7 downto 0);
	NEXTBus_OUT :	out	std_logic_vector(7 downto 0);
	
	--Trigger Part
	SampleCnt :		in std_logic_vector(3 downto 0);
	trigger :		in std_logic_vector(3 downto 0);
	
	PREVWDO_IN :	in	std_logic;
	PREVWDO_OUT :	out	std_logic;
	NEXTWDO_IN :	in	std_logic;
	NEXTWDO_OUT :	out	std_logic
	);

end WindowCPU;

architecture Behavioral of WindowCPU is

	component TriggerCell is
	generic(
		SG_ID : MODE_t;
		MIN_LE_TIME : integer := 3;	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
		MIN_TE_TIME : integer := 1; -- 4 ns after falling of trigger
		MAX_LONGPULSE : integer := 16		-- If pulse is longer than 64 ns
	);
	Port (
		nrst : 			in	std_Logic;
--		clear:			in	std_logic;
		clk  :			in	std_logic;
		trig_en	:		in	std_logic;
		trigger :		in 	std_logic;
	--	trigger :		in 	std_logic_vector(3 downto 0);
		SCnt:		in 	std_logic_vector(3 downto 0);
		triginfo:		out std_logic_vector(11 downto 0);
		wr1_trig :		out std_logic;
		wr2_trig :		out std_logic;
	
		PREVWDO_IN :	in	std_logic;
		PREVWDO_OUT :	out	std_logic;
		NEXTWDO_IN :	in	std_logic;
		NEXTWDO_OUT :	out	std_logic
	);

	end component TriggerCell;
	signal wr1_en_intl : std_logic;
	signal wr2_en_intl : std_logic;
	
	signal wr1_mark_flg : std_logic;
	signal wr2_mark_flg : std_logic;	

	signal wr1_reg : std_logic_vector(1 downto 0);
	signal wr2_reg : std_logic_vector(1 downto 0);

	signal wr1_flg : std_logic;
	signal wr2_flg : std_logic;

	signal PREVBus_intl : std_logic_vector(7 downto 0);
	signal NEXTBus_intl : std_logic_vector(7 downto 0);

	type WindowCPU_state_type is (
		IDLE,
		VALID,
		RESPVALID
	);
	signal CPU_stm : WindowCPU_state_type := IDLE;
	
	signal wr1_trig, wr1_trig_EVEN, wr1_trig_ODD : std_logic;
	signal wr2_trig, wr2_trig_EVEN, wr2_trig_ODD : std_logic;
	signal EvenOdd_prev : std_logic;
	signal EvenOdd_next : std_logic;
	
	signal TrigInfo_Even, TrigInfo_Odd : std_logic_vector(11 downto 0);
	
begin

	
	--Trigger Circuit
	Cell_EVEN : TriggerCell
		generic map(
			SG_ID => EVEN,
			MIN_LE_TIME => 3,	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
			MIN_TE_TIME => 1, -- 4 ns after falling of trigger
			MAX_LONGPULSE => 16	
		)
		Port map(
		nrst			=> nrst,
		CLK				=> CLK,

		trig_en			=> '0',
		trigger 		=> trigger(0),
		triginfo		=> triginfo_EVEN,
		SCnt			=> SampleCnt,
		
		wr1_trig 			=> wr1_trig_EVEN,
		wr2_trig			=> wr2_trig_EVEN,

		PREVWDO_IN => PREVWDO_IN,
		PREVWDO_OUT =>  PREVWDO_OUT,
		NEXTWDO_IN 	=> EvenOdd_prev,
		NEXTWDO_OUT => EvenOdd_next
		);


	Cell_ODD : TriggerCell
		generic map(
			SG_ID => ODD,
			MIN_LE_TIME => 3,	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
			MIN_TE_TIME => 1, -- 4 ns after falling of trigger
			MAX_LONGPULSE => 16	
		)
		Port map(
		nrst			=> nrst,
		CLK				=> CLK,

		trig_en			=> '0',
		trigger 		=> trigger(0),
		triginfo		=> triginfo_ODD,
		SCnt			=> SampleCnt,
		
		wr1_trig 			=> wr1_trig_ODD,
		wr2_trig			=> wr2_trig_ODD,

		PREVWDO_IN => EvenOdd_next,
		PREVWDO_OUT => EvenOdd_prev,
		NEXTWDO_IN 	=> NEXTWDO_IN,
		NEXTWDO_OUT => NEXTWDO_OUT
		);


	wr1_trig <= '0' when  wr1_trig_EVEN = '0' or wr1_trig_ODD = '0' else '1';
	wr2_trig <= '0' when  wr2_trig_EVEN = '0' or wr2_trig_ODD = '0' else '1';
	
	process (triginfo_EVEN,triginfo_ODD) is
	begin
		for I in 11 downto 0 loop
		    triginfo(I) <= triginfo_EVEN(I) or triginfo_EVEN(I);
		end loop;
    end process;
	
	-- General Process
	process(CLK, nRST)
	begin
		if nrst = '0' then
			wr1_en_intl <= '1';
			wr2_en_intl <= '1';
			wr1_flg <= '0';
			wr2_flg <= '0';
			
			wr1_mark_flg <= '0';
			wr2_mark_flg <= '0';
				
			wr1_reg <= (others => '1');
			wr2_reg <= (others => '1');
			
			CPU_stm <= IDLE;
		else
			if rising_edge(clk) then

				-- Received Command from Control
				if cmd_en = '1' then
					case cmd is
						when CMD_WR1_EN =>
							wr1_en_intl <= '0';
							wr2_en_intl <= '1';
						when CMD_WR2_EN =>
							wr1_en_intl <= '1';
							wr2_en_intl <= '0';
						when CMD_BOTH_EN =>
							wr1_en_intl <= '0';
							wr2_en_intl <= '0';
						when CMD_WR1_EN_DIS =>
							wr1_flg <= '1';
						when CMD_WR2_EN_DIS =>
							wr2_flg <= '1';
						when CMD_WR1_MARKED =>
							wr1_mark_flg <= '1';
						when CMD_WR2_MARKED =>
							wr2_mark_flg <= '1';
						when CMD_BOTH_MARKED =>
							wr1_mark_flg <= '1';
							wr2_mark_flg <= '1';
						when others =>
					end case;
				end if;

				-- Marked TRIGGER STM
				if CurAddr = NEXTBus_IN then
					if (wr1_trig = '0') then
						wr1_en_intl <= '0';
					end if;

					if (wr1_trig = '0') then
						wr1_en_intl <= '0';
					end if;
				end if;

				-- Marked STM
				if CurAddr = NEXTBus_IN then
					if (wr1_mark_flg = '1') then
						wr1_en_intl <= '0';
						wr1_mark_flg <= '0';
					end if;

					if (wr2_mark_flg = '1') then
						wr2_en_intl <= '0';
						wr2_mark_flg <= '0';
					end if;
				end if;

				-- Re-Entry STM
				if CurAddr /= std_logic_vector(to_unsigned(ADDRESS,8)) and CurAddr /= PREVBus_In and CurAddr /= NextBus_In then
					if (wr1_flg = '1') then
						wr1_en_intl <= '1';
						wr1_flg <= '0';
					end if;

					if (wr2_flg = '1') then
						wr2_en_intl <= '1';
						wr2_flg <= '0';
					end if;
				end if;
				
			end if;
		end if;
	end process;

	valid_o <= 	'1'	when wr1_en_intl = '0' or wr2_en_intl = '0' else '0';
	
	wr1_en	<= '0' when wr1_en_intl = '0' else '1';
	wr2_en	<= '0' when wr2_en_intl = '0' else '1';	
		
	PREVBus_intl <= std_logic_vector(to_unsigned(ADDRESS,PREVBus_intl'length)) when ((wr1_en_intl='1') and (wr2_en_intl='1')) else PREVBus_In;

	NEXTBus_intl <= std_logic_vector(to_unsigned(ADDRESS,NEXTBus_intl'length)) when ((wr1_en_intl='1') and (wr2_en_intl='1')) else NEXTBus_In;

	PREVBus_Out <= PREVBus_intl;
	NEXTBus_Out <= NEXTBus_intl;
end Behavioral;
