
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;
use work.Register_pkg.all;

entity WindowStoreV4 is
	Generic(
		NBRWINDOWS : integer := 16
	);
	Port (
	nrst : 			in	std_Logic;
	ClockBus:		in T_ClockBus;
	Timecounter:	in std_logic_vector(63 downto 0);

	ValidData:		in	std_logic;

	CPUBus:			in 	std_logic_vector(10 downto 0);
	CPUTime:		in	std_logic_vector(63 downto 0);
	TriggerInfo:	in 	std_logic_vector(11 downto 0);

	-- FIFO out for Reading RDAD
    RDAD_ReadEn  :in  std_logic;
    RDAD_DataOut : out std_logic_vector(9 downto 0);
    RDAD_Empty	: out std_logic;

	-- FIFO for FiFoManager
	AXI_ReadEn:	in	std_logic;
	AXI_Time_DataOut : out std_logic_vector(63 downto 0);
	AXI_WdoAddr_DataOut : out std_logic_vector(8 downto 0);
	AXI_TrigInfo_DataOut : out std_logic_vector(11 downto 0);
	AXI_Spare_DataOut :	out std_logic_vector(9 downto 0);
    AXI_Empty	: out std_logic
	);

end WindowStoreV4;

architecture Behavioral of WindowStoreV4 is
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

	type T_storestate is(
		IDLE,
		PREPARE,
		PULSE,
		PREPARE2,
		PULSE2
	);

	signal writeEn_stm : T_storestate := IDLE;

	signal Full_out_intl    : std_logic;
	signal RDAD_WriteEn_intl,AXI_WriteEn_intl  : std_logic;

	signal curr_Timecounter:	std_logic_vector(63 downto 0);
	signal prev_Timecounter:	std_logic_vector(63 downto 0);
	signal Counter:		std_logic_vector(63 downto 0);

	signal data_in_intl : std_logic_vector(9 downto 0);
	signal wr_addr : std_logic_vector(7 downto 0);

	signal wr_en, wr_en_dly, wr1_en_dly, wr2_en_dly : std_logic;
	signal wr1_en_clkd, wr2_en_clkd : std_logic;
	signal Wr_Addr_dly : std_logic_vector(7 downto 0);

	signal TrigInfoDly, TrigInfoBuf, TrigInfoBuf_dly : std_logic_vector(11 downto 0);

	signal Addr : std_logic_vector(7 downto 0);
	signal wr1_en_intl, wr2_en_intl : std_logic;
	signal Trig:	std_logic_vector(11 downto 0);

	signal Wdo1:	std_logic_vector(8 downto 0);
	signal CMD_s:	std_logic_vector(2 downto 0);
	signal axi_full_s:	std_logic_vector(3 downto 0);
	signal axi_empty_s:	std_logic_vector(3 downto 0);

	-- -------------------------------------------------------------
	-- Constraints on Signals
	-- -------------------------------------------------------------
	attribute DONT_TOUCH : string;
	--attribute DONT_TOUCH of RDAD_STO_AFIFO : label is "TRUE";
	attribute DONT_TOUCH of writeEn_stm : signal is "TRUE";
	attribute DONT_TOUCH of RDAD_WriteEn_intl : signal is "TRUE";

begin

	-- Data Record for RDAD
	Data_in_intl(7 downto 0)	<= addr;
	Data_in_intl(8)				<= wr1_en_intl;
	Data_in_intl(9)				<= wr2_en_intl;


	process(ClockBus.CLK250MHz)
	begin
		if rising_edge(ClockBus.Clk250Mhz) then

			if ValidData = '1' then
				case writeEn_stm is
					when IDLE =>
						case CPUBus(10 downto 8) is
							when CMD_NOP =>
								wr1_en_intl <= '1';
								wr2_en_intl <= '1';
								writeEn_stm <= IDLE;
							when CMD_WR1_EN_DIS =>
								wr1_en_intl <= '1';
								wr2_en_intl <= '1';
								writeEn_stm <= IDLE;
							when CMD_WR2_EN_DIS =>
								wr1_en_intl <= '1';
								wr2_en_intl <= '1';
								writeEn_stm <= IDLE;
							when CMD_WR1_MARKED =>
								wr1_en_intl <= '0';
								wr2_en_intl <= '1';
								counter <= CPUTime;
								--trig <= TrigInfoDly;
								trig <= TriggerInfo;
								addr <= CPUBus(7 downto 0);
								Wdo1 <= CPUBus(7 downto 0) & '0';
								writeEn_stm <= PREPARE;
							when CMD_WR2_MARKED =>
								wr1_en_intl <= '1';
								wr2_en_intl <= '0';
								counter <= CPUTime;
								--trig <= TrigInfoDly;
								trig <= TriggerInfo;
								addr <= CPUBus(7 downto 0);
								Wdo1 <= CPUBus(7 downto 0) & '1';
								writeEn_stm <= PREPARE;
							when CMD_BOTH_MARKED =>
								wr1_en_intl <= '0';
								wr2_en_intl <= '0';
								counter <= CPUTime;
								--trig <= TrigInfoDly;
								trig <= TriggerInfo;
								addr <= CPUBus(7 downto 0);
								Wdo1 <= CPUBus(7 downto 0) & '0';
								writeEn_stm <= PREPARE;
							when others =>
						end case;

						cmd_s <= CPUBus(10 downto 8);

					when PREPARE =>
						RDAD_WriteEn_intl <= '1';
						AXI_WriteEn_intl <= '1';
						writeEn_stm <= PULSE;
					when PULSE =>
						RDAD_WriteEn_intl <= '0';
						AXI_WriteEn_intl <= '0';
						if cmd_s = CMD_BOTH_MARKED then
							Wdo1 <= addr & '1';
							Counter <= std_logic_vector(unsigned(Counter)+8);
							writeEn_stm <= PREPARE2;
						else
							writeEn_stm <= IDLE;
						end if;
					when PREPARE2 =>
						RDAD_WriteEn_intl <= '0';
						AXI_WriteEn_intl <= '1';
						writeEn_stm <= PULSE2;
					when PULSE2 =>
						RDAD_WriteEn_intl <= '0';
						AXI_WriteEn_intl <= '0';
						writeEn_stm <= IDLE;

					when others =>
						RDAD_WriteEn_intl <= '0';
						AXI_WriteEn_intl <= '0';
						writeEn_stm <= IDLE;
				end case;
			end if;
		end if;
	end process;

	process(ClockBus.Clk250Mhz,nRST)
	begin
		if nrst = '0' then
			TrigInfoBuf <= (others => '0');
		else
			if rising_edge(ClockBus.Clk250Mhz) then

				TrigInfoDly <= TrigInfoBuf;

				if (TimeCounter(3 downto 0) = "0000") then
					TrigInfoBuf <= TriggerInfo;
				else
					TrigInfoBuf <= TrigInfoBuf or TriggerInfo;
				end if;
			end if;
		end if;
	end process;

	-- RDAD and Storage FIFO
	RDAD_STO_AFIFO :  aFifo
    generic map(
        DATA_WIDTH => 10,
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
        Data_in     => Data_in_intl,
        Full_out    => Full_out_intl,
        WriteEn_in  => RDAD_WriteEn_intl,
        WClk        => ClockBus.CLK250MHz
    );

	-- RDAD and Storage FIFO
	AXI_CMD_AFIFO :  aFifo
    generic map(
        DATA_WIDTH => 10,
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
        Data_in     => Data_in_intl,
        Full_out    => axi_full_s(0),
        WriteEn_in  => AXI_WriteEn_intl,
        WClk        => ClockBus.CLK250MHz
    );

	-- RDAD and Storage FIFO
	AXI_Time_AFIFO :  aFifo
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
        WriteEn_in  => AXI_WriteEn_intl,
        WClk        => ClockBus.CLK250MHz
    );

	-- RDAD and Storage FIFO
	AXI_WdoAddr_AFIFO :  aFifo
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
		WriteEn_in  => AXI_WriteEn_intl,
		WClk        => ClockBus.CLK250MHz
	);

	-- RDAD and Storage FIFO
	AXI_Trig_AFIFO :  aFifo
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
		WriteEn_in  => AXI_WriteEn_intl,
		WClk        => ClockBus.CLK250MHz
	);

	--AXI_Empty	<=
	AXI_empty <= '0' when axi_empty_s = "0000" else '1';

end Behavioral;
