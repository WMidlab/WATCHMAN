-- -----------------------------------------------------------
--!@FILE: 	Window_Brain.vhd
--!@AUTHOR: Jonathan Hendriks
--!@DATE: 	21st of January 2019
-- -----------------------------------------------------------
--!@DESCRIPTION:
--! Window Brain counts for the next address and prev address
-- -----------------------------------------------------------

--Librairies
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.WindowCPU_pkg.all;

entity WindowBrainV2 is
	generic(
		-- Address of the CPU, for TARGETC [0 to 255], 512 windows/2 256 CPUs total
		ADDRESS : integer := 0
	);
	Port (

	nrst : 			in	std_Logic;
	CLK:			in 	std_logic;

	--Clear for the next and prev address identification
	nCLR :			in	std_Logic;

	--Command Bus shared among all CPUs
	CPUBus :		in	std_logic_vector(10 downto 0);

	-- Write output indicating if CPU is write enable or disable
	-- wr1_en:			out	std_logic;
	-- wr2_en:			out	std_logic;

	-- Bit Address/Select Enable
	RealAddrBit:		in 	std_logic;
--	OldAddrBit:		in std_logic;

	-- Bus Next and Prev
	PREVBus_IN :	in	std_logic;
	PREVBus_OUT :	out	std_logic;
	NEXTBus_IN :	in	std_logic;
	NEXTBus_OUT :	out	std_logic;

	-- Bit address Enable for Previous and Next address
	NextAddr : 		out std_logic;
	PrevAddr :		out std_logic
	);

end WindowBrainV2;

--Architecture
architecture Behavioral of WindowBrainV2 is

	signal wr1_en_intl : std_logic;
	signal wr2_en_intl : std_logic;

	signal wr1_flg	: std_logic;
	signal wr2_flg 	: std_logic;

	signal CPUCmd_Bus : t_CommandBus;

	signal PREVBus_s :	std_logic;
	signal NEXTBus_s :	std_logic;

	-- signal NextAddr_s : std_logic_vector(7 downto 0);
	-- signal PrevAddr_s :	std_logic_vector(7 downto 0);

	signal NextAddr_s : std_logic;
	signal PrevAddr_s :	std_logic;
	-- -------------------------------------------------------------
	-- Constraints on Signals
	-- -------------------------------------------------------------
	attribute DONT_TOUCH : string;
	--
	attribute DONT_TOUCH of wr1_en_intl: signal is "TRUE";
	attribute DONT_TOUCH of wr2_en_intl: signal is "TRUE";
	--

	-- attribute DONT_TOUCH of wr1_flg: signal is "TRUE";
	-- attribute DONT_TOUCH of wr2_flg: signal is "TRUE";

begin

	-- General Process
	process(CLK, nRST)
	begin
		if nrst = '0' then
			wr1_en_intl <= '1';
			wr2_en_intl <= '1';
			wr1_flg <= '0';
			wr2_flg <= '0';

		else
			if rising_edge(clk) then

				-- Decode the Bus line
				if  CPUBus(7 downto 0) = std_logic_vector(to_unsigned(ADDRESS,8)) then
					case CPUBus(10 downto 8) is
						when CMD_NOP =>
							--nop
						when CMD_WR1_EN_DIS =>
							wr1_flg <= '1';
						when CMD_WR2_EN_DIS =>
							wr2_flg <= '1';
						when CMD_WR1_MARKED =>
							wr1_en_intl <= '0';
						when CMD_WR2_MARKED =>
							wr2_en_intl <= '0';
						when CMD_BOTH_MARKED =>
							wr1_en_intl <= '0';
							wr2_en_intl <= '0';
						when others =>
					end case;

				end if;

				-- Re-Entry of CPU in the Round Buffer, 3 conditions
				-- 1) Not the current address
				-- 2) Not in the previous address or resulting in finding it
				-- 3) Not in the next address or resulting in finding it
				if RealAddrBit = '0' and PREVBus_In = '0' and NextBus_In = '0' then

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
	-- wr1_en	<= wr1_en_intl;
	-- wr2_en	<= wr2_en_intl;



	process(CLK,nrst,nCLR)
	begin
		if nrst='0' or nCLR= '0' then
			-- PrevAddr_s <= (others => 'Z');
			-- NextAddr_s <= (others => 'Z');
			PrevAddr_s <= '0';
			NextAddr_s <= '0';
			-- PREVBus_s <= '0';
			-- NEXTBus_s <= '0';
		else
			if rising_edge(CLK) then
				--Signals New Version
				if (RealAddrBit = '1') then
					PREVBus_s <= '1';
					NEXTBus_s <= '1';
				else
					if ((wr1_en_intl = '0') or (wr2_en_intl='0')) then
						if (NEXTBus_In = '1') then
							NEXTBus_s <= '1';
						else
							NEXTBus_s <= '0';
						end if;

						if (PREVBus_In = '1') then
							PREVBus_s <= '1';
						else
							PREVBus_s <= '0';
						end if;

					else
						PREVBus_s <= '0';
						NEXTBus_s <= '0';
					end if;
				end if;

				--Old Version
				-- if (((PREVBus_In = '1') and ((wr1_en_intl = '0') or (wr2_en_intl='0'))) or (RealAddrBit = '1')) then
				-- 	PREVBus_Out <= '1';
				-- else
				-- 	PREVBus_Out <= '0';
				-- end if;
				--
				-- if (((NEXTBus_In = '1') and ((wr1_en_intl = '0') or (wr2_en_intl='0'))) or (RealAddrBit = '1')) then
				-- 	NEXTBus_Out <= '1';
				-- else
				-- 	NEXTBus_Out <= '0';
				-- end if;
				--Address NEW VERSION
				if ((wr1_en_intl = '1') and (wr2_en_intl='1') and (RealAddrBit = '0')) then
					if (NEXTBus_In = '1') then
						NextAddr_s <= '1'; --std_logic_vector(to_unsigned(ADDRESS,8));
					else
						NextAddr_s <= '0'; --(others => 'Z');
					end if;

					if (PREVBus_In = '1') then
						PrevAddr_s <= '1'; --std_logic_vector(to_unsigned(ADDRESS,8));
					else
						PrevAddr_s <= '0'; --(others => 'Z');
					end if;
				else
					PrevAddr_s <= '0';
					NextAddr_s <= '0';
				end if;

				-- OLD VERSION
				-- if ((NEXTBus_In = '1') and  (wr1_en_intl = '1') and (wr2_en_intl='1') and (RealAddrBit = '0')) then
				-- 	NextAddr <= std_logic_vector(to_unsigned(ADDRESS,8));
				-- else
				-- 	NextAddr <= (others => 'Z');
				-- end if;
				--
				-- if ((PREVBus_In = '1') and  (wr1_en_intl = '1') and (wr2_en_intl='1') and (RealAddrBit = '0')) then
				-- 	PrevAddr <= std_logic_vector(to_unsigned(ADDRESS,8));
				-- else
				-- 	PrevAddr <= (others => 'Z');
				-- end if;
			end if;
		end if;
	end process;

	-- Update the PrevAddr and NextAddr
	NextAddr <= NextAddr_s;
	PrevAddr <= PrevAddr_s;

	-- Next and Prev Bus
	PREVBus_Out <= PREVBus_s;
	NEXTBus_Out <= NEXTBus_s;

	-- PREVBus_Out <= '1' when (((PREVBus_In = '1') and ((wr1_en_intl = '0') or (wr2_en_intl='0'))) or (RealAddrBit = '1')) else '0';
	--
	-- NEXTBus_Out <= '1' when (((NEXTBus_In = '1') and ((wr1_en_intl = '0') or (wr2_en_intl='0'))) or (RealAddrBit = '1')) else '0';

	-- --Address
	-- NextAddr <= std_logic_vector(to_unsigned(ADDRESS,8)) when ((NEXTBus_In = '1') and  (wr1_en_intl = '1') and (wr2_en_intl='1') and (RealAddrBit = '0')) else (others => 'Z');
	--
	-- PrevAddr <= std_logic_vector(to_unsigned(ADDRESS,8)) when ((PREVBus_In = '1') and  (wr1_en_intl = '1') and (wr2_en_intl='1') and (RealAddrBit = '0')) else (others => 'Z');


end Behavioral;
