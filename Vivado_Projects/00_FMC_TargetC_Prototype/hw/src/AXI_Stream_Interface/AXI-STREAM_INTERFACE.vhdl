library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity axistream is
	generic (
		-- Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		NBRWINDOW_MAX :				integer := 8;
		FIFO_NBR_MAX :		integer := 518
		);
	port (
		-- Users to add ports here
		SW_nRST:			in std_logic;
		TestStream:			in std_logic;

		FIFOvalid:			in std_logic;
		FIFOdata:			in std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		StreamReady:		out	std_logic;

		Cnt_AXIS_DATA:		out std_logic_Vector(9 downto 0);
		CNT_CLR:			in	std_logic;
		-- User ports ends
		-- Do not modify the ports beyond this line

		-- NBRWINDOW
		--NBRWINDOW:		in std_logic_vector(31 downto 0);

		-- Global ports
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
	);

end axistream;

architecture implementation of axistream is
	-- In this example, Depth of FIFO is determined by the greater of
	-- the number of input words and output words.
--	constant depth : integer := 2048;

	-- bit_num gives the minimum number of bits needed to address 'depth' size of FIFO
--	constant bit_num : integer := clogb2(depth);

	-- Define the states of state machine
	-- The control state machine oversees the writing of input streaming data to the FIFO,
	-- and outputs the streaming data from the FIFO
	type state is ( IDLE,
	                DATA_STREAM,
	                DATA_STREAM_STALL,

	                START_TEST_STREAM,
	                SEND_TEST_STREAM);
	-- State variable
	signal  mst_exec_state : state;
	-- Example design FIFO read pointer
	--signal cnt_stream_out : integer range 0 to bit_num-1;
	signal cnt_stream_out : integer;
	signal cnt_window : integer;

	-- AXI Stream internal signals
	--streaming data valid
	signal axis_tvalid	: std_logic;
	--streaming data valid delayed by one clock cycle
	signal axis_tvalid_delay	: std_logic;
	--Last of the streaming data
	signal axis_tlast	: std_logic;
	--Last of the streaming data delayed by one clock cycle
	signal axis_tlast_delay	: std_logic;
	--FIFO implementation signals
	signal M_AXIS_TDATA_intl	: std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
	signal M_AXIS_TDATA_last	: std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);

	signal tx_en	: std_logic;
	signal tx_state	:	std_logic_vector(1 downto 0);
	signal StreamReady_intl :	std_logic := '0';
--	signal nbr_of_packets_s : std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
--	signal content_packet_s : std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);

begin
	-- I/O Connections assignments

	M_AXIS_TVALID	<= axis_tvalid_delay;

	M_AXIS_TLAST	<= axis_tlast_delay;
	M_AXIS_TSTRB	<= (others => '1');


	-- Control state machine implementation
	process(M_AXIS_ACLK)
	begin
	  if (rising_edge (M_AXIS_ACLK)) then
	    if(M_AXIS_ARESETN = '0' or SW_nRST='0') then
	      -- Synchronous reset (active low)
	      mst_exec_state      <= IDLE;

	      M_AXIS_TDATA_intl <= (others => '0');
	      M_AXIS_TDATA_last <= (others => '0');
	      cnt_stream_out <= 0;
	      cnt_window <= 0;
	     else
	      case (mst_exec_state) is
	        when IDLE     =>
	          -- The slave starts accepting tdata when
	          -- there tvalid is asserted to mark the
	          -- presence of valid streaming data
	          --if (count = "0")then

	            if (TestStream = '1') then
	            --if((S_START_STREAMING = '1') and (unsigned(S_NBR_PACKETS) /= 0)) then
	            	StreamReady_intl <= '0';
	            	mst_exec_state <= START_TEST_STREAM;

	            	cnt_stream_out <= 0;

	            else
	            	mst_exec_state <= IDLE;
	            end if;

	            StreamReady_intl <= '1';

	            if (FIFOvalid = '1') then
	        		mst_exec_state <= DATA_STREAM;
	        		M_AXIS_TDATA_intl <= FIFOdata;
					M_AXIS_TDATA_last <= FIFOData;
					cnt_stream_out <= 0;

	        		--cnt_stream_out <= 0;
	        		--cnt_window <= 0;
	        	end if;

				if CNT_CLR = '1' then
					cnt_stream_out <= 0;
				end if;
			-- TEST Transmission
			when START_TEST_STREAM =>
	        	if (tx_en = '1')then
	        		cnt_stream_out <= cnt_stream_out + 1;
	        		mst_exec_state <= SEND_TEST_STREAM;
	        		--M_AXIS_TDATA_intl <= std_logic_vector(to_unsigned(cnt_stream_out+cnt_stream_out,M_AXIS_TDATA_intl'length));
	        		M_AXIS_TDATA_intl <= std_logic_vector(to_unsigned(cnt_stream_out,M_AXIS_TDATA_intl'length));

	        	end if;

	        when SEND_TEST_STREAM =>
			-- The example design streaming master functionality starts
			-- when the master drives output tdata from the FIFO and the slave
			-- has finished storing the S_AXIS_TDATA
				if (cnt_stream_out < FIFO_NBR_MAX ) then
					if (tx_en = '1') then
					-- read pointer is incremented after every read from the FIFO
					-- when FIFO read signal is enabled.
					--M_AXIS_TDATA_intl <= std_logic_vector(to_unsigned(cnt_stream_out+cnt_stream_out,M_AXIS_TDATA_intl'length));
					M_AXIS_TDATA_intl <= std_logic_vector(to_unsigned(cnt_stream_out,M_AXIS_TDATA_intl'length));

					cnt_stream_out <= cnt_stream_out + 1;

					end if;
				else
				    cnt_stream_out <= 0;
	      			cnt_window <= 0;
					mst_exec_state <= IDLE;
				end  if;

			-- DATA Transmission
	        when DATA_STREAM =>
			-- The example design streaming master functionality starts
			-- when the master drives output tdata from the FIFO and the slave
			-- has finished storing the S_AXIS_TDATA

				if (cnt_stream_out < FIFO_NBR_MAX) then
					if (tx_en = '1') then
						StreamReady_intl <= '1';
					-- read pointer is incremented after every read from the FIFO
					-- when FIFO read signal is enabled.
						cnt_stream_out <= cnt_stream_out + 1;
						M_AXIS_TDATA_intl <= FIFOdata;
						M_AXIS_TDATA_last <= FIFOData;
						mst_exec_state <= DATA_STREAM;
					else
						M_AXIS_TDATA_last <=  FIFOdata;
						mst_exec_state <= DATA_STREAM_STALL;
					end if;
				else
					-- Check the number of windows sent for LAST signal
					--if (cnt_window < to_integer(unsigned(NBRWINDOW)-1)) then
					--	cnt_window <= cnt_window + 1;
					--	StreamReady_intl <= '0';
					--	cnt_stream_out <= 0;
					--	mst_exec_state <= IDLE;
					--else
						-- tx_done is asserted when NUMBER_OF_OUTPUT_WORDS numbers of streaming data
						-- has been out.
						StreamReady_intl <= '0';
						--cnt_stream_out <= 0;
						cnt_window <= 0;
						mst_exec_state <= IDLE;
					--end if;
				end if;
			when DATA_STREAM_STALL =>
				if (tx_en = '1') then
						cnt_stream_out <= cnt_stream_out + 1;
						mst_exec_state <= DATA_STREAM;
				else
						mst_exec_state <= DATA_STREAM_STALL;
				end if;
	        when others    =>
	          mst_exec_state <= IDLE;

	      end case;
	    end if;
	  end if;
	end process;

	-- DATAOUT
	--M_AXIS_TDATA	<= M_AXIS_TDATA_intl;

	process(M_AXIS_ACLK)
	begin
		if rising_edge(M_AXIS_ACLK) then
			tx_state <= tx_state(0) & tx_en;
--			case tx_state is
--				when "00" =>
--					M_AXIS_TDATA <= M_AXIS_TDATA_intl;
--				when "01" =>
--					M_AXIS_TDATA <= M_AXIS_TDATA_last;
--				when "11" =>
--					M_AXIS_TDATA <= M_AXIS_TDATA_intl;
--				when "10" =>
--					M_AXIS_TDATA <= M_AXIS_TDATA_intl;
--				when others =>
--					M_AXIS_TDATA <= (others => '0');
--			end case;
		end if;
	end process;

	M_AXIS_TDATA <=	M_AXIS_TDATA_intl when (mst_exec_state = START_TEST_STREAM) or (mst_exec_state = SEND_TEST_STREAM) else
					M_AXIS_TDATA_intl when tx_state = "00" else
					M_AXIS_TDATA_last when tx_state = "01" else
					M_AXIS_TDATA_intl when tx_state = "11" else
					M_AXIS_TDATA_intl when tx_state = "10" else
					(others => '0');

	--tvalid generation
	--axis_tvalid is asserted when the control state machine's state is SEND_STREAM and
	--number of output streaming data is less than the NUMBER_OF_OUTPUT_WORDS.
	axis_tvalid <= '1' when (((mst_exec_state = DATA_STREAM) or (mst_exec_state = DATA_STREAM_STALL) or (mst_exec_state = START_TEST_STREAM) or (mst_exec_state = SEND_TEST_STREAM)) and (cnt_stream_out < FIFO_NBR_MAX)) else '0';

	-- AXI tlast generation
	-- axis_tlast is asserted number of output streaming data is NUMBER_OF_OUTPUT_WORDS-1
	-- (0 to NUMBER_OF_OUTPUT_WORDS-1)
	--axis_tlast <= '1' when (cnt_stream_out = FIFO_NBR_MAX-1) else '0';
	axis_tlast <= '1' when (cnt_stream_out = FIFO_NBR_MAX-1) else '0';
	--axis_tlast <= '1' when ((cnt_stream_out = FIFO_NBR_MAX-1) and (cnt_window >= to_integer(unsigned(NBRWINDOW)-1))) else '0';

	-- Delay the axis_tvalid and axis_tlast signal by one clock cycle
	-- to match the latency of M_AXIS_TDATA
	process(M_AXIS_ACLK)
	begin
	  if (rising_edge (M_AXIS_ACLK)) then
	    if(M_AXIS_ARESETN = '0' or SW_nRST='0') then
	      axis_tvalid_delay <= '0';
	      axis_tlast_delay <= '0';
	    else
	      axis_tvalid_delay <= axis_tvalid;
	      axis_tlast_delay <= axis_tlast;
	    end if;
	  end if;
	end process;

	-- process(M_AXIS_ACLK,nDCLR)
	-- begin
	-- 	if nDCLR = '1' then
	-- 		AXIS_Error <= (others => '0');
	-- 	else
	-- 		if (rising_edge (M_AXIS_ACLK)) then
	-- 			last_mst_exec_state <= mst_exec_state;
	-- 		    if((last_mst_exec_state = DATA_STREAM or last_mst_exec_state = SEND_TEST_STREAM) and mst_exec_state = IDLE) then


	Cnt_AXIS_DATA <= std_logic_vector(to_unsigned(cnt_stream_out,10));
	--FIFO read enable generation

	tx_en <= M_AXIS_TREADY and axis_tvalid;


	--StreamReady <= tx_en when StreamReady_intl = '1' else '0';
	StreamReady <= 	StreamReady_intl when mst_exec_state = IDLE else
					tx_en when mst_exec_state = DATA_STREAM or mst_exec_state = DATA_STREAM_STALL else
					'0';

	-- FIFO Implementation

	-- Streaming output data is read from FIFO


	-- Add user logic here

	-- User logic ends

end implementation;
