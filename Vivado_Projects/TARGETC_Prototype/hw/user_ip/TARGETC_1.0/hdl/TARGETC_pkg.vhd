library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Package for the use
package TARGETC_pkg is
  
  	constant TC_REGISTER_NUMBER:		integer := 153;
	
-- ------------------------------------------------------
--	Register Map Target C
--	Date : 9th October 2018						
-- ------------------------------------------------------
	constant TC_VOUT1_REG:			integer := 1;
	
	constant TC_SSTOUTFB_REG: 		integer := 65;
	constant TC_SSPIN_LE_REG: 		integer := 66;
	constant TC_SSPIN_TE_REG: 		integer := 67;
	constant TC_WR_STRB2_LE_REG: 	integer := 68;
	constant TC_WR_STRB2_TE_REG: 	integer := 69;
	constant TC_WR2_ADDR_LE_REG: 	integer := 70;
	constant TC_WR2_ADDR_TE_REG: 	integer := 71;
	constant TC_WR_STRB1_LE_REG: 	integer := 72;
	constant TC_WR_STRB1_TE_REG: 	integer := 73;
	constant TC_WR1_ADDR_LE_REG: 	integer := 74;
	constant TC_WR1_ADDR_TE_REG: 	integer := 75;
	constant TC_MONTIMING_REG:		integer := 76;
	--76	
	constant TC_VQBUFF_REG: 		integer := 77;
	constant TC_QBIAS_REG: 			integer := 78;
	constant TC_VTRIMT_REG: 		integer := 79;

	constant TC_VBIAS_REG:			integer := 80;

	constant TC_VAPBUFF_REG: 		integer := 81;
	constant TC_VADJP_REG: 			integer := 82;
	constant TC_VANBUFF_REG: 		integer := 83;
	constant TC_VADJN_REG: 			integer := 84;			
	constant TC_SBBIAS_REG: 		integer := 85;
	constant TC_VDISCH_REG: 		integer := 86;
	constant TC_ISEL_REG: 			integer := 87;
	constant TC_DBBIAS_REG: 		integer := 88;
	
	constant TC_CMPBIAS2_REG: 		integer := 89;
	constant TC_PUBIAS_REG: 		integer := 90;
	constant TC_CMPBIASIN_REG: 		integer := 91;
	constant TC_MISC_REG: 			integer := 92;		

	constant TC_TPG_REG:			integer := 128;
	--constant C_MONTIMING_SEL_REG: 	integer :=  + C_TARGET_REG_OFFSET;

-- ------------------------------------------------------
--	Register Map for Component on the same bus for Target C
--	Date : 9th October 2018						
-- ------------------------------------------------------
 	constant TC_CONTROL_REG : 			integer := 129;
 		--MASK
 		constant C_WRITE_MASK:				std_logic_vector(31 downto 0) := x"00000001";
 		--constant C_SS_INCR_MASK:			std_logic_vector(31 downto 0) := x"00000002";
 		--constant C_SS_TPG_MASK:				std_logic_vector(31 downto 0) := x"00000004";
		--constant C_WRITE_MASK:				std_logic_vector(31 downto 0) := x"00000008";
		
 		--constant C_SS_INCR_MASK:			std_logic_vector(31 downto 0) := x"00000010";
 		constant C_REGCLR_MASK:				std_logic_vector(31 downto 0) := x"00000020";
		constant C_SS_INCR_MASK:		std_logic_vector(31 downto 0) := x"00000040";
 		constant C_SS_TPG_MASK:			std_logic_vector(31 downto 0) := x"00000080";
 		
 		constant C_SS_RESET_MASK:		std_logic_vector(31 downto 0) := x"00000100";
 		constant C_RDAD_MASK:			std_logic_vector(31 downto 0) := x"00000200";
 		constant C_WINDOW_MASK:			std_logic_vector(31 downto 0) := x"00000400";
 		constant C_SSACK_MASK:			std_logic_vector(31 downto 0) := x"00000800";
		
		constant C_SWRESET_MASK:		std_logic_vector(31 downto 0) := x"00001000";
		constant C_SMODE_MASK:			std_logic_vector(31 downto 0) := x"00002000";
		constant C_TESTSTREAM_MASK:		std_logic_vector(31 downto 0) := x"00004000";			
		constant C_TESTFIFO_MASK:		std_logic_vector(31 downto 0) := x"00008000";			
		
		--BIT
		constant C_WRITE_BIT:		integer := 0;
		constant C_PCLK_BIT:		integer := 1;
		constant C_SCLK_BIT:		integer := 2;
		constant C_SIN_BIT:			integer := 3;
		
		constant C_eRAMP_BIT:		integer := 4;
		constant C_eRegCLR_BIT:		integer := 5;
		constant C_INCR_BIT: 		integer := 6;
		constant C_TPG_BIT:			integer := 7;
		
		constant C_SS_RESET_BIT:	integer := 8;
		constant C_RDAD_BIT:		integer := 9;
		constant C_STARTSTORAGE_BIT:integer := 10;
		constant C_SSACK_BIT:		integer := 11;
		
		constant C_SWRESET_BIT:		integer := 12;	
		constant C_SMODE_BIT:		integer := 13;
		constant C_TESTSTREAM_BIT:	integer	:= 14;
		constant C_TESTFIFO_BIT:	integer := 15;
		
	constant TC_STATUS_REG : 	integer := 130;
		--MASK
		constant C_BUSY_MASK:	std_logic_vector(31 downto 0) := x"00000001";
		constant C_LOCKED_MASK:	std_logic_vector(31 downto 0) := x"00000002";
		--constant C_STORAGE_MASK:	std_logic_vector(31 downto 0) := x"00000004";	
		constant C_SSVALID_MASK:	std_logic_vector(31 downto 0) := x"00000008";	
		constant C_WINDOWBUSY_MASK:		std_logic_vector(31 downto 0) := x"00000010";	
	
		--BIT
		constant C_BUSY_BIT:	integer := 0;
		constant C_LOCKED_BIT:	integer := 1;
		--constant C_STORAGE_BIT:	integer := 2;
		constant C_SSVALID_BIT:	integer := 3;
		constant C_WINDOWBUSY_BIT:	integer := 4;
		
	constant TC_ADDR_REG :		integer := 131;
	constant TC_DATA_OUT_REG:	integer := 132;
	
	-- Register Map to eDO serial
	constant TC_eDO_CH0_REG:	integer := 133;
	constant TC_eDO_CH1_REG:	integer := 134;
	constant TC_eDO_CH2_REG:	integer := 135;
	constant TC_eDO_CH3_REG:	integer := 136;
	
	constant TC_eDO_CH4_REG:	integer := 137;
	constant TC_eDO_CH5_REG:	integer := 138;
	constant TC_eDO_CH6_REG:	integer := 139;
	constant TC_eDO_CH7_REG:	integer := 140;
	
	constant TC_eDO_CH8_REG:	integer := 141;
	constant TC_eDO_CH9_REG:	integer := 142;
	constant TC_eDO_CH10_REG:	integer := 143;
	constant TC_eDO_CH11_REG:	integer := 144;
	
	constant TC_eDO_CH12_REG:	integer := 145;
	constant TC_eDO_CH13_REG:	integer := 146;
	constant TC_eDO_CH14_REG:	integer := 147;
	constant TC_eDO_CH15_REG:	integer := 148;
	
	
	constant TC_FSTWINDOW_REG:	integer := 151;
	constant TC_NBRWINDOW_REG:	integer := 152;
	
	constant TC_WL_DIV_REG:		integer := 153;
	
	--type eDO_ARRAY is array (0 downto 15) of std_logic_vector(11 downto 0);
	type eDO_LINE is array (11 downto 0) of std_logic;
	type eDO_ARRAY is array (0 downto 15) of eDO_LINE;
	
	type eDO_BUS_TYPE is record
		CH0 :	std_logic_vector(11 downto 0);
		CH1 :	std_logic_vector(11 downto 0);
		CH2 :	std_logic_vector(11 downto 0);
		CH3 :	std_logic_vector(11 downto 0);
		
		CH4 :	std_logic_vector(11 downto 0);
		CH5 :	std_logic_vector(11 downto 0);
		CH6 :	std_logic_vector(11 downto 0);
		CH7 :	std_logic_vector(11 downto 0);
		
		CH8 :	std_logic_vector(11 downto 0);
		CH9 :	std_logic_vector(11 downto 0);
		CH10 :	std_logic_vector(11 downto 0);
		CH11 :	std_logic_vector(11 downto 0);
		
		CH12 :	std_logic_vector(11 downto 0);
		CH13 :	std_logic_vector(11 downto 0);
		CH14 :	std_logic_vector(11 downto 0);
		CH15 :	std_logic_vector(11 downto 0);
	end record;
	
	-- Ctrl Signals for the TARGETC Operations
	--type CtrlSignalBus_Outputs is record
	type T_CtrlBus_OxMS is record
		
		SWRESET:			std_logic;	--Software Reset
		
		WL_CLK_DIV:		std_logic_vector(31 downto 0);
		WRITEREG:		std_logic;
		TC_BUS: 		std_logic_vector(18 downto 0);
		
		SS_INCR:		std_logic;
		
		Test_PCLK:		std_logic;
		Test_SCLK : 	std_logic;
		Test_SIN : 	 	std_logic;
		RAMP : 	std_logic;
    	RegCLR : 	std_logic; 
		SmplSl_Any:	std_logic;
		SS_RESET:	std_logic;
		RDAD :			std_logic;
		SSAck:			std_logic;
		
		WindowStorage:	std_logic;
		FSTWINDOW:		std_logic_vector(31 downto 0);
		NBRWINDOW:		std_logic_vector(31 downto 0);
		
		SAMPLEMODE:		std_logic;
		TestStream:		std_logic;
		TestFiFo:		std_logic;
		--FirstWindow : std_logic_vector(31 downto 0);
		--NbrOfWindow : std_logic_vector(31 downto 0);
		
	end record;
	subtype T_CtrlBus_IxSL is T_CtrlBus_OxMS;
	subtype T_CtrlBus_OxMS_Intl is T_CtrlBus_OxMS;
	
	
	type T_CtrlBus_IxMS is record
		
		TC_BUS: 		std_logic_vector(18 downto 0);
		--RD_ADDR:		std_logic_vector(8 downto 0);
		--SS_SELECT:		std_logic_vector(31 downto 0);
	
		DO_BUS :		eDO_BUS_TYPE;
		BUSY:			std_logic;
		PLL_LOCKED:		std_logic;
		
		WindowBusy:		std_logic;		
		SSvalid:		std_logic;
		RAMP_Cnt:		std_logic;
	end record;
	subtype T_CtrlBus_OxSL is T_CtrlBus_IxMS;
	subtype T_CtrlBus_IxMS_Intl is T_CtrlBus_IxMS;
	--	Unused signal from ports : CtrlBus_IxMS
--		TC_BUS	=> open;
--		DO_BUS  => open;
--		BUSY	=> open;
--		PLL_LOCKED => open;
--		STORAGE => open;
	
	type T_ClockBus is record
		SCLK :	 		STD_LOGIC;		-- Pin#36
		HSCLK:			std_logic;		-- Pin#43 to Pin#44
		WL_CLK:			std_logic;		-- Pin#57 to Pin#58
		RDAD_CLK:		std_logic;		-- Pin#61
		SSTIN:			std_logic;
		CLK500MHz:		std_logic;
	end record;
	
	type slv_array is array (integer range <>) of std_logic_vector(31 downto 0);
	
	
	type CtrlStorageArray is record
		dirty :		std_logic_vector(511 downto 0);
		digit :		std_logic_vector(511 downto 0);
	end record;
	

    		
end TARGETC_pkg;

package body TARGETC_pkg is


end TARGETC_pkg;
