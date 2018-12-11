library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Package for the use
package AXI_Lite_pkg is

	constant C_S_AXI_DATA_WIDTH	: integer	:= 32;
	constant C_S_AXI_ADDR_WIDTH	: integer	:= 32;
			
	type AXI_Lite_Inputs is record
		aclk	:  std_logic;
		aresetn	:  std_logic;
		awaddr	:  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		awprot	:  std_logic_vector(2 downto 0);
		awvalid	:  std_logic;
		wdata	:  std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		wstrb	:  std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		wvalid	:  std_logic;
		bready	:  std_logic;
		araddr	:  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		arprot	:  std_logic_vector(2 downto 0);
		arvalid	:  std_logic;
		rready	:  std_logic;	
	end record;
	
	type AXI_Lite_Outputs is record
		awready	:  std_logic;
		wready	:  std_logic;
		bresp	:  std_logic_vector(1 downto 0);
		bvalid	:  std_logic;
		arready	:  std_logic;
		rdata	:  std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		rresp	:  std_logic_vector(1 downto 0);
		rvalid	:  std_logic;	
		--User Added
		intr	:	std_logic;	
	end record;
	
end AXI_Lite_pkg;

package body AXI_Lite_pkg is

end AXI_Lite_pkg;
