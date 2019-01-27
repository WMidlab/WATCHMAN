-- -----------------------------------------------------------
--!@FILE: 	FiFOManager.vhd
--!@AUTHOR: Jonathan Hendriks
--!@DATE: 	24th of January 2019
-- -----------------------------------------------------------
--!@DESCRIPTION:
--!
--!
-- -----------------------------------------------------------

-- Librairies
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.TARGETC_pkg.all;

-- Entity
entity TCtoAXI_Fifo_Manager is
	generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32
	);
	port (
		nRST:		in	std_logic;
		CLK:		in	std_logic;

		--DATA INCOMING
		PRECvalid:		in	std_logic;
		FIFOresponse:	out std_logic;
		TestFIFO:		in	std_logic;

		--Header Information
		FIFO_ReadEn:	out	std_logic;
		FIFO_Time : 	in 	std_logic_vector(63 downto 0);
		FIFO_WdoAddr : 	in 	std_logic_vector(8 downto 0);
		FIFO_TrigInfo : in 	std_logic_vector(11 downto 0);
		FIFO_Spare :	in 	std_logic_vector(9 downto 0);
		FIFO_Empty	: 	in 	std_logic;

		--Channels Data from TargetC
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
		FIFOvalid:		out	std_logic;
		ready_i:		in 	std_logic;
		PSBUSY_i:		in	std_logic;
		DataOut:		out	std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0)
	);
end TCtoAXI_Fifo_Manager;

-- architecture
architecture behavior of TCtoAXI_Fifo_Manager is

	-- -------------------------------------------------------------
	-- COMPONENTS
	component fifo is
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
	end component fifo;

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

	-- -------------------------------------------------------------
	-- SIGNALS
	type fifostate is (
		IDLE,
		READY,
		RESPREADY,

		WRFULL,
		WRxRD,
		WRxRD_INIT,
		WRxRD_HEADER,
		WRxRD_DATA,
		WR_TEMPO,
		STALL,

		VALID,
		READ_FIFO_INFO,
		WAIT_FIFO_INFO,
		RESPVALID
	);
	signal fifo_wr_stm : 	 fifostate := IDLE;
	signal fifo_rd_stm : 	 fifostate := IDLE;
	signal last_fifo_rd_stm : fifostate := IDLE;

	type T_fifosignal is record
		busy:		std_logic;
		valid:		std_logic;
		ready:		std_logic;
		response:	std_logic;
	end record;

	signal FIFO_WR	: T_fifosignal;
	signal FIFO_RD	: T_fifosignal;

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
begin

	-- Storage Fifo for incoming data from Target C
	GEN_FIFO: for I in 0 to 15 generate
    FIFOCH : fifo
	generic map (
		g_WIDTH => 12,
		g_DEPTH => 32
		)
	  port map (
		i_rst_sync	=> nRST,
		i_clk  		=> CLK,

		-- FIFO Write Interface
		i_wr_en   => wr_en,
		i_wr_data	=> wr_data(I),
		o_full    => full(I),

		-- FIFO Read Interface
		i_rd_en   => rd_en_v(I),
		o_rd_data => rd_data12(I),
		o_empty  => empty(I)
		);

		-- Possible amélioration
		rd_data32(I) <= x"00000" & rd_data12(I);
   end generate GEN_FIFO;


	-- Address decoder for readout from fifo
	FIFO_Address : AddressDecoder
	port map(
		 address => cnt_fifo(8 downto 5),
		 rd_en => rd_en,
		 decode => rd_en_v
	  );

	-- Data decoder for readout
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

	FIFOresponse <= FIFO_WR.response;

	-- FIFO WRITE PROCESS
	fifoWR : process(CLK,nRST)
	begin
	if (nRST = '0') then
		fifo_wr_stm <= IDLE;
		FIFO_WR.busy <= '0';

	else
		if (rising_edge (CLK)) then
			case (fifo_wr_stm) is
				when IDLE =>
					wr_en <= '0';

					FIFO_WR.response <= '0';
					FIFO_WR.busy <= '0';

					if (FIFO_RD.busy = '1')then
						fifo_wr_stm <= IDLE;
					else
						fifo_wr_stm <= READY;
					end if;

				when READY =>
					if (PRECvalid = '1') then
						fifo_wr_stm <= RESPREADY;

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
						fifo_wr_stm <= READY;
					end if;
				when RESPREADY =>
					FIFO_WR.response <= '1';
					FIFO_WR.busy <= '1';
					if (PRECvalid = '0') then
						FIFO_WR.valid <= '0';
						FIFO_WR.ready <= '0';

						fifo_wr_stm <= WRFULL;
					else
						fifo_wr_stm <= RESPREADY;
					end if;

				when WRFULL =>
					FIFO_WR.response <= '0';
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
					fifo_wr_stm <= VALID;

				WHEN VALID =>

					if(full = x"FFFF") then
						FIFO_WR.valid <= '1';	-- The FiFOS are Full of data, all samples got
						-- WDOTime_intl	<= WDOTime;
						-- DIGTime_intl	<= DIGTime;
						-- Trigger_intl	<= Trigger;
						-- WDONBR_intl		<= WDONBR;
						--fifo_wr_stm <= RESPVALID;

						if TestFIFO = '0' then
							FIFO_ReadEn <= '1';
							fifo_wr_stm <= WAIT_FIFO_INFO;
						else
							FIFO_ReadEn <= '0';
							fifo_wr_stm <= RESPVALID;
							WDOTime_intl	<= 	x"00000000" & x"FFFFFFFF";
							DIGTime_intl <= 	x"FFFFFFFF" & x"00000000";
							Trigger_intl <= x"12345678";
							WDONbr_intl <= "110110110";
						end if;
					else
						FIFO_WR.valid <= '0';	-- The FiFOS are Full of data, all samples got
						fifo_wr_stm <= IDLE;
					end if;

				when WAIT_FIFO_INFO =>
					FIFO_ReadEn <= '0';
					fifo_wr_stm <= READ_FIFO_INFO;
				when READ_FIFO_INFO =>
					WDOTime_intl	<= FIFO_Time;
					DIGTime_intl	<= x"00000000" & x"00000" & "00" & FIFO_Spare;
					Trigger_intl	<= x"00000" & FIFO_TrigInfo;
					WDONBR_intl		<= FIFO_WdoAddr;
					fifo_wr_stm <= RESPVALID;
				WHEN RESPVALID =>
					if (FIFO_RD.response = '1') then
						FIFO_WR.valid <= '0';	-- The FiFOS are Full of data, all samples got
						fifo_wr_stm <= IDLE;
					end if;
				when others =>
					fifo_wr_stm <= IDLE;
			end case;
		end if;
	end if;
	end process;

	-- FIFO READ PROCESS
	fifoRD : process(CLK,nRST)
	begin
	if (nRST = '0') then
		rd_en <= '0';

		FIFO_RD.response <= '0';
		FIFO_RD.ready <= '0';
		FIFO_RD.valid <= '0';
		FIFO_RD.busy <= '0';

		dataout_stall <= (others => '0');
		dataout_last <= (others => '0');
		DataOut_intlH <= (others => '0');

		FIFOvalid <= '0';
	else
		if (rising_edge (CLK)) then
 			case (fifo_rd_stm) is
				when IDLE =>
					rd_en <= '0';
					FIFO_RD.busy <= '0';
					FIFO_RD.response <= '0';

					fifo_rd_stm <= READY;
				when READY =>
					if (FIFO_WR.valid = '1') then
						fifo_rd_stm <= RESPREADY;
					else
						fifo_rd_stm <= READY;
					end if;
				when RESPREADY =>
					FIFO_RD.response <= '1';
					FIFO_RD.busy <= '1';
					if (FIFO_WR.valid = '0') then
						FIFO_RD.ready <= '0';

						fifo_rd_stm <= WRxRD_INIT;

					else
						fifo_rd_stm <= RESPREADY;
					end if;
				when WRxRD_INIT =>
					FIFO_RD.response <= '0';
					cnt_fifo <= (others => '0');
					--if(ready_i = '1' and TestStream = '1') then
					if(ready_i = '1' and PSBUSY_i = '0') then
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
					if(ready_i = '1') then
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
					if(ready_i = '1') then
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
					if(ready_i = '1') then
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
					if PSBusy_i = '0' then
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

	dataout_intl <=	DataOut_intlH when fifo_rd_stm = WRxRD_HEADER else
					DataOut_intlD when fifo_rd_stm = WRxRD_DATA else
					(others => '0');
	-- DATAOUT
	process(clk)
	begin
		if rising_edge(CLK) then
			rdy_state <= rdy_state(0) & ready_i;
			case rdy_state is
				when "00" =>
					DataOut <= dataout_last;
				when "01" =>
					DataOut <= dataout_stall;
				when "11" =>
					DataOut <= dataout_intl;
				when "10" =>
					DataOut <= dataout_last;
				when others =>
					DataOut <= (others => '0');
			end case;
		end if;
	end process;
end architecture;
