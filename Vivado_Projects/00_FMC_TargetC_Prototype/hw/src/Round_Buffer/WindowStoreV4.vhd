
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity WindowStoreV4 is
	Generic(
		NBRWINDOWS : integer := 16
	);
	Port (
	nrst : 			in	std_Logic;
	ClockBus:		in T_ClockBus;

	ValidData:		in	std_logic;

	CPUBus:			in 	std_logic_vector(10 downto 0);
	CPUTime:		in	T_timestamp;
	TriggerInfo:	in 	std_logic_vector(11 downto 0);

	-- Overwatch of Transmission
	NbrOfPackets:	out	std_logic_vector(7 downto 0);
	Reg_Clr:		in	std_logic;

	-- FIFO out for Reading RDAD
    RDAD_ReadEn  :in  std_logic;
    RDAD_DataOut : out std_logic_vector(8 downto 0);
    RDAD_Empty	: out std_logic;

	-- FIFO for FiFoManager
	AXI_ReadEn:	in	std_logic;
	AXI_Time_DataOut : out std_logic_vector(63 downto 0);
	AXI_WdoAddr_DataOut : out std_logic_vector(8 downto 0);
	AXI_TrigInfo_DataOut : out std_logic_vector(11 downto 0);
	AXI_Spare_DataOut :	out std_logic_vector(10 downto 0);
    AXI_Empty	: out std_logic
	);

end WindowStoreV4;

architecture Behavioral of WindowStoreV4 is
	component aFifoV2 is
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
	end component aFifoV2;

	type T_storestate is(
		IDLE,
		STABILIZE,
		PREPARE,
		PULSE,
		STABILIZE2,
		PREPARE2,
		PULSE2
	);

	constant TRIG_LAST_MASK : std_logic_vector(11 downto 0) := "000000001111";

	signal writeEn_stm : T_storestate := IDLE;

	signal Full_out_intl    : std_logic;
	signal WriteEn_intl  : std_logic;

	signal Counter:		std_logic_vector(63 downto 0);

	--signal TrigInfoDly, TrigInfoBuf, TrigInfoBuf_dly : std_logic_vector(11 downto 0);

	signal Trig:	std_logic_vector(11 downto 0);

	signal Wdo1:	std_logic_vector(8 downto 0);
	signal CMD_s:	std_logic_vector(10 downto 0);
	signal axi_full_s:	std_logic_vector(3 downto 0);
	signal axi_empty_s:	std_logic_vector(3 downto 0);

	signal NbrOfPackets_intl : std_logic_vector(7 downto 0);
	-- -------------------------------------------------------------
	-- Constraints on Signals
	-- -------------------------------------------------------------
	--attribute DONT_TOUCH : string;
	--attribute DONT_TOUCH of RDAD_STO_AFIFO : label is "TRUE";
	--attribute DONT_TOUCH of writeEn_stm : signal is "TRUE";
	--attribute DONT_TOUCH of writeen_intl : signal is "TRUE";

begin

	NbrOfPackets <= NbrOfPackets_intl;

	process(ClockBus.CLK250MHz)
	begin
		if nrst = '0' then
			--RDAD_WriteEn_intl <= '0';
			--AXI_WriteEn_intl <= '0';
			NbrOfPackets_intl <= (others => '0');
			trig <= (others => '0');
			Wdo1 <= (others => '0');
			counter <= (others => '0');
			cmd_s <= (others => '0');
		else
			if rising_edge(ClockBus.Clk250Mhz) then

				if Reg_CLR = '1' then
					NbrOfPackets_intl <= (others => '0');
				end if;

				if ValidData = '1' then
					case writeEn_stm is
						when IDLE =>
							case CPUBus(10 downto 8) is
								when CMD_WR1_MARKED =>
									NbrOfPackets_intl <= std_logic_vector(unsigned(NbrOfPackets_intl)+1);
									counter <= CPUTime.graycnt & "0000";
									--trig <= TrigInfoDly;
									trig <= TriggerInfo;
									Wdo1 <= CPUBus(7 downto 0) & '0';
									cmd_s <= CPUBus;
									writeEn_stm <= STABILIZE;
								when CMD_WR2_MARKED =>
									NbrOfPackets_intl <= std_logic_vector(unsigned(NbrOfPackets_intl)+1);
									--counter <= CPUTime;
									counter <= CPUTime.graycnt & "1000";
									--trig <= TrigInfoDly;
									trig <= TriggerInfo;
									Wdo1 <= CPUBus(7 downto 0) & '1';
									cmd_s <= CPUBus;
									writeEn_stm <= STABILIZE;
								when CMD_BOTH_MARKED =>
									NbrOfPackets_intl <= std_logic_vector(unsigned(NbrOfPackets_intl)+2);
									counter <= CPUTime.graycnt & "0000";
									--trig <= TrigInfoDly;
									trig <= TriggerInfo and TRIG_LAST_MASK;
									Wdo1 <= CPUBus(7 downto 0) & '0';
									cmd_s <= CPUBus;
									writeEn_stm <= STABILIZE;
								when others =>
								writeEn_stm <= IDLE;
							end case;



						when STABILIZE =>
							writeEn_stm <= PREPARE;
						when PREPARE =>
							writeEn_stm <= PULSE;

						when PULSE =>
							if cmd_s(10 downto 8) = CMD_BOTH_MARKED then
								Wdo1 <= Wdo1(8 downto 1) & '1';
								--trig <= TriggerInfo;
								Counter <= Counter(63 downto 4) & "1000";
								writeEn_stm <= STABILIZE2;
							else
								writeEn_stm <= IDLE;
							end if;
						when STABILIZE2 =>

							writeEn_stm <= PREPARE2;
						when PREPARE2 =>
							--RDAD_WriteEn_intl <= '0';
							--AXI_WriteEn_intl <= '1';
							writeEn_stm <= PULSE2;
						when PULSE2 =>
							--RDAD_WriteEn_intl <= '0';
							--AXI_WriteEn_intl <= '0';
							writeEn_stm <= IDLE;

						when others =>
							--RDAD_WriteEn_intl <= '0';
							--AXI_WriteEn_intl <= '0';
							writeEn_stm <= IDLE;
					end case;
				end if;
			end if;
		end if;
	end process;

	process(ClockBus.CLK250MHz)
	begin
		if nrst = '0' then
			WriteEn_intl <= '0';
		else
			if rising_edge(ClockBus.Clk250Mhz) then

				if ValidData = '1' then
					case writeEn_stm is
						when STABILIZE =>
							WriteEn_intl <= '1';
						when STABILIZE2 =>
							WriteEn_intl <= '1';
						-- when PREPARE =>
						-- 	WriteEn_intl <= '1';
						-- when PREPARE2 =>
						-- 	WriteEn_intl <= '1';
						when others =>
							WriteEn_intl <= '0';
					end case;
				else
					WriteEn_intl <= '0';
				end if;
			end if;
		end if;
	end process;
	-- process(ClockBus.Clk250Mhz,nRST)
	-- begin
	-- 	if nrst = '0' then
	-- 		TrigInfoBuf <= (others => '0');
	-- 	else
	-- 		if rising_edge(ClockBus.Clk250Mhz) then
	--
	-- 			TrigInfoDly <= TrigInfoBuf;
	--
	-- 			if (TimeCounter(3 downto 0) = "0000") then
	-- 				TrigInfoBuf <= TriggerInfo;
	-- 			else
	-- 				TrigInfoBuf <= TrigInfoBuf or TriggerInfo;
	-- 			end if;
	-- 		end if;
	-- 	end if;
	-- end process;

	-- RDAD and Storage FIFO
	RDAD_STO_AFIFO :  aFifoV2
    generic map(
        DATA_WIDTH => 9,
        ADDR_WIDTH => 4	--Maybe more ?
    )
    port map (
    	rst 	=> nrst,
        -- Reading port.
        Data_out    => RDAD_DataOut,
        Empty_out   => RDAD_Empty,
        ReadEn_in   => RDAD_ReadEn,
        RClk        => ClockBus.RDAD_CLK,
        -- Writing port.
        Data_in     => Wdo1,
        Full_out    => Full_out_intl,
        WriteEn_in  => WriteEn_intl,
        WClk        => ClockBus.CLK250MHz
    );

	-- RDAD and Storage FIFO
	AXI_CMD_AFIFO :  aFifoV2
    generic map(
        DATA_WIDTH => 11,
        ADDR_WIDTH => 5	--Maybe more ?
    )
    port map (
    	rst 	=> nrst,
        -- Reading port.
        Data_out    => AXI_Spare_DataOut,
        Empty_out   => axi_empty_s(0),
        ReadEn_in   => AXI_ReadEn,
        RClk        => ClockBus.AXI_CLK,
        -- Writing port.
        Data_in     => Cmd_s,
        Full_out    => axi_full_s(0),
        WriteEn_in  => WriteEn_intl,
        WClk        => ClockBus.CLK250MHz
    );

	-- RDAD and Storage FIFO
	AXI_Time_AFIFO :  aFifoV2
    generic map(
        DATA_WIDTH => 64,
        ADDR_WIDTH => 5	--Maybe more ?
    )
    port map (
    	rst 	=> nrst,
        -- Reading port.
        Data_out    => AXI_Time_DataOut,
        Empty_out   => axi_empty_s(1),
        ReadEn_in   => AXI_ReadEn,
        RClk        => ClockBus.AXI_CLK,
        -- Writing port.
        Data_in     => Counter,
        Full_out    => axi_full_s(1),
        WriteEn_in  => WriteEn_intl,
        WClk        => ClockBus.CLK250MHz
    );

	-- RDAD and Storage FIFO
	AXI_WdoAddr_AFIFO :  aFifoV2
	generic map(
		DATA_WIDTH => 9,
		ADDR_WIDTH => 5	--Maybe more ?
	)
	port map (
		rst 	=> nrst,
		-- Reading port.
		Data_out    => AXI_WdoAddr_DataOut,
		Empty_out   => axi_empty_s(2),
		ReadEn_in   => AXI_ReadEn,
		RClk        => ClockBus.AXI_CLK,
		-- Writing port.
		Data_in     => Wdo1,
		Full_out    => axi_full_s(2),
		WriteEn_in  => WriteEn_intl,
		WClk        => ClockBus.CLK250MHz
	);

	-- RDAD and Storage FIFO
	AXI_Trig_AFIFO :  aFifoV2
	generic map(
		DATA_WIDTH => 12,
		ADDR_WIDTH => 5	--Maybe more ?
	)
	port map (
		rst 	=> nrst,
		-- Reading port.
		Data_out    => AXI_TrigInfo_DataOut,
		Empty_out   => axi_empty_s(3),
		ReadEn_in   => AXI_ReadEn,
		RClk        => ClockBus.AXI_CLK,
		-- Writing port.
		Data_in     => Trig,
		Full_out    => axi_full_s(3),
		WriteEn_in  => WriteEn_intl,
		WClk        => ClockBus.CLK250MHz
	);

	--AXI_Empty	<=
	AXI_empty <= '0' when axi_empty_s = "0000" else '1';

end Behavioral;
