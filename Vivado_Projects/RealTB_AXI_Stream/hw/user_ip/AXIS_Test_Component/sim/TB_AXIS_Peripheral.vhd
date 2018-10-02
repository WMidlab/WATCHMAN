library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;
 
entity TB_AXIS_Peripheral is
generic
(
  C_S_AXI_DATA_WIDTH             : integer              := 32;
  C_S_AXI_ADDR_WIDTH             : integer              := 6
);
end TB_AXIS_Peripheral;

architecture implementation of TB_AXIS_Peripheral is
	
	component AXIS_Peripheral_v1_0_S00_AXI is
	generic (
		-- Users to add parameters here
        
		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- Width of S_AXI data bus
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		-- Width of S_AXI address bus
		C_S_AXI_ADDR_WIDTH	: integer	:= 6
	);
	port (
	
	   -- Shared Signal AXI-Stream and AXI-Lite
	   	S_START_STREAMING : out std_logic;
        S_NBR_PACKETS : 	out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_CONTENT_1:	 	out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	
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
	end component AXIS_Peripheral_v1_0_S00_AXI;

	component AXIS_Peripheral_v1_0_M00_AXIS is
		generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
		S_START_STREAMING : in std_logic;
		S_NBR_PACKETS : 	in std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		S_CONTENT_1:	 	in std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component AXIS_Peripheral_v1_0_M00_AXIS;
	
	signal s00_axi_ACLK                     :  std_logic;
    signal s00_axi_ARESETN                  :  std_logic;
    signal s00_axi_AWADDR                   :  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    signal s00_axi_AWVALID                  :  std_logic;
    signal s00_axi_WDATA                    :  std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal s00_axi_WSTRB                    :  std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
    signal s00_axi_WVALID                   :  std_logic;
    signal s00_axi_BREADY                   :  std_logic;
    signal s00_axi_ARADDR                   :  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    signal s00_axi_ARVALID                  :  std_logic;
    signal s00_axi_RREADY                   :  std_logic;
    signal s00_axi_ARREADY                  : std_logic;
    signal s00_axi_RDATA                    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal s00_axi_RRESP                    : std_logic_vector(1 downto 0);
    signal s00_axi_RVALID                   : std_logic;
    signal s00_axi_WREADY                   : std_logic;
    signal s00_axi_BRESP                    : std_logic_vector(1 downto 0);
    signal s00_axi_BVALID                   : std_logic;
    signal s00_axi_AWREADY                  : std_logic;
    signal s00_axi_AWPROT                   : std_logic_vector(2 downto 0);
    signal s00_axi_ARPROT                   : std_logic_vector(2 downto 0);

	signal m00_axis_tready					: std_logic;
	
    signal sendIt : std_logic := '0';
    signal readIt : std_logic := '0';
    
    --Signals
	signal START_STREAMING :  std_logic;
	signal NBR_PACKETS : 	std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal CONTENT_1:		std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    
    signal simulation_end_s : std_logic := '0';
	
	constant CLK_PERIOD : time := 10 ns;
begin


	AXIS_Peripheral_v1_0_S00_AXI_inst : AXIS_Peripheral_v1_0_S00_AXI
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_S_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S_AXI_ADDR_WIDTH
	)
	port map (
		S_START_STREAMING => START_STREAMING,
		S_NBR_PACKETS => NBR_PACKETS,
		S_CONTENT_1 => CONTENT_1,
	    S_AXI_INTR  => open,
		S_AXI_ACLK	=> s00_axi_aclk,
		S_AXI_ARESETN	=> s00_axi_aresetn,
		S_AXI_AWADDR	=> s00_axi_awaddr,
		S_AXI_AWPROT	=> s00_axi_awprot,
		S_AXI_AWVALID	=> s00_axi_awvalid,
		S_AXI_AWREADY	=> s00_axi_awready,
		S_AXI_WDATA	=> s00_axi_wdata,
		S_AXI_WSTRB	=> s00_axi_wstrb,
		S_AXI_WVALID	=> s00_axi_wvalid,
		S_AXI_WREADY	=> s00_axi_wready,
		S_AXI_BRESP	=> s00_axi_bresp,
		S_AXI_BVALID	=> s00_axi_bvalid,
		S_AXI_BREADY	=> s00_axi_bready,
		S_AXI_ARADDR	=> s00_axi_araddr,
		S_AXI_ARPROT	=> s00_axi_arprot,
		S_AXI_ARVALID	=> s00_axi_arvalid,
		S_AXI_ARREADY	=> s00_axi_arready,
		S_AXI_RDATA	=> s00_axi_rdata,
		S_AXI_RRESP	=> s00_axi_rresp,
		S_AXI_RVALID	=> s00_axi_rvalid,
		S_AXI_RREADY	=> s00_axi_rready
	);

	-- Instantiation of Axi Bus Interface M00_AXIS
	AXIS_Peripheral_v1_0_M00_AXIS_inst : AXIS_Peripheral_v1_0_M00_AXIS
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> 32,
		C_M_START_COUNT	=> 32
	)
	port map (
		S_START_STREAMING => START_STREAMING,
		S_NBR_PACKETS => NBR_PACKETS,
		S_CONTENT_1 => CONTENT_1,
		M_AXIS_ACLK	=> s00_axi_aclk,
		M_AXIS_ARESETN	=> s00_axi_aresetn,
		M_AXIS_TVALID	=> open,
		M_AXIS_TDATA	=> open,
		M_AXIS_TSTRB	=> open,
		M_AXIS_TLAST	=> open,
		M_AXIS_TREADY	=> m00_axis_tready
	);
	
	-- Clock generation
    clock_generator(s00_axi_ACLK,simulation_end_s, CLK_PERIOD);
	
	-- Send AXI
	send : PROCESS
	 BEGIN
		s00_axi_AWVALID<='0';
		s00_axi_WVALID<='0';
		s00_axi_BREADY<='0';
		--m00_axis_tready<= '1';
		
		loop
		    wait until sendIt = '1';
		    wait until s00_axi_ACLK= '0';
		        s00_axi_AWVALID<='1';
		        s00_axi_WVALID<='1';
		    wait until (s00_axi_AWREADY and s00_axi_WREADY) = '1';  --Client ready to read address/data        
		        s00_axi_BREADY<='1';
		    wait until s00_axi_BVALID = '1';  -- Write result valid
		        assert s00_axi_BRESP = "00" report "AXI data not written" severity failure;
		        s00_axi_AWVALID<='0';
		        s00_axi_WVALID<='0';
		        s00_axi_BREADY<='1';
		    wait until s00_axi_BVALID = '0';  -- All finished
		        s00_axi_BREADY<='0';
		end loop;
	 END PROCESS send;
	
	-- Read AXI
	read : PROCESS
	  BEGIN
		s00_axi_ARVALID<='0';
		s00_axi_RREADY<='0';
		 loop
		     wait until readIt = '1';
		     wait until s00_axi_ACLK= '0';
		         s00_axi_ARVALID<='1';
		         s00_axi_RREADY<='1';
		     wait until (s00_axi_RVALID and s00_axi_ARREADY) = '1';  --Client provided data
		        assert s00_axi_RRESP = "00" report "AXI data not written" severity failure;
		         s00_axi_ARVALID<='0';
		        s00_axi_RREADY<='0';
		 end loop;
	  END PROCESS read;
	  
	  
	------------------------------------------------------------------------------------------
	-- TESTBENCH -----------------------------------------------------------------------------
	------------------------------------------------------------------------------------------
	tb : process
	begin
		simulation_end_s <= '0';
		s00_axi_aresetn <= '0';
		wait for 100 ns;
		s00_axi_aresetn <= '1';
		sendIt <= '0';
		readIt <= '0';
		m00_axis_tready <= '1';
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(0, s00_axi_AWADDR'length));
		s00_axi_WDATA<=x"00000000";
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(4, s00_axi_AWADDR'length));
		s00_axi_WDATA<=x"00000020";
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(8, s00_axi_AWADDR'length));
		s00_axi_WDATA<=x"0000000A";
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		
		wait for 200 ns;
		
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(0, s00_axi_AWADDR'length));
		s00_axi_WDATA<=x"00000001";
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(0, s00_axi_AWADDR'length));
		s00_axi_WDATA<=x"00000000";
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		
		wait for 1000 ns;
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(0, s00_axi_AWADDR'length));
		s00_axi_WDATA<=x"00000000";
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		
		wait for 1000 ns;
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(0, s00_axi_AWADDR'length));
		s00_axi_WDATA<=x"00000001";
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		
		wait for 20 ns;
		m00_axis_tready <= '0';
		wait for 20 ns;
		m00_axis_tready <= '1';
    	wait for 1000 ns;
    	
    	simulation_end_s <= '1';
    	wait;
	end process;
	  
	  
	  
end implementation;
