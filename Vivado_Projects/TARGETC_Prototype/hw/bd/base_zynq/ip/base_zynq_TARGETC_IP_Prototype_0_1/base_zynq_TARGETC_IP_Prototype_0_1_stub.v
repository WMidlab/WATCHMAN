// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
// Date        : Thu Dec 20 09:11:01 2018
// Host        : jonathan-Latitude-E7450 running 64-bit Linux Mint 18.1 Serena
// Command     : write_verilog -force -mode synth_stub
//               /home/jonathan/VivadoProjects/00_WATCHMANN/TARGETC_Prototype/hw/bd/base_zynq/ip/base_zynq_TARGETC_IP_Prototype_0_1/base_zynq_TARGETC_IP_Prototype_0_1_stub.v
// Design      : base_zynq_TARGETC_IP_Prototype_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "TARGETC_IP_Prototype,Vivado 2018.2" *)
module base_zynq_TARGETC_IP_Prototype_0_1(RefCLK_i1, RefCLK_i2, tc_axi_aclk, 
  tc_axi_aresetn, tc_axi_awaddr, tc_axi_awprot, tc_axi_awvalid, tc_axi_awready, tc_axi_wdata, 
  tc_axi_wstrb, tc_axi_wvalid, tc_axi_wready, tc_axi_bresp, tc_axi_bvalid, tc_axi_bready, 
  tc_axi_araddr, tc_axi_arprot, tc_axi_arvalid, tc_axi_arready, tc_axi_rdata, tc_axi_rresp, 
  tc_axi_rvalid, tc_axi_rready, SIN, SCLK, PCLK, SHOUT, HSCLK_P, HSCLK_N, WR_RS_S0, WR_RS_S1, WR_CS_S0, 
  WR_CS_S1, WR_CS_S2, WR_CS_S3, WR_CS_S4, WR_CS_S5, GCC_RESET, WL_CLK_P, WL_CLK_N, RDAD_CLK, 
  RDAD_SIN, RDAD_DIR, SAMPLESEL_ANY, DO, SS_INCR, DOE, DONE, SS_RESET, REGCLR, SS_LD_SIN, SS_LD_DIR, 
  RAMP, SSTIN_P, SSTIN_N, MONTIMING_P, MONTIMING_N, WDOTime, DIGTime, Trigger, WDONbr, TestStream, 
  PSBusy, FIFOresponse, CH0, CH1, CH2, CH3, CH4, CH5, CH6, CH7, CH8, CH9, CH10, CH11, CH12, CH13, CH14, CH15, SSvalid, 
  TrigA, TrigB, TrigC, TrigD, TrigA_intr, TrigB_intr, TrigC_intr, TrigD_intr, SSVALID_INTR, SSTIN, 
  MONTIMING, RAMP_CNT)
/* synthesis syn_black_box black_box_pad_pin="RefCLK_i1,RefCLK_i2,tc_axi_aclk,tc_axi_aresetn,tc_axi_awaddr[31:0],tc_axi_awprot[2:0],tc_axi_awvalid,tc_axi_awready,tc_axi_wdata[31:0],tc_axi_wstrb[3:0],tc_axi_wvalid,tc_axi_wready,tc_axi_bresp[1:0],tc_axi_bvalid,tc_axi_bready,tc_axi_araddr[31:0],tc_axi_arprot[2:0],tc_axi_arvalid,tc_axi_arready,tc_axi_rdata[31:0],tc_axi_rresp[1:0],tc_axi_rvalid,tc_axi_rready,SIN,SCLK,PCLK,SHOUT,HSCLK_P,HSCLK_N,WR_RS_S0,WR_RS_S1,WR_CS_S0,WR_CS_S1,WR_CS_S2,WR_CS_S3,WR_CS_S4,WR_CS_S5,GCC_RESET,WL_CLK_P,WL_CLK_N,RDAD_CLK,RDAD_SIN,RDAD_DIR,SAMPLESEL_ANY,DO[15:0],SS_INCR,DOE,DONE,SS_RESET,REGCLR,SS_LD_SIN,SS_LD_DIR,RAMP,SSTIN_P,SSTIN_N,MONTIMING_P,MONTIMING_N,WDOTime[63:0],DIGTime[63:0],Trigger[31:0],WDONbr[8:0],TestStream,PSBusy,FIFOresponse,CH0[11:0],CH1[11:0],CH2[11:0],CH3[11:0],CH4[11:0],CH5[11:0],CH6[11:0],CH7[11:0],CH8[11:0],CH9[11:0],CH10[11:0],CH11[11:0],CH12[11:0],CH13[11:0],CH14[11:0],CH15[11:0],SSvalid,TrigA,TrigB,TrigC,TrigD,TrigA_intr,TrigB_intr,TrigC_intr,TrigD_intr,SSVALID_INTR,SSTIN,MONTIMING,RAMP_CNT" */;
  input RefCLK_i1;
  input RefCLK_i2;
  input tc_axi_aclk;
  input tc_axi_aresetn;
  input [31:0]tc_axi_awaddr;
  input [2:0]tc_axi_awprot;
  input tc_axi_awvalid;
  output tc_axi_awready;
  input [31:0]tc_axi_wdata;
  input [3:0]tc_axi_wstrb;
  input tc_axi_wvalid;
  output tc_axi_wready;
  output [1:0]tc_axi_bresp;
  output tc_axi_bvalid;
  input tc_axi_bready;
  input [31:0]tc_axi_araddr;
  input [2:0]tc_axi_arprot;
  input tc_axi_arvalid;
  output tc_axi_arready;
  output [31:0]tc_axi_rdata;
  output [1:0]tc_axi_rresp;
  output tc_axi_rvalid;
  input tc_axi_rready;
  output SIN;
  output SCLK;
  output PCLK;
  input SHOUT;
  output HSCLK_P;
  output HSCLK_N;
  output WR_RS_S0;
  output WR_RS_S1;
  output WR_CS_S0;
  output WR_CS_S1;
  output WR_CS_S2;
  output WR_CS_S3;
  output WR_CS_S4;
  output WR_CS_S5;
  output GCC_RESET;
  output WL_CLK_P;
  output WL_CLK_N;
  output RDAD_CLK;
  output RDAD_SIN;
  output RDAD_DIR;
  output SAMPLESEL_ANY;
  input [15:0]DO;
  output SS_INCR;
  output DOE;
  input DONE;
  output SS_RESET;
  output REGCLR;
  output SS_LD_SIN;
  output SS_LD_DIR;
  output RAMP;
  output SSTIN_P;
  output SSTIN_N;
  input MONTIMING_P;
  input MONTIMING_N;
  output [63:0]WDOTime;
  output [63:0]DIGTime;
  output [31:0]Trigger;
  output [8:0]WDONbr;
  output TestStream;
  output PSBusy;
  input FIFOresponse;
  output [11:0]CH0;
  output [11:0]CH1;
  output [11:0]CH2;
  output [11:0]CH3;
  output [11:0]CH4;
  output [11:0]CH5;
  output [11:0]CH6;
  output [11:0]CH7;
  output [11:0]CH8;
  output [11:0]CH9;
  output [11:0]CH10;
  output [11:0]CH11;
  output [11:0]CH12;
  output [11:0]CH13;
  output [11:0]CH14;
  output [11:0]CH15;
  output SSvalid;
  input TrigA;
  input TrigB;
  input TrigC;
  input TrigD;
  output TrigA_intr;
  output TrigB_intr;
  output TrigC_intr;
  output TrigD_intr;
  output SSVALID_INTR;
  output SSTIN;
  output MONTIMING;
  output RAMP_CNT;
endmodule
