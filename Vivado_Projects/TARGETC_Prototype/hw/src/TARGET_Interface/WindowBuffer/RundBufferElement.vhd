
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--use work.TARGETC_pkg.all;
use work.WindowCPU_pkg_old.all;

entity RoundBufferElement is
		Generic (
			ADDRESS : integer := 0;
			MIN_LE_TIME : integer := 3;
			MIN_TE_TIME : integer := 1; -- 4 ns after falling of trigger
			MAX_LONGPULSE : integer := 16
		);
		port (

		nrst : 			in	std_Logic;
		--	SSTIN:			in std_logic;
		CLK:			in 	std_logic;

		Scnt:			in	std_logic_vector(3 downto 0);

		trigger:		in	std_logic_vector(3 downto 0);

		--Window Part
		cmd :			in 	std_logic_vector(2 downto 0);
		cmd_en:			in 	std_logic;

		wr1_en :		out std_logic;
		wr2_en :		out	std_logic;
		valid_o	:		out std_logic;
		TrigInfo_OUT:	out std_logic_vector(11 downto 0);

		-- CPU
		CurAddr:		in 	std_logic_vector(7 downto 0);
		PREVBus_IN :	in	std_logic_vector(7 downto 0);
		PREVBus_OUT :	out	std_logic_vector(7 downto 0);
		NEXTBus_IN :	in	std_logic_vector(7 downto 0);
		NEXTBus_OUT :	out	std_logic_vector(7 downto 0);

		-- Next Side
		nexttrigger :	out	std_logic_vector(3 downto 0);
		NEXTWDO_OUT:	out	std_logic_vector(3 downto 0);
		PREVWDO_IN :	in	std_logic_vector(3 downto 0);

		-- Previous Side
		prevtrigger :	in	std_logic_vector(3 downto 0);
		PREVWDO_OUT:	out	std_logic_vector(3 downto 0);
		NEXTWDO_IN 	:	in	std_logic_vector(3 downto 0)
		);
end RoundBufferElement;

architecture Behavioral of RoundBufferElement is

	component TriggerCPU is
		generic(
			ADDRESS : integer := 0;
			MIN_LE_TIME : integer := 3;	-- All times are x4 ns so 2 is equal to 8ns = 12 samples before rise of trigger
			MIN_TE_TIME : integer := 1; -- 4 ns after falling of trigger
			MAX_LONGPULSE : integer := 16		-- If pulse is longer than 64 ns
		);
		Port(
		nrst : 		in	std_Logic;
		clk  : 		in	std_logic;
		Trigger :	in 	std_logic;
	--	TrigCLR:	in 	std_logic;
		--TrigEN:		in	std_logic;
		CurAddr:	in 	std_logic_vector(7 downto 0);
		SCnt :		in	std_logic_vector(3 downto 0);

		response_i : 	in	std_logic;
		valid_o	:		out	std_logic;

		wr1_trig:		out std_logic;
		wr2_trig:		out std_logic;
		last :			out std_logic;

		-- Next Side
		nexttrigger :	out	std_logic;
		NEXTWDO_OUT :	out	std_logic;
		PREVWDO_IN :	in	std_logic;

		-- Previous Side

		prevtrigger :	in	std_logic;
		PREVWDO_OUT :	out	std_logic;
		NEXTWDO_IN :	in	std_logic
		);
	end component TriggerCPU;


	component WindowCPU is
		generic(
			ADDRESS : integer := 0
		);
		Port (

		nrst : 			in	std_Logic;
	--	SSTIN:			in std_logic;
		CLK:			in 	std_logic;

		--Window Part
		cmd :			in 	std_logic_vector(2 downto 0);
		cmd_en:			in 	std_logic;

		-- Trigger Communication
		TrigInfo_IN:	in t_triggerinformation;
		TrigInfo_OUT:	out std_logic_vector(11 downto 0);
		wr1_trig :		in std_logic;
		wr2_trig :		in std_logic;

		valid_i	:		in std_logic;
		response_o:		out std_logic;

		-- External I/Os
		wr1_en :		out std_logic;
		wr2_en :		out	std_logic;
		valid_o	:		out std_logic;

		CurAddr:		in 	std_logic_vector(7 downto 0);
		PREVBus_IN :	in	std_logic_vector(7 downto 0);
		PREVBus_OUT :	out	std_logic_vector(7 downto 0);
		NEXTBus_IN :	in	std_logic_vector(7 downto 0);
		NEXTBus_OUT :	out	std_logic_vector(7 downto 0)
		);
	end component WindowCPU;

	-- ------------------------------------------------
	-- Signals
	signal response_intl, valid_single_intl : std_logic;
	signal valid_intl : std_logic_vector(3 downto 0);
	
	signal wr1_trig_intl:	std_logic_vector(3 downto 0);
	signal wr2_trig_intl:	std_logic_vector(3 downto 0);
	signal last_intl:	std_logic_vector(3 downto 0);

	signal trigger_bits : 	std_logic_vector(3 downto 0);
	signal last_bits :		std_logic_vector(3 downto 0);
	signal longpulse_bits:	std_logic_vector(3 downto 0);

	signal trigger_information_intl:  t_triggerinformation ;
	signal triginfo_intl:	std_logic_vector(11 downto 0);

	signal TrigCLR_intl : std_logic_vector(3 downto 0);
	type t_triggerreg is array (3 downto 0) of std_logic_vector(1 downto 0);
	signal trigger_reg : t_triggerreg;
	signal wr1_trig_single : std_logic;
	signal wr2_trig_single : std_logic;

	signal wr1_en_intl : std_logic;
	signal wr2_en_intl : std_logic;

	signal nexttrigger_intl : std_logic_vector(3 downto 0);
	signal PREVWDO_OUT_intl : std_logic_vector(3 downto 0);
	signal NEXTWDO_OUT_intl : std_logic_vector(3 downto 0);

begin

	-- Window WindowCPU
	CPU : WindowCPU
		generic map(
			ADDRESS 		=> ADDRESS
		)
		Port map(

		nrst 			=> nrst,
		CLK				=> CLK,

		--Window Part
		cmd 			=> cmd,
		cmd_en			=> cmd_en,

		TrigInfo_IN		=> trigger_information_intl,
		TrigInfo_OUT	=> TrigInfo_intl,

		valid_i		=> valid_single_intl,
		response_o	=> response_intl,

		wr1_en 			=> wr1_en_intl,
		wr2_en			=> wr2_en_intl,
		wr1_trig		=> wr1_trig_single,
		wr2_trig		=> wr2_trig_single,

		valid_o			=> valid_o,

		CurAddr			=> CurAddr,
		PREVBus_IN 		=> PREVBus_IN,
		PREVBus_OUT 	=> PREVBus_OUT,
		NEXTBus_IN 		=> NEXTBus_IN,
		NEXTBus_OUT 	=> NEXTBus_OUT
		);

	wr1_en <= wr1_en_intl;
	wr2_en <= wr2_en_intl;

	wr1_trig_single <= '0' when wr1_trig_intl /= "1111" else '1';
	wr2_trig_single <= '0' when wr2_trig_intl /= "1111" else '1';

	TrigInfo_OUT <= TrigInfo_intl;

	-- Trigger CLR counts until too long pulse and CLEARs the RoundBufferElement
	process(nRST,CLK)
	begin
		if nRST = '0' then
			TrigCLR_intl <= (others => '0');
			trigger_reg(0) <= (others => '0');
			trigger_reg(1) <= (others => '0');
			trigger_reg(2) <= (others => '0');
			trigger_reg(3) <= (others => '0');
		else
			if rising_edge(clk) then
				trigger_reg(0) <= trigger_reg(0)(0) & trigger(0);
				trigger_reg(1) <= trigger_reg(1)(0) & trigger(1);
				trigger_reg(2) <= trigger_reg(2)(0) & trigger(2);
				trigger_reg(3) <= trigger_reg(3)(0) & trigger(3);

				-- Trigger #0
				case trigger_reg(0) is
					when "11" => 	-- Too Long Use
						if trigger(0) = '0' then
							TrigCLR_intl(0) <= '1';
						end if;
					when "10" =>
						TrigCLR_intl(0) <= '0';
					when others =>
						TrigCLR_intl(0) <= '0';
				end case;

				-- Trigger #1
				case trigger_reg(1) is
					when "11" => 	-- Too Long Use
						if trigger(1) = '0' then
							TrigCLR_intl(1) <= '1';
						end if;
					when "10" =>
						TrigCLR_intl(1) <= '0';
					when others =>
						TrigCLR_intl(1) <= '0';
				end case;

				-- Trigger #2
				case trigger_reg(2) is
					when "11" => 	-- Too Long Use
						if trigger(2) = '0' then
							TrigCLR_intl(2) <= '1';
						end if;
					when "10" =>
						TrigCLR_intl(2) <= '0';
					when others =>
						TrigCLR_intl(2) <= '0';
				end case;

				-- Trigger #3
				case trigger_reg(3) is
					when "11" => 	-- Too Long Use
						if trigger(3) = '0' then
							TrigCLR_intl(3) <= '1';
						end if;
					when "10" =>
						TrigCLR_intl(3) <= '0';
					when others =>
						TrigCLR_intl(3) <= '0';
				end case;
			end if;
		end if;
	end process;


	-- Trigger Circuit
	Gen_Trigger : for I in 0 to 3 generate
		TrigX_inst : TriggerCPU
		generic map(
			ADDRESS 		=> ADDRESS,
			MIN_LE_TIME => MIN_LE_TIME,
			MIN_TE_TIME => MIN_TE_TIME,
			MAX_LONGPULSE => MAX_LONGPULSE
		)
		Port map(
		nrst => nrst,
		clk  => clk,
		Trigger 	=> trigger(I),
	--	TrigCLR		=> TrigCLR_intl(I),
		CurAddr		=> CurAddr,
		SCnt 	=> SCnt,

		wr1_trig	=> wr1_trig_intl(I),
		wr2_trig	=> wr2_trig_intl(I),
		last		=> last_intl(I),

		valid_o		=> valid_intl(I),
		response_i	=> response_intl,

		-- Next Side
		nexttrigger => nexttrigger_intl(I),
		NEXTWDO_OUT => NEXTWDO_OUT_intl(I),
		PREVWDO_IN 	=> PREVWDO_IN(I),

		-- Previous Side

		prevtrigger => prevtrigger(I),
		PREVWDO_OUT => PREVWDO_OUT_intl(I),
		NEXTWDO_IN 	=> NEXTWDO_IN(I)
		);
	end generate;

	valid_single_intl <= '1' when valid_intl /= "0000" else '0';

	-- Catalizer process
	process(wr1_trig_intl, wr2_trig_intl)
	begin
		if (wr1_trig_intl(0) = '0' or wr2_trig_intl(0) = '0') then
			trigger_bits(0) <= '1';
		else
			trigger_bits(0) <= '0';
		end if;

		if (wr1_trig_intl(1) = '0' or wr2_trig_intl(1) = '0') then
			trigger_bits(1) <= '1';
		else
			trigger_bits(1) <= '0';
		end if;

		if (wr1_trig_intl(2) = '0' or wr2_trig_intl(2) = '0') then
			trigger_bits(2) <= '1';
		else
			trigger_bits(2) <= '0';
		end if;

		if (wr1_trig_intl(3) = '0' or wr2_trig_intl(3) = '0') then
			trigger_bits(3) <= '1';
		else
			trigger_bits(3) <= '0';
		end if;

	end process;

	process(last_intl)
	begin
		if (last_intl(0) = '1') then
			last_bits(0) <= '1';
		else
			last_bits(0) <= '0';
		end if;

		if (last_intl(1) = '1') then
			last_bits(1) <= '1';
		else
			last_bits(1) <= '0';
		end if;

		if (last_intl(2) = '1') then
			last_bits(2) <= '1';
		else
			last_bits(2) <= '0';
		end if;
		if (last_intl(3) = '1') then
			last_bits(3) <= '1';
		else
			last_bits(3) <= '0';
		end if;

	end process;

	trigger_information_intl.trig  <= trigger_bits;
	trigger_information_intl.last  <= last_bits;
	trigger_information_intl.long  <= "0000";


	-- By Pass Trigger Lines if RB_Element is out

	-- Next Side
	nexttrigger <= nexttrigger_intl when ((wr1_en_intl='1') and (wr2_en_intl='1')) else prevtrigger;
	NEXTWDO_OUT <= NEXTWDO_OUT_intl when ((wr1_en_intl='1') and (wr2_en_intl='1')) else NEXTWDO_IN;

	-- Previous Side
	PREVWDO_OUT <= PREVWDO_OUT_intl when ((wr1_en_intl='1') and (wr2_en_intl='1')) else PREVWDO_IN;

end Behavioral;
