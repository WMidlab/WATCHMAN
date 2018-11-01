library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.TARGETC_pkg.all;
use work.Register_pkg.all;
use work.AXI_Lite_pkg.all;

entity TC_AXIInterface is
	port (
	-- TARGET C Ports for control and functi
		
		AxiBusIn:		in AXI_Lite_Inputs;
		AxiBusOut:		out AXI_Lite_Outputs;
		
		TCReg:			inout slv_array(0 to TC_REGISTER_NUMBER)
			
	);
end TC_AXIInterface;

architecture arch_imp of TC_AXIInterface is

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

    
begin
	-- I/O Connections assignments

	AxiBusOut.AWREADY	<= axi_awready;
	AxiBusOut.WREADY	<= axi_wready;
	AxiBusOut.BRESP	<= axi_bresp;
	AxiBusOut.BVALID	<= axi_bvalid;
	AxiBusOut.ARREADY	<= axi_arready;
	AxiBusOut.RDATA	<= axi_rdata;
	AxiBusOut.RRESP	<= axi_rresp;
	AxiBusOut.RVALID	<= axi_rvalid;
	AxiBusOut.INTR		<= '0';	-- Interrupt not used

	process (AxiBusIn.ACLK)
	begin
	  if rising_edge(AxiBusIn.ACLK) then 
	    if AxiBusIn.ARESETN = '0' then
	      axi_awready <= '0';
	      aw_en <= '1';
	    else
	      if (axi_awready = '0' and AxiBusIn.AWVALID = '1' and AxiBusIn.WVALID = '1' and aw_en = '1') then
	        -- slave is ready to accept write address when
	        -- there is a valid write address and write data
	        -- on the write address and data bus. This design 
	        -- expects no outstanding transactions. 
	        axi_awready <= '1';
	        elsif (AxiBusIn.BREADY = '1' and axi_bvalid = '1') then
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

	process (AxiBusIn.ACLK)
	begin
	  if rising_edge(AxiBusIn.ACLK) then 
	    if AxiBusIn.ARESETN = '0' then
	      axi_awaddr <= (others => '0');
	    else
	      if (axi_awready = '0' and AxiBusIn.AWVALID = '1' and AxiBusIn.WVALID = '1' and aw_en = '1') then
	        -- Write Address latching
	        axi_awaddr <= AxiBusIn.AWADDR;
	      end if;
	    end if;
	  end if;                   
	end process; 

	-- Implement axi_wready generation
	-- axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	-- S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	-- de-asserted when reset is low. 

	process (AxiBusIn.ACLK)
	begin
	  if rising_edge(AxiBusIn.ACLK) then 
	    if AxiBusIn.ARESETN = '0' then
	      axi_wready <= '0';
	    else
	      if (axi_wready = '0' and AxiBusIn.WVALID = '1' and AxiBusIn.AWVALID = '1' and aw_en = '1') then
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
	slv_reg_wren <= axi_wready and AxiBusIn.WVALID and axi_awready and AxiBusIn.AWVALID ;

	process (AxiBusIn.ACLK)
	variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0); 
	begin
	  if rising_edge(AxiBusIn.ACLK) then 
	    if AxiBusIn.ARESETN = '0' then
	       
	       for index in 0 to TC_REGISTER_NUMBER loop
	       	TCReg(index) <= (others => '0');
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
	     			when TC_STATUS_REG =>
	     				-- Read Only
					when TC_eDO_CH0_REG =>
						-- Read Only
					when TC_eDO_CH1_REG =>
						-- Read Only
					when TC_eDO_CH2_REG =>
						-- Read Only
					when TC_eDO_CH3_REG =>
						-- Read Only
					
					when TC_eDO_CH4_REG =>
						-- Read Only
					when TC_eDO_CH5_REG =>
						-- Read Only
					when TC_eDO_CH6_REG =>
						-- Read Only
					when TC_eDO_CH7_REG =>
						-- Read Only
					
					when TC_eDO_CH8_REG =>
						-- Read Only
					when TC_eDO_CH9_REG =>
						-- Read Only
					when TC_eDO_CH10_REG =>
						-- Read Only
					when TC_eDO_CH11_REG =>
						-- Read Only
					
					when TC_eDO_CH12_REG =>
						-- Read Only
					when TC_eDO_CH13_REG =>
						-- Read Only
					when TC_eDO_CH14_REG =>
						-- Read Only
					when TC_eDO_CH15_REG =>
						-- Read Only

					when others =>
						for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
							if ( AxiBusIn.WSTRB(byte_index) = '1' ) then
								-- Respective byte enables are asserted as per write strobes  
								TCReg(to_integer(unsigned(loc_addr))) (byte_index*8+7 downto byte_index*8) <= AxiBusIn.WDATA(byte_index*8+7 downto byte_index*8);
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

	process (AxiBusIn.ACLK)
	begin
	  if rising_edge(AxiBusIn.ACLK) then 
	    if AxiBusIn.ARESETN = '0' then
	      axi_bvalid  <= '0';
	      axi_bresp   <= "00"; --need to work more on the responses
	    else
	      if (axi_awready = '1' and AxiBusIn.AWVALID = '1' and axi_wready = '1' and AxiBusIn.WVALID = '1' and axi_bvalid = '0'  ) then
	        axi_bvalid <= '1';
	        axi_bresp  <= "00"; 
	      elsif (AxiBusIn.BREADY = '1' and axi_bvalid = '1') then   --check if bready is asserted while bvalid is high)
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

	process (AxiBusIn.ACLK)
	begin
	  if rising_edge(AxiBusIn.ACLK) then 
	    if AxiBusIn.ARESETN = '0' then
	      axi_arready <= '0';
	      axi_araddr  <= (others => '1');
	    else
	      if (axi_arready = '0' and AxiBusIn.ARVALID = '1') then
	        -- indicates that the slave has acceped the valid read address
	        axi_arready <= '1';
	        -- Read Address latching 
	        axi_araddr  <= AxiBusIn.ARADDR;           
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
	process (AxiBusIn.ACLK)
	begin
	  if rising_edge(AxiBusIn.ACLK) then
	    if AxiBusIn.ARESETN = '0' then
	      axi_rvalid <= '0';
	      axi_rresp  <= "00";
	    else
	      if (axi_arready = '1' and AxiBusIn.ARVALID = '1' and axi_rvalid = '0') then
	        -- Valid read data is available at the read data bus
	        axi_rvalid <= '1';
	        axi_rresp  <= "00"; -- 'OKAY' response
	      elsif (axi_rvalid = '1' and AxiBusIn.RREADY = '1') then
	        -- Read data is accepted by the master
	        axi_rvalid <= '0';
	      end if;            
	    end if;
	  end if;
	end process;

	-- Implement memory mapped register select and read logic generation
	-- Slave register read enable is asserted when valid address is available
	-- and the slave is ready to accept the read address.
	slv_reg_rden <= axi_arready and AxiBusIn.ARVALID and (not axi_rvalid) ;

	process (axi_araddr, AxiBusIn.ARESETN, slv_reg_rden)
	variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0);
	begin
	    -- Address decoding for reading registers
	    loc_addr := axi_araddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
	    if(to_integer(unsigned(loc_addr)) < (TC_REGISTER_NUMBER+1))then
	    	reg_data_out <= TCReg(to_integer(unsigned(loc_addr)));
	    else
	    	reg_data_out <= (others => '0');
	    end if;
	end process; 

	-- Output register or memory read data
	process( AxiBusIn.ACLK ) is
	begin
	  if (rising_edge (AxiBusIn.ACLK)) then
	    if ( AxiBusIn.ARESETN = '0' ) then
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
    
    
end arch_imp;
