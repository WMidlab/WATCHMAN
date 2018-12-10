library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity axistream is
	generic (
		-- Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32
		);
	port (
		-- Users to add ports here
		TestStream:			in std_logic;
		
		FIFOvalid:			in std_logic;
		FIFOdata:			in std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		StreamReady:		out	std_logic;
		-- User ports ends
		-- Do not modify the ports beyond this line

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
	                
	                START_TEST_STREAM,  
	                SEND_TEST_STREAM);        
	-- State variable                                                                 
	signal  mst_exec_state : state;                                                   
	-- Example design FIFO read pointer                                               
	--signal cnt_stream_out : integer range 0 to bit_num-1;
	signal cnt_stream_out : integer;                               
	
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
	signal tx_en	: std_logic;

	signal StreamReady_intl :	std_logic := '0';
--	signal nbr_of_packets_s : std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
--	signal content_packet_s : std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
	 
begin
	-- I/O Connections assignments

	M_AXIS_TVALID	<= axis_tvalid_delay;
	M_AXIS_TDATA	<= M_AXIS_TDATA_intl;
	M_AXIS_TLAST	<= axis_tlast_delay;
	M_AXIS_TSTRB	<= (others => '1');


	-- Control state machine implementation                                               
	process(M_AXIS_ACLK)                                                                        
	begin                                                                                       
	  if (rising_edge (M_AXIS_ACLK)) then                                                       
	    if(M_AXIS_ARESETN = '0') then                                                           
	      -- Synchronous reset (active low)                                                     
	      mst_exec_state      <= IDLE;                                                          
	      cnt_stream_out <= 0;
	      M_AXIS_TDATA_intl <= (others => '0');
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
	        		cnt_stream_out <= 0;
	        	end if;
			-- TEST Transmission
			when START_TEST_STREAM =>
	        	if (tx_en = '1')then
	        		cnt_stream_out <= cnt_stream_out + 1;
	        		mst_exec_state <= SEND_TEST_STREAM;
	        		M_AXIS_TDATA_intl <= std_logic_vector(to_unsigned(cnt_stream_out+cnt_stream_out,M_AXIS_TDATA_intl'length));
	        	end if;
	                                                                                       
	        when SEND_TEST_STREAM =>                                                                
			-- The example design streaming master functionality starts                       
			-- when the master drives output tdata from the FIFO and the slave                
			-- has finished storing the S_AXIS_TDATA                                          
				if (cnt_stream_out < 512 ) then                         
					if (tx_en = '1') then                                                    
					-- read pointer is incremented after every read from the FIFO          
					-- when FIFO read signal is enabled.                                   
					M_AXIS_TDATA_intl <= std_logic_vector(to_unsigned(cnt_stream_out+cnt_stream_out,M_AXIS_TDATA_intl'length));
					cnt_stream_out <= cnt_stream_out + 1;                                      
																		 
					end if;                                                                  
				else
					cnt_stream_out <= 0;                                                     
					mst_exec_state <= IDLE;                                                          
				end  if;
			
			-- DATA Transmission                                                                                   
	        when DATA_STREAM =>                                                                
			-- The example design streaming master functionality starts                       
			-- when the master drives output tdata from the FIFO and the slave                
			-- has finished storing the S_AXIS_TDATA                                          
				if (cnt_stream_out < 512) then                         
					if (tx_en = '1') then 
						StreamReady_intl <= '1';                                                   
					-- read pointer is incremented after every read from the FIFO          
					-- when FIFO read signal is enabled.                                   
						cnt_stream_out <= cnt_stream_out + 1;                                      
						M_AXIS_TDATA_intl <= 	 FIFOdata;						
					end if;                                                                  
				else                         
					-- tx_done is asserted when NUMBER_OF_OUTPUT_WORDS numbers of streaming data
					-- has been out. 
					StreamReady_intl <= '0';
					cnt_stream_out <= 0;                                                    
					mst_exec_state <= IDLE;                                                          
				end if;                                         
																				
	        when others    =>                                                                   
	          mst_exec_state <= IDLE;                                                           
	                                                                                            
	      end case;                                                                             
	    end if;                                                                                 
	  end if;                                                                                   
	end process;                                                                                


	--tvalid generation
	--axis_tvalid is asserted when the control state machine's state is SEND_STREAM and
	--number of output streaming data is less than the NUMBER_OF_OUTPUT_WORDS.
	axis_tvalid <= '1' when (((mst_exec_state = DATA_STREAM) or (mst_exec_state = START_TEST_STREAM) or (mst_exec_state = SEND_TEST_STREAM)) and (cnt_stream_out < 512)) else '0';
	                                                                                               
	-- AXI tlast generation                                                                        
	-- axis_tlast is asserted number of output streaming data is NUMBER_OF_OUTPUT_WORDS-1          
	-- (0 to NUMBER_OF_OUTPUT_WORDS-1)                                                             
	axis_tlast <= '1' when (cnt_stream_out = 511) else '0';                     
	                                                                                               
	-- Delay the axis_tvalid and axis_tlast signal by one clock cycle                              
	-- to match the latency of M_AXIS_TDATA                                                        
	process(M_AXIS_ACLK)                                                                           
	begin                                                                                          
	  if (rising_edge (M_AXIS_ACLK)) then                                                          
	    if(M_AXIS_ARESETN = '0') then                                                              
	      axis_tvalid_delay <= '0';                                                                
	      axis_tlast_delay <= '0';                                                                 
	    else                                                                                       
	      axis_tvalid_delay <= axis_tvalid;                                                        
	      axis_tlast_delay <= axis_tlast;                                                          
	    end if;                                                                                    
	  end if;                                                                                      
	end process;                                                                                   
                                                   


	--FIFO read enable generation 

	tx_en <= M_AXIS_TREADY and axis_tvalid;                                   
	
	
	--StreamReady <= tx_en when StreamReady_intl = '1' else '0';  
	StreamReady <= 	StreamReady_intl when mst_exec_state = IDLE else
					tx_en when mst_exec_state = DATA_STREAM else
					'0';
	                                 
	-- FIFO Implementation                                                          
	                                                                                
	-- Streaming output data is read from FIFO                                      
                                                               

	-- Add user logic here

	-- User logic ends

end implementation;
