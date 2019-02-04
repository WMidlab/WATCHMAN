# ----------------------------------------------------------------------------
# IMPLEMENTATION Constraint File
# ----------------------------------------------------------------------------

#set_property DONT_TOUCH true [get_cells base_zynq_i/TARGETC_0/U0/TC_Control_inst/axi_rdata*]
#set_property DONT_TOUCH true [get_cells base_zynq_i/TARGETC_0/U0/TC_SerialRegCtrl_inst/axi_rdata*]
#set_property DONT_TOUCH true [get_cells base_zynq_i/FifoManager_0/U0/FSM_sequential_fifo_wr_stm*]
#set_property DONT_TOUCH true [get_cells base_zynq_i/TARGETC_IP_Prototype_0/U0/TC_RoundBuffer/WDOCONTROL/flg_TE_i*]

#set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets base_zynq_i/TARGETC_0/U0/TC_Control_inst/axi_rdata*]
#set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets base_zynq_i/TARGETC_0/U0/TC_Control_inst/data0*]
#set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets base_zynq_i/TARGETC_0/U0/TC_SerialRegCtrl_inst/axi_rdata*]
#set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets base_zynq_i/FifoManager_0/U0/FSM_sequential_fifo_wr_stm*]

set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CPULAST/PrevAddr_s*]
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CPU_CONTROLLER_inst/NEXTBus_intl*]
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CPU_CONTROLLER_inst/PrevAddr_s*]