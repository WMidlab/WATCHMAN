library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std.all;
use work.AXIS_Peripheral_pkg.all;

entity AXIS_Peripheral_v2_0_M00_AXIS is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		-- Start count is the number of clock cycles the master will wait before initiating/issuing any transaction.
		C_M_START_COUNT	: integer	:= 32
	);
	port (
		-- Users to add ports here
		S_START_STREAMING : in std_logic;
		S_NBR_PACKETS : 	in std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		S_CONTENT_1:	 	in std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		S_MODE:				in std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		-- User ports ends
		-- Do not modify the ports beyond this line

		-- Global ports
		M_AXIS_ACLK	: in std_logic;
		-- 
		M_AXIS_ARESETN	: in std_logic;
		-- Master Stream Ports. TVALID indicates that the master is driving a valid transfer, A transfer takes place when both TVALID and TREADY are asserted. 
		M_AXIS_TVALID	: out std_logic;
		-- TDATA is the primary payload that is used to provide the data that is passing across the interface from the master.
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		-- TSTRB is the byte qualifier that indicates whether the content of the associated byte of TDATA is processed as a data byte or a position byte.
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		-- TLAST indicates the boundary of a packet.
		M_AXIS_TLAST	: out std_logic;
		-- TREADY indicates that the slave can accept a transfer in the current cycle.
		M_AXIS_TREADY	: in std_logic
	);
end AXIS_Peripheral_v2_0_M00_AXIS;

architecture implementation of AXIS_Peripheral_v2_0_M00_AXIS is
	-- Total number of output data                                              
	--constant NUMBER_OF_OUTPUT_WORDS : integer := 8;                                   

	 -- function called clogb2 that returns an integer which has the   
	 -- value of the ceiling of the log base 2.                              
	function clogb2 (bit_depth : integer) return integer is                  
	 	variable depth  : integer := bit_depth;                               
	 	variable count  : integer := 1;                                       
	 begin                                                                   
	 	 for clogb2 in 1 to bit_depth loop  -- Works for up to 32 bit integers
	      if (bit_depth <= 2) then                                           
	        count := 1;                                                      
	      else                                                               
	        if(depth <= 1) then                                              
	 	       count := count;                                                
	 	     else                                                             
	 	       depth := depth / 2;                                            
	          count := count + 1;                                            
	 	     end if;                                                          
	 	   end if;                                                            
	   end loop;                                                             
	   return(count);        	                                              
	 end;                                                                    
                                                                             
	-- In this example, Depth of FIFO is determined by the greater of                 
	-- the number of input words and output words.                                    
	constant depth : integer := 2048;                               
	                                                                                  
	-- bit_num gives the minimum number of bits needed to address 'depth' size of FIFO
	constant bit_num : integer := clogb2(depth);                                      
	                                                                                  
	-- Define the states of state machine                                             
	-- The control state machine oversees the writing of input streaming data to the FIFO,
	-- and outputs the streaming data from the FIFO                                   
	type state is ( IDLE,        -- This is the initial/idle state                    
	                StART_STREAM,  -- This state initializes the counter, once        
	                                -- the counter reaches C_M_START_COUNT count,     
	                                -- the state machine changes state to SEND_STREAM  
	                SEND_STREAM);  -- In this state the                               
	                             -- stream data is output through M_AXIS_TDATA        
	-- State variable                                                                 
	signal  mst_exec_state : state;                                                   
	-- Example design FIFO read pointer                                               
	--signal ramp_pointer : integer range 0 to bit_num-1;
	signal ramp_pointer : integer; 
	signal saw_pointer : integer; 
	signal bit_pointer : integer;                               
	
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
	signal stream_data_out	: std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
	signal tx_en	: std_logic;

	signal nbr_of_packets_s : 	std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
	signal content_packet_s : 	std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
	signal mode_s :				std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
begin
	-- I/O Connections assignments

	M_AXIS_TVALID	<= axis_tvalid_delay;
	M_AXIS_TDATA	<= stream_data_out;
	M_AXIS_TLAST	<= axis_tlast_delay;
	M_AXIS_TSTRB	<= (others => '1');


	-- Control state machine implementation                                               
	process(M_AXIS_ACLK)                                                                        
	begin                                                                                       
	  if (rising_edge (M_AXIS_ACLK)) then                                                       
	    if(M_AXIS_ARESETN = '0') then                                                           
	      -- Synchronous reset (active low)                                                     
	      mst_exec_state      <= IDLE;                                                          
	      ramp_pointer <= 0;
	      
	     else                                                                                    
	      case (mst_exec_state) is                                                              
	        when IDLE     =>                                                                    
	          -- The slave starts accepting tdata when                                          
	          -- there tvalid is asserted to mark the                                           
	          -- presence of valid streaming data                                               
	          --if (count = "0")then                                                            
	            if((S_START_STREAMING = '1') and (unsigned(S_NBR_PACKETS) /= 0)) then
	            	mst_exec_state <= START_STREAM;
	            	nbr_of_packets_s <= S_NBR_PACKETS;
	            	content_packet_s <= S_CONTENT_1;
	            	mode_s <= S_MODE;
	            	ramp_pointer <= 0;
	            	saw_pointer <= 0;
	            	bit_pointer <= 0;
	            else
	            	mst_exec_state <= IDLE; 
	            end if;                                               
	          --else                                                                              
	          --  mst_exec_state <= IDLE;                                                         
	          --end if;                                                                                                                                                  
	        when START_STREAM =>
	        	if (tx_en = '1')then
	        		ramp_pointer <= ramp_pointer + 1;
	        		case (mode_s) is
	        			when C_RAMP_WAVE_MODE =>
	        				-- Nop --	        				
	        			when C_SAW_WAVE_MODE =>
	        				saw_pointer <= (ramp_pointer+1) rem 5;	-- Counter the effect of ramp_pointer being updated 1 clk before.
	        			when C_BIT_WAVE_MODE =>
	        				bit_pointer <= (ramp_pointer+1) rem 2;
	        			when others =>
	        				--nop
	        		end case;		
	        		mst_exec_state <= SEND_STREAM;
	        	end if;
	                                                                                       
	        when SEND_STREAM =>                                                                
			-- The example design streaming master functionality starts                       
			-- when the master drives output tdata from the FIFO and the slave                
			-- has finished storing the S_AXIS_TDATA                                          
				if (ramp_pointer <= to_integer(unsigned(nbr_of_packets_s))-1) then                         
					if (tx_en = '1') then                                                    
					-- read pointer is incremented after every read from the FIFO          
					-- when FIFO read signal is enabled.                                   
					ramp_pointer <= ramp_pointer + 1;
	        		case (mode_s) is
	        			when C_RAMP_WAVE_MODE =>
	        				-- Nop --	        				
	        			when C_SAW_WAVE_MODE =>
	        				saw_pointer <= (ramp_pointer+1) rem 5;	-- Counter the effect of ramp_pointer being updated 1 clk before.
	        			when C_BIT_WAVE_MODE =>
	        				bit_pointer <= (ramp_pointer+1) rem 2;
	        			when others =>
	        				--nop
	        		end case;	                                      
																		 
					end if;                                                                  
				elsif (ramp_pointer = to_integer(unsigned(nbr_of_packets_s))) then                         
					-- tx_done is asserted when NUMBER_OF_OUTPUT_WORDS numbers of streaming data
					-- has been out. 
					ramp_pointer <= 0;
					saw_pointer <= 0;
	            	bit_pointer <= 0;
					
					nbr_of_packets_s <= (others => '0');
					content_packet_s <= (others => '0');                                                      
					mst_exec_state <= IDLE;                                                          
				end  if;                                                                               
																				
	        when others    =>                                                                   
	          mst_exec_state <= IDLE;                                                           
	                                                                                            
	      end case;                                                                             
	    end if;                                                                                 
	  end if;                                                                                   
	end process;                                                                                


	--tvalid generation
	--axis_tvalid is asserted when the control state machine's state is SEND_STREAM and
	--number of output streaming data is less than the NUMBER_OF_OUTPUT_WORDS.
	axis_tvalid <= '1' when (((mst_exec_state = START_STREAM) or (mst_exec_state = SEND_STREAM)) and (ramp_pointer < to_integer(unsigned(nbr_of_packets_s)))) else '0';
	                                                                                               
	-- AXI tlast generation                                                                        
	-- axis_tlast is asserted number of output streaming data is NUMBER_OF_OUTPUT_WORDS-1          
	-- (0 to NUMBER_OF_OUTPUT_WORDS-1)                                                             
	axis_tlast <= '1' when (ramp_pointer = to_integer(unsigned(nbr_of_packets_s))-1) else '0';                     
	                                                                                               
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
	                                                                                
	-- FIFO Implementation                                                          
	                                                                                
	-- Streaming output data is read from FIFO                                      
	process(M_AXIS_ACLK)              
	begin                                                                         
		if (rising_edge (M_AXIS_ACLK)) then                                         
			if(M_AXIS_ARESETN = '0') then                                             
				--stream_data_out <= std_logic_vector(to_unsigned(sig_one,C_M_AXIS_TDATA_WIDTH));  
				stream_data_out <= (others => '0'); 
			elsif (tx_en = '1') then -- && M_AXIS_TSTRB(byte_index)                   
				--stream_data_out <= std_logic_vector( to_unsigned(ramp_pointer,C_M_AXIS_TDATA_WIDTH) + to_unsigned(sig_one,C_M_AXIS_TDATA_WIDTH));
				stream_data_out <= std_logic_vector(to_unsigned(ramp_pointer,stream_data_out'length) + unsigned(content_packet_s));
				case (mode_s) is
        			when C_RAMP_WAVE_MODE =>
        				stream_data_out <= std_logic_vector(to_unsigned(ramp_pointer,stream_data_out'length) + unsigned(content_packet_s));	        				
        			when C_SAW_WAVE_MODE =>
        				stream_data_out <= std_logic_vector(to_unsigned(saw_pointer,stream_data_out'length));	
        			when C_BIT_WAVE_MODE =>
        				stream_data_out <= std_logic_vector(to_unsigned(bit_pointer,stream_data_out'length));
        			when others =>
        				stream_data_out <= x"ABCDABCD";	
        		end case;
			end if;                                                                   
		end if;                                                                    
	end process;                                                                 

	-- Add user logic here

	-- User logic ends

end implementation;
