
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity WindowCPUV4 is
	generic(
		ADDRESS : integer := 0
	);
	Port (

	nrst : 			in	std_Logic;
--	SSTIN:			in std_logic;
	CLK:			in 	std_logic;
	CPUMode:		in	std_logic;

	--Window Part
	CPUMode:		in	std_logic;
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

end WindowCPUV4;

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

	signal CPUCmd_Bus : t_CommandBus;
	signal CPUTrig_Bus:	t_triggerinformation;
	signal DFF_o, DFF_i : std_logic_vector(11 downto 0);
	signal nCLR, LastCPU : std_logic;
begin

	-- Keep track of the Bus Trigger Information
	GEN_DFF : for I in 0 to 11 generate
		DFF_i(I) <= CPUBus(I) or DFF_o(I);

		process(clk,nCLR)
		begin
			if nCLR = '0' then
				DFF_o(I) <= '0';
			else
				if rising_edge(clk)then
					if DFF_i(I) = '1' then
						DFF_o(I) <= DFF_i(I);
					end if;
				end if;
			end if;
		end process;

	end generate;

	TrigSum_s <= CPUTrig.trig(0) or CPUTrig.trig(1) or CPUTrig.trig(2) or CPUTrig.trig(3);

	LastSum_s <= 	'1' when CPUBus(11 downto 8) = "0001" else
					'1' when CPUBus(11 downto 8) = "0010" else
					'1' when CPUBus(11 downto 8) = "0100" else
					'1' when CPUBus(11 downto 8) = "1000" else
					'0';

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

			TrigInfo_OUT <= (others => '0');

		else
			if rising_edge(clk) then

				--MODE : Trigger = '1'
				if CPUMode = '1' then

					if CPUBus.addr = std_logic_vector(to_unsigned(ADDRESS,8)) then
						--LE
						if TrigSum_s = '1' and LE='1' and PREVBus_IN = '1' then
							wr2_mark_flg <= '1';
							LastCPU <= '1';
						end if;

						--TE
						if LastSum_s = '1' and TE='1' and NextBus_IN = '1' then
							wr1_mark_flg <= '1';
						end if;
					else
						--Middle
						if TrigSum_s = '1' then
							if TimeCounter(3)='0' then
								wr1_mark_flg <= '1';
							else
								wr2_mark_flg <= '1';
							end if;
						end if;
					end if;
				--MODE : Bus = '0'
				else
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
					TrigInfo_OUT <= DFF_o;
				end if;

				-- Re-Entry STM
				if CurAddr /= std_logic_vector(to_unsigned(ADDRESS,8)) and PREVBus_In = '0' and NextBus_In = '0' then
					LastCPU <= '0';
					nCLR <= '0';

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

	PREVBus_Out <= '1' when (((PREVBus_In = '1') and ((wr = '0') or (
	LastCPU = '1'))) or (Cur = '1')) else '0';
	NEXTBus_Out <= '1' when (((NEXTBus_In = '1') and (wr = '0')) or (Cur = '1')) else '0';

	NextAddr <=	std_logic_vector(to_unsigned(ADDRESS,8)) when ((NEXTBus_In = '1') and  (cur_wr = '1')) else (others => 'Z');

	PrevAddr <=	std_logic_vector(to_unsigned(ADDRESS,8)) when ((PREVBus_In = '1') and  (cur_wr = '1')) else (others => 'Z');


end Behavioral;
