
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

	wr1_en :		out std_logic;
	wr2_en :		out	std_logic;
	valid_o	:		out std_logic;
	response:		in 	std_logic;
	
	CurAddr:		in 	std_logic_vector(7 downto 0);
	PREVBus_IN :	in	std_logic_vector(7 downto 0);
	PREVBus_OUT :	out	std_logic_vector(7 downto 0);
	NEXTBus_IN :	in	std_logic_vector(7 downto 0);
	NEXTBus_OUT :	out	std_logic_vector(7 downto 0)
	);

end WindowCPU;

architecture Behavioral of WindowCPU is

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
	
begin


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
				
--				wr1_reg <= wr1_reg(0) & wr1_en_intl;
--				wr2_reg <= wr2_reg(0) & wr2_en_intl;
				
				-- Valid and Response signal
--				case CPU_stm is
--					when IDLE =>
--						if wr1_reg = "10" or wr2_reg = "10" then
--							valid_o <= '1';
--							CPU_stm <= VALID;
--						else
--							valid_o <= '0';
--							CPU_stm <= IDLE;						
--						end if;
--					when VALID =>
--						if response = '1' then
--							valid_o <= '0';
--							CPU_stm <= RESPVALID;
--						else
--							valid_o <= '1';
--							CPU_stm <= VALID;
--						end if;
--					when RESPVALID =>
--						if response = '0' then
--							CPU_stm <= IDLE;
--						else
--							CPU_stm <= RESPVALID;
--						end if;
--					when others =>
--				end case;
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
