library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;
use work.TARGETC_pkg.all;
use work.AXI_Lite_pkg.all;

entity TC_FIFO_TB is
end TC_FIFO_TB;

architecture implementation of TC_FIFO_TB is
	

	component TARGETC_IP_Prototype is
		port (
		-- TARGET C Ports for control and function
	
			RefCLK_i :		in std_logic;	-- Clock for the TARGETC SCLK
	
			-- Ports of Axi Slave Bus Interface TC_AXI
			tc_axi_aclk	: in std_logic;
			tc_axi_aresetn	: in std_logic;
			tc_axi_awaddr	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
			tc_axi_awprot	: in std_logic_vector(2 downto 0);
			tc_axi_awvalid	: in std_logic;
			tc_axi_awready	: out std_logic;
			tc_axi_wdata	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
			tc_axi_wstrb	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
			tc_axi_wvalid	: in std_logic;
			tc_axi_wready	: out std_logic;
			tc_axi_bresp	: out std_logic_vector(1 downto 0);
			tc_axi_bvalid	: out std_logic;
			tc_axi_bready	: in std_logic;
			tc_axi_araddr	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
			tc_axi_arprot	: in std_logic_vector(2 downto 0);
			tc_axi_arvalid	: in std_logic;
			tc_axi_arready	: out std_logic;
			tc_axi_rdata	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
			tc_axi_rresp	: out std_logic_vector(1 downto 0);
			tc_axi_rvalid	: out std_logic;
			tc_axi_rready	: in std_logic;	
		
		-- TARGET C I/Os
		
			SIN : 			out	STD_LOGIC;		-- Pin#35
			SCLK :	 		out	STD_LOGIC;		-- Pin#36
			PCLK :	 		out	STD_LOGIC;		-- Pin#37
			SHOUT:			in 	std_logic;		-- Pin#38
		
			HSCLK_P:		out std_logic;		-- Pin#43
			HSCLK_N:		out std_logic;		-- Pin#44
		
			WR_RS_S0:		out	std_logic;
			WR_RS_S1:		out	std_logic;
			WR_CS_S0:		out	std_logic;
			WR_CS_S1:		out	std_logic;
			WR_CS_S2:		out	std_logic;
			WR_CS_S3:		out	std_logic;
			WR_CS_S4:		out	std_logic;
			WR_CS_S5:		out	std_logic;
			
			GCC_RESET:		out	std_logic;		-- Pin#56
		
			WL_CLK_P:		out std_logic;		-- Pin#57
			WL_CLK_N:		out std_logic;		-- Pin#58
		
			RDAD_CLK:		out	std_logic;		-- Pin#61
			RDAD_SIN:		out	std_logic;		-- Pin#62
			RDAD_DIR:		out	std_logic;		-- Pin#63
		
			SAMPLESEL_ANY:	out	std_logic;		-- Pin#66
		
			DO: 			in 	std_logic_vector(15 downto 0);	--Pin#69-70-71-72-73-74-75-76-84-85-86-87-88-89-90-91
		
			SS_INCR:		out	std_logic;		-- Pin#79
		
			DOE:			out	std_logic;		-- Pin#80
		
			DONE:			in	std_logic;		-- Pin#94
		
			SS_RESET:		out	std_logic;		-- Pin#95
		
			REGCLR: 		out	std_logic;		-- Pin#99
		
			--mDOE:			in	std_logic;		-- Pin#100
		
			SS_LD_SIN:		out	std_logic;		-- Pin#103
			SS_LD_DIR:		out	std_logic;		-- Pin#104
				
			RAMP:			out	std_logic;		-- Pin#108
		
			SSTIN_P:			out std_logic;		-- Pin#125 		
			SSTIN_N:			out std_logic;		-- Pin#126 	
			
			MONTIMING_P:	in	std_logic;		-- Pin#118		
			MONTIMING_N:	in	std_logic;		-- Pin#117 	
		
		-- FIFO
			FIFOresponse:	in	std_logic;
			CH0 :			out	std_logic_vector(11 downto 0);
			CH1 :			out	std_logic_vector(11 downto 0);
			CH2 :			out	std_logic_vector(11 downto 0);
			CH3 :			out	std_logic_vector(11 downto 0);
		
			CH4 :			out	std_logic_vector(11 downto 0);
			CH5 :			out	std_logic_vector(11 downto 0);
			CH6 :			out	std_logic_vector(11 downto 0);
			CH7 :			out	std_logic_vector(11 downto 0);
		
			CH8 :			out	std_logic_vector(11 downto 0);
			CH9 :			out	std_logic_vector(11 downto 0);
			CH10 :			out	std_logic_vector(11 downto 0);
			CH11 :			out	std_logic_vector(11 downto 0);
		
			CH12 :			out	std_logic_vector(11 downto 0);
			CH13 :			out	std_logic_vector(11 downto 0);
			CH14 :			out	std_logic_vector(11 downto 0);
			CH15 :			out	std_logic_vector(11 downto 0);
			SSvalid:		out std_logic;
		
		-- DEBUG SIGNALS
			SSVALID_INTR:	out	std_logic;
			HSCLK:			out std_logic;
			SSTIN:			out	std_logic;		
			MONTIMING:		out std_logic;
			RAMP_CNT:		out std_logic	
		);
	end component TARGETC_IP_Prototype;
	
	component FifoManager is
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
	end component FifoManager;

	
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
	signal SCLK_obs:	std_logic;
	signal SHOUT_sti:	std_logic := '0';		-- Pin#38

	signal DO_sti: 		std_logic_vector(15 downto 0);	--Pin#69-70-71-72-73-74-75-76-84-85-86-87-88-89-90-91

	signal DONE_sti:	std_logic;		-- Pin#94

	
    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';
	
	constant CLK_PERIOD : time := 10 ns;
	
	signal busy: std_logic := '0';
	signal valid: std_logic := '0';
	
	type state_stm is (IDLE,OK,CLEAR);
	signal stm2 : state_stm := IDLE;
	signal stm1 : state_stm := IDLE;
	
	signal DO_flg : std_logic := '0';
	signal hsclk_obs : std_logic;
	
	signal montiming_p: std_logic;
	signal montiming_n: std_logic;
	
	signal FIFOData_intl: eDO_BUS_TYPE;
	signal FIFOresponse_intl : std_logic;
	signal SSValid_intl:	std_logic;
	
	signal FIFOvalid_intl: std_logic;
	signal Streamready_intl : std_logic;
	signal dataout_intl : std_logic_vector(31 downto 0);
begin


	DUT : TARGETC_IP_Prototype
	port map (
		
		RefCLK_i => s00_axi_aclk,
				
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
		tc_axi_RREADY	=> s00_axi_rready,
		
		SIN			=> open,		-- Pin#35
		SCLK			=> SCLK_obs,	-- Pin#36
		PCLK			=> open,	-- Pin#37
		SHOUT			=> SHOUT_sti,	-- Pin#38
	
		HSCLK_P			=> hsclk_obs,		-- Pin#43
		HSCLK_N			=> open,		-- Pin#44
	
		WR_RS_S0		=> open,	-- Pin#46 to Pin#47
		WR_RS_S1		=> open,	-- Pin#46 to Pin#47
		WR_CS_S0		=> open,	-- Pin#48-49-50-51-54-55
		WR_CS_S1		=> open,	-- Pin#48-49-50-51-54-55
		WR_CS_S2		=> open,	-- Pin#48-49-50-51-54-55
		WR_CS_S3		=> open,	-- Pin#48-49-50-51-54-55
		WR_CS_S4		=> open,	-- Pin#48-49-50-51-54-55
		WR_CS_S5		=> open,	-- Pin#48-49-50-51-54-55
		
		GCC_RESET		=> open,	-- Pin#56
	
		WL_CLK_P			=> open,	-- Pin#57
		WL_CLK_N			=> open,		-- Pin#58
	
		RDAD_CLK			=> open,		-- Pin#61
		RDAD_SIN			=> open,		-- Pin#62
		RDAD_DIR			=> open,		-- Pin#63
	
		SAMPLESEL_ANY		=> open,	-- Pin#66
	
		DO			=> DO_sti,	--Pin#69-70-71-72-73-74-75-76-84-85-86-87-88-89-90-91
	
		SS_INCR			=> open,		-- Pin#79
	
		DOE				=> open,		-- Pin#80
	
		DONE			=> DONE_sti,		-- Pin#94
	
		SS_RESET		=> open ,	-- Pin#95
	
		REGCLR			=> open,		-- Pin#99
	
		--mDOE:			in	std_logic;		-- Pin#100
	
		SS_LD_SIN		=> open,		-- Pin#103
		SS_LD_DIR		=> open,		-- Pin#104
			
		RAMP			=> open,		-- Pin#108
	
		SSTIN_P			=> open,		-- Pin#125 		
		SSTIN_N			=> open,		-- Pin#126
		
		MONTIMING_P		=> montiming_p,	
		MONTIMING_N		=> montiming_n,		-- Pin#117 	
		
	-- FIFO
		FIFOresponse	=> FIFOresponse_intl,
		CH0 		=> FIFOData_intl.CH0,
		CH1 		=> FIFOData_intl.CH1,
		CH2 		=> FIFOData_intl.CH2,
		CH3 		=> FIFOData_intl.CH3,
		
		CH4 		=> FIFOData_intl.CH4,
		CH5 		=> FIFOData_intl.CH5,
		CH6 		=> FIFOData_intl.CH6,
		CH7 		=> FIFOData_intl.CH7,
		
		CH8 		=> FIFOData_intl.CH8,
		CH9 		=> FIFOData_intl.CH9,
		CH10 		=> FIFOData_intl.CH10,
		CH11 		=> FIFOData_intl.CH11,
		
		CH12 		=> FIFOData_intl.CH12,
		CH13 		=> FIFOData_intl.CH13,
		CH14 		=> FIFOData_intl.CH14,
		CH15 		=> FIFOData_intl.CH15,
		SSvalid			=> SSvalid_intl,
	
	-- DEBUG SIGNALS
		SSVALID_INTR	=> open,
		HSCLK			=> open,
		SSTIN			=> open,	
		MONTIMING		=> open,
		RAMP_CNT		=> open	
	);
	
	DUT_FIFO : 	FifoManager
	generic map (
		C_M_AXIS_TDATA_WIDTH	=> 32
	)
	port map(
		nRST	=> s00_axi_aresetn,
		CLK		=> s00_axi_aclk,
		
		--DATA INCOMING
		PRECvalid	=> SSvalid_intl,
		FIFOresponse	=> FIFOresponse_intl,
		CH0 		=> FIFOData_intl.CH0,
		CH1 		=> FIFOData_intl.CH1,
		CH2 		=> FIFOData_intl.CH2,
		CH3 		=> FIFOData_intl.CH3,
		
		CH4 		=> FIFOData_intl.CH4,
		CH5 		=> FIFOData_intl.CH5,
		CH6 		=> FIFOData_intl.CH6,
		CH7 		=> FIFOData_intl.CH7,
		
		CH8 		=> FIFOData_intl.CH8,
		CH9 		=> FIFOData_intl.CH9,
		CH10 		=> FIFOData_intl.CH10,
		CH11 		=> FIFOData_intl.CH11,
		
		CH12 		=> FIFOData_intl.CH12,
		CH13 		=> FIFOData_intl.CH13,
		CH14 		=> FIFOData_intl.CH14,
		CH15 		=> FIFOData_intl.CH15,	
		
		-- DATA TO STREAM
		FIFOvalid	=> FIFOvalid_intl,
		ready_i		=> Streamready_intl,
		DataOut		=> dataout_intl
	);
	-- Clock generation
    clock_generator(s00_axi_ACLK,simulation_end_s, CLK_PERIOD);
	
	process(SCLK_obs)
	begin
		if rising_edge(SCLK_obs)then
			SHOUT_sti <= not SHOUT_sti;
		end if;
	end process;
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
	  
	  
	 process(hsclk_obs)
	 begin
	 	if rising_edge(hsclk_obs) then
	 		if DO_flg ='0' then
	 			DO_sti <= x"0001";
	 		DO_flg <= '1';
	 		else
	 			DO_sti <= DO_sti(14 downto 0) & DO_sti(15);
	 		end if; 
	 	end if;
	 end process; 
	------------------------------------------------------------------------------------------
	-- TESTBENCH -----------------------------------------------------------------------------
	------------------------------------------------------------------------------------------
	process(s00_axi_ACLK)
	begin
		if rising_edge(s00_axi_ACLK)then
			case stm1 is
				when IDLE =>
					if valid = '1' then
						busy <= '1';
						stm1 <= OK;
					end if;
				when OK =>
						stm1 <= CLEAR;
				when CLEAR =>
					busy <= '0';
					--if valid = '0' then
						stm1 <= IDLE;
					--end if;
				when others =>
			end case;
		end if;
	end process;
	
	tb : process
		variable busy_flg : integer;
		variable locked_flg : integer;
		variable storage_flg : integer;
		variable ssvalid : integer;
		
	begin
		simulation_end_s <= '0';
	
		
		s00_axi_aresetn <= '0';
		wait for 1 us;
		s00_axi_aresetn <= '1';
		wait for 100 ns;
		sendIt <= '0';
		readIt <= '0';
		
		m00_axis_tready <= '1';
		
		report "REGCLR ENABLE!";
    	s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= C_REGCLR_MASK;
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		wait for 1 us;
		
		wait for 100 ns;
		
		report "SWRESET DISABLE!";
    	s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= C_SWRESET_MASK;
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		wait for 1 us;
		
		
		
		-- Wait on Busy
		locked_flg := 0;
		while (locked_flg = 0) loop
			wait for 300 ns;
			S00_AXI_ARADDR<=std_logic_vector(to_unsigned(TC_STATUS_REG*4, S00_AXI_ARADDR'length));
		    readIt<='1';                --Start AXI Read from Slave
		    wait for 1 ns; readIt<='0'; --Clear "Start Read" Flag
	   		wait until S00_AXI_RVALID = '1';
			wait until S00_AXI_RVALID = '0';
			
			if (s00_axi_rdata and C_LOCKED_MASK) = C_LOCKED_MASK then
				locked_flg := 1;
			else
				locked_flg := 0;
			end if;
		end loop;
    	
    	report "DLL LOCKED!";
    	
    	wait for 1 us;
    	report "SWRESET DISABLE!";
    	s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= C_SWRESET_MASK;
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		wait for 1 us;
    	report "SWRESET ENABLE!";
    	s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= C_SWRESET_MASK;
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		wait for 1 us;
    	report "SWRESET DISABLE!";
    	s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= C_SWRESET_MASK;
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		wait for 1 us;
    	
    	-- Load Test pattern generator
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_TPG_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA <=  (others =>'0');
		s00_axi_WDATA(11 downto 0)<=  "110110110110";
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
		s00_axi_WDATA<= C_WRITE_MASK or C_SWRESET_MASK;
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		
		S00_AXI_ARADDR<=std_logic_vector(to_unsigned(TC_DATA_OUT_REG*4, S00_AXI_ARADDR'length));
		readIt<='1';                --Start AXI Read from Slave
		wait for 1 ns; readIt<='0'; --Clear "Start Read" Flag
		wait until S00_AXI_RVALID = '1';
		wait until S00_AXI_RVALID = '0';
		
		busy_flg := 1;
		while (busy_flg = 1) loop
			wait for 300 ns;
			S00_AXI_ARADDR<=std_logic_vector(to_unsigned(TC_STATUS_REG*4, S00_AXI_ARADDR'length));
		    readIt<='1';                --Start AXI Read from Slave
		    wait for 1 ns; readIt<='0'; --Clear "Start Read" Flag
	   		wait until S00_AXI_RVALID = '1';
			wait until S00_AXI_RVALID = '0';
			
			if (s00_axi_rdata and C_BUSY_MASK) = C_BUSY_MASK then
				busy_flg := 1;
			else
				busy_flg := 0;
			end if;
		end loop;
		report "TPG Set!";
		
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA <= C_SS_INCR_MASK OR C_SS_TPG_MASK or C_SWRESET_MASK;
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		
		ssvalid := 1;
		report "Waiting SSVALID!";
		while (ssvalid = 1) loop
			S00_AXI_ARADDR<=std_logic_vector(to_unsigned(TC_STATUS_REG*4, S00_AXI_ARADDR'length));
		    readIt<='1';                --Start AXI Read from Slave
		    wait for 1 ns; readIt<='0'; --Clear "Start Read" Flag
	   		wait until S00_AXI_RVALID = '1';
			wait until S00_AXI_RVALID = '0';
			
			if (s00_axi_rdata and C_SSVALID_MASK) = C_SSVALID_MASK then
				ssvalid := 0;
			else
				ssvalid := 1;
			end if;
		end loop;
		
		report "SSACK!";
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= C_SSACK_MASK or C_SWRESET_MASK;
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= C_SWRESET_MASK;
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
		s00_axi_AWADDR<=(others =>'0');
		s00_axi_WDATA<=(others => '0');
		wait for 1 us;
		

		report "Reset CONTROL!";
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= C_SWRESET_MASK;
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		
		wait for 4 us;
		report "Reset CONTROL!";
		S00_AXI_ARADDR<=std_logic_vector(to_unsigned(TC_DATA_OUT_REG*4, S00_AXI_ARADDR'length));
        readIt<='1';                --Start AXI Read from Slave
        wait for 1 ns; readIt<='0'; --Clear "Start Read" Flag
   		wait until S00_AXI_RVALID = '1';
    	wait until S00_AXI_RVALID = '0';
    
    	S00_AXI_ARADDR<=std_logic_vector(to_unsigned(TC_eDO_CH0_REG*4, S00_AXI_ARADDR'length));
        readIt<='1';                --Start AXI Read from Slave
        wait for 1 ns; readIt<='0'; --Clear "Start Read" Flag
   		wait until S00_AXI_RVALID = '1';
    	wait until S00_AXI_RVALID = '0';
    	
		wait for 4 us;  
		
		report "Start Storage!";
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_FSTWINDOW_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= x"00000010";
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished		

		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_NBRWINDOW_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= x"00000005";
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished		
				
		
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= C_WINDOW_MASK or C_SWRESET_MASK;
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished

		for k in 0 to 4 loop
			for I in 0 to 31 loop
				ssvalid := 1;
				while (ssvalid = 1) loop
					S00_AXI_ARADDR<=std_logic_vector(to_unsigned(TC_STATUS_REG*4, S00_AXI_ARADDR'length));
					readIt<='1';                --Start AXI Read from Slave
					wait for 1 ns; readIt<='0'; --Clear "Start Read" Flag
			   		wait until S00_AXI_RVALID = '1';
					wait until S00_AXI_RVALID = '0';
	
					if (s00_axi_rdata and C_SSVALID_MASK) = C_SSVALID_MASK then
						ssvalid := 0;
					else
						ssvalid := 1;
					end if;
				end loop;
				s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
				s00_axi_WDATA<= C_SSACK_MASK or C_SWRESET_MASK;
				s00_axi_WSTRB<=b"1111";
				sendIt<='1';                --Start AXI Write to Slave
				wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
				wait until s00_axi_BVALID = '1';
				wait until s00_axi_BVALID = '0';  --AXI Write finished
		
				ssvalid := 1;
				while (ssvalid = 1) loop
					S00_AXI_ARADDR<=std_logic_vector(to_unsigned(TC_STATUS_REG*4, S00_AXI_ARADDR'length));
					readIt<='1';                --Start AXI Read from Slave
					wait for 1 ns; readIt<='0'; --Clear "Start Read" Flag
			   		wait until S00_AXI_RVALID = '1';
					wait until S00_AXI_RVALID = '0';
	
					if (s00_axi_rdata and C_SSVALID_MASK) = C_SSVALID_MASK then
						ssvalid := 1;
					else
						ssvalid := 0;
					end if;
				end loop;		

				s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
				s00_axi_WDATA<= C_SWRESET_MASK;
				s00_axi_WSTRB<=b"1111";
				sendIt<='1';                --Start AXI Write to Slave
				wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
				wait until s00_axi_BVALID = '1';
				wait until s00_axi_BVALID = '0';  --AXI Write finished
			end loop;
		end loop;
		-- READOUT FINISHED

		wait for 4 us;
				report "Start Storage!";
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_FSTWINDOW_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= x"00000000";
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished		

		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_NBRWINDOW_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= x"00000003";
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished		
				
		
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= C_WINDOW_MASK or C_SWRESET_MASK;
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished

		for K in 0 to 2 loop
			for I in 0 to 31 loop
				ssvalid := 1;
				while (ssvalid = 1) loop
					S00_AXI_ARADDR<=std_logic_vector(to_unsigned(TC_STATUS_REG*4, S00_AXI_ARADDR'length));
					readIt<='1';                --Start AXI Read from Slave
					wait for 1 ns; readIt<='0'; --Clear "Start Read" Flag
			   		wait until S00_AXI_RVALID = '1';
					wait until S00_AXI_RVALID = '0';
	
					if (s00_axi_rdata and C_SSVALID_MASK) = C_SSVALID_MASK then
						ssvalid := 0;
					else
						ssvalid := 1;
					end if;
				end loop;
				s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
				s00_axi_WDATA<= C_SSACK_MASK or C_SWRESET_MASK;
				s00_axi_WSTRB<=b"1111";
				sendIt<='1';                --Start AXI Write to Slave
				wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
				wait until s00_axi_BVALID = '1';
				wait until s00_axi_BVALID = '0';  --AXI Write finished
		
				ssvalid := 1;
				while (ssvalid = 1) loop
					S00_AXI_ARADDR<=std_logic_vector(to_unsigned(TC_STATUS_REG*4, S00_AXI_ARADDR'length));
					readIt<='1';                --Start AXI Read from Slave
					wait for 1 ns; readIt<='0'; --Clear "Start Read" Flag
			   		wait until S00_AXI_RVALID = '1';
					wait until S00_AXI_RVALID = '0';
	
					if (s00_axi_rdata and C_SSVALID_MASK) = C_SSVALID_MASK then
						ssvalid := 1;
					else
						ssvalid := 0;
					end if;
				end loop;		

				s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
				s00_axi_WDATA<= C_SWRESET_MASK;
				s00_axi_WSTRB<=b"1111";
				sendIt<='1';                --Start AXI Write to Slave
				wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
				wait until s00_axi_BVALID = '1';
				wait until s00_axi_BVALID = '0';  --AXI Write finished
			end loop;
		end loop;



		-- STREAM FIFO TEST


		
		Streamready_intl <= '0';
		wait for 100 us;


		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= C_SSACK_MASK or C_SWRESET_MASK or C_SMODE_MASK;
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished

		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_FSTWINDOW_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= x"00000010";
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished		

		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_NBRWINDOW_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= x"00000001";
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished		
				
		
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= C_WINDOW_MASK or C_SWRESET_MASK or C_SMODE_MASK;
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished

	
		
				
		wait for 100 us;
		  	
    	simulation_end_s <= '1';
    	wait;
	end process;
	  
	  
	  
end implementation;
