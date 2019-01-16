
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity WindowBrain is
	generic(
		ADDRESS : integer := 0
	);
	Port (

	nrst : 			in	std_Logic;
--	SSTIN:			in std_logic;
	CLK:			in 	std_logic;
	oddeven:		in 	std_logic;
	--Window Part
	CPUMode:		in	std_logic;
	CPUBus :		inout	std_logic_vector(10 downto 0);

	wr1_en:			out	std_logic;
	wr2_en:			out	std_logic;

	--Trigger Information for Brain
	Trig:			in 	std_logic;
	Trigdly:		in	std_logic;
	Last:			in	std_logic;
	LE : 			in	std_logic;
	TE : 			in	std_logic;

	--CurAddr:		in 	std_logic_vector(7 downto 0);
	CurAddrBit:		in 	std_logic;
	--OldAddr:		in	std_logic_vector(7 downto 0);
	OldAddrBit:		in std_logic;

	PREVBus_IN :	in	std_logic;
	PREVBus_OUT :	out	std_logic;
	NEXTBus_IN :	in	std_logic;
	NEXTBus_OUT :	out	std_logic;

	NextAddr : 		inout std_logic_vector(7 downto 0);
	PrevAddr :		inout std_logic_vector(7 downto 0)
	);

end WindowBrain;

architecture Behavioral of WindowBrain is

	signal wr1_en_intl : std_logic;
	signal wr2_en_intl : std_logic;

	signal wr1_flg, flg_LE, flg_TE: std_logic;
	signal wr2_flg : std_logic;

	signal wr, cur_wr, oldaddr_flg, mode_flg : std_logic;

	signal CPUCmd_Bus : t_CommandBus;

begin

	Mode_flg <= '1' when ((CPUMode = '1') and (CurAddrBit='1')) else '0';

	--CPUBus <= CPUCmd_Bus.cmd & CPUCmd_Bus.addr when (Mode_flg = '1') else (others => 'Z');

	-- General Process
	process(CLK, nRST)
	begin
		if nrst = '0' then
			wr1_en_intl <= '1';
			wr2_en_intl <= '1';
			wr1_flg <= '0';
			wr2_flg <= '0';

			flg_LE <= '0';
			flg_TE <= '0';

			--CPUCmd_Bus.addr <= (others => '0');
			--CPUCmd_Bus.cmd <= CMD_NOP;
			CPUBus <= CMD_NOP & x"00";
		else
			if rising_edge(clk) then

				--MODE : Trigger = '1'
				if (Mode_flg = '1') then

					if Trig = '1' then
						if oddeven='0' then
							wr1_en_intl <= '0';
						else
							wr2_en_intl <= '0';
						end if;

						--LE
						if Trigdly = '0' and LE='1' and flg_LE='0'  then
							--CPUCmd_Bus.addr <= PrevAddr;
							--CPUCmd_Bus.cmd <= CMD_WR2_MARKED;
							flg_LE <= '1';

							wr1_en_intl <= '0';
						end if;

						--Delayed
						if flg_LE = '1' then
							-- CPUCmd_Bus.addr <= PrevAddr;
							-- CPUCmd_Bus.cmd <= CMD_WR2_MARKED;
							CPUBus <= CMD_WR2_MARKED & PrevAddr;
						end if;
						--TE
						if Last = '1' and TE='1' and flg_TE = '0' then
							--CPUCmd_Bus.addr <= NextAddr;
							--CPUCmd_Bus.cmd <= CMD_WR1_MARKED;
							flg_TE <= '1';

							wr2_en_intl <= '0';
						end if;

						--Delayed
						if flg_TE = '1' then
							-- CPUCmd_Bus.addr <= NextAddr;
							-- CPUCmd_Bus.cmd <= CMD_WR1_MARKED;
							CPUBus <= CMD_WR1_MARKED & NextAddr;
						end if;
					else
						-- CPUCmd_Bus.addr <= (others => '0');
						-- CPUCmd_Bus.cmd <= CMD_NOP;
						CPUBus <= CMD_NOP & x"00";
					end if;

				--MODE : Bus = '0'
				else
					CPUBus <= (others => 'Z');
					if  CPUBus(7 downto 0) = std_logic_vector(to_unsigned(ADDRESS,8)) then
						case CPUBus(10 downto 8) is
							when CMD_NOP =>
							-- when CMD_WR1_EN =>
							-- 	wr1_en_intl <= '0';
							-- 	wr2_en_intl <= '1';
							-- when CMD_WR2_EN =>
							-- 	wr1_en_intl <= '1';
							-- 	wr2_en_intl <= '0';
							-- when CMD_BOTH_EN =>
								-- wr1_en_intl <= '0';
								-- wr2_en_intl <= '0';
							when CMD_WR1_EN_DIS =>
								wr1_flg <= '1';
							when CMD_WR2_EN_DIS =>
								wr2_flg <= '1';
							-- when CMD_WR1_MARKED =>
							-- 	wr1_en_intl <= '0';
							-- when CMD_WR2_MARKED =>
							-- 	wr2_en_intl <= '0';
							when CMD_WR1_MARKED =>
								wr1_en_intl <= '0';
							when CMD_WR2_MARKED =>
								wr2_en_intl <= '0';
							when CMD_BOTH_MARKED =>
								wr1_en_intl <= '0';
								wr2_en_intl <= '0';
							when others =>
						end case;

						-- if CPUBus(10) = '0' then
						-- 	wr1_en_intl <= wr1_en_intl and CPUBus(8);
						-- 	wr2_en_intl <= wr2_en_intl and CPUBus(9);
						-- else
						-- 	wr1_flg <= wr1_flg or CPUBus(8);
						-- 	wr2_flg <= wr2_flg or CPUBus(9);
						-- end if;
					end if;
				end if;

				-- Re-Entry STM
				if CurAddrBit = '0' and PREVBus_In = '0' and NextBus_In = '0' then

					flg_LE <= '0';
					flg_TE <= '0';

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

	-- Write Output
	--oldaddr_flg <= '1' when (OldAddr = std_logic_vector(to_unsigned(ADDRESS,8))) else '0';
	wr1_en	<= wr1_en_intl when (oldaddrbit = '1') else 'Z';
	wr2_en	<= wr2_en_intl when (oldaddrbit = '1') else 'Z';

	-- Logic for PREV and NEXT

--	CurAddrBit <= '1' when (CurAddr = std_logic_vector(to_unsigned(ADDRESS,8))) else '0';
	wr <= 	'1' when ((wr1_en_intl = '1') and (wr2_en_intl='1')) else '0';
	cur_wr <= '1' when ((CurAddrBit = '0') and (wr = '1')) else '0';

	process(CLK,nrst)
	begin
		if nrst='0' then
			PrevAddr <= (others => 'Z');
			NextAddr <= (others => 'Z');
			PREVBus_Out <= '0';
			NEXTBus_Out <= '0';
		else
			if rising_edge(CLK) then
				--Signals
				if (((PREVBus_In = '1') and (wr = '0')) or (CurAddrBit = '1')) then
					PREVBus_Out <= '1';
				else
					PREVBus_Out <= '0';
				end if;

				if (((NEXTBus_In = '1') and (wr = '0')) or (CurAddrBit = '1')) then
					NEXTBus_Out <= '1';
				else
					NEXTBus_Out <= '0';
				end if;

				--Address
				if ((NEXTBus_In = '1') and  (cur_wr = '1')) then
					NextAddr <= std_logic_vector(to_unsigned(ADDRESS,8));
				else
					NextAddr <= (others => 'Z');
				end if;

				if ((PREVBus_In = '1') and  (cur_wr = '1')) then
					PrevAddr <= std_logic_vector(to_unsigned(ADDRESS,8));
				else
					PrevAddr <= (others => 'Z');
				end if;
			end if;
		end if;
	end process;
	-- PREVBus_Out <= '1' when (((PREVBus_In = '1') and (wr = '0')) or (CurAddrBit = '1')) else '0';
	-- NEXTBus_Out <= '1' when (((NEXTBus_In = '1') and (wr = '0')) or (CurAddrBit = '1')) else '0';

	-- NextAddr <=	std_logic_vector(to_unsigned(ADDRESS,8)) when ((NEXTBus_In = '1') and  (cur_wr = '1')) else (others => 'Z');
	-- PrevAddr <=	std_logic_vector(to_unsigned(ADDRESS,8)) when ((PREVBus_In = '1') and  (cur_wr = '1')) else (others => 'Z');


end Behavioral;
