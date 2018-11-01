library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Package for the use
package TARGETC_pkg is
  
  	constant TC_REGISTER_NUMBER:		integer := 131;
	
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
	constant TC_TPGREG_REG: 		integer := 92;		

	constant TC_TPG_REG:			integer := 128;
	--constant C_MONTIMING_SEL_REG: 	integer :=  + C_TARGET_REG_OFFSET;

-- ------------------------------------------------------
--	Register Map for Component on the same bus for Target C
--	Date : 9th October 2018						
-- ------------------------------------------------------
 	constant TC_CONTROL_REG : 			integer := 129;
 		--MASK
 		constant C_WRITE_MASK:				std_logic_vector(31 downto 0) := x"00000001";
 		constant C_BUSY_MASK:				std_logic_vector(31 downto 0) := x"00000002";
		--BIT
		constant C_BUSY_BIT:	integer := 1;
		constant C_PCLK_BIT:	integer := 2;
		constant C_SCLK_BIT:	integer := 3;
		constant C_SIN_BIT:		integer := 4;
		constant C_eRAMP_BIT:	integer := 5;
		constant C_eRegCLR_BIT:	integer := 6;
		
	constant TC_ADDR_REG :		integer := 130;
	constant TC_DATA_OUT_REG:	integer := 131;
	
	
end TARGETC_pkg;

package body TARGETC_pkg is

end TARGETC_pkg;
