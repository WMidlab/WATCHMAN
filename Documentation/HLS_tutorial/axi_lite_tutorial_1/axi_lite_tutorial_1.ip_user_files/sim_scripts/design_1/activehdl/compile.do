vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/smartconnect_v1_0
vlib activehdl/axi_protocol_checker_v2_0_2
vlib activehdl/axi_vip_v1_1_2
vlib activehdl/processing_system7_vip_v1_0_4
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/proc_sys_reset_v5_0_12
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/fifo_generator_v13_2_2
vlib activehdl/axi_data_fifo_v2_1_15
vlib activehdl/axi_register_slice_v2_1_16
vlib activehdl/axi_protocol_converter_v2_1_16

vmap xilinx_vip activehdl/xilinx_vip
vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap smartconnect_v1_0 activehdl/smartconnect_v1_0
vmap axi_protocol_checker_v2_0_2 activehdl/axi_protocol_checker_v2_0_2
vmap axi_vip_v1_1_2 activehdl/axi_vip_v1_1_2
vmap processing_system7_vip_v1_0_4 activehdl/processing_system7_vip_v1_0_4
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_12 activehdl/proc_sys_reset_v5_0_12
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_2_2 activehdl/fifo_generator_v13_2_2
vmap axi_data_fifo_v2_1_15 activehdl/axi_data_fifo_v2_1_15
vmap axi_register_slice_v2_1_16 activehdl/axi_register_slice_v2_1_16
vmap axi_protocol_converter_v2_1_16 activehdl/axi_protocol_converter_v2_1_16

vlog -work xilinx_vip  -sv2k12 "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/sc_util_v1_0_vl_rfs.sv" \

vlog -work axi_protocol_checker_v2_0_2  -sv2k12 "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/3755/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \

vlog -work axi_vip_v1_1_2  -sv2k12 "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/725c/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_4  -sv2k12 "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ipshared/b5dc/hdl/custom_axi_lite_v1_0_S00_AXI.vhd" \
"../../../bd/design_1/ipshared/b5dc/hdl/custom_axi_lite_v1_0.vhd" \
"../../../bd/design_1/ip/design_1_custom_axi_lite_0_0/sim/design_1_custom_axi_lite_0_0.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_12 -93 \
"../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_rst_ps7_0_100M_0/sim/design_1_rst_ps7_0_100M_0.vhd" \
"../../../bd/design_1/sim/design_1.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_2  -v2k5 "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/7aff/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_2 -93 \
"../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_2  -v2k5 "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_15  -v2k5 "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/d114/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_16  -v2k5 "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/0cde/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_16  -v2k5 "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/1229/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../axi_lite_tutorial_1.srcs/sources_1/bd/design_1/ipshared/b193/hdl" "+incdir+C:/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_auto_pc_0/sim/design_1_auto_pc_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

