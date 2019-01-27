library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.WindowCPU_PKG.all;
use work.TARGETC_pkg.all;

entity WindowBrainControl is
	Generic(
		NBRWINDOWS : integer := 16
	);
	Port (
	nrst : 			in	STD_Logic;

	ClockBus:		in T_ClockBus;
	Timecounter:	in std_logic_vector(63 downto 0);

	-- Interface to WindowCPU
	CPUBus :		out std_logic_vector(10 downto 0);

	WR_RS_S:		out std_logic_vector(1 downto 0);
	WR_CS_S:		out std_logic_vector(5 downto 0);

	CtrlBus_IxSL:		in 	T_CtrlBus_IxSL;

	CurAddr:		out	std_logic_vector(7 downto 0);
	CurAddrBit:		out std_logic_vector(NBRWINDOWS-1 downto 0);
	OldAddr:		out	std_logic_vector(7 downto 0);
	OldAddrBit:		out std_logic_vector(NBRWINDOWS-1 downto 0);

	NextAddr_in : 	in std_logic_vector(7 downto 0);
	PrevAddr_in :	in std_logic_vector(7 downto 0);

    -- FIFO IN for Digiting
    DIG_Full	: out	std_logic;
    DIG_DataIn	: in	std_logic_vector(8 downto 0);
    DIG_WriteEn	: in	std_logic
	);

end WindowBrainControl;

architecture Behavioral of WindowBrainControl is

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

	signal WR_ADDR_s : std_logic_vector(7 downto 0);
	signal busy_intl : std_logic;

	signal NextAddr_intl : std_logic_vector(7 downto 0);
	signal PrevAddr_intl : std_logic_vector(7 downto 0);
	signal OldAddr_intl : std_logic_vector(7 downto 0);
	signal prev_OldAddr_intl : std_logic_vector(7 downto 0);

--	signal cmdbus_intl : std_logic_vector(2 downto 0);
--	signal cmdwdo_en_intl: std_logic_vector(NBRWINDOWS-1 downto 0);

	signal FstWindow512 : std_logic_vector(8 downto 0);
	signal CntWindow512 : std_logic_vector(8 downto 0);

	signal DIG_Empty_intl, STO_ReadEn : std_logic;
	signal DIG_DataOut_intl : std_logic_vector(8 downto 0);

	-- Optimization for LUT reduction
	signal Cmp_s : std_logic := '0';

	signal Bus_intl : t_CommandBus;

	-- -------------------------------------------------------------
	-- Constraints on Signals
	-- -------------------------------------------------------------
	attribute DONT_TOUCH : string;
	attribute DONT_TOUCH of DIG_STO_AFIFO : label is "TRUE";
	
begin

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

	process(ClockBus.CLK250MHz,nrst)
	begin
		if nrst = '0' then
			NextAddr_intl	<= x"01";
			PrevAddr_intl	<= x"FF";
		else
			if rising_edge(ClockBus.CLK250MHz) then
				NextAddr_intl <=	NextAddr_in;
				PrevAddr_intl <=	PrevAddr_in;
			end if;
		end if;
	end process;

	-- Address Change Write Storage Area
	process(ClockBus.SSTIN,nRST)
		-- variable curidx : integer := to_integer(unsigned(NextAddr_intl));
		-- variable oldidx : integer := to_integer(unsigned(WR_ADDR_S));
	begin
		if nrst = '0' then
			WR_ADDR_S <= (others => '0');

			-- Init the CPUs
			CurAddrBit <= (0 => '1', others => '0');

			OldAddr_intl <= x"FF";
			OldAddrBit <= (255 => '1', others => '0');
		else
			if rising_edge(ClockBus.SSTIN) then
				WR_ADDR_S 		<= NextAddr_intl;
				OldAddr_intl 	<= WR_ADDR_S;

				OldAddrBit <= (others => '0');
				OldAddrBit(to_integer(unsigned(WR_ADDR_S))) <= '1';
				--OldAddrBit <= (oldidx => '1', others => '0');

				CurAddrBit <= (others => '0');
				CurAddrBit(to_integer(unsigned(NextAddr_intl))) <= '1';
				--CurAddrBit <= (curidx => '1', others => '0');


			end if;
		end if;
	end process;

	CurAddr	<= WR_ADDR_S;
	OldAddr <= OldAddr_intl;

	WR_RS_S <= WR_ADDR_S(1 downto 0);	-- TARGET C : Write Row Select
	WR_CS_S <= WR_ADDR_S(7 downto 2);

	-- Minimal State Machine For Windows select
	process(ClockBus.CLK250MHz, nRST, CtrlBus_IxSL.SWRESET)	-- Every 64 ns
	begin
	if nRST = '0' or CtrlBus_IxSL.SWRESET = '0' then
			storage_stm <= IDLE;
			FstWindow512 <= (others => '0');
			CntWindow512 <= (others => '0');

			busy_intl <= '0';

			Bus_intl.cmd <= CMD_NOP;
			Bus_intl.addr <= (others => '0');

		else
			if rising_edge(ClockBus.CLK250MHz) then

				-- Normal Storage Case from PS
				case storage_stm is
					when IDLE =>
						Bus_intl.cmd <= CMD_NOP;

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

						-- Waiting to have the next window
						--if NextAddr_intl = FstWindow512(8 downto 1) then
						if OldAddr_intl = FstWindow512(8 downto 1) then
							storage_stm <= MARK_WINDOW;

							prev_OldAddr_intl <= OldAddr_intl;

							if FstWindow512(0) = '0' then

								--Optimization for LUT reduction
								--if CntWindow512 = "000000001" then
								if Cmp_s = '1' then
									Bus_intl.cmd <= CMD_WR1_MARKED;
									Bus_intl.addr <= OldAddr_intl;
									CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);
								else
									Bus_intl.cmd <= CMD_BOTH_MARKED;
									Bus_intl.addr <= OldAddr_intl;
									CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 2);
								end if;
							else

								--Optimization for LUT reduction
								Bus_intl.cmd <= CMD_WR2_MARKED;
								Bus_intl.addr <= OldAddr_intl;
								CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);

							end if;
							storage_stm <= MARK_WINDOW;
						else
							storage_stm <= EVALUATE;
						end if;

					when MARK_WINDOW =>
						--cmdwdo_en_intl <= (others => '0');

						if (to_integer(unsigned(CntWindow512)) /= 0) then

							if OldAddr_intl /= prev_OldAddr_intl then
								prev_OldAddr_intl <= OldAddr_intl;

								if Cmp_s = '1' then
									Bus_intl.cmd <= CMD_WR1_MARKED;
									Bus_intl.addr <= OldAddr_intl;
									CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 1);
								else
									Bus_intl.cmd <= CMD_BOTH_MARKED;
									Bus_intl.addr <= OldAddr_intl;
									CntWindow512 <= std_logic_vector(unsigned(CntWindow512) - 2);
								end if;
							else
								Bus_intl.cmd <= CMD_NOP;
							end if;
						else
							Bus_intl.cmd <= CMD_NOP;
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

							if DIG_DataOut_intl(0) = '0' then
								Bus_intl.cmd <= CMD_WR1_EN_DIS;
							else
								Bus_intl.cmd <= CMD_WR2_EN_DIS;
							end if;

							Bus_intl.addr <= DIG_DataOut_intl(8 downto 1);
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

--CPUMode
	CPUBus <=	(others => 'Z')	when CtrlBus_IxSL.CPUMode = '1' else
				Bus_intl.cmd & Bus_intl.addr;

	Cmp_s <= '1' when CntWindow512 = "000000001" else '0';

end Behavioral;
