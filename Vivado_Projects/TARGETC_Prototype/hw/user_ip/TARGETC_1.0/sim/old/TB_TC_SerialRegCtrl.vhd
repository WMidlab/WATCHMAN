library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;
use work.TARGETC_pkg.all;

entity TB_TC_SerialRegCtrl is
generic
(
  C_S_AXI_DATA_WIDTH             : integer              := 32;
  C_S_AXI_ADDR_WIDTH             : integer              := 10
);
end TB_TC_SerialRegCtrl;

architecture implementation of TB_TC_SerialRegCtrl is
	
	component TARGETC_v1_0 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface TC_AXI
		C_TC_AXI_DATA_WIDTH	: integer	:= 32;
		C_TC_AXI_ADDR_WIDTH	: integer	:= 10
	);
	port (
		-- Users to add ports here
		SINxo : out  STD_LOGIC;
		SCLKxo : out  STD_LOGIC;
		PCLKxo : out  STD_LOGIC;
		CLKxi : in std_logic;
		eRAMPxo : out std_logic;
		eRegCLRxo : out std_logic;
		-- User ports ends
		-- Do not modify the ports beyond this line

		-- Ports of Axi Slave Bus Interface TC_AXI
		tc_axi_aclk	: in std_logic;
		tc_axi_aresetn	: in std_logic;
		tc_axi_awaddr	: in std_logic_vector(C_TC_AXI_ADDR_WIDTH-1 downto 0);
		tc_axi_awprot	: in std_logic_vector(2 downto 0);
		tc_axi_awvalid	: in std_logic;
		tc_axi_awready	: out std_logic;
		tc_axi_wdata	: in std_logic_vector(C_TC_AXI_DATA_WIDTH-1 downto 0);
		tc_axi_wstrb	: in std_logic_vector((C_TC_AXI_DATA_WIDTH/8)-1 downto 0);
		tc_axi_wvalid	: in std_logic;
		tc_axi_wready	: out std_logic;
		tc_axi_bresp	: out std_logic_vector(1 downto 0);
		tc_axi_bvalid	: out std_logic;
		tc_axi_bready	: in std_logic;
		tc_axi_araddr	: in std_logic_vector(C_TC_AXI_ADDR_WIDTH-1 downto 0);
		tc_axi_arprot	: in std_logic_vector(2 downto 0);
		tc_axi_arvalid	: in std_logic;
		tc_axi_arready	: out std_logic;
		tc_axi_rdata	: out std_logic_vector(C_TC_AXI_DATA_WIDTH-1 downto 0);
		tc_axi_rresp	: out std_logic_vector(1 downto 0);
		tc_axi_rvalid	: out std_logic;
		tc_axi_rready	: in std_logic
	);
	end component TARGETC_v1_0;

	
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
	signal sinxobs	: std_logic;
	signal sclkxobs : std_logic;
	signal pclkxobs : std_logic;
	signal eRAMPxobs : std_logic;
	signal eRegCLRxobs : std_logic;
	
    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';
	
	constant CLK_PERIOD : time := 10 ns;
begin


	DUT : TARGETC_v1_0
	generic map (
		C_TC_AXI_DATA_WIDTH	=> C_S_AXI_DATA_WIDTH,
		C_TC_AXI_ADDR_WIDTH	=> C_S_AXI_ADDR_WIDTH
	)
	port map (
		sinxo => sinxobs,
		sclkxo => sclkxobs,
		pclkxo => pclkxobs,
		clkxi => s00_axi_aclk,
		eRAMPxo => eRAMPxobs,
		eRegCLRxo => eRegCLRxobs,
				
		tc_axi_ACLK	=> s00_axi_aclk,
		tc_axi_ARESETN	=> s00_axi_aresetn,
		tc_axi_AWADDR	=> s00_axi_awaddr,
		tc_axi_AWPROT	=> s00_axi_awprot,
		tc_axi_AWVALID	=> s00_axi_awvalid,
		tc_axi_AWREADY	=> s00_axi_awready,
		tc_axi_WDATA	=> s00_axi_wdata,
		tc_axi_WSTRB	=> s00_axi_wstrb,
		tc_axi_WVALID	=> s00_axi_wvalid,
		tc_axi_WREADY	=> s00_axi_wready,
		tc_axi_BRESP	=> s00_axi_bresp,
		tc_axi_BVALID	=> s00_axi_bvalid,
		tc_axi_BREADY	=> s00_axi_bready,
		tc_axi_ARADDR	=> s00_axi_araddr,
		tc_axi_ARPROT	=> s00_axi_arprot,
		tc_axi_ARVALID	=> s00_axi_arvalid,
		tc_axi_ARREADY	=> s00_axi_arready,
		tc_axi_RDATA	=> s00_axi_rdata,
		tc_axi_RRESP	=> s00_axi_rresp,
		tc_axi_RVALID	=> s00_axi_rvalid,
		tc_axi_RREADY	=> s00_axi_rready
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
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_SBBIAS_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA <=  (others =>'0');
		s00_axi_WDATA(11 downto 0)<=  "110110110110";
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		
		-- Writing the address of register
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_ADDR_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<=std_logic_vector(to_unsigned(TC_SBBIAS_REG, s00_axi_WDATA'length));
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<=x"00000001";
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		
		wait for 100 ns;
		
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<=x"00000000";
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		
	--	s00_axi_ARADDR<=std_logic_vector(to_unsigned(C_CONTROL_REG*4, s00_axi_AWADDR'length));
	--	readIt<='1';                --Start AXI Write to Slave
	--	wait for 1 ns; readIt<='0'; --Clear Start Send Flag
	--	wait until s00_axi_BVALID = '1';
	--	wait until s00_axi_BVALID = '0';  --AXI Write finished
		
		wait for 4 us;

--		s00_axi_ARADDR<=std_logic_vector(to_unsigned(C_CONTROL_REG*4, s00_axi_AWADDR'length));
--		readIt<='1';                --Start AXI Write to Slave
--		wait for 1 ns; readIt<='0'; --Clear Start Send Flag
--		wait until s00_axi_BVALID = '1';
--		wait until s00_axi_BVALID = '0';  --AXI Write finished
		
		wait for 1 us;
		
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<=x"0000001C";
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		
		wait for 1 us;
		
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<=x"00000000";
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		
		wait for 4 us;
		
		
		

		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_TPG_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<=x"00000155";
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';		
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		
		-- Writing the address of register
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_ADDR_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<=std_logic_vector(to_unsigned(TC_TPG_REG, s00_axi_WDATA'length));
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<=x"00000001";
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		
		wait for 100 ns;
		
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<=x"00000000";
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		
		wait for 10 us;    	
    	simulation_end_s <= '1';
    	wait;
	end process;
	  
	  
	  
end implementation;
