// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
// Date        : Sat Feb  2 12:23:41 2019
// Host        : jonathan-Latitude-E7450 running 64-bit Linux Mint 18.1 Serena
// Command     : write_verilog -force -mode synth_stub
//               /home/jonathan/VivadoProjects/00_WATCHMANN/TARGETC_Prototype/hw/bd/base_zynq/ip/base_zynq_axistream_0_0/base_zynq_axistream_0_0_stub.v
// Design      : base_zynq_axistream_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "axistream,Vivado 2018.2" *)
module base_zynq_axistream_0_0(SW_nRST, TestStream, FIFOvalid, FIFOdata, 
  StreamReady, Cnt_AXIS_DATA, CNT_CLR, M_AXIS_ACLK, M_AXIS_ARESETN, M_AXIS_TVALID, 
  M_AXIS_TDATA, M_AXIS_TSTRB, M_AXIS_TLAST, M_AXIS_TREADY)
/* synthesis syn_black_box black_box_pad_pin="SW_nRST,TestStream,FIFOvalid,FIFOdata[31:0],StreamReady,Cnt_AXIS_DATA[9:0],CNT_CLR,M_AXIS_ACLK,M_AXIS_ARESETN,M_AXIS_TVALID,M_AXIS_TDATA[31:0],M_AXIS_TSTRB[3:0],M_AXIS_TLAST,M_AXIS_TREADY" */;
  input SW_nRST;
  input TestStream;
  input FIFOvalid;
  input [31:0]FIFOdata;
  output StreamReady;
  output [9:0]Cnt_AXIS_DATA;
  input CNT_CLR;
  input M_AXIS_ACLK;
  input M_AXIS_ARESETN;
  output M_AXIS_TVALID;
  output [31:0]M_AXIS_TDATA;
  output [3:0]M_AXIS_TSTRB;
  output M_AXIS_TLAST;
  input M_AXIS_TREADY;
endmodule
