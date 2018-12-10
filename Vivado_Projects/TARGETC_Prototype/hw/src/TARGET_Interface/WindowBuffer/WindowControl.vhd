
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.TARGETC_pkg.all;

entity WindowControl is
	Port (
	nrst : 			in	STD_Logic;
	Clk :			in std_logic;

	CtrlBus_IxSL:	in 	T_CtrlBus_IxSL; --Outputs from Control Master
	synchro:		in std_logic;

	-- Interface to WindowCPU
	cmdbus	:		out std_logic_vector(2 downto 0);
	cmdwdoselect :	out std_logic_vector(7 downto 0);

	-- FIFO out for Reading RDAD
    RDAD_ReadEn  :in  std_logic;
    RDAD_DataOut : out std_logic_vector(100+5 downto 0);
    RDAD_Empty	: out std_logic;

    -- FIFO IN for Digiting
    DIG_Full	: out	std_logic;
    DIG_DataIn	: in	std_logic_vector(8 downto 0);
    DIG_WriteEn	: in	std_logic
	);

end WindowControl;

architecture Behavioral of WindowControl is

begin

	-- Minimal State Machine For Windows select
	process(CLK, nRST)	-- Every 64 ns
	begin
	if nRST = '0' then
			storage_stm <= IDLE;
			StorageCnt <= 0;
			LastStorageCnt <= 0;

			CtrlBus_OxSL.Test0 <= '0';
			CtrlBus_OxSL.Test1 <= '0';
			CtrlBus_OxSL.Test2 <= '0';

		else
			if rising_edge(CLK) then

				if synchro = '1' then	-- All that needs the synchron between SSTIN and CLK

				end if;

				-- State Machine
				case storage_stm is
					when IDLE =>
						storage_stm <= READY;
					when READY =>
						if(CtrlBus_IxSL.WindowStorage = '1') then
							CtrlBus_OxSL.Test0 <= '1';
							-- Counter is on 512 windows (9bits)
							StorageCnt	<= to_integer(unsigned(CtrlBus_IxSL.NBRWINDOW(8 downto 0)));
							storage_stm <= RESPREADY;
						else
							storage_stm <= READY;
						end if;
					when RESPREADY =>
						if(CtrlBus_IxSL.WindowStorage = '0') then
							--storage_stm <= STORAGE;
							storage_stm <= EVALUATE;
							CtrlBus_OxSL.Test1 <= '1';
						else
							storage_stm <= RESPREADY;
						end if;
					when EVALUATE =>
						if RealWdoCnt 	= to_integer(unsigned(CtrlBus_IxSL.FSTWINDOW(8 downto 1))) then
							if CtrlBus_IxSL.FSTWINDOW(0) = '0' and StorageCnt > 1 then --first window is even
								StorageCnt <= StorageCnt - 2;
							else
								StorageCnt <= StorageCnt -1;
							end if;
							storage_stm <= STORAGE;
							CtrlBus_OxSL.Test2 <= '1';
						else
							storage_stm <= EVALUATE;
						end if;
					when STORAGE =>
						case StorageCnt is
							when 0 =>
								storage_stm <= IDLE;
							when 1 =>
								StorageCnt <= StorageCnt - 1;
								storage_stm <= STORAGE;
							when others =>
								StorageCnt <= StorageCnt - 2;
								storage_stm <= STORAGE;
						end case;

					when others =>
				end case;
			end if;
		end if;
	end process;

	-- New Address each SSTIN
	process(ClockBus.SSTIN, RST, CtrlBus_IxSL.SWRESET)	-- Every 64 ns
		variable GCntW : integer range 0 to 255;
		variable TmpCnt : integer range 0 to 256;
		variable SampledWindow256 : integer range 0 to 255;
	begin
		if RST = '0' or CtrlBus_IxSL.SWRESET = '0' then
			RealWdoCnt <= 0;
			WR_ADDR_S <= (others => '0');

			for k in 0 to 255 loop
				RoundBuffer(k).wr1_en <= '1';
				RoundBuffer(k).wr2_en <= '1';
			end loop;

			digsto_stm <= IDLE;
			STO_ReadEn <= '0';
		else
			if rising_edge(ClockBus.SSTIN) then

				-- State Machine for Reading the windows digitized
				case digsto_stm is
					when IDLE =>
						if DIG_Empty_intl = '0' then
							digsto_stm <= READING;
							STO_ReadEn <= '1';
						else
							digsto_stm <= IDLE;
							STO_ReadEn <= '0';
						end if;
					when READING =>

						digsto_stm <= WRITING;
						STO_ReadEn <= '0';

					when WRITING =>
						if DIG_DataIn_intl(0) = '0' then
							RoundBuffer(to_integer(unsigned(DIG_DataIn_intl(8 downto 1)))).wr1_en <= '1';
						else
							RoundBuffer(to_integer(unsigned(DIG_DataIn_intl(8 downto 1)))).wr2_en <= '1';
						end if;

						digsto_stm <= IDLE;
					when others =>
						digsto_stm <= IDLE;
						STO_ReadEn <= '0';
				end case;

				-- This @ SSTIN
					-- Algorithm for Selecting the correct Window to write enable
				--if RealWdoCnt = to_integer(unsigned(StorageCntAddr(8 downto 1))) and storage_stm = STORAGE then

			-- Test :
			--EVEN
				-- WDO 0x20 NBR 1
				--	0x10 => wr1=0 wr2=1

				-- WDO 0x20 NBR 2
				--	0x10 => wr1=0 wr2=0

				-- WDO 0x20 NBR 3
				--	0x10 => wr1=0 wr2=0
				--	0x11 => wr1=0 wr2=1

				-- WDO 0x20 NBR 4
				--	0x10 => wr1=0 wr2=0
				--	0x11 => wr1=0 wr2=0

			--ODD
				-- WDO 0x31 NBR 1
				--	0x18 => wr1=1 wr2=0

				-- WDO 0x31 NBR 2
				--	0x18 => wr1=1 wr2=0
				--	0x19 => wr1=0 wr2=1

				-- WDO 0x31 NBR 3
				--	0x18 => wr1=1 wr2=0
				--	0x19 => wr1=0 wr2=0

				-- WDO 0x31 NBR 4
				--	0x18 => wr1=1 wr2=0
				--	0x19 => wr1=0 wr2=0
				--	0x1A => wr1=0 wr2=1

				SampledWindow256 := to_integer(unsigned(WR_ADDR_S));
				if StorageCnt >= 0  and storage_stm = STORAGE then
					if CtrlBus_IxSL.FSTWINDOW(0) = '0' then -- Even Window numbers
						case StorageCnt is
							when 0 =>
								if CtrlBus_IxSL.NBRWINDOW(0) = '0' then
									RoundBuffer(SampledWindow256).wr1_en <= '0';
									RoundBuffer(SampledWindow256).wr2_en <= '0';
								else
									RoundBuffer(SampledWindow256).wr1_en <= '0';
									RoundBuffer(SampledWindow256).wr2_en <= '1';
								end if;
							when others =>
								RoundBuffer(SampledWindow256).wr1_en <= '0';
								RoundBuffer(SampledWindow256).wr2_en <= '0';
						end case;
					else	-- Odd Windows
						case StorageCnt is
							when 0 =>
								if CtrlBus_IxSL.NBRWINDOW(0) = '0' then
									RoundBuffer(SampledWindow256).wr1_en <= '0';
									RoundBuffer(SampledWindow256).wr2_en <= '1';
								else
									RoundBuffer(SampledWindow256).wr1_en <= '1';
									RoundBuffer(SampledWindow256).wr2_en <= '0';
								end if;
							when others =>
								if StorageCnt+1 = to_integer(unsigned(CtrlBus_IxSL.NBRWINDOW(8 downto 0))) then
									RoundBuffer(SampledWindow256).wr1_en <= '1';
									RoundBuffer(SampledWindow256).wr2_en <= '0';
								else
									RoundBuffer(SampledWindow256).wr1_en <= '0';
									RoundBuffer(SampledWindow256).wr2_en <= '0';
								end if;
						end case;
					end if;


				end if;

				-- Checking if Buffer Full
--				if (full = '1') then
--					GCntW := RealWdoCnt;
--					TmpCnt := 0;
--					while(((RoundBuffer(GCntW).wr1_en = '0') or (RoundBuffer(GCntW).wr2_en = '0')) and TmpCnt < 256) loop
--						if GCntW = 255 then
--							GCntW := 0;
--						else
--							GCntW := GCntW + 1;
--						end if;
--						TmpCnt := TmpCnt + 1;
--					end loop;

--				end if;

				--INcrease the counter by jump
--				TmpCnt := RealWdoCnt;
--
--				TmpCnt := TmpCnt + to_integer(unsigned(RoundBuffer(TmpCnt).jump(7 downto 1)));
--
--				if (RoundBuffer(RealWdoCnt).wr1_en = '1' and RoundBuffer(RealWdoCnt).wr2_en = '1') then
--					-- The next Windwo Free of writting is found
--					WR_ADDR_S <= std_logic_vector(to_unsigned(TmpCnt,WR_ADDR_S'length));
--				end if;
--
--				if TmpCnt = 255 then
--					TmpCnt := 0;
--				else
--					TmpCnt := TmpCnt + 1;
--				end if;
--				RealWdoCnt <= TmpCnt;
--				fifo_intl.addr<=	WR_ADDR_S;
--				fifo_intl.wdotime<= Cnt(63 downto 5);	--Time @ the end of SSTIN clock period for storing the data into the analog memory

				-- V2
				if ((RoundBuffer(RealWdoCnt).wr1_en = '1') and (RoundBuffer(RealWdoCnt).wr2_en = '1')) then
					-- The next Windwo Free of writting is found
					WR_ADDR_S <= std_logic_vector(to_unsigned(RealWdoCnt,WR_ADDR_S'length));
					fifo_intl.addr<=	WR_ADDR_S;
					fifo_intl.wdotime<= timecounter;
				end if;

				if RealWdoCnt = 255 then
					RealWdoCnt <= 0;
				else
					RealWdoCnt <= RealWdoCnt + 1;
				end if;



			end if;
		end if;
	end process;

	-- FIFO Filing In
	STO_DataIn_intl(58+5 downto 0)	<= fifo_intl.wdotime;
	STO_DataIn_intl(66+5 downto 59+5)	<= fifo_intl.addr;
	STO_DataIn_intl(67+5)				<= RoundBuffer(to_integer(unsigned(fifo_intl.addr))).wr1_en;
	STO_DataIn_intl(68+5)				<= RoundBuffer(to_integer(unsigned(fifo_intl.addr))).wr2_en;
	STO_DataIn_intl(100+5 downto 69+5)	<= (others => '0');

	STO_WriteEn <= '1'  when (RoundBuffer(to_integer(unsigned(fifo_intl.addr))).wr1_en = '0' or RoundBuffer(to_integer(unsigned(fifo_intl.addr))).wr2_en='0') else '0';

	-- Address Write
	WR_RS_S <= WR_ADDR_S(1 downto 0);
	WR_CS_S <= WR_ADDR_S(7 downto 2);

	-- Check if Round Buffer is Full
	full_intl(0) <= ((RoundBuffer(0).wr1_en or RoundBuffer(0).wr2_en));
	GEN_FULL : for I in 1 to 255 generate
		full_intl(I) <= ((RoundBuffer(I).wr1_en or RoundBuffer(I).wr2_en) or full_intl(I-1));
	end generate;
	full <= full_intl(255);


end Behavioral;
