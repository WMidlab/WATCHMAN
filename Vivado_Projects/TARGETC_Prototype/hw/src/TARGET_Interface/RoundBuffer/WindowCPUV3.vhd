
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity WindowCPUV3 is
	generic(
		ADDRESS : integer := 0
	);
	Port (

	nrst : 			in	std_Logic;
--	SSTIN:			in std_logic;
	CLK:			in 	std_logic;

	--Window Part
	CPUBus :		in t_CommandBus;
	TrigInfo_IN:	in t_triggerinformation;
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

end WindowCPUV3;

architecture Behavioral of WindowCPUV3 is

	signal wr1_en_intl : std_logic;
	signal wr2_en_intl : std_logic;

	signal wr1_mark_flg : std_logic;
	signal wr2_mark_flg : std_logic;

	signal wr1_flg : std_logic;
	signal wr2_flg : std_logic;

	signal PREVBus_intl : std_logic_vector(7 downto 0);
	signal NEXTBus_intl : std_logic_vector(7 downto 0);

	signal cur, wr, cur_wr : std_logic;

	signal TrigInfo_marked : t_triggerinformation;

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

			TrigInfo_marked.trig <= (others=>'0');
			TrigInfo_marked.last <= (others=>'0');
			TrigInfo_marked.long <= (others=>'0');

			TrigInfo_OUT <= (others => '0');

		else
			if rising_edge(clk) then

				-- Received Command from Control
				if CPUBus.en = '1' and CPUBus.addr = std_logic_vector(to_unsigned(ADDRESS,8)) then
					case CPUBus.cmd is
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
							TrigInfo_marked <= (others => (others=>'0'));
						when CMD_WR2_EN_DIS =>
							wr2_flg <= '1';
							TrigInfo_marked <= (others => (others=>'0'));
						when CMD_WR1_MARKED =>
							wr1_mark_flg <= '1';
							--TrigInfo_marked <= TrigInfo_IN.long & TrigInfo_IN.last & TrigInfo_IN.trig;

						when CMD_WR2_MARKED =>
							wr2_mark_flg <= '1';
							--TrigInfo_marked <= TrigInfo_IN.long & TrigInfo_IN.last & TrigInfo_IN.trig;
						when CMD_BOTH_MARKED =>
							wr1_mark_flg <= '1';
							wr2_mark_flg <= '1';
							--TrigInfo_marked <= TrigInfo_IN.long & TrigInfo_IN.last & TrigInfo_IN.trig;
						when others =>
					end case;

					--Trigger Information
					for I in 0 to 3 loop
						if TrigInfo_IN.trig(I) = '1' then
							TrigInfo_marked.trig(I) <= TrigInfo_IN.trig(I);
						end if;

						if TrigInfo_IN.last(I) = '1' then
							TrigInfo_marked.last(I) <= TrigInfo_IN.last(I);
						end if;

						if TrigInfo_IN.long(I) = '1' then
							TrigInfo_marked.long(I) <= TrigInfo_IN.long(I);
						end if;
					end loop;
				end if;

				-- Marked STM
				if NEXTBus_IN = '1' then
					if (wr1_mark_flg = '1') then
						wr1_en_intl <= '0';
						wr1_mark_flg <= '0';
					end if;

					if (wr2_mark_flg = '1') then
						wr2_en_intl <= '0';
						wr2_mark_flg <= '0';
					end if;

					-- Update TrigInfo_OUT
					TrigInfo_OUT(11) <= TrigInfo_marked.long(3);
					TrigInfo_OUT(10) <= TrigInfo_marked.long(2);
					TrigInfo_OUT(9) <= TrigInfo_marked.long(1);
					TrigInfo_OUT(8) <= TrigInfo_marked.long(0);

					TrigInfo_OUT(7) <= TrigInfo_marked.last(3);
					TrigInfo_OUT(6) <= TrigInfo_marked.last(2);
					TrigInfo_OUT(5) <= TrigInfo_marked.last(1);
					TrigInfo_OUT(4) <= TrigInfo_marked.last(0);

					TrigInfo_OUT(3) <= TrigInfo_marked.trig(3);
					TrigInfo_OUT(2) <= TrigInfo_marked.trig(2);
					TrigInfo_OUT(1) <= TrigInfo_marked.trig(1);
					TrigInfo_OUT(0) <= TrigInfo_marked.trig(0);

					--TrigInfo_OUT <= TrigInfo_marked;
				end if;

				-- Re-Entry STM
				if CurAddr /= std_logic_vector(to_unsigned(ADDRESS,8)) and PREVBus_In = '0' and NextBus_In = '0' then
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



	wr1_en	<= '0' when wr1_en_intl = '0' else '1';
	wr2_en	<= '0' when wr2_en_intl = '0' else '1';

	-- Logic for PREV and NEXT

	--valid_o <= 	'1'	when ((wr1_en_intl = '0') or (wr2_en_intl = '0')) else '0';
	valid_o <= not wr;
	cur <= '1' when (CurAddr = std_logic_vector(to_unsigned(ADDRESS,8))) else '0';
	wr <= 	'1' when ((wr1_en_intl = '1') and (wr2_en_intl='1')) else '0';
	cur_wr <= '1' when ((Cur = '0') and (wr = '1')) else '0';
	-- PREVBus_Out <= std_logic_vector(to_unsigned(ADDRESS,PREVBus_intl'length)) when ((wr1_en_intl='1') and (wr2_en_intl='1')) else PREVBus_In;
	-- --
	-- NEXTBus_Out <= std_logic_vector(to_unsigned(ADDRESS,NEXTBus_intl'length)) when ((wr1_en_intl='1') and (wr2_en_intl='1')) else NEXTBus_In;

	PREVBus_Out <= '1' when (((PREVBus_In = '1') and (wr = '0')) or (Cur = '1')) else '0';
	NEXTBus_Out <= '1' when (((NEXTBus_In = '1') and (wr = '0')) or (Cur = '1')) else '0';

	NextAddr <=	std_logic_vector(to_unsigned(ADDRESS,8)) when ((NEXTBus_In = '1') and  (cur_wr = '1')) else (others => 'Z');

	PrevAddr <=	std_logic_vector(to_unsigned(ADDRESS,8)) when ((PREVBus_In = '1') and  (cur_wr = '1')) else (others => 'Z');


end Behavioral;
