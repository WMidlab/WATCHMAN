library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.TARGETC_pkg.all;
use work.Register_pkg.all;

entity TC_AXI_RegMAP is
	generic (
		-- Users to add parameters here
        
		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- Width of S_AXI data bus
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		-- Width of S_AXI address bus
		C_S_AXI_ADDR_WIDTH	: integer	:= 10
	);
	port (
	
	   -- Shared Signal AXI-Stream and AXI-Lite
	   	S_START_WRITE : out std_logic;
		S_TC_BUS_IN : 		out std_logic_vector(18 downto 0);
		S_TC_BUS_OUT:		in std_logic_vector(18 downto 0);
		
		S_SS_INCR:		out std_logic;
		--S_SS_TPG:		out std_logic;
		
		eDO_BUS :		in eDO_BUS_TYPE;
		
		S_TC_WR_BUSY:	in std_logic;
		S_PCLK : out std_logic;
		S_SCLK : out std_logic;
		S_SIN : out std_logic;
		S_eRAMP : out std_logic;
    	S_eRegCLR : out std_logic; 
		S_eSmplSl_Any : out std_logic;
		-- Users to add ports here
        S_AXI_INTR : out std_logic;
		-- User ports ends
		-- Do not modify the ports beyond this line

		-- Global Clock Signal
		S_AXI_ACLK	: in std_logic;
		-- Global Reset Signal. This Signal is Active LOW
		S_AXI_ARESETN	: in std_logic;
		-- Write address (issued by master, acceped by Slave)
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		-- Write channel Protection type. This signal indicates the
    		-- privilege and security level of the transaction, and whether
    		-- the transaction is a data access or an instruction access.
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		-- Write address valid. This signal indicates that the master signaling
    		-- valid write address and control information.
		S_AXI_AWVALID	: in std_logic;
		-- Write address ready. This signal indicates that the slave is ready
    		-- to accept an address and associated control signals.
		S_AXI_AWREADY	: out std_logic;
		-- Write data (issued by master, acceped by Slave) 
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		-- Write strobes. This signal indicates which byte lanes hold
    		-- valid data. There is one write strobe bit for each eight
    		-- bits of the write data bus.    
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		-- Write valid. This signal indicates that valid write
    		-- data and strobes are available.
		S_AXI_WVALID	: in std_logic;
		-- Write ready. This signal indicates that the slave
    		-- can accept the write data.
		S_AXI_WREADY	: out std_logic;
		-- Write response. This signal indicates the status
    		-- of the write transaction.
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		-- Write response valid. This signal indicates that the channel
    		-- is signaling a valid write response.
		S_AXI_BVALID	: out std_logic;
		-- Response ready. This signal indicates that the master
    		-- can accept a write response.
		S_AXI_BREADY	: in std_logic;
		-- Read address (issued by master, acceped by Slave)
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		-- Protection type. This signal indicates the privilege
    		-- and security level of the transaction, and whether the
    		-- transaction is a data access or an instruction access.
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		-- Read address valid. This signal indicates that the channel
    		-- is signaling valid read address and control information.
		S_AXI_ARVALID	: in std_logic;
		-- Read address ready. This signal indicates that the slave is
    		-- ready to accept an address and associated control signals.
		S_AXI_ARREADY	: out std_logic;
		-- Read data (issued by slave)
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		-- Read response. This signal indicates the status of the
    		-- read transfer.
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		-- Read valid. This signal indicates that the channel is
    		-- signaling the required read data.
		S_AXI_RVALID	: out std_logic;
		-- Read ready. This signal indicates that the master can
    		-- accept the read data and response information.
		S_AXI_RREADY	: in std_logic
	);
end TC_AXI_RegMAP;

architecture arch_imp of TC_AXI_RegMAP is

	-- AXI4LITE signals
	signal axi_awaddr	: std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
	signal axi_awready	: std_logic;
	signal axi_wready	: std_logic;
	signal axi_bresp	: std_logic_vector(1 downto 0);
	signal axi_bvalid	: std_logic;
	signal axi_araddr	: std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
	signal axi_arready	: std_logic;
	signal axi_rdata	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal axi_rresp	: std_logic_vector(1 downto 0);
	signal axi_rvalid	: std_logic;

	-- Example-specific design signals
	-- local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	-- ADDR_LSB is used for addressing 32/64 bit registers/memories
	-- ADDR_LSB = 2 for 32 bits (n downto 2)
	-- ADDR_LSB = 3 for 64 bits (n downto 3)
	constant ADDR_LSB  : integer := (C_S_AXI_DATA_WIDTH/32)+ 1;
	--constant OPT_MEM_ADDR_BITS : integer := 3;
	constant OPT_MEM_ADDR_BITS : integer := 7; -- For a hundred regsiters
	
	------------------------------------------------
	---- Signals for user logic register space example
	--------------------------------------------------
	---- Number of Slave Registers 10
	
	type slv_array is array (integer range <>) of std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal reg: slv_array(0 to TC_REGISTER_NUMBER);

	signal slv_reg_rden	: std_logic;
	signal slv_reg_wren	: std_logic;
	signal reg_data_out	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal byte_index	: integer;
	signal aw_en	: std_logic;

    -- USER signals
    signal start_write_stm : Pulse_State_Type := IDLE; 
    signal ss_incr_stm : Pulse_State_Type := IDLE; 
    
    signal TC_ADDR_s :	std_logic_vector(6 downto 0);
    signal TC_DATA_s:	std_logic_vector(11 downto 0);
    
begin
	-- I/O Connections assignments

	S_AXI_AWREADY	<= axi_awready;
	S_AXI_WREADY	<= axi_wready;
	S_AXI_BRESP	<= axi_bresp;
	S_AXI_BVALID	<= axi_bvalid;
	S_AXI_ARREADY	<= axi_arready;
	S_AXI_RDATA	<= axi_rdata;
	S_AXI_RRESP	<= axi_rresp;
	S_AXI_RVALID	<= axi_rvalid;


	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_awready <= '0';
	      aw_en <= '1';
	    else
	      if (axi_awready = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1' and aw_en = '1') then
	        -- slave is ready to accept write address when
	        -- there is a valid write address and write data
	        -- on the write address and data bus. This design 
	        -- expects no outstanding transactions. 
	        axi_awready <= '1';
	        elsif (S_AXI_BREADY = '1' and axi_bvalid = '1') then
	            aw_en <= '1';
	        	axi_awready <= '0';
	      else
	        axi_awready <= '0';
	      end if;
	    end if;
	  end if;
	end process;

	-- Implement axi_awaddr latching
	-- This process is used to latch the address when both 
	-- S_AXI_AWVALID and S_AXI_WVALID are valid. 

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_awaddr <= (others => '0');
	    else
	      if (axi_awready = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1' and aw_en = '1') then
	        -- Write Address latching
	        axi_awaddr <= S_AXI_AWADDR;
	      end if;
	    end if;
	  end if;                   
	end process; 

	-- Implement axi_wready generation
	-- axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	-- S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	-- de-asserted when reset is low. 

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_wready <= '0';
	    else
	      if (axi_wready = '0' and S_AXI_WVALID = '1' and S_AXI_AWVALID = '1' and aw_en = '1') then
	          -- slave is ready to accept write data when 
	          -- there is a valid write address and write data
	          -- on the write address and data bus. This design 
	          -- expects no outstanding transactions.           
	          axi_wready <= '1';
	      else
	        axi_wready <= '0';
	      end if;
	    end if;
	  end if;
	end process; 

	-- Implement memory mapped register select and write logic generation
	-- The write data is accepted and written to memory mapped registers when
	-- axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	-- select byte enables of slave registers while writing.
	-- These registers are cleared when reset (active low) is applied.
	-- Slave register write enable is asserted when valid address and data are available
	-- and the slave is ready to accept the write address and write data.
	slv_reg_wren <= axi_wready and S_AXI_WVALID and axi_awready and S_AXI_AWVALID ;

	process (S_AXI_ACLK)
	variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0); 
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	       
	       for index in 0 to 130 loop
	       	reg(index) <= (others => '0');
	       end loop;
	   
	    else
	      loc_addr := axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
	      
	      if (slv_reg_wren = '1') then
--	      		for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
--                	if ( S_AXI_WSTRB(byte_index) = '1' ) then
--                  -- Respective byte enables are asserted as per write strobes  
--                  		if(to_integer(unsigned(loc_addr)) < 100) then
--                  	              
--                  		reg(to_integer(unsigned(loc_addr))) (byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
--                  		end if;
--                  	end if;
--                 end loop;
--           end if;      	
			if(to_integer(unsigned(loc_addr)) < (TC_REGISTER_NUMBER+1)) then     	   		
				case to_integer(unsigned(loc_addr)) is
	     			when TC_CONTROL_REG =>
						for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
							if ( S_AXI_WSTRB(byte_index) = '1' ) then
							-- Respective byte enables are asserted as per write strobes                   
							-- slave registor 0
							case byte_index is
								when 0 =>
									reg(TC_CONTROL_REG)(7 downto 0) <= S_AXI_WDATA(7 downto 2) & S_TC_WR_BUSY & S_AXI_WDATA(0);
								when 1 =>
									reg(TC_CONTROL_REG)(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
								when 2 =>
									reg(TC_CONTROL_REG)(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8); 
								when 3 =>
									reg(TC_CONTROL_REG)(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
								when others =>
									--nop
							end case;

							end if;
						end loop;   

					when others =>
						for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
							if ( S_AXI_WSTRB(byte_index) = '1' ) then
								-- Respective byte enables are asserted as per write strobes  
								reg(to_integer(unsigned(loc_addr))) (byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
							end if;
						end loop;
				end case;
			end if;
			end if;		
	    end if;
	  end if;                   
	end process; 

	-- Implement write response logic generation
	-- The write response and response valid signals are asserted by the slave 
	-- when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	-- This marks the acceptance of address and indicates the status of 
	-- write transaction.

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_bvalid  <= '0';
	      axi_bresp   <= "00"; --need to work more on the responses
	    else
	      if (axi_awready = '1' and S_AXI_AWVALID = '1' and axi_wready = '1' and S_AXI_WVALID = '1' and axi_bvalid = '0'  ) then
	        axi_bvalid <= '1';
	        axi_bresp  <= "00"; 
	      elsif (S_AXI_BREADY = '1' and axi_bvalid = '1') then   --check if bready is asserted while bvalid is high)
	        axi_bvalid <= '0';                                 -- (there is a possibility that bready is always asserted high)
	      end if;
	    end if;
	  end if;                   
	end process; 

	-- Implement axi_arready generation
	-- axi_arready is asserted for one S_AXI_ACLK clock cycle when
	-- S_AXI_ARVALID is asserted. axi_awready is 
	-- de-asserted when reset (active low) is asserted. 
	-- The read address is also latched when S_AXI_ARVALID is 
	-- asserted. axi_araddr is reset to zero on reset assertion.

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_arready <= '0';
	      axi_araddr  <= (others => '1');
	    else
	      if (axi_arready = '0' and S_AXI_ARVALID = '1') then
	        -- indicates that the slave has acceped the valid read address
	        axi_arready <= '1';
	        -- Read Address latching 
	        axi_araddr  <= S_AXI_ARADDR;           
	      else
	        axi_arready <= '0';
	      end if;
	    end if;
	  end if;                   
	end process; 

	-- Implement axi_arvalid generation
	-- axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	-- S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	-- data are available on the axi_rdata bus at this instance. The 
	-- assertion of axi_rvalid marks the validity of read data on the 
	-- bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	-- is deasserted on reset (active low). axi_rresp and axi_rdata are 
	-- cleared to zero on reset (active low).  
	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then
	    if S_AXI_ARESETN = '0' then
	      axi_rvalid <= '0';
	      axi_rresp  <= "00";
	    else
	      if (axi_arready = '1' and S_AXI_ARVALID = '1' and axi_rvalid = '0') then
	        -- Valid read data is available at the read data bus
	        axi_rvalid <= '1';
	        axi_rresp  <= "00"; -- 'OKAY' response
	      elsif (axi_rvalid = '1' and S_AXI_RREADY = '1') then
	        -- Read data is accepted by the master
	        axi_rvalid <= '0';
	      end if;            
	    end if;
	  end if;
	end process;

	-- Implement memory mapped register select and read logic generation
	-- Slave register read enable is asserted when valid address is available
	-- and the slave is ready to accept the read address.
	slv_reg_rden <= axi_arready and S_AXI_ARVALID and (not axi_rvalid) ;

	process (axi_araddr, S_AXI_ARESETN, slv_reg_rden)
	variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0);
	begin
	    -- Address decoding for reading registers
	    loc_addr := axi_araddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
	    if(to_integer(unsigned(loc_addr)) < (TC_REGISTER_NUMBER+1))then
	    	case to_integer(unsigned(loc_addr)) is
	     		when TC_CONTROL_REG =>
	        		reg_data_out <= reg(TC_CONTROL_REG)(31 downto 2) & S_TC_WR_BUSY & reg(TC_CONTROL_REG)(0);
	        	when TC_DATA_OUT_REG =>
	        		reg_data_out <= "0000000000000" & S_TC_BUS_OUT(18 downto 0);
	        	when TC_eDO_CH0_REG =>
	        		reg_data_out <= x"00000" & eDO_BUS.CH0;
	        	when TC_eDO_CH1_REG =>
	        		reg_data_out <= x"10000" & eDO_BUS.CH1;
	        	when TC_eDO_CH2_REG =>
	        		reg_data_out <= x"20000" & eDO_BUS.CH2;
	        	when TC_eDO_CH3_REG =>
	        		reg_data_out <= x"30000" & eDO_BUS.CH3;
	        	when TC_eDO_CH4_REG =>
	        		reg_data_out <= x"40000" & eDO_BUS.CH4;
	        	when TC_eDO_CH5_REG =>
	        		reg_data_out <= x"50000" & eDO_BUS.CH5;
	        	when TC_eDO_CH6_REG =>
	        		reg_data_out <= x"60000" & eDO_BUS.CH6;	
	        	when TC_eDO_CH7_REG =>
	        		reg_data_out <= x"70000" & eDO_BUS.CH7;	
	        	when TC_eDO_CH8_REG =>
	        		reg_data_out <= x"80000" & eDO_BUS.CH8;	
	        	when TC_eDO_CH9_REG =>
	        		reg_data_out <= x"90000" & eDO_BUS.CH9;	
	        	when TC_eDO_CH10_REG =>
	        		reg_data_out <= x"A0000" & eDO_BUS.CH10;	
	        	when TC_eDO_CH11_REG =>
	        		reg_data_out <= x"B0000" & eDO_BUS.CH11;	
	        	when TC_eDO_CH12_REG =>
	        		reg_data_out <= x"C0000" & eDO_BUS.CH12;	
	        	when TC_eDO_CH13_REG =>
	        		reg_data_out <= x"D0000" & eDO_BUS.CH13;	
	        	when TC_eDO_CH14_REG =>
	        		reg_data_out <= x"E0000" & eDO_BUS.CH14;	
	        	when TC_eDO_CH15_REG =>
	        		reg_data_out <= x"F0000" & eDO_BUS.CH15;	
	        	
	     		when others =>
	    			reg_data_out <= reg(to_integer(unsigned(loc_addr)));
	    	end case;
	    else
	    	reg_data_out <= (others => '0');
	    end if;
	end process; 

	-- Output register or memory read data
	process( S_AXI_ACLK ) is
	begin
	  if (rising_edge (S_AXI_ACLK)) then
	    if ( S_AXI_ARESETN = '0' ) then
	      axi_rdata  <= (others => '0');
	    else
	      if (slv_reg_rden = '1') then
	        -- When there is a valid read address (S_AXI_ARVALID) with 
	        -- acceptance of read address by the slave (axi_arready), 
	        -- output the read dada 
	        -- Read address mux
	          axi_rdata <= reg_data_out;     -- register read data
	      end if;   
	    end if;
	  end if;
	end process;

	-- User Application
	
	-- C_CONTROL_REG(START_WRITE)
    process(S_AXI_ACLK) is
    begin
        if (rising_edge(S_AXI_ACLK)) then
             if (S_AXI_ARESETN = '0') then
                 start_write_stm <= IDLE;
             else
                case start_write_stm is
                    when IDLE =>
                        if ((reg(TC_CONTROL_REG) and C_WRITE_MASK) = C_WRITE_MASK) then
                            start_write_stm <= PULSE;    
                        else
                            start_write_stm <= IDLE;
                        end if;
                    when PULSE =>
                        start_write_stm <= RESET;
                    when RESET =>	-- Wait for user PS clear register
                        if ((reg(TC_CONTROL_REG) and C_WRITE_MASK) = C_WRITE_MASK)then
                            start_write_stm <= RESET;    
                        else
                            start_write_stm <= IDLE;
                        end if; 
                   end case;
             end if;
        end if;
    end process;

	-- TC_CONTROL_REG(C_eSS_INCR_BIT)
    process(S_AXI_ACLK) is
    begin
        if (rising_edge(S_AXI_ACLK)) then
             if (S_AXI_ARESETN = '0') then
                 ss_incr_stm <= IDLE;
             else
                case ss_incr_stm is
                    when IDLE =>
                        if ((reg(TC_CONTROL_REG) and C_SS_INCR_MASK) = C_SS_INCR_MASK) then
                            ss_incr_stm <= PULSE;    
                        else
                            ss_incr_stm <= IDLE;
                        end if;
                    when PULSE =>
                        ss_incr_stm <= RESET;
                    when RESET =>	-- Wait for user PS clear register
                        if ((reg(TC_CONTROL_REG) and C_SS_INCR_MASK) = C_SS_INCR_MASK)then
                            ss_incr_stm <= RESET;    
                        else
                            ss_incr_stm <= IDLE;
                        end if; 
                   end case;
             end if;
        end if;
    end process;
    
	-- user logic inputs

	-- User logic Outputs
	S_SS_INCR 		<= '1' when ss_incr_stm = PULSE else '0';
	S_START_WRITE 	<= '1' when start_write_stm = PULSE else '0';
	
	S_TC_BUS_IN <= TC_ADDR_s & TC_DATA_s;
	TC_ADDR_s <= std_logic_vector(to_unsigned(to_integer(unsigned(reg(TC_ADDR_REG))) - 1, TC_ADDR_s'length)); 
	TC_DATA_s <= reg(to_integer(unsigned(reg(TC_ADDR_REG))))(11 downto 0);
    
    S_PCLK <= reg(TC_CONTROL_REG)(C_PCLK_BIT); 
    S_SCLK <= reg(TC_CONTROL_REG)(C_SCLK_BIT);
    S_SIN <= reg(TC_CONTROL_REG)(C_SIN_BIT);
    S_eRAMP <= reg(TC_CONTROL_REG)(C_eRAMP_BIT);
    S_eRegCLR <= reg(TC_CONTROL_REG)(C_eRegCLR_BIT);
    
    --S_SS_TPG <= reg(TC_CONTROL_REG)(C_eSS_TPG_BIT);
    S_eSmplSl_Any <= reg(TC_CONTROL_REG)(C_eSS_TPG_BIT);
    
end arch_imp;
