
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity WindowCPU is
	generic(
		ADDRESS : integer := 0
	);
	Port (
	nrst : 			in	std_Logic;
--	SSTIN:			in std_logic;
	CLK:			in 	std_logic;
	cmd :			in 	std_logic_vector(2 downto 0);
	cmd_en:			in 	std_logic;

	valid :			out std_logic;

	CurAddr:		in 	std_logic_vector(7 downto 0);
	PREVBus_IN :	in	std_logic_vector(7 downto 0);
	PREVBus_OUT :	out	std_logic_vector(7 downto 0);
	NEXTBus_IN :	in	std_logic_vector(7 downto 0);
	NEXTBus_OUT :	out	std_logic_vector(7 downto 0)
	);

end WindowCPU;

architecture Behavioral of WindowCPU is

	signal wr1_en : std_logic;
	signal wr2_en : std_logic;

	signal wr1_flg : std_logic;
	signal wr2_flg : std_logic;

	signal PREVBus_intl : std_logic_vector(7 downto 0);
	signal NEXTBus_intl : std_logic_vector(7 downto 0);

begin


	process(CLK, nRST)
	begin
		if nrst = '0' then
			wr1_en <= '1';
			wr2_en <= '1';
			wr1_flg <= '0';
			wr2_flg <= '0';

		else
			if rising_edge(clk) then

				-- Received Command from Control
				if cmd_en = '1' then
					case cmd is
						when CMD_WR1_EN =>
							wr1_en <= '0';
							wr2_en <= '1';
						when CMD_WR2_EN =>
							wr1_en <= '1';
							wr2_en <= '0';
						when CMD_BOTH_EN =>
							wr1_en <= '0';
							wr2_en <= '0';
						when CMD_WR1_EN_DIS =>
							wr1_flg <= '1';
						when CMD_WR2_EN_DIS =>
							wr2_flg <= '1';
						when "101" =>
						when "110" =>
						when "111" =>
						when others =>
					end case;
				end if;

				-- Re-Entry STM
				if CurAddr /= std_logic_vector(to_unsigned(ADDRESS,8)) and CurAddr /= PREVBus_In and CurAddr /= NextBus_In then
					if (wr1_flg = '1') then
						wr1_en <= '1';
						wr1_flg <= '0';
					end if;

					if (wr2_flg = '1') then
						wr2_en <= '1';
						wr2_flg <= '0';
					end if;
				end if;
			end if;
		end if;
	end process;

	valid <= '0' when ((wr1_en='1') and (wr2_en='1')) else '1';

	PREVBus_intl <= std_logic_vector(to_unsigned(ADDRESS,PREVBus_intl'length)) when ((wr1_en='1') and (wr2_en='1')) else PREVBus_In;

	NEXTBus_intl <= std_logic_vector(to_unsigned(ADDRESS,NEXTBus_intl'length)) when ((wr1_en='1') and (wr2_en='1')) else NEXTBus_In;

	PREVBus_Out <= PREVBus_intl;
	NEXTBus_Out <= NEXTBus_intl;
end Behavioral;
