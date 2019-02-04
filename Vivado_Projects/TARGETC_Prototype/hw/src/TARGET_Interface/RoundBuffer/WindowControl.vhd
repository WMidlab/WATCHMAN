library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.WindowCPU_PKG_old.all;
use work.TARGETC_pkg.all;

entity WindowControl is
	Generic(
		NBRWINDOWS : integer := 16
	);
	Port (
	nrst : 			in	STD_Logic;

	ClockBus:		in T_ClockBus;
	Timecounter:	in std_logic_vector(63 downto 0);

	-- Interface to WindowCPU
	cmdbus	:		out std_logic_vector(2 downto 0);
	cmdwdo_en :		out std_logic_vector(NBRWINDOWS-1 downto 0);

	WR_RS_S:		out std_logic_vector(1 downto 0);
	WR_CS_S:		out std_logic_vector(5 downto 0);

	CtrlBus_IxSL:		in 	T_CtrlBus_IxSL; --Outputs from Control Master
--	CtrlBus_OxSL:		out T_CtrlBus_OxSL;
	SampleCnt:		out std_logic_vector(3 downto 0);
	CurAddr:		out	std_logic_vector(7 downto 0);
	NextBus_In:		in Bus_t;
	PrevBus_In:		in Bus_t;

    -- FIFO IN for Digiting
    DIG_Full	: out	std_logic;
    DIG_DataIn	: in	std_logic_vector(8 downto 0);
    DIG_WriteEn	: in	std_logic
	);

end WindowControl;

architecture Behavioral of WindowControl is

	component WindowSelect is

		Port (
		CurAddr :		in std_logic_vector(7 downto 0);

		NextBus_In:		in Bus_t;
		PrevBus_In:		in Bus_t;

		NextAddr:		out std_logic_vector(7 downto 0);
		PrevAddr:		out std_logic_vector(7 downto 0)
		);
	end component WindowSelect;

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

	type storagestate is (
		IDLE,
		READY,
		RESPREADY,

		EVALUATE,
		MARK_WINDOW
	);
	signal storage_stm : storagestate := IDLE;

	type digstoragestate is (
		IDLE,
		READING,
		WRITING
	);
	signal digsto_stm : digstoragestate;


	signal PREVBus_intl :		Bus_t;
	signal NEXTBus_intl :		Bus_t;

	signal MarkWindow : std_logic_vector(7 downto 0);
	signal NextMarkWindow : std_logic_vector(7 downto 0);

	signal WR_ADDR_s : std_logic_vector(7 downto 0);
	signal busy_intl : std_logic;
	signal NextAddr_intl : std_logic_vector(7 downto 0);
	signal PrevAddr_intl : std_logic_vector(7 downto 0);

	signal cmdbus_intl : std_logic_vector(2 downto 0);
	signal cmdwdo_en_intl: std_logic_vector(NBRWINDOWS-1 downto 0);

	signal FstWindow512 : std_logic_vector(8 downto 0);
	signal CntWindow512 : std_logic_vector(8 downto 0);

	signal DIG_Empty_intl, STO_ReadEn : std_logic;
	signal DIG_DataOut_intl : std_logic_vector(8 downto 0);

begin

	SampleCnt <= Timecounter(3 downto 0);

    -- Digitizing and Storage FIFO
	DIG_STO_AFIFO :  aFifo
    generic map(
        DATA_WIDTH => 9,
        ADDR_WIDTH => 4	--Maybe more ?
    )
    port map (
    	rst 	=> nrst,
        -- Reading port.
        Data_out    => DIG_DataOut_intl,
        Empty_out   => DIG_Empty_intl,
        ReadEn_in   => STO_ReadEn,
        RClk        => ClockBus.CLK250MHz,
        -- Writing port.
        Data_in     => DIG_DataIn,
        Full_out    => DIG_Full,
        WriteEn_in  => DIG_WriteEn,
        WClk        => ClockBus.WL_CLK
    );

	WDOSS_Normal : WindowSelect
		Port map (
		CurAddr 	=> WR_ADDR_S,

		NextBus_In	=> NextBus_In,
		PrevBus_In	=> PrevBus_In,

		NextAddr	=> NextAddr_intl,
		PrevAddr	=> PrevAddr_intl
		);

	WDOSS_Search : WindowSelect
		Port map (
		CurAddr 	=> MarkWindow,

		NextBus_In	=> NextBus_In,
		PrevBus_In	=> PrevBus_In,

		NextAddr	=> NextMarkWindow,
		PrevAddr	=> open
		);

	-- Address Change Write Storage Area
	process(ClockBus.SSTIN,nRST)
	begin
		if nrst = '0' then
			WR_ADDR_S <= (others => '0');
		else
			if rising_edge(ClockBus.SSTIN) then
				WR_ADDR_S <= NextAddr_intl;
			end if;
		end if;
	end process;

	CurAddr	<= WR_ADDR_S;
	WR_RS_S <= WR_ADDR_S(1 downto 0);	-- TARGET C : Write Row Select
	WR_CS_S <= WR_ADDR_S(7 downto 2);

	-- Minimal State Machine For Windows select
	--process(ClockBus.CLK250MHz, nRST, CtrlBus_IxSL.SWRESET)	-- Every 64 ns
	process(ClockBus.CLK250MHz, nRST)	-- Every 64 ns
			begin
	--if nRST = '0' or CtrlBus_IxSL.SWRESET = '0' then
	if nRST = '0' then
					storage_stm <= IDLE;
			FstWindow512 <= (others => '0');
			CntWindow512 <= (others => '0');

			cmdbus_intl <= (others => '0');
			cmdwdo_en_intl <= (others => '0');
			busy_intl <= '0';
		else
			if rising_edge(ClockBus.CLK250MHz) then
				-- State Machine for Storing
				cmdwdo_en_intl <= (others => '0');

				case storage_stm is
					when IDLE =>
						cmdwdo_en_intl <= (others => '0');
						storage_stm <= READY;
						busy_intl <= '0';
					when READY =>
						busy_intl <= '0';
						if(CtrlBus_IxSL.WindowStorage = '1') then
							-- First Window && Counter is on 512 windows (9bits)
							FstWindow512 	<= CtrlBus_IxSL.FSTWINDOW(8 downto 0);
							CntWindow512	<= CtrlBus_IxSL.NBRWINDOW(8 downto 0);
							storage_stm <= RESPREADY;
						else
							storage_stm <= READY;
						end if;

					when RESPREADY =>
						if(CtrlBus_IxSL.WindowStorage = '0') then
							--storage_stm <= STORAGE;
							busy_intl <= '1';
							storage_stm <= EVALUATE;

						else
							busy_intl <= '0';
							storage_stm <= RESPREADY;
						end if;

					when EVALUATE =>
						cmdwdo_en_intl <= (others => '0');
						-- Waiting to have the next window
						if NextAddr_intl = FstWindow512(8 downto 1) then
							storage_stm <= MARK_WINDOW;
							MarkWindow <= NextAddr_intl;

							if FstWindow512(0) = '0' then
								case CntWindow512 is
									when "000000000" =>
									when "000000001" =>
										cmdbus_intl <= CMD_WR1_MARKED;
										cmdwdo_en_intl(to_integer(unsigned(NextAddr_intl))) <= '1';
										CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);
									when others =>
										cmdbus_intl <= CMD_BOTH_MARKED;
										cmdwdo_en_intl(to_integer(unsigned(NextAddr_intl))) <= '1';
										CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 2);
								end case;
							else
								case CntWindow512 is
									when "000000000" =>
									when others =>
										cmdbus_intl <= CMD_WR2_MARKED;
										cmdwdo_en_intl(to_integer(unsigned(NextAddr_intl))) <= '1';
										CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);
								end case;
							end if;
							storage_stm <= MARK_WINDOW;
						else
							storage_stm <= EVALUATE;
						end if;

					when MARK_WINDOW =>
						cmdwdo_en_intl <= (others => '0');
						MarkWindow <= NextMarkWindow;

						if to_integer(unsigned(CntWindow512)) /= 0 then
							-- Check if FSTWINDOW is ODD or EVEN
							if FstWindow512(0) = '0' then
								case CntWindow512 is
									when "000000000" =>
									when "000000001" =>
										cmdbus_intl <= CMD_WR1_MARKED;
										cmdwdo_en_intl(to_integer(unsigned(NextMarkWindow))) <= '1';
										CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);
									when others =>
										cmdbus_intl <= CMD_BOTH_MARKED;
										cmdwdo_en_intl(to_integer(unsigned(NextMarkWindow))) <= '1';
										CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 2);
								end case;
							else
								case CntWindow512 is
									when "000000000" =>
									when "000000001" =>
										cmdbus_intl <= CMD_WR1_MARKED;
										cmdwdo_en_intl(to_integer(unsigned(NextMarkWindow))) <= '1';
										CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);
									when others =>
										cmdbus_intl <= CMD_BOTH_MARKED;
										cmdwdo_en_intl(to_integer(unsigned(NextMarkWindow))) <= '1';
										CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 2);
								end case;
							end if;
						else
							busy_intl <= '0';
							storage_stm <= IDLE;
						end if;
					when others =>
				end case;


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
						if Busy_intl = '0' then

							cmdwdo_en_intl(to_integer(unsigned(DIG_DataOut_intl(8 downto 1)))) <= '1';
							if DIG_DataOut_intl(0) = '0' then
								cmdbus_intl <= CMD_WR1_EN_DIS;
							else
								cmdbus_intl <= CMD_WR2_EN_DIS;
							end if;

							digsto_stm <= IDLE;
						else
							digsto_stm <= WRITING;
						end if;
					when others =>
						digsto_stm <= IDLE;
						STO_ReadEn <= '0';
				end case;
			end if;
		end if;
	end process;


	-- OUTPUT
	cmdbus <= cmdbus_intl;
	cmdwdo_en <= cmdwdo_en_intl;

end Behavioral;
