library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.TARGETC_pkg.all;

entity FifoManagerV4 is
	generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32
	);
	port (
		CtrlBus_IxSL:		in 	T_CtrlBus_IxSL; --Outputs from Control Master
		--CtrlBus_OxSL:		out	T_CtrlBus_OxSL; --Outputs from Control Master
		FIFOBusy:		out std_logic;

		ClockBus:		in T_ClockBus;

		--Request and Acknowledge - READOUT
		Handshake_IxRECV:	in 	T_Handshake_IxRECV;
		Handshake_Data:		in	T_Handshake_SS_FIFO;
		Handshake_OxRECV:	out T_Handshake_OxRECV;

		--Header Information from FIFO
		FIFO_ReadEn:	out	std_logic;
		FIFO_Time : 	in 	std_logic_vector(63 downto 0);
		FIFO_WdoAddr : 	in 	std_logic_vector(8 downto 0);
		FIFO_TrigInfo : in 	std_logic_vector(11 downto 0);
		FIFO_Spare :	in 	std_logic_vector(10 downto 0);
		FIFO_Empty	: 	in 	std_logic;

		--Channels
		CH0 :			in	std_logic_vector(11 downto 0);
		CH1 :			in	std_logic_vector(11 downto 0);
		CH2 :			in	std_logic_vector(11 downto 0);
		CH3 :			in	std_logic_vector(11 downto 0);

		CH4 :			in	std_logic_vector(11 downto 0);
		CH5 :			in	std_logic_vector(11 downto 0);
		CH6 :			in	std_logic_vector(11 downto 0);
		CH7 :			in	std_logic_vector(11 downto 0);

		CH8 :			in	std_logic_vector(11 downto 0);
		CH9 :			in	std_logic_vector(11 downto 0);
		CH10 :			in	std_logic_vector(11 downto 0);
		CH11 :			in	std_logic_vector(11 downto 0);

		CH12 :			in	std_logic_vector(11 downto 0);
		CH13 :			in	std_logic_vector(11 downto 0);
		CH14 :			in	std_logic_vector(11 downto 0);
		CH15 :			in	std_logic_vector(11 downto 0);

		-- DATA TO STREAM
		FIFOvalid:			out std_logic;
		FIFOdata:			out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		StreamReady:		in	std_logic
	);
end FifoManagerV4;

architecture rtl of FifoManagerV4 is

	component GRAY_DECODER is
		generic(
			NBITS : integer := 8
		);
		Port (
		GRAY_IN :		in 	std_logic_vector(NBITS-1 downto 0);
		BIN_OUT:		out	std_logic_vector(NBITS-1 downto 0)
		);
	end component GRAY_DECODER;

	component clkcrossing_buf is
		generic(
			NBITS : integer := 32
		);
		port (
			nrst:	in	std_logic;
			DA: 	in	std_logic_vector(NBITS-1 downto 0);
			QB:		out	std_logic_vector(NBITS-1 downto 0);
			ClkA:	in	std_logic;
			ClkB:	in	std_logic
		);
	end component clkcrossing_buf;

	type fifostate is (
		IDLE,
		READY,
		ACKNOWLEDGE,
		PROC_REQ,

		WRFULL,
		WRxRD,
		WRxRD_INIT,
		WRxRD_HEADER,
		WRxRD_DATA,
		WR_TEMPO,
		STALL,

		REQUEST,
		RESP_ACK,
		REQ_GRANT,

		VALID,
		READ_FIFO_INFO,
		WAIT_FIFO_INFO,
		HEADER_FIFO_PREPARE,
		RESPVALID
	);
	signal fifo_wr_stm : 	 fifostate := IDLE;
	signal fifo_rd_stm : 	 fifostate := IDLE;
	signal last_fifo_rd_stm : fifostate := IDLE;

	component module_fifo_regs_no_flags is
		generic (
			g_WIDTH : natural := 32;
			g_DEPTH : integer := 32
		);
		port (
			i_rst_sync : in std_logic;
			i_clk      : in std_logic;

			-- FIFO Write Interface
			i_wr_en   : in  std_logic;
			i_wr_data : in  std_logic_vector(g_WIDTH-1 downto 0);
			o_full    : out std_logic;

			-- FIFO Read Interface
			i_rd_en   : in  std_logic;
			o_rd_data : out std_logic_vector(g_WIDTH-1 downto 0);
			o_empty   : out std_logic
		);
	end component module_fifo_regs_no_flags;

	component AddressDecoder is
	port(
		 address: 	in	std_logic_vector(3 downto 0);
		 rd_en:		in std_logic;
		 decode:	out std_logic_vector(15 downto 0)
	  );
	end component AddressDecoder;

	component DataDecoder is
 	port(
		address: 	in	std_logic_vector(3 downto 0);
		dataOut :	out std_logic_vector(31 downto 0);

		dataIN_0 :	in std_logic_vector(31 downto 0);
		dataIN_1 :	in std_logic_vector(31 downto 0);
		dataIN_2 :	in std_logic_vector(31 downto 0);
		dataIN_3 :	in std_logic_vector(31 downto 0);

		dataIN_4 :	in std_logic_vector(31 downto 0);
		dataIN_5 :	in std_logic_vector(31 downto 0);
		dataIN_6 :	in std_logic_vector(31 downto 0);
		dataIN_7 :	in std_logic_vector(31 downto 0);

		dataIN_8 :	in std_logic_vector(31 downto 0);
		dataIN_9 :	in std_logic_vector(31 downto 0);
		dataIN_10 :	in std_logic_vector(31 downto 0);
		dataIN_11 :	in std_logic_vector(31 downto 0);

		dataIN_12 :	in std_logic_vector(31 downto 0);
		dataIN_13 :	in std_logic_vector(31 downto 0);
		dataIN_14 :	in std_logic_vector(31 downto 0);
		dataIN_15 :	in std_logic_vector(31 downto 0)
  	);
	end component DataDecoder;

	signal FIFO_WR	: T_Handshake_signal;
	signal FIFO_RD	: T_Handshake_signal;

	signal cnt_fifo:	std_logic_vector(8 downto 0) := (others => '0');

	type T_DataBus12 is array (15 downto 0) of std_logic_vector(11 downto 0);
	type T_DataBus32 is array (15 downto 0) of std_logic_vector(31 downto 0);
	signal wr_data : T_DataBus12;
	signal rd_data12 : T_DataBus12;
	signal rd_data32 : T_DataBus32;
	signal wr_en : std_logic;
	signal rd_en : std_logic;
	signal rd_en_dly : std_logic;
	signal rd_en_v : std_logic_vector(15 downto 0);
	signal full :	std_logic_vector(15 downto 0);
	signal empty :	std_logic_vector(15 downto 0);

	signal WDOTime_intl	:	std_logic_vector(63 downto 0);
	signal DIGTime_intl	:	std_logic_vector(63 downto 0);
	signal Trigger_intl	:	std_logic_vector(31 downto 0);
	signal WDONBR_intl :	std_logic_vector(8 downto 0);

	signal DataOut_stall : std_logic_vector(31 downto 0);
	signal DataOut_last : std_logic_vector(31 downto 0);
	signal DataOut_intl : std_logic_vector(31 downto 0);
	signal DataOut_intlH : std_logic_vector(31 downto 0);
	signal DataOut_intlD : std_logic_vector(31 downto 0);
	signal rdy_state :	std_logic_vector(1 downto 0) := (others => '1');

	--Ack Request signals sets
	signal request_intl : std_logic;
	signal Handshake_RECV_intl: T_Handshake_RECV_intl;
	signal acknowledge_intl : std_logic;
	signal busy_intl : std_logic;
	signal testfifo_intl : std_logic;

	signal BIN_TIME : std_logic_vector(59 downto 0);
begin
	-- --------------------------------------------------------------------------------
	-- Unused signals from Bus
	-- CtrlBus_OxSL.TC_BUS	<= (others => 'Z');
	--
	-- CtrlBus_OxSL.DO_BUS <= (others => (others => 'Z'));
	-- CtrlBus_OxSL.BUSY	<= 'Z';
	-- CtrlBus_OxSL.PLL_LOCKED <= 'Z';
	--
	-- CtrlBus_OxSL.SSvalid <= 'Z';
	-- CtrlBus_OxSL.RAMP_CNT <= 'Z';
	-- CtrlBus_OxSL.Cnt_AXIS <= (others => 'Z');
	--
	-- CtrlBus_OxSL.RBNbrOfPackets <= (others => 'Z');
	-- CtrlBus_OxSL.WindowBusy <= 'Z';
	-- --------------------------------------------------------------------------------

	--Clock Domain Handshake
	REQ_CLKBUF : clkcrossing_buf
		generic map(
			NBITS => 1
		)
		port map (
			nrst	=> CtrlBus_IxSL.SW_nRST,
			DA(0)	=> Handshake_IxRECV.REQ,
			QB(0)	=> request_intl,
			ClkA	=> Handshake_IxRECV.RCLK, --foreign clock
			ClkB	=> ClockBus.AXI_CLK
		);

	DATA_CLKBUF : clkcrossing_buf
		generic map(
			NBITS => 1
		)
		port map (
			nrst	=> CtrlBus_IxSL.SW_nRST,
			DA(0)	=> Handshake_Data.TestFifo,
			QB(0)	=> testfifo_intl,
			ClkA	=> Handshake_IxRECV.RCLK, --foreign clock
			ClkB	=> ClockBus.AXI_CLK
		);
	Handshake_OxRECV.ACK 	<=	FIFO_WR.recv.ACK;
	Handshake_OxRECV.BUSY 	<=	FIFO_WR.recv.Busy;
	Handshake_OxRECV.ACLK 	<=	ClockBus.AXI_CLK;

	-- 1 FIFO per channel
	GEN_FIFO: for I in 0 to 15 generate
    FIFOCH : module_fifo_regs_no_flags
	generic map (
		g_WIDTH => 12,
		g_DEPTH => 32
		)
	  port map (
		i_rst_sync	=> CtrlBus_IxSL.SW_nRST,
		i_clk  		=> ClockBus.AXI_CLK,

		-- FIFO Write Interface
		i_wr_en   => wr_en,
		i_wr_data	=> wr_data(I),
		o_full    => full(I),

		-- FIFO Read Interface
		i_rd_en   => rd_en_v(I),
		o_rd_data => rd_data12(I),
		o_empty  => empty(I)
		);

		rd_data32(I) <= x"00000" & rd_data12(I);
   end generate GEN_FIFO;

	TIME_GRAYDECODE : GRAY_DECODER
		generic map(
			NBITS => 60
		)
		Port map(
		GRAY_IN => FIFO_Time(63 downto 4),
		BIN_OUT	=> BIN_TIME
		);


	FIFO_Address : AddressDecoder
	port map(
		 address => cnt_fifo(8 downto 5),
		 rd_en => rd_en,
		 --rd_en => rd_en_dly,
		 decode => rd_en_v
	  );

	DataDecoderFIFO : DataDecoder
 	port map(
		address => cnt_fifo(8 downto 5),
		dataOut => DataOut_intlD,

		dataIN_0 => rd_data32(0),
		dataIN_1 => rd_data32(1),
		dataIN_2 => rd_data32(2),
		dataIN_3 => rd_data32(3),

		dataIN_4 => rd_data32(4),
		dataIN_5 => rd_data32(5),
		dataIN_6 => rd_data32(6),
		dataIN_7 => rd_data32(7),

		dataIN_8 => rd_data32(8),
		dataIN_9 => rd_data32(9),
		dataIN_10 => rd_data32(10),
		dataIN_11 => rd_data32(11),

		dataIN_12 => rd_data32(12),
		dataIN_13 => rd_data32(13),
		dataIN_14 => rd_data32(14),
		dataIN_15 => rd_data32(15)
  	);

	HeaderRead : process(ClockBus.AXI_CLK,CtrlBus_IxSL.SW_nRST)
	begin
		if (CtrlBus_IxSL.SW_nRST = '0') then
			FIFO_ReadEn <= '0';
		else
			if (falling_edge (ClockBus.AXI_CLK)) then
				case (fifo_wr_stm) is
					when IDLE =>
						FIFO_ReadEn <= '0';
					when READ_FIFO_INFO =>
						FIFO_ReadEn <= '1';
					when WAIT_FIFO_INFO =>
						FIFO_ReadEn <= '0';
					when others =>
						FIFO_ReadEn <= '0';
				end case;
			end if;
		end if;
	end process;

	-- FIFO WRITE PROCESS
	fifoWR : process(ClockBus.AXI_CLK,CtrlBus_IxSL.SW_nRST)
	begin
	if (CtrlBus_IxSL.SW_nRST = '0') then
		fifo_wr_stm <= IDLE;
		FIFO_WR.recv.busy <= '0';
		FIFO_WR.recv.ack <= '0';
		FIFO_WR.send.req <= '0';
	else
		if (rising_edge (ClockBus.AXI_CLK)) then
			case (fifo_wr_stm) is
				when IDLE =>
					wr_en <= '0';

					FIFO_WR.recv.ack <= '0';
					FIFO_WR.recv.busy <= '0';

					if (FIFO_RD.recv.busy = '1')then
						fifo_wr_stm <= IDLE;
					else
						fifo_wr_stm <= READY;
					end if;

				when READY =>
					if (request_intl = '1') then
						FIFO_WR.recv.ack <= '1';
						FIFO_WR.recv.busy <= '1';

						fifo_wr_stm <= ACKNOWLEDGE;

						wr_data(0)	<= CH0;
						wr_data(1)	<= CH1;
						wr_data(2)	<= CH2;
						wr_data(3)	<= CH3;

						wr_data(4)	<= CH4;
						wr_data(5)	<= CH5;
						wr_data(6)	<= CH6;
						wr_data(7)	<= CH7;

						wr_data(8)	<= CH8;
						wr_data(9)	<= CH9;
						wr_data(10)	<= CH10;
						wr_data(11)	<= CH11;

						wr_data(12)	<= CH12;
						wr_data(13)	<= CH13;
						wr_data(14)	<= CH14;
						wr_data(15)	<= CH15;
					else

						FIFO_WR.recv.ack <= '0';
						FIFO_WR.recv.busy <= '0';
						fifo_wr_stm <= READY;
					end if;
				--when RESPREADY =>
				when ACKNOWLEDGE =>


					FIFO_WR.recv.busy <= '1';

					if (request_intl = '0') then
						FIFO_WR.recv.ack <= '0';

						fifo_wr_stm <= PROC_REQ;
					else
						fifo_wr_stm <= ACKNOWLEDGE;
						FIFO_WR.recv.ack <= '1';
						--Handshake_RECV_intl.ACK <= '1';
					end if;
				when PROC_REQ =>
					fifo_wr_stm <= WRFULL;
				when WRFULL =>
					if(full = x"FFFF") then
						fifo_wr_stm <= WRFULL;
					else
						fifo_wr_stm <= WRxRD;
					end if;

				when WRxRD =>
					wr_en	<= '1';
					fifo_wr_stm <= WR_TEMPO;

				when WR_TEMPO =>
					wr_en <= '0';
					fifo_wr_stm <= REQUEST;

				WHEN REQUEST =>

					if(full = x"FFFF") then
						FIFO_WR.send.REQ <= '1';	-- The FiFOS are Full of data, all samples got
						-- WDOTime_intl	<= WDOTime;
						-- DIGTime_intl	<= DIGTime;
						-- Trigger_intl	<= Trigger;
						-- WDONBR_intl		<= WDONBR;
						--fifo_wr_stm <= RESPVALID;

						if testfifo_intl = '0' then
							fifo_wr_stm <= READ_FIFO_INFO;
						else
							fifo_wr_stm <= RESP_ACK;
							WDOTime_intl	<= 	x"00000000" & x"FFFFFFFF";
							DIGTime_intl <= 	x"FFFFFFFF" & x"00000000";
							Trigger_intl <= x"12345678";
							WDONbr_intl <= "110110110";
						end if;
					else
						FIFO_WR.send.REQ <= '0';	-- The FiFOS are Full of data, all samples got
						fifo_wr_stm <= IDLE;
					end if;
				when READ_FIFO_INFO =>
					fifo_wr_stm <= WAIT_FIFO_INFO;

				when WAIT_FIFO_INFO =>
					fifo_wr_stm <= HEADER_FIFO_PREPARE;

				when HEADER_FIFO_PREPARE =>
					--WDOTime_intl	<= FIFO_Time;
					WDOTime_intl	<= BIN_Time & FIFO_Time(3 downto 0);
					DIGTime_intl	<= x"00000000" & x"00000" & "0" & FIFO_Spare;
					Trigger_intl	<= x"00000" & FIFO_TrigInfo;
					WDONBR_intl		<= FIFO_WdoAddr;
					fifo_wr_stm <= RESP_ACK;

				WHEN RESP_ACK =>
					if (FIFO_RD.recv.ACK = '1') then
						FIFO_WR.send.REQ <= '0';
						fifo_wr_stm <= REQ_GRANT;
					else
						FIFO_WR.send.REQ <= '1';
						fifo_wr_stm <= RESP_ACK;
					end if;

				WHEN REQ_GRANT =>
					FIFO_WR.send.REQ <= '0';
					if (FIFO_RD.recv.ACK = '0') then
						fifo_wr_stm <= IDLE;
					else
						fifo_wr_stm <= REQ_GRANT;
					end if;
				when others =>
					fifo_wr_stm <= IDLE;
			end case;
		end if;
	end if;
	end process;

	-- FIFO READ PROCESS
	fifoRD : process(ClockBus.AXI_CLK,CtrlBus_IxSL.SW_nRST)
	begin
	if (CtrlBus_IxSL.SW_nRST = '0') then
		rd_en <= '0';

		FIFO_RD.recv.ack <= '0';
		FIFO_RD.recv.busy <= '0';
		FIFO_RD.send.req <= '0';

		dataout_stall <= (others => '0');
		dataout_last <= (others => '0');
		DataOut_intlH <= (others => '0');

		FIFOvalid <= '0';
	else
		if (rising_edge (ClockBus.AXI_CLK)) then
 			case (fifo_rd_stm) is
				when IDLE =>
					rd_en <= '0';
					FIFO_RD.recv.busy <= '0';
					FIFO_RD.recv.ack <= '0';

					fifo_rd_stm <= READY;
				when READY =>
					if (FIFO_WR.send.REQ = '1') then
						fifo_rd_stm <= ACKNOWLEDGE;
					else
						fifo_rd_stm <= READY;
					end if;
				when ACKNOWLEDGE =>

					FIFO_RD.recv.busy <= '1';
					if (FIFO_WR.send.req = '0') then
						FIFO_RD.recv.ack <= '1';
						fifo_rd_stm <= PROC_REQ;

					else
						FIFO_RD.recv.ack <= '1';
						fifo_rd_stm <= ACKNOWLEDGE;
					end if;
				when PROC_REQ =>
					fifo_rd_stm <= WRxRD_INIT;
				when WRxRD_INIT =>
					FIFO_RD.recv.ack <= '0';
					cnt_fifo <= (others => '0');
					--if(StreamReady = '1' and TestStream = '1') then
					if(StreamReady = '1' and CtrlBus_IxSL.PSBUSY = '0') then
						--FIFOvalid <= '1';
						fifo_rd_stm <= WRxRD_HEADER;
						DataOut_intlH <= WDOTime_intl(31 downto 0);
						FIFOvalid <= '1';
						cnt_fifo <= "000000001";
					else
						FIFOvalid <= '0';
						rd_en	<= '0';
						fifo_rd_stm <= WRxRD_INIT;

					end if;
				when WRxRD_HEADER =>
					if(StreamReady = '1') then
						FIFOvalid <= '1';

						cnt_fifo <= std_logic_vector(unsigned(cnt_fifo) + 1);

						case cnt_fifo is
							when "000000000" =>
								DataOut_intlH <= WDOTime_intl(31 downto 0);
								FIFOvalid <= '1';
								fifo_rd_stm <= WRxRD_HEADER;
							when "000000001" =>
								DataOut_intlH <= WDOTime_intl(63 downto 32);

								FIFOvalid <= '1';
								fifo_rd_stm <= WRxRD_HEADER;
							when "000000010" =>
								DataOut_intlH <= DIGTime_intl(31 downto 0);

								FIFOvalid <= '1';
								fifo_rd_stm <= WRxRD_HEADER;
							when "000000011" =>
								DataOut_intlH <= DIGTime_intl(63 downto 32);

								FIFOvalid <= '1';
								fifo_rd_stm <= WRxRD_HEADER;
							when "000000100" =>
								DataOut_intlH <= Trigger_intl;

								FIFOvalid <= '1';
								fifo_rd_stm <= WRxRD_HEADER;
							when "000000101" =>
								DataOut_intlH <= x"0000" & "0000000" & WDONBR_intl;
								FIFOvalid <= '1';
								fifo_rd_stm <= WRxRD_HEADER;
							when others =>
								cnt_fifo <= (others => '0');
								fifo_rd_stm <= WRxRD_DATA;
								rd_en	<= '1';
								FIFOvalid <= '1';
						end case;
					else
						rd_en	<= '0';
						last_fifo_rd_stm <= WRxRD_HEADER;
						dataout_last <= dataout_intlH;
						fifo_rd_stm <= STALL;
					end if;
				when WRxRD_DATA =>
					if(StreamReady = '1') then
						if(to_integer(unsigned(cnt_fifo)) < 511) then
							cnt_fifo <= std_logic_vector(unsigned(cnt_fifo) + 1);
							rd_en	<= '1';
							FIFOvalid <= '1';
							fifo_rd_stm <= WRxRD_DATA;
						else
							--ENd Transmission
							cnt_fifo <= (others => '0');
							fifo_rd_stm <= VALID;
							rd_en	<= '0';
							FIFOvalid <= '1';
						end if;
					else
						rd_en	<= '0';
						last_fifo_rd_stm <= WRxRD_DATA;
						dataout_last <= dataout_intlD;
						fifo_rd_stm <= STALL;
					end if;

				-- New State when the AXI is not ready data output should be stalled
				WHEN STALL =>
					dataout_stall <= dataout_intlD;
					if(StreamReady = '1') then
						fifo_rd_stm <= last_fifo_rd_stm;
						cnt_fifo <= std_logic_vector(unsigned(cnt_fifo) + 1);
						rd_en	<= '1';
					else
						fifo_rd_stm <= STALL;
						rd_en	<= '0';
					end if;

				WHEN VALID =>
					rd_en <= '0';
					FIFOvalid <= '0';
					if CtrlBus_IxSL.PSBusy = '0' then
						fifo_rd_stm <= VALID;
					else
						fifo_rd_stm <= IDLE;
					end if;
				WHEN RESPVALID =>
				when others =>
					fifo_rd_stm <= IDLE;
			end case;
		end if;
	end if;
	end process;

	--CtrlBus_OxSL.FIFOBusy <= fifo_rd.recv.busy;
	FIFOBusy <= fifo_rd.recv.busy;

	dataout_intl <=	DataOut_intlH when fifo_rd_stm = WRxRD_HEADER else
					DataOut_intlD when fifo_rd_stm = WRxRD_DATA else
					(others => '0');
	-- DATAOUT
	process(ClockBus.AXI_CLK)
	begin
		if rising_edge(ClockBus.AXI_CLK) then
			rdy_state <= rdy_state(0) & StreamReady;
			case rdy_state is
				when "00" =>
					FIFOData <= dataout_last;
				when "01" =>
					FIFOData <= dataout_stall;
				when "11" =>
					FIFOData <= dataout_intl;
				when "10" =>
					FIFOData <= dataout_last;
				when others =>
					FIFOData <= (others => '0');
			end case;
		end if;
	end process;
end rtl;
