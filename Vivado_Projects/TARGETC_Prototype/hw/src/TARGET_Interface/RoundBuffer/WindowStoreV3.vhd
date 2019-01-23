
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;
use work.Register_pkg.all;

entity WindowStoreV3 is
	Generic(
		NBRWINDOWS : integer := 16
	);
	Port (
	nrst : 			in	std_Logic;

	ClockBus:		in T_ClockBus;
	Timecounter:	in std_logic_vector(63 downto 0);

	CPUMode:	in	std_logic;
	TriggerInfo:	in 	std_logic_vector(11 downto 0);

	wr1_en:		in	std_logic;
	wr2_en:		in	std_logic;

	ValidAddr:	in	std_logic;
	CurAddr:	in std_logic_vector(7 downto 0);
	OldAddr:	in std_logic_vector(7 downto 0);

	-- FIFO out for Reading RDAD
    RDAD_ReadEn  :in  std_logic;
    RDAD_DataOut : out std_logic_vector(85 downto 0);
    RDAD_Empty	: out std_logic
	);

end WindowStoreV3;

architecture Behavioral of WindowStoreV3 is
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
		PULSE
	);

	signal writeEn_stm : T_storestate := IDLE;

	signal Full_out_intl    : std_logic;
	signal WriteEn_intl  : std_logic;

	signal curr_Timecounter:	std_logic_vector(63 downto 0);
	signal prev_Timecounter:	std_logic_vector(63 downto 0);
	signal TimeCounter_dly:		std_logic_vector(63 downto 0);

	signal data_in_intl : std_logic_vector(85 downto 0);
	signal wr_addr : std_logic_vector(7 downto 0);

	signal wr_en, wr_en_dly, wr1_en_dly, wr2_en_dly : std_logic;
	signal wr1_en_clkd, wr2_en_clkd : std_logic;
	signal Wr_Addr_dly : std_logic_vector(7 downto 0);

	signal	TrigInfoDly, TrigInfoBuf, TrigInfoBuf_dly : std_logic_vector(11 downto 0);

	-- -------------------------------------------------------------
	-- Constraints on Signals
	-- -------------------------------------------------------------
	attribute DONT_TOUCH : string;
	--attribute DONT_TOUCH of RDAD_STO_AFIFO : label is "TRUE";
	attribute DONT_TOUCH of writeEn_stm : signal is "TRUE";
	attribute DONT_TOUCH of WriteEn_intl : signal is "TRUE";

begin

	-- Old Style Data Record Now
	-- Data_in_intl(63 downto 0)		<= prev_TimeCounter;
	-- Data_in_intl(71 downto 64)	<= OldAddr;
	-- Data_in_intl(72)				<= wr1_en;
	-- Data_in_intl(73)				<= wr2_en;
	-- Data_in_intl(85 downto 74)	<= (others => '0') when CPUMode = '0' else
	-- 								TrigInfoDly;

	process(ClockBus.CLK250MHz)
	begin
		if rising_edge(ClockBus.Clk250Mhz) then

			if ValidAddr = '1' then
				wr1_en_dly <= wr1_en;
				wr2_en_dly <= wr2_en;
			else
				wr1_en_dly <= '0';
				wr2_en_dly <= '0';
			end if;

			case writeEn_stm is
				when IDLE =>
					if ValidAddr = '1' then
						Data_in_intl(63 downto 0)		<= prev_TimeCounter;
						Data_in_intl(71 downto 64)	<= OldAddr;
						Data_in_intl(72)				<= wr1_en;
						Data_in_intl(73)				<= wr2_en;
						if CPUMode = '0' then
							Data_in_intl(85 downto 74)	<= (others => '0');
						else
							Data_in_intl(85 downto 74) <= TrigInfoDly;
						end if;
					end if;

					if (((wr1_en = '0') and (wr1_en_dly='1')) or ((wr2_en = '0') and (wr2_en_dly = '1')) ) then
					-- if ((wr1_en = '0') or (wr2_en = '0')) then
					-- 	if ((Wr_Addr_dly /= wr_addr) or (wr1_en_clkd /= wr1_en_dly) or (wr2_en_clkd /= wr2_en_dly)) then
							--writeEn_stm <= PULSE;
							writeEn_stm <= PREPARE;
							--WriteEn_intl <= '1';
						else
							WriteEn_intl <= '0';
							--writeEn_stm <= IDLE;
						end if;
						WriteEn_intl <= '0';
					-- else
					-- 	WriteEn_intl <= '0';
					-- 	writeEn_stm <= IDLE;
					-- end if;
				when PREPARE =>
					WriteEn_intl <= '1';
					writeEn_stm <= PULSE;
				when PULSE =>
					WriteEn_intl <= '0';
					writeEn_stm <= IDLE;
				when others =>
					WriteEn_intl <= '0';
					writeEn_stm <= IDLE;
			end case;
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

	process(ClockBus.CLK250MHz, nRST)
 begin
	 if nrst = '0' then
		 curr_TimeCounter <= (others => '0');
		 prev_TimeCounter <= (others => '0');
	 else
		if rising_edge(ClockBus.CLK250MHz) then
			 if ValidAddr = '0' then
			 --TrigInfoDly <= TrigInfoBuf_dly;
				curr_TimeCounter <= Timecounter;
				prev_TimeCounter <= curr_Timecounter;
		 	end if;
		end if;
	 end if;
 end process;

	-- RDAD and Storage FIFO
	RDAD_STO_AFIFO :  aFifo
    generic map(
        DATA_WIDTH => 86,
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
        WriteEn_in  => WriteEn_intl,
        WClk        => ClockBus.CLK250MHz
    );




end Behavioral;
