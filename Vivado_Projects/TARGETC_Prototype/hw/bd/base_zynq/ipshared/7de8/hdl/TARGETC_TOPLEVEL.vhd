library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.TARGETC_pkg.all;
use work.AXI_Lite_pkg.all;

entity TARGETC_IP_Prototype is
	port (
	-- TARGET C Ports for control and function
	
		RefCLK_i :		in std_logic;	-- Clock for the TARGETC SCLK
	
		-- Ports of Axi Slave Bus Interface TC_AXI
		tc_axi_aclk		: in std_logic;
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
		
		HSCLK_P:		out std_logic;		-- Pin#44
		HSCLK_N:		out std_logic;		-- Pin#43
		
		WR_RS_S0:		out	std_logic;		--Pin
		WR_RS_S1:		out	std_logic;
		
		WR_CS_S0:		out	std_logic;
		WR_CS_S1:		out	std_logic;
		WR_CS_S2:		out	std_logic;
		WR_CS_S3:		out	std_logic;
		WR_CS_S4:		out	std_logic;
		WR_CS_S5:		out	std_logic;
			
		GCC_RESET:		out	std_logic;		-- Pin#56
		
		WL_CLK_P:		out std_logic;		-- Pin#58
		WL_CLK_N:		out std_logic;		-- Pin#57
		
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
		
		SSTIN_P:		out std_logic;		-- Pin#125 		
		SSTIN_N:		out std_logic;		-- Pin#126 	
		
		MONTIMING_P:	in	std_logic;		-- Pin#118		
		MONTIMING_N:	in	std_logic;		-- Pin#117 	
		
		
	-- DEBUG SIGNALS
		SSVALID_INTR:	out	std_logic;
		HSCLK:			out std_logic;
		SSTIN:			out	std_logic;		
		MONTIMING:		out std_logic
		
		-- Data Readout
	);
end TARGETC_IP_Prototype;

architecture arch_imp of TARGETC_IP_Prototype is


	component TC_ClockManagement is
	port (
	-- TARGET C Ports for control and function
		rst:			in	std_logic;
		clk :			in 	std_logic;	-- Clock for the TARGETC SCLK
		WL_CLK_DIV:		in 	std_logic_vector(31 downto 0); -- Clock Divider Through DFF
		PLL_LOCKED:		out	std_logic;
		
		SCLK :	 		out	STD_LOGIC;		-- Pin#36
		HSCLK:			out std_logic;		-- Pin#43 to Pin#44
		WL_CLK:			out std_logic;		-- Pin#57 to Pin#58
		RDAD_CLK:		out	std_logic;		-- Pin#61
		SSTIN:			out std_logic;		-- Pin 
		
		HSCLKdif:		in	std_logic;
		
		-- LVDS Differential Pair
		HSCLK_P:		out std_logic;		-- Pin#43
		HSCLK_N:		out std_logic;		-- Pin#44
		
		WL_CLK_P:		out std_logic;		-- Pin#57
		WL_CLK_N:		out std_logic;		-- Pin#58
		
		SSTIN_P:		out std_logic;		-- Pin#125 		
		SSTIN_N:		out std_logic		-- Pin#126 		
		
	);
	end component TC_ClockManagement;


	component TC_Control is	
	port (
	-- TARGET C Ports for control and functi
		
		AxiBusIn:		in AXI_Lite_Inputs;
		AxiBusOut:		out AXI_Lite_Outputs;
		
		ClockBus:		in T_ClockBus;
		
		CtrlBus_OxMS:		out T_CtrlBus_OxMS;
		CtrlBus_IxMS:		in 	T_CtrlBus_IxMS	
	);
	end component TC_Control;

	component TARGETX_DAC_CONTROL is
		generic (
			constant REGISTER_WIDTH : integer := 19-- needs to change, change the name of the file to TargetX DAC control this is actually 19 now
		 );
		Port ( 
				CLK : 				in  STD_LOGIC;
				PCLK_LATCH_PERIOD:	in	STD_LOGIC_VECTOR(15 downto 0);
				PCLK_TRANSITION_PERIOD:	in	STD_LOGIC_VECTOR(15 downto 0); 
			
				LOAD_PERIOD : 		in  STD_LOGIC_VECTOR(15 downto 0);
				LATCH_PERIOD : 		in  STD_LOGIC_VECTOR(15 downto 0);
				UPDATE : 			in  STD_LOGIC;
				REG_DATA_IN : 		in  STD_LOGIC_VECTOR(18 downto 0);
				REG_DATA_OUT : 		out std_logic_vector(18 downto 0);
		       	busy		: 		out std_logic;
				  
				SIN : out  STD_LOGIC;
		       	SCLK : out  STD_LOGIC;
		       	PCLK : out  STD_LOGIC;
		       	SHOUT: in	STD_LOGIC);
	end component TARGETX_DAC_CONTROL;
	
	component TARGETC_SERIAL_DATA_OUT is
	Port ( 
		HSCLKref : 		in  STD_LOGIC;
		HSCLK :			out std_logic;
		
		-- Control/Command inputs
		SS_start :		in std_logic;
			
		DO_BUS :		out eDO_BUS_TYPE;
	
		-- Data Readout
		DO : 			in std_logic_vector(15 downto 0);

		eSS_Incr:		out std_logic;
		
		SSbusy:			out std_logic;
		SSvalid:		out std_logic;
	
		WLvalid:		in std_logic);
	
	end component TARGETC_SERIAL_DATA_OUT;
	
	component TARGETC_SamplingStorage is
	Port ( 
		CLK : 			in  STD_LOGIC;
		RST : 			in	STD_Logic;
	
		DISCH_PERIOD :	in	std_logic_vector(15 downto 0);
		INCR_WAIT_PERIOD :	in	std_logic_vector(15 downto 0);
		ClockBus:		in T_ClockBus;
	
		--eTPG :			in std_logic;
	
		WR_RS_S:		out std_logic_vector(1 downto 0);
		WR_CS_S:		out std_logic_vector(5 downto 0);
	
		RDAD_CLK:		out	std_logic;		-- Pin#61
		RDAD_SIN:		out	std_logic;		-- Pin#62
		RDAD_DIR:		out	std_logic;		-- Pin#63
	
		RAMP:			out	std_logic;
		GCC_RESET:		out	std_logic;
	
		HSCLK : 			out  STD_LOGIC;
		
		DO : 			in std_logic_vector(15 downto 0);
		SS_INCR:		out std_logic;
		SS_RESET:		out std_logic;
	
		CtrlBus_IxSL:		in 	T_CtrlBus_IxSL; --Outputs from Control Master
		CtrlBus_OxSL:		out	T_CtrlBus_OxSL --Outputs from Control Master
	
	);
	end component TARGETC_SamplingStorage;
	
	component IBUFDS is
	generic(
		IOSTANDARD : string := "LVDS_25");
	port(
		O : 		out std_logic ;
		I : 		in std_logic ;
		IB : 		in std_logic
		);
	end component;
	-- --------------------------------------------------------------------------------
	-- Signal Declaration
	
	-- Internal Clock signals (intl)
	signal SCLK_intl:		std_logic;
	signal HSCLK_intl:		std_logic;
	signal HSCLK_dif:		std_logic;
	signal WL_CLK_intl:		std_logic;
	signal RDAD_CLK_intl:	std_logic;
	signal SSTIN_intl:		std_logic;
	
	signal ClockBus_intl:	T_ClockBus;
	
	-- Internal Control Signals from Register-AXI
	--signal CtrlBusOut_intl:		CtrlSignalBus_Outputs;
	--signal CtrlBusIn_intl:		CtrlSignalBus_Inputs;
	
	signal CtrlBusIn_intl:		T_CtrlBus_IxMS_Intl;
	signal CtrlBusOut_intl:		T_CtrlBus_OxMS_Intl;
	
	signal WR_CS_S_intl:	std_logic_vector(5 downto 0);
	signal WR_RS_S_intl:	std_logic_vector(1 downto 0);
	
	--signal DOE_intl :		std_logic;
	
	-- Dummy Signals
	signal tc_axi_intr:		std_logic;
	signal test : std_logic;
begin

	TC_ClockMgmt_inst : TC_ClockManagement
	port map(
		rst				=> CtrlBusOut_intl.SWRESET,
		--rst				=> tc_axi_aresetn,
		clk		 		=> RefCLK_i,
		WL_CLK_DIV 		=> CtrlBusOut_intl.WL_CLK_DIV,
		PLL_LOCKED		=> CtrlBusIn_intl.PLL_LOCKED,
		--PLL_LOCKED		=> Test,
		
		SCLK 			=> ClockBus_intl.SCLK,
		HSCLK 			=> ClockBus_intl.HSCLK,
		WL_CLK 			=> ClockBus_intl.WL_CLK,
		RDAD_CLK 		=> ClockBus_intl.RDAD_CLK,
		SSTIN 			=> ClockBus_intl.SSTIN,
		
		HSCLKdif		=> HSCLK_dif,
		-- LVDS Differential Pair
		HSCLK_P 		=> HSCLK_P, 
		HSCLK_N 		=> HSCLK_N,
		
		WL_CLK_P 		=> WL_CLK_P,
		WL_CLK_N 		=> WL_CLK_N,
		
		SSTIN_P 		=> SSTIN_P,		
		SSTIN_N 		=> SSTIN_N		
	);
	
	TC_Control_inst : TC_Control
	port map(
		AxiBusIn.ACLK		=> tc_axi_aclk,
		AxiBusIn.ARESETN	=> tc_axi_aresetn,
		AxiBusIn.AWADDR		=> tc_axi_awaddr,
		AxiBusIn.AWPROT		=> tc_axi_awprot,
		AxiBusIn.AWVALID	=> tc_axi_awvalid,
		AxiBusIn.WDATA		=> tc_axi_wdata,	
		AxiBusIn.WSTRB		=> tc_axi_wstrb,
		AxiBusIn.WVALID		=> tc_axi_wvalid,
		AxiBusIn.BREADY		=> tc_axi_bready,	
		AxiBusIn.ARADDR		=> tc_axi_araddr,
		AxiBusIn.ARPROT		=> tc_axi_arprot,
		AxiBusIn.ARVALID	=> tc_axi_arvalid,
		AxiBusIn.RREADY		=> tc_axi_rready,	
		
		AxiBusOut.AWREADY	=> tc_axi_awready,
		AxiBusOut.WREADY	=> tc_axi_wready,	
		AxiBusOut.BRESP		=> tc_axi_bresp,
		AxiBusOut.BVALID	=> tc_axi_bvalid,
		AxiBusOut.ARREADY	=> tc_axi_arready,	
		AxiBusOut.RDATA		=> tc_axi_rdata,	
		AxiBusOut.RRESP		=> tc_axi_rresp,
		AxiBusOut.RVALID	=> tc_axi_rvalid,
		AxiBusOut.intr		=> tc_axi_intr,		
		
		ClockBus			=> ClockBus_intl,
		
		CtrlBus_OxMS			=> CtrlBusOut_intl,	
		CtrlBus_IxMS			=> CtrlBusIn_intl
	);
	
	TC_SerialRegCtrl_inst : TARGETX_DAC_CONTROL
		generic map(
		REGISTER_WIDTH =>19
		)
		Port map( 
		CLK 		=> ClockBus_intl.SCLK,
		PCLK_LATCH_PERIOD 		=> x"0005",	--With SCLK (brut) 50 MHz, 20ns * 5 = 100ns High period
		PCLK_TRANSITION_PERIOD 	=> x"0003",
		LOAD_PERIOD 	=> (others => '0'),
		LATCH_PERIOD 	=> (others => '0'),
		UPDATE 			=> CtrlBusOut_intl.WRITEREG,
		REG_DATA_IN 	=> CtrlBusOut_intl.TC_BUS,
		REG_DATA_OUT 	=> CtrlBusIn_intl.TC_BUS,
		busy		 	=> CtrlBusIn_intl.BUSY,

		SIN 	=> SIN,
		SCLK 	=> SCLK,
		PCLK 	=> PCLK,
		SHOUT	=> SHOUT
	);
	
	TC_SamStoDig_inst : TARGETC_SamplingStorage
	Port map( 
		CLK 	=> RefCLK_i,
		RST 	=> tc_axi_aresetn,
	
		DISCH_PERIOD	=> x"0064",
		INCR_WAIT_PERIOD => x"0032",
		ClockBus	=> ClockBus_intl,
		
		--eTPG :			in std_logic;
	
		WR_RS_S	=> WR_RS_S_intl,
		WR_CS_S	=> WR_CS_S_intl,
		
		RDAD_CLK		=> RDAD_CLK,
		RDAD_SIN		=> RDAD_SIN,
		RDAD_DIR		=> RDAD_DIR,
		
		RAMP			=> RAMP,
		GCC_RESET		=> GCC_RESET,
		
		HSCLK		=> HSCLK_dif,
		
		-- Data Readout
		DO 		=> DO,
		SS_INCR	=> SS_INCR,
		SS_RESET => SS_RESET,
		
		CtrlBus_IxSL		=> CtrlBusOut_intl,
		CtrlBus_OxSL		=> CtrlBusIn_intl
	);	
	SAMPLESEL_ANY <= CtrlBusOut_intl.SmplSl_Any;
	REGCLR <= CtrlBusOut_intl.REGCLR;
	
	
	WR_RS_S0	<= WR_RS_S_intl(0);
	WR_RS_S1	<= WR_RS_S_intl(1);
	
	WR_CS_S0	<= WR_CS_S_intl(0);
	WR_CS_S1	<= WR_CS_S_intl(1);
	WR_CS_S2	<= WR_CS_S_intl(2);
	WR_CS_S3	<= WR_CS_S_intl(3);
	WR_CS_S4	<= WR_CS_S_intl(4);
	WR_CS_S5	<= WR_CS_S_intl(5);
	
	SS_LD_SIN <= '0';
	SS_LD_DIR <= '0';
	
	DOE <= '1';
	
	-- DEBUG
	SSVALID_INTR <= CtrlBusIn_intl.SSVALID;
	HSCLK <= HSCLK_dif;
	SSTIN <= ClockBus_intl.SSTIN;
	
	IBUFDS_MonTiming : IBUFDS
	generic map(
		IOSTANDARD  => "LVDS_25"
	)
	port map(
		I	=> MONTIMING_P,
		IB	=> MONTIMING_N,

		O	=> MONTIMING
	);
end arch_imp;
