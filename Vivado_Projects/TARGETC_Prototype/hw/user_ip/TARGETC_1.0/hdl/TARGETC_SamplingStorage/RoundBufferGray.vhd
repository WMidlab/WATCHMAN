
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.TARGETC_pkg.all;

entity RoundBufferGray is
	Port ( 
	--CLK : 			in  STD_LOGIC;
	RST : 			in	STD_Logic;
	
	ClockBus:		in T_ClockBus;
	
	--eTPG :			in std_logic;
	
	WR_RS_S:		out std_logic_vector(1 downto 0);
	WR_CS_S:		out std_logic_vector(5 downto 0);

	
	CtrlBus_IxSL:		in 	T_CtrlBus_IxSL; --Outputs from Control Master
	CtrlBus_OxSL:		out	T_CtrlBus_OxSL; --Outputs from Control Master
	
	-- FIFO out for Reading RDAD
    RDAD_ReadEn  :in  std_logic;
    RDAD_DataOut : out std_logic_vector(9 downto 0);	
    RDAD_CLK        :in  std_logic;	-- RDAD CLK
     
    -- FIFO IN for Digiting
    DIG_DataIn	: in	std_logic_vector(8 downto 0);
    DIG_WriteEn	: in	std_logic;
    DIG_CLK   	: in	std_logic
	);
	
end RoundBufferGray;

architecture Behavioral of RoundBufferGray is
	
	
	component aFifo is
    generic (
        DATA_WIDTH :integer := 8;
        ADDR_WIDTH :integer := 4
    );
    port (
    	rst :		in std_logic;
        -- Reading port.
        Data_out    :out std_logic_vector (DATA_WIDTH-1 downto 0);
        Empty_out   :out std_logic;
        ReadEn_in   :in  std_logic;
        RClk        :in  std_logic;
        -- Writing port.
        Data_in     :in  std_logic_vector (DATA_WIDTH-1 downto 0);
        Full_out    :out std_logic;
        WriteEn_in  :in  std_logic;
        WClk        :in  std_logic
    );
	end component aFifo;
	type digstoragestate is (
		IDLE,
		READING,
		WRITING
	);
	signal digsto_stm : digstoragestate;
	
	type storagestate is (
		IDLE,
		READY,
		RESPREADY,
				
		STORAGE,
		
		VALID,
		RESPVALID
	);
	signal storage_stm : storagestate := IDLE;
	
	type ElementRoundBuf is record
		round :	std_logic_vector(2 downto 0);
		wr1_en : std_logic;
		wr2_en : std_logic;
	end record;
	
	type ArrRoundBuf_t is array (0 to 255) of ElementRoundBuf;
	signal RoundBuffer :	ArrRoundBuf_t;
	signal WindowStoreCnt:	std_logic_vector(7 downto 0);
	signal GrayCntWindow : integer range 0 to 255;	
	signal RoundCnt : std_logic_vector(2 downto 0);
	
	type T_HANDSHAKE is record
		busy:		std_logic;
		valid:		std_logic;
		ready:		std_logic;
		response:	std_logic;
	end record;	
	signal STO:		T_HANDSHAKE;
	
	signal rst_intl : std_logic;
	signal full_intl : std_logic_vector(255 downto 0); 
	signal full :	std_logic;
	
	signal StorageCntAddr : std_logic_vector(8 downto 0);
	signal StorageStopAddr : std_logic_vector(8 downto 0);
	signal WR_ADDR_S : std_logic_vector(7 downto 0);
	
	signal Equal : std_logic;
	signal RdadStorageData : std_logic_vector(9 downto 0);	-- Wr1_en & wr2_en & GrayCnt (window on 256, add 1 or 0)
	signal DigStorageData : std_logic_vector(8 downto 0);
	
	signal StorageWriteEn, StorageReadEn : std_logic;
	
	signal DigEmpty : std_logic;

begin

	-- Reset internal
	rst_intl <= '0' when RST = '0' or CtrlBus_IxSL.SWRESET = '0' else '1';
	
	-- RDAD and Storage FIFO
	RDAD_STO_AFIFO :  aFifo
    generic map(
        DATA_WIDTH => 10,
        ADDR_WIDTH => 4	--Maybe more ?
    )
    port map (
    	rst 	=> rst_intl,
        -- Reading port.
        Data_out    => RDAD_DataOut,
        Empty_out   => open,
        ReadEn_in   => RDAD_ReadEn,
        RClk        => RDAD_CLK,
        -- Writing port.
        Data_in     => RdadStorageData,
        Full_out    => open,
        WriteEn_in  => StorageWriteEn,
        WClk        => ClockBus.SSTIN
    );
    
    -- Digitizing and Storage FIFO
	DIG_STO_AFIFO :  aFifo
    generic map(
        DATA_WIDTH => 9,
        ADDR_WIDTH => 4	--Maybe more ?
    )
    port map (
    	rst 	=> rst_intl,
        -- Reading port.
        Data_out    => DigStorageData,
        Empty_out   => DigEmpty,
        ReadEn_in   => StorageReadEn,
        RClk        => ClockBus.SSTIN,
        -- Writing port.
        Data_in     => DIG_DataIn,
        Full_out    => open,
        WriteEn_in  => DIG_WriteEn,
        WClk        => DIG_CLK
    );
	
	-- Minimal State Machine For Windows select
	process(ClockBus.SSTIN, RST, CtrlBus_IxSL.SWRESET)	-- Every 64 ns
	begin
	if RST = '0' or CtrlBus_IxSL.SWRESET = '0' then
			storage_stm <= IDLE;
			StorageCntAddr <= (others => '0');
			StorageStopAddr <= (others => '0');
		else
			if rising_edge(ClockBus.SSTIN) then		
			
				-- State Machine
				case storage_stm is
					when IDLE =>
						storage_stm <= READY;
					when READY =>
						if(CtrlBus_IxSL.WindowStorage = '1') then
						
							StorageCntAddr	<= CtrlBus_IxSL.FSTWINDOW(8 downto 0);
							StorageStopAddr	<= std_logic_vector(unsigned(CtrlBus_IxSL.FSTWINDOW(8 downto 0)) + unsigned(CtrlBus_IxSL.NBRWINDOW(8 downto 0)));
							
							storage_stm <= RESPREADY;
						else
							storage_stm <= READY;
						end if;
					when RESPREADY =>
						if(CtrlBus_IxSL.WindowStorage = '0') then	
							storage_stm <= STORAGE;
						else
							storage_stm <= RESPREADY;
						end if;					
					when STORAGE =>
						if GrayCntWindow = to_integer(unsigned(StorageCntAddr(8 downto 1))) then
							
							--Send to aFIFO
							
							if StorageCntAddr >= StorageStopAddr then
								storage_stm <= IDLE;
							else
								StorageCntAddr <= std_logic_vector(unsigned(StorageCntAddr) + 2);
								storage_stm <= STORAGE;
							end if;							
							
						else
							storage_stm <= STORAGE;
							-- Waiting that the round buffer is back to position
						end if;
					when others =>
				end case;
			end if;
		end if;
	end process;
	
	-- New Address each SSTIN
	process(ClockBus.SSTIN, RST, CtrlBus_IxSL.SWRESET)	-- Every 64 ns
		variable GCntW : integer range 0 to 255; 
	begin
		if RST = '0' or CtrlBus_IxSL.SWRESET = '0' then
			GrayCntWindow <= 0;
			RoundCnt <= (others => '0');
			WR_ADDR_S <= (others => '0');
			
			for k in 0 to 255 loop
				RoundBuffer(k).wr1_en <= '1';
				RoundBuffer(k).wr2_en <= '1';
			end loop;
			
			digsto_stm <= IDLE;
			StorageReadEn <= '0';
		else
			if rising_edge(ClockBus.SSTIN) then
				
				-- State Machine for Reading the windows digitized
				case digsto_stm is
					when IDLE =>
						if DigEmpty = '0' then
							digsto_stm <= READING;
							StorageReadEn <= '1';
						else
							digsto_stm <= IDLE;
							StorageReadEn <= '0';
						end if;
					when READING =>
						
						digsto_stm <= WRITING;
						StorageReadEn <= '0';

					when WRITING =>
						if DigStorageData(0) = '0' then
							RoundBuffer(to_integer(unsigned(DigStorageData(8 downto 1)))).wr1_en <= '1';
						else
							RoundBuffer(to_integer(unsigned(DigStorageData(8 downto 1)))).wr2_en <= '1';
						end if;
						digsto_stm <= IDLE;
					when others =>
						digsto_stm <= IDLE;
						StorageReadEn <= '0';
				end case;
				
				
				-- Algorithm for Selecting the correct Window to write enable
				if GrayCntWindow = to_integer(unsigned(StorageCntAddr(8 downto 1))) and storage_stm = STORAGE then
							
					if StorageCntAddr < StorageStopAddr then
						case StorageCntAddr(0) is
							when '0' =>	
								RoundBuffer(GrayCntWindow).wr1_en <= '0';
								RoundBuffer(GrayCntWindow).wr2_en <= '0';
							when '1' =>
								RoundBuffer(GrayCntWindow).wr1_en <= '1';
								RoundBuffer(GrayCntWindow).wr2_en <= '0';
							when others =>
						end case;
					elsif StorageCntAddr >= StorageStopAddr then
						case StorageCntAddr(0) is
							when '0' =>	
								RoundBuffer(GrayCntWindow).wr1_en <= '1';
								RoundBuffer(GrayCntWindow).wr2_en <= '1';
							when '1' =>
								RoundBuffer(GrayCntWindow).wr1_en <= '0';
								RoundBuffer(GrayCntWindow).wr2_en <= '1';
							when others =>
						end case;
					else --StorageCntAddr > StorageStopAddr
						RoundBuffer(GrayCntWindow).wr1_en <= '1';
						RoundBuffer(GrayCntWindow).wr2_en <= '1';
					end if;
				end if;
						
				-- Checking if Buffer Full
				if (full = '1') then	
					GCntW := GrayCntWindow;	
							
					while((RoundBuffer(GCntW).wr1_en = '0') or (RoundBuffer(GCntW).wr2_en = '0')) loop
						if GCntW = 255 then
							GCntW := 0;
							if RoundCnt = "111" then
								RoundCnt <= "000";
							else
								RoundCnt <= std_logic_vector(unsigned(RoundCnt) + 1);
							end if;
						else
							GCntW := GCntW + 1;
						end if;
					end loop;
					
				end if;
				
				-- The next Windwo Free of writting is found
				WR_ADDR_S <= std_logic_vector(to_unsigned(GCntW,WR_ADDR_S'length));
				
				RoundBuffer(GCntW).round <= RoundCnt;
				
				-- Increment GCntW for the next
				if GCntW = 255 then
					GCntW := 0;
					if RoundCnt = "111" then
						RoundCnt <= "000";
					else
						RoundCnt <= std_logic_vector(unsigned(RoundCnt) + 1);
					end if;
				else
					GCntW := GCntW + 1;
				end if;
				GrayCntWindow <= GCntW;
				
			end if;
		end if;
	end process;
	
	-- FIFO Filing In
	RdadStorageData <= RoundBuffer(to_integer(unsigned(WR_ADDR_S))).wr1_en & RoundBuffer(to_integer(unsigned(WR_ADDR_S))).wr2_en & WR_ADDR_S;
	
	StorageWriteEn <= '1' when RoundBuffer(to_integer(unsigned(WR_ADDR_S))).wr1_en = '0' or RoundBuffer(to_integer(unsigned(WR_ADDR_S))).wr2_en = '0' else '0';
	
	-- Address Write
	WR_RS_S <= WR_ADDR_S(1 downto 0);
	WR_CS_S <= WR_ADDR_S(7 downto 2);
	
	-- Check if Round Buffer is Full
	full_intl(0) <= ((RoundBuffer(0).wr1_en or RoundBuffer(0).wr2_en)); 
	GEN_FULL : for I in 1 to 255 generate
		full_intl(I) <= ((RoundBuffer(I).wr1_en or RoundBuffer(I).wr2_en) or full_intl(I-1));
	end generate;	
	full <= full_intl(255);
	
	-- Address Match
	Equal <= '1' when GrayCntWindow = to_integer(unsigned(StorageCntAddr(8 downto 1))) and storage_stm = STORAGE else '0';
	
	
end Behavioral;

