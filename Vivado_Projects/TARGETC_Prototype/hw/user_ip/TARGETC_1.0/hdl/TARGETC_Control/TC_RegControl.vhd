library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.TARGETC_pkg.all;
use work.Register_pkg.all;
use work.AXI_Lite_pkg.all;

entity TC_REGControl is
	port (
	-- TARGET C Ports for control and functi
		AXI_clk:		in std_logic;
		AXI_rst:		in std_logic;
		
		CtrlBusOut:		out CtrlSignalBus_Outputs;
		CtrlBusIn:		in 	CtrlSignalBus_Inputs;	
		
		TCReg:			inout slv_array(0 to TC_REGISTER_NUMBER)	
	);
end TC_REGControl;

architecture arch_imp of TC_REGControl is

	-- --------------------------------------------------------------------------------
	-- Signal Declaration
	
    signal start_write_stm : Pulse_State_Type := IDLE; 
    signal ss_incr_stm : Pulse_State_Type := IDLE; 
    
    signal TC_ADDR_s :	std_logic_vector(6 downto 0);
    signal TC_DATA_s:	std_logic_vector(11 downto 0);
    
  
begin

 
    
end arch_imp;
