// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Mon Aug 13 11:42:54 2018
// Host        : idlab52-OptiPlex-790 running 64-bit Ubuntu 14.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/idlab-52/Desktop/GitVivado/WATCHMAN/prototype_watchman/prototype_watchman.srcs/sources_1/bd/prototype_watchman/ip/prototype_watchman_xlconstant_0_0/prototype_watchman_xlconstant_0_0_stub.v
// Design      : prototype_watchman_xlconstant_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "xlconstant_v1_1_4_xlconstant,Vivado 2018.1" *)
module prototype_watchman_xlconstant_0_0(dout)
/* synthesis syn_black_box black_box_pad_pin="dout[0:0]" */;
  output [0:0]dout;
endmodule
