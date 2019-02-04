
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--use work.TARGETC_pkg.all;
use work.WindowCPU_pkg_old.all;

entity WindowCPUV2 is
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

end WindowCPUV2;

architecture Behavioral of WindowCPUV2 is

	signal wr1_en_intl : std_logic;
	signal wr2_en_intl : std_logic;

	signal wr1_mark_flg : std_logic;
	signal wr2_mark_flg : std_logic;

	signal wr1_flg : std_logic;
	signal wr2_flg : std_logic;

	signal PREVBus_intl : std_logic_vector(7 downto 0);
	signal NEXTBus_intl : std_logic_vector(7 downto 0);

	type WindowCPU_state_type is (
		IDLE,
		VALID,
		RESPVALID
	);

	type WindowCPU_trigger_state_type is (
		TRIG_IDLE,
		TRIG_SET,
		TRIG_RST
	);

	type state_t is (
		IDLE,
		READY,
		RESPREADY
	);
	signal trigger_stm : state_t := IDLE;

	signal TrigInfo_markedA : t_triggerinformationSingle;
	signal TrigInfo_markedB : t_triggerinformationSingle;
	signal TrigInfo_markedC : t_triggerinformationSingle;
	signal TrigInfo_markedD : t_triggerinformationSingle;

	signal TrigInfo_IN_last: t_triggerinformation;
	signal wr1_trig_last:	std_logic;
	signal wr2_trig_last:	std_logic;
	signal TrigInfo_marked : std_logic_vector(11 downto 0);
begin

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

			TrigInfo_markedA <= (others => '0');
			TrigInfo_markedB <= (others => '0');
			TrigInfo_markedC <= (others => '0');
			TrigInfo_markedD <= (others => '0');

			TrigInfo_OUT <= (others => '0');
			trigger_stm <= IDLE;
		else
			if rising_edge(clk) then

				-- Received Command from Control
				if BusA.en = '1' and BusA.addr = std_logic_vector(to_unsigned(ADDRESS,8)) then
					case BusA.cmd is
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
							--TrigInfo_marked <= TrigInfo_IN.long & TrigInfo_IN.last & TrigInfo_IN.trig;
							TrigInfo_markedA.trig <= TrigInfo_IN.trig(0);
							TrigInfo_markedA.last <= TrigInfo_IN.last(0);
							TrigInfo_markedA.long <= TrigInfo_IN.long(0);
						when CMD_WR2_MARKED =>
							wr2_mark_flg <= '1';
							--TrigInfo_marked <= TrigInfo_IN.long & TrigInfo_IN.last & TrigInfo_IN.trig;
							TrigInfo_markedA.trig <= TrigInfo_IN.trig(0);
							TrigInfo_markedA.last <= TrigInfo_IN.last(0);
							TrigInfo_markedA.long <= TrigInfo_IN.long(0);
						when CMD_BOTH_MARKED =>
							wr1_mark_flg <= '1';
							wr2_mark_flg <= '1';
							--TrigInfo_marked <= TrigInfo_IN.long & TrigInfo_IN.last & TrigInfo_IN.trig;
							TrigInfo_markedA.trig <= TrigInfo_IN.trig(0);
							TrigInfo_markedA.last <= TrigInfo_IN.last(0);
							TrigInfo_markedA.long <= TrigInfo_IN.long(0);

						when others =>
					end case;
				end if;

				if BusB.en = '1' and BusB.addr = std_logic_vector(to_unsigned(ADDRESS,8)) then
					case BusB.cmd is
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
							--TrigInfo_marked <= TrigInfo_IN.long & TrigInfo_IN.last & TrigInfo_IN.trig;
							TrigInfo_markedB.trig <= TrigInfo_IN.trig(1);
							TrigInfo_markedB.last <= TrigInfo_IN.last(1);
							TrigInfo_markedB.long <= TrigInfo_IN.long(1);
						when CMD_WR2_MARKED =>
							wr2_mark_flg <= '1';
							--TrigInfo_marked <= TrigInfo_IN.long & TrigInfo_IN.last & TrigInfo_IN.trig;
							TrigInfo_markedB.trig <= TrigInfo_IN.trig(1);
							TrigInfo_markedB.last <= TrigInfo_IN.last(1);
							TrigInfo_markedB.long <= TrigInfo_IN.long(1);
						when CMD_BOTH_MARKED =>
							wr1_mark_flg <= '1';
							wr2_mark_flg <= '1';
							--TrigInfo_marked <= TrigInfo_IN.long & TrigInfo_IN.last & TrigInfo_IN.trig;
							TrigInfo_markedB.trig <= TrigInfo_IN.trig(1);
							TrigInfo_markedB.last <= TrigInfo_IN.last(1);
							TrigInfo_markedB.long <= TrigInfo_IN.long(1);
						when others =>
					end case;
				end if;

				if BusC.en = '1' and BusC.addr = std_logic_vector(to_unsigned(ADDRESS,8)) then
					case BusC.cmd is
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
							--TrigInfo_marked <= TrigInfo_IN.long & TrigInfo_IN.last & TrigInfo_IN.trig;
							TrigInfo_markedC.trig <= TrigInfo_IN.trig(2);
							TrigInfo_markedC.last <= TrigInfo_IN.last(2);
							TrigInfo_markedC.long <= TrigInfo_IN.long(2);
						when CMD_WR2_MARKED =>
							wr2_mark_flg <= '1';
							--TrigInfo_marked <= TrigInfo_IN.long & TrigInfo_IN.last & TrigInfo_IN.trig;
							TrigInfo_markedC.trig <= TrigInfo_IN.trig(2);
							TrigInfo_markedC.last <= TrigInfo_IN.last(2);
							TrigInfo_markedC.long <= TrigInfo_IN.long(2);
						when CMD_BOTH_MARKED =>
							wr1_mark_flg <= '1';
							wr2_mark_flg <= '1';
							--TrigInfo_marked <= TrigInfo_IN.long & TrigInfo_IN.last & TrigInfo_IN.trig;
							TrigInfo_markedC.trig <= TrigInfo_IN.trig(2);
							TrigInfo_markedC.last <= TrigInfo_IN.last(2);
							TrigInfo_markedC.long <= TrigInfo_IN.long(2);
						when others =>
					end case;
				end if;

				if BusD.en = '1' and BusD.addr = std_logic_vector(to_unsigned(ADDRESS,8)) then
					case BusD.cmd is
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
							--TrigInfo_marked <= TrigInfo_IN.long & TrigInfo_IN.last & TrigInfo_IN.trig;
							TrigInfo_markedD.trig <= TrigInfo_IN.trig(3);
							TrigInfo_markedD.last <= TrigInfo_IN.last(3);
							TrigInfo_markedD.long <= TrigInfo_IN.long(3);
						when CMD_WR2_MARKED =>
							wr2_mark_flg <= '1';
							--TrigInfo_marked <= TrigInfo_IN.long & TrigInfo_IN.last & TrigInfo_IN.trig;
							TrigInfo_markedD.trig <= TrigInfo_IN.trig(3);
							TrigInfo_markedD.last <= TrigInfo_IN.last(3);
							TrigInfo_markedD.long <= TrigInfo_IN.long(3);
						when CMD_BOTH_MARKED =>
							wr1_mark_flg <= '1';
							wr2_mark_flg <= '1';
							--TrigInfo_marked <= TrigInfo_IN.long & TrigInfo_IN.last & TrigInfo_IN.trig;
							TrigInfo_markedD.trig <= TrigInfo_IN.trig(3);
							TrigInfo_markedD.last <= TrigInfo_IN.last(3);
							TrigInfo_markedD.long <= TrigInfo_IN.long(3);
						when others =>
					end case;
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

					-- Update TrigInfo_OUT
					TrigInfo_OUT(11) <= TrigInfo_markedD.long;
					TrigInfo_OUT(10) <= TrigInfo_markedC.long;
					TrigInfo_OUT(9) <= TrigInfo_markedB.long;
					TrigInfo_OUT(8) <= TrigInfo_markedA.long;

					TrigInfo_OUT(7) <= TrigInfo_markedD.last;
					TrigInfo_OUT(6) <= TrigInfo_markedC.last;
					TrigInfo_OUT(5) <= TrigInfo_markedB.last;
					TrigInfo_OUT(4) <= TrigInfo_markedA.last;

					TrigInfo_OUT(3) <= TrigInfo_markedD.trig;
					TrigInfo_OUT(2) <= TrigInfo_markedC.trig;
					TrigInfo_OUT(1) <= TrigInfo_markedB.trig;
					TrigInfo_OUT(0) <= TrigInfo_markedA.trig;

					--TrigInfo_OUT <= TrigInfo_marked;
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

	-- PREVBus_intl <= std_logic_vector(to_unsigned(ADDRESS,PREVBus_intl'length)) when ((wr1_en_intl='1') and (wr2_en_intl='1')) else PREVBus_In;
	--
	-- NEXTBus_intl <= std_logic_vector(to_unsigned(ADDRESS,NEXTBus_intl'length)) when ((wr1_en_intl='1') and (wr2_en_intl='1')) else NEXTBus_In;
	--
	-- PREVBus_Out <= PREVBus_intl;
	-- NEXTBus_Out <= NEXTBus_intl;

	PREVBus_Out <= std_logic_vector(to_unsigned(ADDRESS,PREVBus_intl'length)) when ((wr1_en_intl='1') and (wr2_en_intl='1')) else PREVBus_In;
	--
	NEXTBus_Out <= std_logic_vector(to_unsigned(ADDRESS,NEXTBus_intl'length)) when ((wr1_en_intl='1') and (wr2_en_intl='1')) else NEXTBus_In;

end Behavioral;
