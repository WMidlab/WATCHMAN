# Sadri - April - 20 - 2014 - Created ! 

# This TCL vivado script creates a simple MicroBlaze based system with a set of memory mapped AXI peripherals 
# Author : Mohammadsadegh Sadri 

# running the script: 
# 0 ) create a folder, then go inside the folder and then when you are within the folder run vivado
# 1 ) copy the run.tcl file that you have downloaded from googoolia zynq training to the folder and ... 
# 2 ) inside vivado, in the tcl command bar below the page : source run.tcl 
# 3 ) relax and watch the movie!
# 4 ) continue with synthesis and implementaion

#############################################################
#
# create project
#
#############################################################
create_project project_1 . -part xc7a200tfbg676-2
set_property board xilinx.com:artix7:ac701:1.0 [current_project]

#############################################################
#
# create block diagram
#
#############################################################
create_bd_design "design_1"

#############################################################
#
# Add Microblaze 
#
#############################################################
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:9.2 microblaze_0
endgroup

# Enable AXI Interfaces of MicroBlaze
startgroup
set_property -dict [list CONFIG.C_D_AXI {1} CONFIG.C_USE_ICACHE {1} CONFIG.C_USE_DCACHE {1}] [get_bd_cells microblaze_0]
endgroup

# block automation 
apply_bd_automation -rule xilinx.com:bd_rule:microblaze -config {local_mem "8KB" ecc "None" cache "8KB" debug_module "Debug Only" axi_periph "Enabled" axi_intc "1" clk "New Clocking Wizard (100 MHz)" }  [get_bd_cells microblaze_0]

# regenerate layout 
regenerate_bd_layout

#############################################################
#
# AXI Timer
#
#############################################################
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_timer:2.0 axi_timer_0
endgroup

# AXI timer is a slave for M_AXI_DP
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/microblaze_0 (Periph)" }  [get_bd_intf_pins axi_timer_0/S_AXI]

# AXI timer interrupt connection
connect_bd_net [get_bd_pins axi_timer_0/interrupt] [get_bd_pins microblaze_0_xlconcat/In0]


#############################################################
#
# AXI UART
#
#############################################################
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0
endgroup

# AXI Slave connection
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/microblaze_0 (Periph)" }  [get_bd_intf_pins axi_uartlite_0/S_AXI]

# UART Interface port
startgroup
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 UART
connect_bd_intf_net [get_bd_intf_pins axi_uartlite_0/UART] [get_bd_intf_ports /UART]
endgroup

# UART Interrupt 
connect_bd_net [get_bd_pins axi_uartlite_0/interrupt] [get_bd_pins microblaze_0_xlconcat/In1]

# regenerate
regenerate_bd_layout


#############################################################
#
# AXI DRAM Controller - MIG for Artix board
#
#############################################################
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:mig_7series:2.0 mig_7series_0
endgroup

# block automation for DRAM controller 
apply_bd_automation -rule xilinx.com:bd_rule:mig_7series -config {Board_Interface "DDR3_SDRAM" }  [get_bd_cells mig_7series_0]

# connection to cache interface 
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/microblaze_0 (Cached)" }  [get_bd_intf_pins mig_7series_0/S_AXI]

# regenerate layout
regenerate_bd_layout

#############################################################
#
# AXI BRAM Controller
#
#############################################################
# put there the axi bram controller
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:3.0 axi_bram_ctrl_0
endgroup

# put there the block memory 
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.1 blk_mem_gen_0
endgroup

# I want the axi bram controller to have just one slave ports 
set_property -dict [list CONFIG.SINGLE_PORT_BRAM {1}] [get_bd_cells axi_bram_ctrl_0]

# make connection between the axi bram controller and the block memory 
connect_bd_intf_net [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_0/BRAM_PORTA]

# update the axi interconnect with correct number of ports 
startgroup
set_property -dict [list CONFIG.NUM_MI {2}] [get_bd_cells axi_mem_intercon]
endgroup

# make connections 
connect_bd_intf_net [get_bd_intf_pins axi_mem_intercon/M01_AXI] [get_bd_intf_pins axi_bram_ctrl_0/S_AXI]
connect_bd_net -net [get_bd_nets microblaze_0_Clk] [get_bd_pins axi_bram_ctrl_0/s_axi_aclk] [get_bd_pins clk_wiz_1/clk_out1]
connect_bd_net -net [get_bd_nets rst_clk_wiz_1_100M_peripheral_aresetn] [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn] [get_bd_pins rst_clk_wiz_1_100M/peripheral_aresetn]

# update the address map 
assign_bd_address
set_property range 64K [get_bd_addr_segs {microblaze_0/Data/SEG_axi_bram_ctrl_0_Mem0}]
set_property range 64K [get_bd_addr_segs {microblaze_0/Instruction/SEG_axi_bram_ctrl_0_Mem0}]

#############################################################
#
# make additional required interfaces and ports 
#
#############################################################
startgroup
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 CLK_IN1_D
connect_bd_intf_net [get_bd_intf_pins clk_wiz_1/CLK_IN1_D] [get_bd_intf_ports /CLK_IN1_D]
endgroup

startgroup
create_bd_port -dir I -type rst sys_rst
set_property CONFIG.POLARITY [get_property CONFIG.POLARITY [get_bd_pins mig_7series_0/sys_rst]] [get_bd_ports /sys_rst]
connect_bd_net [get_bd_pins /mig_7series_0/sys_rst] [get_bd_ports /sys_rst]
endgroup

connect_bd_net -net [get_bd_nets sys_rst_1] [get_bd_ports sys_rst] [get_bd_pins clk_wiz_1/reset]

connect_bd_net -net [get_bd_nets sys_rst_1] [get_bd_ports sys_rst] [get_bd_pins rst_clk_wiz_1_100M/ext_reset_in]

regenerate_bd_layout -routing
regenerate_bd_layout

# end 
# This TCL vivado script creates a simple MicroBlaze based system with a set of memory mapped AXI peripherals 
# Author : Mohammadsadegh Sadri 
