library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Package for the use of AXI Stream Peripheral for Watchman
package AXIS_Peripheral_pkg is
  
  -- Register Bank Constants
	constant C_CONTROL_REG : 			integer := 0;
	constant C_NBR_OF_PACKETS_REG :		integer := 1;
	constant C_CONTENT_PACKET_1_REG :	integer := 2;
	constant C_MODE_REG :				integer := 3;
	
	--Mode Register for test patterns
	constant C_RAMP_WAVE_MODE :			std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	constant C_SAW_WAVE_MODE :			std_logic_vector(31 downto 0) := "00000000000000000000000000000001";
	constant C_BIT_WAVE_MODE :			std_logic_vector(31 downto 0) := "00000000000000000000000000000010";
	
	
end AXIS_Peripheral_pkg;

package body AXIS_Peripheral_pkg is

end AXIS_Peripheral_pkg;
