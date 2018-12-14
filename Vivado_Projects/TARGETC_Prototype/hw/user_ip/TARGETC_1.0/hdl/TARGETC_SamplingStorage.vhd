
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.TARGETC_pkg.all;

entity TARGETC_SamplingStorage is
	Port ( 
	--CLK : 			in  STD_LOGIC;
	RST : 			in	STD_Logic;
	
	DISCH_PERIOD :	in	std_logic_vector(15 downto 0);
	INCR_WAIT_PERIOD:	in std_logic_vector(15 downto 0);
	
	ClockBus:		in T_ClockBus;
	
	--eTPG :			in std_logic;
	
	WR_RS_S:		out std_logic_vector(1 downto 0);
	WR_CS_S:		out std_logic_vector(5 downto 0);
	
	RDAD_CLK:		out	std_logic;		-- Pin#61
	RDAD_SIN:		out	std_logic;		-- Pin#62
	RDAD_DIR:		out	std_logic;		-- Pin#63
	
	RAMP:			out	std_logic;
	GCC_RESET:		out	std_logic;
	
	HSCLK : 			out  STD_LOGIC;
		
	DO : 			in std_logic_vector(15 downto 0);
	SS_INCR:		out std_logic;
	SS_RESET:		out std_logic;
	
	CtrlBus_IxSL:		in 	T_CtrlBus_IxSL; --Outputs from Control Master
	CtrlBus_OxSL:		out	T_CtrlBus_OxSL; --Outputs from Control Master
	
	FIFOresponse:		in std_logic
	
	);
	
end TARGETC_SamplingStorage;

architecture Behavioral of TARGETC_SamplingStorage is

	

	type storagestate is (
		IDLE,
		READY,
		RESPREADY,
				
		STORAGE,
		
		VALID,
		RESPVALID
	);
	signal storage_stm : storagestate := IDLE;
	
	constant DUMMY_STORAGE_ADDR	:	std_logic_vector(7 downto 0) := (others => '1');
	
	constant DUMMY_ROW :			std_logic_vector(1 downto 0) := (others => '1');
	constant DUMMY_COL :			std_logic_vector(5 downto 0) := (others => '1');
	
	signal CtrlStorage : CtrlStorageArray; 
	signal StorageAddr	:	std_logic_vector(7 downto 0) := (others => '0');
	signal StoEndWindow: std_logic_vector(8 downto 0) := (others => '0');
	
	signal odd, even 	:	std_logic_vector(8 downto 0) := (others => '0');
	
	--State
	type state_type is (
		IDLE,
		READY,
		RESPREADY,
		SET_RDAD_ADDR,
		
		INCRWAIT,
		LOW_SET0,
		LOW_SET1,
		HIGH_SET1,
		HIGH_SET0,
		
		VALID,
		RESPVALID,
		RESPVALID2,
		IDLERESET,
		FIFOTEST_DATA,
		FIFOTEST_VALID,
		FIFOTEST_RESPVALID,
		FIFOTEST_RESPVALID2
	);
	signal rdad_stm : state_type := IDLE;
	signal hsout_stm : state_type := IDLE;
			--State
	type wilkinson_type is (
		IDLE,
		READY,
		RESPREADY,
		
		CLEAR,
		START,
		
		VALID,
		RESPVALID,
		RAMP_DISCH
	);
	signal wlstate : wilkinson_type := IDLE;
	
	signal StoAddr : std_logic_vector(7 downto 0) := (others => '0');
	
	signal RD_Addr	:std_logic_vector(8 downto 0) := (others => '0');
	signal RDADEndWindow:std_logic_vector(8 downto 0) := (others => '0');
	 
	signal BitCnt : integer := 8;
	
	signal wlcnt : std_logic_vector(10 downto 0) := (others => '0');
	
	signal StorageBusy : std_logic := '1';
	
	signal RDAD_CLK_intl:	std_logic;
	signal RDAD_SIN_intl:	std_logic;
	signal RDAD_DIR_intl:	std_logic;
	
	signal RAMP_intl:		std_logic;
	signal GCC_RESET_intl:	std_logic;
	
	signal SS_RESET_intl: std_logic;
	signal SS_INCR_intl: std_logic;
	signal HSCLK_intl :	std_logic := '0';
	
	type T_HANDSHAKE is record
		busy:		std_logic;
		valid:		std_logic;
		ready:		std_logic;
		response:	std_logic;
	end record;	
	
	signal STO:		T_HANDSHAKE;
	signal RDAD:	T_HANDSHAKE;
	signal WL:		T_HANDSHAKE;
	signal SS:		T_HANDSHAKE;

	signal oddeven : std_logic := '0';
	signal WindowCnt : std_logic_vector(8 downto 0);
	signal WL_CNT_EN : std_logic := '0';
	signal WL_CNT_INTL	: UNSIGNED(15 downto 0) := x"0000";

	signal SS_CNT_EN : std_logic := '0';
	signal SS_CNT_INTL	: UNSIGNED(15 downto 0) := x"0000";

	signal RetAddr_intl : T_ReturnAddress;

  	signal SSBitCnt :	integer := 0;
  	signal SSCnt :	integer := 0;
	signal ss_incr_flg : std_logic := '0';
	
	signal WL_CNT_EN_intl : std_logic := '0';
	
	signal CtrlDO_intl :	eDO_BUS_TYPE;
	signal TestFIFO_window : integer;
	signal TestFIFO_cnt : integer;
begin

	-- --------------------------------------------------------------------------------
	-- Unused signals from Bus
	CtrlBus_OxSL.TC_BUS	<= (others => 'Z');
--	CtrlBus_OxSL.DO_BUS.CH0  <= (others => 'Z');
--	CtrlBus_OxSL.DO_BUS.CH1  <= (others => 'Z');
--	CtrlBus_OxSL.DO_BUS.CH2  <= (others => 'Z');
--	CtrlBus_OxSL.DO_BUS.CH3  <= (others => 'Z');
	
--	CtrlBus_OxSL.DO_BUS.CH4  <= (others => 'Z');
--	CtrlBus_OxSL.DO_BUS.CH5  <= (others => 'Z');
--	CtrlBus_OxSL.DO_BUS.CH6  <= (others => 'Z');
--	CtrlBus_OxSL.DO_BUS.CH7  <= (others => 'Z');
	
--	CtrlBus_OxSL.DO_BUS.CH8  <= (others => 'Z');
--	CtrlBus_OxSL.DO_BUS.CH9  <= (others => 'Z');
--	CtrlBus_OxSL.DO_BUS.CH10  <= (others => 'Z');
--	CtrlBus_OxSL.DO_BUS.CH11  <= (others => 'Z');
	
--	CtrlBus_OxSL.DO_BUS.CH12  <= (others => 'Z');
--	CtrlBus_OxSL.DO_BUS.CH13  <= (others => 'Z');
--	CtrlBus_OxSL.DO_BUS.CH14  <= (others => 'Z');
--	CtrlBus_OxSL.DO_BUS.CH15  <= (others => 'Z');
	CtrlBus_OxSL.BUSY	<= 'Z';
	CtrlBus_OxSL.PLL_LOCKED <= 'Z';
	-- --------------------------------------------------------------------------------
	
	--counter process
	process (ClockBus.WL_CLK,WL_CNT_EN) begin
		if (WL_CNT_EN = '0') then
			WL_CNT_INTL <= (others => '0');
		elsif (rising_edge(ClockBus.WL_CLK)) then
			if WL_CNT_EN = '1' then
				WL_CNT_INTL <= WL_CNT_INTL + 1;
			end if;
		end if;
	end process;

	
	process(ClockBus.SSTIN, RST, CtrlBus_IxSL.SWRESET)	-- Every 64 ns
	begin
		if RST = '0' or CtrlBus_IxSL.SWRESET = '0' then
			storage_stm <= IDLE;
			StorageAddr <= (others =>'1');
			CtrlStorage.dirty <= (others => '1');
			CtrlStorage.digit <= (others => '1');
			
			WR_RS_S	<= DUMMY_ROW;
			WR_CS_S	<= DUMMY_COL;
			STO.valid <= '0';
		else
			if rising_edge(ClockBus.SSTIN) then
				case storage_stm is
					when IDLE =>
						STO.response <= '0';
						STO.ready <= '1';
						STO.valid <= '0';
						STO.busy <= '0';
						storage_stm <= READY;
					when READY =>
					
						--if(CtrlBus_IxSL.StartStorage = '1') then
						--if(StartStorage = '1') then
						--	storage_stm <= START;
						--	StorageAddr <= (others =>'0');
						--	SS.busy <= '1';
						--elsif(CtrlBus_IxSL.WindowStorage = '1') then
						if(CtrlBus_IxSL.WindowStorage = '1') then
							storage_stm <= RESPREADY;
							StorageAddr <= CtrlBus_IxSL.FSTWINDOW(7 downto 0);
							
							--StoEndWindow <= std_logic_vector(unsigned(CtrlBus_IxSL.FSTWINDOW(7 downto 0)) + unsigned(CtrlBus_IxSL.NBRWINDOW(8 downto 1)));
							
							StoEndWindow <= std_logic_vector(unsigned(CtrlBus_IxSL.FSTWINDOW(7 downto 0) & '0') + unsigned(CtrlBus_IxSL.NBRWINDOW(8 downto 0)) + 1);
							STO.busy <= '1';
						else
							storage_stm <= READY;
						end if;
					when RESPREADY =>
						STO.ready <= '0';
						--if(CtrlBus_IxSL.StartStorage = '0') and (CtrlBus_IxSL.WindowStorage = '0') then
						if(CtrlBus_IxSL.WindowStorage = '0') then
						--if(StartStorage = '1') then
							storage_stm <= STORAGE;
						else
							--StorageAddr <= (others => '1');
							WR_RS_S	<= DUMMY_ROW;
							WR_CS_S	<= DUMMY_COL;
							storage_stm <= RESPREADY;
						end if;
						--nop	
					when STORAGE =>
						if(unsigned(StorageAddr) < (unsigned(StoEndWindow(8 downto 1)))) then
							WR_RS_S(1 downto 0) <= StorageAddr(1 downto 0);
							WR_CS_S(5 downto 0) <= StorageAddr(7 downto 2);
						
							StorageAddr <= std_logic_vector(unsigned(StorageAddr) + 1);
							
						--	CtrlStorage.dirty(to_integer(unsigned(odd))) <= '1';
						--	CtrlStorage.dirty(to_integer(unsigned(even))) <= '1';
							
						else
							--StorageAddr <= (others => '1');
							WR_RS_S	<= DUMMY_ROW;
							WR_CS_S	<= DUMMY_COL;
							
							storage_stm <= VALID;
						end if;
					
					when VALID =>
						if RDAD.ready = '0' then
							storage_stm <= VALID;
						else						
							storage_stm <= RESPVALID;
						end if;
					
					when RESPVALID =>
						if (RDAD.response = '1') then
							STO.busy <= '1';
							STO.valid <= '0';
							storage_stm <= IDLE;
						else
							STO.valid <= '1';
							storage_stm <= RESPVALID;
						end if;

					when others =>
						--nop
						StorageAddr <= (others => '1');
						WR_RS_S	<= DUMMY_ROW;
						WR_CS_S	<= DUMMY_COL;
							
						storage_stm <= IDLE;					
				end case;
			end if;
		end if;
	end process;
	
	process(StorageAddr)
	begin
		odd <= StorageAddr(7 downto 2) & StorageAddr(1 downto 0) & '0';
		even <= StorageAddr(7 downto 2) & StorageAddr(1 downto 0) & '1';
	end process;
	

	--CtrlBus_OxSL.Storage <= '1' when storage_stm = STOP else '0';
	--StorageBusy <= '0' when storage_stm = STOP else '1';
	
	-- Digitilization Readout the Samples Storage Location
	process(RST,ClockBus.RDAD_CLK,CtrlBus_IxSL.SWRESET)
	begin
		if RST = '0' or CtrlBus_IxSL.SWRESET = '0' then
			RDAD_CLK_intl 	<= '0';
			RDAD_SIN_intl 	<= '0';
			RDAD_DIR_intl 	<= '0';				
			BitCnt <= 8;
			StoAddr <= (others => '0');
			RD_Addr <= (others => '0');
			--CtrlBus_OxSL.RD_ADDR <= (others => '0');
			RDAD.response <= '0';
			RDAD.ready <= '0';
			RDAD.busy <= '0';
			RDAD.valid <= '0';
			RDAD_stm <= IDLE;
			oddeven <= '0';
		else
			if rising_edge(ClockBus.RDAD_CLK) then
				case rdad_stm is
					when IDLE =>
						RDAD_CLK_intl 	<= '0';
						RDAD_SIN_intl 	<= '0';
						RDAD_DIR_intl 	<= '0';
						RDAD.ready <= '1';
						RDAD.valid <= '0';
						RDAD.busy <= '0';
						--BitCnt <= 10;
						BitCnt <= 0;
						RDAD.response <= '0';
--						if(StorageBusy = '0' and WL.busy = '0' and SS.busy = '0' and done_flg = '0') then -- Storage Done Digitilization can start
--							rdad_stm <= LOW_SET0;
--							RDAD.busy <= '1';
--						else
--							rdad_stm <= IDLE;
--						end if;

						rdad_stm <= READY;
					when READY =>
						if (STO.valid = '1') then
							rdad_stm <= RESPREADY;
						else
							rdad_stm <= READY;
						end if;
						
					when RESPREADY =>
						RDAD.response <= '1';
						RDAD.busy <= '1';
						
						if (STO.valid = '0') then
							rdad.valid <= '0';
							rdad.ready <= '0';
							rdad_stm <= SET_RDAD_ADDR;
							
							oddeven <= '0';
							RetAddr_intl.oddeven <= '0';
							
							StoAddr <= CtrlBus_IxSL.FSTWINDOW(7 downto 0);
							
							--WindowCnt <= CtrlBus_IxSL.FSTWINDOW(7 downto 0);
							WindowCnt <= (others => '0');
							
							RDADEndWindow <= CtrlBus_IxSL.NBRWINDOW(8 downto 0);
							
							-- Setup Read Address
						else
							rdad_stm <= RESPREADY;
						end if;
					
					when SET_RDAD_ADDR =>
							if(WL.ready = '1') then
								RDAD.response <= '0';
							
								--RD_Addr <= StoAddr(7 downto 2) & oddeven & StoAddr(1 downto 0);
								RD_Addr <= StoAddr(7 downto 2) & StoAddr(1 downto 0) & oddeven;
							
								oddeven <= not oddeven;	-- Next Sampling is the odd part and so on		
						
								rdad_stm <= LOW_SET0;
							else
								rdad_stm <= SET_RDAD_ADDR;
							end if;
					when LOW_SET0 =>
						RDAD_CLK_intl 	<= '0';
						
						--if(BitCnt > 0)then
						--	RDAD_SIN_intl 	<= StoAddr(BitCnt-1); --MSB First
						
						--RDAD_SIN_intl 	<= StoAddr(8-BitCnt); --MSB First
						RDAD_SIN_intl 	<= RD_Addr(8-BitCnt); --MSB First
						RDAD_DIR_intl 	<= '1';
						
						rdad_stm <= LOW_SET1;
					when LOW_SET1 =>
						RDAD_CLK_intl <= '1';
						rdad_stm <= HIGH_SET1;
					when HIGH_SET1 =>
						RDAD_CLK_intl <= '1';
						rdad_stm <= HIGH_SET0;
					when HIGH_SET0 =>
						-- SAmple the output of TARGETC
						--if StoAddr <  x"1FF" then
						--	StoAddr <= std_logic_vector(unsigned(StoAddr)+1);
							--if	BitCnt = 0 then
							--	BitCnt <= 10;
							if BitCnt >= 8 then
								BitCnt <= 0;
								RDAD_DIR_intl <= '0';
								rdad_stm <= VALID;
								RDAD.valid <= '1';
								RDAD.busy <= '1';
							else
								RDAD_DIR_intl 	<= '1';
								--BitCnt <= BitCnt - 1;
								BitCnt <= BitCnt + 1;
								rdad_stm <= LOW_SET0;
								RDAD.busy <= '1';
							end if;
					
						RDAD_CLK_intl 	<= '0';
						
					when VALID =>
						RDAD_SIN_intl 	<= '0'; --MSB First
						
						--CtrlBus_OxSL.RD_ADDR <= StoAddr;
						
						--Return Addres through AXI-Lite
						RetAddr_intl.oddeven <= not oddeven;
						RetAddr_intl.RD_ADDR <= StoAddr;
						
						if (WL.response = '1') then
							RDAD.valid <= '1';
							rdad_stm <= VALID;
						else
							RDAD.valid <= '0';
							rdad_stm <= RESPVALID;
						end if;
					when RESPVALID =>
						if (WL.response = '0') then
							if unsigned(WindowCnt) < (unsigned(RDADEndWindow)-1) then
									if (oddeven = '0') then
										StoAddr <= std_logic_vector(unsigned(StoAddr)+1);
									end if;
									rdad_stm <= SET_RDAD_ADDR;
									RDAD.valid <= '0';
									RDAD.busy <= '1';
									WindowCnt <= std_logic_vector(unsigned(WindowCnt)+1);
							else	
									RDAD.valid <= '0';
									RDAD.busy <= '0';
									StoAddr <= (others => '1');
									rdad_stm <= IDLE;
							end if;	
								
							
						else
							RDAD.valid <= '0';
							rdad_stm <= RESPVALID;
						end if;	
					when others	=>
						-- nop
				end case;
			end if;
		end if;	
	end process;
	
	
	RDAD_CLK 	<= RDAD_CLK_intl;
	RDAD_SIN 	<= RDAD_SIN_intl;
	RDAD_DIR 	<= RDAD_DIR_intl;
	
	-- Wilkinson	
	process(RST,ClockBus.WL_CLK,CtrlBus_IxSL.SWRESET)
	begin
		if RST = '0' or CtrlBus_IxSL.SWRESET = '0' then
			RAMP_intl <= '0';	--Vdischarge
			GCC_RESET_intl <= '1';
			wlcnt <= (others => '0');
			
			WL.response <= '0';
			WL.ready <= '0';
			WL.busy <= '0';
			WL.valid <= '0';
			WL_CNT_EN_intl <= '0';
			wlstate <= IDLE;
		else
			if rising_edge(ClockBus.WL_CLK) then
				case wlstate is
					when IDLE =>
						RAMP_intl <= '0';
						WL.response <= '0';
						WL.ready <= '1';
						wlstate <= READY;
						GCC_RESET_intl <= '1';
					
					when READY =>
						WL.ready <= '1';
						if (RDAD.valid = '1') then
							wlstate <= RESPREADY;
							WL.response <= '1';
						else
							wlstate <= READY;
							WL.response <= '0';
						end if;
					when RESPREADY =>	
						WL.response <= '0';
						WL.ready <= '0';
						WL.busy <= '1';
						if (RDAD.valid = '0') then
							WL.valid <= '0';
							--WL.ready <= '0';
							GCC_RESET_intl <= '1';
							wlstate <= CLEAR;
						else
							wlstate <= RESPREADY;
						end if;
						
						WL_CNT_EN_intl <= '0';
						
					when CLEAR =>
						WL.response <= '0';
						GCC_RESET_intl <= '0';
						
						wlcnt <= (others =>'0');
						RAMP_intl <= '1';
						
						WL_CNT_EN_intl <= '1';
						
						wlstate <= START;
					when START =>
						if(wlcnt = "11111111111" ) then
							WL.valid <= '1';
							WL.ready <= '0';
							wlstate <= VALID;
							wlcnt <= (others =>'0');
							WL_CNT_EN_intl <= '0';
						else
							WL_CNT_EN_intl <= '1';
							wlstate <= START;
							wlcnt <= std_logic_vector(unsigned(wlcnt)+1);
						end if;
					when VALID =>
						if SS.ready = '0' then
							wlstate <= VALID;
						else						
							wlstate <= RESPVALID;
						end if;
					when RESPVALID =>
						RAMP_intl <= '1';
						if (SS.response = '1') then
							WL.busy <= '1';
							--WL.ready <= '1';
							WL.valid <= '0';
							wlstate <= RAMP_DISCH;
							
							wlcnt <= (others => '0');
						else
							WL.valid <= '1';
							
							wlstate <= RESPVALID;
						end if;
					
					when RAMP_DISCH =>
						WL.ready <= '0';
						if (SS.busy = '1') then
							RAMP_intl <= '1';
							WL_CNT_EN <= '0';
						else
							WL_CNT_EN <= '1';
							
							RAMP_intl <= '0';
							if WL_CNT_INTL > UNSIGNED(DISCH_PERIOD) then
								WL.busy <= '0';
								WL.ready <= '1';
								WL.valid <= '0';
								wlstate <= IDLE;
								GCC_RESET_intl <= '1';
								WL_CNT_EN <= '0';
							end if;
						end if;	
					when others =>
						--nop
						wlstate <= IDLE;
				end case;
				--wlcnt ++
			end if;
		end if;
	end process;
	
	RAMP 		<= RAMP_intl;
	--RAMP		<= 	'1'	when WL.busy = '1' else
	--				'1' when SS.busy = '1' else 
	--					'0';
						
	GCC_RESET 	<= GCC_RESET_intl;
	CtrlBus_OxSL.RAMP_CNT	<= WL_CNT_EN_intl;
	
	
	process (ClockBus.HSCLK,SS_CNT_EN) begin
	if (SS_CNT_EN = '0') then
		SS_CNT_INTL <= (others => '0');
	elsif (rising_edge(ClockBus.HSCLK)) then
		if SS_CNT_EN = '1' then
			SS_CNT_INTL <= SS_CNT_INTL + 1;
		end if;
	end if;
	end process;
	
	-- Process for Data Out
	process(RST,ClockBus.HSCLK,CtrlBus_IxSL.SWRESET)
	begin
		if RST = '0' or CtrlBus_IxSL.SWRESET = '0' then
			
			SS.response <= '0';
			SS.ready <= '0';
			SS.busy <= '0';
			SS.valid <= '0';
			SS_INCR_flg <= '0';
			hsout_stm <= IDLE;
			--CtrlBus_OxSL.SS_SELECT <= (others => '0');
			RetAddr_intl.SS_SELECT <= (others => '0');
			SScnt <= 0;
			SSBitcnt <= 0;
			
			SS_INCR_intl <= '0';
			SS_RESET_intl <= '1';
		else
			if rising_edge(ClockBus.HSCLK) then	
				
				--STM	
				case hsout_stm is
					when IDLE =>	
						SS.response <= '0';
						SS.ready <= '1';
						SS.valid <= '0';
						SS.busy <= '0';
						hsout_stm <= READY;
						
						HSCLK_intl <= '0';
						SS_RESET_intl <= '0';
						SS_INCR_intl <= '0';
						--SScnt <= 0;
						--SSBitcnt <= 0;
					when READY =>
						if(CtrlBus_IxSL.SS_INCR = '1')then
							SS_INCR_flg <= '1';
							SS_INCR_intl <= '1';
							--hsout_stm <= LOW_SET0;
							SS_CNT_EN <= '1';
							hsout_stm <= INCRWAIT;
						elsif (CtrlBus_IxSL.TestFIFO = '1' and CtrlBus_IxSL.SAMPLEMODE = '1') then	-- New
							TestFIFO_cnt <= 0;
							TestFIFO_window <= 0;
							SS.busy <= '1';
							hsout_stm <= FIFOTEST_DATA;
						elsif (WL.valid = '1') then
							SS_INCR_flg <= '0';
							hsout_stm <= RESPREADY;
							SS.busy <= '1';
						else
							hsout_stm <= READY;
						end if;
						
						SScnt <= 0;
						SSBitcnt <= 0;
					
					when FIFOTEST_DATA => 
						
						CtrlDO_intl.CH0 <= std_logic_vector(to_unsigned(TestFIFO_window * 512 + TestFIFO_cnt*16 + 0,CtrlDO_intl.CH0'length));
						CtrlDO_intl.CH1 <= std_logic_vector(to_unsigned(TestFIFO_window * 512 + TestFIFO_cnt*16 + 1,CtrlDO_intl.CH1'length));
						CtrlDO_intl.CH2 <= std_logic_vector(to_unsigned(TestFIFO_window * 512 + TestFIFO_cnt*16 + 2,CtrlDO_intl.CH2'length));
						CtrlDO_intl.CH3 <= std_logic_vector(to_unsigned(TestFIFO_window * 512 + TestFIFO_cnt*16 + 3,CtrlDO_intl.CH3'length));
					
						CtrlDO_intl.CH4 <= std_logic_vector(to_unsigned(TestFIFO_window * 512 + TestFIFO_cnt*16 + 4,CtrlDO_intl.CH4'length));
						CtrlDO_intl.CH5 <= std_logic_vector(to_unsigned(TestFIFO_window * 512 + TestFIFO_cnt*16 + 5,CtrlDO_intl.CH5'length));
						CtrlDO_intl.CH6 <= std_logic_vector(to_unsigned(TestFIFO_window * 512 + TestFIFO_cnt*16 + 6,CtrlDO_intl.CH6'length));
						CtrlDO_intl.CH7 <= std_logic_vector(to_unsigned(TestFIFO_window * 512 + TestFIFO_cnt*16 + 7,CtrlDO_intl.CH7'length));
					
						CtrlDO_intl.CH8 <= std_logic_vector(to_unsigned(TestFIFO_window * 512 + TestFIFO_cnt*16 + 8,CtrlDO_intl.CH8'length));
						CtrlDO_intl.CH9 <= std_logic_vector(to_unsigned(TestFIFO_window * 512 + TestFIFO_cnt*16 + 9,CtrlDO_intl.CH9'length));
						CtrlDO_intl.CH10 <=std_logic_vector(to_unsigned(TestFIFO_window * 512 + TestFIFO_cnt*16 + 10,CtrlDO_intl.CH10'length));
						CtrlDO_intl.CH11 <= std_logic_vector(to_unsigned(TestFIFO_window * 512 + TestFIFO_cnt*16 + 11,CtrlDO_intl.CH11'length));
					
						CtrlDO_intl.CH12 <= std_logic_vector(to_unsigned(TestFIFO_window * 512 + TestFIFO_cnt*16 + 12,CtrlDO_intl.CH12'length));
						CtrlDO_intl.CH13 <= std_logic_vector(to_unsigned(TestFIFO_window * 512 + TestFIFO_cnt*16 + 13,CtrlDO_intl.CH13'length));
						CtrlDO_intl.CH14 <= std_logic_vector(to_unsigned(TestFIFO_window * 512 + TestFIFO_cnt*16 + 14,CtrlDO_intl.CH14'length));
						CtrlDO_intl.CH15 <= std_logic_vector(to_unsigned(TestFIFO_window * 512 + TestFIFO_cnt*16 + 15,CtrlDO_intl.CH15'length));
						
						SS.valid <= '1';
						hsout_stm <= FIFOTEST_VALID;
						
					when FIFOTEST_VALID =>
						hsout_stm <= FIFOTEST_RESPVALID;
						
					when FIFOTEST_RESPVALID =>		
						if (FIFOresponse = '1' and CtrlBus_IxSL.SAMPLEMODE = '1') then
							SS.valid <= '0';
							hsout_stm <= FIFOTEST_RESPVALID2;
						else
							hsout_stm <= FIFOTEST_RESPVALID;
						end if;
					when FIFOTEST_RESPVALID2 =>		
						if (FIFOresponse = '0' and CtrlBus_IxSL.SAMPLEMODE = '1') then
							if (TestFIFO_cnt < 31) then
								hsout_stm <= FIFOTEST_DATA;
								TestFIFO_cnt <= TestFIFO_cnt + 1;
							else
								TestFIFO_cnt <= 0;
								if (TestFIFO_window < to_integer(unsigned(CtrlBus_IxSL.NBRWINDOW)-1)) then
									hsout_stm <= FIFOTEST_DATA;
									TestFIFO_window <= TestFIFO_window + 1;
								else
									TestFIFO_window <= 0;
									hsout_stm <= IDLE;
								end if;
							end if;
						else
							hsout_stm <= FIFOTEST_RESPVALID2;
						end if;
					
						
					when RESPREADY =>
						SS.response <= '1';
						SS.busy <= '1';
						if (WL.valid = '0') then
							HSCLK_intl <= '0';
							SS_INCR_intl <= '1';
							--hsout_stm <= LOW_SET0;
							SS_CNT_EN <= '1';
							hsout_stm <= INCRWAIT;
						else
							hsout_stm <= RESPREADY;
						end if;
					when INCRWAIT =>
						SS_INCR_intl <= '1';
						if SS_CNT_INTL > UNSIGNED(INCR_WAIT_PERIOD) then
							SS_CNT_EN <= '0';
							hsout_stm <= LOW_SET0;
						else
							SS_CNT_EN <= '1';	
						end if;
					when LOW_SET0 =>
						HSCLK_intl <= '0';
						if SSBitCnt = 0  then
							SS_INCR_intl <= '1';
						else
							SS_INCR_intl <= '0';
						end if;
						SS_RESET_intl <= '0';
						hsout_stm <= LOW_SET1;
					when LOW_SET1 =>
						HSCLK_intl <= '1';
						hsout_stm <= HIGH_SET1;
					when HIGH_SET1 =>
						SS_INCR_intl <= '0';
						HSCLK_intl <= '1';
						hsout_stm <= HIGH_SET0;
					when HIGH_SET0 =>
						-- SAmple the output of TARGETC
						if SSBitCnt > 1 then
						
							CtrlDO_intl.CH0(SSBitCnt-2) <= DO(0);
							CtrlDO_intl.CH1(SSBitCnt-2) <= DO(1);
							CtrlDO_intl.CH2(SSBitCnt-2) <= DO(2);
							CtrlDO_intl.CH3(SSBitCnt-2) <= DO(3);
					
							CtrlDO_intl.CH4(SSBitCnt-2) <= DO(4);
							CtrlDO_intl.CH5(SSBitCnt-2) <= DO(5);
							CtrlDO_intl.CH6(SSBitCnt-2) <= DO(6);
							CtrlDO_intl.CH7(SSBitCnt-2) <= DO(7);
					
							CtrlDO_intl.CH8(SSBitCnt-2) <= DO(8);
							CtrlDO_intl.CH9(SSBitCnt-2) <= DO(9);
							CtrlDO_intl.CH10(SSBitCnt-2) <=DO(10);
							CtrlDO_intl.CH11(SSBitCnt-2) <= DO(11);
					
							CtrlDO_intl.CH12(SSBitCnt-2) <= DO(12);
							CtrlDO_intl.CH13(SSBitCnt-2) <= DO(13);
							CtrlDO_intl.CH14(SSBitCnt-2) <= DO(14);
							CtrlDO_intl.CH15(SSBitCnt-2) <= DO(15);
							
							-- LSB First 
							--CtrlBus_OxSL.DO_BUS.CH0(SSBitCnt-2) <= DO(0);
							--CtrlBus_OxSL.DO_BUS.CH1(SSBitCnt-2) <= DO(1);
							--CtrlBus_OxSL.DO_BUS.CH2(SSBitCnt-2) <= DO(2);
							--CtrlBus_OxSL.DO_BUS.CH3(SSBitCnt-2) <= DO(3);
					
							--CtrlBus_OxSL.DO_BUS.CH4(SSBitCnt-2) <= DO(4);
							--CtrlBus_OxSL.DO_BUS.CH5(SSBitCnt-2) <= DO(5);
							--CtrlBus_OxSL.DO_BUS.CH6(SSBitCnt-2) <= DO(6);
							--CtrlBus_OxSL.DO_BUS.CH7(SSBitCnt-2) <= DO(7);
					
							--CtrlBus_OxSL.DO_BUS.CH8(SSBitCnt-2) <= DO(8);
							--CtrlBus_OxSL.DO_BUS.CH9(SSBitCnt-2) <= DO(9);
							--CtrlBus_OxSL.DO_BUS.CH10(SSBitCnt-2) <=DO(10);
							--CtrlBus_OxSL.DO_BUS.CH11(SSBitCnt-2) <= DO(11);
					
							--CtrlBus_OxSL.DO_BUS.CH12(SSBitCnt-2) <= DO(12);
							--CtrlBus_OxSL.DO_BUS.CH13(SSBitCnt-2) <= DO(13);
							--CtrlBus_OxSL.DO_BUS.CH14(SSBitCnt-2) <= DO(14);
							--CtrlBus_OxSL.DO_BUS.CH15(SSBitCnt-2) <= DO(15);
						end if;
							
						HSCLK_intl <= '0';
					
						if SSBitCnt = 13 then
						--if SSBitCnt = 13 then
						--if SSBitCnt = 11 then
							hsout_stm <= VALID;
							SSBitCnt <= 0;
							SS.busy <= '1';
							SS.valid <= '1';
							--TPG_flg <= '0';
						else
							SS.valid <= '0';
							SS.busy <= '1';
							hsout_stm <= LOW_SET0;
							SSBitCnt <= SSBitCnt + 1;
						end if;
						--WLvalidAck <= '0'; 
					when VALID =>
						HSCLK_intl <= '0';
						hsout_stm <= RESPVALID;
					when RESPVALID =>
						HSCLK_intl <= '0';
						--CtrlBus_OxSL.SS_SELECT <= std_logic_vector(to_unsigned(SScnt,CtrlBus_OxSL.SS_SELECT'length)); 
						RetAddr_intl.SS_SELECT <=std_logic_vector(to_unsigned(SScnt, RetAddr_intl.SS_SELECT'length)); 
						if (CtrlBus_IxSL.SSACK = '1' and CtrlBus_IxSL.SAMPLEMODE = '0') or (FIFOresponse = '1' and CtrlBus_IxSL.SAMPLEMODE = '1') then
							
							SS.valid <= '0';
							hsout_stm <= RESPVALID2;
							
						else
							SS.busy <= '1';
							SS.valid <= '1';
							hsout_stm <= RESPVALID;
						end if;
					
					when RESPVALID2 =>
						--if CtrlBus_IxSL.SSACK = '0' then
						if (CtrlBus_IxSL.SSACK = '0' and CtrlBus_IxSL.SAMPLEMODE = '0') or (FIFOresponse = '0' and CtrlBus_IxSL.SAMPLEMODE = '1') then
							if (SS_INCR_flg = '0') then
								SScnt <= SScnt + 1;
								if(SScnt < 31) then
									hsout_stm <= LOW_SET0;
									SS.busy <= '1';
								else
									SS_RESET_intl <= '1';
									hsout_stm <= IDLERESET;
									SS.busy <= '0';
								end if;
							else
								SS_RESET_intl <= '1';
								SS_INCR_flg <= '0';
								SS.busy <= '0';
								hsout_stm <= IDLERESET;
							end if;
						end if;
					when IDLERESET =>
						SS.busy <= '0';
						SS_RESET_intl <= '1';
						hsout_stm <= IDLE;
					when others =>
						-- nop
				end case;
			end if;
		end if;		
	end process;
	
	CtrlBus_OxSL.DO_BUS <= CtrlDO_intl;
	
	SS_RESET 	<= SS_RESET_intl;
	--SS_RESET 	<= '0';
	SS_INCR 	<= SS_INCR_intl;
	HSCLK 		<= HSCLK_intl;
	-- Input/Output Refresh

	CtrlBus_OxSL.RetAddr <= Pack(RetAddr_intl);


	CtrlBus_OxSL.SSvalid	<= SS.valid;	-- Status on AXI Lite
	CtrlBus_OxSL.WindowBusy <= 	'1' when RDAD.busy = '1' else
								'1' when WL.busy = '1' else
								'1' when SS.busy = '1' else
								 '0';
end Behavioral;

