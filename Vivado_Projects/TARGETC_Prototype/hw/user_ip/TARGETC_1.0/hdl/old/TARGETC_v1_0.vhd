library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.TARGETC_pkg.all;

entity TARGETC_v1_0 is
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
		SHOUTxi:	in std_logic;
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
end TARGETC_v1_0;

architecture arch_imp of TARGETC_v1_0 is

	signal START_WRITE_s : std_logic;
    signal TC_BUS_IN_s : 		std_logic_vector(18 downto 0);
    signal TC_BUS_OUT_s : 		std_logic_vector(18 downto 0);
	signal TC_WR_BUSY_s:	std_logic;
	
	signal pclk_internal : std_logic;
	signal sclk_internal : std_logic;
	signal sin_internal : std_logic;
	
	signal pclk_internal_test : std_logic;
	signal sclk_internal_test : std_logic;
	signal sin_internal_test : std_logic;
	
	-- component declaration
	component TC_AXI_RegMAP is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 10
		);
		port (
		-- TARGETC Control Signals
		S_START_WRITE : 	out std_logic;
        S_TC_BUS_IN : 		out STD_LOGIC_VECTOR(18 downto 0);
        S_TC_BUS_OUT :		in STD_LOGIC_VECTOR(18 downto 0);
		S_TC_WR_BUSY:		in std_logic;
		
		
		S_PCLK : out std_logic;
		S_SCLK : out std_logic;
		S_SIN : out std_logic;
		S_eRAMP : out std_logic;
    	S_eRegCLR :  out std_logic; 
    	
		-- Axi Lite
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component TC_AXI_RegMAP;

	component TARGETX_DAC_CONTROL is
		generic (
		constant REGISTER_WIDTH : integer := 19
		);
		Port ( 
		CLK : 			in  STD_LOGIC;
		LOAD_PERIOD : 	in  STD_LOGIC_VECTOR(15 downto 0);
		LATCH_PERIOD : 	in  STD_LOGIC_VECTOR(15 downto 0);
		UPDATE : 		in  STD_LOGIC;
		REG_DATA_IN : 		in  STD_LOGIC_VECTOR(18 downto 0);
		REG_DATA_OUT : 		out  STD_LOGIC_VECTOR(18 downto 0);
		busy		: 	out std_logic;

		SIN : out  STD_LOGIC;
		SCLK : out  STD_LOGIC;
		PCLK : out  STD_LOGIC;
		SHOUT:	in std_logic);
	end component TARGETX_DAC_CONTROL;
begin

-- Instantiation of Axi Bus Interface TC_AXI
TC_AXI_RegMAP_inst : TC_AXI_RegMAP
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_TC_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_TC_AXI_ADDR_WIDTH
	)
	port map (
		S_START_WRITE => START_WRITE_s,
        S_TC_BUS_IN 		=> TC_BUS_IN_s,
        S_TC_BUS_OUT => TC_BUS_OUT_s,
		S_TC_WR_BUSY	=> TC_WR_BUSY_s,
		
		S_PCLK => pclk_internal_test,
		S_SCLK => sclk_internal_test,
		S_SIN => sin_internal_test,
		S_eRAMP => eRAMPxo,
    	S_eRegCLR => eRegCLRxo,
    	
		S_AXI_ACLK	=> tc_axi_aclk,
		S_AXI_ARESETN	=> tc_axi_aresetn,
		S_AXI_AWADDR	=> tc_axi_awaddr,
		S_AXI_AWPROT	=> tc_axi_awprot,
		S_AXI_AWVALID	=> tc_axi_awvalid,
		S_AXI_AWREADY	=> tc_axi_awready,
		S_AXI_WDATA	=> tc_axi_wdata,
		S_AXI_WSTRB	=> tc_axi_wstrb,
		S_AXI_WVALID	=> tc_axi_wvalid,
		S_AXI_WREADY	=> tc_axi_wready,
		S_AXI_BRESP	=> tc_axi_bresp,
		S_AXI_BVALID	=> tc_axi_bvalid,
		S_AXI_BREADY	=> tc_axi_bready,
		S_AXI_ARADDR	=> tc_axi_araddr,
		S_AXI_ARPROT	=> tc_axi_arprot,
		S_AXI_ARVALID	=> tc_axi_arvalid,
		S_AXI_ARREADY	=> tc_axi_arready,
		S_AXI_RDATA	=> tc_axi_rdata,
		S_AXI_RRESP	=> tc_axi_rresp,
		S_AXI_RVALID	=> tc_axi_rvalid,
		S_AXI_RREADY	=> tc_axi_rready
	);

	TARGETC_SerialRegCtrl_inst : TARGETX_DAC_CONTROL
		generic map(
		REGISTER_WIDTH =>19
		)
		Port map( 
		CLK 		=> CLKxi,
		LOAD_PERIOD 	=> (others => '0'),
		LATCH_PERIOD 	=> (others => '0'),
		UPDATE 			=> start_write_s,
		REG_DATA_IN 		=> TC_BUS_IN_s,
		REG_DATA_OUT 		=> TC_BUS_OUT_s,
		busy		 	=> TC_WR_BUSY_s,

		SIN 	=> SIN_internal,
		SCLK 	=> SCLK_internal,
		PCLK 	=> PCLK_internal,
		SHOUT	=> SHOUTxi
	);
	
	-- Add user logic here
	PCLKxo <= pclk_internal when pclk_internal_test = '0' else '1';
	SCLKxo <= sclk_internal when sclk_internal_test = '0' else '1';
	SINxo <= sin_internal when sin_internal_test = '0' else '1';
	-- User logic ends

end arch_imp;
