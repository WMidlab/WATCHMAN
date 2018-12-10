library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.TARGETC_pkg.all;

entity FifoManager is
	generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32

	);
	port (
		nRST:		in	std_logic;
		CLK:		in	std_logic;
		
		--DATA INCOMING
		PRECvalid:	in	std_logic;
		FIFOresponse:	out std_logic;
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
		FIFOvalid:	out	std_logic;
		ready_i:		in 	std_logic;
		DataOut:	out	std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0)
	);
end FifoManager;

architecture rtl of FifoManager is
	 
	type fifostate is (
		IDLE,
		READY,
		RESPREADY,
		
		WRFULL,		
		WRxRD,
		WRxRD_INIT,
		WR_TEMPO,
		
		VALID,
		RESPVALID
	);
	signal fifo_wr_stm : 	 fifostate := IDLE;
	signal fifo_rd_stm : 	 fifostate := IDLE;
	
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
	signal rd_en_v : std_logic_vector(15 downto 0);
	signal full :	std_logic_vector(15 downto 0);
	signal empty :	std_logic_vector(15 downto 0);
	
begin

	
	
	-- 1 FIFO per channel
	GEN_FIFO: for I in 0 to 15 generate
    FIFOCH : module_fifo_regs_no_flags 
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
	
		rd_data32(I) <= x"00000" & rd_data12(I);
   end generate GEN_FIFO; 
	
	
	
	FIFO_Address : AddressDecoder
	port map(
		 address => cnt_fifo(8 downto 5),
		 rd_en => rd_en,
		 decode => rd_en_v
	  );
	
	DataDecoderFIFO : DataDecoder 
 	port map(
		address => cnt_fifo(8 downto 5),
		dataOut => DataOut,
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
	else
		if (rising_edge (CLK)) then                                                       
			case (fifo_wr_stm) is                                                              
				when IDLE =>
					wr_en <= '0';
					
					FIFO_WR.response <= '0';
					
					fifo_wr_stm <= READY;
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
						fifo_wr_stm <= RESPVALID;
					else
						FIFO_WR.valid <= '0';	-- The FiFOS are Full of data, all samples got
						fifo_wr_stm <= IDLE;
					end if;
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
	else
		if (rising_edge (CLK)) then                                                       
 			case (fifo_rd_stm) is                                                              
				when IDLE =>
					rd_en <= '0';
					
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
						FIFO_RD.valid <= '0';
						FIFO_RD.ready <= '0';
						
						fifo_rd_stm <= WRxRD_INIT;
						
					else
						fifo_rd_stm <= RESPREADY;
					end if;
				when WRxRD_INIT =>
					FIFO_RD.response <= '0';
					cnt_fifo <= (others => '0');
					if(ready_i = '1') then
						rd_en	<= '1';
						FIFOvalid <= '1';
						fifo_rd_stm <= WRxRD;
					else
						FIFOvalid <= '0';
						rd_en	<= '0';
						fifo_rd_stm <= WRxRD_INIT;
					end if;
				when WRxRD =>
					if(ready_i = '1') then
						if(to_integer(unsigned(cnt_fifo)) < 511) then
							cnt_fifo <= std_logic_vector(unsigned(cnt_fifo) + 1);
							rd_en	<= '1';
							FIFOvalid <= '1';
							fifo_rd_stm <= WRxRD;
						else
							--ENd Transmission
							cnt_fifo <= (others => '0');
							fifo_rd_stm <= VALID;
							rd_en	<= '0';
							FIFOvalid <= '0';
						end if;
					else
						rd_en	<= '0';
						fifo_rd_stm <= WRxRD;
					end if;
				
				WHEN VALID => 
					rd_en <= '0';
					
				WHEN RESPVALID =>
				when others => 
					fifo_rd_stm <= IDLE;
			end case;                                                                          
		end if; 
	end if;         
	end process;
	                                                                               
end rtl;
