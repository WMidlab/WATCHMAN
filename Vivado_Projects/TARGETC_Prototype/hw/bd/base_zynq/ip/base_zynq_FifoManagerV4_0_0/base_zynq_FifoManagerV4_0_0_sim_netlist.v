// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
// Date        : Tue Jan  8 11:26:52 2019
// Host        : jonathan-Latitude-E7450 running 64-bit Linux Mint 18.1 Serena
// Command     : write_verilog -force -mode funcsim {/home/jonathan/Desktop/Link to
//               TARGETC_Prototype/hw/bd/base_zynq/ip/base_zynq_FifoManagerV4_0_0/base_zynq_FifoManagerV4_0_0_sim_netlist.v}
// Design      : base_zynq_FifoManagerV4_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "base_zynq_FifoManagerV4_0_0,FifoManagerV4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "FifoManagerV4,Vivado 2018.2" *) 
(* NotValidForBitStream *)
module base_zynq_FifoManagerV4_0_0
   (nRST,
    CLK,
    PRECvalid,
    FIFOresponse,
    WDOTime,
    DIGTime,
    Trigger,
    WDONBR,
    CH0,
    CH1,
    CH2,
    CH3,
    CH4,
    CH5,
    CH6,
    CH7,
    CH8,
    CH9,
    CH10,
    CH11,
    CH12,
    CH13,
    CH14,
    CH15,
    FIFOvalid,
    ready_i,
    PSBUSY_i,
    DataOut);
  input nRST;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 CLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME CLK, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN base_zynq_processing_system7_0_0_FCLK_CLK0" *) input CLK;
  input PRECvalid;
  output FIFOresponse;
  input [63:0]WDOTime;
  input [63:0]DIGTime;
  input [31:0]Trigger;
  input [8:0]WDONBR;
  input [11:0]CH0;
  input [11:0]CH1;
  input [11:0]CH2;
  input [11:0]CH3;
  input [11:0]CH4;
  input [11:0]CH5;
  input [11:0]CH6;
  input [11:0]CH7;
  input [11:0]CH8;
  input [11:0]CH9;
  input [11:0]CH10;
  input [11:0]CH11;
  input [11:0]CH12;
  input [11:0]CH13;
  input [11:0]CH14;
  input [11:0]CH15;
  output FIFOvalid;
  input ready_i;
  input PSBUSY_i;
  output [31:0]DataOut;

  wire [11:0]CH0;
  wire [11:0]CH1;
  wire [11:0]CH10;
  wire [11:0]CH11;
  wire [11:0]CH12;
  wire [11:0]CH13;
  wire [11:0]CH14;
  wire [11:0]CH15;
  wire [11:0]CH2;
  wire [11:0]CH3;
  wire [11:0]CH4;
  wire [11:0]CH5;
  wire [11:0]CH6;
  wire [11:0]CH7;
  wire [11:0]CH8;
  wire [11:0]CH9;
  wire CLK;
  wire [63:0]DIGTime;
  wire [31:0]DataOut;
  wire FIFOresponse;
  wire FIFOvalid;
  wire PRECvalid;
  wire PSBUSY_i;
  wire [31:0]Trigger;
  wire [8:0]WDONBR;
  wire [63:0]WDOTime;
  wire nRST;
  wire ready_i;

  base_zynq_FifoManagerV4_0_0_FifoManagerV4 U0
       (.CH0(CH0),
        .CH1(CH1),
        .CH10(CH10),
        .CH11(CH11),
        .CH12(CH12),
        .CH13(CH13),
        .CH14(CH14),
        .CH15(CH15),
        .CH2(CH2),
        .CH3(CH3),
        .CH4(CH4),
        .CH5(CH5),
        .CH6(CH6),
        .CH7(CH7),
        .CH8(CH8),
        .CH9(CH9),
        .CLK(CLK),
        .DIGTime(DIGTime),
        .DataOut(DataOut),
        .FIFOresponse(FIFOresponse),
        .FIFOvalid(FIFOvalid),
        .PRECvalid(PRECvalid),
        .PSBUSY_i(PSBUSY_i),
        .Trigger(Trigger),
        .WDONBR(WDONBR),
        .WDOTime(WDOTime),
        .nRST(nRST),
        .ready_i(ready_i));
endmodule

(* ORIG_REF_NAME = "FifoManagerV4" *) 
module base_zynq_FifoManagerV4_0_0_FifoManagerV4
   (DataOut,
    FIFOresponse,
    FIFOvalid,
    ready_i,
    nRST,
    CLK,
    WDOTime,
    DIGTime,
    WDONBR,
    CH0,
    CH1,
    CH2,
    CH3,
    CH4,
    CH5,
    CH6,
    CH7,
    CH8,
    CH9,
    CH10,
    CH11,
    CH12,
    CH13,
    CH14,
    CH15,
    PSBUSY_i,
    PRECvalid,
    Trigger);
  output [31:0]DataOut;
  output FIFOresponse;
  output FIFOvalid;
  input ready_i;
  input nRST;
  input CLK;
  input [63:0]WDOTime;
  input [63:0]DIGTime;
  input [8:0]WDONBR;
  input [11:0]CH0;
  input [11:0]CH1;
  input [11:0]CH2;
  input [11:0]CH3;
  input [11:0]CH4;
  input [11:0]CH5;
  input [11:0]CH6;
  input [11:0]CH7;
  input [11:0]CH8;
  input [11:0]CH9;
  input [11:0]CH10;
  input [11:0]CH11;
  input [11:0]CH12;
  input [11:0]CH13;
  input [11:0]CH14;
  input [11:0]CH15;
  input PSBUSY_i;
  input PRECvalid;
  input [31:0]Trigger;

  wire [11:0]CH0;
  wire [11:0]CH1;
  wire [11:0]CH10;
  wire [11:0]CH11;
  wire [11:0]CH12;
  wire [11:0]CH13;
  wire [11:0]CH14;
  wire [11:0]CH15;
  wire [11:0]CH2;
  wire [11:0]CH3;
  wire [11:0]CH4;
  wire [11:0]CH5;
  wire [11:0]CH6;
  wire [11:0]CH7;
  wire [11:0]CH8;
  wire [11:0]CH9;
  wire CLK;
  wire [63:0]DIGTime;
  wire \DIGTime_intl_reg_n_0_[0] ;
  wire \DIGTime_intl_reg_n_0_[10] ;
  wire \DIGTime_intl_reg_n_0_[11] ;
  wire \DIGTime_intl_reg_n_0_[12] ;
  wire \DIGTime_intl_reg_n_0_[13] ;
  wire \DIGTime_intl_reg_n_0_[14] ;
  wire \DIGTime_intl_reg_n_0_[15] ;
  wire \DIGTime_intl_reg_n_0_[16] ;
  wire \DIGTime_intl_reg_n_0_[17] ;
  wire \DIGTime_intl_reg_n_0_[18] ;
  wire \DIGTime_intl_reg_n_0_[19] ;
  wire \DIGTime_intl_reg_n_0_[1] ;
  wire \DIGTime_intl_reg_n_0_[20] ;
  wire \DIGTime_intl_reg_n_0_[21] ;
  wire \DIGTime_intl_reg_n_0_[22] ;
  wire \DIGTime_intl_reg_n_0_[23] ;
  wire \DIGTime_intl_reg_n_0_[24] ;
  wire \DIGTime_intl_reg_n_0_[25] ;
  wire \DIGTime_intl_reg_n_0_[26] ;
  wire \DIGTime_intl_reg_n_0_[27] ;
  wire \DIGTime_intl_reg_n_0_[28] ;
  wire \DIGTime_intl_reg_n_0_[29] ;
  wire \DIGTime_intl_reg_n_0_[2] ;
  wire \DIGTime_intl_reg_n_0_[30] ;
  wire \DIGTime_intl_reg_n_0_[31] ;
  wire \DIGTime_intl_reg_n_0_[3] ;
  wire \DIGTime_intl_reg_n_0_[4] ;
  wire \DIGTime_intl_reg_n_0_[5] ;
  wire \DIGTime_intl_reg_n_0_[6] ;
  wire \DIGTime_intl_reg_n_0_[7] ;
  wire \DIGTime_intl_reg_n_0_[8] ;
  wire \DIGTime_intl_reg_n_0_[9] ;
  wire [31:0]DataOut;
  wire \DataOut[12]_i_1_n_0 ;
  wire \DataOut[13]_i_1_n_0 ;
  wire \DataOut[14]_i_1_n_0 ;
  wire \DataOut[15]_i_1_n_0 ;
  wire \DataOut[16]_i_1_n_0 ;
  wire \DataOut[17]_i_1_n_0 ;
  wire \DataOut[18]_i_1_n_0 ;
  wire \DataOut[19]_i_1_n_0 ;
  wire \DataOut[20]_i_1_n_0 ;
  wire \DataOut[21]_i_1_n_0 ;
  wire \DataOut[22]_i_1_n_0 ;
  wire \DataOut[23]_i_1_n_0 ;
  wire \DataOut[24]_i_1_n_0 ;
  wire \DataOut[25]_i_1_n_0 ;
  wire \DataOut[26]_i_1_n_0 ;
  wire \DataOut[27]_i_1_n_0 ;
  wire \DataOut[28]_i_1_n_0 ;
  wire \DataOut[29]_i_1_n_0 ;
  wire \DataOut[30]_i_1_n_0 ;
  wire \DataOut[31]_i_1_n_0 ;
  wire \DataOut[31]_i_2_n_0 ;
  wire [11:0]DataOut_intlD;
  wire [31:0]DataOut_intlH;
  wire \DataOut_intlH[0]_i_1_n_0 ;
  wire \DataOut_intlH[0]_i_2_n_0 ;
  wire \DataOut_intlH[0]_i_3_n_0 ;
  wire \DataOut_intlH[10]_i_1_n_0 ;
  wire \DataOut_intlH[10]_i_2_n_0 ;
  wire \DataOut_intlH[11]_i_1_n_0 ;
  wire \DataOut_intlH[11]_i_2_n_0 ;
  wire \DataOut_intlH[12]_i_1_n_0 ;
  wire \DataOut_intlH[12]_i_2_n_0 ;
  wire \DataOut_intlH[13]_i_1_n_0 ;
  wire \DataOut_intlH[13]_i_2_n_0 ;
  wire \DataOut_intlH[14]_i_1_n_0 ;
  wire \DataOut_intlH[14]_i_2_n_0 ;
  wire \DataOut_intlH[15]_i_1_n_0 ;
  wire \DataOut_intlH[15]_i_2_n_0 ;
  wire \DataOut_intlH[16]_i_1_n_0 ;
  wire \DataOut_intlH[16]_i_2_n_0 ;
  wire \DataOut_intlH[17]_i_1_n_0 ;
  wire \DataOut_intlH[17]_i_2_n_0 ;
  wire \DataOut_intlH[18]_i_1_n_0 ;
  wire \DataOut_intlH[18]_i_2_n_0 ;
  wire \DataOut_intlH[19]_i_1_n_0 ;
  wire \DataOut_intlH[19]_i_2_n_0 ;
  wire \DataOut_intlH[1]_i_1_n_0 ;
  wire \DataOut_intlH[1]_i_2_n_0 ;
  wire \DataOut_intlH[1]_i_3_n_0 ;
  wire \DataOut_intlH[20]_i_1_n_0 ;
  wire \DataOut_intlH[20]_i_2_n_0 ;
  wire \DataOut_intlH[21]_i_1_n_0 ;
  wire \DataOut_intlH[21]_i_2_n_0 ;
  wire \DataOut_intlH[22]_i_1_n_0 ;
  wire \DataOut_intlH[22]_i_2_n_0 ;
  wire \DataOut_intlH[23]_i_1_n_0 ;
  wire \DataOut_intlH[23]_i_2_n_0 ;
  wire \DataOut_intlH[24]_i_1_n_0 ;
  wire \DataOut_intlH[24]_i_2_n_0 ;
  wire \DataOut_intlH[25]_i_1_n_0 ;
  wire \DataOut_intlH[25]_i_2_n_0 ;
  wire \DataOut_intlH[26]_i_1_n_0 ;
  wire \DataOut_intlH[26]_i_2_n_0 ;
  wire \DataOut_intlH[27]_i_1_n_0 ;
  wire \DataOut_intlH[27]_i_2_n_0 ;
  wire \DataOut_intlH[28]_i_1_n_0 ;
  wire \DataOut_intlH[28]_i_2_n_0 ;
  wire \DataOut_intlH[29]_i_1_n_0 ;
  wire \DataOut_intlH[29]_i_2_n_0 ;
  wire \DataOut_intlH[2]_i_1_n_0 ;
  wire \DataOut_intlH[2]_i_2_n_0 ;
  wire \DataOut_intlH[2]_i_3_n_0 ;
  wire \DataOut_intlH[30]_i_1_n_0 ;
  wire \DataOut_intlH[30]_i_2_n_0 ;
  wire \DataOut_intlH[31]_i_1_n_0 ;
  wire \DataOut_intlH[31]_i_2_n_0 ;
  wire \DataOut_intlH[31]_i_3_n_0 ;
  wire \DataOut_intlH[31]_i_4_n_0 ;
  wire \DataOut_intlH[3]_i_1_n_0 ;
  wire \DataOut_intlH[3]_i_2_n_0 ;
  wire \DataOut_intlH[3]_i_3_n_0 ;
  wire \DataOut_intlH[4]_i_1_n_0 ;
  wire \DataOut_intlH[4]_i_2_n_0 ;
  wire \DataOut_intlH[4]_i_3_n_0 ;
  wire \DataOut_intlH[5]_i_1_n_0 ;
  wire \DataOut_intlH[5]_i_2_n_0 ;
  wire \DataOut_intlH[5]_i_3_n_0 ;
  wire \DataOut_intlH[6]_i_1_n_0 ;
  wire \DataOut_intlH[6]_i_2_n_0 ;
  wire \DataOut_intlH[6]_i_3_n_0 ;
  wire \DataOut_intlH[7]_i_1_n_0 ;
  wire \DataOut_intlH[7]_i_2_n_0 ;
  wire \DataOut_intlH[7]_i_3_n_0 ;
  wire \DataOut_intlH[8]_i_1_n_0 ;
  wire \DataOut_intlH[8]_i_2_n_0 ;
  wire \DataOut_intlH[8]_i_3_n_0 ;
  wire \DataOut_intlH[9]_i_1_n_0 ;
  wire \DataOut_intlH[9]_i_2_n_0 ;
  wire DataOut_last;
  wire \DataOut_last_reg_n_0_[0] ;
  wire \DataOut_last_reg_n_0_[10] ;
  wire \DataOut_last_reg_n_0_[11] ;
  wire \DataOut_last_reg_n_0_[12] ;
  wire \DataOut_last_reg_n_0_[13] ;
  wire \DataOut_last_reg_n_0_[14] ;
  wire \DataOut_last_reg_n_0_[15] ;
  wire \DataOut_last_reg_n_0_[16] ;
  wire \DataOut_last_reg_n_0_[17] ;
  wire \DataOut_last_reg_n_0_[18] ;
  wire \DataOut_last_reg_n_0_[19] ;
  wire \DataOut_last_reg_n_0_[1] ;
  wire \DataOut_last_reg_n_0_[20] ;
  wire \DataOut_last_reg_n_0_[21] ;
  wire \DataOut_last_reg_n_0_[22] ;
  wire \DataOut_last_reg_n_0_[23] ;
  wire \DataOut_last_reg_n_0_[24] ;
  wire \DataOut_last_reg_n_0_[25] ;
  wire \DataOut_last_reg_n_0_[26] ;
  wire \DataOut_last_reg_n_0_[27] ;
  wire \DataOut_last_reg_n_0_[28] ;
  wire \DataOut_last_reg_n_0_[29] ;
  wire \DataOut_last_reg_n_0_[2] ;
  wire \DataOut_last_reg_n_0_[30] ;
  wire \DataOut_last_reg_n_0_[31] ;
  wire \DataOut_last_reg_n_0_[3] ;
  wire \DataOut_last_reg_n_0_[4] ;
  wire \DataOut_last_reg_n_0_[5] ;
  wire \DataOut_last_reg_n_0_[6] ;
  wire \DataOut_last_reg_n_0_[7] ;
  wire \DataOut_last_reg_n_0_[8] ;
  wire \DataOut_last_reg_n_0_[9] ;
  wire [11:0]DataOut_stall;
  wire \DataOut_stall[11]_i_1_n_0 ;
  wire \FIFO_RD[busy]_i_1_n_0 ;
  wire \FIFO_RD[response]_i_1_n_0 ;
  wire \FIFO_RD_reg[busy]__0 ;
  wire \FIFO_RD_reg[response_n_0_] ;
  wire \FIFO_WR[response]_i_1_n_0 ;
  wire \FIFO_WR_reg[valid]0 ;
  wire \FIFO_WR_reg[valid_n_0_] ;
  wire FIFOresponse;
  wire FIFOvalid;
  wire FIFOvalid_i_1_n_0;
  wire FIFOvalid_i_3_n_0;
  wire \FSM_sequential_fifo_wr_stm[0]_i_2_n_0 ;
  wire \FSM_sequential_fifo_wr_stm[0]_i_5_n_0 ;
  wire \GEN_FIFO[0].FIFOCH_n_0 ;
  wire \GEN_FIFO[0].FIFOCH_n_1 ;
  wire \GEN_FIFO[0].FIFOCH_n_2 ;
  wire \GEN_FIFO[0].FIFOCH_n_3 ;
  wire \GEN_FIFO[0].FIFOCH_n_4 ;
  wire \GEN_FIFO[10].FIFOCH_n_0 ;
  wire \GEN_FIFO[10].FIFOCH_n_1 ;
  wire \GEN_FIFO[10].FIFOCH_n_2 ;
  wire \GEN_FIFO[11].FIFOCH_n_0 ;
  wire \GEN_FIFO[11].FIFOCH_n_1 ;
  wire \GEN_FIFO[11].FIFOCH_n_10 ;
  wire \GEN_FIFO[11].FIFOCH_n_11 ;
  wire \GEN_FIFO[11].FIFOCH_n_12 ;
  wire \GEN_FIFO[11].FIFOCH_n_2 ;
  wire \GEN_FIFO[11].FIFOCH_n_3 ;
  wire \GEN_FIFO[11].FIFOCH_n_4 ;
  wire \GEN_FIFO[11].FIFOCH_n_5 ;
  wire \GEN_FIFO[11].FIFOCH_n_6 ;
  wire \GEN_FIFO[11].FIFOCH_n_7 ;
  wire \GEN_FIFO[11].FIFOCH_n_8 ;
  wire \GEN_FIFO[11].FIFOCH_n_9 ;
  wire \GEN_FIFO[12].FIFOCH_n_0 ;
  wire \GEN_FIFO[12].FIFOCH_n_1 ;
  wire \GEN_FIFO[13].FIFOCH_n_0 ;
  wire \GEN_FIFO[13].FIFOCH_n_1 ;
  wire \GEN_FIFO[13].FIFOCH_n_2 ;
  wire \GEN_FIFO[13].FIFOCH_n_3 ;
  wire \GEN_FIFO[13].FIFOCH_n_4 ;
  wire \GEN_FIFO[14].FIFOCH_n_0 ;
  wire \GEN_FIFO[15].FIFOCH_n_0 ;
  wire \GEN_FIFO[15].FIFOCH_n_1 ;
  wire \GEN_FIFO[15].FIFOCH_n_10 ;
  wire \GEN_FIFO[15].FIFOCH_n_11 ;
  wire \GEN_FIFO[15].FIFOCH_n_12 ;
  wire \GEN_FIFO[15].FIFOCH_n_2 ;
  wire \GEN_FIFO[15].FIFOCH_n_3 ;
  wire \GEN_FIFO[15].FIFOCH_n_4 ;
  wire \GEN_FIFO[15].FIFOCH_n_5 ;
  wire \GEN_FIFO[15].FIFOCH_n_6 ;
  wire \GEN_FIFO[15].FIFOCH_n_7 ;
  wire \GEN_FIFO[15].FIFOCH_n_8 ;
  wire \GEN_FIFO[15].FIFOCH_n_9 ;
  wire \GEN_FIFO[1].FIFOCH_n_0 ;
  wire \GEN_FIFO[1].FIFOCH_n_1 ;
  wire \GEN_FIFO[1].FIFOCH_n_2 ;
  wire \GEN_FIFO[1].FIFOCH_n_3 ;
  wire \GEN_FIFO[2].FIFOCH_n_0 ;
  wire \GEN_FIFO[2].FIFOCH_n_1 ;
  wire \GEN_FIFO[2].FIFOCH_n_3 ;
  wire \GEN_FIFO[2].FIFOCH_n_4 ;
  wire \GEN_FIFO[2].FIFOCH_n_5 ;
  wire \GEN_FIFO[3].FIFOCH_n_0 ;
  wire \GEN_FIFO[3].FIFOCH_n_1 ;
  wire \GEN_FIFO[3].FIFOCH_n_10 ;
  wire \GEN_FIFO[3].FIFOCH_n_11 ;
  wire \GEN_FIFO[3].FIFOCH_n_12 ;
  wire \GEN_FIFO[3].FIFOCH_n_13 ;
  wire \GEN_FIFO[3].FIFOCH_n_2 ;
  wire \GEN_FIFO[3].FIFOCH_n_3 ;
  wire \GEN_FIFO[3].FIFOCH_n_4 ;
  wire \GEN_FIFO[3].FIFOCH_n_5 ;
  wire \GEN_FIFO[3].FIFOCH_n_6 ;
  wire \GEN_FIFO[3].FIFOCH_n_7 ;
  wire \GEN_FIFO[3].FIFOCH_n_8 ;
  wire \GEN_FIFO[3].FIFOCH_n_9 ;
  wire \GEN_FIFO[4].FIFOCH_n_0 ;
  wire \GEN_FIFO[5].FIFOCH_n_0 ;
  wire \GEN_FIFO[5].FIFOCH_n_1 ;
  wire \GEN_FIFO[6].FIFOCH_n_0 ;
  wire \GEN_FIFO[6].FIFOCH_n_1 ;
  wire \GEN_FIFO[6].FIFOCH_n_2 ;
  wire \GEN_FIFO[7].FIFOCH_n_0 ;
  wire \GEN_FIFO[7].FIFOCH_n_1 ;
  wire \GEN_FIFO[7].FIFOCH_n_10 ;
  wire \GEN_FIFO[7].FIFOCH_n_11 ;
  wire \GEN_FIFO[7].FIFOCH_n_12 ;
  wire \GEN_FIFO[7].FIFOCH_n_13 ;
  wire \GEN_FIFO[7].FIFOCH_n_14 ;
  wire \GEN_FIFO[7].FIFOCH_n_2 ;
  wire \GEN_FIFO[7].FIFOCH_n_3 ;
  wire \GEN_FIFO[7].FIFOCH_n_4 ;
  wire \GEN_FIFO[7].FIFOCH_n_5 ;
  wire \GEN_FIFO[7].FIFOCH_n_6 ;
  wire \GEN_FIFO[7].FIFOCH_n_7 ;
  wire \GEN_FIFO[7].FIFOCH_n_8 ;
  wire \GEN_FIFO[7].FIFOCH_n_9 ;
  wire \GEN_FIFO[8].FIFOCH_n_0 ;
  wire \GEN_FIFO[8].FIFOCH_n_1 ;
  wire \GEN_FIFO[8].FIFOCH_n_2 ;
  wire \GEN_FIFO[9].FIFOCH_n_0 ;
  wire \GEN_FIFO[9].FIFOCH_n_1 ;
  wire \GEN_FIFO[9].FIFOCH_n_2 ;
  wire \GEN_FIFO[9].FIFOCH_n_3 ;
  wire PRECvalid;
  wire PSBUSY_i;
  wire [31:0]Trigger;
  wire [8:0]WDONBR;
  wire [8:0]WDONBR_intl;
  wire [63:0]WDOTime;
  wire WDOTime_intl0;
  wire \WDOTime_intl_reg_n_0_[0] ;
  wire \WDOTime_intl_reg_n_0_[10] ;
  wire \WDOTime_intl_reg_n_0_[11] ;
  wire \WDOTime_intl_reg_n_0_[12] ;
  wire \WDOTime_intl_reg_n_0_[13] ;
  wire \WDOTime_intl_reg_n_0_[14] ;
  wire \WDOTime_intl_reg_n_0_[15] ;
  wire \WDOTime_intl_reg_n_0_[16] ;
  wire \WDOTime_intl_reg_n_0_[17] ;
  wire \WDOTime_intl_reg_n_0_[18] ;
  wire \WDOTime_intl_reg_n_0_[19] ;
  wire \WDOTime_intl_reg_n_0_[1] ;
  wire \WDOTime_intl_reg_n_0_[20] ;
  wire \WDOTime_intl_reg_n_0_[21] ;
  wire \WDOTime_intl_reg_n_0_[22] ;
  wire \WDOTime_intl_reg_n_0_[23] ;
  wire \WDOTime_intl_reg_n_0_[24] ;
  wire \WDOTime_intl_reg_n_0_[25] ;
  wire \WDOTime_intl_reg_n_0_[26] ;
  wire \WDOTime_intl_reg_n_0_[27] ;
  wire \WDOTime_intl_reg_n_0_[28] ;
  wire \WDOTime_intl_reg_n_0_[29] ;
  wire \WDOTime_intl_reg_n_0_[2] ;
  wire \WDOTime_intl_reg_n_0_[30] ;
  wire \WDOTime_intl_reg_n_0_[31] ;
  wire \WDOTime_intl_reg_n_0_[3] ;
  wire \WDOTime_intl_reg_n_0_[4] ;
  wire \WDOTime_intl_reg_n_0_[5] ;
  wire \WDOTime_intl_reg_n_0_[6] ;
  wire \WDOTime_intl_reg_n_0_[7] ;
  wire \WDOTime_intl_reg_n_0_[8] ;
  wire \WDOTime_intl_reg_n_0_[9] ;
  wire [3:0]address;
  wire cnt_fifo0;
  wire \cnt_fifo[0]_i_1_n_0 ;
  wire \cnt_fifo[0]_i_2_n_0 ;
  wire \cnt_fifo[1]_i_1_n_0 ;
  wire \cnt_fifo[2]_i_1_n_0 ;
  wire \cnt_fifo[2]_i_2_n_0 ;
  wire \cnt_fifo[3]_i_1_n_0 ;
  wire \cnt_fifo[4]_i_1_n_0 ;
  wire \cnt_fifo[5]_i_1_n_0 ;
  wire \cnt_fifo[6]_i_1_n_0 ;
  wire \cnt_fifo[7]_i_1_n_0 ;
  wire \cnt_fifo[8]_i_1_n_0 ;
  wire \cnt_fifo[8]_i_3_n_0 ;
  wire \cnt_fifo[8]_i_4_n_0 ;
  wire \cnt_fifo_reg_n_0_[0] ;
  wire \cnt_fifo_reg_n_0_[1] ;
  wire \cnt_fifo_reg_n_0_[2] ;
  wire \cnt_fifo_reg_n_0_[3] ;
  wire \cnt_fifo_reg_n_0_[4] ;
  wire [31:0]data1;
  wire [31:0]data3;
  wire [3:0]fifo_rd_stm;
  wire fifo_rd_stm0;
  wire \fifo_rd_stm[0]_i_2_n_0 ;
  wire \fifo_rd_stm[0]_i_3_n_0 ;
  wire \fifo_rd_stm[0]_i_4_n_0 ;
  wire \fifo_rd_stm[0]_i_5_n_0 ;
  wire \fifo_rd_stm[0]_i_6_n_0 ;
  wire \fifo_rd_stm[0]_i_7_n_0 ;
  wire \fifo_rd_stm[1]_i_2_n_0 ;
  wire \fifo_rd_stm[1]_i_3_n_0 ;
  wire \fifo_rd_stm[2]_i_2_n_0 ;
  wire \fifo_rd_stm[2]_i_3_n_0 ;
  wire \fifo_rd_stm[2]_i_4_n_0 ;
  wire \fifo_rd_stm[2]_i_5_n_0 ;
  wire \fifo_rd_stm[3]_i_3_n_0 ;
  wire \fifo_rd_stm_reg_n_0_[0] ;
  wire \fifo_rd_stm_reg_n_0_[1] ;
  wire \fifo_rd_stm_reg_n_0_[2] ;
  wire \fifo_rd_stm_reg_n_0_[3] ;
  (* RTL_KEEP = "yes" *) wire [2:0]fifo_wr_stm;
  wire [2:0]last_fifo_rd_stm;
  wire \last_fifo_rd_stm[0]_i_1_n_0 ;
  wire \last_fifo_rd_stm[2]_i_1_n_0 ;
  wire nRST;
  wire p_0_in;
  wire [31:0]p_1_in;
  wire [11:0]\rd_data12[0]_0 ;
  wire [11:0]\rd_data12[10]_10 ;
  wire [11:0]\rd_data12[12]_12 ;
  wire [11:0]\rd_data12[13]_13 ;
  wire [11:0]\rd_data12[14]_14 ;
  wire [11:0]\rd_data12[1]_1 ;
  wire [11:0]\rd_data12[2]_2 ;
  wire [11:0]\rd_data12[4]_4 ;
  wire [11:0]\rd_data12[5]_5 ;
  wire [11:0]\rd_data12[6]_6 ;
  wire [11:0]\rd_data12[8]_8 ;
  wire [11:0]\rd_data12[9]_9 ;
  wire rd_en;
  wire rd_en_i_1_n_0;
  wire rd_en_i_2_n_0;
  wire rd_en_i_3_n_0;
  wire rd_en_i_4_n_0;
  wire [1:0]rdy_state;
  wire ready_i;
  wire \wr_data_reg[15]0 ;
  wire \wr_data_reg_n_0_[0][0] ;
  wire \wr_data_reg_n_0_[0][10] ;
  wire \wr_data_reg_n_0_[0][11] ;
  wire \wr_data_reg_n_0_[0][1] ;
  wire \wr_data_reg_n_0_[0][2] ;
  wire \wr_data_reg_n_0_[0][3] ;
  wire \wr_data_reg_n_0_[0][4] ;
  wire \wr_data_reg_n_0_[0][5] ;
  wire \wr_data_reg_n_0_[0][6] ;
  wire \wr_data_reg_n_0_[0][7] ;
  wire \wr_data_reg_n_0_[0][8] ;
  wire \wr_data_reg_n_0_[0][9] ;
  wire \wr_data_reg_n_0_[10][0] ;
  wire \wr_data_reg_n_0_[10][10] ;
  wire \wr_data_reg_n_0_[10][11] ;
  wire \wr_data_reg_n_0_[10][1] ;
  wire \wr_data_reg_n_0_[10][2] ;
  wire \wr_data_reg_n_0_[10][3] ;
  wire \wr_data_reg_n_0_[10][4] ;
  wire \wr_data_reg_n_0_[10][5] ;
  wire \wr_data_reg_n_0_[10][6] ;
  wire \wr_data_reg_n_0_[10][7] ;
  wire \wr_data_reg_n_0_[10][8] ;
  wire \wr_data_reg_n_0_[10][9] ;
  wire \wr_data_reg_n_0_[11][0] ;
  wire \wr_data_reg_n_0_[11][10] ;
  wire \wr_data_reg_n_0_[11][11] ;
  wire \wr_data_reg_n_0_[11][1] ;
  wire \wr_data_reg_n_0_[11][2] ;
  wire \wr_data_reg_n_0_[11][3] ;
  wire \wr_data_reg_n_0_[11][4] ;
  wire \wr_data_reg_n_0_[11][5] ;
  wire \wr_data_reg_n_0_[11][6] ;
  wire \wr_data_reg_n_0_[11][7] ;
  wire \wr_data_reg_n_0_[11][8] ;
  wire \wr_data_reg_n_0_[11][9] ;
  wire \wr_data_reg_n_0_[12][0] ;
  wire \wr_data_reg_n_0_[12][10] ;
  wire \wr_data_reg_n_0_[12][11] ;
  wire \wr_data_reg_n_0_[12][1] ;
  wire \wr_data_reg_n_0_[12][2] ;
  wire \wr_data_reg_n_0_[12][3] ;
  wire \wr_data_reg_n_0_[12][4] ;
  wire \wr_data_reg_n_0_[12][5] ;
  wire \wr_data_reg_n_0_[12][6] ;
  wire \wr_data_reg_n_0_[12][7] ;
  wire \wr_data_reg_n_0_[12][8] ;
  wire \wr_data_reg_n_0_[12][9] ;
  wire \wr_data_reg_n_0_[13][0] ;
  wire \wr_data_reg_n_0_[13][10] ;
  wire \wr_data_reg_n_0_[13][11] ;
  wire \wr_data_reg_n_0_[13][1] ;
  wire \wr_data_reg_n_0_[13][2] ;
  wire \wr_data_reg_n_0_[13][3] ;
  wire \wr_data_reg_n_0_[13][4] ;
  wire \wr_data_reg_n_0_[13][5] ;
  wire \wr_data_reg_n_0_[13][6] ;
  wire \wr_data_reg_n_0_[13][7] ;
  wire \wr_data_reg_n_0_[13][8] ;
  wire \wr_data_reg_n_0_[13][9] ;
  wire \wr_data_reg_n_0_[14][0] ;
  wire \wr_data_reg_n_0_[14][10] ;
  wire \wr_data_reg_n_0_[14][11] ;
  wire \wr_data_reg_n_0_[14][1] ;
  wire \wr_data_reg_n_0_[14][2] ;
  wire \wr_data_reg_n_0_[14][3] ;
  wire \wr_data_reg_n_0_[14][4] ;
  wire \wr_data_reg_n_0_[14][5] ;
  wire \wr_data_reg_n_0_[14][6] ;
  wire \wr_data_reg_n_0_[14][7] ;
  wire \wr_data_reg_n_0_[14][8] ;
  wire \wr_data_reg_n_0_[14][9] ;
  wire \wr_data_reg_n_0_[15][0] ;
  wire \wr_data_reg_n_0_[15][10] ;
  wire \wr_data_reg_n_0_[15][11] ;
  wire \wr_data_reg_n_0_[15][1] ;
  wire \wr_data_reg_n_0_[15][2] ;
  wire \wr_data_reg_n_0_[15][3] ;
  wire \wr_data_reg_n_0_[15][4] ;
  wire \wr_data_reg_n_0_[15][5] ;
  wire \wr_data_reg_n_0_[15][6] ;
  wire \wr_data_reg_n_0_[15][7] ;
  wire \wr_data_reg_n_0_[15][8] ;
  wire \wr_data_reg_n_0_[15][9] ;
  wire \wr_data_reg_n_0_[1][0] ;
  wire \wr_data_reg_n_0_[1][10] ;
  wire \wr_data_reg_n_0_[1][11] ;
  wire \wr_data_reg_n_0_[1][1] ;
  wire \wr_data_reg_n_0_[1][2] ;
  wire \wr_data_reg_n_0_[1][3] ;
  wire \wr_data_reg_n_0_[1][4] ;
  wire \wr_data_reg_n_0_[1][5] ;
  wire \wr_data_reg_n_0_[1][6] ;
  wire \wr_data_reg_n_0_[1][7] ;
  wire \wr_data_reg_n_0_[1][8] ;
  wire \wr_data_reg_n_0_[1][9] ;
  wire \wr_data_reg_n_0_[2][0] ;
  wire \wr_data_reg_n_0_[2][10] ;
  wire \wr_data_reg_n_0_[2][11] ;
  wire \wr_data_reg_n_0_[2][1] ;
  wire \wr_data_reg_n_0_[2][2] ;
  wire \wr_data_reg_n_0_[2][3] ;
  wire \wr_data_reg_n_0_[2][4] ;
  wire \wr_data_reg_n_0_[2][5] ;
  wire \wr_data_reg_n_0_[2][6] ;
  wire \wr_data_reg_n_0_[2][7] ;
  wire \wr_data_reg_n_0_[2][8] ;
  wire \wr_data_reg_n_0_[2][9] ;
  wire \wr_data_reg_n_0_[3][0] ;
  wire \wr_data_reg_n_0_[3][10] ;
  wire \wr_data_reg_n_0_[3][11] ;
  wire \wr_data_reg_n_0_[3][1] ;
  wire \wr_data_reg_n_0_[3][2] ;
  wire \wr_data_reg_n_0_[3][3] ;
  wire \wr_data_reg_n_0_[3][4] ;
  wire \wr_data_reg_n_0_[3][5] ;
  wire \wr_data_reg_n_0_[3][6] ;
  wire \wr_data_reg_n_0_[3][7] ;
  wire \wr_data_reg_n_0_[3][8] ;
  wire \wr_data_reg_n_0_[3][9] ;
  wire \wr_data_reg_n_0_[4][0] ;
  wire \wr_data_reg_n_0_[4][10] ;
  wire \wr_data_reg_n_0_[4][11] ;
  wire \wr_data_reg_n_0_[4][1] ;
  wire \wr_data_reg_n_0_[4][2] ;
  wire \wr_data_reg_n_0_[4][3] ;
  wire \wr_data_reg_n_0_[4][4] ;
  wire \wr_data_reg_n_0_[4][5] ;
  wire \wr_data_reg_n_0_[4][6] ;
  wire \wr_data_reg_n_0_[4][7] ;
  wire \wr_data_reg_n_0_[4][8] ;
  wire \wr_data_reg_n_0_[4][9] ;
  wire \wr_data_reg_n_0_[5][0] ;
  wire \wr_data_reg_n_0_[5][10] ;
  wire \wr_data_reg_n_0_[5][11] ;
  wire \wr_data_reg_n_0_[5][1] ;
  wire \wr_data_reg_n_0_[5][2] ;
  wire \wr_data_reg_n_0_[5][3] ;
  wire \wr_data_reg_n_0_[5][4] ;
  wire \wr_data_reg_n_0_[5][5] ;
  wire \wr_data_reg_n_0_[5][6] ;
  wire \wr_data_reg_n_0_[5][7] ;
  wire \wr_data_reg_n_0_[5][8] ;
  wire \wr_data_reg_n_0_[5][9] ;
  wire \wr_data_reg_n_0_[6][0] ;
  wire \wr_data_reg_n_0_[6][10] ;
  wire \wr_data_reg_n_0_[6][11] ;
  wire \wr_data_reg_n_0_[6][1] ;
  wire \wr_data_reg_n_0_[6][2] ;
  wire \wr_data_reg_n_0_[6][3] ;
  wire \wr_data_reg_n_0_[6][4] ;
  wire \wr_data_reg_n_0_[6][5] ;
  wire \wr_data_reg_n_0_[6][6] ;
  wire \wr_data_reg_n_0_[6][7] ;
  wire \wr_data_reg_n_0_[6][8] ;
  wire \wr_data_reg_n_0_[6][9] ;
  wire \wr_data_reg_n_0_[7][0] ;
  wire \wr_data_reg_n_0_[7][10] ;
  wire \wr_data_reg_n_0_[7][11] ;
  wire \wr_data_reg_n_0_[7][1] ;
  wire \wr_data_reg_n_0_[7][2] ;
  wire \wr_data_reg_n_0_[7][3] ;
  wire \wr_data_reg_n_0_[7][4] ;
  wire \wr_data_reg_n_0_[7][5] ;
  wire \wr_data_reg_n_0_[7][6] ;
  wire \wr_data_reg_n_0_[7][7] ;
  wire \wr_data_reg_n_0_[7][8] ;
  wire \wr_data_reg_n_0_[7][9] ;
  wire \wr_data_reg_n_0_[8][0] ;
  wire \wr_data_reg_n_0_[8][10] ;
  wire \wr_data_reg_n_0_[8][11] ;
  wire \wr_data_reg_n_0_[8][1] ;
  wire \wr_data_reg_n_0_[8][2] ;
  wire \wr_data_reg_n_0_[8][3] ;
  wire \wr_data_reg_n_0_[8][4] ;
  wire \wr_data_reg_n_0_[8][5] ;
  wire \wr_data_reg_n_0_[8][6] ;
  wire \wr_data_reg_n_0_[8][7] ;
  wire \wr_data_reg_n_0_[8][8] ;
  wire \wr_data_reg_n_0_[8][9] ;
  wire \wr_data_reg_n_0_[9][0] ;
  wire \wr_data_reg_n_0_[9][10] ;
  wire \wr_data_reg_n_0_[9][11] ;
  wire \wr_data_reg_n_0_[9][1] ;
  wire \wr_data_reg_n_0_[9][2] ;
  wire \wr_data_reg_n_0_[9][3] ;
  wire \wr_data_reg_n_0_[9][4] ;
  wire \wr_data_reg_n_0_[9][5] ;
  wire \wr_data_reg_n_0_[9][6] ;
  wire \wr_data_reg_n_0_[9][7] ;
  wire \wr_data_reg_n_0_[9][8] ;
  wire \wr_data_reg_n_0_[9][9] ;
  wire wr_en_i_1_n_0;
  wire wr_en_reg_n_0;

  FDRE \DIGTime_intl_reg[0] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[0]),
        .Q(\DIGTime_intl_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[10] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[10]),
        .Q(\DIGTime_intl_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[11] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[11]),
        .Q(\DIGTime_intl_reg_n_0_[11] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[12] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[12]),
        .Q(\DIGTime_intl_reg_n_0_[12] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[13] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[13]),
        .Q(\DIGTime_intl_reg_n_0_[13] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[14] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[14]),
        .Q(\DIGTime_intl_reg_n_0_[14] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[15] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[15]),
        .Q(\DIGTime_intl_reg_n_0_[15] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[16] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[16]),
        .Q(\DIGTime_intl_reg_n_0_[16] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[17] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[17]),
        .Q(\DIGTime_intl_reg_n_0_[17] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[18] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[18]),
        .Q(\DIGTime_intl_reg_n_0_[18] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[19] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[19]),
        .Q(\DIGTime_intl_reg_n_0_[19] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[1] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[1]),
        .Q(\DIGTime_intl_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[20] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[20]),
        .Q(\DIGTime_intl_reg_n_0_[20] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[21] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[21]),
        .Q(\DIGTime_intl_reg_n_0_[21] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[22] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[22]),
        .Q(\DIGTime_intl_reg_n_0_[22] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[23] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[23]),
        .Q(\DIGTime_intl_reg_n_0_[23] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[24] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[24]),
        .Q(\DIGTime_intl_reg_n_0_[24] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[25] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[25]),
        .Q(\DIGTime_intl_reg_n_0_[25] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[26] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[26]),
        .Q(\DIGTime_intl_reg_n_0_[26] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[27] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[27]),
        .Q(\DIGTime_intl_reg_n_0_[27] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[28] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[28]),
        .Q(\DIGTime_intl_reg_n_0_[28] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[29] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[29]),
        .Q(\DIGTime_intl_reg_n_0_[29] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[2] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[2]),
        .Q(\DIGTime_intl_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[30] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[30]),
        .Q(\DIGTime_intl_reg_n_0_[30] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[31] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[31]),
        .Q(\DIGTime_intl_reg_n_0_[31] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[32] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[32]),
        .Q(data3[0]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[33] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[33]),
        .Q(data3[1]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[34] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[34]),
        .Q(data3[2]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[35] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[35]),
        .Q(data3[3]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[36] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[36]),
        .Q(data3[4]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[37] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[37]),
        .Q(data3[5]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[38] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[38]),
        .Q(data3[6]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[39] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[39]),
        .Q(data3[7]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[3] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[3]),
        .Q(\DIGTime_intl_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[40] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[40]),
        .Q(data3[8]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[41] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[41]),
        .Q(data3[9]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[42] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[42]),
        .Q(data3[10]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[43] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[43]),
        .Q(data3[11]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[44] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[44]),
        .Q(data3[12]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[45] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[45]),
        .Q(data3[13]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[46] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[46]),
        .Q(data3[14]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[47] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[47]),
        .Q(data3[15]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[48] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[48]),
        .Q(data3[16]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[49] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[49]),
        .Q(data3[17]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[4] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[4]),
        .Q(\DIGTime_intl_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[50] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[50]),
        .Q(data3[18]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[51] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[51]),
        .Q(data3[19]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[52] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[52]),
        .Q(data3[20]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[53] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[53]),
        .Q(data3[21]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[54] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[54]),
        .Q(data3[22]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[55] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[55]),
        .Q(data3[23]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[56] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[56]),
        .Q(data3[24]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[57] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[57]),
        .Q(data3[25]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[58] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[58]),
        .Q(data3[26]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[59] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[59]),
        .Q(data3[27]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[5] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[5]),
        .Q(\DIGTime_intl_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[60] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[60]),
        .Q(data3[28]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[61] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[61]),
        .Q(data3[29]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[62] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[62]),
        .Q(data3[30]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[63] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[63]),
        .Q(data3[31]),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[6] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[6]),
        .Q(\DIGTime_intl_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[7] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[7]),
        .Q(\DIGTime_intl_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[8] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[8]),
        .Q(\DIGTime_intl_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[9] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(DIGTime[9]),
        .Q(\DIGTime_intl_reg_n_0_[9] ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h04FF0404)) 
    \DataOut[12]_i_1 
       (.I0(\DataOut[31]_i_2_n_0 ),
        .I1(DataOut_intlH[12]),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(rdy_state[0]),
        .I4(\DataOut_last_reg_n_0_[12] ),
        .O(\DataOut[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0404)) 
    \DataOut[13]_i_1 
       (.I0(\DataOut[31]_i_2_n_0 ),
        .I1(DataOut_intlH[13]),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(rdy_state[0]),
        .I4(\DataOut_last_reg_n_0_[13] ),
        .O(\DataOut[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0404)) 
    \DataOut[14]_i_1 
       (.I0(\DataOut[31]_i_2_n_0 ),
        .I1(DataOut_intlH[14]),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(rdy_state[0]),
        .I4(\DataOut_last_reg_n_0_[14] ),
        .O(\DataOut[14]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0404)) 
    \DataOut[15]_i_1 
       (.I0(\DataOut[31]_i_2_n_0 ),
        .I1(DataOut_intlH[15]),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(rdy_state[0]),
        .I4(\DataOut_last_reg_n_0_[15] ),
        .O(\DataOut[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0404)) 
    \DataOut[16]_i_1 
       (.I0(\DataOut[31]_i_2_n_0 ),
        .I1(DataOut_intlH[16]),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(rdy_state[0]),
        .I4(\DataOut_last_reg_n_0_[16] ),
        .O(\DataOut[16]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0404)) 
    \DataOut[17]_i_1 
       (.I0(\DataOut[31]_i_2_n_0 ),
        .I1(DataOut_intlH[17]),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(rdy_state[0]),
        .I4(\DataOut_last_reg_n_0_[17] ),
        .O(\DataOut[17]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0404)) 
    \DataOut[18]_i_1 
       (.I0(\DataOut[31]_i_2_n_0 ),
        .I1(DataOut_intlH[18]),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(rdy_state[0]),
        .I4(\DataOut_last_reg_n_0_[18] ),
        .O(\DataOut[18]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0404)) 
    \DataOut[19]_i_1 
       (.I0(\DataOut[31]_i_2_n_0 ),
        .I1(DataOut_intlH[19]),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(rdy_state[0]),
        .I4(\DataOut_last_reg_n_0_[19] ),
        .O(\DataOut[19]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0404)) 
    \DataOut[20]_i_1 
       (.I0(\DataOut[31]_i_2_n_0 ),
        .I1(DataOut_intlH[20]),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(rdy_state[0]),
        .I4(\DataOut_last_reg_n_0_[20] ),
        .O(\DataOut[20]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0404)) 
    \DataOut[21]_i_1 
       (.I0(\DataOut[31]_i_2_n_0 ),
        .I1(DataOut_intlH[21]),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(rdy_state[0]),
        .I4(\DataOut_last_reg_n_0_[21] ),
        .O(\DataOut[21]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0404)) 
    \DataOut[22]_i_1 
       (.I0(\DataOut[31]_i_2_n_0 ),
        .I1(DataOut_intlH[22]),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(rdy_state[0]),
        .I4(\DataOut_last_reg_n_0_[22] ),
        .O(\DataOut[22]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0404)) 
    \DataOut[23]_i_1 
       (.I0(\DataOut[31]_i_2_n_0 ),
        .I1(DataOut_intlH[23]),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(rdy_state[0]),
        .I4(\DataOut_last_reg_n_0_[23] ),
        .O(\DataOut[23]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0404)) 
    \DataOut[24]_i_1 
       (.I0(\DataOut[31]_i_2_n_0 ),
        .I1(DataOut_intlH[24]),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(rdy_state[0]),
        .I4(\DataOut_last_reg_n_0_[24] ),
        .O(\DataOut[24]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0404)) 
    \DataOut[25]_i_1 
       (.I0(\DataOut[31]_i_2_n_0 ),
        .I1(DataOut_intlH[25]),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(rdy_state[0]),
        .I4(\DataOut_last_reg_n_0_[25] ),
        .O(\DataOut[25]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0404)) 
    \DataOut[26]_i_1 
       (.I0(\DataOut[31]_i_2_n_0 ),
        .I1(DataOut_intlH[26]),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(rdy_state[0]),
        .I4(\DataOut_last_reg_n_0_[26] ),
        .O(\DataOut[26]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0404)) 
    \DataOut[27]_i_1 
       (.I0(\DataOut[31]_i_2_n_0 ),
        .I1(DataOut_intlH[27]),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(rdy_state[0]),
        .I4(\DataOut_last_reg_n_0_[27] ),
        .O(\DataOut[27]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0404)) 
    \DataOut[28]_i_1 
       (.I0(\DataOut[31]_i_2_n_0 ),
        .I1(DataOut_intlH[28]),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(rdy_state[0]),
        .I4(\DataOut_last_reg_n_0_[28] ),
        .O(\DataOut[28]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0404)) 
    \DataOut[29]_i_1 
       (.I0(\DataOut[31]_i_2_n_0 ),
        .I1(DataOut_intlH[29]),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(rdy_state[0]),
        .I4(\DataOut_last_reg_n_0_[29] ),
        .O(\DataOut[29]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0404)) 
    \DataOut[30]_i_1 
       (.I0(\DataOut[31]_i_2_n_0 ),
        .I1(DataOut_intlH[30]),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(rdy_state[0]),
        .I4(\DataOut_last_reg_n_0_[30] ),
        .O(\DataOut[30]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0404)) 
    \DataOut[31]_i_1 
       (.I0(\DataOut[31]_i_2_n_0 ),
        .I1(DataOut_intlH[31]),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(rdy_state[0]),
        .I4(\DataOut_last_reg_n_0_[31] ),
        .O(\DataOut[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT5 #(
    .INIT(32'hDFFFFFFF)) 
    \DataOut[31]_i_2 
       (.I0(\fifo_rd_stm_reg_n_0_[1] ),
        .I1(\fifo_rd_stm_reg_n_0_[3] ),
        .I2(\fifo_rd_stm_reg_n_0_[2] ),
        .I3(rdy_state[0]),
        .I4(rdy_state[1]),
        .O(\DataOut[31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \DataOut_intlH[0]_i_1 
       (.I0(WDOTime[0]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\DataOut_intlH[0]_i_2_n_0 ),
        .I3(\cnt_fifo_reg_n_0_[2] ),
        .I4(\DataOut_intlH[0]_i_3_n_0 ),
        .O(\DataOut_intlH[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut_intlH[0]_i_2 
       (.I0(WDONBR_intl[0]),
        .I1(\cnt_fifo_reg_n_0_[0] ),
        .I2(Trigger[0]),
        .O(\DataOut_intlH[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[0]_i_3 
       (.I0(data3[0]),
        .I1(\DIGTime_intl_reg_n_0_[0] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[0]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[0] ),
        .O(\DataOut_intlH[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    \DataOut_intlH[10]_i_1 
       (.I0(WDOTime[10]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(Trigger[10]),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\DataOut_intlH[10]_i_2_n_0 ),
        .O(\DataOut_intlH[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[10]_i_2 
       (.I0(data3[10]),
        .I1(\DIGTime_intl_reg_n_0_[10] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[10]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[10] ),
        .O(\DataOut_intlH[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    \DataOut_intlH[11]_i_1 
       (.I0(WDOTime[11]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(Trigger[11]),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\DataOut_intlH[11]_i_2_n_0 ),
        .O(\DataOut_intlH[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[11]_i_2 
       (.I0(data3[11]),
        .I1(\DIGTime_intl_reg_n_0_[11] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[11]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[11] ),
        .O(\DataOut_intlH[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    \DataOut_intlH[12]_i_1 
       (.I0(WDOTime[12]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(Trigger[12]),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\DataOut_intlH[12]_i_2_n_0 ),
        .O(\DataOut_intlH[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[12]_i_2 
       (.I0(data3[12]),
        .I1(\DIGTime_intl_reg_n_0_[12] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[12]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[12] ),
        .O(\DataOut_intlH[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    \DataOut_intlH[13]_i_1 
       (.I0(WDOTime[13]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(Trigger[13]),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\DataOut_intlH[13]_i_2_n_0 ),
        .O(\DataOut_intlH[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[13]_i_2 
       (.I0(data3[13]),
        .I1(\DIGTime_intl_reg_n_0_[13] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[13]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[13] ),
        .O(\DataOut_intlH[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    \DataOut_intlH[14]_i_1 
       (.I0(WDOTime[14]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(Trigger[14]),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\DataOut_intlH[14]_i_2_n_0 ),
        .O(\DataOut_intlH[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[14]_i_2 
       (.I0(data3[14]),
        .I1(\DIGTime_intl_reg_n_0_[14] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[14]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[14] ),
        .O(\DataOut_intlH[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    \DataOut_intlH[15]_i_1 
       (.I0(WDOTime[15]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(Trigger[15]),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\DataOut_intlH[15]_i_2_n_0 ),
        .O(\DataOut_intlH[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[15]_i_2 
       (.I0(data3[15]),
        .I1(\DIGTime_intl_reg_n_0_[15] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[15]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[15] ),
        .O(\DataOut_intlH[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    \DataOut_intlH[16]_i_1 
       (.I0(WDOTime[16]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(Trigger[16]),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\DataOut_intlH[16]_i_2_n_0 ),
        .O(\DataOut_intlH[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[16]_i_2 
       (.I0(data3[16]),
        .I1(\DIGTime_intl_reg_n_0_[16] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[16]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[16] ),
        .O(\DataOut_intlH[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    \DataOut_intlH[17]_i_1 
       (.I0(WDOTime[17]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(Trigger[17]),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\DataOut_intlH[17]_i_2_n_0 ),
        .O(\DataOut_intlH[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[17]_i_2 
       (.I0(data3[17]),
        .I1(\DIGTime_intl_reg_n_0_[17] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[17]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[17] ),
        .O(\DataOut_intlH[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    \DataOut_intlH[18]_i_1 
       (.I0(WDOTime[18]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(Trigger[18]),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\DataOut_intlH[18]_i_2_n_0 ),
        .O(\DataOut_intlH[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[18]_i_2 
       (.I0(data3[18]),
        .I1(\DIGTime_intl_reg_n_0_[18] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[18]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[18] ),
        .O(\DataOut_intlH[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    \DataOut_intlH[19]_i_1 
       (.I0(WDOTime[19]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(Trigger[19]),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\DataOut_intlH[19]_i_2_n_0 ),
        .O(\DataOut_intlH[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[19]_i_2 
       (.I0(data3[19]),
        .I1(\DIGTime_intl_reg_n_0_[19] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[19]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[19] ),
        .O(\DataOut_intlH[19]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \DataOut_intlH[1]_i_1 
       (.I0(WDOTime[1]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\DataOut_intlH[1]_i_2_n_0 ),
        .I3(\cnt_fifo_reg_n_0_[2] ),
        .I4(\DataOut_intlH[1]_i_3_n_0 ),
        .O(\DataOut_intlH[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut_intlH[1]_i_2 
       (.I0(WDONBR_intl[1]),
        .I1(\cnt_fifo_reg_n_0_[0] ),
        .I2(Trigger[1]),
        .O(\DataOut_intlH[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[1]_i_3 
       (.I0(data3[1]),
        .I1(\DIGTime_intl_reg_n_0_[1] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[1]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[1] ),
        .O(\DataOut_intlH[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    \DataOut_intlH[20]_i_1 
       (.I0(WDOTime[20]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(Trigger[20]),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\DataOut_intlH[20]_i_2_n_0 ),
        .O(\DataOut_intlH[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[20]_i_2 
       (.I0(data3[20]),
        .I1(\DIGTime_intl_reg_n_0_[20] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[20]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[20] ),
        .O(\DataOut_intlH[20]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    \DataOut_intlH[21]_i_1 
       (.I0(WDOTime[21]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(Trigger[21]),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\DataOut_intlH[21]_i_2_n_0 ),
        .O(\DataOut_intlH[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[21]_i_2 
       (.I0(data3[21]),
        .I1(\DIGTime_intl_reg_n_0_[21] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[21]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[21] ),
        .O(\DataOut_intlH[21]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    \DataOut_intlH[22]_i_1 
       (.I0(WDOTime[22]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(Trigger[22]),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\DataOut_intlH[22]_i_2_n_0 ),
        .O(\DataOut_intlH[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[22]_i_2 
       (.I0(data3[22]),
        .I1(\DIGTime_intl_reg_n_0_[22] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[22]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[22] ),
        .O(\DataOut_intlH[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    \DataOut_intlH[23]_i_1 
       (.I0(WDOTime[23]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(Trigger[23]),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\DataOut_intlH[23]_i_2_n_0 ),
        .O(\DataOut_intlH[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[23]_i_2 
       (.I0(data3[23]),
        .I1(\DIGTime_intl_reg_n_0_[23] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[23]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[23] ),
        .O(\DataOut_intlH[23]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    \DataOut_intlH[24]_i_1 
       (.I0(WDOTime[24]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(Trigger[24]),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\DataOut_intlH[24]_i_2_n_0 ),
        .O(\DataOut_intlH[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[24]_i_2 
       (.I0(data3[24]),
        .I1(\DIGTime_intl_reg_n_0_[24] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[24]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[24] ),
        .O(\DataOut_intlH[24]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    \DataOut_intlH[25]_i_1 
       (.I0(WDOTime[25]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(Trigger[25]),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\DataOut_intlH[25]_i_2_n_0 ),
        .O(\DataOut_intlH[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[25]_i_2 
       (.I0(data3[25]),
        .I1(\DIGTime_intl_reg_n_0_[25] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[25]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[25] ),
        .O(\DataOut_intlH[25]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    \DataOut_intlH[26]_i_1 
       (.I0(WDOTime[26]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(Trigger[26]),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\DataOut_intlH[26]_i_2_n_0 ),
        .O(\DataOut_intlH[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[26]_i_2 
       (.I0(data3[26]),
        .I1(\DIGTime_intl_reg_n_0_[26] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[26]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[26] ),
        .O(\DataOut_intlH[26]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    \DataOut_intlH[27]_i_1 
       (.I0(WDOTime[27]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(Trigger[27]),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\DataOut_intlH[27]_i_2_n_0 ),
        .O(\DataOut_intlH[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[27]_i_2 
       (.I0(data3[27]),
        .I1(\DIGTime_intl_reg_n_0_[27] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[27]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[27] ),
        .O(\DataOut_intlH[27]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    \DataOut_intlH[28]_i_1 
       (.I0(WDOTime[28]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(Trigger[28]),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\DataOut_intlH[28]_i_2_n_0 ),
        .O(\DataOut_intlH[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[28]_i_2 
       (.I0(data3[28]),
        .I1(\DIGTime_intl_reg_n_0_[28] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[28]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[28] ),
        .O(\DataOut_intlH[28]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    \DataOut_intlH[29]_i_1 
       (.I0(WDOTime[29]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(Trigger[29]),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\DataOut_intlH[29]_i_2_n_0 ),
        .O(\DataOut_intlH[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[29]_i_2 
       (.I0(data3[29]),
        .I1(\DIGTime_intl_reg_n_0_[29] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[29]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[29] ),
        .O(\DataOut_intlH[29]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \DataOut_intlH[2]_i_1 
       (.I0(WDOTime[2]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\DataOut_intlH[2]_i_2_n_0 ),
        .I3(\cnt_fifo_reg_n_0_[2] ),
        .I4(\DataOut_intlH[2]_i_3_n_0 ),
        .O(\DataOut_intlH[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut_intlH[2]_i_2 
       (.I0(WDONBR_intl[2]),
        .I1(\cnt_fifo_reg_n_0_[0] ),
        .I2(Trigger[2]),
        .O(\DataOut_intlH[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[2]_i_3 
       (.I0(data3[2]),
        .I1(\DIGTime_intl_reg_n_0_[2] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[2]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[2] ),
        .O(\DataOut_intlH[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    \DataOut_intlH[30]_i_1 
       (.I0(WDOTime[30]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(Trigger[30]),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\DataOut_intlH[30]_i_2_n_0 ),
        .O(\DataOut_intlH[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[30]_i_2 
       (.I0(data3[30]),
        .I1(\DIGTime_intl_reg_n_0_[30] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[30]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[30] ),
        .O(\DataOut_intlH[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h80008A0080008000)) 
    \DataOut_intlH[31]_i_1 
       (.I0(\DataOut_intlH[31]_i_3_n_0 ),
        .I1(\fifo_rd_stm[0]_i_2_n_0 ),
        .I2(\fifo_rd_stm_reg_n_0_[1] ),
        .I3(ready_i),
        .I4(PSBUSY_i),
        .I5(\fifo_rd_stm_reg_n_0_[0] ),
        .O(\DataOut_intlH[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    \DataOut_intlH[31]_i_2 
       (.I0(WDOTime[31]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(Trigger[31]),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\DataOut_intlH[31]_i_4_n_0 ),
        .O(\DataOut_intlH[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_intlH[31]_i_3 
       (.I0(\fifo_rd_stm_reg_n_0_[2] ),
        .I1(\fifo_rd_stm_reg_n_0_[3] ),
        .O(\DataOut_intlH[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[31]_i_4 
       (.I0(data3[31]),
        .I1(\DIGTime_intl_reg_n_0_[31] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[31]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[31] ),
        .O(\DataOut_intlH[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \DataOut_intlH[3]_i_1 
       (.I0(WDOTime[3]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\DataOut_intlH[3]_i_2_n_0 ),
        .I3(\cnt_fifo_reg_n_0_[2] ),
        .I4(\DataOut_intlH[3]_i_3_n_0 ),
        .O(\DataOut_intlH[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut_intlH[3]_i_2 
       (.I0(WDONBR_intl[3]),
        .I1(\cnt_fifo_reg_n_0_[0] ),
        .I2(Trigger[3]),
        .O(\DataOut_intlH[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[3]_i_3 
       (.I0(data3[3]),
        .I1(\DIGTime_intl_reg_n_0_[3] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[3]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[3] ),
        .O(\DataOut_intlH[3]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \DataOut_intlH[4]_i_1 
       (.I0(WDOTime[4]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\DataOut_intlH[4]_i_2_n_0 ),
        .I3(\cnt_fifo_reg_n_0_[2] ),
        .I4(\DataOut_intlH[4]_i_3_n_0 ),
        .O(\DataOut_intlH[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut_intlH[4]_i_2 
       (.I0(WDONBR_intl[4]),
        .I1(\cnt_fifo_reg_n_0_[0] ),
        .I2(Trigger[4]),
        .O(\DataOut_intlH[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[4]_i_3 
       (.I0(data3[4]),
        .I1(\DIGTime_intl_reg_n_0_[4] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[4]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[4] ),
        .O(\DataOut_intlH[4]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \DataOut_intlH[5]_i_1 
       (.I0(WDOTime[5]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\DataOut_intlH[5]_i_2_n_0 ),
        .I3(\cnt_fifo_reg_n_0_[2] ),
        .I4(\DataOut_intlH[5]_i_3_n_0 ),
        .O(\DataOut_intlH[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut_intlH[5]_i_2 
       (.I0(WDONBR_intl[5]),
        .I1(\cnt_fifo_reg_n_0_[0] ),
        .I2(Trigger[5]),
        .O(\DataOut_intlH[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[5]_i_3 
       (.I0(data3[5]),
        .I1(\DIGTime_intl_reg_n_0_[5] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[5]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[5] ),
        .O(\DataOut_intlH[5]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \DataOut_intlH[6]_i_1 
       (.I0(WDOTime[6]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\DataOut_intlH[6]_i_2_n_0 ),
        .I3(\cnt_fifo_reg_n_0_[2] ),
        .I4(\DataOut_intlH[6]_i_3_n_0 ),
        .O(\DataOut_intlH[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut_intlH[6]_i_2 
       (.I0(WDONBR_intl[6]),
        .I1(\cnt_fifo_reg_n_0_[0] ),
        .I2(Trigger[6]),
        .O(\DataOut_intlH[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[6]_i_3 
       (.I0(data3[6]),
        .I1(\DIGTime_intl_reg_n_0_[6] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[6]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[6] ),
        .O(\DataOut_intlH[6]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \DataOut_intlH[7]_i_1 
       (.I0(WDOTime[7]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\DataOut_intlH[7]_i_2_n_0 ),
        .I3(\cnt_fifo_reg_n_0_[2] ),
        .I4(\DataOut_intlH[7]_i_3_n_0 ),
        .O(\DataOut_intlH[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut_intlH[7]_i_2 
       (.I0(WDONBR_intl[7]),
        .I1(\cnt_fifo_reg_n_0_[0] ),
        .I2(Trigger[7]),
        .O(\DataOut_intlH[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[7]_i_3 
       (.I0(data3[7]),
        .I1(\DIGTime_intl_reg_n_0_[7] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[7]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[7] ),
        .O(\DataOut_intlH[7]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \DataOut_intlH[8]_i_1 
       (.I0(WDOTime[8]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\DataOut_intlH[8]_i_2_n_0 ),
        .I3(\cnt_fifo_reg_n_0_[2] ),
        .I4(\DataOut_intlH[8]_i_3_n_0 ),
        .O(\DataOut_intlH[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut_intlH[8]_i_2 
       (.I0(WDONBR_intl[8]),
        .I1(\cnt_fifo_reg_n_0_[0] ),
        .I2(Trigger[8]),
        .O(\DataOut_intlH[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[8]_i_3 
       (.I0(data3[8]),
        .I1(\DIGTime_intl_reg_n_0_[8] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[8]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[8] ),
        .O(\DataOut_intlH[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    \DataOut_intlH[9]_i_1 
       (.I0(WDOTime[9]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(Trigger[9]),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\DataOut_intlH[9]_i_2_n_0 ),
        .O(\DataOut_intlH[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_intlH[9]_i_2 
       (.I0(data3[9]),
        .I1(\DIGTime_intl_reg_n_0_[9] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(data1[9]),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\WDOTime_intl_reg_n_0_[9] ),
        .O(\DataOut_intlH[9]_i_2_n_0 ));
  FDCE \DataOut_intlH_reg[0] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[0]_i_1_n_0 ),
        .Q(DataOut_intlH[0]));
  FDCE \DataOut_intlH_reg[10] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[10]_i_1_n_0 ),
        .Q(DataOut_intlH[10]));
  FDCE \DataOut_intlH_reg[11] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[11]_i_1_n_0 ),
        .Q(DataOut_intlH[11]));
  FDCE \DataOut_intlH_reg[12] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[12]_i_1_n_0 ),
        .Q(DataOut_intlH[12]));
  FDCE \DataOut_intlH_reg[13] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[13]_i_1_n_0 ),
        .Q(DataOut_intlH[13]));
  FDCE \DataOut_intlH_reg[14] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[14]_i_1_n_0 ),
        .Q(DataOut_intlH[14]));
  FDCE \DataOut_intlH_reg[15] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[15]_i_1_n_0 ),
        .Q(DataOut_intlH[15]));
  FDCE \DataOut_intlH_reg[16] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[16]_i_1_n_0 ),
        .Q(DataOut_intlH[16]));
  FDCE \DataOut_intlH_reg[17] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[17]_i_1_n_0 ),
        .Q(DataOut_intlH[17]));
  FDCE \DataOut_intlH_reg[18] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[18]_i_1_n_0 ),
        .Q(DataOut_intlH[18]));
  FDCE \DataOut_intlH_reg[19] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[19]_i_1_n_0 ),
        .Q(DataOut_intlH[19]));
  FDCE \DataOut_intlH_reg[1] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[1]_i_1_n_0 ),
        .Q(DataOut_intlH[1]));
  FDCE \DataOut_intlH_reg[20] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[20]_i_1_n_0 ),
        .Q(DataOut_intlH[20]));
  FDCE \DataOut_intlH_reg[21] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[21]_i_1_n_0 ),
        .Q(DataOut_intlH[21]));
  FDCE \DataOut_intlH_reg[22] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[22]_i_1_n_0 ),
        .Q(DataOut_intlH[22]));
  FDCE \DataOut_intlH_reg[23] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[23]_i_1_n_0 ),
        .Q(DataOut_intlH[23]));
  FDCE \DataOut_intlH_reg[24] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[24]_i_1_n_0 ),
        .Q(DataOut_intlH[24]));
  FDCE \DataOut_intlH_reg[25] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[25]_i_1_n_0 ),
        .Q(DataOut_intlH[25]));
  FDCE \DataOut_intlH_reg[26] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[26]_i_1_n_0 ),
        .Q(DataOut_intlH[26]));
  FDCE \DataOut_intlH_reg[27] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[27]_i_1_n_0 ),
        .Q(DataOut_intlH[27]));
  FDCE \DataOut_intlH_reg[28] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[28]_i_1_n_0 ),
        .Q(DataOut_intlH[28]));
  FDCE \DataOut_intlH_reg[29] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[29]_i_1_n_0 ),
        .Q(DataOut_intlH[29]));
  FDCE \DataOut_intlH_reg[2] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[2]_i_1_n_0 ),
        .Q(DataOut_intlH[2]));
  FDCE \DataOut_intlH_reg[30] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[30]_i_1_n_0 ),
        .Q(DataOut_intlH[30]));
  FDCE \DataOut_intlH_reg[31] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[31]_i_2_n_0 ),
        .Q(DataOut_intlH[31]));
  FDCE \DataOut_intlH_reg[3] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[3]_i_1_n_0 ),
        .Q(DataOut_intlH[3]));
  FDCE \DataOut_intlH_reg[4] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[4]_i_1_n_0 ),
        .Q(DataOut_intlH[4]));
  FDCE \DataOut_intlH_reg[5] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[5]_i_1_n_0 ),
        .Q(DataOut_intlH[5]));
  FDCE \DataOut_intlH_reg[6] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[6]_i_1_n_0 ),
        .Q(DataOut_intlH[6]));
  FDCE \DataOut_intlH_reg[7] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[7]_i_1_n_0 ),
        .Q(DataOut_intlH[7]));
  FDCE \DataOut_intlH_reg[8] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[8]_i_1_n_0 ),
        .Q(DataOut_intlH[8]));
  FDCE \DataOut_intlH_reg[9] 
       (.C(CLK),
        .CE(\DataOut_intlH[31]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\DataOut_intlH[9]_i_1_n_0 ),
        .Q(DataOut_intlH[9]));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[12]_i_1 
       (.I0(DataOut_intlH[12]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[13]_i_1 
       (.I0(DataOut_intlH[13]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[14]_i_1 
       (.I0(DataOut_intlH[14]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[14]));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[15]_i_1 
       (.I0(DataOut_intlH[15]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[15]));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[16]_i_1 
       (.I0(DataOut_intlH[16]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[16]));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[17]_i_1 
       (.I0(DataOut_intlH[17]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[17]));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[18]_i_1 
       (.I0(DataOut_intlH[18]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[18]));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[19]_i_1 
       (.I0(DataOut_intlH[19]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[19]));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[20]_i_1 
       (.I0(DataOut_intlH[20]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[20]));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[21]_i_1 
       (.I0(DataOut_intlH[21]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[21]));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[22]_i_1 
       (.I0(DataOut_intlH[22]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[22]));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[23]_i_1 
       (.I0(DataOut_intlH[23]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[23]));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[24]_i_1 
       (.I0(DataOut_intlH[24]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[24]));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[25]_i_1 
       (.I0(DataOut_intlH[25]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[25]));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[26]_i_1 
       (.I0(DataOut_intlH[26]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[26]));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[27]_i_1 
       (.I0(DataOut_intlH[27]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[27]));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[28]_i_1 
       (.I0(DataOut_intlH[28]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[28]));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[29]_i_1 
       (.I0(DataOut_intlH[29]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[29]));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[30]_i_1 
       (.I0(DataOut_intlH[30]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[30]));
  LUT4 #(
    .INIT(16'h0400)) 
    \DataOut_last[31]_i_1 
       (.I0(\fifo_rd_stm_reg_n_0_[3] ),
        .I1(\fifo_rd_stm_reg_n_0_[2] ),
        .I2(ready_i),
        .I3(\fifo_rd_stm_reg_n_0_[1] ),
        .O(DataOut_last));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[31]_i_2 
       (.I0(DataOut_intlH[31]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[31]));
  FDCE \DataOut_last_reg[0] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[0]),
        .Q(\DataOut_last_reg_n_0_[0] ));
  FDCE \DataOut_last_reg[10] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[10]),
        .Q(\DataOut_last_reg_n_0_[10] ));
  FDCE \DataOut_last_reg[11] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[11]),
        .Q(\DataOut_last_reg_n_0_[11] ));
  FDCE \DataOut_last_reg[12] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[12]),
        .Q(\DataOut_last_reg_n_0_[12] ));
  FDCE \DataOut_last_reg[13] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[13]),
        .Q(\DataOut_last_reg_n_0_[13] ));
  FDCE \DataOut_last_reg[14] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[14]),
        .Q(\DataOut_last_reg_n_0_[14] ));
  FDCE \DataOut_last_reg[15] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[15]),
        .Q(\DataOut_last_reg_n_0_[15] ));
  FDCE \DataOut_last_reg[16] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[16]),
        .Q(\DataOut_last_reg_n_0_[16] ));
  FDCE \DataOut_last_reg[17] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[17]),
        .Q(\DataOut_last_reg_n_0_[17] ));
  FDCE \DataOut_last_reg[18] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[18]),
        .Q(\DataOut_last_reg_n_0_[18] ));
  FDCE \DataOut_last_reg[19] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[19]),
        .Q(\DataOut_last_reg_n_0_[19] ));
  FDCE \DataOut_last_reg[1] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[1]),
        .Q(\DataOut_last_reg_n_0_[1] ));
  FDCE \DataOut_last_reg[20] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[20]),
        .Q(\DataOut_last_reg_n_0_[20] ));
  FDCE \DataOut_last_reg[21] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[21]),
        .Q(\DataOut_last_reg_n_0_[21] ));
  FDCE \DataOut_last_reg[22] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[22]),
        .Q(\DataOut_last_reg_n_0_[22] ));
  FDCE \DataOut_last_reg[23] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[23]),
        .Q(\DataOut_last_reg_n_0_[23] ));
  FDCE \DataOut_last_reg[24] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[24]),
        .Q(\DataOut_last_reg_n_0_[24] ));
  FDCE \DataOut_last_reg[25] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[25]),
        .Q(\DataOut_last_reg_n_0_[25] ));
  FDCE \DataOut_last_reg[26] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[26]),
        .Q(\DataOut_last_reg_n_0_[26] ));
  FDCE \DataOut_last_reg[27] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[27]),
        .Q(\DataOut_last_reg_n_0_[27] ));
  FDCE \DataOut_last_reg[28] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[28]),
        .Q(\DataOut_last_reg_n_0_[28] ));
  FDCE \DataOut_last_reg[29] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[29]),
        .Q(\DataOut_last_reg_n_0_[29] ));
  FDCE \DataOut_last_reg[2] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[2]),
        .Q(\DataOut_last_reg_n_0_[2] ));
  FDCE \DataOut_last_reg[30] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[30]),
        .Q(\DataOut_last_reg_n_0_[30] ));
  FDCE \DataOut_last_reg[31] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[31]),
        .Q(\DataOut_last_reg_n_0_[31] ));
  FDCE \DataOut_last_reg[3] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[3]),
        .Q(\DataOut_last_reg_n_0_[3] ));
  FDCE \DataOut_last_reg[4] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[4]),
        .Q(\DataOut_last_reg_n_0_[4] ));
  FDCE \DataOut_last_reg[5] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[5]),
        .Q(\DataOut_last_reg_n_0_[5] ));
  FDCE \DataOut_last_reg[6] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[6]),
        .Q(\DataOut_last_reg_n_0_[6] ));
  FDCE \DataOut_last_reg[7] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[7]),
        .Q(\DataOut_last_reg_n_0_[7] ));
  FDCE \DataOut_last_reg[8] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[8]),
        .Q(\DataOut_last_reg_n_0_[8] ));
  FDCE \DataOut_last_reg[9] 
       (.C(CLK),
        .CE(DataOut_last),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(p_1_in[9]),
        .Q(\DataOut_last_reg_n_0_[9] ));
  FDRE \DataOut_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\GEN_FIFO[3].FIFOCH_n_13 ),
        .Q(DataOut[0]),
        .R(1'b0));
  FDRE \DataOut_reg[10] 
       (.C(CLK),
        .CE(1'b1),
        .D(\GEN_FIFO[3].FIFOCH_n_3 ),
        .Q(DataOut[10]),
        .R(1'b0));
  FDRE \DataOut_reg[11] 
       (.C(CLK),
        .CE(1'b1),
        .D(\GEN_FIFO[3].FIFOCH_n_2 ),
        .Q(DataOut[11]),
        .R(1'b0));
  FDRE \DataOut_reg[12] 
       (.C(CLK),
        .CE(1'b1),
        .D(\DataOut[12]_i_1_n_0 ),
        .Q(DataOut[12]),
        .R(1'b0));
  FDRE \DataOut_reg[13] 
       (.C(CLK),
        .CE(1'b1),
        .D(\DataOut[13]_i_1_n_0 ),
        .Q(DataOut[13]),
        .R(1'b0));
  FDRE \DataOut_reg[14] 
       (.C(CLK),
        .CE(1'b1),
        .D(\DataOut[14]_i_1_n_0 ),
        .Q(DataOut[14]),
        .R(1'b0));
  FDRE \DataOut_reg[15] 
       (.C(CLK),
        .CE(1'b1),
        .D(\DataOut[15]_i_1_n_0 ),
        .Q(DataOut[15]),
        .R(1'b0));
  FDRE \DataOut_reg[16] 
       (.C(CLK),
        .CE(1'b1),
        .D(\DataOut[16]_i_1_n_0 ),
        .Q(DataOut[16]),
        .R(1'b0));
  FDRE \DataOut_reg[17] 
       (.C(CLK),
        .CE(1'b1),
        .D(\DataOut[17]_i_1_n_0 ),
        .Q(DataOut[17]),
        .R(1'b0));
  FDRE \DataOut_reg[18] 
       (.C(CLK),
        .CE(1'b1),
        .D(\DataOut[18]_i_1_n_0 ),
        .Q(DataOut[18]),
        .R(1'b0));
  FDRE \DataOut_reg[19] 
       (.C(CLK),
        .CE(1'b1),
        .D(\DataOut[19]_i_1_n_0 ),
        .Q(DataOut[19]),
        .R(1'b0));
  FDRE \DataOut_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\GEN_FIFO[3].FIFOCH_n_12 ),
        .Q(DataOut[1]),
        .R(1'b0));
  FDRE \DataOut_reg[20] 
       (.C(CLK),
        .CE(1'b1),
        .D(\DataOut[20]_i_1_n_0 ),
        .Q(DataOut[20]),
        .R(1'b0));
  FDRE \DataOut_reg[21] 
       (.C(CLK),
        .CE(1'b1),
        .D(\DataOut[21]_i_1_n_0 ),
        .Q(DataOut[21]),
        .R(1'b0));
  FDRE \DataOut_reg[22] 
       (.C(CLK),
        .CE(1'b1),
        .D(\DataOut[22]_i_1_n_0 ),
        .Q(DataOut[22]),
        .R(1'b0));
  FDRE \DataOut_reg[23] 
       (.C(CLK),
        .CE(1'b1),
        .D(\DataOut[23]_i_1_n_0 ),
        .Q(DataOut[23]),
        .R(1'b0));
  FDRE \DataOut_reg[24] 
       (.C(CLK),
        .CE(1'b1),
        .D(\DataOut[24]_i_1_n_0 ),
        .Q(DataOut[24]),
        .R(1'b0));
  FDRE \DataOut_reg[25] 
       (.C(CLK),
        .CE(1'b1),
        .D(\DataOut[25]_i_1_n_0 ),
        .Q(DataOut[25]),
        .R(1'b0));
  FDRE \DataOut_reg[26] 
       (.C(CLK),
        .CE(1'b1),
        .D(\DataOut[26]_i_1_n_0 ),
        .Q(DataOut[26]),
        .R(1'b0));
  FDRE \DataOut_reg[27] 
       (.C(CLK),
        .CE(1'b1),
        .D(\DataOut[27]_i_1_n_0 ),
        .Q(DataOut[27]),
        .R(1'b0));
  FDRE \DataOut_reg[28] 
       (.C(CLK),
        .CE(1'b1),
        .D(\DataOut[28]_i_1_n_0 ),
        .Q(DataOut[28]),
        .R(1'b0));
  FDRE \DataOut_reg[29] 
       (.C(CLK),
        .CE(1'b1),
        .D(\DataOut[29]_i_1_n_0 ),
        .Q(DataOut[29]),
        .R(1'b0));
  FDRE \DataOut_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\GEN_FIFO[3].FIFOCH_n_11 ),
        .Q(DataOut[2]),
        .R(1'b0));
  FDRE \DataOut_reg[30] 
       (.C(CLK),
        .CE(1'b1),
        .D(\DataOut[30]_i_1_n_0 ),
        .Q(DataOut[30]),
        .R(1'b0));
  FDRE \DataOut_reg[31] 
       (.C(CLK),
        .CE(1'b1),
        .D(\DataOut[31]_i_1_n_0 ),
        .Q(DataOut[31]),
        .R(1'b0));
  FDRE \DataOut_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(\GEN_FIFO[3].FIFOCH_n_10 ),
        .Q(DataOut[3]),
        .R(1'b0));
  FDRE \DataOut_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(\GEN_FIFO[3].FIFOCH_n_9 ),
        .Q(DataOut[4]),
        .R(1'b0));
  FDRE \DataOut_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .D(\GEN_FIFO[3].FIFOCH_n_8 ),
        .Q(DataOut[5]),
        .R(1'b0));
  FDRE \DataOut_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .D(\GEN_FIFO[3].FIFOCH_n_7 ),
        .Q(DataOut[6]),
        .R(1'b0));
  FDRE \DataOut_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .D(\GEN_FIFO[3].FIFOCH_n_6 ),
        .Q(DataOut[7]),
        .R(1'b0));
  FDRE \DataOut_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .D(\GEN_FIFO[3].FIFOCH_n_5 ),
        .Q(DataOut[8]),
        .R(1'b0));
  FDRE \DataOut_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .D(\GEN_FIFO[3].FIFOCH_n_4 ),
        .Q(DataOut[9]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0040)) 
    \DataOut_stall[11]_i_1 
       (.I0(\fifo_rd_stm_reg_n_0_[2] ),
        .I1(\fifo_rd_stm_reg_n_0_[3] ),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(\fifo_rd_stm_reg_n_0_[1] ),
        .O(\DataOut_stall[11]_i_1_n_0 ));
  FDCE \DataOut_stall_reg[0] 
       (.C(CLK),
        .CE(\DataOut_stall[11]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(DataOut_intlD[0]),
        .Q(DataOut_stall[0]));
  FDCE \DataOut_stall_reg[10] 
       (.C(CLK),
        .CE(\DataOut_stall[11]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(DataOut_intlD[10]),
        .Q(DataOut_stall[10]));
  FDCE \DataOut_stall_reg[11] 
       (.C(CLK),
        .CE(\DataOut_stall[11]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(DataOut_intlD[11]),
        .Q(DataOut_stall[11]));
  FDCE \DataOut_stall_reg[1] 
       (.C(CLK),
        .CE(\DataOut_stall[11]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(DataOut_intlD[1]),
        .Q(DataOut_stall[1]));
  FDCE \DataOut_stall_reg[2] 
       (.C(CLK),
        .CE(\DataOut_stall[11]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(DataOut_intlD[2]),
        .Q(DataOut_stall[2]));
  FDCE \DataOut_stall_reg[3] 
       (.C(CLK),
        .CE(\DataOut_stall[11]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(DataOut_intlD[3]),
        .Q(DataOut_stall[3]));
  FDCE \DataOut_stall_reg[4] 
       (.C(CLK),
        .CE(\DataOut_stall[11]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(DataOut_intlD[4]),
        .Q(DataOut_stall[4]));
  FDCE \DataOut_stall_reg[5] 
       (.C(CLK),
        .CE(\DataOut_stall[11]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(DataOut_intlD[5]),
        .Q(DataOut_stall[5]));
  FDCE \DataOut_stall_reg[6] 
       (.C(CLK),
        .CE(\DataOut_stall[11]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(DataOut_intlD[6]),
        .Q(DataOut_stall[6]));
  FDCE \DataOut_stall_reg[7] 
       (.C(CLK),
        .CE(\DataOut_stall[11]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(DataOut_intlD[7]),
        .Q(DataOut_stall[7]));
  FDCE \DataOut_stall_reg[8] 
       (.C(CLK),
        .CE(\DataOut_stall[11]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(DataOut_intlD[8]),
        .Q(DataOut_stall[8]));
  FDCE \DataOut_stall_reg[9] 
       (.C(CLK),
        .CE(\DataOut_stall[11]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(DataOut_intlD[9]),
        .Q(DataOut_stall[9]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT5 #(
    .INIT(32'hFFFE0002)) 
    \FIFO_RD[busy]_i_1 
       (.I0(\fifo_rd_stm_reg_n_0_[1] ),
        .I1(\fifo_rd_stm_reg_n_0_[2] ),
        .I2(\fifo_rd_stm_reg_n_0_[3] ),
        .I3(\fifo_rd_stm_reg_n_0_[0] ),
        .I4(\FIFO_RD_reg[busy]__0 ),
        .O(\FIFO_RD[busy]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT5 #(
    .INIT(32'hFBFE0002)) 
    \FIFO_RD[response]_i_1 
       (.I0(\fifo_rd_stm_reg_n_0_[1] ),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\fifo_rd_stm_reg_n_0_[3] ),
        .I3(\fifo_rd_stm_reg_n_0_[2] ),
        .I4(\FIFO_RD_reg[response_n_0_] ),
        .O(\FIFO_RD[response]_i_1_n_0 ));
  FDCE \FIFO_RD_reg[busy] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\FIFO_RD[busy]_i_1_n_0 ),
        .Q(\FIFO_RD_reg[busy]__0 ));
  FDCE \FIFO_RD_reg[response] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\FIFO_RD[response]_i_1_n_0 ),
        .Q(\FIFO_RD_reg[response_n_0_] ));
  LUT5 #(
    .INIT(32'hBFFB0040)) 
    \FIFO_WR[response]_i_1 
       (.I0(fifo_wr_stm[2]),
        .I1(nRST),
        .I2(fifo_wr_stm[1]),
        .I3(fifo_wr_stm[0]),
        .I4(FIFOresponse),
        .O(\FIFO_WR[response]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA000F00000003000)) 
    \FIFO_WR[valid]_i_2 
       (.I0(\FIFO_RD_reg[response_n_0_] ),
        .I1(PRECvalid),
        .I2(nRST),
        .I3(fifo_wr_stm[1]),
        .I4(fifo_wr_stm[0]),
        .I5(fifo_wr_stm[2]),
        .O(\FIFO_WR_reg[valid]0 ));
  FDRE \FIFO_WR_reg[response] 
       (.C(CLK),
        .CE(1'b1),
        .D(\FIFO_WR[response]_i_1_n_0 ),
        .Q(FIFOresponse),
        .R(1'b0));
  FDRE \FIFO_WR_reg[valid] 
       (.C(CLK),
        .CE(1'b1),
        .D(\GEN_FIFO[2].FIFOCH_n_5 ),
        .Q(\FIFO_WR_reg[valid_n_0_] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h8808FFFF88080000)) 
    FIFOvalid_i_1
       (.I0(\fifo_rd_stm_reg_n_0_[2] ),
        .I1(ready_i),
        .I2(PSBUSY_i),
        .I3(\fifo_rd_stm_reg_n_0_[1] ),
        .I4(FIFOvalid_i_3_n_0),
        .I5(FIFOvalid),
        .O(FIFOvalid_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT5 #(
    .INIT(32'h00308C80)) 
    FIFOvalid_i_3
       (.I0(ready_i),
        .I1(\fifo_rd_stm_reg_n_0_[2] ),
        .I2(\fifo_rd_stm_reg_n_0_[1] ),
        .I3(\fifo_rd_stm_reg_n_0_[0] ),
        .I4(\fifo_rd_stm_reg_n_0_[3] ),
        .O(FIFOvalid_i_3_n_0));
  FDCE FIFOvalid_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(FIFOvalid_i_1_n_0),
        .Q(FIFOvalid));
  LUT2 #(
    .INIT(4'h1)) 
    \FSM_sequential_fifo_wr_stm[0]_i_2 
       (.I0(fifo_wr_stm[0]),
        .I1(fifo_wr_stm[1]),
        .O(\FSM_sequential_fifo_wr_stm[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF7FF)) 
    \FSM_sequential_fifo_wr_stm[0]_i_5 
       (.I0(fifo_wr_stm[1]),
        .I1(fifo_wr_stm[0]),
        .I2(\FIFO_RD_reg[response_n_0_] ),
        .I3(fifo_wr_stm[2]),
        .O(\FSM_sequential_fifo_wr_stm[0]_i_5_n_0 ));
  (* FSM_ENCODED_STATES = "wr_tempo:101,valid:110,ready:001,respready:010,wrxrd:100,wrfull:011,idle:000,respvalid:111" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_fifo_wr_stm_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\GEN_FIFO[5].FIFOCH_n_0 ),
        .Q(fifo_wr_stm[0]));
  (* FSM_ENCODED_STATES = "wr_tempo:101,valid:110,ready:001,respready:010,wrxrd:100,wrfull:011,idle:000,respvalid:111" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_fifo_wr_stm_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\GEN_FIFO[10].FIFOCH_n_1 ),
        .Q(fifo_wr_stm[1]));
  (* FSM_ENCODED_STATES = "wr_tempo:101,valid:110,ready:001,respready:010,wrxrd:100,wrfull:011,idle:000,respvalid:111" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_fifo_wr_stm_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\GEN_FIFO[2].FIFOCH_n_1 ),
        .Q(fifo_wr_stm[2]));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags \GEN_FIFO[0].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .\FSM_sequential_fifo_wr_stm_reg[0] (\GEN_FIFO[0].FIFOCH_n_3 ),
        .\FSM_sequential_fifo_wr_stm_reg[0]_0 (\GEN_FIFO[0].FIFOCH_n_4 ),
        .Q({\wr_data_reg_n_0_[0][11] ,\wr_data_reg_n_0_[0][10] ,\wr_data_reg_n_0_[0][9] ,\wr_data_reg_n_0_[0][8] ,\wr_data_reg_n_0_[0][7] ,\wr_data_reg_n_0_[0][6] ,\wr_data_reg_n_0_[0][5] ,\wr_data_reg_n_0_[0][4] ,\wr_data_reg_n_0_[0][3] ,\wr_data_reg_n_0_[0][2] ,\wr_data_reg_n_0_[0][1] ,\wr_data_reg_n_0_[0][0] }),
        .address(address),
        .nRST(nRST),
        .o_rd_data(\rd_data12[0]_0 ),
        .p_0_in(p_0_in),
        .\r_FIFO_COUNT_reg[3]_0 (\GEN_FIFO[1].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[4]_0 (\GEN_FIFO[0].FIFOCH_n_1 ),
        .\r_FIFO_COUNT_reg[6]_0 (\GEN_FIFO[1].FIFOCH_n_3 ),
        .\r_WR_INDEX_reg[0]_0 (\GEN_FIFO[0].FIFOCH_n_2 ),
        .rd_en(rd_en),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_0 \GEN_FIFO[10].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .\FIFO_RD_reg[response] (\FIFO_RD_reg[response_n_0_] ),
        .\FSM_sequential_fifo_wr_stm_reg[1] (\GEN_FIFO[10].FIFOCH_n_1 ),
        .\FSM_sequential_fifo_wr_stm_reg[1]_0 (\GEN_FIFO[10].FIFOCH_n_2 ),
        .PRECvalid(PRECvalid),
        .Q({\wr_data_reg_n_0_[10][11] ,\wr_data_reg_n_0_[10][10] ,\wr_data_reg_n_0_[10][9] ,\wr_data_reg_n_0_[10][8] ,\wr_data_reg_n_0_[10][7] ,\wr_data_reg_n_0_[10][6] ,\wr_data_reg_n_0_[10][5] ,\wr_data_reg_n_0_[10][4] ,\wr_data_reg_n_0_[10][3] ,\wr_data_reg_n_0_[10][2] ,\wr_data_reg_n_0_[10][1] ,\wr_data_reg_n_0_[10][0] }),
        .address(address),
        .in0(fifo_wr_stm[1]),
        .o_rd_data(\rd_data12[10]_10 ),
        .out(fifo_wr_stm),
        .p_0_in(p_0_in),
        .\r_FIFO_COUNT_reg[0]_0 (\GEN_FIFO[8].FIFOCH_n_1 ),
        .\r_FIFO_COUNT_reg[1]_0 (\GEN_FIFO[2].FIFOCH_n_4 ),
        .\r_FIFO_COUNT_reg[1]_1 (\GEN_FIFO[11].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[1]_2 (\GEN_FIFO[14].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[1]_3 (\GEN_FIFO[15].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[6]_0 (\GEN_FIFO[12].FIFOCH_n_1 ),
        .\r_WR_INDEX_reg[0]_0 (\GEN_FIFO[10].FIFOCH_n_0 ),
        .rd_en(rd_en),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_1 \GEN_FIFO[11].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .\DataOut_stall_reg[0] (\GEN_FIFO[11].FIFOCH_n_12 ),
        .\DataOut_stall_reg[10] (\GEN_FIFO[11].FIFOCH_n_2 ),
        .\DataOut_stall_reg[11] (\GEN_FIFO[11].FIFOCH_n_1 ),
        .\DataOut_stall_reg[1] (\GEN_FIFO[11].FIFOCH_n_11 ),
        .\DataOut_stall_reg[2] (\GEN_FIFO[11].FIFOCH_n_10 ),
        .\DataOut_stall_reg[3] (\GEN_FIFO[11].FIFOCH_n_9 ),
        .\DataOut_stall_reg[4] (\GEN_FIFO[11].FIFOCH_n_8 ),
        .\DataOut_stall_reg[5] (\GEN_FIFO[11].FIFOCH_n_7 ),
        .\DataOut_stall_reg[6] (\GEN_FIFO[11].FIFOCH_n_6 ),
        .\DataOut_stall_reg[7] (\GEN_FIFO[11].FIFOCH_n_5 ),
        .\DataOut_stall_reg[8] (\GEN_FIFO[11].FIFOCH_n_4 ),
        .\DataOut_stall_reg[9] (\GEN_FIFO[11].FIFOCH_n_3 ),
        .Q({\wr_data_reg_n_0_[11][11] ,\wr_data_reg_n_0_[11][10] ,\wr_data_reg_n_0_[11][9] ,\wr_data_reg_n_0_[11][8] ,\wr_data_reg_n_0_[11][7] ,\wr_data_reg_n_0_[11][6] ,\wr_data_reg_n_0_[11][5] ,\wr_data_reg_n_0_[11][4] ,\wr_data_reg_n_0_[11][3] ,\wr_data_reg_n_0_[11][2] ,\wr_data_reg_n_0_[11][1] ,\wr_data_reg_n_0_[11][0] }),
        .address(address),
        .\cnt_fifo_reg[6] (\GEN_FIFO[15].FIFOCH_n_1 ),
        .\cnt_fifo_reg[6]_0 (\GEN_FIFO[15].FIFOCH_n_2 ),
        .\cnt_fifo_reg[6]_1 (\GEN_FIFO[15].FIFOCH_n_3 ),
        .\cnt_fifo_reg[6]_10 (\GEN_FIFO[15].FIFOCH_n_12 ),
        .\cnt_fifo_reg[6]_2 (\GEN_FIFO[15].FIFOCH_n_4 ),
        .\cnt_fifo_reg[6]_3 (\GEN_FIFO[15].FIFOCH_n_5 ),
        .\cnt_fifo_reg[6]_4 (\GEN_FIFO[15].FIFOCH_n_6 ),
        .\cnt_fifo_reg[6]_5 (\GEN_FIFO[15].FIFOCH_n_7 ),
        .\cnt_fifo_reg[6]_6 (\GEN_FIFO[15].FIFOCH_n_8 ),
        .\cnt_fifo_reg[6]_7 (\GEN_FIFO[15].FIFOCH_n_9 ),
        .\cnt_fifo_reg[6]_8 (\GEN_FIFO[15].FIFOCH_n_10 ),
        .\cnt_fifo_reg[6]_9 (\GEN_FIFO[15].FIFOCH_n_11 ),
        .o_rd_data(\rd_data12[10]_10 ),
        .p_0_in(p_0_in),
        .\r_WR_INDEX_reg[0]_0 (\GEN_FIFO[11].FIFOCH_n_0 ),
        .rd_en(rd_en),
        .\wr_data_reg[8][7] (\rd_data12[8]_8 ),
        .\wr_data_reg[9][7] (\rd_data12[9]_9 ),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_2 \GEN_FIFO[12].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .\FSM_sequential_fifo_wr_stm_reg[1] (\GEN_FIFO[12].FIFOCH_n_1 ),
        .Q({\wr_data_reg_n_0_[12][11] ,\wr_data_reg_n_0_[12][10] ,\wr_data_reg_n_0_[12][9] ,\wr_data_reg_n_0_[12][8] ,\wr_data_reg_n_0_[12][7] ,\wr_data_reg_n_0_[12][6] ,\wr_data_reg_n_0_[12][5] ,\wr_data_reg_n_0_[12][4] ,\wr_data_reg_n_0_[12][3] ,\wr_data_reg_n_0_[12][2] ,\wr_data_reg_n_0_[12][1] ,\wr_data_reg_n_0_[12][0] }),
        .address(address),
        .\cnt_fifo_reg[5] (\GEN_FIFO[0].FIFOCH_n_1 ),
        .o_rd_data(\rd_data12[12]_12 ),
        .p_0_in(p_0_in),
        .\r_FIFO_COUNT_reg[0]_0 (\GEN_FIFO[13].FIFOCH_n_2 ),
        .\r_FIFO_COUNT_reg[2]_0 (\GEN_FIFO[13].FIFOCH_n_4 ),
        .\r_WR_INDEX_reg[0]_0 (\GEN_FIFO[12].FIFOCH_n_0 ),
        .rd_en(rd_en),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_3 \GEN_FIFO[13].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .\FSM_sequential_fifo_wr_stm_reg[0] (\GEN_FIFO[13].FIFOCH_n_3 ),
        .\FSM_sequential_fifo_wr_stm_reg[0]_0 (\GEN_FIFO[13].FIFOCH_n_4 ),
        .\FSM_sequential_fifo_wr_stm_reg[1] (\GEN_FIFO[13].FIFOCH_n_2 ),
        .Q({\wr_data_reg_n_0_[13][11] ,\wr_data_reg_n_0_[13][10] ,\wr_data_reg_n_0_[13][9] ,\wr_data_reg_n_0_[13][8] ,\wr_data_reg_n_0_[13][7] ,\wr_data_reg_n_0_[13][6] ,\wr_data_reg_n_0_[13][5] ,\wr_data_reg_n_0_[13][4] ,\wr_data_reg_n_0_[13][3] ,\wr_data_reg_n_0_[13][2] ,\wr_data_reg_n_0_[13][1] ,\wr_data_reg_n_0_[13][0] }),
        .address(address),
        .o_rd_data(\rd_data12[13]_13 ),
        .p_0_in(p_0_in),
        .\r_FIFO_COUNT_reg[1]_0 (\GEN_FIFO[12].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[1]_1 (\GEN_FIFO[15].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[1]_2 (\GEN_FIFO[14].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[4]_0 (\GEN_FIFO[13].FIFOCH_n_0 ),
        .\r_WR_INDEX_reg[0]_0 (\GEN_FIFO[13].FIFOCH_n_1 ),
        .rd_en(rd_en),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_4 \GEN_FIFO[14].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .Q({\wr_data_reg_n_0_[14][11] ,\wr_data_reg_n_0_[14][10] ,\wr_data_reg_n_0_[14][9] ,\wr_data_reg_n_0_[14][8] ,\wr_data_reg_n_0_[14][7] ,\wr_data_reg_n_0_[14][6] ,\wr_data_reg_n_0_[14][5] ,\wr_data_reg_n_0_[14][4] ,\wr_data_reg_n_0_[14][3] ,\wr_data_reg_n_0_[14][2] ,\wr_data_reg_n_0_[14][1] ,\wr_data_reg_n_0_[14][0] }),
        .address(address),
        .nRST(nRST),
        .o_rd_data(\rd_data12[14]_14 ),
        .p_0_in(p_0_in),
        .\r_WR_INDEX_reg[0]_0 (\GEN_FIFO[14].FIFOCH_n_0 ),
        .rd_en(rd_en),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_5 \GEN_FIFO[15].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .\DataOut_stall_reg[0] (\GEN_FIFO[15].FIFOCH_n_12 ),
        .\DataOut_stall_reg[10] (\GEN_FIFO[15].FIFOCH_n_2 ),
        .\DataOut_stall_reg[11] (\GEN_FIFO[15].FIFOCH_n_1 ),
        .\DataOut_stall_reg[1] (\GEN_FIFO[15].FIFOCH_n_11 ),
        .\DataOut_stall_reg[2] (\GEN_FIFO[15].FIFOCH_n_10 ),
        .\DataOut_stall_reg[3] (\GEN_FIFO[15].FIFOCH_n_9 ),
        .\DataOut_stall_reg[4] (\GEN_FIFO[15].FIFOCH_n_8 ),
        .\DataOut_stall_reg[5] (\GEN_FIFO[15].FIFOCH_n_7 ),
        .\DataOut_stall_reg[6] (\GEN_FIFO[15].FIFOCH_n_6 ),
        .\DataOut_stall_reg[7] (\GEN_FIFO[15].FIFOCH_n_5 ),
        .\DataOut_stall_reg[8] (\GEN_FIFO[15].FIFOCH_n_4 ),
        .\DataOut_stall_reg[9] (\GEN_FIFO[15].FIFOCH_n_3 ),
        .Q({\wr_data_reg_n_0_[15][11] ,\wr_data_reg_n_0_[15][10] ,\wr_data_reg_n_0_[15][9] ,\wr_data_reg_n_0_[15][8] ,\wr_data_reg_n_0_[15][7] ,\wr_data_reg_n_0_[15][6] ,\wr_data_reg_n_0_[15][5] ,\wr_data_reg_n_0_[15][4] ,\wr_data_reg_n_0_[15][3] ,\wr_data_reg_n_0_[15][2] ,\wr_data_reg_n_0_[15][1] ,\wr_data_reg_n_0_[15][0] }),
        .\WDONBR_intl_reg[0] (\GEN_FIFO[15].FIFOCH_n_0 ),
        .address(address),
        .o_rd_data(\rd_data12[14]_14 ),
        .p_0_in(p_0_in),
        .rd_en(rd_en),
        .\wr_data_reg[12][7] (\rd_data12[12]_12 ),
        .\wr_data_reg[13][7] (\rd_data12[13]_13 ),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_6 \GEN_FIFO[1].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .\FSM_sequential_fifo_wr_stm_reg[0] (\GEN_FIFO[1].FIFOCH_n_1 ),
        .\FSM_sequential_fifo_wr_stm_reg[0]_0 (\GEN_FIFO[1].FIFOCH_n_2 ),
        .\FSM_sequential_fifo_wr_stm_reg[0]_1 (\GEN_FIFO[1].FIFOCH_n_3 ),
        .Q({\wr_data_reg_n_0_[1][11] ,\wr_data_reg_n_0_[1][10] ,\wr_data_reg_n_0_[1][9] ,\wr_data_reg_n_0_[1][8] ,\wr_data_reg_n_0_[1][7] ,\wr_data_reg_n_0_[1][6] ,\wr_data_reg_n_0_[1][5] ,\wr_data_reg_n_0_[1][4] ,\wr_data_reg_n_0_[1][3] ,\wr_data_reg_n_0_[1][2] ,\wr_data_reg_n_0_[1][1] ,\wr_data_reg_n_0_[1][0] }),
        .address(address),
        .\cnt_fifo_reg[6] (\GEN_FIFO[13].FIFOCH_n_0 ),
        .o_rd_data(\rd_data12[1]_1 ),
        .p_0_in(p_0_in),
        .\r_FIFO_COUNT_reg[1]_0 (\GEN_FIFO[3].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[1]_1 (\GEN_FIFO[2].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[5]_0 (\GEN_FIFO[0].FIFOCH_n_4 ),
        .\r_RD_INDEX_reg[4]_0 (\GEN_FIFO[1].FIFOCH_n_0 ),
        .rd_en(rd_en),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_7 \GEN_FIFO[2].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .E(WDOTime_intl0),
        .\FIFO_RD_reg[busy] (\FIFO_RD_reg[busy]__0 ),
        .\FIFO_RD_reg[response] (\FIFO_RD_reg[response_n_0_] ),
        .\FIFO_WR_reg[valid] (\GEN_FIFO[2].FIFOCH_n_5 ),
        .\FIFO_WR_reg[valid]0 (\FIFO_WR_reg[valid]0 ),
        .\FIFO_WR_reg[valid]_0 (\FIFO_WR_reg[valid_n_0_] ),
        .\FSM_sequential_fifo_wr_stm_reg[0] (\GEN_FIFO[2].FIFOCH_n_3 ),
        .\FSM_sequential_fifo_wr_stm_reg[0]_0 (\GEN_FIFO[2].FIFOCH_n_4 ),
        .\FSM_sequential_fifo_wr_stm_reg[2] (\GEN_FIFO[2].FIFOCH_n_1 ),
        .PRECvalid(PRECvalid),
        .Q({\wr_data_reg_n_0_[2][11] ,\wr_data_reg_n_0_[2][10] ,\wr_data_reg_n_0_[2][9] ,\wr_data_reg_n_0_[2][8] ,\wr_data_reg_n_0_[2][7] ,\wr_data_reg_n_0_[2][6] ,\wr_data_reg_n_0_[2][5] ,\wr_data_reg_n_0_[2][4] ,\wr_data_reg_n_0_[2][3] ,\wr_data_reg_n_0_[2][2] ,\wr_data_reg_n_0_[2][1] ,\wr_data_reg_n_0_[2][0] }),
        .address(address),
        .in0(fifo_wr_stm[2]),
        .nRST(nRST),
        .o_rd_data(\rd_data12[2]_2 ),
        .out(fifo_wr_stm),
        .p_0_in(p_0_in),
        .\r_FIFO_COUNT_reg[0]_0 (\GEN_FIFO[0].FIFOCH_n_3 ),
        .\r_FIFO_COUNT_reg[1]_0 (\GEN_FIFO[7].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[1]_1 (\GEN_FIFO[5].FIFOCH_n_1 ),
        .\r_FIFO_COUNT_reg[1]_2 (\GEN_FIFO[6].FIFOCH_n_1 ),
        .\r_FIFO_COUNT_reg[1]_3 (\GEN_FIFO[3].FIFOCH_n_1 ),
        .\r_FIFO_COUNT_reg[1]_4 (\GEN_FIFO[0].FIFOCH_n_2 ),
        .\r_FIFO_COUNT_reg[1]_5 (\GEN_FIFO[12].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[1]_6 (\GEN_FIFO[11].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[1]_7 (\GEN_FIFO[10].FIFOCH_n_2 ),
        .\r_FIFO_COUNT_reg[1]_8 (\GEN_FIFO[3].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[1]_9 (\GEN_FIFO[4].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[6]_0 (\GEN_FIFO[8].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[6]_1 (\GEN_FIFO[6].FIFOCH_n_2 ),
        .\r_WR_INDEX_reg[0]_0 (\GEN_FIFO[2].FIFOCH_n_0 ),
        .rd_en(rd_en),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_8 \GEN_FIFO[3].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .D({\GEN_FIFO[3].FIFOCH_n_2 ,\GEN_FIFO[3].FIFOCH_n_3 ,\GEN_FIFO[3].FIFOCH_n_4 ,\GEN_FIFO[3].FIFOCH_n_5 ,\GEN_FIFO[3].FIFOCH_n_6 ,\GEN_FIFO[3].FIFOCH_n_7 ,\GEN_FIFO[3].FIFOCH_n_8 ,\GEN_FIFO[3].FIFOCH_n_9 ,\GEN_FIFO[3].FIFOCH_n_10 ,\GEN_FIFO[3].FIFOCH_n_11 ,\GEN_FIFO[3].FIFOCH_n_12 ,\GEN_FIFO[3].FIFOCH_n_13 }),
        .\DataOut_intlH_reg[11] (DataOut_intlH[11:0]),
        .\DataOut_last_reg[11] (p_1_in[11:0]),
        .\DataOut_last_reg[11]_0 ({\DataOut_last_reg_n_0_[11] ,\DataOut_last_reg_n_0_[10] ,\DataOut_last_reg_n_0_[9] ,\DataOut_last_reg_n_0_[8] ,\DataOut_last_reg_n_0_[7] ,\DataOut_last_reg_n_0_[6] ,\DataOut_last_reg_n_0_[5] ,\DataOut_last_reg_n_0_[4] ,\DataOut_last_reg_n_0_[3] ,\DataOut_last_reg_n_0_[2] ,\DataOut_last_reg_n_0_[1] ,\DataOut_last_reg_n_0_[0] }),
        .\DataOut_stall_reg[11] (DataOut_intlD),
        .Q(DataOut_stall),
        .\WDONBR_intl_reg[0] (\GEN_FIFO[3].FIFOCH_n_1 ),
        .address(address),
        .\cnt_fifo_reg[6] (\GEN_FIFO[7].FIFOCH_n_3 ),
        .\cnt_fifo_reg[6]_0 (\GEN_FIFO[7].FIFOCH_n_4 ),
        .\cnt_fifo_reg[6]_1 (\GEN_FIFO[7].FIFOCH_n_5 ),
        .\cnt_fifo_reg[6]_10 (\GEN_FIFO[7].FIFOCH_n_14 ),
        .\cnt_fifo_reg[6]_2 (\GEN_FIFO[7].FIFOCH_n_6 ),
        .\cnt_fifo_reg[6]_3 (\GEN_FIFO[7].FIFOCH_n_7 ),
        .\cnt_fifo_reg[6]_4 (\GEN_FIFO[7].FIFOCH_n_8 ),
        .\cnt_fifo_reg[6]_5 (\GEN_FIFO[7].FIFOCH_n_9 ),
        .\cnt_fifo_reg[6]_6 (\GEN_FIFO[7].FIFOCH_n_10 ),
        .\cnt_fifo_reg[6]_7 (\GEN_FIFO[7].FIFOCH_n_11 ),
        .\cnt_fifo_reg[6]_8 (\GEN_FIFO[7].FIFOCH_n_12 ),
        .\cnt_fifo_reg[6]_9 (\GEN_FIFO[7].FIFOCH_n_13 ),
        .\cnt_fifo_reg[7] (\GEN_FIFO[11].FIFOCH_n_1 ),
        .\cnt_fifo_reg[7]_0 (\GEN_FIFO[11].FIFOCH_n_2 ),
        .\cnt_fifo_reg[7]_1 (\GEN_FIFO[11].FIFOCH_n_3 ),
        .\cnt_fifo_reg[7]_10 (\GEN_FIFO[11].FIFOCH_n_12 ),
        .\cnt_fifo_reg[7]_2 (\GEN_FIFO[11].FIFOCH_n_4 ),
        .\cnt_fifo_reg[7]_3 (\GEN_FIFO[11].FIFOCH_n_5 ),
        .\cnt_fifo_reg[7]_4 (\GEN_FIFO[11].FIFOCH_n_6 ),
        .\cnt_fifo_reg[7]_5 (\GEN_FIFO[11].FIFOCH_n_7 ),
        .\cnt_fifo_reg[7]_6 (\GEN_FIFO[11].FIFOCH_n_8 ),
        .\cnt_fifo_reg[7]_7 (\GEN_FIFO[11].FIFOCH_n_9 ),
        .\cnt_fifo_reg[7]_8 (\GEN_FIFO[11].FIFOCH_n_10 ),
        .\cnt_fifo_reg[7]_9 (\GEN_FIFO[11].FIFOCH_n_11 ),
        .\fifo_rd_stm_reg[0] (\fifo_rd_stm_reg_n_0_[0] ),
        .\fifo_rd_stm_reg[1] (\DataOut[31]_i_2_n_0 ),
        .o_rd_data(\rd_data12[2]_2 ),
        .p_0_in(p_0_in),
        .\r_FIFO_COUNT_reg[1]_0 (\GEN_FIFO[1].FIFOCH_n_2 ),
        .\r_FIFO_COUNT_reg[1]_1 (\GEN_FIFO[14].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[1]_2 (\GEN_FIFO[9].FIFOCH_n_2 ),
        .\r_WR_INDEX_reg[0]_0 (\GEN_FIFO[3].FIFOCH_n_0 ),
        .rd_en(rd_en),
        .\rdy_state_reg[1] (rdy_state),
        .\wr_data_reg[0][7] (\rd_data12[0]_0 ),
        .\wr_data_reg[1][7] (\rd_data12[1]_1 ),
        .\wr_data_reg[3][11] ({\wr_data_reg_n_0_[3][11] ,\wr_data_reg_n_0_[3][10] ,\wr_data_reg_n_0_[3][9] ,\wr_data_reg_n_0_[3][8] ,\wr_data_reg_n_0_[3][7] ,\wr_data_reg_n_0_[3][6] ,\wr_data_reg_n_0_[3][5] ,\wr_data_reg_n_0_[3][4] ,\wr_data_reg_n_0_[3][3] ,\wr_data_reg_n_0_[3][2] ,\wr_data_reg_n_0_[3][1] ,\wr_data_reg_n_0_[3][0] }),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_9 \GEN_FIFO[4].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .Q({\wr_data_reg_n_0_[4][11] ,\wr_data_reg_n_0_[4][10] ,\wr_data_reg_n_0_[4][9] ,\wr_data_reg_n_0_[4][8] ,\wr_data_reg_n_0_[4][7] ,\wr_data_reg_n_0_[4][6] ,\wr_data_reg_n_0_[4][5] ,\wr_data_reg_n_0_[4][4] ,\wr_data_reg_n_0_[4][3] ,\wr_data_reg_n_0_[4][2] ,\wr_data_reg_n_0_[4][1] ,\wr_data_reg_n_0_[4][0] }),
        .address(address),
        .\cnt_fifo_reg[5] (\GEN_FIFO[0].FIFOCH_n_1 ),
        .o_rd_data(\rd_data12[4]_4 ),
        .p_0_in(p_0_in),
        .\r_WR_INDEX_reg[0]_0 (\GEN_FIFO[4].FIFOCH_n_0 ),
        .rd_en(rd_en),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_10 \GEN_FIFO[5].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .\FSM_sequential_fifo_wr_stm_reg[0] (\GEN_FIFO[5].FIFOCH_n_0 ),
        .\FSM_sequential_fifo_wr_stm_reg[0]_0 (\FSM_sequential_fifo_wr_stm[0]_i_2_n_0 ),
        .\FSM_sequential_fifo_wr_stm_reg[1] (\GEN_FIFO[2].FIFOCH_n_3 ),
        .\FSM_sequential_fifo_wr_stm_reg[1]_0 (\FSM_sequential_fifo_wr_stm[0]_i_5_n_0 ),
        .Q({\wr_data_reg_n_0_[5][11] ,\wr_data_reg_n_0_[5][10] ,\wr_data_reg_n_0_[5][9] ,\wr_data_reg_n_0_[5][8] ,\wr_data_reg_n_0_[5][7] ,\wr_data_reg_n_0_[5][6] ,\wr_data_reg_n_0_[5][5] ,\wr_data_reg_n_0_[5][4] ,\wr_data_reg_n_0_[5][3] ,\wr_data_reg_n_0_[5][2] ,\wr_data_reg_n_0_[5][1] ,\wr_data_reg_n_0_[5][0] }),
        .address(address),
        .\cnt_fifo_reg[6] (\GEN_FIFO[13].FIFOCH_n_0 ),
        .in0(fifo_wr_stm[0]),
        .o_rd_data(\rd_data12[5]_5 ),
        .out(fifo_wr_stm),
        .p_0_in(p_0_in),
        .\r_FIFO_COUNT_reg[1]_0 (\GEN_FIFO[1].FIFOCH_n_1 ),
        .\r_FIFO_COUNT_reg[1]_1 (\GEN_FIFO[9].FIFOCH_n_1 ),
        .\r_FIFO_COUNT_reg[1]_2 (\GEN_FIFO[4].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[1]_3 (\GEN_FIFO[7].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[1]_4 (\GEN_FIFO[6].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[5]_0 (\GEN_FIFO[13].FIFOCH_n_3 ),
        .\r_WR_INDEX_reg[4]_0 (\GEN_FIFO[5].FIFOCH_n_1 ),
        .rd_en(rd_en),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_11 \GEN_FIFO[6].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .\FSM_sequential_fifo_wr_stm_reg[0] (\GEN_FIFO[6].FIFOCH_n_2 ),
        .Q({\wr_data_reg_n_0_[6][11] ,\wr_data_reg_n_0_[6][10] ,\wr_data_reg_n_0_[6][9] ,\wr_data_reg_n_0_[6][8] ,\wr_data_reg_n_0_[6][7] ,\wr_data_reg_n_0_[6][6] ,\wr_data_reg_n_0_[6][5] ,\wr_data_reg_n_0_[6][4] ,\wr_data_reg_n_0_[6][3] ,\wr_data_reg_n_0_[6][2] ,\wr_data_reg_n_0_[6][1] ,\wr_data_reg_n_0_[6][0] }),
        .\WDONBR_intl_reg[0] (\GEN_FIFO[6].FIFOCH_n_1 ),
        .address(address),
        .o_rd_data(\rd_data12[6]_6 ),
        .p_0_in(p_0_in),
        .\r_FIFO_COUNT_reg[1]_0 (\GEN_FIFO[4].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[1]_1 (\GEN_FIFO[13].FIFOCH_n_1 ),
        .\r_FIFO_COUNT_reg[1]_2 (\GEN_FIFO[10].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[3]_0 (\GEN_FIFO[7].FIFOCH_n_1 ),
        .\r_FIFO_COUNT_reg[6]_0 (\GEN_FIFO[7].FIFOCH_n_2 ),
        .\r_WR_INDEX_reg[0]_0 (\GEN_FIFO[6].FIFOCH_n_0 ),
        .rd_en(rd_en),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_12 \GEN_FIFO[7].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .\DataOut_stall_reg[0] (\GEN_FIFO[7].FIFOCH_n_14 ),
        .\DataOut_stall_reg[10] (\GEN_FIFO[7].FIFOCH_n_4 ),
        .\DataOut_stall_reg[11] (\GEN_FIFO[7].FIFOCH_n_3 ),
        .\DataOut_stall_reg[1] (\GEN_FIFO[7].FIFOCH_n_13 ),
        .\DataOut_stall_reg[2] (\GEN_FIFO[7].FIFOCH_n_12 ),
        .\DataOut_stall_reg[3] (\GEN_FIFO[7].FIFOCH_n_11 ),
        .\DataOut_stall_reg[4] (\GEN_FIFO[7].FIFOCH_n_10 ),
        .\DataOut_stall_reg[5] (\GEN_FIFO[7].FIFOCH_n_9 ),
        .\DataOut_stall_reg[6] (\GEN_FIFO[7].FIFOCH_n_8 ),
        .\DataOut_stall_reg[7] (\GEN_FIFO[7].FIFOCH_n_7 ),
        .\DataOut_stall_reg[8] (\GEN_FIFO[7].FIFOCH_n_6 ),
        .\DataOut_stall_reg[9] (\GEN_FIFO[7].FIFOCH_n_5 ),
        .\FSM_sequential_fifo_wr_stm_reg[0] (\GEN_FIFO[7].FIFOCH_n_1 ),
        .\FSM_sequential_fifo_wr_stm_reg[0]_0 (\GEN_FIFO[7].FIFOCH_n_2 ),
        .Q({\wr_data_reg_n_0_[7][11] ,\wr_data_reg_n_0_[7][10] ,\wr_data_reg_n_0_[7][9] ,\wr_data_reg_n_0_[7][8] ,\wr_data_reg_n_0_[7][7] ,\wr_data_reg_n_0_[7][6] ,\wr_data_reg_n_0_[7][5] ,\wr_data_reg_n_0_[7][4] ,\wr_data_reg_n_0_[7][3] ,\wr_data_reg_n_0_[7][2] ,\wr_data_reg_n_0_[7][1] ,\wr_data_reg_n_0_[7][0] }),
        .address(address),
        .o_rd_data(\rd_data12[6]_6 ),
        .p_0_in(p_0_in),
        .\r_WR_INDEX_reg[0]_0 (\GEN_FIFO[7].FIFOCH_n_0 ),
        .rd_en(rd_en),
        .\wr_data_reg[4][7] (\rd_data12[4]_4 ),
        .\wr_data_reg[5][7] (\rd_data12[5]_5 ),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_13 \GEN_FIFO[8].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .\FSM_sequential_fifo_wr_stm_reg[0] (\GEN_FIFO[8].FIFOCH_n_2 ),
        .\FSM_sequential_fifo_wr_stm_reg[1] (\GEN_FIFO[8].FIFOCH_n_1 ),
        .Q({\wr_data_reg_n_0_[8][11] ,\wr_data_reg_n_0_[8][10] ,\wr_data_reg_n_0_[8][9] ,\wr_data_reg_n_0_[8][8] ,\wr_data_reg_n_0_[8][7] ,\wr_data_reg_n_0_[8][6] ,\wr_data_reg_n_0_[8][5] ,\wr_data_reg_n_0_[8][4] ,\wr_data_reg_n_0_[8][3] ,\wr_data_reg_n_0_[8][2] ,\wr_data_reg_n_0_[8][1] ,\wr_data_reg_n_0_[8][0] }),
        .\WDONBR_intl_reg[0] (\GEN_FIFO[8].FIFOCH_n_0 ),
        .address(address),
        .\cnt_fifo_reg[5] (\GEN_FIFO[0].FIFOCH_n_1 ),
        .o_rd_data(\rd_data12[8]_8 ),
        .p_0_in(p_0_in),
        .\r_FIFO_COUNT_reg[1]_0 (\GEN_FIFO[15].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[3]_0 (\GEN_FIFO[9].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[6]_0 (\GEN_FIFO[9].FIFOCH_n_3 ),
        .rd_en(rd_en),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_14 \GEN_FIFO[9].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .\FSM_sequential_fifo_wr_stm_reg[0] (\GEN_FIFO[9].FIFOCH_n_1 ),
        .\FSM_sequential_fifo_wr_stm_reg[0]_0 (\GEN_FIFO[9].FIFOCH_n_2 ),
        .\FSM_sequential_fifo_wr_stm_reg[1] (\GEN_FIFO[9].FIFOCH_n_3 ),
        .Q({\wr_data_reg_n_0_[9][11] ,\wr_data_reg_n_0_[9][10] ,\wr_data_reg_n_0_[9][9] ,\wr_data_reg_n_0_[9][8] ,\wr_data_reg_n_0_[9][7] ,\wr_data_reg_n_0_[9][6] ,\wr_data_reg_n_0_[9][5] ,\wr_data_reg_n_0_[9][4] ,\wr_data_reg_n_0_[9][3] ,\wr_data_reg_n_0_[9][2] ,\wr_data_reg_n_0_[9][1] ,\wr_data_reg_n_0_[9][0] }),
        .address(address),
        .\cnt_fifo_reg[6] (\GEN_FIFO[13].FIFOCH_n_0 ),
        .o_rd_data(\rd_data12[9]_9 ),
        .p_0_in(p_0_in),
        .\r_FIFO_COUNT_reg[1]_0 (\GEN_FIFO[11].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[1]_1 (\GEN_FIFO[10].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[5]_0 (\GEN_FIFO[8].FIFOCH_n_2 ),
        .\r_RD_INDEX_reg[4]_0 (\GEN_FIFO[9].FIFOCH_n_0 ),
        .rd_en(rd_en),
        .wr_en_reg(wr_en_reg_n_0));
  FDRE \WDONBR_intl_reg[0] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDONBR[0]),
        .Q(WDONBR_intl[0]),
        .R(1'b0));
  FDRE \WDONBR_intl_reg[1] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDONBR[1]),
        .Q(WDONBR_intl[1]),
        .R(1'b0));
  FDRE \WDONBR_intl_reg[2] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDONBR[2]),
        .Q(WDONBR_intl[2]),
        .R(1'b0));
  FDRE \WDONBR_intl_reg[3] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDONBR[3]),
        .Q(WDONBR_intl[3]),
        .R(1'b0));
  FDRE \WDONBR_intl_reg[4] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDONBR[4]),
        .Q(WDONBR_intl[4]),
        .R(1'b0));
  FDRE \WDONBR_intl_reg[5] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDONBR[5]),
        .Q(WDONBR_intl[5]),
        .R(1'b0));
  FDRE \WDONBR_intl_reg[6] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDONBR[6]),
        .Q(WDONBR_intl[6]),
        .R(1'b0));
  FDRE \WDONBR_intl_reg[7] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDONBR[7]),
        .Q(WDONBR_intl[7]),
        .R(1'b0));
  FDRE \WDONBR_intl_reg[8] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDONBR[8]),
        .Q(WDONBR_intl[8]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[0] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[0]),
        .Q(\WDOTime_intl_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[10] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[10]),
        .Q(\WDOTime_intl_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[11] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[11]),
        .Q(\WDOTime_intl_reg_n_0_[11] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[12] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[12]),
        .Q(\WDOTime_intl_reg_n_0_[12] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[13] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[13]),
        .Q(\WDOTime_intl_reg_n_0_[13] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[14] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[14]),
        .Q(\WDOTime_intl_reg_n_0_[14] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[15] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[15]),
        .Q(\WDOTime_intl_reg_n_0_[15] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[16] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[16]),
        .Q(\WDOTime_intl_reg_n_0_[16] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[17] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[17]),
        .Q(\WDOTime_intl_reg_n_0_[17] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[18] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[18]),
        .Q(\WDOTime_intl_reg_n_0_[18] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[19] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[19]),
        .Q(\WDOTime_intl_reg_n_0_[19] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[1] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[1]),
        .Q(\WDOTime_intl_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[20] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[20]),
        .Q(\WDOTime_intl_reg_n_0_[20] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[21] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[21]),
        .Q(\WDOTime_intl_reg_n_0_[21] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[22] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[22]),
        .Q(\WDOTime_intl_reg_n_0_[22] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[23] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[23]),
        .Q(\WDOTime_intl_reg_n_0_[23] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[24] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[24]),
        .Q(\WDOTime_intl_reg_n_0_[24] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[25] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[25]),
        .Q(\WDOTime_intl_reg_n_0_[25] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[26] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[26]),
        .Q(\WDOTime_intl_reg_n_0_[26] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[27] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[27]),
        .Q(\WDOTime_intl_reg_n_0_[27] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[28] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[28]),
        .Q(\WDOTime_intl_reg_n_0_[28] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[29] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[29]),
        .Q(\WDOTime_intl_reg_n_0_[29] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[2] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[2]),
        .Q(\WDOTime_intl_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[30] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[30]),
        .Q(\WDOTime_intl_reg_n_0_[30] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[31] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[31]),
        .Q(\WDOTime_intl_reg_n_0_[31] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[32] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[32]),
        .Q(data1[0]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[33] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[33]),
        .Q(data1[1]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[34] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[34]),
        .Q(data1[2]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[35] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[35]),
        .Q(data1[3]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[36] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[36]),
        .Q(data1[4]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[37] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[37]),
        .Q(data1[5]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[38] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[38]),
        .Q(data1[6]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[39] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[39]),
        .Q(data1[7]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[3] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[3]),
        .Q(\WDOTime_intl_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[40] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[40]),
        .Q(data1[8]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[41] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[41]),
        .Q(data1[9]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[42] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[42]),
        .Q(data1[10]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[43] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[43]),
        .Q(data1[11]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[44] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[44]),
        .Q(data1[12]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[45] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[45]),
        .Q(data1[13]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[46] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[46]),
        .Q(data1[14]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[47] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[47]),
        .Q(data1[15]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[48] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[48]),
        .Q(data1[16]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[49] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[49]),
        .Q(data1[17]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[4] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[4]),
        .Q(\WDOTime_intl_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[50] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[50]),
        .Q(data1[18]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[51] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[51]),
        .Q(data1[19]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[52] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[52]),
        .Q(data1[20]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[53] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[53]),
        .Q(data1[21]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[54] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[54]),
        .Q(data1[22]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[55] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[55]),
        .Q(data1[23]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[56] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[56]),
        .Q(data1[24]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[57] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[57]),
        .Q(data1[25]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[58] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[58]),
        .Q(data1[26]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[59] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[59]),
        .Q(data1[27]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[5] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[5]),
        .Q(\WDOTime_intl_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[60] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[60]),
        .Q(data1[28]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[61] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[61]),
        .Q(data1[29]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[62] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[62]),
        .Q(data1[30]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[63] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[63]),
        .Q(data1[31]),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[6] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[6]),
        .Q(\WDOTime_intl_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[7] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[7]),
        .Q(\WDOTime_intl_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[8] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[8]),
        .Q(\WDOTime_intl_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \WDOTime_intl_reg[9] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(WDOTime[9]),
        .Q(\WDOTime_intl_reg_n_0_[9] ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h30FFBA00)) 
    \cnt_fifo[0]_i_1 
       (.I0(\cnt_fifo[2]_i_2_n_0 ),
        .I1(\fifo_rd_stm_reg_n_0_[3] ),
        .I2(\cnt_fifo[0]_i_2_n_0 ),
        .I3(cnt_fifo0),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .O(\cnt_fifo[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \cnt_fifo[0]_i_2 
       (.I0(PSBUSY_i),
        .I1(ready_i),
        .I2(\fifo_rd_stm_reg_n_0_[1] ),
        .O(\cnt_fifo[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT4 #(
    .INIT(16'h2F80)) 
    \cnt_fifo[1]_i_1 
       (.I0(\cnt_fifo[2]_i_2_n_0 ),
        .I1(\cnt_fifo_reg_n_0_[0] ),
        .I2(cnt_fifo0),
        .I3(\cnt_fifo_reg_n_0_[1] ),
        .O(\cnt_fifo[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT5 #(
    .INIT(32'h2AFF8000)) 
    \cnt_fifo[2]_i_1 
       (.I0(\cnt_fifo[2]_i_2_n_0 ),
        .I1(\cnt_fifo_reg_n_0_[1] ),
        .I2(\cnt_fifo_reg_n_0_[0] ),
        .I3(cnt_fifo0),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .O(\cnt_fifo[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT5 #(
    .INIT(32'hF0F0FDF0)) 
    \cnt_fifo[2]_i_2 
       (.I0(\fifo_rd_stm[0]_i_4_n_0 ),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\fifo_rd_stm_reg_n_0_[3] ),
        .I3(\fifo_rd_stm_reg_n_0_[1] ),
        .I4(\fifo_rd_stm[3]_i_3_n_0 ),
        .O(\cnt_fifo[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \cnt_fifo[3]_i_1 
       (.I0(\cnt_fifo_reg_n_0_[3] ),
        .I1(\cnt_fifo_reg_n_0_[2] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .O(\cnt_fifo[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \cnt_fifo[4]_i_1 
       (.I0(\cnt_fifo_reg_n_0_[4] ),
        .I1(\cnt_fifo_reg_n_0_[3] ),
        .I2(\cnt_fifo_reg_n_0_[0] ),
        .I3(\cnt_fifo_reg_n_0_[1] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .O(\cnt_fifo[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \cnt_fifo[5]_i_1 
       (.I0(address[0]),
        .I1(\cnt_fifo_reg_n_0_[4] ),
        .I2(\cnt_fifo_reg_n_0_[2] ),
        .I3(\cnt_fifo_reg_n_0_[1] ),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\cnt_fifo_reg_n_0_[3] ),
        .O(\cnt_fifo[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \cnt_fifo[6]_i_1 
       (.I0(address[1]),
        .I1(\cnt_fifo[8]_i_4_n_0 ),
        .O(\cnt_fifo[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT3 #(
    .INIT(8'h9A)) 
    \cnt_fifo[7]_i_1 
       (.I0(address[2]),
        .I1(\cnt_fifo[8]_i_4_n_0 ),
        .I2(address[1]),
        .O(\cnt_fifo[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000C08000)) 
    \cnt_fifo[8]_i_1 
       (.I0(ready_i),
        .I1(\fifo_rd_stm_reg_n_0_[2] ),
        .I2(nRST),
        .I3(\fifo_rd_stm_reg_n_0_[1] ),
        .I4(\fifo_rd_stm_reg_n_0_[0] ),
        .I5(\fifo_rd_stm_reg_n_0_[3] ),
        .O(\cnt_fifo[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00A0000008800080)) 
    \cnt_fifo[8]_i_2 
       (.I0(nRST),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\fifo_rd_stm_reg_n_0_[2] ),
        .I3(\fifo_rd_stm_reg_n_0_[3] ),
        .I4(ready_i),
        .I5(\fifo_rd_stm_reg_n_0_[1] ),
        .O(cnt_fifo0));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT4 #(
    .INIT(16'hAA6A)) 
    \cnt_fifo[8]_i_3 
       (.I0(address[3]),
        .I1(address[2]),
        .I2(address[1]),
        .I3(\cnt_fifo[8]_i_4_n_0 ),
        .O(\cnt_fifo[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \cnt_fifo[8]_i_4 
       (.I0(\cnt_fifo_reg_n_0_[4] ),
        .I1(\cnt_fifo_reg_n_0_[2] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[3] ),
        .I5(address[0]),
        .O(\cnt_fifo[8]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_fifo_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\cnt_fifo[0]_i_1_n_0 ),
        .Q(\cnt_fifo_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_fifo_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\cnt_fifo[1]_i_1_n_0 ),
        .Q(\cnt_fifo_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_fifo_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\cnt_fifo[2]_i_1_n_0 ),
        .Q(\cnt_fifo_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_fifo_reg[3] 
       (.C(CLK),
        .CE(cnt_fifo0),
        .D(\cnt_fifo[3]_i_1_n_0 ),
        .Q(\cnt_fifo_reg_n_0_[3] ),
        .R(\cnt_fifo[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_fifo_reg[4] 
       (.C(CLK),
        .CE(cnt_fifo0),
        .D(\cnt_fifo[4]_i_1_n_0 ),
        .Q(\cnt_fifo_reg_n_0_[4] ),
        .R(\cnt_fifo[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_fifo_reg[5] 
       (.C(CLK),
        .CE(cnt_fifo0),
        .D(\cnt_fifo[5]_i_1_n_0 ),
        .Q(address[0]),
        .R(\cnt_fifo[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_fifo_reg[6] 
       (.C(CLK),
        .CE(cnt_fifo0),
        .D(\cnt_fifo[6]_i_1_n_0 ),
        .Q(address[1]),
        .R(\cnt_fifo[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_fifo_reg[7] 
       (.C(CLK),
        .CE(cnt_fifo0),
        .D(\cnt_fifo[7]_i_1_n_0 ),
        .Q(address[2]),
        .R(\cnt_fifo[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_fifo_reg[8] 
       (.C(CLK),
        .CE(cnt_fifo0),
        .D(\cnt_fifo[8]_i_3_n_0 ),
        .Q(address[3]),
        .R(\cnt_fifo[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00100000)) 
    \fifo_rd_stm[0]_i_1 
       (.I0(\fifo_rd_stm[3]_i_3_n_0 ),
        .I1(\fifo_rd_stm[0]_i_2_n_0 ),
        .I2(\fifo_rd_stm_reg_n_0_[2] ),
        .I3(\fifo_rd_stm_reg_n_0_[3] ),
        .I4(\fifo_rd_stm_reg_n_0_[1] ),
        .I5(\fifo_rd_stm[0]_i_3_n_0 ),
        .O(fifo_rd_stm[0]));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \fifo_rd_stm[0]_i_2 
       (.I0(\fifo_rd_stm_reg_n_0_[0] ),
        .I1(\fifo_rd_stm[0]_i_4_n_0 ),
        .O(\fifo_rd_stm[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF4500)) 
    \fifo_rd_stm[0]_i_3 
       (.I0(\fifo_rd_stm_reg_n_0_[1] ),
        .I1(last_fifo_rd_stm[0]),
        .I2(ready_i),
        .I3(\DataOut_stall[11]_i_1_n_0 ),
        .I4(\fifo_rd_stm[0]_i_5_n_0 ),
        .O(\fifo_rd_stm[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFEFFFE)) 
    \fifo_rd_stm[0]_i_4 
       (.I0(\fifo_rd_stm[0]_i_6_n_0 ),
        .I1(\cnt_fifo_reg_n_0_[3] ),
        .I2(address[3]),
        .I3(\cnt_fifo_reg_n_0_[4] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\cnt_fifo_reg_n_0_[1] ),
        .O(\fifo_rd_stm[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0C000C050C05000F)) 
    \fifo_rd_stm[0]_i_5 
       (.I0(\FIFO_WR_reg[valid_n_0_] ),
        .I1(\fifo_rd_stm[0]_i_7_n_0 ),
        .I2(\fifo_rd_stm_reg_n_0_[3] ),
        .I3(\fifo_rd_stm_reg_n_0_[2] ),
        .I4(\fifo_rd_stm_reg_n_0_[0] ),
        .I5(\fifo_rd_stm_reg_n_0_[1] ),
        .O(\fifo_rd_stm[0]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \fifo_rd_stm[0]_i_6 
       (.I0(address[2]),
        .I1(address[1]),
        .I2(address[0]),
        .O(\fifo_rd_stm[0]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT3 #(
    .INIT(8'h4F)) 
    \fifo_rd_stm[0]_i_7 
       (.I0(\fifo_rd_stm_reg_n_0_[1] ),
        .I1(PSBUSY_i),
        .I2(ready_i),
        .O(\fifo_rd_stm[0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAEAEAAA)) 
    \fifo_rd_stm[1]_i_1 
       (.I0(\fifo_rd_stm[1]_i_2_n_0 ),
        .I1(\FIFO_WR_reg[valid_n_0_] ),
        .I2(\fifo_rd_stm[1]_i_3_n_0 ),
        .I3(\fifo_rd_stm_reg_n_0_[1] ),
        .I4(\fifo_rd_stm_reg_n_0_[0] ),
        .I5(\fifo_rd_stm[2]_i_5_n_0 ),
        .O(fifo_rd_stm[1]));
  LUT6 #(
    .INIT(64'h4000440040004000)) 
    \fifo_rd_stm[1]_i_2 
       (.I0(\fifo_rd_stm_reg_n_0_[3] ),
        .I1(\fifo_rd_stm_reg_n_0_[2] ),
        .I2(\fifo_rd_stm_reg_n_0_[1] ),
        .I3(ready_i),
        .I4(PSBUSY_i),
        .I5(\fifo_rd_stm_reg_n_0_[0] ),
        .O(\fifo_rd_stm[1]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \fifo_rd_stm[1]_i_3 
       (.I0(\fifo_rd_stm_reg_n_0_[3] ),
        .I1(\fifo_rd_stm_reg_n_0_[2] ),
        .O(\fifo_rd_stm[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF888888F8)) 
    \fifo_rd_stm[2]_i_1 
       (.I0(\fifo_rd_stm[2]_i_2_n_0 ),
        .I1(\fifo_rd_stm[2]_i_3_n_0 ),
        .I2(\fifo_rd_stm[2]_i_4_n_0 ),
        .I3(\fifo_rd_stm_reg_n_0_[3] ),
        .I4(\FIFO_WR_reg[valid_n_0_] ),
        .I5(\fifo_rd_stm[2]_i_5_n_0 ),
        .O(fifo_rd_stm[2]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'h4F)) 
    \fifo_rd_stm[2]_i_2 
       (.I0(\fifo_rd_stm[3]_i_3_n_0 ),
        .I1(ready_i),
        .I2(\fifo_rd_stm_reg_n_0_[1] ),
        .O(\fifo_rd_stm[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT4 #(
    .INIT(16'h4440)) 
    \fifo_rd_stm[2]_i_3 
       (.I0(\fifo_rd_stm_reg_n_0_[3] ),
        .I1(\fifo_rd_stm_reg_n_0_[2] ),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(\fifo_rd_stm_reg_n_0_[1] ),
        .O(\fifo_rd_stm[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \fifo_rd_stm[2]_i_4 
       (.I0(\fifo_rd_stm_reg_n_0_[2] ),
        .I1(\fifo_rd_stm_reg_n_0_[1] ),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .O(\fifo_rd_stm[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000008000000)) 
    \fifo_rd_stm[2]_i_5 
       (.I0(\fifo_rd_stm_reg_n_0_[0] ),
        .I1(\fifo_rd_stm_reg_n_0_[3] ),
        .I2(\fifo_rd_stm_reg_n_0_[2] ),
        .I3(ready_i),
        .I4(last_fifo_rd_stm[2]),
        .I5(\fifo_rd_stm_reg_n_0_[1] ),
        .O(\fifo_rd_stm[2]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hA2AAAAAA)) 
    \fifo_rd_stm[3]_i_1 
       (.I0(nRST),
        .I1(\fifo_rd_stm_reg_n_0_[3] ),
        .I2(\fifo_rd_stm_reg_n_0_[2] ),
        .I3(\fifo_rd_stm_reg_n_0_[1] ),
        .I4(\fifo_rd_stm_reg_n_0_[0] ),
        .O(fifo_rd_stm0));
  LUT6 #(
    .INIT(64'h0003B0000000B000)) 
    \fifo_rd_stm[3]_i_2 
       (.I0(\fifo_rd_stm[3]_i_3_n_0 ),
        .I1(ready_i),
        .I2(\fifo_rd_stm_reg_n_0_[1] ),
        .I3(\fifo_rd_stm_reg_n_0_[2] ),
        .I4(\fifo_rd_stm_reg_n_0_[3] ),
        .I5(\fifo_rd_stm_reg_n_0_[0] ),
        .O(fifo_rd_stm[3]));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT5 #(
    .INIT(32'h40000000)) 
    \fifo_rd_stm[3]_i_3 
       (.I0(\cnt_fifo[8]_i_4_n_0 ),
        .I1(address[1]),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(address[3]),
        .I4(address[2]),
        .O(\fifo_rd_stm[3]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fifo_rd_stm_reg[0] 
       (.C(CLK),
        .CE(fifo_rd_stm0),
        .D(fifo_rd_stm[0]),
        .Q(\fifo_rd_stm_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \fifo_rd_stm_reg[1] 
       (.C(CLK),
        .CE(fifo_rd_stm0),
        .D(fifo_rd_stm[1]),
        .Q(\fifo_rd_stm_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \fifo_rd_stm_reg[2] 
       (.C(CLK),
        .CE(fifo_rd_stm0),
        .D(fifo_rd_stm[2]),
        .Q(\fifo_rd_stm_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \fifo_rd_stm_reg[3] 
       (.C(CLK),
        .CE(fifo_rd_stm0),
        .D(fifo_rd_stm[3]),
        .Q(\fifo_rd_stm_reg_n_0_[3] ),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hBF80)) 
    \last_fifo_rd_stm[0]_i_1 
       (.I0(\fifo_rd_stm_reg_n_0_[0] ),
        .I1(DataOut_last),
        .I2(nRST),
        .I3(last_fifo_rd_stm[0]),
        .O(\last_fifo_rd_stm[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00200000)) 
    \last_fifo_rd_stm[2]_i_1 
       (.I0(nRST),
        .I1(\fifo_rd_stm_reg_n_0_[3] ),
        .I2(\fifo_rd_stm_reg_n_0_[2] ),
        .I3(ready_i),
        .I4(\fifo_rd_stm_reg_n_0_[1] ),
        .I5(last_fifo_rd_stm[2]),
        .O(\last_fifo_rd_stm[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \last_fifo_rd_stm_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\last_fifo_rd_stm[0]_i_1_n_0 ),
        .Q(last_fifo_rd_stm[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \last_fifo_rd_stm_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\last_fifo_rd_stm[2]_i_1_n_0 ),
        .Q(last_fifo_rd_stm[2]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAAAAFEEEAAAA0222)) 
    rd_en_i_1
       (.I0(rd_en_i_2_n_0),
        .I1(rd_en_i_3_n_0),
        .I2(ready_i),
        .I3(\fifo_rd_stm[0]_i_2_n_0 ),
        .I4(rd_en_i_4_n_0),
        .I5(rd_en),
        .O(rd_en_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT5 #(
    .INIT(32'h5C000C00)) 
    rd_en_i_2
       (.I0(\fifo_rd_stm[3]_i_3_n_0 ),
        .I1(\fifo_rd_stm_reg_n_0_[3] ),
        .I2(\fifo_rd_stm_reg_n_0_[1] ),
        .I3(ready_i),
        .I4(\fifo_rd_stm_reg_n_0_[2] ),
        .O(rd_en_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFF020FFFFF)) 
    rd_en_i_3
       (.I0(ready_i),
        .I1(PSBUSY_i),
        .I2(\fifo_rd_stm_reg_n_0_[1] ),
        .I3(\fifo_rd_stm_reg_n_0_[0] ),
        .I4(\fifo_rd_stm_reg_n_0_[2] ),
        .I5(\fifo_rd_stm_reg_n_0_[3] ),
        .O(rd_en_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT4 #(
    .INIT(16'h0061)) 
    rd_en_i_4
       (.I0(\fifo_rd_stm_reg_n_0_[1] ),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\fifo_rd_stm_reg_n_0_[3] ),
        .I3(\fifo_rd_stm_reg_n_0_[2] ),
        .O(rd_en_i_4_n_0));
  FDCE rd_en_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(rd_en_i_1_n_0),
        .Q(rd_en));
  FDRE #(
    .INIT(1'b1)) 
    \rdy_state_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(ready_i),
        .Q(rdy_state[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \rdy_state_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(rdy_state[0]),
        .Q(rdy_state[1]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00004000)) 
    \wr_data[0][11]_i_1 
       (.I0(fifo_wr_stm[2]),
        .I1(nRST),
        .I2(PRECvalid),
        .I3(fifo_wr_stm[0]),
        .I4(fifo_wr_stm[1]),
        .O(\wr_data_reg[15]0 ));
  FDRE \wr_data_reg[0][0] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH0[0]),
        .Q(\wr_data_reg_n_0_[0][0] ),
        .R(1'b0));
  FDRE \wr_data_reg[0][10] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH0[10]),
        .Q(\wr_data_reg_n_0_[0][10] ),
        .R(1'b0));
  FDRE \wr_data_reg[0][11] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH0[11]),
        .Q(\wr_data_reg_n_0_[0][11] ),
        .R(1'b0));
  FDRE \wr_data_reg[0][1] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH0[1]),
        .Q(\wr_data_reg_n_0_[0][1] ),
        .R(1'b0));
  FDRE \wr_data_reg[0][2] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH0[2]),
        .Q(\wr_data_reg_n_0_[0][2] ),
        .R(1'b0));
  FDRE \wr_data_reg[0][3] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH0[3]),
        .Q(\wr_data_reg_n_0_[0][3] ),
        .R(1'b0));
  FDRE \wr_data_reg[0][4] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH0[4]),
        .Q(\wr_data_reg_n_0_[0][4] ),
        .R(1'b0));
  FDRE \wr_data_reg[0][5] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH0[5]),
        .Q(\wr_data_reg_n_0_[0][5] ),
        .R(1'b0));
  FDRE \wr_data_reg[0][6] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH0[6]),
        .Q(\wr_data_reg_n_0_[0][6] ),
        .R(1'b0));
  FDRE \wr_data_reg[0][7] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH0[7]),
        .Q(\wr_data_reg_n_0_[0][7] ),
        .R(1'b0));
  FDRE \wr_data_reg[0][8] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH0[8]),
        .Q(\wr_data_reg_n_0_[0][8] ),
        .R(1'b0));
  FDRE \wr_data_reg[0][9] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH0[9]),
        .Q(\wr_data_reg_n_0_[0][9] ),
        .R(1'b0));
  FDRE \wr_data_reg[10][0] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH10[0]),
        .Q(\wr_data_reg_n_0_[10][0] ),
        .R(1'b0));
  FDRE \wr_data_reg[10][10] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH10[10]),
        .Q(\wr_data_reg_n_0_[10][10] ),
        .R(1'b0));
  FDRE \wr_data_reg[10][11] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH10[11]),
        .Q(\wr_data_reg_n_0_[10][11] ),
        .R(1'b0));
  FDRE \wr_data_reg[10][1] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH10[1]),
        .Q(\wr_data_reg_n_0_[10][1] ),
        .R(1'b0));
  FDRE \wr_data_reg[10][2] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH10[2]),
        .Q(\wr_data_reg_n_0_[10][2] ),
        .R(1'b0));
  FDRE \wr_data_reg[10][3] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH10[3]),
        .Q(\wr_data_reg_n_0_[10][3] ),
        .R(1'b0));
  FDRE \wr_data_reg[10][4] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH10[4]),
        .Q(\wr_data_reg_n_0_[10][4] ),
        .R(1'b0));
  FDRE \wr_data_reg[10][5] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH10[5]),
        .Q(\wr_data_reg_n_0_[10][5] ),
        .R(1'b0));
  FDRE \wr_data_reg[10][6] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH10[6]),
        .Q(\wr_data_reg_n_0_[10][6] ),
        .R(1'b0));
  FDRE \wr_data_reg[10][7] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH10[7]),
        .Q(\wr_data_reg_n_0_[10][7] ),
        .R(1'b0));
  FDRE \wr_data_reg[10][8] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH10[8]),
        .Q(\wr_data_reg_n_0_[10][8] ),
        .R(1'b0));
  FDRE \wr_data_reg[10][9] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH10[9]),
        .Q(\wr_data_reg_n_0_[10][9] ),
        .R(1'b0));
  FDRE \wr_data_reg[11][0] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH11[0]),
        .Q(\wr_data_reg_n_0_[11][0] ),
        .R(1'b0));
  FDRE \wr_data_reg[11][10] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH11[10]),
        .Q(\wr_data_reg_n_0_[11][10] ),
        .R(1'b0));
  FDRE \wr_data_reg[11][11] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH11[11]),
        .Q(\wr_data_reg_n_0_[11][11] ),
        .R(1'b0));
  FDRE \wr_data_reg[11][1] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH11[1]),
        .Q(\wr_data_reg_n_0_[11][1] ),
        .R(1'b0));
  FDRE \wr_data_reg[11][2] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH11[2]),
        .Q(\wr_data_reg_n_0_[11][2] ),
        .R(1'b0));
  FDRE \wr_data_reg[11][3] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH11[3]),
        .Q(\wr_data_reg_n_0_[11][3] ),
        .R(1'b0));
  FDRE \wr_data_reg[11][4] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH11[4]),
        .Q(\wr_data_reg_n_0_[11][4] ),
        .R(1'b0));
  FDRE \wr_data_reg[11][5] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH11[5]),
        .Q(\wr_data_reg_n_0_[11][5] ),
        .R(1'b0));
  FDRE \wr_data_reg[11][6] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH11[6]),
        .Q(\wr_data_reg_n_0_[11][6] ),
        .R(1'b0));
  FDRE \wr_data_reg[11][7] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH11[7]),
        .Q(\wr_data_reg_n_0_[11][7] ),
        .R(1'b0));
  FDRE \wr_data_reg[11][8] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH11[8]),
        .Q(\wr_data_reg_n_0_[11][8] ),
        .R(1'b0));
  FDRE \wr_data_reg[11][9] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH11[9]),
        .Q(\wr_data_reg_n_0_[11][9] ),
        .R(1'b0));
  FDRE \wr_data_reg[12][0] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH12[0]),
        .Q(\wr_data_reg_n_0_[12][0] ),
        .R(1'b0));
  FDRE \wr_data_reg[12][10] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH12[10]),
        .Q(\wr_data_reg_n_0_[12][10] ),
        .R(1'b0));
  FDRE \wr_data_reg[12][11] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH12[11]),
        .Q(\wr_data_reg_n_0_[12][11] ),
        .R(1'b0));
  FDRE \wr_data_reg[12][1] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH12[1]),
        .Q(\wr_data_reg_n_0_[12][1] ),
        .R(1'b0));
  FDRE \wr_data_reg[12][2] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH12[2]),
        .Q(\wr_data_reg_n_0_[12][2] ),
        .R(1'b0));
  FDRE \wr_data_reg[12][3] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH12[3]),
        .Q(\wr_data_reg_n_0_[12][3] ),
        .R(1'b0));
  FDRE \wr_data_reg[12][4] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH12[4]),
        .Q(\wr_data_reg_n_0_[12][4] ),
        .R(1'b0));
  FDRE \wr_data_reg[12][5] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH12[5]),
        .Q(\wr_data_reg_n_0_[12][5] ),
        .R(1'b0));
  FDRE \wr_data_reg[12][6] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH12[6]),
        .Q(\wr_data_reg_n_0_[12][6] ),
        .R(1'b0));
  FDRE \wr_data_reg[12][7] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH12[7]),
        .Q(\wr_data_reg_n_0_[12][7] ),
        .R(1'b0));
  FDRE \wr_data_reg[12][8] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH12[8]),
        .Q(\wr_data_reg_n_0_[12][8] ),
        .R(1'b0));
  FDRE \wr_data_reg[12][9] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH12[9]),
        .Q(\wr_data_reg_n_0_[12][9] ),
        .R(1'b0));
  FDRE \wr_data_reg[13][0] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH13[0]),
        .Q(\wr_data_reg_n_0_[13][0] ),
        .R(1'b0));
  FDRE \wr_data_reg[13][10] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH13[10]),
        .Q(\wr_data_reg_n_0_[13][10] ),
        .R(1'b0));
  FDRE \wr_data_reg[13][11] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH13[11]),
        .Q(\wr_data_reg_n_0_[13][11] ),
        .R(1'b0));
  FDRE \wr_data_reg[13][1] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH13[1]),
        .Q(\wr_data_reg_n_0_[13][1] ),
        .R(1'b0));
  FDRE \wr_data_reg[13][2] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH13[2]),
        .Q(\wr_data_reg_n_0_[13][2] ),
        .R(1'b0));
  FDRE \wr_data_reg[13][3] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH13[3]),
        .Q(\wr_data_reg_n_0_[13][3] ),
        .R(1'b0));
  FDRE \wr_data_reg[13][4] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH13[4]),
        .Q(\wr_data_reg_n_0_[13][4] ),
        .R(1'b0));
  FDRE \wr_data_reg[13][5] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH13[5]),
        .Q(\wr_data_reg_n_0_[13][5] ),
        .R(1'b0));
  FDRE \wr_data_reg[13][6] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH13[6]),
        .Q(\wr_data_reg_n_0_[13][6] ),
        .R(1'b0));
  FDRE \wr_data_reg[13][7] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH13[7]),
        .Q(\wr_data_reg_n_0_[13][7] ),
        .R(1'b0));
  FDRE \wr_data_reg[13][8] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH13[8]),
        .Q(\wr_data_reg_n_0_[13][8] ),
        .R(1'b0));
  FDRE \wr_data_reg[13][9] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH13[9]),
        .Q(\wr_data_reg_n_0_[13][9] ),
        .R(1'b0));
  FDRE \wr_data_reg[14][0] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH14[0]),
        .Q(\wr_data_reg_n_0_[14][0] ),
        .R(1'b0));
  FDRE \wr_data_reg[14][10] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH14[10]),
        .Q(\wr_data_reg_n_0_[14][10] ),
        .R(1'b0));
  FDRE \wr_data_reg[14][11] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH14[11]),
        .Q(\wr_data_reg_n_0_[14][11] ),
        .R(1'b0));
  FDRE \wr_data_reg[14][1] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH14[1]),
        .Q(\wr_data_reg_n_0_[14][1] ),
        .R(1'b0));
  FDRE \wr_data_reg[14][2] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH14[2]),
        .Q(\wr_data_reg_n_0_[14][2] ),
        .R(1'b0));
  FDRE \wr_data_reg[14][3] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH14[3]),
        .Q(\wr_data_reg_n_0_[14][3] ),
        .R(1'b0));
  FDRE \wr_data_reg[14][4] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH14[4]),
        .Q(\wr_data_reg_n_0_[14][4] ),
        .R(1'b0));
  FDRE \wr_data_reg[14][5] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH14[5]),
        .Q(\wr_data_reg_n_0_[14][5] ),
        .R(1'b0));
  FDRE \wr_data_reg[14][6] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH14[6]),
        .Q(\wr_data_reg_n_0_[14][6] ),
        .R(1'b0));
  FDRE \wr_data_reg[14][7] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH14[7]),
        .Q(\wr_data_reg_n_0_[14][7] ),
        .R(1'b0));
  FDRE \wr_data_reg[14][8] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH14[8]),
        .Q(\wr_data_reg_n_0_[14][8] ),
        .R(1'b0));
  FDRE \wr_data_reg[14][9] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH14[9]),
        .Q(\wr_data_reg_n_0_[14][9] ),
        .R(1'b0));
  FDRE \wr_data_reg[15][0] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH15[0]),
        .Q(\wr_data_reg_n_0_[15][0] ),
        .R(1'b0));
  FDRE \wr_data_reg[15][10] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH15[10]),
        .Q(\wr_data_reg_n_0_[15][10] ),
        .R(1'b0));
  FDRE \wr_data_reg[15][11] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH15[11]),
        .Q(\wr_data_reg_n_0_[15][11] ),
        .R(1'b0));
  FDRE \wr_data_reg[15][1] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH15[1]),
        .Q(\wr_data_reg_n_0_[15][1] ),
        .R(1'b0));
  FDRE \wr_data_reg[15][2] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH15[2]),
        .Q(\wr_data_reg_n_0_[15][2] ),
        .R(1'b0));
  FDRE \wr_data_reg[15][3] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH15[3]),
        .Q(\wr_data_reg_n_0_[15][3] ),
        .R(1'b0));
  FDRE \wr_data_reg[15][4] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH15[4]),
        .Q(\wr_data_reg_n_0_[15][4] ),
        .R(1'b0));
  FDRE \wr_data_reg[15][5] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH15[5]),
        .Q(\wr_data_reg_n_0_[15][5] ),
        .R(1'b0));
  FDRE \wr_data_reg[15][6] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH15[6]),
        .Q(\wr_data_reg_n_0_[15][6] ),
        .R(1'b0));
  FDRE \wr_data_reg[15][7] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH15[7]),
        .Q(\wr_data_reg_n_0_[15][7] ),
        .R(1'b0));
  FDRE \wr_data_reg[15][8] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH15[8]),
        .Q(\wr_data_reg_n_0_[15][8] ),
        .R(1'b0));
  FDRE \wr_data_reg[15][9] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH15[9]),
        .Q(\wr_data_reg_n_0_[15][9] ),
        .R(1'b0));
  FDRE \wr_data_reg[1][0] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH1[0]),
        .Q(\wr_data_reg_n_0_[1][0] ),
        .R(1'b0));
  FDRE \wr_data_reg[1][10] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH1[10]),
        .Q(\wr_data_reg_n_0_[1][10] ),
        .R(1'b0));
  FDRE \wr_data_reg[1][11] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH1[11]),
        .Q(\wr_data_reg_n_0_[1][11] ),
        .R(1'b0));
  FDRE \wr_data_reg[1][1] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH1[1]),
        .Q(\wr_data_reg_n_0_[1][1] ),
        .R(1'b0));
  FDRE \wr_data_reg[1][2] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH1[2]),
        .Q(\wr_data_reg_n_0_[1][2] ),
        .R(1'b0));
  FDRE \wr_data_reg[1][3] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH1[3]),
        .Q(\wr_data_reg_n_0_[1][3] ),
        .R(1'b0));
  FDRE \wr_data_reg[1][4] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH1[4]),
        .Q(\wr_data_reg_n_0_[1][4] ),
        .R(1'b0));
  FDRE \wr_data_reg[1][5] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH1[5]),
        .Q(\wr_data_reg_n_0_[1][5] ),
        .R(1'b0));
  FDRE \wr_data_reg[1][6] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH1[6]),
        .Q(\wr_data_reg_n_0_[1][6] ),
        .R(1'b0));
  FDRE \wr_data_reg[1][7] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH1[7]),
        .Q(\wr_data_reg_n_0_[1][7] ),
        .R(1'b0));
  FDRE \wr_data_reg[1][8] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH1[8]),
        .Q(\wr_data_reg_n_0_[1][8] ),
        .R(1'b0));
  FDRE \wr_data_reg[1][9] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH1[9]),
        .Q(\wr_data_reg_n_0_[1][9] ),
        .R(1'b0));
  FDRE \wr_data_reg[2][0] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH2[0]),
        .Q(\wr_data_reg_n_0_[2][0] ),
        .R(1'b0));
  FDRE \wr_data_reg[2][10] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH2[10]),
        .Q(\wr_data_reg_n_0_[2][10] ),
        .R(1'b0));
  FDRE \wr_data_reg[2][11] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH2[11]),
        .Q(\wr_data_reg_n_0_[2][11] ),
        .R(1'b0));
  FDRE \wr_data_reg[2][1] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH2[1]),
        .Q(\wr_data_reg_n_0_[2][1] ),
        .R(1'b0));
  FDRE \wr_data_reg[2][2] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH2[2]),
        .Q(\wr_data_reg_n_0_[2][2] ),
        .R(1'b0));
  FDRE \wr_data_reg[2][3] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH2[3]),
        .Q(\wr_data_reg_n_0_[2][3] ),
        .R(1'b0));
  FDRE \wr_data_reg[2][4] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH2[4]),
        .Q(\wr_data_reg_n_0_[2][4] ),
        .R(1'b0));
  FDRE \wr_data_reg[2][5] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH2[5]),
        .Q(\wr_data_reg_n_0_[2][5] ),
        .R(1'b0));
  FDRE \wr_data_reg[2][6] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH2[6]),
        .Q(\wr_data_reg_n_0_[2][6] ),
        .R(1'b0));
  FDRE \wr_data_reg[2][7] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH2[7]),
        .Q(\wr_data_reg_n_0_[2][7] ),
        .R(1'b0));
  FDRE \wr_data_reg[2][8] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH2[8]),
        .Q(\wr_data_reg_n_0_[2][8] ),
        .R(1'b0));
  FDRE \wr_data_reg[2][9] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH2[9]),
        .Q(\wr_data_reg_n_0_[2][9] ),
        .R(1'b0));
  FDRE \wr_data_reg[3][0] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH3[0]),
        .Q(\wr_data_reg_n_0_[3][0] ),
        .R(1'b0));
  FDRE \wr_data_reg[3][10] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH3[10]),
        .Q(\wr_data_reg_n_0_[3][10] ),
        .R(1'b0));
  FDRE \wr_data_reg[3][11] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH3[11]),
        .Q(\wr_data_reg_n_0_[3][11] ),
        .R(1'b0));
  FDRE \wr_data_reg[3][1] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH3[1]),
        .Q(\wr_data_reg_n_0_[3][1] ),
        .R(1'b0));
  FDRE \wr_data_reg[3][2] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH3[2]),
        .Q(\wr_data_reg_n_0_[3][2] ),
        .R(1'b0));
  FDRE \wr_data_reg[3][3] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH3[3]),
        .Q(\wr_data_reg_n_0_[3][3] ),
        .R(1'b0));
  FDRE \wr_data_reg[3][4] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH3[4]),
        .Q(\wr_data_reg_n_0_[3][4] ),
        .R(1'b0));
  FDRE \wr_data_reg[3][5] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH3[5]),
        .Q(\wr_data_reg_n_0_[3][5] ),
        .R(1'b0));
  FDRE \wr_data_reg[3][6] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH3[6]),
        .Q(\wr_data_reg_n_0_[3][6] ),
        .R(1'b0));
  FDRE \wr_data_reg[3][7] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH3[7]),
        .Q(\wr_data_reg_n_0_[3][7] ),
        .R(1'b0));
  FDRE \wr_data_reg[3][8] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH3[8]),
        .Q(\wr_data_reg_n_0_[3][8] ),
        .R(1'b0));
  FDRE \wr_data_reg[3][9] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH3[9]),
        .Q(\wr_data_reg_n_0_[3][9] ),
        .R(1'b0));
  FDRE \wr_data_reg[4][0] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH4[0]),
        .Q(\wr_data_reg_n_0_[4][0] ),
        .R(1'b0));
  FDRE \wr_data_reg[4][10] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH4[10]),
        .Q(\wr_data_reg_n_0_[4][10] ),
        .R(1'b0));
  FDRE \wr_data_reg[4][11] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH4[11]),
        .Q(\wr_data_reg_n_0_[4][11] ),
        .R(1'b0));
  FDRE \wr_data_reg[4][1] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH4[1]),
        .Q(\wr_data_reg_n_0_[4][1] ),
        .R(1'b0));
  FDRE \wr_data_reg[4][2] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH4[2]),
        .Q(\wr_data_reg_n_0_[4][2] ),
        .R(1'b0));
  FDRE \wr_data_reg[4][3] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH4[3]),
        .Q(\wr_data_reg_n_0_[4][3] ),
        .R(1'b0));
  FDRE \wr_data_reg[4][4] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH4[4]),
        .Q(\wr_data_reg_n_0_[4][4] ),
        .R(1'b0));
  FDRE \wr_data_reg[4][5] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH4[5]),
        .Q(\wr_data_reg_n_0_[4][5] ),
        .R(1'b0));
  FDRE \wr_data_reg[4][6] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH4[6]),
        .Q(\wr_data_reg_n_0_[4][6] ),
        .R(1'b0));
  FDRE \wr_data_reg[4][7] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH4[7]),
        .Q(\wr_data_reg_n_0_[4][7] ),
        .R(1'b0));
  FDRE \wr_data_reg[4][8] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH4[8]),
        .Q(\wr_data_reg_n_0_[4][8] ),
        .R(1'b0));
  FDRE \wr_data_reg[4][9] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH4[9]),
        .Q(\wr_data_reg_n_0_[4][9] ),
        .R(1'b0));
  FDRE \wr_data_reg[5][0] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH5[0]),
        .Q(\wr_data_reg_n_0_[5][0] ),
        .R(1'b0));
  FDRE \wr_data_reg[5][10] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH5[10]),
        .Q(\wr_data_reg_n_0_[5][10] ),
        .R(1'b0));
  FDRE \wr_data_reg[5][11] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH5[11]),
        .Q(\wr_data_reg_n_0_[5][11] ),
        .R(1'b0));
  FDRE \wr_data_reg[5][1] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH5[1]),
        .Q(\wr_data_reg_n_0_[5][1] ),
        .R(1'b0));
  FDRE \wr_data_reg[5][2] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH5[2]),
        .Q(\wr_data_reg_n_0_[5][2] ),
        .R(1'b0));
  FDRE \wr_data_reg[5][3] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH5[3]),
        .Q(\wr_data_reg_n_0_[5][3] ),
        .R(1'b0));
  FDRE \wr_data_reg[5][4] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH5[4]),
        .Q(\wr_data_reg_n_0_[5][4] ),
        .R(1'b0));
  FDRE \wr_data_reg[5][5] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH5[5]),
        .Q(\wr_data_reg_n_0_[5][5] ),
        .R(1'b0));
  FDRE \wr_data_reg[5][6] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH5[6]),
        .Q(\wr_data_reg_n_0_[5][6] ),
        .R(1'b0));
  FDRE \wr_data_reg[5][7] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH5[7]),
        .Q(\wr_data_reg_n_0_[5][7] ),
        .R(1'b0));
  FDRE \wr_data_reg[5][8] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH5[8]),
        .Q(\wr_data_reg_n_0_[5][8] ),
        .R(1'b0));
  FDRE \wr_data_reg[5][9] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH5[9]),
        .Q(\wr_data_reg_n_0_[5][9] ),
        .R(1'b0));
  FDRE \wr_data_reg[6][0] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH6[0]),
        .Q(\wr_data_reg_n_0_[6][0] ),
        .R(1'b0));
  FDRE \wr_data_reg[6][10] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH6[10]),
        .Q(\wr_data_reg_n_0_[6][10] ),
        .R(1'b0));
  FDRE \wr_data_reg[6][11] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH6[11]),
        .Q(\wr_data_reg_n_0_[6][11] ),
        .R(1'b0));
  FDRE \wr_data_reg[6][1] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH6[1]),
        .Q(\wr_data_reg_n_0_[6][1] ),
        .R(1'b0));
  FDRE \wr_data_reg[6][2] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH6[2]),
        .Q(\wr_data_reg_n_0_[6][2] ),
        .R(1'b0));
  FDRE \wr_data_reg[6][3] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH6[3]),
        .Q(\wr_data_reg_n_0_[6][3] ),
        .R(1'b0));
  FDRE \wr_data_reg[6][4] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH6[4]),
        .Q(\wr_data_reg_n_0_[6][4] ),
        .R(1'b0));
  FDRE \wr_data_reg[6][5] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH6[5]),
        .Q(\wr_data_reg_n_0_[6][5] ),
        .R(1'b0));
  FDRE \wr_data_reg[6][6] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH6[6]),
        .Q(\wr_data_reg_n_0_[6][6] ),
        .R(1'b0));
  FDRE \wr_data_reg[6][7] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH6[7]),
        .Q(\wr_data_reg_n_0_[6][7] ),
        .R(1'b0));
  FDRE \wr_data_reg[6][8] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH6[8]),
        .Q(\wr_data_reg_n_0_[6][8] ),
        .R(1'b0));
  FDRE \wr_data_reg[6][9] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH6[9]),
        .Q(\wr_data_reg_n_0_[6][9] ),
        .R(1'b0));
  FDRE \wr_data_reg[7][0] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH7[0]),
        .Q(\wr_data_reg_n_0_[7][0] ),
        .R(1'b0));
  FDRE \wr_data_reg[7][10] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH7[10]),
        .Q(\wr_data_reg_n_0_[7][10] ),
        .R(1'b0));
  FDRE \wr_data_reg[7][11] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH7[11]),
        .Q(\wr_data_reg_n_0_[7][11] ),
        .R(1'b0));
  FDRE \wr_data_reg[7][1] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH7[1]),
        .Q(\wr_data_reg_n_0_[7][1] ),
        .R(1'b0));
  FDRE \wr_data_reg[7][2] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH7[2]),
        .Q(\wr_data_reg_n_0_[7][2] ),
        .R(1'b0));
  FDRE \wr_data_reg[7][3] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH7[3]),
        .Q(\wr_data_reg_n_0_[7][3] ),
        .R(1'b0));
  FDRE \wr_data_reg[7][4] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH7[4]),
        .Q(\wr_data_reg_n_0_[7][4] ),
        .R(1'b0));
  FDRE \wr_data_reg[7][5] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH7[5]),
        .Q(\wr_data_reg_n_0_[7][5] ),
        .R(1'b0));
  FDRE \wr_data_reg[7][6] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH7[6]),
        .Q(\wr_data_reg_n_0_[7][6] ),
        .R(1'b0));
  FDRE \wr_data_reg[7][7] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH7[7]),
        .Q(\wr_data_reg_n_0_[7][7] ),
        .R(1'b0));
  FDRE \wr_data_reg[7][8] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH7[8]),
        .Q(\wr_data_reg_n_0_[7][8] ),
        .R(1'b0));
  FDRE \wr_data_reg[7][9] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH7[9]),
        .Q(\wr_data_reg_n_0_[7][9] ),
        .R(1'b0));
  FDRE \wr_data_reg[8][0] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH8[0]),
        .Q(\wr_data_reg_n_0_[8][0] ),
        .R(1'b0));
  FDRE \wr_data_reg[8][10] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH8[10]),
        .Q(\wr_data_reg_n_0_[8][10] ),
        .R(1'b0));
  FDRE \wr_data_reg[8][11] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH8[11]),
        .Q(\wr_data_reg_n_0_[8][11] ),
        .R(1'b0));
  FDRE \wr_data_reg[8][1] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH8[1]),
        .Q(\wr_data_reg_n_0_[8][1] ),
        .R(1'b0));
  FDRE \wr_data_reg[8][2] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH8[2]),
        .Q(\wr_data_reg_n_0_[8][2] ),
        .R(1'b0));
  FDRE \wr_data_reg[8][3] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH8[3]),
        .Q(\wr_data_reg_n_0_[8][3] ),
        .R(1'b0));
  FDRE \wr_data_reg[8][4] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH8[4]),
        .Q(\wr_data_reg_n_0_[8][4] ),
        .R(1'b0));
  FDRE \wr_data_reg[8][5] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH8[5]),
        .Q(\wr_data_reg_n_0_[8][5] ),
        .R(1'b0));
  FDRE \wr_data_reg[8][6] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH8[6]),
        .Q(\wr_data_reg_n_0_[8][6] ),
        .R(1'b0));
  FDRE \wr_data_reg[8][7] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH8[7]),
        .Q(\wr_data_reg_n_0_[8][7] ),
        .R(1'b0));
  FDRE \wr_data_reg[8][8] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH8[8]),
        .Q(\wr_data_reg_n_0_[8][8] ),
        .R(1'b0));
  FDRE \wr_data_reg[8][9] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH8[9]),
        .Q(\wr_data_reg_n_0_[8][9] ),
        .R(1'b0));
  FDRE \wr_data_reg[9][0] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH9[0]),
        .Q(\wr_data_reg_n_0_[9][0] ),
        .R(1'b0));
  FDRE \wr_data_reg[9][10] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH9[10]),
        .Q(\wr_data_reg_n_0_[9][10] ),
        .R(1'b0));
  FDRE \wr_data_reg[9][11] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH9[11]),
        .Q(\wr_data_reg_n_0_[9][11] ),
        .R(1'b0));
  FDRE \wr_data_reg[9][1] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH9[1]),
        .Q(\wr_data_reg_n_0_[9][1] ),
        .R(1'b0));
  FDRE \wr_data_reg[9][2] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH9[2]),
        .Q(\wr_data_reg_n_0_[9][2] ),
        .R(1'b0));
  FDRE \wr_data_reg[9][3] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH9[3]),
        .Q(\wr_data_reg_n_0_[9][3] ),
        .R(1'b0));
  FDRE \wr_data_reg[9][4] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH9[4]),
        .Q(\wr_data_reg_n_0_[9][4] ),
        .R(1'b0));
  FDRE \wr_data_reg[9][5] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH9[5]),
        .Q(\wr_data_reg_n_0_[9][5] ),
        .R(1'b0));
  FDRE \wr_data_reg[9][6] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH9[6]),
        .Q(\wr_data_reg_n_0_[9][6] ),
        .R(1'b0));
  FDRE \wr_data_reg[9][7] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH9[7]),
        .Q(\wr_data_reg_n_0_[9][7] ),
        .R(1'b0));
  FDRE \wr_data_reg[9][8] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH9[8]),
        .Q(\wr_data_reg_n_0_[9][8] ),
        .R(1'b0));
  FDRE \wr_data_reg[9][9] 
       (.C(CLK),
        .CE(\wr_data_reg[15]0 ),
        .D(CH9[9]),
        .Q(\wr_data_reg_n_0_[9][9] ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hBFFB0040)) 
    wr_en_i_1
       (.I0(fifo_wr_stm[1]),
        .I1(nRST),
        .I2(fifo_wr_stm[2]),
        .I3(fifo_wr_stm[0]),
        .I4(wr_en_reg_n_0),
        .O(wr_en_i_1_n_0));
  FDRE wr_en_reg
       (.C(CLK),
        .CE(1'b1),
        .D(wr_en_i_1_n_0),
        .Q(wr_en_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "module_fifo_regs_no_flags" *) 
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags
   (AR,
    \r_FIFO_COUNT_reg[4]_0 ,
    \r_WR_INDEX_reg[0]_0 ,
    \FSM_sequential_fifo_wr_stm_reg[0] ,
    \FSM_sequential_fifo_wr_stm_reg[0]_0 ,
    o_rd_data,
    CLK,
    address,
    rd_en,
    wr_en_reg,
    \r_FIFO_COUNT_reg[3]_0 ,
    \r_FIFO_COUNT_reg[6]_0 ,
    nRST,
    p_0_in,
    Q);
  output [0:0]AR;
  output \r_FIFO_COUNT_reg[4]_0 ;
  output \r_WR_INDEX_reg[0]_0 ;
  output \FSM_sequential_fifo_wr_stm_reg[0] ;
  output \FSM_sequential_fifo_wr_stm_reg[0]_0 ;
  output [11:0]o_rd_data;
  input CLK;
  input [3:0]address;
  input rd_en;
  input wr_en_reg;
  input \r_FIFO_COUNT_reg[3]_0 ;
  input \r_FIFO_COUNT_reg[6]_0 ;
  input nRST;
  input p_0_in;
  input [11:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire \FSM_sequential_fifo_wr_stm[1]_i_14_n_0 ;
  wire \FSM_sequential_fifo_wr_stm_reg[0] ;
  wire \FSM_sequential_fifo_wr_stm_reg[0]_0 ;
  wire [11:0]Q;
  wire [3:0]address;
  wire nRST;
  wire [11:0]o_rd_data;
  wire p_0_in;
  wire p_0_out_carry__0_i_1_n_0;
  wire p_0_out_carry__0_i_2_n_0;
  wire p_0_out_carry__0_n_3;
  wire p_0_out_carry__0_n_6;
  wire p_0_out_carry__0_n_7;
  wire p_0_out_carry_i_1_n_0;
  wire p_0_out_carry_i_2_n_0;
  wire p_0_out_carry_i_3_n_0;
  wire p_0_out_carry_i_4_n_0;
  wire p_0_out_carry_i_5__2_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__2_n_0 ;
  wire \r_FIFO_COUNT_reg[3]_0 ;
  wire \r_FIFO_COUNT_reg[4]_0 ;
  wire \r_FIFO_COUNT_reg[6]_0 ;
  wire [6:0]r_FIFO_COUNT_reg__0;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1_n_0 ;
  wire \r_RD_INDEX[1]_i_1_n_0 ;
  wire \r_RD_INDEX[2]_i_1_n_0 ;
  wire \r_RD_INDEX[3]_i_2_n_0 ;
  wire \r_RD_INDEX[3]_i_3_n_0 ;
  wire \r_RD_INDEX[3]_i_4_n_0 ;
  wire \r_RD_INDEX[4]_i_1_n_0 ;
  wire [4:0]r_WR_INDEX;
  wire \r_WR_INDEX[0]_i_1_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_1__0_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire \r_WR_INDEX[4]_i_4_n_0 ;
  wire \r_WR_INDEX_reg[0]_0 ;
  wire rd_en;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT1 #(
    .INIT(2'h1)) 
    FIFOvalid_i_2
       (.I0(nRST),
        .O(AR));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \FSM_sequential_fifo_wr_stm[0]_i_10 
       (.I0(\FSM_sequential_fifo_wr_stm[1]_i_14_n_0 ),
        .I1(r_FIFO_COUNT_reg__0[5]),
        .I2(r_FIFO_COUNT_reg__0[6]),
        .I3(r_FIFO_COUNT_reg__0[0]),
        .O(\FSM_sequential_fifo_wr_stm_reg[0]_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_fifo_wr_stm[1]_i_14 
       (.I0(r_FIFO_COUNT_reg__0[2]),
        .I1(r_FIFO_COUNT_reg__0[1]),
        .I2(r_FIFO_COUNT_reg__0[4]),
        .I3(r_FIFO_COUNT_reg__0[3]),
        .O(\FSM_sequential_fifo_wr_stm[1]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000001000)) 
    \FSM_sequential_fifo_wr_stm[1]_i_7 
       (.I0(r_FIFO_COUNT_reg__0[0]),
        .I1(r_FIFO_COUNT_reg__0[6]),
        .I2(r_FIFO_COUNT_reg__0[5]),
        .I3(\FSM_sequential_fifo_wr_stm[1]_i_14_n_0 ),
        .I4(\r_FIFO_COUNT_reg[3]_0 ),
        .I5(\r_FIFO_COUNT_reg[6]_0 ),
        .O(\FSM_sequential_fifo_wr_stm_reg[0] ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg__0[0]),
        .DI({r_FIFO_COUNT_reg__0[3:1],p_0_out_carry_i_1_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2_n_0,p_0_out_carry_i_3_n_0,p_0_out_carry_i_4_n_0,p_0_out_carry_i_5__2_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry__0
       (.CI(p_0_out_carry_n_0),
        .CO({NLW_p_0_out_carry__0_CO_UNCONNECTED[3:1],p_0_out_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,r_FIFO_COUNT_reg__0[4]}),
        .O({NLW_p_0_out_carry__0_O_UNCONNECTED[3:2],p_0_out_carry__0_n_6,p_0_out_carry__0_n_7}),
        .S({1'b0,1'b0,p_0_out_carry__0_i_1_n_0,p_0_out_carry__0_i_2_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_1
       (.I0(r_FIFO_COUNT_reg__0[5]),
        .I1(r_FIFO_COUNT_reg__0[6]),
        .O(p_0_out_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_2
       (.I0(r_FIFO_COUNT_reg__0[4]),
        .I1(r_FIFO_COUNT_reg__0[5]),
        .O(p_0_out_carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    p_0_out_carry_i_1
       (.I0(r_FIFO_COUNT_reg__0[1]),
        .O(p_0_out_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_2
       (.I0(r_FIFO_COUNT_reg__0[3]),
        .I1(r_FIFO_COUNT_reg__0[4]),
        .O(p_0_out_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_3
       (.I0(r_FIFO_COUNT_reg__0[2]),
        .I1(r_FIFO_COUNT_reg__0[3]),
        .O(p_0_out_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_4
       (.I0(r_FIFO_COUNT_reg__0[1]),
        .I1(r_FIFO_COUNT_reg__0[2]),
        .O(p_0_out_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'hAAAAAA9A55555555)) 
    p_0_out_carry_i_5__2
       (.I0(r_FIFO_COUNT_reg__0[1]),
        .I1(address[3]),
        .I2(rd_en),
        .I3(\r_FIFO_COUNT_reg[4]_0 ),
        .I4(address[2]),
        .I5(wr_en_reg),
        .O(p_0_out_carry_i_5__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hE)) 
    p_0_out_carry_i_6
       (.I0(address[0]),
        .I1(address[1]),
        .O(\r_FIFO_COUNT_reg[4]_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1 
       (.I0(r_FIFO_COUNT_reg__0[0]),
        .O(\r_FIFO_COUNT[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAA9AAAA)) 
    \r_FIFO_COUNT[6]_i_1__2 
       (.I0(wr_en_reg),
        .I1(address[2]),
        .I2(address[1]),
        .I3(address[0]),
        .I4(rd_en),
        .I5(address[3]),
        .O(\r_FIFO_COUNT[6]_i_1__2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__2_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1_n_0 ),
        .Q(r_FIFO_COUNT_reg__0[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[1] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__2_n_0 ),
        .D(p_0_out_carry_n_7),
        .Q(r_FIFO_COUNT_reg__0[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[2] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__2_n_0 ),
        .D(p_0_out_carry_n_6),
        .Q(r_FIFO_COUNT_reg__0[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[3] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__2_n_0 ),
        .D(p_0_out_carry_n_5),
        .Q(r_FIFO_COUNT_reg__0[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[4] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__2_n_0 ),
        .D(p_0_out_carry_n_4),
        .Q(r_FIFO_COUNT_reg__0[4]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[5] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__2_n_0 ),
        .D(p_0_out_carry__0_n_7),
        .Q(r_FIFO_COUNT_reg__0[5]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[6] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__2_n_0 ),
        .D(p_0_out_carry__0_n_6),
        .Q(r_FIFO_COUNT_reg__0[6]),
        .R(AR));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_0_5
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[1:0]),
        .DIB(Q[3:2]),
        .DIC(Q[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[1:0]),
        .DOB(o_rd_data[3:2]),
        .DOC(o_rd_data[5:4]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_6_11
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[7:6]),
        .DIB(Q[9:8]),
        .DIC(Q[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[7:6]),
        .DOB(o_rd_data[9:8]),
        .DOC(o_rd_data[11:10]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    \r_RD_INDEX[0]_i_1 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \r_RD_INDEX[3]_i_1__2 
       (.I0(\r_RD_INDEX[3]_i_3_n_0 ),
        .I1(\r_RD_INDEX[3]_i_4_n_0 ),
        .I2(r_FIFO_COUNT_reg__0[1]),
        .I3(r_FIFO_COUNT_reg__0[0]),
        .I4(r_FIFO_COUNT_reg__0[4]),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00000004)) 
    \r_RD_INDEX[3]_i_3 
       (.I0(address[3]),
        .I1(rd_en),
        .I2(address[0]),
        .I3(address[1]),
        .I4(address[2]),
        .O(\r_RD_INDEX[3]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \r_RD_INDEX[3]_i_4 
       (.I0(r_FIFO_COUNT_reg__0[3]),
        .I1(r_FIFO_COUNT_reg__0[2]),
        .I2(r_FIFO_COUNT_reg__0[6]),
        .I3(r_FIFO_COUNT_reg__0[5]),
        .O(\r_RD_INDEX[3]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_RD_INDEX[4]_i_1 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[4]),
        .I2(r_RD_INDEX[0]),
        .I3(r_RD_INDEX[1]),
        .I4(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[0]_i_1_n_0 ),
        .Q(r_RD_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[1] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[1]_i_1_n_0 ),
        .Q(r_RD_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[2] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[2]_i_1_n_0 ),
        .Q(r_RD_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[3] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[3]_i_2_n_0 ),
        .Q(r_RD_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[4] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[4]_i_1_n_0 ),
        .Q(r_RD_INDEX[4]),
        .R(AR));
  LUT1 #(
    .INIT(2'h1)) 
    \r_WR_INDEX[0]_i_1 
       (.I0(r_WR_INDEX[0]),
        .O(\r_WR_INDEX[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \r_WR_INDEX[4]_i_1__0 
       (.I0(\r_WR_INDEX_reg[0]_0 ),
        .I1(wr_en_reg),
        .O(\r_WR_INDEX[4]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_WR_INDEX[4]_i_2 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[4]),
        .I2(r_WR_INDEX[0]),
        .I3(r_WR_INDEX[1]),
        .I4(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    \r_WR_INDEX[4]_i_3 
       (.I0(r_FIFO_COUNT_reg__0[1]),
        .I1(r_FIFO_COUNT_reg__0[5]),
        .I2(r_FIFO_COUNT_reg__0[6]),
        .I3(\r_WR_INDEX[4]_i_4_n_0 ),
        .I4(r_FIFO_COUNT_reg__0[2]),
        .I5(r_FIFO_COUNT_reg__0[3]),
        .O(\r_WR_INDEX_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \r_WR_INDEX[4]_i_4 
       (.I0(r_FIFO_COUNT_reg__0[4]),
        .I1(r_FIFO_COUNT_reg__0[0]),
        .O(\r_WR_INDEX[4]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__0_n_0 ),
        .D(\r_WR_INDEX[0]_i_1_n_0 ),
        .Q(r_WR_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[1] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__0_n_0 ),
        .D(\r_WR_INDEX[1]_i_1_n_0 ),
        .Q(r_WR_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[2] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__0_n_0 ),
        .D(\r_WR_INDEX[2]_i_1_n_0 ),
        .Q(r_WR_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[3] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__0_n_0 ),
        .D(\r_WR_INDEX[3]_i_1_n_0 ),
        .Q(r_WR_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[4] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__0_n_0 ),
        .D(\r_WR_INDEX[4]_i_2_n_0 ),
        .Q(r_WR_INDEX[4]),
        .R(AR));
endmodule

(* ORIG_REF_NAME = "module_fifo_regs_no_flags" *) 
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_0
   (\r_WR_INDEX_reg[0]_0 ,
    \FSM_sequential_fifo_wr_stm_reg[1] ,
    \FSM_sequential_fifo_wr_stm_reg[1]_0 ,
    o_rd_data,
    AR,
    CLK,
    wr_en_reg,
    address,
    rd_en,
    out,
    \FIFO_RD_reg[response] ,
    in0,
    PRECvalid,
    \r_FIFO_COUNT_reg[1]_0 ,
    \r_FIFO_COUNT_reg[1]_1 ,
    \r_FIFO_COUNT_reg[0]_0 ,
    \r_FIFO_COUNT_reg[1]_2 ,
    \r_FIFO_COUNT_reg[1]_3 ,
    \r_FIFO_COUNT_reg[6]_0 ,
    p_0_in,
    Q);
  output \r_WR_INDEX_reg[0]_0 ;
  output \FSM_sequential_fifo_wr_stm_reg[1] ;
  output \FSM_sequential_fifo_wr_stm_reg[1]_0 ;
  output [11:0]o_rd_data;
  input [0:0]AR;
  input CLK;
  input wr_en_reg;
  input [3:0]address;
  input rd_en;
  input [2:0]out;
  input \FIFO_RD_reg[response] ;
  input [0:0]in0;
  input PRECvalid;
  input \r_FIFO_COUNT_reg[1]_0 ;
  input \r_FIFO_COUNT_reg[1]_1 ;
  input \r_FIFO_COUNT_reg[0]_0 ;
  input \r_FIFO_COUNT_reg[1]_2 ;
  input \r_FIFO_COUNT_reg[1]_3 ;
  input \r_FIFO_COUNT_reg[6]_0 ;
  input p_0_in;
  input [11:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire \FIFO_RD_reg[response] ;
  wire \FSM_sequential_fifo_wr_stm[1]_i_2_n_0 ;
  wire \FSM_sequential_fifo_wr_stm_reg[1] ;
  wire \FSM_sequential_fifo_wr_stm_reg[1]_0 ;
  wire PRECvalid;
  wire [11:0]Q;
  wire [3:0]address;
  wire [0:0]in0;
  wire [11:0]o_rd_data;
  wire [2:0]out;
  wire p_0_in;
  wire p_0_out_carry__0_i_1__9_n_0;
  wire p_0_out_carry__0_i_2__9_n_0;
  wire p_0_out_carry__0_n_3;
  wire p_0_out_carry__0_n_6;
  wire p_0_out_carry__0_n_7;
  wire p_0_out_carry_i_1__9_n_0;
  wire p_0_out_carry_i_2__9_n_0;
  wire p_0_out_carry_i_3__9_n_0;
  wire p_0_out_carry_i_4__9_n_0;
  wire p_0_out_carry_i_5__12_n_0;
  wire p_0_out_carry_i_6__7_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__9_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__12_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire \r_FIFO_COUNT_reg[0]_0 ;
  wire \r_FIFO_COUNT_reg[1]_0 ;
  wire \r_FIFO_COUNT_reg[1]_1 ;
  wire \r_FIFO_COUNT_reg[1]_2 ;
  wire \r_FIFO_COUNT_reg[1]_3 ;
  wire \r_FIFO_COUNT_reg[6]_0 ;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__9_n_0 ;
  wire \r_RD_INDEX[1]_i_1__9_n_0 ;
  wire \r_RD_INDEX[2]_i_1__9_n_0 ;
  wire \r_RD_INDEX[3]_i_2__9_n_0 ;
  wire \r_RD_INDEX[3]_i_3__5_n_0 ;
  wire \r_RD_INDEX[4]_i_1__9_n_0 ;
  wire [4:0]r_WR_INDEX;
  wire \r_WR_INDEX[0]_i_1__9_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_1__9_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire \r_WR_INDEX[4]_i_4__6_n_0 ;
  wire \r_WR_INDEX_reg[0]_0 ;
  wire rd_en;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT6 #(
    .INIT(64'hAAEAAAAAAA2AAAAA)) 
    \FSM_sequential_fifo_wr_stm[1]_i_1 
       (.I0(\FSM_sequential_fifo_wr_stm[1]_i_2_n_0 ),
        .I1(out[1]),
        .I2(out[0]),
        .I3(\FIFO_RD_reg[response] ),
        .I4(out[2]),
        .I5(in0),
        .O(\FSM_sequential_fifo_wr_stm_reg[1] ));
  LUT6 #(
    .INIT(64'h055F0505E0E0E0E0)) 
    \FSM_sequential_fifo_wr_stm[1]_i_2 
       (.I0(out[2]),
        .I1(PRECvalid),
        .I2(out[0]),
        .I3(\FSM_sequential_fifo_wr_stm_reg[1]_0 ),
        .I4(\r_FIFO_COUNT_reg[1]_0 ),
        .I5(out[1]),
        .O(\FSM_sequential_fifo_wr_stm[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \FSM_sequential_fifo_wr_stm[1]_i_3 
       (.I0(\r_WR_INDEX_reg[0]_0 ),
        .I1(\r_FIFO_COUNT_reg[1]_1 ),
        .I2(\r_FIFO_COUNT_reg[0]_0 ),
        .I3(\r_FIFO_COUNT_reg[1]_2 ),
        .I4(\r_FIFO_COUNT_reg[1]_3 ),
        .I5(\r_FIFO_COUNT_reg[6]_0 ),
        .O(\FSM_sequential_fifo_wr_stm_reg[1]_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__9_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__9_n_0,p_0_out_carry_i_3__9_n_0,p_0_out_carry_i_4__9_n_0,p_0_out_carry_i_5__12_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry__0
       (.CI(p_0_out_carry_n_0),
        .CO({NLW_p_0_out_carry__0_CO_UNCONNECTED[3:1],p_0_out_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,r_FIFO_COUNT_reg[4]}),
        .O({NLW_p_0_out_carry__0_O_UNCONNECTED[3:2],p_0_out_carry__0_n_6,p_0_out_carry__0_n_7}),
        .S({1'b0,1'b0,p_0_out_carry__0_i_1__9_n_0,p_0_out_carry__0_i_2__9_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_1__9
       (.I0(r_FIFO_COUNT_reg[5]),
        .I1(r_FIFO_COUNT_reg[6]),
        .O(p_0_out_carry__0_i_1__9_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_2__9
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[5]),
        .O(p_0_out_carry__0_i_2__9_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    p_0_out_carry_i_1__9
       (.I0(r_FIFO_COUNT_reg[1]),
        .O(p_0_out_carry_i_1__9_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_2__9
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[4]),
        .O(p_0_out_carry_i_2__9_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_3__9
       (.I0(r_FIFO_COUNT_reg[2]),
        .I1(r_FIFO_COUNT_reg[3]),
        .O(p_0_out_carry_i_3__9_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_4__9
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[2]),
        .O(p_0_out_carry_i_4__9_n_0));
  LUT3 #(
    .INIT(8'h65)) 
    p_0_out_carry_i_5__12
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(p_0_out_carry_i_6__7_n_0),
        .I2(wr_en_reg),
        .O(p_0_out_carry_i_5__12_n_0));
  LUT5 #(
    .INIT(32'h00400000)) 
    p_0_out_carry_i_6__7
       (.I0(address[0]),
        .I1(address[1]),
        .I2(address[3]),
        .I3(address[2]),
        .I4(rd_en),
        .O(p_0_out_carry_i_6__7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__9 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__9_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAA6AAAAAA)) 
    \r_FIFO_COUNT[6]_i_1__12 
       (.I0(wr_en_reg),
        .I1(rd_en),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\r_FIFO_COUNT[6]_i_1__12_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__12_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__9_n_0 ),
        .Q(r_FIFO_COUNT_reg[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[1] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__12_n_0 ),
        .D(p_0_out_carry_n_7),
        .Q(r_FIFO_COUNT_reg[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[2] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__12_n_0 ),
        .D(p_0_out_carry_n_6),
        .Q(r_FIFO_COUNT_reg[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[3] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__12_n_0 ),
        .D(p_0_out_carry_n_5),
        .Q(r_FIFO_COUNT_reg[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[4] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__12_n_0 ),
        .D(p_0_out_carry_n_4),
        .Q(r_FIFO_COUNT_reg[4]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[5] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__12_n_0 ),
        .D(p_0_out_carry__0_n_7),
        .Q(r_FIFO_COUNT_reg[5]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[6] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__12_n_0 ),
        .D(p_0_out_carry__0_n_6),
        .Q(r_FIFO_COUNT_reg[6]),
        .R(AR));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_0_5
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[1:0]),
        .DIB(Q[3:2]),
        .DIC(Q[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[1:0]),
        .DOB(o_rd_data[3:2]),
        .DOC(o_rd_data[5:4]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_6_11
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[7:6]),
        .DIB(Q[9:8]),
        .DIC(Q[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[7:6]),
        .DOB(o_rd_data[9:8]),
        .DOC(o_rd_data[11:10]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    \r_RD_INDEX[0]_i_1__9 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1__9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__9 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__9 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__9_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \r_RD_INDEX[3]_i_1__12 
       (.I0(p_0_out_carry_i_6__7_n_0),
        .I1(\r_RD_INDEX[3]_i_3__5_n_0 ),
        .I2(r_FIFO_COUNT_reg[1]),
        .I3(r_FIFO_COUNT_reg[0]),
        .I4(r_FIFO_COUNT_reg[4]),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__9 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__9_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \r_RD_INDEX[3]_i_3__5 
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[2]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(r_FIFO_COUNT_reg[5]),
        .O(\r_RD_INDEX[3]_i_3__5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_RD_INDEX[4]_i_1__9 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[4]),
        .I2(r_RD_INDEX[0]),
        .I3(r_RD_INDEX[1]),
        .I4(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[4]_i_1__9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[0]_i_1__9_n_0 ),
        .Q(r_RD_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[1] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[1]_i_1__9_n_0 ),
        .Q(r_RD_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[2] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[2]_i_1__9_n_0 ),
        .Q(r_RD_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[3] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[3]_i_2__9_n_0 ),
        .Q(r_RD_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[4] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[4]_i_1__9_n_0 ),
        .Q(r_RD_INDEX[4]),
        .R(AR));
  LUT1 #(
    .INIT(2'h1)) 
    \r_WR_INDEX[0]_i_1__9 
       (.I0(r_WR_INDEX[0]),
        .O(\r_WR_INDEX[0]_i_1__9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \r_WR_INDEX[4]_i_1__9 
       (.I0(\r_WR_INDEX_reg[0]_0 ),
        .I1(wr_en_reg),
        .O(\r_WR_INDEX[4]_i_1__9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_WR_INDEX[4]_i_2 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[4]),
        .I2(r_WR_INDEX[0]),
        .I3(r_WR_INDEX[1]),
        .I4(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    \r_WR_INDEX[4]_i_3__9 
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[5]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(\r_WR_INDEX[4]_i_4__6_n_0 ),
        .I4(r_FIFO_COUNT_reg[2]),
        .I5(r_FIFO_COUNT_reg[3]),
        .O(\r_WR_INDEX_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \r_WR_INDEX[4]_i_4__6 
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[0]),
        .O(\r_WR_INDEX[4]_i_4__6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__9_n_0 ),
        .D(\r_WR_INDEX[0]_i_1__9_n_0 ),
        .Q(r_WR_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[1] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__9_n_0 ),
        .D(\r_WR_INDEX[1]_i_1_n_0 ),
        .Q(r_WR_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[2] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__9_n_0 ),
        .D(\r_WR_INDEX[2]_i_1_n_0 ),
        .Q(r_WR_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[3] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__9_n_0 ),
        .D(\r_WR_INDEX[3]_i_1_n_0 ),
        .Q(r_WR_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[4] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__9_n_0 ),
        .D(\r_WR_INDEX[4]_i_2_n_0 ),
        .Q(r_WR_INDEX[4]),
        .R(AR));
endmodule

(* ORIG_REF_NAME = "module_fifo_regs_no_flags" *) 
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_1
   (\r_WR_INDEX_reg[0]_0 ,
    \DataOut_stall_reg[11] ,
    \DataOut_stall_reg[10] ,
    \DataOut_stall_reg[9] ,
    \DataOut_stall_reg[8] ,
    \DataOut_stall_reg[7] ,
    \DataOut_stall_reg[6] ,
    \DataOut_stall_reg[5] ,
    \DataOut_stall_reg[4] ,
    \DataOut_stall_reg[3] ,
    \DataOut_stall_reg[2] ,
    \DataOut_stall_reg[1] ,
    \DataOut_stall_reg[0] ,
    AR,
    CLK,
    wr_en_reg,
    rd_en,
    address,
    \cnt_fifo_reg[6] ,
    o_rd_data,
    \wr_data_reg[9][7] ,
    \wr_data_reg[8][7] ,
    \cnt_fifo_reg[6]_0 ,
    \cnt_fifo_reg[6]_1 ,
    \cnt_fifo_reg[6]_2 ,
    \cnt_fifo_reg[6]_3 ,
    \cnt_fifo_reg[6]_4 ,
    \cnt_fifo_reg[6]_5 ,
    \cnt_fifo_reg[6]_6 ,
    \cnt_fifo_reg[6]_7 ,
    \cnt_fifo_reg[6]_8 ,
    \cnt_fifo_reg[6]_9 ,
    \cnt_fifo_reg[6]_10 ,
    p_0_in,
    Q);
  output \r_WR_INDEX_reg[0]_0 ;
  output \DataOut_stall_reg[11] ;
  output \DataOut_stall_reg[10] ;
  output \DataOut_stall_reg[9] ;
  output \DataOut_stall_reg[8] ;
  output \DataOut_stall_reg[7] ;
  output \DataOut_stall_reg[6] ;
  output \DataOut_stall_reg[5] ;
  output \DataOut_stall_reg[4] ;
  output \DataOut_stall_reg[3] ;
  output \DataOut_stall_reg[2] ;
  output \DataOut_stall_reg[1] ;
  output \DataOut_stall_reg[0] ;
  input [0:0]AR;
  input CLK;
  input wr_en_reg;
  input rd_en;
  input [3:0]address;
  input \cnt_fifo_reg[6] ;
  input [11:0]o_rd_data;
  input [11:0]\wr_data_reg[9][7] ;
  input [11:0]\wr_data_reg[8][7] ;
  input \cnt_fifo_reg[6]_0 ;
  input \cnt_fifo_reg[6]_1 ;
  input \cnt_fifo_reg[6]_2 ;
  input \cnt_fifo_reg[6]_3 ;
  input \cnt_fifo_reg[6]_4 ;
  input \cnt_fifo_reg[6]_5 ;
  input \cnt_fifo_reg[6]_6 ;
  input \cnt_fifo_reg[6]_7 ;
  input \cnt_fifo_reg[6]_8 ;
  input \cnt_fifo_reg[6]_9 ;
  input \cnt_fifo_reg[6]_10 ;
  input p_0_in;
  input [11:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire \DataOut_stall[0]_i_6_n_0 ;
  wire \DataOut_stall[10]_i_6_n_0 ;
  wire \DataOut_stall[11]_i_7_n_0 ;
  wire \DataOut_stall[1]_i_6_n_0 ;
  wire \DataOut_stall[2]_i_6_n_0 ;
  wire \DataOut_stall[3]_i_6_n_0 ;
  wire \DataOut_stall[4]_i_6_n_0 ;
  wire \DataOut_stall[5]_i_6_n_0 ;
  wire \DataOut_stall[6]_i_6_n_0 ;
  wire \DataOut_stall[7]_i_6_n_0 ;
  wire \DataOut_stall[8]_i_6_n_0 ;
  wire \DataOut_stall[9]_i_6_n_0 ;
  wire \DataOut_stall_reg[0] ;
  wire \DataOut_stall_reg[10] ;
  wire \DataOut_stall_reg[11] ;
  wire \DataOut_stall_reg[1] ;
  wire \DataOut_stall_reg[2] ;
  wire \DataOut_stall_reg[3] ;
  wire \DataOut_stall_reg[4] ;
  wire \DataOut_stall_reg[5] ;
  wire \DataOut_stall_reg[6] ;
  wire \DataOut_stall_reg[7] ;
  wire \DataOut_stall_reg[8] ;
  wire \DataOut_stall_reg[9] ;
  wire [11:0]Q;
  wire [3:0]address;
  wire \cnt_fifo_reg[6] ;
  wire \cnt_fifo_reg[6]_0 ;
  wire \cnt_fifo_reg[6]_1 ;
  wire \cnt_fifo_reg[6]_10 ;
  wire \cnt_fifo_reg[6]_2 ;
  wire \cnt_fifo_reg[6]_3 ;
  wire \cnt_fifo_reg[6]_4 ;
  wire \cnt_fifo_reg[6]_5 ;
  wire \cnt_fifo_reg[6]_6 ;
  wire \cnt_fifo_reg[6]_7 ;
  wire \cnt_fifo_reg[6]_8 ;
  wire \cnt_fifo_reg[6]_9 ;
  wire [11:0]o_rd_data;
  wire p_0_in;
  wire p_0_out_carry__0_i_1__10_n_0;
  wire p_0_out_carry__0_i_2__10_n_0;
  wire p_0_out_carry__0_n_3;
  wire p_0_out_carry__0_n_6;
  wire p_0_out_carry__0_n_7;
  wire p_0_out_carry_i_1__10_n_0;
  wire p_0_out_carry_i_2__10_n_0;
  wire p_0_out_carry_i_3__10_n_0;
  wire p_0_out_carry_i_4__10_n_0;
  wire p_0_out_carry_i_5__11_n_0;
  wire p_0_out_carry_i_6__3_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__10_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__11_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__10_n_0 ;
  wire \r_RD_INDEX[1]_i_1__10_n_0 ;
  wire \r_RD_INDEX[2]_i_1__10_n_0 ;
  wire \r_RD_INDEX[3]_i_2__10_n_0 ;
  wire \r_RD_INDEX[3]_i_3__6_n_0 ;
  wire \r_RD_INDEX[4]_i_1__10_n_0 ;
  wire [4:0]r_WR_INDEX;
  wire \r_WR_INDEX[0]_i_1__10_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_1__10_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire \r_WR_INDEX[4]_i_4__7_n_0 ;
  wire \r_WR_INDEX_reg[0]_0 ;
  wire [11:0]\rd_data12[11]_11 ;
  wire rd_en;
  wire [11:0]\wr_data_reg[8][7] ;
  wire [11:0]\wr_data_reg[9][7] ;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[0]_i_6 
       (.I0(\rd_data12[11]_11 [0]),
        .I1(o_rd_data[0]),
        .I2(address[1]),
        .I3(\wr_data_reg[9][7] [0]),
        .I4(address[0]),
        .I5(\wr_data_reg[8][7] [0]),
        .O(\DataOut_stall[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[10]_i_6 
       (.I0(\rd_data12[11]_11 [10]),
        .I1(o_rd_data[10]),
        .I2(address[1]),
        .I3(\wr_data_reg[9][7] [10]),
        .I4(address[0]),
        .I5(\wr_data_reg[8][7] [10]),
        .O(\DataOut_stall[10]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[11]_i_7 
       (.I0(\rd_data12[11]_11 [11]),
        .I1(o_rd_data[11]),
        .I2(address[1]),
        .I3(\wr_data_reg[9][7] [11]),
        .I4(address[0]),
        .I5(\wr_data_reg[8][7] [11]),
        .O(\DataOut_stall[11]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[1]_i_6 
       (.I0(\rd_data12[11]_11 [1]),
        .I1(o_rd_data[1]),
        .I2(address[1]),
        .I3(\wr_data_reg[9][7] [1]),
        .I4(address[0]),
        .I5(\wr_data_reg[8][7] [1]),
        .O(\DataOut_stall[1]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[2]_i_6 
       (.I0(\rd_data12[11]_11 [2]),
        .I1(o_rd_data[2]),
        .I2(address[1]),
        .I3(\wr_data_reg[9][7] [2]),
        .I4(address[0]),
        .I5(\wr_data_reg[8][7] [2]),
        .O(\DataOut_stall[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[3]_i_6 
       (.I0(\rd_data12[11]_11 [3]),
        .I1(o_rd_data[3]),
        .I2(address[1]),
        .I3(\wr_data_reg[9][7] [3]),
        .I4(address[0]),
        .I5(\wr_data_reg[8][7] [3]),
        .O(\DataOut_stall[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[4]_i_6 
       (.I0(\rd_data12[11]_11 [4]),
        .I1(o_rd_data[4]),
        .I2(address[1]),
        .I3(\wr_data_reg[9][7] [4]),
        .I4(address[0]),
        .I5(\wr_data_reg[8][7] [4]),
        .O(\DataOut_stall[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[5]_i_6 
       (.I0(\rd_data12[11]_11 [5]),
        .I1(o_rd_data[5]),
        .I2(address[1]),
        .I3(\wr_data_reg[9][7] [5]),
        .I4(address[0]),
        .I5(\wr_data_reg[8][7] [5]),
        .O(\DataOut_stall[5]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[6]_i_6 
       (.I0(\rd_data12[11]_11 [6]),
        .I1(o_rd_data[6]),
        .I2(address[1]),
        .I3(\wr_data_reg[9][7] [6]),
        .I4(address[0]),
        .I5(\wr_data_reg[8][7] [6]),
        .O(\DataOut_stall[6]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[7]_i_6 
       (.I0(\rd_data12[11]_11 [7]),
        .I1(o_rd_data[7]),
        .I2(address[1]),
        .I3(\wr_data_reg[9][7] [7]),
        .I4(address[0]),
        .I5(\wr_data_reg[8][7] [7]),
        .O(\DataOut_stall[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[8]_i_6 
       (.I0(\rd_data12[11]_11 [8]),
        .I1(o_rd_data[8]),
        .I2(address[1]),
        .I3(\wr_data_reg[9][7] [8]),
        .I4(address[0]),
        .I5(\wr_data_reg[8][7] [8]),
        .O(\DataOut_stall[8]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[9]_i_6 
       (.I0(\rd_data12[11]_11 [9]),
        .I1(o_rd_data[9]),
        .I2(address[1]),
        .I3(\wr_data_reg[9][7] [9]),
        .I4(address[0]),
        .I5(\wr_data_reg[8][7] [9]),
        .O(\DataOut_stall[9]_i_6_n_0 ));
  MUXF7 \DataOut_stall_reg[0]_i_3 
       (.I0(\DataOut_stall[0]_i_6_n_0 ),
        .I1(\cnt_fifo_reg[6]_10 ),
        .O(\DataOut_stall_reg[0] ),
        .S(address[2]));
  MUXF7 \DataOut_stall_reg[10]_i_3 
       (.I0(\DataOut_stall[10]_i_6_n_0 ),
        .I1(\cnt_fifo_reg[6]_0 ),
        .O(\DataOut_stall_reg[10] ),
        .S(address[2]));
  MUXF7 \DataOut_stall_reg[11]_i_4 
       (.I0(\DataOut_stall[11]_i_7_n_0 ),
        .I1(\cnt_fifo_reg[6] ),
        .O(\DataOut_stall_reg[11] ),
        .S(address[2]));
  MUXF7 \DataOut_stall_reg[1]_i_3 
       (.I0(\DataOut_stall[1]_i_6_n_0 ),
        .I1(\cnt_fifo_reg[6]_9 ),
        .O(\DataOut_stall_reg[1] ),
        .S(address[2]));
  MUXF7 \DataOut_stall_reg[2]_i_3 
       (.I0(\DataOut_stall[2]_i_6_n_0 ),
        .I1(\cnt_fifo_reg[6]_8 ),
        .O(\DataOut_stall_reg[2] ),
        .S(address[2]));
  MUXF7 \DataOut_stall_reg[3]_i_3 
       (.I0(\DataOut_stall[3]_i_6_n_0 ),
        .I1(\cnt_fifo_reg[6]_7 ),
        .O(\DataOut_stall_reg[3] ),
        .S(address[2]));
  MUXF7 \DataOut_stall_reg[4]_i_3 
       (.I0(\DataOut_stall[4]_i_6_n_0 ),
        .I1(\cnt_fifo_reg[6]_6 ),
        .O(\DataOut_stall_reg[4] ),
        .S(address[2]));
  MUXF7 \DataOut_stall_reg[5]_i_3 
       (.I0(\DataOut_stall[5]_i_6_n_0 ),
        .I1(\cnt_fifo_reg[6]_5 ),
        .O(\DataOut_stall_reg[5] ),
        .S(address[2]));
  MUXF7 \DataOut_stall_reg[6]_i_3 
       (.I0(\DataOut_stall[6]_i_6_n_0 ),
        .I1(\cnt_fifo_reg[6]_4 ),
        .O(\DataOut_stall_reg[6] ),
        .S(address[2]));
  MUXF7 \DataOut_stall_reg[7]_i_3 
       (.I0(\DataOut_stall[7]_i_6_n_0 ),
        .I1(\cnt_fifo_reg[6]_3 ),
        .O(\DataOut_stall_reg[7] ),
        .S(address[2]));
  MUXF7 \DataOut_stall_reg[8]_i_3 
       (.I0(\DataOut_stall[8]_i_6_n_0 ),
        .I1(\cnt_fifo_reg[6]_2 ),
        .O(\DataOut_stall_reg[8] ),
        .S(address[2]));
  MUXF7 \DataOut_stall_reg[9]_i_3 
       (.I0(\DataOut_stall[9]_i_6_n_0 ),
        .I1(\cnt_fifo_reg[6]_1 ),
        .O(\DataOut_stall_reg[9] ),
        .S(address[2]));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__10_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__10_n_0,p_0_out_carry_i_3__10_n_0,p_0_out_carry_i_4__10_n_0,p_0_out_carry_i_5__11_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry__0
       (.CI(p_0_out_carry_n_0),
        .CO({NLW_p_0_out_carry__0_CO_UNCONNECTED[3:1],p_0_out_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,r_FIFO_COUNT_reg[4]}),
        .O({NLW_p_0_out_carry__0_O_UNCONNECTED[3:2],p_0_out_carry__0_n_6,p_0_out_carry__0_n_7}),
        .S({1'b0,1'b0,p_0_out_carry__0_i_1__10_n_0,p_0_out_carry__0_i_2__10_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_1__10
       (.I0(r_FIFO_COUNT_reg[5]),
        .I1(r_FIFO_COUNT_reg[6]),
        .O(p_0_out_carry__0_i_1__10_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_2__10
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[5]),
        .O(p_0_out_carry__0_i_2__10_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    p_0_out_carry_i_1__10
       (.I0(r_FIFO_COUNT_reg[1]),
        .O(p_0_out_carry_i_1__10_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_2__10
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[4]),
        .O(p_0_out_carry_i_2__10_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_3__10
       (.I0(r_FIFO_COUNT_reg[2]),
        .I1(r_FIFO_COUNT_reg[3]),
        .O(p_0_out_carry_i_3__10_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_4__10
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[2]),
        .O(p_0_out_carry_i_4__10_n_0));
  LUT3 #(
    .INIT(8'h65)) 
    p_0_out_carry_i_5__11
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(p_0_out_carry_i_6__3_n_0),
        .I2(wr_en_reg),
        .O(p_0_out_carry_i_5__11_n_0));
  LUT5 #(
    .INIT(32'h00800000)) 
    p_0_out_carry_i_6__3
       (.I0(address[0]),
        .I1(address[1]),
        .I2(address[3]),
        .I3(address[2]),
        .I4(rd_en),
        .O(p_0_out_carry_i_6__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__10 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__10_n_0 ));
  LUT6 #(
    .INIT(64'hA6AAAAAAAAAAAAAA)) 
    \r_FIFO_COUNT[6]_i_1__11 
       (.I0(wr_en_reg),
        .I1(rd_en),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\r_FIFO_COUNT[6]_i_1__11_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__11_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__10_n_0 ),
        .Q(r_FIFO_COUNT_reg[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[1] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__11_n_0 ),
        .D(p_0_out_carry_n_7),
        .Q(r_FIFO_COUNT_reg[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[2] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__11_n_0 ),
        .D(p_0_out_carry_n_6),
        .Q(r_FIFO_COUNT_reg[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[3] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__11_n_0 ),
        .D(p_0_out_carry_n_5),
        .Q(r_FIFO_COUNT_reg[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[4] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__11_n_0 ),
        .D(p_0_out_carry_n_4),
        .Q(r_FIFO_COUNT_reg[4]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[5] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__11_n_0 ),
        .D(p_0_out_carry__0_n_7),
        .Q(r_FIFO_COUNT_reg[5]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[6] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__11_n_0 ),
        .D(p_0_out_carry__0_n_6),
        .Q(r_FIFO_COUNT_reg[6]),
        .R(AR));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_0_5
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[1:0]),
        .DIB(Q[3:2]),
        .DIC(Q[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(\rd_data12[11]_11 [1:0]),
        .DOB(\rd_data12[11]_11 [3:2]),
        .DOC(\rd_data12[11]_11 [5:4]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_6_11
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[7:6]),
        .DIB(Q[9:8]),
        .DIC(Q[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(\rd_data12[11]_11 [7:6]),
        .DOB(\rd_data12[11]_11 [9:8]),
        .DOC(\rd_data12[11]_11 [11:10]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    \r_RD_INDEX[0]_i_1__10 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1__10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__10 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__10 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__10_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \r_RD_INDEX[3]_i_1__11 
       (.I0(p_0_out_carry_i_6__3_n_0),
        .I1(\r_RD_INDEX[3]_i_3__6_n_0 ),
        .I2(r_FIFO_COUNT_reg[1]),
        .I3(r_FIFO_COUNT_reg[0]),
        .I4(r_FIFO_COUNT_reg[4]),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__10 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__10_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \r_RD_INDEX[3]_i_3__6 
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[2]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(r_FIFO_COUNT_reg[5]),
        .O(\r_RD_INDEX[3]_i_3__6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_RD_INDEX[4]_i_1__10 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[4]),
        .I2(r_RD_INDEX[0]),
        .I3(r_RD_INDEX[1]),
        .I4(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[4]_i_1__10_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[0]_i_1__10_n_0 ),
        .Q(r_RD_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[1] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[1]_i_1__10_n_0 ),
        .Q(r_RD_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[2] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[2]_i_1__10_n_0 ),
        .Q(r_RD_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[3] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[3]_i_2__10_n_0 ),
        .Q(r_RD_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[4] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[4]_i_1__10_n_0 ),
        .Q(r_RD_INDEX[4]),
        .R(AR));
  LUT1 #(
    .INIT(2'h1)) 
    \r_WR_INDEX[0]_i_1__10 
       (.I0(r_WR_INDEX[0]),
        .O(\r_WR_INDEX[0]_i_1__10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \r_WR_INDEX[4]_i_1__10 
       (.I0(\r_WR_INDEX_reg[0]_0 ),
        .I1(wr_en_reg),
        .O(\r_WR_INDEX[4]_i_1__10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_WR_INDEX[4]_i_2 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[4]),
        .I2(r_WR_INDEX[0]),
        .I3(r_WR_INDEX[1]),
        .I4(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    \r_WR_INDEX[4]_i_3__10 
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[5]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(\r_WR_INDEX[4]_i_4__7_n_0 ),
        .I4(r_FIFO_COUNT_reg[2]),
        .I5(r_FIFO_COUNT_reg[3]),
        .O(\r_WR_INDEX_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \r_WR_INDEX[4]_i_4__7 
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[0]),
        .O(\r_WR_INDEX[4]_i_4__7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__10_n_0 ),
        .D(\r_WR_INDEX[0]_i_1__10_n_0 ),
        .Q(r_WR_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[1] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__10_n_0 ),
        .D(\r_WR_INDEX[1]_i_1_n_0 ),
        .Q(r_WR_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[2] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__10_n_0 ),
        .D(\r_WR_INDEX[2]_i_1_n_0 ),
        .Q(r_WR_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[3] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__10_n_0 ),
        .D(\r_WR_INDEX[3]_i_1_n_0 ),
        .Q(r_WR_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[4] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__10_n_0 ),
        .D(\r_WR_INDEX[4]_i_2_n_0 ),
        .Q(r_WR_INDEX[4]),
        .R(AR));
endmodule

(* ORIG_REF_NAME = "module_fifo_regs_no_flags" *) 
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_10
   (\FSM_sequential_fifo_wr_stm_reg[0] ,
    \r_WR_INDEX_reg[4]_0 ,
    o_rd_data,
    AR,
    CLK,
    \cnt_fifo_reg[6] ,
    rd_en,
    address,
    wr_en_reg,
    \FSM_sequential_fifo_wr_stm_reg[0]_0 ,
    out,
    \FSM_sequential_fifo_wr_stm_reg[1] ,
    \FSM_sequential_fifo_wr_stm_reg[1]_0 ,
    in0,
    \r_FIFO_COUNT_reg[1]_0 ,
    \r_FIFO_COUNT_reg[5]_0 ,
    \r_FIFO_COUNT_reg[1]_1 ,
    \r_FIFO_COUNT_reg[1]_2 ,
    \r_FIFO_COUNT_reg[1]_3 ,
    \r_FIFO_COUNT_reg[1]_4 ,
    p_0_in,
    Q);
  output \FSM_sequential_fifo_wr_stm_reg[0] ;
  output \r_WR_INDEX_reg[4]_0 ;
  output [11:0]o_rd_data;
  input [0:0]AR;
  input CLK;
  input \cnt_fifo_reg[6] ;
  input rd_en;
  input [3:0]address;
  input wr_en_reg;
  input \FSM_sequential_fifo_wr_stm_reg[0]_0 ;
  input [2:0]out;
  input \FSM_sequential_fifo_wr_stm_reg[1] ;
  input \FSM_sequential_fifo_wr_stm_reg[1]_0 ;
  input [0:0]in0;
  input \r_FIFO_COUNT_reg[1]_0 ;
  input \r_FIFO_COUNT_reg[5]_0 ;
  input \r_FIFO_COUNT_reg[1]_1 ;
  input \r_FIFO_COUNT_reg[1]_2 ;
  input \r_FIFO_COUNT_reg[1]_3 ;
  input \r_FIFO_COUNT_reg[1]_4 ;
  input p_0_in;
  input [11:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire \FSM_sequential_fifo_wr_stm[0]_i_3_n_0 ;
  wire \FSM_sequential_fifo_wr_stm[0]_i_6_n_0 ;
  wire \FSM_sequential_fifo_wr_stm_reg[0] ;
  wire \FSM_sequential_fifo_wr_stm_reg[0]_0 ;
  wire \FSM_sequential_fifo_wr_stm_reg[1] ;
  wire \FSM_sequential_fifo_wr_stm_reg[1]_0 ;
  wire [11:0]Q;
  wire [3:0]address;
  wire \cnt_fifo_reg[6] ;
  wire [0:0]in0;
  wire [11:0]o_rd_data;
  wire [2:0]out;
  wire p_0_in;
  wire p_0_out_carry__0_i_1__4_n_0;
  wire p_0_out_carry__0_i_2__4_n_0;
  wire p_0_out_carry__0_n_3;
  wire p_0_out_carry__0_n_6;
  wire p_0_out_carry__0_n_7;
  wire p_0_out_carry_i_1__4_n_0;
  wire p_0_out_carry_i_2__4_n_0;
  wire p_0_out_carry_i_3__4_n_0;
  wire p_0_out_carry_i_4__4_n_0;
  wire p_0_out_carry_i_5__5_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__4_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__5_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire \r_FIFO_COUNT_reg[1]_0 ;
  wire \r_FIFO_COUNT_reg[1]_1 ;
  wire \r_FIFO_COUNT_reg[1]_2 ;
  wire \r_FIFO_COUNT_reg[1]_3 ;
  wire \r_FIFO_COUNT_reg[1]_4 ;
  wire \r_FIFO_COUNT_reg[5]_0 ;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__4_n_0 ;
  wire \r_RD_INDEX[1]_i_1__4_n_0 ;
  wire \r_RD_INDEX[2]_i_1__4_n_0 ;
  wire \r_RD_INDEX[3]_i_2__4_n_0 ;
  wire \r_RD_INDEX[3]_i_3__11_n_0 ;
  wire \r_RD_INDEX[3]_i_4__1_n_0 ;
  wire \r_RD_INDEX[4]_i_1__4_n_0 ;
  wire [4:0]r_WR_INDEX;
  wire r_WR_INDEX0;
  wire \r_WR_INDEX[0]_i_1__4_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire \r_WR_INDEX[4]_i_4__3_n_0 ;
  wire \r_WR_INDEX_reg[4]_0 ;
  wire rd_en;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT6 #(
    .INIT(64'hEFE0FFFFEFE00000)) 
    \FSM_sequential_fifo_wr_stm[0]_i_1 
       (.I0(\FSM_sequential_fifo_wr_stm_reg[0]_0 ),
        .I1(\FSM_sequential_fifo_wr_stm[0]_i_3_n_0 ),
        .I2(out[2]),
        .I3(\FSM_sequential_fifo_wr_stm_reg[1] ),
        .I4(\FSM_sequential_fifo_wr_stm_reg[1]_0 ),
        .I5(in0),
        .O(\FSM_sequential_fifo_wr_stm_reg[0] ));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    \FSM_sequential_fifo_wr_stm[0]_i_3 
       (.I0(out[1]),
        .I1(\FSM_sequential_fifo_wr_stm[0]_i_6_n_0 ),
        .I2(\r_FIFO_COUNT_reg[1]_0 ),
        .I3(\r_FIFO_COUNT_reg[5]_0 ),
        .I4(\r_FIFO_COUNT_reg[1]_1 ),
        .I5(out[0]),
        .O(\FSM_sequential_fifo_wr_stm[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \FSM_sequential_fifo_wr_stm[0]_i_6 
       (.I0(\r_WR_INDEX_reg[4]_0 ),
        .I1(\r_FIFO_COUNT_reg[1]_2 ),
        .I2(\r_FIFO_COUNT_reg[1]_3 ),
        .I3(\r_FIFO_COUNT_reg[1]_4 ),
        .O(\FSM_sequential_fifo_wr_stm[0]_i_6_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__4_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__4_n_0,p_0_out_carry_i_3__4_n_0,p_0_out_carry_i_4__4_n_0,p_0_out_carry_i_5__5_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry__0
       (.CI(p_0_out_carry_n_0),
        .CO({NLW_p_0_out_carry__0_CO_UNCONNECTED[3:1],p_0_out_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,r_FIFO_COUNT_reg[4]}),
        .O({NLW_p_0_out_carry__0_O_UNCONNECTED[3:2],p_0_out_carry__0_n_6,p_0_out_carry__0_n_7}),
        .S({1'b0,1'b0,p_0_out_carry__0_i_1__4_n_0,p_0_out_carry__0_i_2__4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_1__4
       (.I0(r_FIFO_COUNT_reg[5]),
        .I1(r_FIFO_COUNT_reg[6]),
        .O(p_0_out_carry__0_i_1__4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_2__4
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[5]),
        .O(p_0_out_carry__0_i_2__4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    p_0_out_carry_i_1__4
       (.I0(r_FIFO_COUNT_reg[1]),
        .O(p_0_out_carry_i_1__4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_2__4
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[4]),
        .O(p_0_out_carry_i_2__4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_3__4
       (.I0(r_FIFO_COUNT_reg[2]),
        .I1(r_FIFO_COUNT_reg[3]),
        .O(p_0_out_carry_i_3__4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_4__4
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[2]),
        .O(p_0_out_carry_i_4__4_n_0));
  LUT6 #(
    .INIT(64'hAA9AAAAA55555555)) 
    p_0_out_carry_i_5__5
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(\cnt_fifo_reg[6] ),
        .I2(rd_en),
        .I3(address[3]),
        .I4(address[2]),
        .I5(wr_en_reg),
        .O(p_0_out_carry_i_5__5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__4 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__4_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA6AAAAAAAAAA)) 
    \r_FIFO_COUNT[6]_i_1__5 
       (.I0(wr_en_reg),
        .I1(address[2]),
        .I2(address[3]),
        .I3(rd_en),
        .I4(address[1]),
        .I5(address[0]),
        .O(\r_FIFO_COUNT[6]_i_1__5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__5_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__4_n_0 ),
        .Q(r_FIFO_COUNT_reg[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[1] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__5_n_0 ),
        .D(p_0_out_carry_n_7),
        .Q(r_FIFO_COUNT_reg[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[2] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__5_n_0 ),
        .D(p_0_out_carry_n_6),
        .Q(r_FIFO_COUNT_reg[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[3] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__5_n_0 ),
        .D(p_0_out_carry_n_5),
        .Q(r_FIFO_COUNT_reg[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[4] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__5_n_0 ),
        .D(p_0_out_carry_n_4),
        .Q(r_FIFO_COUNT_reg[4]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[5] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__5_n_0 ),
        .D(p_0_out_carry__0_n_7),
        .Q(r_FIFO_COUNT_reg[5]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[6] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__5_n_0 ),
        .D(p_0_out_carry__0_n_6),
        .Q(r_FIFO_COUNT_reg[6]),
        .R(AR));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_0_5
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[1:0]),
        .DIB(Q[3:2]),
        .DIC(Q[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[1:0]),
        .DOB(o_rd_data[3:2]),
        .DOC(o_rd_data[5:4]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_6_11
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[7:6]),
        .DIB(Q[9:8]),
        .DIC(Q[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[7:6]),
        .DOB(o_rd_data[9:8]),
        .DOC(o_rd_data[11:10]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    \r_RD_INDEX[0]_i_1__4 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1__4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__4 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__4 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__4_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \r_RD_INDEX[3]_i_1__5 
       (.I0(\r_RD_INDEX[3]_i_3__11_n_0 ),
        .I1(\r_RD_INDEX[3]_i_4__1_n_0 ),
        .I2(r_FIFO_COUNT_reg[1]),
        .I3(r_FIFO_COUNT_reg[0]),
        .I4(r_FIFO_COUNT_reg[4]),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__4 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__4_n_0 ));
  LUT5 #(
    .INIT(32'h00200000)) 
    \r_RD_INDEX[3]_i_3__11 
       (.I0(address[0]),
        .I1(address[1]),
        .I2(rd_en),
        .I3(address[3]),
        .I4(address[2]),
        .O(\r_RD_INDEX[3]_i_3__11_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \r_RD_INDEX[3]_i_4__1 
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[2]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(r_FIFO_COUNT_reg[5]),
        .O(\r_RD_INDEX[3]_i_4__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_RD_INDEX[4]_i_1__4 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[4]),
        .I2(r_RD_INDEX[0]),
        .I3(r_RD_INDEX[1]),
        .I4(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[4]_i_1__4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[0]_i_1__4_n_0 ),
        .Q(r_RD_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[1] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[1]_i_1__4_n_0 ),
        .Q(r_RD_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[2] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[2]_i_1__4_n_0 ),
        .Q(r_RD_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[3] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[3]_i_2__4_n_0 ),
        .Q(r_RD_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[4] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[4]_i_1__4_n_0 ),
        .Q(r_RD_INDEX[4]),
        .R(AR));
  LUT1 #(
    .INIT(2'h1)) 
    \r_WR_INDEX[0]_i_1__4 
       (.I0(r_WR_INDEX[0]),
        .O(\r_WR_INDEX[0]_i_1__4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \r_WR_INDEX[4]_i_1 
       (.I0(wr_en_reg),
        .I1(\r_WR_INDEX_reg[4]_0 ),
        .O(r_WR_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_WR_INDEX[4]_i_2 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[4]),
        .I2(r_WR_INDEX[0]),
        .I3(r_WR_INDEX[1]),
        .I4(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    \r_WR_INDEX[4]_i_3__4 
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[5]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(\r_WR_INDEX[4]_i_4__3_n_0 ),
        .I4(r_FIFO_COUNT_reg[2]),
        .I5(r_FIFO_COUNT_reg[3]),
        .O(\r_WR_INDEX_reg[4]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \r_WR_INDEX[4]_i_4__3 
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[0]),
        .O(\r_WR_INDEX[4]_i_4__3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_WR_INDEX0),
        .D(\r_WR_INDEX[0]_i_1__4_n_0 ),
        .Q(r_WR_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[1] 
       (.C(CLK),
        .CE(r_WR_INDEX0),
        .D(\r_WR_INDEX[1]_i_1_n_0 ),
        .Q(r_WR_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[2] 
       (.C(CLK),
        .CE(r_WR_INDEX0),
        .D(\r_WR_INDEX[2]_i_1_n_0 ),
        .Q(r_WR_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[3] 
       (.C(CLK),
        .CE(r_WR_INDEX0),
        .D(\r_WR_INDEX[3]_i_1_n_0 ),
        .Q(r_WR_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[4] 
       (.C(CLK),
        .CE(r_WR_INDEX0),
        .D(\r_WR_INDEX[4]_i_2_n_0 ),
        .Q(r_WR_INDEX[4]),
        .R(AR));
endmodule

(* ORIG_REF_NAME = "module_fifo_regs_no_flags" *) 
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_11
   (\r_WR_INDEX_reg[0]_0 ,
    \WDONBR_intl_reg[0] ,
    \FSM_sequential_fifo_wr_stm_reg[0] ,
    o_rd_data,
    AR,
    CLK,
    wr_en_reg,
    address,
    rd_en,
    \r_FIFO_COUNT_reg[1]_0 ,
    \r_FIFO_COUNT_reg[1]_1 ,
    \r_FIFO_COUNT_reg[1]_2 ,
    \r_FIFO_COUNT_reg[3]_0 ,
    \r_FIFO_COUNT_reg[6]_0 ,
    p_0_in,
    Q);
  output \r_WR_INDEX_reg[0]_0 ;
  output \WDONBR_intl_reg[0] ;
  output \FSM_sequential_fifo_wr_stm_reg[0] ;
  output [11:0]o_rd_data;
  input [0:0]AR;
  input CLK;
  input wr_en_reg;
  input [3:0]address;
  input rd_en;
  input \r_FIFO_COUNT_reg[1]_0 ;
  input \r_FIFO_COUNT_reg[1]_1 ;
  input \r_FIFO_COUNT_reg[1]_2 ;
  input \r_FIFO_COUNT_reg[3]_0 ;
  input \r_FIFO_COUNT_reg[6]_0 ;
  input p_0_in;
  input [11:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire \FSM_sequential_fifo_wr_stm[1]_i_16_n_0 ;
  wire \FSM_sequential_fifo_wr_stm_reg[0] ;
  wire [11:0]Q;
  wire \WDONBR_intl_reg[0] ;
  wire [3:0]address;
  wire [11:0]o_rd_data;
  wire p_0_in;
  wire p_0_out_carry__0_i_1__5_n_0;
  wire p_0_out_carry__0_i_2__5_n_0;
  wire p_0_out_carry__0_n_3;
  wire p_0_out_carry__0_n_6;
  wire p_0_out_carry__0_n_7;
  wire p_0_out_carry_i_1__5_n_0;
  wire p_0_out_carry_i_2__5_n_0;
  wire p_0_out_carry_i_3__5_n_0;
  wire p_0_out_carry_i_4__5_n_0;
  wire p_0_out_carry_i_5__4_n_0;
  wire p_0_out_carry_i_6__5_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__5_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__4_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire \r_FIFO_COUNT_reg[1]_0 ;
  wire \r_FIFO_COUNT_reg[1]_1 ;
  wire \r_FIFO_COUNT_reg[1]_2 ;
  wire \r_FIFO_COUNT_reg[3]_0 ;
  wire \r_FIFO_COUNT_reg[6]_0 ;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__5_n_0 ;
  wire \r_RD_INDEX[1]_i_1__5_n_0 ;
  wire \r_RD_INDEX[2]_i_1__5_n_0 ;
  wire \r_RD_INDEX[3]_i_2__5_n_0 ;
  wire \r_RD_INDEX[3]_i_3__3_n_0 ;
  wire \r_RD_INDEX[4]_i_1__5_n_0 ;
  wire [4:0]r_WR_INDEX;
  wire \r_WR_INDEX[0]_i_1__5_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_1__5_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire \r_WR_INDEX[4]_i_4__4_n_0 ;
  wire \r_WR_INDEX_reg[0]_0 ;
  wire rd_en;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_fifo_wr_stm[1]_i_16 
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[2]),
        .I2(r_FIFO_COUNT_reg[0]),
        .I3(r_FIFO_COUNT_reg[4]),
        .O(\FSM_sequential_fifo_wr_stm[1]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEF)) 
    \FSM_sequential_fifo_wr_stm[1]_i_8 
       (.I0(\FSM_sequential_fifo_wr_stm[1]_i_16_n_0 ),
        .I1(r_FIFO_COUNT_reg[6]),
        .I2(r_FIFO_COUNT_reg[5]),
        .I3(r_FIFO_COUNT_reg[1]),
        .I4(\r_FIFO_COUNT_reg[3]_0 ),
        .I5(\r_FIFO_COUNT_reg[6]_0 ),
        .O(\FSM_sequential_fifo_wr_stm_reg[0] ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_fifo_wr_stm[2]_i_5 
       (.I0(\r_WR_INDEX_reg[0]_0 ),
        .I1(\r_FIFO_COUNT_reg[1]_0 ),
        .I2(\r_FIFO_COUNT_reg[1]_1 ),
        .I3(\r_FIFO_COUNT_reg[1]_2 ),
        .O(\WDONBR_intl_reg[0] ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__5_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__5_n_0,p_0_out_carry_i_3__5_n_0,p_0_out_carry_i_4__5_n_0,p_0_out_carry_i_5__4_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry__0
       (.CI(p_0_out_carry_n_0),
        .CO({NLW_p_0_out_carry__0_CO_UNCONNECTED[3:1],p_0_out_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,r_FIFO_COUNT_reg[4]}),
        .O({NLW_p_0_out_carry__0_O_UNCONNECTED[3:2],p_0_out_carry__0_n_6,p_0_out_carry__0_n_7}),
        .S({1'b0,1'b0,p_0_out_carry__0_i_1__5_n_0,p_0_out_carry__0_i_2__5_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_1__5
       (.I0(r_FIFO_COUNT_reg[5]),
        .I1(r_FIFO_COUNT_reg[6]),
        .O(p_0_out_carry__0_i_1__5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_2__5
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[5]),
        .O(p_0_out_carry__0_i_2__5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    p_0_out_carry_i_1__5
       (.I0(r_FIFO_COUNT_reg[1]),
        .O(p_0_out_carry_i_1__5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_2__5
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[4]),
        .O(p_0_out_carry_i_2__5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_3__5
       (.I0(r_FIFO_COUNT_reg[2]),
        .I1(r_FIFO_COUNT_reg[3]),
        .O(p_0_out_carry_i_3__5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_4__5
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[2]),
        .O(p_0_out_carry_i_4__5_n_0));
  LUT3 #(
    .INIT(8'h65)) 
    p_0_out_carry_i_5__4
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(p_0_out_carry_i_6__5_n_0),
        .I2(wr_en_reg),
        .O(p_0_out_carry_i_5__4_n_0));
  LUT5 #(
    .INIT(32'h00400000)) 
    p_0_out_carry_i_6__5
       (.I0(address[0]),
        .I1(address[1]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(rd_en),
        .O(p_0_out_carry_i_6__5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__5 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__5_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAA6AAAAAA)) 
    \r_FIFO_COUNT[6]_i_1__4 
       (.I0(wr_en_reg),
        .I1(rd_en),
        .I2(address[3]),
        .I3(address[2]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\r_FIFO_COUNT[6]_i_1__4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__4_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__5_n_0 ),
        .Q(r_FIFO_COUNT_reg[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[1] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__4_n_0 ),
        .D(p_0_out_carry_n_7),
        .Q(r_FIFO_COUNT_reg[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[2] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__4_n_0 ),
        .D(p_0_out_carry_n_6),
        .Q(r_FIFO_COUNT_reg[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[3] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__4_n_0 ),
        .D(p_0_out_carry_n_5),
        .Q(r_FIFO_COUNT_reg[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[4] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__4_n_0 ),
        .D(p_0_out_carry_n_4),
        .Q(r_FIFO_COUNT_reg[4]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[5] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__4_n_0 ),
        .D(p_0_out_carry__0_n_7),
        .Q(r_FIFO_COUNT_reg[5]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[6] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__4_n_0 ),
        .D(p_0_out_carry__0_n_6),
        .Q(r_FIFO_COUNT_reg[6]),
        .R(AR));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_0_5
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[1:0]),
        .DIB(Q[3:2]),
        .DIC(Q[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[1:0]),
        .DOB(o_rd_data[3:2]),
        .DOC(o_rd_data[5:4]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_6_11
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[7:6]),
        .DIB(Q[9:8]),
        .DIC(Q[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[7:6]),
        .DOB(o_rd_data[9:8]),
        .DOC(o_rd_data[11:10]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    \r_RD_INDEX[0]_i_1__5 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1__5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__5 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__5 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__5_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \r_RD_INDEX[3]_i_1__4 
       (.I0(p_0_out_carry_i_6__5_n_0),
        .I1(\r_RD_INDEX[3]_i_3__3_n_0 ),
        .I2(r_FIFO_COUNT_reg[1]),
        .I3(r_FIFO_COUNT_reg[0]),
        .I4(r_FIFO_COUNT_reg[4]),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__5 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \r_RD_INDEX[3]_i_3__3 
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[2]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(r_FIFO_COUNT_reg[5]),
        .O(\r_RD_INDEX[3]_i_3__3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_RD_INDEX[4]_i_1__5 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[4]),
        .I2(r_RD_INDEX[0]),
        .I3(r_RD_INDEX[1]),
        .I4(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[4]_i_1__5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[0]_i_1__5_n_0 ),
        .Q(r_RD_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[1] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[1]_i_1__5_n_0 ),
        .Q(r_RD_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[2] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[2]_i_1__5_n_0 ),
        .Q(r_RD_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[3] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[3]_i_2__5_n_0 ),
        .Q(r_RD_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[4] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[4]_i_1__5_n_0 ),
        .Q(r_RD_INDEX[4]),
        .R(AR));
  LUT1 #(
    .INIT(2'h1)) 
    \r_WR_INDEX[0]_i_1__5 
       (.I0(r_WR_INDEX[0]),
        .O(\r_WR_INDEX[0]_i_1__5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \r_WR_INDEX[4]_i_1__5 
       (.I0(\r_WR_INDEX_reg[0]_0 ),
        .I1(wr_en_reg),
        .O(\r_WR_INDEX[4]_i_1__5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_WR_INDEX[4]_i_2 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[4]),
        .I2(r_WR_INDEX[0]),
        .I3(r_WR_INDEX[1]),
        .I4(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    \r_WR_INDEX[4]_i_3__5 
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[5]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(\r_WR_INDEX[4]_i_4__4_n_0 ),
        .I4(r_FIFO_COUNT_reg[2]),
        .I5(r_FIFO_COUNT_reg[3]),
        .O(\r_WR_INDEX_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \r_WR_INDEX[4]_i_4__4 
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[0]),
        .O(\r_WR_INDEX[4]_i_4__4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__5_n_0 ),
        .D(\r_WR_INDEX[0]_i_1__5_n_0 ),
        .Q(r_WR_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[1] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__5_n_0 ),
        .D(\r_WR_INDEX[1]_i_1_n_0 ),
        .Q(r_WR_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[2] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__5_n_0 ),
        .D(\r_WR_INDEX[2]_i_1_n_0 ),
        .Q(r_WR_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[3] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__5_n_0 ),
        .D(\r_WR_INDEX[3]_i_1_n_0 ),
        .Q(r_WR_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[4] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__5_n_0 ),
        .D(\r_WR_INDEX[4]_i_2_n_0 ),
        .Q(r_WR_INDEX[4]),
        .R(AR));
endmodule

(* ORIG_REF_NAME = "module_fifo_regs_no_flags" *) 
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_12
   (\r_WR_INDEX_reg[0]_0 ,
    \FSM_sequential_fifo_wr_stm_reg[0] ,
    \FSM_sequential_fifo_wr_stm_reg[0]_0 ,
    \DataOut_stall_reg[11] ,
    \DataOut_stall_reg[10] ,
    \DataOut_stall_reg[9] ,
    \DataOut_stall_reg[8] ,
    \DataOut_stall_reg[7] ,
    \DataOut_stall_reg[6] ,
    \DataOut_stall_reg[5] ,
    \DataOut_stall_reg[4] ,
    \DataOut_stall_reg[3] ,
    \DataOut_stall_reg[2] ,
    \DataOut_stall_reg[1] ,
    \DataOut_stall_reg[0] ,
    AR,
    CLK,
    wr_en_reg,
    rd_en,
    address,
    o_rd_data,
    \wr_data_reg[5][7] ,
    \wr_data_reg[4][7] ,
    p_0_in,
    Q);
  output \r_WR_INDEX_reg[0]_0 ;
  output \FSM_sequential_fifo_wr_stm_reg[0] ;
  output \FSM_sequential_fifo_wr_stm_reg[0]_0 ;
  output \DataOut_stall_reg[11] ;
  output \DataOut_stall_reg[10] ;
  output \DataOut_stall_reg[9] ;
  output \DataOut_stall_reg[8] ;
  output \DataOut_stall_reg[7] ;
  output \DataOut_stall_reg[6] ;
  output \DataOut_stall_reg[5] ;
  output \DataOut_stall_reg[4] ;
  output \DataOut_stall_reg[3] ;
  output \DataOut_stall_reg[2] ;
  output \DataOut_stall_reg[1] ;
  output \DataOut_stall_reg[0] ;
  input [0:0]AR;
  input CLK;
  input wr_en_reg;
  input rd_en;
  input [3:0]address;
  input [11:0]o_rd_data;
  input [11:0]\wr_data_reg[5][7] ;
  input [11:0]\wr_data_reg[4][7] ;
  input p_0_in;
  input [11:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire \DataOut_stall_reg[0] ;
  wire \DataOut_stall_reg[10] ;
  wire \DataOut_stall_reg[11] ;
  wire \DataOut_stall_reg[1] ;
  wire \DataOut_stall_reg[2] ;
  wire \DataOut_stall_reg[3] ;
  wire \DataOut_stall_reg[4] ;
  wire \DataOut_stall_reg[5] ;
  wire \DataOut_stall_reg[6] ;
  wire \DataOut_stall_reg[7] ;
  wire \DataOut_stall_reg[8] ;
  wire \DataOut_stall_reg[9] ;
  wire \FSM_sequential_fifo_wr_stm_reg[0] ;
  wire \FSM_sequential_fifo_wr_stm_reg[0]_0 ;
  wire [11:0]Q;
  wire [3:0]address;
  wire [11:0]o_rd_data;
  wire p_0_in;
  wire p_0_out_carry__0_i_1__6_n_0;
  wire p_0_out_carry__0_i_2__6_n_0;
  wire p_0_out_carry__0_n_3;
  wire p_0_out_carry__0_n_6;
  wire p_0_out_carry__0_n_7;
  wire p_0_out_carry_i_1__6_n_0;
  wire p_0_out_carry_i_2__6_n_0;
  wire p_0_out_carry_i_3__6_n_0;
  wire p_0_out_carry_i_4__6_n_0;
  wire p_0_out_carry_i_5__3_n_0;
  wire p_0_out_carry_i_6__0_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__6_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__3_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__6_n_0 ;
  wire \r_RD_INDEX[1]_i_1__6_n_0 ;
  wire \r_RD_INDEX[2]_i_1__6_n_0 ;
  wire \r_RD_INDEX[3]_i_2__6_n_0 ;
  wire \r_RD_INDEX[3]_i_3__4_n_0 ;
  wire \r_RD_INDEX[4]_i_1__6_n_0 ;
  wire [4:0]r_WR_INDEX;
  wire \r_WR_INDEX[0]_i_1__6_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_1__6_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire \r_WR_INDEX[4]_i_4__5_n_0 ;
  wire \r_WR_INDEX_reg[0]_0 ;
  wire [11:0]\rd_data12[7]_7 ;
  wire rd_en;
  wire [11:0]\wr_data_reg[4][7] ;
  wire [11:0]\wr_data_reg[5][7] ;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[0]_i_5 
       (.I0(\rd_data12[7]_7 [0]),
        .I1(o_rd_data[0]),
        .I2(address[1]),
        .I3(\wr_data_reg[5][7] [0]),
        .I4(address[0]),
        .I5(\wr_data_reg[4][7] [0]),
        .O(\DataOut_stall_reg[0] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[10]_i_5 
       (.I0(\rd_data12[7]_7 [10]),
        .I1(o_rd_data[10]),
        .I2(address[1]),
        .I3(\wr_data_reg[5][7] [10]),
        .I4(address[0]),
        .I5(\wr_data_reg[4][7] [10]),
        .O(\DataOut_stall_reg[10] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[11]_i_6 
       (.I0(\rd_data12[7]_7 [11]),
        .I1(o_rd_data[11]),
        .I2(address[1]),
        .I3(\wr_data_reg[5][7] [11]),
        .I4(address[0]),
        .I5(\wr_data_reg[4][7] [11]),
        .O(\DataOut_stall_reg[11] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[1]_i_5 
       (.I0(\rd_data12[7]_7 [1]),
        .I1(o_rd_data[1]),
        .I2(address[1]),
        .I3(\wr_data_reg[5][7] [1]),
        .I4(address[0]),
        .I5(\wr_data_reg[4][7] [1]),
        .O(\DataOut_stall_reg[1] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[2]_i_5 
       (.I0(\rd_data12[7]_7 [2]),
        .I1(o_rd_data[2]),
        .I2(address[1]),
        .I3(\wr_data_reg[5][7] [2]),
        .I4(address[0]),
        .I5(\wr_data_reg[4][7] [2]),
        .O(\DataOut_stall_reg[2] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[3]_i_5 
       (.I0(\rd_data12[7]_7 [3]),
        .I1(o_rd_data[3]),
        .I2(address[1]),
        .I3(\wr_data_reg[5][7] [3]),
        .I4(address[0]),
        .I5(\wr_data_reg[4][7] [3]),
        .O(\DataOut_stall_reg[3] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[4]_i_5 
       (.I0(\rd_data12[7]_7 [4]),
        .I1(o_rd_data[4]),
        .I2(address[1]),
        .I3(\wr_data_reg[5][7] [4]),
        .I4(address[0]),
        .I5(\wr_data_reg[4][7] [4]),
        .O(\DataOut_stall_reg[4] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[5]_i_5 
       (.I0(\rd_data12[7]_7 [5]),
        .I1(o_rd_data[5]),
        .I2(address[1]),
        .I3(\wr_data_reg[5][7] [5]),
        .I4(address[0]),
        .I5(\wr_data_reg[4][7] [5]),
        .O(\DataOut_stall_reg[5] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[6]_i_5 
       (.I0(\rd_data12[7]_7 [6]),
        .I1(o_rd_data[6]),
        .I2(address[1]),
        .I3(\wr_data_reg[5][7] [6]),
        .I4(address[0]),
        .I5(\wr_data_reg[4][7] [6]),
        .O(\DataOut_stall_reg[6] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[7]_i_5 
       (.I0(\rd_data12[7]_7 [7]),
        .I1(o_rd_data[7]),
        .I2(address[1]),
        .I3(\wr_data_reg[5][7] [7]),
        .I4(address[0]),
        .I5(\wr_data_reg[4][7] [7]),
        .O(\DataOut_stall_reg[7] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[8]_i_5 
       (.I0(\rd_data12[7]_7 [8]),
        .I1(o_rd_data[8]),
        .I2(address[1]),
        .I3(\wr_data_reg[5][7] [8]),
        .I4(address[0]),
        .I5(\wr_data_reg[4][7] [8]),
        .O(\DataOut_stall_reg[8] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[9]_i_5 
       (.I0(\rd_data12[7]_7 [9]),
        .I1(o_rd_data[9]),
        .I2(address[1]),
        .I3(\wr_data_reg[5][7] [9]),
        .I4(address[0]),
        .I5(\wr_data_reg[4][7] [9]),
        .O(\DataOut_stall_reg[9] ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_fifo_wr_stm[1]_i_17 
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[2]),
        .I2(r_FIFO_COUNT_reg[0]),
        .I3(r_FIFO_COUNT_reg[4]),
        .O(\FSM_sequential_fifo_wr_stm_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \FSM_sequential_fifo_wr_stm[1]_i_18 
       (.I0(r_FIFO_COUNT_reg[6]),
        .I1(r_FIFO_COUNT_reg[5]),
        .I2(r_FIFO_COUNT_reg[1]),
        .O(\FSM_sequential_fifo_wr_stm_reg[0]_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__6_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__6_n_0,p_0_out_carry_i_3__6_n_0,p_0_out_carry_i_4__6_n_0,p_0_out_carry_i_5__3_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry__0
       (.CI(p_0_out_carry_n_0),
        .CO({NLW_p_0_out_carry__0_CO_UNCONNECTED[3:1],p_0_out_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,r_FIFO_COUNT_reg[4]}),
        .O({NLW_p_0_out_carry__0_O_UNCONNECTED[3:2],p_0_out_carry__0_n_6,p_0_out_carry__0_n_7}),
        .S({1'b0,1'b0,p_0_out_carry__0_i_1__6_n_0,p_0_out_carry__0_i_2__6_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_1__6
       (.I0(r_FIFO_COUNT_reg[5]),
        .I1(r_FIFO_COUNT_reg[6]),
        .O(p_0_out_carry__0_i_1__6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_2__6
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[5]),
        .O(p_0_out_carry__0_i_2__6_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    p_0_out_carry_i_1__6
       (.I0(r_FIFO_COUNT_reg[1]),
        .O(p_0_out_carry_i_1__6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_2__6
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[4]),
        .O(p_0_out_carry_i_2__6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_3__6
       (.I0(r_FIFO_COUNT_reg[2]),
        .I1(r_FIFO_COUNT_reg[3]),
        .O(p_0_out_carry_i_3__6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_4__6
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[2]),
        .O(p_0_out_carry_i_4__6_n_0));
  LUT3 #(
    .INIT(8'h65)) 
    p_0_out_carry_i_5__3
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(p_0_out_carry_i_6__0_n_0),
        .I2(wr_en_reg),
        .O(p_0_out_carry_i_5__3_n_0));
  LUT5 #(
    .INIT(32'h00800000)) 
    p_0_out_carry_i_6__0
       (.I0(address[0]),
        .I1(address[1]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(rd_en),
        .O(p_0_out_carry_i_6__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__6 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__6_n_0 ));
  LUT6 #(
    .INIT(64'hA6AAAAAAAAAAAAAA)) 
    \r_FIFO_COUNT[6]_i_1__3 
       (.I0(wr_en_reg),
        .I1(rd_en),
        .I2(address[3]),
        .I3(address[2]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\r_FIFO_COUNT[6]_i_1__3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__3_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__6_n_0 ),
        .Q(r_FIFO_COUNT_reg[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[1] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__3_n_0 ),
        .D(p_0_out_carry_n_7),
        .Q(r_FIFO_COUNT_reg[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[2] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__3_n_0 ),
        .D(p_0_out_carry_n_6),
        .Q(r_FIFO_COUNT_reg[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[3] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__3_n_0 ),
        .D(p_0_out_carry_n_5),
        .Q(r_FIFO_COUNT_reg[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[4] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__3_n_0 ),
        .D(p_0_out_carry_n_4),
        .Q(r_FIFO_COUNT_reg[4]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[5] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__3_n_0 ),
        .D(p_0_out_carry__0_n_7),
        .Q(r_FIFO_COUNT_reg[5]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[6] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__3_n_0 ),
        .D(p_0_out_carry__0_n_6),
        .Q(r_FIFO_COUNT_reg[6]),
        .R(AR));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_0_5
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[1:0]),
        .DIB(Q[3:2]),
        .DIC(Q[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(\rd_data12[7]_7 [1:0]),
        .DOB(\rd_data12[7]_7 [3:2]),
        .DOC(\rd_data12[7]_7 [5:4]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_6_11
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[7:6]),
        .DIB(Q[9:8]),
        .DIC(Q[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(\rd_data12[7]_7 [7:6]),
        .DOB(\rd_data12[7]_7 [9:8]),
        .DOC(\rd_data12[7]_7 [11:10]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    \r_RD_INDEX[0]_i_1__6 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1__6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__6 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__6 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__6_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \r_RD_INDEX[3]_i_1__3 
       (.I0(p_0_out_carry_i_6__0_n_0),
        .I1(\r_RD_INDEX[3]_i_3__4_n_0 ),
        .I2(r_FIFO_COUNT_reg[1]),
        .I3(r_FIFO_COUNT_reg[0]),
        .I4(r_FIFO_COUNT_reg[4]),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__6 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \r_RD_INDEX[3]_i_3__4 
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[2]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(r_FIFO_COUNT_reg[5]),
        .O(\r_RD_INDEX[3]_i_3__4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_RD_INDEX[4]_i_1__6 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[4]),
        .I2(r_RD_INDEX[0]),
        .I3(r_RD_INDEX[1]),
        .I4(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[4]_i_1__6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[0]_i_1__6_n_0 ),
        .Q(r_RD_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[1] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[1]_i_1__6_n_0 ),
        .Q(r_RD_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[2] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[2]_i_1__6_n_0 ),
        .Q(r_RD_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[3] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[3]_i_2__6_n_0 ),
        .Q(r_RD_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[4] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[4]_i_1__6_n_0 ),
        .Q(r_RD_INDEX[4]),
        .R(AR));
  LUT1 #(
    .INIT(2'h1)) 
    \r_WR_INDEX[0]_i_1__6 
       (.I0(r_WR_INDEX[0]),
        .O(\r_WR_INDEX[0]_i_1__6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \r_WR_INDEX[4]_i_1__6 
       (.I0(\r_WR_INDEX_reg[0]_0 ),
        .I1(wr_en_reg),
        .O(\r_WR_INDEX[4]_i_1__6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_WR_INDEX[4]_i_2 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[4]),
        .I2(r_WR_INDEX[0]),
        .I3(r_WR_INDEX[1]),
        .I4(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    \r_WR_INDEX[4]_i_3__6 
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[5]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(\r_WR_INDEX[4]_i_4__5_n_0 ),
        .I4(r_FIFO_COUNT_reg[2]),
        .I5(r_FIFO_COUNT_reg[3]),
        .O(\r_WR_INDEX_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \r_WR_INDEX[4]_i_4__5 
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[0]),
        .O(\r_WR_INDEX[4]_i_4__5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__6_n_0 ),
        .D(\r_WR_INDEX[0]_i_1__6_n_0 ),
        .Q(r_WR_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[1] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__6_n_0 ),
        .D(\r_WR_INDEX[1]_i_1_n_0 ),
        .Q(r_WR_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[2] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__6_n_0 ),
        .D(\r_WR_INDEX[2]_i_1_n_0 ),
        .Q(r_WR_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[3] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__6_n_0 ),
        .D(\r_WR_INDEX[3]_i_1_n_0 ),
        .Q(r_WR_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[4] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__6_n_0 ),
        .D(\r_WR_INDEX[4]_i_2_n_0 ),
        .Q(r_WR_INDEX[4]),
        .R(AR));
endmodule

(* ORIG_REF_NAME = "module_fifo_regs_no_flags" *) 
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_13
   (\WDONBR_intl_reg[0] ,
    \FSM_sequential_fifo_wr_stm_reg[1] ,
    \FSM_sequential_fifo_wr_stm_reg[0] ,
    o_rd_data,
    AR,
    CLK,
    \cnt_fifo_reg[5] ,
    rd_en,
    address,
    wr_en_reg,
    \r_FIFO_COUNT_reg[1]_0 ,
    \r_FIFO_COUNT_reg[3]_0 ,
    \r_FIFO_COUNT_reg[6]_0 ,
    p_0_in,
    Q);
  output \WDONBR_intl_reg[0] ;
  output \FSM_sequential_fifo_wr_stm_reg[1] ;
  output \FSM_sequential_fifo_wr_stm_reg[0] ;
  output [11:0]o_rd_data;
  input [0:0]AR;
  input CLK;
  input \cnt_fifo_reg[5] ;
  input rd_en;
  input [3:0]address;
  input wr_en_reg;
  input \r_FIFO_COUNT_reg[1]_0 ;
  input \r_FIFO_COUNT_reg[3]_0 ;
  input \r_FIFO_COUNT_reg[6]_0 ;
  input p_0_in;
  input [11:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire \FSM_sequential_fifo_wr_stm[1]_i_9_n_0 ;
  wire \FSM_sequential_fifo_wr_stm_reg[0] ;
  wire \FSM_sequential_fifo_wr_stm_reg[1] ;
  wire [11:0]Q;
  wire \WDONBR_intl_reg[0] ;
  wire [3:0]address;
  wire \cnt_fifo_reg[5] ;
  wire [11:0]o_rd_data;
  wire p_0_in;
  wire p_0_out_carry__0_i_1__7_n_0;
  wire p_0_out_carry__0_i_2__7_n_0;
  wire p_0_out_carry__0_n_3;
  wire p_0_out_carry__0_n_6;
  wire p_0_out_carry__0_n_7;
  wire p_0_out_carry_i_1__7_n_0;
  wire p_0_out_carry_i_2__7_n_0;
  wire p_0_out_carry_i_3__7_n_0;
  wire p_0_out_carry_i_4__7_n_0;
  wire p_0_out_carry_i_5__0_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__7_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__0_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire \r_FIFO_COUNT_reg[1]_0 ;
  wire \r_FIFO_COUNT_reg[3]_0 ;
  wire \r_FIFO_COUNT_reg[6]_0 ;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__7_n_0 ;
  wire \r_RD_INDEX[1]_i_1__7_n_0 ;
  wire \r_RD_INDEX[2]_i_1__7_n_0 ;
  wire \r_RD_INDEX[3]_i_2__7_n_0 ;
  wire \r_RD_INDEX[3]_i_3__9_n_0 ;
  wire \r_RD_INDEX[4]_i_1__7_n_0 ;
  wire [4:0]r_WR_INDEX;
  wire \r_WR_INDEX[0]_i_1__7_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_1__7_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire \r_WR_INDEX[4]_i_3__7_n_0 ;
  wire rd_en;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT4 #(
    .INIT(16'hFFFB)) 
    \FSM_sequential_fifo_wr_stm[0]_i_12 
       (.I0(\FSM_sequential_fifo_wr_stm[1]_i_9_n_0 ),
        .I1(r_FIFO_COUNT_reg[5]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(r_FIFO_COUNT_reg[0]),
        .O(\FSM_sequential_fifo_wr_stm_reg[0] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEF)) 
    \FSM_sequential_fifo_wr_stm[1]_i_5 
       (.I0(r_FIFO_COUNT_reg[0]),
        .I1(r_FIFO_COUNT_reg[6]),
        .I2(r_FIFO_COUNT_reg[5]),
        .I3(\FSM_sequential_fifo_wr_stm[1]_i_9_n_0 ),
        .I4(\r_FIFO_COUNT_reg[3]_0 ),
        .I5(\r_FIFO_COUNT_reg[6]_0 ),
        .O(\FSM_sequential_fifo_wr_stm_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_fifo_wr_stm[1]_i_9 
       (.I0(r_FIFO_COUNT_reg[2]),
        .I1(r_FIFO_COUNT_reg[1]),
        .I2(r_FIFO_COUNT_reg[4]),
        .I3(r_FIFO_COUNT_reg[3]),
        .O(\FSM_sequential_fifo_wr_stm[1]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFEF)) 
    \FSM_sequential_fifo_wr_stm[2]_i_4 
       (.I0(\r_WR_INDEX[4]_i_3__7_n_0 ),
        .I1(r_FIFO_COUNT_reg[6]),
        .I2(r_FIFO_COUNT_reg[5]),
        .I3(r_FIFO_COUNT_reg[1]),
        .I4(\r_FIFO_COUNT_reg[1]_0 ),
        .O(\WDONBR_intl_reg[0] ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__7_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__7_n_0,p_0_out_carry_i_3__7_n_0,p_0_out_carry_i_4__7_n_0,p_0_out_carry_i_5__0_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry__0
       (.CI(p_0_out_carry_n_0),
        .CO({NLW_p_0_out_carry__0_CO_UNCONNECTED[3:1],p_0_out_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,r_FIFO_COUNT_reg[4]}),
        .O({NLW_p_0_out_carry__0_O_UNCONNECTED[3:2],p_0_out_carry__0_n_6,p_0_out_carry__0_n_7}),
        .S({1'b0,1'b0,p_0_out_carry__0_i_1__7_n_0,p_0_out_carry__0_i_2__7_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_1__7
       (.I0(r_FIFO_COUNT_reg[5]),
        .I1(r_FIFO_COUNT_reg[6]),
        .O(p_0_out_carry__0_i_1__7_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_2__7
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[5]),
        .O(p_0_out_carry__0_i_2__7_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    p_0_out_carry_i_1__7
       (.I0(r_FIFO_COUNT_reg[1]),
        .O(p_0_out_carry_i_1__7_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_2__7
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[4]),
        .O(p_0_out_carry_i_2__7_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_3__7
       (.I0(r_FIFO_COUNT_reg[2]),
        .I1(r_FIFO_COUNT_reg[3]),
        .O(p_0_out_carry_i_3__7_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_4__7
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[2]),
        .O(p_0_out_carry_i_4__7_n_0));
  LUT6 #(
    .INIT(64'hAA9AAAAA55555555)) 
    p_0_out_carry_i_5__0
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(\cnt_fifo_reg[5] ),
        .I2(rd_en),
        .I3(address[2]),
        .I4(address[3]),
        .I5(wr_en_reg),
        .O(p_0_out_carry_i_5__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__7 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__7_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAA6AA)) 
    \r_FIFO_COUNT[6]_i_1__0 
       (.I0(wr_en_reg),
        .I1(address[3]),
        .I2(address[2]),
        .I3(rd_en),
        .I4(address[0]),
        .I5(address[1]),
        .O(\r_FIFO_COUNT[6]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__0_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__7_n_0 ),
        .Q(r_FIFO_COUNT_reg[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[1] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__0_n_0 ),
        .D(p_0_out_carry_n_7),
        .Q(r_FIFO_COUNT_reg[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[2] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__0_n_0 ),
        .D(p_0_out_carry_n_6),
        .Q(r_FIFO_COUNT_reg[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[3] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__0_n_0 ),
        .D(p_0_out_carry_n_5),
        .Q(r_FIFO_COUNT_reg[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[4] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__0_n_0 ),
        .D(p_0_out_carry_n_4),
        .Q(r_FIFO_COUNT_reg[4]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[5] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__0_n_0 ),
        .D(p_0_out_carry__0_n_7),
        .Q(r_FIFO_COUNT_reg[5]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[6] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__0_n_0 ),
        .D(p_0_out_carry__0_n_6),
        .Q(r_FIFO_COUNT_reg[6]),
        .R(AR));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_0_5
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[1:0]),
        .DIB(Q[3:2]),
        .DIC(Q[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[1:0]),
        .DOB(o_rd_data[3:2]),
        .DOC(o_rd_data[5:4]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_6_11
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[7:6]),
        .DIB(Q[9:8]),
        .DIC(Q[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[7:6]),
        .DOB(o_rd_data[9:8]),
        .DOC(o_rd_data[11:10]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    \r_RD_INDEX[0]_i_1__7 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1__7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__7 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__7 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__7_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \r_RD_INDEX[3]_i_1__0 
       (.I0(\r_RD_INDEX[3]_i_3__9_n_0 ),
        .I1(r_FIFO_COUNT_reg[1]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(r_FIFO_COUNT_reg[5]),
        .I4(\r_WR_INDEX[4]_i_3__7_n_0 ),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__7 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__7_n_0 ));
  LUT5 #(
    .INIT(32'h00100000)) 
    \r_RD_INDEX[3]_i_3__9 
       (.I0(address[1]),
        .I1(address[0]),
        .I2(rd_en),
        .I3(address[2]),
        .I4(address[3]),
        .O(\r_RD_INDEX[3]_i_3__9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_RD_INDEX[4]_i_1__7 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[4]),
        .I2(r_RD_INDEX[0]),
        .I3(r_RD_INDEX[1]),
        .I4(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[4]_i_1__7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[0]_i_1__7_n_0 ),
        .Q(r_RD_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[1] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[1]_i_1__7_n_0 ),
        .Q(r_RD_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[2] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[2]_i_1__7_n_0 ),
        .Q(r_RD_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[3] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[3]_i_2__7_n_0 ),
        .Q(r_RD_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[4] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[4]_i_1__7_n_0 ),
        .Q(r_RD_INDEX[4]),
        .R(AR));
  LUT1 #(
    .INIT(2'h1)) 
    \r_WR_INDEX[0]_i_1__7 
       (.I0(r_WR_INDEX[0]),
        .O(\r_WR_INDEX[0]_i_1__7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEF0000)) 
    \r_WR_INDEX[4]_i_1__7 
       (.I0(\r_WR_INDEX[4]_i_3__7_n_0 ),
        .I1(r_FIFO_COUNT_reg[6]),
        .I2(r_FIFO_COUNT_reg[5]),
        .I3(r_FIFO_COUNT_reg[1]),
        .I4(wr_en_reg),
        .O(\r_WR_INDEX[4]_i_1__7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_WR_INDEX[4]_i_2 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[4]),
        .I2(r_WR_INDEX[0]),
        .I3(r_WR_INDEX[1]),
        .I4(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \r_WR_INDEX[4]_i_3__7 
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[2]),
        .I2(r_FIFO_COUNT_reg[0]),
        .I3(r_FIFO_COUNT_reg[4]),
        .O(\r_WR_INDEX[4]_i_3__7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__7_n_0 ),
        .D(\r_WR_INDEX[0]_i_1__7_n_0 ),
        .Q(r_WR_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[1] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__7_n_0 ),
        .D(\r_WR_INDEX[1]_i_1_n_0 ),
        .Q(r_WR_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[2] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__7_n_0 ),
        .D(\r_WR_INDEX[2]_i_1_n_0 ),
        .Q(r_WR_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[3] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__7_n_0 ),
        .D(\r_WR_INDEX[3]_i_1_n_0 ),
        .Q(r_WR_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[4] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__7_n_0 ),
        .D(\r_WR_INDEX[4]_i_2_n_0 ),
        .Q(r_WR_INDEX[4]),
        .R(AR));
endmodule

(* ORIG_REF_NAME = "module_fifo_regs_no_flags" *) 
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_14
   (\r_RD_INDEX_reg[4]_0 ,
    \FSM_sequential_fifo_wr_stm_reg[0] ,
    \FSM_sequential_fifo_wr_stm_reg[0]_0 ,
    \FSM_sequential_fifo_wr_stm_reg[1] ,
    o_rd_data,
    AR,
    CLK,
    \cnt_fifo_reg[6] ,
    rd_en,
    address,
    wr_en_reg,
    \r_FIFO_COUNT_reg[5]_0 ,
    \r_FIFO_COUNT_reg[1]_0 ,
    \r_FIFO_COUNT_reg[1]_1 ,
    p_0_in,
    Q);
  output \r_RD_INDEX_reg[4]_0 ;
  output \FSM_sequential_fifo_wr_stm_reg[0] ;
  output \FSM_sequential_fifo_wr_stm_reg[0]_0 ;
  output \FSM_sequential_fifo_wr_stm_reg[1] ;
  output [11:0]o_rd_data;
  input [0:0]AR;
  input CLK;
  input \cnt_fifo_reg[6] ;
  input rd_en;
  input [3:0]address;
  input wr_en_reg;
  input \r_FIFO_COUNT_reg[5]_0 ;
  input \r_FIFO_COUNT_reg[1]_0 ;
  input \r_FIFO_COUNT_reg[1]_1 ;
  input p_0_in;
  input [11:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire \FSM_sequential_fifo_wr_stm_reg[0] ;
  wire \FSM_sequential_fifo_wr_stm_reg[0]_0 ;
  wire \FSM_sequential_fifo_wr_stm_reg[1] ;
  wire [11:0]Q;
  wire [3:0]address;
  wire \cnt_fifo_reg[6] ;
  wire [11:0]o_rd_data;
  wire p_0_in;
  wire p_0_out_carry__0_i_1__8_n_0;
  wire p_0_out_carry__0_i_2__8_n_0;
  wire p_0_out_carry__0_n_3;
  wire p_0_out_carry__0_n_6;
  wire p_0_out_carry__0_n_7;
  wire p_0_out_carry_i_1__8_n_0;
  wire p_0_out_carry_i_2__8_n_0;
  wire p_0_out_carry_i_3__8_n_0;
  wire p_0_out_carry_i_4__8_n_0;
  wire p_0_out_carry_i_5__9_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__8_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__9_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire \r_FIFO_COUNT_reg[1]_0 ;
  wire \r_FIFO_COUNT_reg[1]_1 ;
  wire \r_FIFO_COUNT_reg[5]_0 ;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__8_n_0 ;
  wire \r_RD_INDEX[1]_i_1__8_n_0 ;
  wire \r_RD_INDEX[2]_i_1__8_n_0 ;
  wire \r_RD_INDEX[3]_i_2__8_n_0 ;
  wire \r_RD_INDEX[3]_i_3__12_n_0 ;
  wire \r_RD_INDEX[4]_i_1__8_n_0 ;
  wire \r_RD_INDEX_reg[4]_0 ;
  wire [4:0]r_WR_INDEX;
  wire \r_WR_INDEX[0]_i_1__8_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_1__8_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire rd_en;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_fifo_wr_stm[0]_i_9 
       (.I0(\FSM_sequential_fifo_wr_stm_reg[0]_0 ),
        .I1(\r_FIFO_COUNT_reg[5]_0 ),
        .I2(\r_FIFO_COUNT_reg[1]_0 ),
        .I3(\r_FIFO_COUNT_reg[1]_1 ),
        .O(\FSM_sequential_fifo_wr_stm_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \FSM_sequential_fifo_wr_stm[1]_i_10 
       (.I0(r_FIFO_COUNT_reg[6]),
        .I1(r_FIFO_COUNT_reg[5]),
        .I2(r_FIFO_COUNT_reg[1]),
        .O(\FSM_sequential_fifo_wr_stm_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT4 #(
    .INIT(16'hFFFB)) 
    \FSM_sequential_fifo_wr_stm[2]_i_9 
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[5]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(\r_RD_INDEX_reg[4]_0 ),
        .O(\FSM_sequential_fifo_wr_stm_reg[0]_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__8_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__8_n_0,p_0_out_carry_i_3__8_n_0,p_0_out_carry_i_4__8_n_0,p_0_out_carry_i_5__9_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry__0
       (.CI(p_0_out_carry_n_0),
        .CO({NLW_p_0_out_carry__0_CO_UNCONNECTED[3:1],p_0_out_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,r_FIFO_COUNT_reg[4]}),
        .O({NLW_p_0_out_carry__0_O_UNCONNECTED[3:2],p_0_out_carry__0_n_6,p_0_out_carry__0_n_7}),
        .S({1'b0,1'b0,p_0_out_carry__0_i_1__8_n_0,p_0_out_carry__0_i_2__8_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_1__8
       (.I0(r_FIFO_COUNT_reg[5]),
        .I1(r_FIFO_COUNT_reg[6]),
        .O(p_0_out_carry__0_i_1__8_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_2__8
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[5]),
        .O(p_0_out_carry__0_i_2__8_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    p_0_out_carry_i_1__8
       (.I0(r_FIFO_COUNT_reg[1]),
        .O(p_0_out_carry_i_1__8_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_2__8
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[4]),
        .O(p_0_out_carry_i_2__8_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_3__8
       (.I0(r_FIFO_COUNT_reg[2]),
        .I1(r_FIFO_COUNT_reg[3]),
        .O(p_0_out_carry_i_3__8_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_4__8
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[2]),
        .O(p_0_out_carry_i_4__8_n_0));
  LUT6 #(
    .INIT(64'hAA9AAAAA55555555)) 
    p_0_out_carry_i_5__9
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(\cnt_fifo_reg[6] ),
        .I2(rd_en),
        .I3(address[2]),
        .I4(address[3]),
        .I5(wr_en_reg),
        .O(p_0_out_carry_i_5__9_n_0));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__8 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__8_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA6AAAAAAAAAA)) 
    \r_FIFO_COUNT[6]_i_1__9 
       (.I0(wr_en_reg),
        .I1(address[3]),
        .I2(address[2]),
        .I3(rd_en),
        .I4(address[1]),
        .I5(address[0]),
        .O(\r_FIFO_COUNT[6]_i_1__9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__9_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__8_n_0 ),
        .Q(r_FIFO_COUNT_reg[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[1] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__9_n_0 ),
        .D(p_0_out_carry_n_7),
        .Q(r_FIFO_COUNT_reg[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[2] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__9_n_0 ),
        .D(p_0_out_carry_n_6),
        .Q(r_FIFO_COUNT_reg[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[3] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__9_n_0 ),
        .D(p_0_out_carry_n_5),
        .Q(r_FIFO_COUNT_reg[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[4] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__9_n_0 ),
        .D(p_0_out_carry_n_4),
        .Q(r_FIFO_COUNT_reg[4]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[5] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__9_n_0 ),
        .D(p_0_out_carry__0_n_7),
        .Q(r_FIFO_COUNT_reg[5]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[6] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__9_n_0 ),
        .D(p_0_out_carry__0_n_6),
        .Q(r_FIFO_COUNT_reg[6]),
        .R(AR));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_0_5
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[1:0]),
        .DIB(Q[3:2]),
        .DIC(Q[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[1:0]),
        .DOB(o_rd_data[3:2]),
        .DOC(o_rd_data[5:4]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_6_11
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[7:6]),
        .DIB(Q[9:8]),
        .DIC(Q[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[7:6]),
        .DOB(o_rd_data[9:8]),
        .DOC(o_rd_data[11:10]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    \r_RD_INDEX[0]_i_1__8 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1__8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__8 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__8 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__8_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \r_RD_INDEX[3]_i_1__9 
       (.I0(\r_RD_INDEX[3]_i_3__12_n_0 ),
        .I1(r_FIFO_COUNT_reg[1]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(r_FIFO_COUNT_reg[5]),
        .I4(\r_RD_INDEX_reg[4]_0 ),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__8 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__8_n_0 ));
  LUT5 #(
    .INIT(32'h00200000)) 
    \r_RD_INDEX[3]_i_3__12 
       (.I0(address[0]),
        .I1(address[1]),
        .I2(rd_en),
        .I3(address[2]),
        .I4(address[3]),
        .O(\r_RD_INDEX[3]_i_3__12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_RD_INDEX[4]_i_1__8 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[4]),
        .I2(r_RD_INDEX[0]),
        .I3(r_RD_INDEX[1]),
        .I4(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[4]_i_1__8_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[0]_i_1__8_n_0 ),
        .Q(r_RD_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[1] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[1]_i_1__8_n_0 ),
        .Q(r_RD_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[2] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[2]_i_1__8_n_0 ),
        .Q(r_RD_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[3] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[3]_i_2__8_n_0 ),
        .Q(r_RD_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[4] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[4]_i_1__8_n_0 ),
        .Q(r_RD_INDEX[4]),
        .R(AR));
  LUT1 #(
    .INIT(2'h1)) 
    \r_WR_INDEX[0]_i_1__8 
       (.I0(r_WR_INDEX[0]),
        .O(\r_WR_INDEX[0]_i_1__8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEF0000)) 
    \r_WR_INDEX[4]_i_1__8 
       (.I0(\r_RD_INDEX_reg[4]_0 ),
        .I1(r_FIFO_COUNT_reg[6]),
        .I2(r_FIFO_COUNT_reg[5]),
        .I3(r_FIFO_COUNT_reg[1]),
        .I4(wr_en_reg),
        .O(\r_WR_INDEX[4]_i_1__8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_WR_INDEX[4]_i_2 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[4]),
        .I2(r_WR_INDEX[0]),
        .I3(r_WR_INDEX[1]),
        .I4(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \r_WR_INDEX[4]_i_3__8 
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[2]),
        .I2(r_FIFO_COUNT_reg[0]),
        .I3(r_FIFO_COUNT_reg[4]),
        .O(\r_RD_INDEX_reg[4]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__8_n_0 ),
        .D(\r_WR_INDEX[0]_i_1__8_n_0 ),
        .Q(r_WR_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[1] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__8_n_0 ),
        .D(\r_WR_INDEX[1]_i_1_n_0 ),
        .Q(r_WR_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[2] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__8_n_0 ),
        .D(\r_WR_INDEX[2]_i_1_n_0 ),
        .Q(r_WR_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[3] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__8_n_0 ),
        .D(\r_WR_INDEX[3]_i_1_n_0 ),
        .Q(r_WR_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[4] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__8_n_0 ),
        .D(\r_WR_INDEX[4]_i_2_n_0 ),
        .Q(r_WR_INDEX[4]),
        .R(AR));
endmodule

(* ORIG_REF_NAME = "module_fifo_regs_no_flags" *) 
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_2
   (\r_WR_INDEX_reg[0]_0 ,
    \FSM_sequential_fifo_wr_stm_reg[1] ,
    o_rd_data,
    AR,
    CLK,
    \cnt_fifo_reg[5] ,
    rd_en,
    address,
    wr_en_reg,
    \r_FIFO_COUNT_reg[0]_0 ,
    \r_FIFO_COUNT_reg[2]_0 ,
    p_0_in,
    Q);
  output \r_WR_INDEX_reg[0]_0 ;
  output \FSM_sequential_fifo_wr_stm_reg[1] ;
  output [11:0]o_rd_data;
  input [0:0]AR;
  input CLK;
  input \cnt_fifo_reg[5] ;
  input rd_en;
  input [3:0]address;
  input wr_en_reg;
  input \r_FIFO_COUNT_reg[0]_0 ;
  input \r_FIFO_COUNT_reg[2]_0 ;
  input p_0_in;
  input [11:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire \FSM_sequential_fifo_wr_stm[1]_i_11_n_0 ;
  wire \FSM_sequential_fifo_wr_stm_reg[1] ;
  wire [11:0]Q;
  wire [3:0]address;
  wire \cnt_fifo_reg[5] ;
  wire [11:0]o_rd_data;
  wire p_0_in;
  wire p_0_out_carry__0_i_1__11_n_0;
  wire p_0_out_carry__0_i_2__11_n_0;
  wire p_0_out_carry__0_n_3;
  wire p_0_out_carry__0_n_6;
  wire p_0_out_carry__0_n_7;
  wire p_0_out_carry_i_1__11_n_0;
  wire p_0_out_carry_i_2__11_n_0;
  wire p_0_out_carry_i_3__11_n_0;
  wire p_0_out_carry_i_4__11_n_0;
  wire p_0_out_carry_i_5__1_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__11_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__1_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire \r_FIFO_COUNT_reg[0]_0 ;
  wire \r_FIFO_COUNT_reg[2]_0 ;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__11_n_0 ;
  wire \r_RD_INDEX[1]_i_1__11_n_0 ;
  wire \r_RD_INDEX[2]_i_1__11_n_0 ;
  wire \r_RD_INDEX[3]_i_2__11_n_0 ;
  wire \r_RD_INDEX[3]_i_3__10_n_0 ;
  wire \r_RD_INDEX[3]_i_4__2_n_0 ;
  wire \r_RD_INDEX[4]_i_1__11_n_0 ;
  wire [4:0]r_WR_INDEX;
  wire \r_WR_INDEX[0]_i_1__11_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_1__11_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire \r_WR_INDEX[4]_i_4__8_n_0 ;
  wire \r_WR_INDEX_reg[0]_0 ;
  wire rd_en;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_fifo_wr_stm[1]_i_11 
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[2]),
        .I2(r_FIFO_COUNT_reg[0]),
        .I3(r_FIFO_COUNT_reg[4]),
        .O(\FSM_sequential_fifo_wr_stm[1]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEF)) 
    \FSM_sequential_fifo_wr_stm[1]_i_6 
       (.I0(\FSM_sequential_fifo_wr_stm[1]_i_11_n_0 ),
        .I1(r_FIFO_COUNT_reg[6]),
        .I2(r_FIFO_COUNT_reg[5]),
        .I3(r_FIFO_COUNT_reg[1]),
        .I4(\r_FIFO_COUNT_reg[0]_0 ),
        .I5(\r_FIFO_COUNT_reg[2]_0 ),
        .O(\FSM_sequential_fifo_wr_stm_reg[1] ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__11_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__11_n_0,p_0_out_carry_i_3__11_n_0,p_0_out_carry_i_4__11_n_0,p_0_out_carry_i_5__1_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry__0
       (.CI(p_0_out_carry_n_0),
        .CO({NLW_p_0_out_carry__0_CO_UNCONNECTED[3:1],p_0_out_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,r_FIFO_COUNT_reg[4]}),
        .O({NLW_p_0_out_carry__0_O_UNCONNECTED[3:2],p_0_out_carry__0_n_6,p_0_out_carry__0_n_7}),
        .S({1'b0,1'b0,p_0_out_carry__0_i_1__11_n_0,p_0_out_carry__0_i_2__11_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_1__11
       (.I0(r_FIFO_COUNT_reg[5]),
        .I1(r_FIFO_COUNT_reg[6]),
        .O(p_0_out_carry__0_i_1__11_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_2__11
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[5]),
        .O(p_0_out_carry__0_i_2__11_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    p_0_out_carry_i_1__11
       (.I0(r_FIFO_COUNT_reg[1]),
        .O(p_0_out_carry_i_1__11_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_2__11
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[4]),
        .O(p_0_out_carry_i_2__11_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_3__11
       (.I0(r_FIFO_COUNT_reg[2]),
        .I1(r_FIFO_COUNT_reg[3]),
        .O(p_0_out_carry_i_3__11_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_4__11
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[2]),
        .O(p_0_out_carry_i_4__11_n_0));
  LUT6 #(
    .INIT(64'h9AAAAAAA55555555)) 
    p_0_out_carry_i_5__1
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(\cnt_fifo_reg[5] ),
        .I2(rd_en),
        .I3(address[3]),
        .I4(address[2]),
        .I5(wr_en_reg),
        .O(p_0_out_carry_i_5__1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__11 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__11_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAA6AAA)) 
    \r_FIFO_COUNT[6]_i_1__1 
       (.I0(wr_en_reg),
        .I1(address[2]),
        .I2(address[3]),
        .I3(rd_en),
        .I4(address[0]),
        .I5(address[1]),
        .O(\r_FIFO_COUNT[6]_i_1__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__1_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__11_n_0 ),
        .Q(r_FIFO_COUNT_reg[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[1] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__1_n_0 ),
        .D(p_0_out_carry_n_7),
        .Q(r_FIFO_COUNT_reg[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[2] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__1_n_0 ),
        .D(p_0_out_carry_n_6),
        .Q(r_FIFO_COUNT_reg[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[3] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__1_n_0 ),
        .D(p_0_out_carry_n_5),
        .Q(r_FIFO_COUNT_reg[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[4] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__1_n_0 ),
        .D(p_0_out_carry_n_4),
        .Q(r_FIFO_COUNT_reg[4]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[5] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__1_n_0 ),
        .D(p_0_out_carry__0_n_7),
        .Q(r_FIFO_COUNT_reg[5]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[6] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__1_n_0 ),
        .D(p_0_out_carry__0_n_6),
        .Q(r_FIFO_COUNT_reg[6]),
        .R(AR));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_0_5
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[1:0]),
        .DIB(Q[3:2]),
        .DIC(Q[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[1:0]),
        .DOB(o_rd_data[3:2]),
        .DOC(o_rd_data[5:4]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_6_11
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[7:6]),
        .DIB(Q[9:8]),
        .DIC(Q[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[7:6]),
        .DOB(o_rd_data[9:8]),
        .DOC(o_rd_data[11:10]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    \r_RD_INDEX[0]_i_1__11 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1__11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__11 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__11 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__11_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \r_RD_INDEX[3]_i_1__1 
       (.I0(\r_RD_INDEX[3]_i_3__10_n_0 ),
        .I1(\r_RD_INDEX[3]_i_4__2_n_0 ),
        .I2(r_FIFO_COUNT_reg[1]),
        .I3(r_FIFO_COUNT_reg[0]),
        .I4(r_FIFO_COUNT_reg[4]),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__11 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__11_n_0 ));
  LUT5 #(
    .INIT(32'h10000000)) 
    \r_RD_INDEX[3]_i_3__10 
       (.I0(address[1]),
        .I1(address[0]),
        .I2(rd_en),
        .I3(address[3]),
        .I4(address[2]),
        .O(\r_RD_INDEX[3]_i_3__10_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \r_RD_INDEX[3]_i_4__2 
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[2]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(r_FIFO_COUNT_reg[5]),
        .O(\r_RD_INDEX[3]_i_4__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_RD_INDEX[4]_i_1__11 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[4]),
        .I2(r_RD_INDEX[0]),
        .I3(r_RD_INDEX[1]),
        .I4(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[4]_i_1__11_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[0]_i_1__11_n_0 ),
        .Q(r_RD_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[1] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[1]_i_1__11_n_0 ),
        .Q(r_RD_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[2] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[2]_i_1__11_n_0 ),
        .Q(r_RD_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[3] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[3]_i_2__11_n_0 ),
        .Q(r_RD_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[4] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[4]_i_1__11_n_0 ),
        .Q(r_RD_INDEX[4]),
        .R(AR));
  LUT1 #(
    .INIT(2'h1)) 
    \r_WR_INDEX[0]_i_1__11 
       (.I0(r_WR_INDEX[0]),
        .O(\r_WR_INDEX[0]_i_1__11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \r_WR_INDEX[4]_i_1__11 
       (.I0(\r_WR_INDEX_reg[0]_0 ),
        .I1(wr_en_reg),
        .O(\r_WR_INDEX[4]_i_1__11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_WR_INDEX[4]_i_2 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[4]),
        .I2(r_WR_INDEX[0]),
        .I3(r_WR_INDEX[1]),
        .I4(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    \r_WR_INDEX[4]_i_3__11 
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[5]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(\r_WR_INDEX[4]_i_4__8_n_0 ),
        .I4(r_FIFO_COUNT_reg[2]),
        .I5(r_FIFO_COUNT_reg[3]),
        .O(\r_WR_INDEX_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \r_WR_INDEX[4]_i_4__8 
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[0]),
        .O(\r_WR_INDEX[4]_i_4__8_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__11_n_0 ),
        .D(\r_WR_INDEX[0]_i_1__11_n_0 ),
        .Q(r_WR_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[1] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__11_n_0 ),
        .D(\r_WR_INDEX[1]_i_1_n_0 ),
        .Q(r_WR_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[2] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__11_n_0 ),
        .D(\r_WR_INDEX[2]_i_1_n_0 ),
        .Q(r_WR_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[3] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__11_n_0 ),
        .D(\r_WR_INDEX[3]_i_1_n_0 ),
        .Q(r_WR_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[4] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__11_n_0 ),
        .D(\r_WR_INDEX[4]_i_2_n_0 ),
        .Q(r_WR_INDEX[4]),
        .R(AR));
endmodule

(* ORIG_REF_NAME = "module_fifo_regs_no_flags" *) 
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_3
   (\r_FIFO_COUNT_reg[4]_0 ,
    \r_WR_INDEX_reg[0]_0 ,
    \FSM_sequential_fifo_wr_stm_reg[1] ,
    \FSM_sequential_fifo_wr_stm_reg[0] ,
    \FSM_sequential_fifo_wr_stm_reg[0]_0 ,
    o_rd_data,
    AR,
    CLK,
    rd_en,
    address,
    wr_en_reg,
    \r_FIFO_COUNT_reg[1]_0 ,
    \r_FIFO_COUNT_reg[1]_1 ,
    \r_FIFO_COUNT_reg[1]_2 ,
    p_0_in,
    Q);
  output \r_FIFO_COUNT_reg[4]_0 ;
  output \r_WR_INDEX_reg[0]_0 ;
  output \FSM_sequential_fifo_wr_stm_reg[1] ;
  output \FSM_sequential_fifo_wr_stm_reg[0] ;
  output \FSM_sequential_fifo_wr_stm_reg[0]_0 ;
  output [11:0]o_rd_data;
  input [0:0]AR;
  input CLK;
  input rd_en;
  input [3:0]address;
  input wr_en_reg;
  input \r_FIFO_COUNT_reg[1]_0 ;
  input \r_FIFO_COUNT_reg[1]_1 ;
  input \r_FIFO_COUNT_reg[1]_2 ;
  input p_0_in;
  input [11:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire \FSM_sequential_fifo_wr_stm[0]_i_11_n_0 ;
  wire \FSM_sequential_fifo_wr_stm_reg[0] ;
  wire \FSM_sequential_fifo_wr_stm_reg[0]_0 ;
  wire \FSM_sequential_fifo_wr_stm_reg[1] ;
  wire [11:0]Q;
  wire [3:0]address;
  wire [11:0]o_rd_data;
  wire p_0_in;
  wire p_0_out_carry__0_i_1__12_n_0;
  wire p_0_out_carry__0_i_2__12_n_0;
  wire p_0_out_carry__0_n_3;
  wire p_0_out_carry__0_n_6;
  wire p_0_out_carry__0_n_7;
  wire p_0_out_carry_i_1__12_n_0;
  wire p_0_out_carry_i_2__12_n_0;
  wire p_0_out_carry_i_3__12_n_0;
  wire p_0_out_carry_i_4__12_n_0;
  wire p_0_out_carry_i_5__10_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__12_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__10_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire \r_FIFO_COUNT_reg[1]_0 ;
  wire \r_FIFO_COUNT_reg[1]_1 ;
  wire \r_FIFO_COUNT_reg[1]_2 ;
  wire \r_FIFO_COUNT_reg[4]_0 ;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__12_n_0 ;
  wire \r_RD_INDEX[1]_i_1__12_n_0 ;
  wire \r_RD_INDEX[2]_i_1__12_n_0 ;
  wire \r_RD_INDEX[3]_i_2__12_n_0 ;
  wire \r_RD_INDEX[3]_i_3__13_n_0 ;
  wire \r_RD_INDEX[3]_i_4__3_n_0 ;
  wire \r_RD_INDEX[4]_i_1__12_n_0 ;
  wire [4:0]r_WR_INDEX;
  wire \r_WR_INDEX[0]_i_1__12_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_1__12_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire \r_WR_INDEX[4]_i_4__9_n_0 ;
  wire \r_WR_INDEX_reg[0]_0 ;
  wire rd_en;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'hFFFB)) 
    \FSM_sequential_fifo_wr_stm[0]_i_11 
       (.I0(\FSM_sequential_fifo_wr_stm_reg[0]_0 ),
        .I1(r_FIFO_COUNT_reg[5]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(r_FIFO_COUNT_reg[0]),
        .O(\FSM_sequential_fifo_wr_stm[0]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_fifo_wr_stm[0]_i_8 
       (.I0(\FSM_sequential_fifo_wr_stm[0]_i_11_n_0 ),
        .I1(\r_FIFO_COUNT_reg[1]_0 ),
        .I2(\r_FIFO_COUNT_reg[1]_1 ),
        .I3(\r_FIFO_COUNT_reg[1]_2 ),
        .O(\FSM_sequential_fifo_wr_stm_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \FSM_sequential_fifo_wr_stm[1]_i_12 
       (.I0(r_FIFO_COUNT_reg[0]),
        .I1(r_FIFO_COUNT_reg[6]),
        .I2(r_FIFO_COUNT_reg[5]),
        .O(\FSM_sequential_fifo_wr_stm_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_fifo_wr_stm[1]_i_13 
       (.I0(r_FIFO_COUNT_reg[2]),
        .I1(r_FIFO_COUNT_reg[1]),
        .I2(r_FIFO_COUNT_reg[4]),
        .I3(r_FIFO_COUNT_reg[3]),
        .O(\FSM_sequential_fifo_wr_stm_reg[0]_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__12_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__12_n_0,p_0_out_carry_i_3__12_n_0,p_0_out_carry_i_4__12_n_0,p_0_out_carry_i_5__10_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry__0
       (.CI(p_0_out_carry_n_0),
        .CO({NLW_p_0_out_carry__0_CO_UNCONNECTED[3:1],p_0_out_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,r_FIFO_COUNT_reg[4]}),
        .O({NLW_p_0_out_carry__0_O_UNCONNECTED[3:2],p_0_out_carry__0_n_6,p_0_out_carry__0_n_7}),
        .S({1'b0,1'b0,p_0_out_carry__0_i_1__12_n_0,p_0_out_carry__0_i_2__12_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_1__12
       (.I0(r_FIFO_COUNT_reg[5]),
        .I1(r_FIFO_COUNT_reg[6]),
        .O(p_0_out_carry__0_i_1__12_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_2__12
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[5]),
        .O(p_0_out_carry__0_i_2__12_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    p_0_out_carry_i_1__12
       (.I0(r_FIFO_COUNT_reg[1]),
        .O(p_0_out_carry_i_1__12_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_2__12
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[4]),
        .O(p_0_out_carry_i_2__12_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_3__12
       (.I0(r_FIFO_COUNT_reg[2]),
        .I1(r_FIFO_COUNT_reg[3]),
        .O(p_0_out_carry_i_3__12_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_4__12
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[2]),
        .O(p_0_out_carry_i_4__12_n_0));
  LUT6 #(
    .INIT(64'h9AAAAAAA55555555)) 
    p_0_out_carry_i_5__10
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(\r_FIFO_COUNT_reg[4]_0 ),
        .I2(rd_en),
        .I3(address[3]),
        .I4(address[2]),
        .I5(wr_en_reg),
        .O(p_0_out_carry_i_5__10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'hB)) 
    p_0_out_carry_i_6__2
       (.I0(address[1]),
        .I1(address[0]),
        .O(\r_FIFO_COUNT_reg[4]_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__12 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__12_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA6AAAAAAAAAAA)) 
    \r_FIFO_COUNT[6]_i_1__10 
       (.I0(wr_en_reg),
        .I1(address[2]),
        .I2(address[3]),
        .I3(rd_en),
        .I4(address[1]),
        .I5(address[0]),
        .O(\r_FIFO_COUNT[6]_i_1__10_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__10_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__12_n_0 ),
        .Q(r_FIFO_COUNT_reg[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[1] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__10_n_0 ),
        .D(p_0_out_carry_n_7),
        .Q(r_FIFO_COUNT_reg[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[2] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__10_n_0 ),
        .D(p_0_out_carry_n_6),
        .Q(r_FIFO_COUNT_reg[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[3] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__10_n_0 ),
        .D(p_0_out_carry_n_5),
        .Q(r_FIFO_COUNT_reg[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[4] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__10_n_0 ),
        .D(p_0_out_carry_n_4),
        .Q(r_FIFO_COUNT_reg[4]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[5] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__10_n_0 ),
        .D(p_0_out_carry__0_n_7),
        .Q(r_FIFO_COUNT_reg[5]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[6] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__10_n_0 ),
        .D(p_0_out_carry__0_n_6),
        .Q(r_FIFO_COUNT_reg[6]),
        .R(AR));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_0_5
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[1:0]),
        .DIB(Q[3:2]),
        .DIC(Q[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[1:0]),
        .DOB(o_rd_data[3:2]),
        .DOC(o_rd_data[5:4]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_6_11
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[7:6]),
        .DIB(Q[9:8]),
        .DIC(Q[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[7:6]),
        .DOB(o_rd_data[9:8]),
        .DOC(o_rd_data[11:10]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    \r_RD_INDEX[0]_i_1__12 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1__12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__12 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__12 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__12_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \r_RD_INDEX[3]_i_1__10 
       (.I0(\r_RD_INDEX[3]_i_3__13_n_0 ),
        .I1(\r_RD_INDEX[3]_i_4__3_n_0 ),
        .I2(r_FIFO_COUNT_reg[1]),
        .I3(r_FIFO_COUNT_reg[0]),
        .I4(r_FIFO_COUNT_reg[4]),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__12 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'h20000000)) 
    \r_RD_INDEX[3]_i_3__13 
       (.I0(address[0]),
        .I1(address[1]),
        .I2(rd_en),
        .I3(address[3]),
        .I4(address[2]),
        .O(\r_RD_INDEX[3]_i_3__13_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \r_RD_INDEX[3]_i_4__3 
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[2]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(r_FIFO_COUNT_reg[5]),
        .O(\r_RD_INDEX[3]_i_4__3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_RD_INDEX[4]_i_1__12 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[4]),
        .I2(r_RD_INDEX[0]),
        .I3(r_RD_INDEX[1]),
        .I4(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[4]_i_1__12_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[0]_i_1__12_n_0 ),
        .Q(r_RD_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[1] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[1]_i_1__12_n_0 ),
        .Q(r_RD_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[2] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[2]_i_1__12_n_0 ),
        .Q(r_RD_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[3] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[3]_i_2__12_n_0 ),
        .Q(r_RD_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[4] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[4]_i_1__12_n_0 ),
        .Q(r_RD_INDEX[4]),
        .R(AR));
  LUT1 #(
    .INIT(2'h1)) 
    \r_WR_INDEX[0]_i_1__12 
       (.I0(r_WR_INDEX[0]),
        .O(\r_WR_INDEX[0]_i_1__12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \r_WR_INDEX[4]_i_1__12 
       (.I0(\r_WR_INDEX_reg[0]_0 ),
        .I1(wr_en_reg),
        .O(\r_WR_INDEX[4]_i_1__12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_WR_INDEX[4]_i_2 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[4]),
        .I2(r_WR_INDEX[0]),
        .I3(r_WR_INDEX[1]),
        .I4(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    \r_WR_INDEX[4]_i_3__12 
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[5]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(\r_WR_INDEX[4]_i_4__9_n_0 ),
        .I4(r_FIFO_COUNT_reg[2]),
        .I5(r_FIFO_COUNT_reg[3]),
        .O(\r_WR_INDEX_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \r_WR_INDEX[4]_i_4__9 
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[0]),
        .O(\r_WR_INDEX[4]_i_4__9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__12_n_0 ),
        .D(\r_WR_INDEX[0]_i_1__12_n_0 ),
        .Q(r_WR_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[1] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__12_n_0 ),
        .D(\r_WR_INDEX[1]_i_1_n_0 ),
        .Q(r_WR_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[2] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__12_n_0 ),
        .D(\r_WR_INDEX[2]_i_1_n_0 ),
        .Q(r_WR_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[3] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__12_n_0 ),
        .D(\r_WR_INDEX[3]_i_1_n_0 ),
        .Q(r_WR_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[4] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__12_n_0 ),
        .D(\r_WR_INDEX[4]_i_2_n_0 ),
        .Q(r_WR_INDEX[4]),
        .R(AR));
endmodule

(* ORIG_REF_NAME = "module_fifo_regs_no_flags" *) 
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_4
   (\r_WR_INDEX_reg[0]_0 ,
    p_0_in,
    o_rd_data,
    AR,
    CLK,
    wr_en_reg,
    address,
    rd_en,
    nRST,
    Q);
  output \r_WR_INDEX_reg[0]_0 ;
  output p_0_in;
  output [11:0]o_rd_data;
  input [0:0]AR;
  input CLK;
  input wr_en_reg;
  input [3:0]address;
  input rd_en;
  input nRST;
  input [11:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire [11:0]Q;
  wire [3:0]address;
  wire nRST;
  wire [11:0]o_rd_data;
  wire p_0_in;
  wire p_0_out_carry__0_i_1__13_n_0;
  wire p_0_out_carry__0_i_2__13_n_0;
  wire p_0_out_carry__0_n_3;
  wire p_0_out_carry__0_n_6;
  wire p_0_out_carry__0_n_7;
  wire p_0_out_carry_i_1__13_n_0;
  wire p_0_out_carry_i_2__13_n_0;
  wire p_0_out_carry_i_3__13_n_0;
  wire p_0_out_carry_i_4__13_n_0;
  wire p_0_out_carry_i_5__14_n_0;
  wire p_0_out_carry_i_6__8_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__13_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__14_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__13_n_0 ;
  wire \r_RD_INDEX[1]_i_1__13_n_0 ;
  wire \r_RD_INDEX[2]_i_1__13_n_0 ;
  wire \r_RD_INDEX[3]_i_2__13_n_0 ;
  wire \r_RD_INDEX[3]_i_3__7_n_0 ;
  wire \r_RD_INDEX[4]_i_1__13_n_0 ;
  wire [4:0]r_WR_INDEX;
  wire \r_WR_INDEX[0]_i_1__13_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_1__13_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire \r_WR_INDEX[4]_i_4__10_n_0 ;
  wire \r_WR_INDEX_reg[0]_0 ;
  wire rd_en;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__13_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__13_n_0,p_0_out_carry_i_3__13_n_0,p_0_out_carry_i_4__13_n_0,p_0_out_carry_i_5__14_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry__0
       (.CI(p_0_out_carry_n_0),
        .CO({NLW_p_0_out_carry__0_CO_UNCONNECTED[3:1],p_0_out_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,r_FIFO_COUNT_reg[4]}),
        .O({NLW_p_0_out_carry__0_O_UNCONNECTED[3:2],p_0_out_carry__0_n_6,p_0_out_carry__0_n_7}),
        .S({1'b0,1'b0,p_0_out_carry__0_i_1__13_n_0,p_0_out_carry__0_i_2__13_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_1__13
       (.I0(r_FIFO_COUNT_reg[5]),
        .I1(r_FIFO_COUNT_reg[6]),
        .O(p_0_out_carry__0_i_1__13_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_2__13
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[5]),
        .O(p_0_out_carry__0_i_2__13_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    p_0_out_carry_i_1__13
       (.I0(r_FIFO_COUNT_reg[1]),
        .O(p_0_out_carry_i_1__13_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_2__13
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[4]),
        .O(p_0_out_carry_i_2__13_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_3__13
       (.I0(r_FIFO_COUNT_reg[2]),
        .I1(r_FIFO_COUNT_reg[3]),
        .O(p_0_out_carry_i_3__13_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_4__13
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[2]),
        .O(p_0_out_carry_i_4__13_n_0));
  LUT3 #(
    .INIT(8'h65)) 
    p_0_out_carry_i_5__14
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(p_0_out_carry_i_6__8_n_0),
        .I2(wr_en_reg),
        .O(p_0_out_carry_i_5__14_n_0));
  LUT5 #(
    .INIT(32'h40000000)) 
    p_0_out_carry_i_6__8
       (.I0(address[0]),
        .I1(address[1]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(rd_en),
        .O(p_0_out_carry_i_6__8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__13 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__13_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAA6AAAAAAA)) 
    \r_FIFO_COUNT[6]_i_1__14 
       (.I0(wr_en_reg),
        .I1(rd_en),
        .I2(address[3]),
        .I3(address[2]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\r_FIFO_COUNT[6]_i_1__14_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__14_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__13_n_0 ),
        .Q(r_FIFO_COUNT_reg[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[1] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__14_n_0 ),
        .D(p_0_out_carry_n_7),
        .Q(r_FIFO_COUNT_reg[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[2] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__14_n_0 ),
        .D(p_0_out_carry_n_6),
        .Q(r_FIFO_COUNT_reg[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[3] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__14_n_0 ),
        .D(p_0_out_carry_n_5),
        .Q(r_FIFO_COUNT_reg[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[4] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__14_n_0 ),
        .D(p_0_out_carry_n_4),
        .Q(r_FIFO_COUNT_reg[4]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[5] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__14_n_0 ),
        .D(p_0_out_carry__0_n_7),
        .Q(r_FIFO_COUNT_reg[5]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[6] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__14_n_0 ),
        .D(p_0_out_carry__0_n_6),
        .Q(r_FIFO_COUNT_reg[6]),
        .R(AR));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_0_5
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[1:0]),
        .DIB(Q[3:2]),
        .DIC(Q[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[1:0]),
        .DOB(o_rd_data[3:2]),
        .DOC(o_rd_data[5:4]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  LUT2 #(
    .INIT(4'h8)) 
    r_FIFO_DATA_reg_0_31_0_5_i_1
       (.I0(wr_en_reg),
        .I1(nRST),
        .O(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_6_11
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[7:6]),
        .DIB(Q[9:8]),
        .DIC(Q[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[7:6]),
        .DOB(o_rd_data[9:8]),
        .DOC(o_rd_data[11:10]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    \r_RD_INDEX[0]_i_1__13 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1__13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__13 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__13 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__13_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \r_RD_INDEX[3]_i_1__14 
       (.I0(p_0_out_carry_i_6__8_n_0),
        .I1(\r_RD_INDEX[3]_i_3__7_n_0 ),
        .I2(r_FIFO_COUNT_reg[1]),
        .I3(r_FIFO_COUNT_reg[0]),
        .I4(r_FIFO_COUNT_reg[4]),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__13 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__13_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \r_RD_INDEX[3]_i_3__7 
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[2]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(r_FIFO_COUNT_reg[5]),
        .O(\r_RD_INDEX[3]_i_3__7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_RD_INDEX[4]_i_1__13 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[4]),
        .I2(r_RD_INDEX[0]),
        .I3(r_RD_INDEX[1]),
        .I4(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[4]_i_1__13_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[0]_i_1__13_n_0 ),
        .Q(r_RD_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[1] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[1]_i_1__13_n_0 ),
        .Q(r_RD_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[2] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[2]_i_1__13_n_0 ),
        .Q(r_RD_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[3] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[3]_i_2__13_n_0 ),
        .Q(r_RD_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[4] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[4]_i_1__13_n_0 ),
        .Q(r_RD_INDEX[4]),
        .R(AR));
  LUT1 #(
    .INIT(2'h1)) 
    \r_WR_INDEX[0]_i_1__13 
       (.I0(r_WR_INDEX[0]),
        .O(\r_WR_INDEX[0]_i_1__13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \r_WR_INDEX[4]_i_1__13 
       (.I0(\r_WR_INDEX_reg[0]_0 ),
        .I1(wr_en_reg),
        .O(\r_WR_INDEX[4]_i_1__13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_WR_INDEX[4]_i_2 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[4]),
        .I2(r_WR_INDEX[0]),
        .I3(r_WR_INDEX[1]),
        .I4(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    \r_WR_INDEX[4]_i_3__13 
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[5]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(\r_WR_INDEX[4]_i_4__10_n_0 ),
        .I4(r_FIFO_COUNT_reg[2]),
        .I5(r_FIFO_COUNT_reg[3]),
        .O(\r_WR_INDEX_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \r_WR_INDEX[4]_i_4__10 
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[0]),
        .O(\r_WR_INDEX[4]_i_4__10_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__13_n_0 ),
        .D(\r_WR_INDEX[0]_i_1__13_n_0 ),
        .Q(r_WR_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[1] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__13_n_0 ),
        .D(\r_WR_INDEX[1]_i_1_n_0 ),
        .Q(r_WR_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[2] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__13_n_0 ),
        .D(\r_WR_INDEX[2]_i_1_n_0 ),
        .Q(r_WR_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[3] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__13_n_0 ),
        .D(\r_WR_INDEX[3]_i_1_n_0 ),
        .Q(r_WR_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[4] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__13_n_0 ),
        .D(\r_WR_INDEX[4]_i_2_n_0 ),
        .Q(r_WR_INDEX[4]),
        .R(AR));
endmodule

(* ORIG_REF_NAME = "module_fifo_regs_no_flags" *) 
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_5
   (\WDONBR_intl_reg[0] ,
    \DataOut_stall_reg[11] ,
    \DataOut_stall_reg[10] ,
    \DataOut_stall_reg[9] ,
    \DataOut_stall_reg[8] ,
    \DataOut_stall_reg[7] ,
    \DataOut_stall_reg[6] ,
    \DataOut_stall_reg[5] ,
    \DataOut_stall_reg[4] ,
    \DataOut_stall_reg[3] ,
    \DataOut_stall_reg[2] ,
    \DataOut_stall_reg[1] ,
    \DataOut_stall_reg[0] ,
    AR,
    CLK,
    wr_en_reg,
    rd_en,
    address,
    o_rd_data,
    \wr_data_reg[13][7] ,
    \wr_data_reg[12][7] ,
    p_0_in,
    Q);
  output \WDONBR_intl_reg[0] ;
  output \DataOut_stall_reg[11] ;
  output \DataOut_stall_reg[10] ;
  output \DataOut_stall_reg[9] ;
  output \DataOut_stall_reg[8] ;
  output \DataOut_stall_reg[7] ;
  output \DataOut_stall_reg[6] ;
  output \DataOut_stall_reg[5] ;
  output \DataOut_stall_reg[4] ;
  output \DataOut_stall_reg[3] ;
  output \DataOut_stall_reg[2] ;
  output \DataOut_stall_reg[1] ;
  output \DataOut_stall_reg[0] ;
  input [0:0]AR;
  input CLK;
  input wr_en_reg;
  input rd_en;
  input [3:0]address;
  input [11:0]o_rd_data;
  input [11:0]\wr_data_reg[13][7] ;
  input [11:0]\wr_data_reg[12][7] ;
  input p_0_in;
  input [11:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire \DataOut_stall_reg[0] ;
  wire \DataOut_stall_reg[10] ;
  wire \DataOut_stall_reg[11] ;
  wire \DataOut_stall_reg[1] ;
  wire \DataOut_stall_reg[2] ;
  wire \DataOut_stall_reg[3] ;
  wire \DataOut_stall_reg[4] ;
  wire \DataOut_stall_reg[5] ;
  wire \DataOut_stall_reg[6] ;
  wire \DataOut_stall_reg[7] ;
  wire \DataOut_stall_reg[8] ;
  wire \DataOut_stall_reg[9] ;
  wire [11:0]Q;
  wire \WDONBR_intl_reg[0] ;
  wire [3:0]address;
  wire [11:0]o_rd_data;
  wire p_0_in;
  wire p_0_out_carry__0_i_1__14_n_0;
  wire p_0_out_carry__0_i_2__14_n_0;
  wire p_0_out_carry__0_n_3;
  wire p_0_out_carry__0_n_6;
  wire p_0_out_carry__0_n_7;
  wire p_0_out_carry_i_1__14_n_0;
  wire p_0_out_carry_i_2__14_n_0;
  wire p_0_out_carry_i_3__14_n_0;
  wire p_0_out_carry_i_4__14_n_0;
  wire p_0_out_carry_i_5__13_n_0;
  wire p_0_out_carry_i_6__4_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__14_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__13_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__14_n_0 ;
  wire \r_RD_INDEX[1]_i_1__14_n_0 ;
  wire \r_RD_INDEX[2]_i_1__14_n_0 ;
  wire \r_RD_INDEX[3]_i_2__14_n_0 ;
  wire \r_RD_INDEX[4]_i_1__14_n_0 ;
  wire [4:0]r_WR_INDEX;
  wire \r_WR_INDEX[0]_i_1__14_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_1__14_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire \r_WR_INDEX[4]_i_3__14_n_0 ;
  wire [11:0]\rd_data12[15]_15 ;
  wire rd_en;
  wire [11:0]\wr_data_reg[12][7] ;
  wire [11:0]\wr_data_reg[13][7] ;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[0]_i_7 
       (.I0(\rd_data12[15]_15 [0]),
        .I1(o_rd_data[0]),
        .I2(address[1]),
        .I3(\wr_data_reg[13][7] [0]),
        .I4(address[0]),
        .I5(\wr_data_reg[12][7] [0]),
        .O(\DataOut_stall_reg[0] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[10]_i_7 
       (.I0(\rd_data12[15]_15 [10]),
        .I1(o_rd_data[10]),
        .I2(address[1]),
        .I3(\wr_data_reg[13][7] [10]),
        .I4(address[0]),
        .I5(\wr_data_reg[12][7] [10]),
        .O(\DataOut_stall_reg[10] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[11]_i_8 
       (.I0(\rd_data12[15]_15 [11]),
        .I1(o_rd_data[11]),
        .I2(address[1]),
        .I3(\wr_data_reg[13][7] [11]),
        .I4(address[0]),
        .I5(\wr_data_reg[12][7] [11]),
        .O(\DataOut_stall_reg[11] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[1]_i_7 
       (.I0(\rd_data12[15]_15 [1]),
        .I1(o_rd_data[1]),
        .I2(address[1]),
        .I3(\wr_data_reg[13][7] [1]),
        .I4(address[0]),
        .I5(\wr_data_reg[12][7] [1]),
        .O(\DataOut_stall_reg[1] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[2]_i_7 
       (.I0(\rd_data12[15]_15 [2]),
        .I1(o_rd_data[2]),
        .I2(address[1]),
        .I3(\wr_data_reg[13][7] [2]),
        .I4(address[0]),
        .I5(\wr_data_reg[12][7] [2]),
        .O(\DataOut_stall_reg[2] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[3]_i_7 
       (.I0(\rd_data12[15]_15 [3]),
        .I1(o_rd_data[3]),
        .I2(address[1]),
        .I3(\wr_data_reg[13][7] [3]),
        .I4(address[0]),
        .I5(\wr_data_reg[12][7] [3]),
        .O(\DataOut_stall_reg[3] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[4]_i_7 
       (.I0(\rd_data12[15]_15 [4]),
        .I1(o_rd_data[4]),
        .I2(address[1]),
        .I3(\wr_data_reg[13][7] [4]),
        .I4(address[0]),
        .I5(\wr_data_reg[12][7] [4]),
        .O(\DataOut_stall_reg[4] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[5]_i_7 
       (.I0(\rd_data12[15]_15 [5]),
        .I1(o_rd_data[5]),
        .I2(address[1]),
        .I3(\wr_data_reg[13][7] [5]),
        .I4(address[0]),
        .I5(\wr_data_reg[12][7] [5]),
        .O(\DataOut_stall_reg[5] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[6]_i_7 
       (.I0(\rd_data12[15]_15 [6]),
        .I1(o_rd_data[6]),
        .I2(address[1]),
        .I3(\wr_data_reg[13][7] [6]),
        .I4(address[0]),
        .I5(\wr_data_reg[12][7] [6]),
        .O(\DataOut_stall_reg[6] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[7]_i_7 
       (.I0(\rd_data12[15]_15 [7]),
        .I1(o_rd_data[7]),
        .I2(address[1]),
        .I3(\wr_data_reg[13][7] [7]),
        .I4(address[0]),
        .I5(\wr_data_reg[12][7] [7]),
        .O(\DataOut_stall_reg[7] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[8]_i_7 
       (.I0(\rd_data12[15]_15 [8]),
        .I1(o_rd_data[8]),
        .I2(address[1]),
        .I3(\wr_data_reg[13][7] [8]),
        .I4(address[0]),
        .I5(\wr_data_reg[12][7] [8]),
        .O(\DataOut_stall_reg[8] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[9]_i_7 
       (.I0(\rd_data12[15]_15 [9]),
        .I1(o_rd_data[9]),
        .I2(address[1]),
        .I3(\wr_data_reg[13][7] [9]),
        .I4(address[0]),
        .I5(\wr_data_reg[12][7] [9]),
        .O(\DataOut_stall_reg[9] ));
  LUT4 #(
    .INIT(16'hFFFB)) 
    \FSM_sequential_fifo_wr_stm[2]_i_7 
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[5]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(\r_WR_INDEX[4]_i_3__14_n_0 ),
        .O(\WDONBR_intl_reg[0] ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__14_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__14_n_0,p_0_out_carry_i_3__14_n_0,p_0_out_carry_i_4__14_n_0,p_0_out_carry_i_5__13_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry__0
       (.CI(p_0_out_carry_n_0),
        .CO({NLW_p_0_out_carry__0_CO_UNCONNECTED[3:1],p_0_out_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,r_FIFO_COUNT_reg[4]}),
        .O({NLW_p_0_out_carry__0_O_UNCONNECTED[3:2],p_0_out_carry__0_n_6,p_0_out_carry__0_n_7}),
        .S({1'b0,1'b0,p_0_out_carry__0_i_1__14_n_0,p_0_out_carry__0_i_2__14_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_1__14
       (.I0(r_FIFO_COUNT_reg[5]),
        .I1(r_FIFO_COUNT_reg[6]),
        .O(p_0_out_carry__0_i_1__14_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_2__14
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[5]),
        .O(p_0_out_carry__0_i_2__14_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    p_0_out_carry_i_1__14
       (.I0(r_FIFO_COUNT_reg[1]),
        .O(p_0_out_carry_i_1__14_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_2__14
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[4]),
        .O(p_0_out_carry_i_2__14_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_3__14
       (.I0(r_FIFO_COUNT_reg[2]),
        .I1(r_FIFO_COUNT_reg[3]),
        .O(p_0_out_carry_i_3__14_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_4__14
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[2]),
        .O(p_0_out_carry_i_4__14_n_0));
  LUT3 #(
    .INIT(8'h65)) 
    p_0_out_carry_i_5__13
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(p_0_out_carry_i_6__4_n_0),
        .I2(wr_en_reg),
        .O(p_0_out_carry_i_5__13_n_0));
  LUT5 #(
    .INIT(32'h80000000)) 
    p_0_out_carry_i_6__4
       (.I0(address[0]),
        .I1(address[1]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(rd_en),
        .O(p_0_out_carry_i_6__4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__14 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__14_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \r_FIFO_COUNT[6]_i_1__13 
       (.I0(wr_en_reg),
        .I1(rd_en),
        .I2(address[3]),
        .I3(address[2]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\r_FIFO_COUNT[6]_i_1__13_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__13_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__14_n_0 ),
        .Q(r_FIFO_COUNT_reg[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[1] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__13_n_0 ),
        .D(p_0_out_carry_n_7),
        .Q(r_FIFO_COUNT_reg[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[2] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__13_n_0 ),
        .D(p_0_out_carry_n_6),
        .Q(r_FIFO_COUNT_reg[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[3] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__13_n_0 ),
        .D(p_0_out_carry_n_5),
        .Q(r_FIFO_COUNT_reg[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[4] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__13_n_0 ),
        .D(p_0_out_carry_n_4),
        .Q(r_FIFO_COUNT_reg[4]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[5] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__13_n_0 ),
        .D(p_0_out_carry__0_n_7),
        .Q(r_FIFO_COUNT_reg[5]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[6] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__13_n_0 ),
        .D(p_0_out_carry__0_n_6),
        .Q(r_FIFO_COUNT_reg[6]),
        .R(AR));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_0_5
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[1:0]),
        .DIB(Q[3:2]),
        .DIC(Q[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(\rd_data12[15]_15 [1:0]),
        .DOB(\rd_data12[15]_15 [3:2]),
        .DOC(\rd_data12[15]_15 [5:4]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_6_11
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[7:6]),
        .DIB(Q[9:8]),
        .DIC(Q[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(\rd_data12[15]_15 [7:6]),
        .DOB(\rd_data12[15]_15 [9:8]),
        .DOC(\rd_data12[15]_15 [11:10]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    \r_RD_INDEX[0]_i_1__14 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1__14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__14 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__14 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__14_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \r_RD_INDEX[3]_i_1__13 
       (.I0(p_0_out_carry_i_6__4_n_0),
        .I1(r_FIFO_COUNT_reg[1]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(r_FIFO_COUNT_reg[5]),
        .I4(\r_WR_INDEX[4]_i_3__14_n_0 ),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__14 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_RD_INDEX[4]_i_1__14 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[4]),
        .I2(r_RD_INDEX[0]),
        .I3(r_RD_INDEX[1]),
        .I4(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[4]_i_1__14_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[0]_i_1__14_n_0 ),
        .Q(r_RD_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[1] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[1]_i_1__14_n_0 ),
        .Q(r_RD_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[2] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[2]_i_1__14_n_0 ),
        .Q(r_RD_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[3] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[3]_i_2__14_n_0 ),
        .Q(r_RD_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[4] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[4]_i_1__14_n_0 ),
        .Q(r_RD_INDEX[4]),
        .R(AR));
  LUT1 #(
    .INIT(2'h1)) 
    \r_WR_INDEX[0]_i_1__14 
       (.I0(r_WR_INDEX[0]),
        .O(\r_WR_INDEX[0]_i_1__14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEF0000)) 
    \r_WR_INDEX[4]_i_1__14 
       (.I0(\r_WR_INDEX[4]_i_3__14_n_0 ),
        .I1(r_FIFO_COUNT_reg[6]),
        .I2(r_FIFO_COUNT_reg[5]),
        .I3(r_FIFO_COUNT_reg[1]),
        .I4(wr_en_reg),
        .O(\r_WR_INDEX[4]_i_1__14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_WR_INDEX[4]_i_2 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[4]),
        .I2(r_WR_INDEX[0]),
        .I3(r_WR_INDEX[1]),
        .I4(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \r_WR_INDEX[4]_i_3__14 
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[2]),
        .I2(r_FIFO_COUNT_reg[0]),
        .I3(r_FIFO_COUNT_reg[4]),
        .O(\r_WR_INDEX[4]_i_3__14_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__14_n_0 ),
        .D(\r_WR_INDEX[0]_i_1__14_n_0 ),
        .Q(r_WR_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[1] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__14_n_0 ),
        .D(\r_WR_INDEX[1]_i_1_n_0 ),
        .Q(r_WR_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[2] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__14_n_0 ),
        .D(\r_WR_INDEX[2]_i_1_n_0 ),
        .Q(r_WR_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[3] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__14_n_0 ),
        .D(\r_WR_INDEX[3]_i_1_n_0 ),
        .Q(r_WR_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[4] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__14_n_0 ),
        .D(\r_WR_INDEX[4]_i_2_n_0 ),
        .Q(r_WR_INDEX[4]),
        .R(AR));
endmodule

(* ORIG_REF_NAME = "module_fifo_regs_no_flags" *) 
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_6
   (\r_RD_INDEX_reg[4]_0 ,
    \FSM_sequential_fifo_wr_stm_reg[0] ,
    \FSM_sequential_fifo_wr_stm_reg[0]_0 ,
    \FSM_sequential_fifo_wr_stm_reg[0]_1 ,
    o_rd_data,
    AR,
    CLK,
    address,
    rd_en,
    \cnt_fifo_reg[6] ,
    wr_en_reg,
    \r_FIFO_COUNT_reg[5]_0 ,
    \r_FIFO_COUNT_reg[1]_0 ,
    \r_FIFO_COUNT_reg[1]_1 ,
    p_0_in,
    Q);
  output \r_RD_INDEX_reg[4]_0 ;
  output \FSM_sequential_fifo_wr_stm_reg[0] ;
  output \FSM_sequential_fifo_wr_stm_reg[0]_0 ;
  output \FSM_sequential_fifo_wr_stm_reg[0]_1 ;
  output [11:0]o_rd_data;
  input [0:0]AR;
  input CLK;
  input [3:0]address;
  input rd_en;
  input \cnt_fifo_reg[6] ;
  input wr_en_reg;
  input \r_FIFO_COUNT_reg[5]_0 ;
  input \r_FIFO_COUNT_reg[1]_0 ;
  input \r_FIFO_COUNT_reg[1]_1 ;
  input p_0_in;
  input [11:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire \FSM_sequential_fifo_wr_stm_reg[0] ;
  wire \FSM_sequential_fifo_wr_stm_reg[0]_0 ;
  wire \FSM_sequential_fifo_wr_stm_reg[0]_1 ;
  wire [11:0]Q;
  wire [3:0]address;
  wire \cnt_fifo_reg[6] ;
  wire [11:0]o_rd_data;
  wire p_0_in;
  wire p_0_out_carry__0_i_1__0_n_0;
  wire p_0_out_carry__0_i_2__0_n_0;
  wire p_0_out_carry__0_n_3;
  wire p_0_out_carry__0_n_6;
  wire p_0_out_carry__0_n_7;
  wire p_0_out_carry_i_1__0_n_0;
  wire p_0_out_carry_i_2__0_n_0;
  wire p_0_out_carry_i_3__0_n_0;
  wire p_0_out_carry_i_4__0_n_0;
  wire p_0_out_carry_i_5__8_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__0_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__8_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire \r_FIFO_COUNT_reg[1]_0 ;
  wire \r_FIFO_COUNT_reg[1]_1 ;
  wire \r_FIFO_COUNT_reg[5]_0 ;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__0_n_0 ;
  wire \r_RD_INDEX[1]_i_1__0_n_0 ;
  wire \r_RD_INDEX[2]_i_1__0_n_0 ;
  wire \r_RD_INDEX[3]_i_2__0_n_0 ;
  wire \r_RD_INDEX[3]_i_3__0_n_0 ;
  wire \r_RD_INDEX[4]_i_1__0_n_0 ;
  wire \r_RD_INDEX_reg[4]_0 ;
  wire [4:0]r_WR_INDEX;
  wire \r_WR_INDEX[0]_i_1__0_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_1__1_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire rd_en;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT4 #(
    .INIT(16'h0004)) 
    \FSM_sequential_fifo_wr_stm[0]_i_7 
       (.I0(\FSM_sequential_fifo_wr_stm_reg[0]_0 ),
        .I1(\r_FIFO_COUNT_reg[5]_0 ),
        .I2(\r_FIFO_COUNT_reg[1]_0 ),
        .I3(\r_FIFO_COUNT_reg[1]_1 ),
        .O(\FSM_sequential_fifo_wr_stm_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \FSM_sequential_fifo_wr_stm[1]_i_15 
       (.I0(r_FIFO_COUNT_reg[6]),
        .I1(r_FIFO_COUNT_reg[5]),
        .I2(r_FIFO_COUNT_reg[1]),
        .O(\FSM_sequential_fifo_wr_stm_reg[0]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'hFFFB)) 
    \FSM_sequential_fifo_wr_stm[2]_i_8 
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[5]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(\r_RD_INDEX_reg[4]_0 ),
        .O(\FSM_sequential_fifo_wr_stm_reg[0]_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__0_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__0_n_0,p_0_out_carry_i_3__0_n_0,p_0_out_carry_i_4__0_n_0,p_0_out_carry_i_5__8_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry__0
       (.CI(p_0_out_carry_n_0),
        .CO({NLW_p_0_out_carry__0_CO_UNCONNECTED[3:1],p_0_out_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,r_FIFO_COUNT_reg[4]}),
        .O({NLW_p_0_out_carry__0_O_UNCONNECTED[3:2],p_0_out_carry__0_n_6,p_0_out_carry__0_n_7}),
        .S({1'b0,1'b0,p_0_out_carry__0_i_1__0_n_0,p_0_out_carry__0_i_2__0_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_1__0
       (.I0(r_FIFO_COUNT_reg[5]),
        .I1(r_FIFO_COUNT_reg[6]),
        .O(p_0_out_carry__0_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_2__0
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[5]),
        .O(p_0_out_carry__0_i_2__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    p_0_out_carry_i_1__0
       (.I0(r_FIFO_COUNT_reg[1]),
        .O(p_0_out_carry_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_2__0
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[4]),
        .O(p_0_out_carry_i_2__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_3__0
       (.I0(r_FIFO_COUNT_reg[2]),
        .I1(r_FIFO_COUNT_reg[3]),
        .O(p_0_out_carry_i_3__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_4__0
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[2]),
        .O(p_0_out_carry_i_4__0_n_0));
  LUT6 #(
    .INIT(64'hAAAAAA9A55555555)) 
    p_0_out_carry_i_5__8
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(address[2]),
        .I2(rd_en),
        .I3(address[3]),
        .I4(\cnt_fifo_reg[6] ),
        .I5(wr_en_reg),
        .O(p_0_out_carry_i_5__8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__0 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAA9AAAAA)) 
    \r_FIFO_COUNT[6]_i_1__8 
       (.I0(wr_en_reg),
        .I1(address[1]),
        .I2(address[0]),
        .I3(address[3]),
        .I4(rd_en),
        .I5(address[2]),
        .O(\r_FIFO_COUNT[6]_i_1__8_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__8_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__0_n_0 ),
        .Q(r_FIFO_COUNT_reg[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[1] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__8_n_0 ),
        .D(p_0_out_carry_n_7),
        .Q(r_FIFO_COUNT_reg[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[2] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__8_n_0 ),
        .D(p_0_out_carry_n_6),
        .Q(r_FIFO_COUNT_reg[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[3] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__8_n_0 ),
        .D(p_0_out_carry_n_5),
        .Q(r_FIFO_COUNT_reg[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[4] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__8_n_0 ),
        .D(p_0_out_carry_n_4),
        .Q(r_FIFO_COUNT_reg[4]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[5] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__8_n_0 ),
        .D(p_0_out_carry__0_n_7),
        .Q(r_FIFO_COUNT_reg[5]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[6] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__8_n_0 ),
        .D(p_0_out_carry__0_n_6),
        .Q(r_FIFO_COUNT_reg[6]),
        .R(AR));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_0_5
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[1:0]),
        .DIB(Q[3:2]),
        .DIC(Q[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[1:0]),
        .DOB(o_rd_data[3:2]),
        .DOC(o_rd_data[5:4]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_6_11
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[7:6]),
        .DIB(Q[9:8]),
        .DIC(Q[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[7:6]),
        .DOB(o_rd_data[9:8]),
        .DOC(o_rd_data[11:10]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    \r_RD_INDEX[0]_i_1__0 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__0 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__0 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \r_RD_INDEX[3]_i_1__8 
       (.I0(\r_RD_INDEX[3]_i_3__0_n_0 ),
        .I1(r_FIFO_COUNT_reg[1]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(r_FIFO_COUNT_reg[5]),
        .I4(\r_RD_INDEX_reg[4]_0 ),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__0 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__0_n_0 ));
  LUT5 #(
    .INIT(32'h00000400)) 
    \r_RD_INDEX[3]_i_3__0 
       (.I0(address[2]),
        .I1(rd_en),
        .I2(address[3]),
        .I3(address[0]),
        .I4(address[1]),
        .O(\r_RD_INDEX[3]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_RD_INDEX[4]_i_1__0 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[4]),
        .I2(r_RD_INDEX[0]),
        .I3(r_RD_INDEX[1]),
        .I4(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[4]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[0]_i_1__0_n_0 ),
        .Q(r_RD_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[1] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[1]_i_1__0_n_0 ),
        .Q(r_RD_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[2] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[2]_i_1__0_n_0 ),
        .Q(r_RD_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[3] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[3]_i_2__0_n_0 ),
        .Q(r_RD_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[4] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[4]_i_1__0_n_0 ),
        .Q(r_RD_INDEX[4]),
        .R(AR));
  LUT1 #(
    .INIT(2'h1)) 
    \r_WR_INDEX[0]_i_1__0 
       (.I0(r_WR_INDEX[0]),
        .O(\r_WR_INDEX[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEF0000)) 
    \r_WR_INDEX[4]_i_1__1 
       (.I0(\r_RD_INDEX_reg[4]_0 ),
        .I1(r_FIFO_COUNT_reg[6]),
        .I2(r_FIFO_COUNT_reg[5]),
        .I3(r_FIFO_COUNT_reg[1]),
        .I4(wr_en_reg),
        .O(\r_WR_INDEX[4]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_WR_INDEX[4]_i_2 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[4]),
        .I2(r_WR_INDEX[0]),
        .I3(r_WR_INDEX[1]),
        .I4(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \r_WR_INDEX[4]_i_3__0 
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[2]),
        .I2(r_FIFO_COUNT_reg[0]),
        .I3(r_FIFO_COUNT_reg[4]),
        .O(\r_RD_INDEX_reg[4]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__1_n_0 ),
        .D(\r_WR_INDEX[0]_i_1__0_n_0 ),
        .Q(r_WR_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[1] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__1_n_0 ),
        .D(\r_WR_INDEX[1]_i_1_n_0 ),
        .Q(r_WR_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[2] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__1_n_0 ),
        .D(\r_WR_INDEX[2]_i_1_n_0 ),
        .Q(r_WR_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[3] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__1_n_0 ),
        .D(\r_WR_INDEX[3]_i_1_n_0 ),
        .Q(r_WR_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[4] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__1_n_0 ),
        .D(\r_WR_INDEX[4]_i_2_n_0 ),
        .Q(r_WR_INDEX[4]),
        .R(AR));
endmodule

(* ORIG_REF_NAME = "module_fifo_regs_no_flags" *) 
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_7
   (\r_WR_INDEX_reg[0]_0 ,
    \FSM_sequential_fifo_wr_stm_reg[2] ,
    E,
    \FSM_sequential_fifo_wr_stm_reg[0] ,
    \FSM_sequential_fifo_wr_stm_reg[0]_0 ,
    \FIFO_WR_reg[valid] ,
    o_rd_data,
    AR,
    CLK,
    wr_en_reg,
    address,
    rd_en,
    out,
    \FIFO_RD_reg[response] ,
    in0,
    nRST,
    \r_FIFO_COUNT_reg[1]_0 ,
    \r_FIFO_COUNT_reg[1]_1 ,
    \r_FIFO_COUNT_reg[6]_0 ,
    \r_FIFO_COUNT_reg[1]_2 ,
    \r_FIFO_COUNT_reg[1]_3 ,
    \r_FIFO_COUNT_reg[1]_4 ,
    \r_FIFO_COUNT_reg[1]_5 ,
    \r_FIFO_COUNT_reg[1]_6 ,
    \r_FIFO_COUNT_reg[1]_7 ,
    \FIFO_RD_reg[busy] ,
    PRECvalid,
    \r_FIFO_COUNT_reg[1]_8 ,
    \r_FIFO_COUNT_reg[0]_0 ,
    \r_FIFO_COUNT_reg[6]_1 ,
    \r_FIFO_COUNT_reg[1]_9 ,
    \FIFO_WR_reg[valid]0 ,
    \FIFO_WR_reg[valid]_0 ,
    p_0_in,
    Q);
  output \r_WR_INDEX_reg[0]_0 ;
  output \FSM_sequential_fifo_wr_stm_reg[2] ;
  output [0:0]E;
  output \FSM_sequential_fifo_wr_stm_reg[0] ;
  output \FSM_sequential_fifo_wr_stm_reg[0]_0 ;
  output \FIFO_WR_reg[valid] ;
  output [11:0]o_rd_data;
  input [0:0]AR;
  input CLK;
  input wr_en_reg;
  input [3:0]address;
  input rd_en;
  input [2:0]out;
  input \FIFO_RD_reg[response] ;
  input [0:0]in0;
  input nRST;
  input \r_FIFO_COUNT_reg[1]_0 ;
  input \r_FIFO_COUNT_reg[1]_1 ;
  input \r_FIFO_COUNT_reg[6]_0 ;
  input \r_FIFO_COUNT_reg[1]_2 ;
  input \r_FIFO_COUNT_reg[1]_3 ;
  input \r_FIFO_COUNT_reg[1]_4 ;
  input \r_FIFO_COUNT_reg[1]_5 ;
  input \r_FIFO_COUNT_reg[1]_6 ;
  input \r_FIFO_COUNT_reg[1]_7 ;
  input \FIFO_RD_reg[busy] ;
  input PRECvalid;
  input \r_FIFO_COUNT_reg[1]_8 ;
  input \r_FIFO_COUNT_reg[0]_0 ;
  input \r_FIFO_COUNT_reg[6]_1 ;
  input \r_FIFO_COUNT_reg[1]_9 ;
  input \FIFO_WR_reg[valid]0 ;
  input \FIFO_WR_reg[valid]_0 ;
  input p_0_in;
  input [11:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]E;
  wire \FIFO_RD_reg[busy] ;
  wire \FIFO_RD_reg[response] ;
  wire \FIFO_WR_reg[valid] ;
  wire \FIFO_WR_reg[valid]0 ;
  wire \FIFO_WR_reg[valid]_0 ;
  wire \FSM_sequential_fifo_wr_stm[2]_i_2_n_0 ;
  wire \FSM_sequential_fifo_wr_stm[2]_i_3_n_0 ;
  wire \FSM_sequential_fifo_wr_stm_reg[0] ;
  wire \FSM_sequential_fifo_wr_stm_reg[0]_0 ;
  wire \FSM_sequential_fifo_wr_stm_reg[2] ;
  wire PRECvalid;
  wire [11:0]Q;
  wire [3:0]address;
  wire [0:0]in0;
  wire nRST;
  wire [11:0]o_rd_data;
  wire [2:0]out;
  wire p_0_in;
  wire p_0_out_carry__0_i_1__1_n_0;
  wire p_0_out_carry__0_i_2__1_n_0;
  wire p_0_out_carry__0_n_3;
  wire p_0_out_carry__0_n_6;
  wire p_0_out_carry__0_n_7;
  wire p_0_out_carry_i_1__1_n_0;
  wire p_0_out_carry_i_2__1_n_0;
  wire p_0_out_carry_i_3__1_n_0;
  wire p_0_out_carry_i_4__1_n_0;
  wire p_0_out_carry_i_5__6_n_0;
  wire p_0_out_carry_i_6__6_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__1_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__6_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire \r_FIFO_COUNT_reg[0]_0 ;
  wire \r_FIFO_COUNT_reg[1]_0 ;
  wire \r_FIFO_COUNT_reg[1]_1 ;
  wire \r_FIFO_COUNT_reg[1]_2 ;
  wire \r_FIFO_COUNT_reg[1]_3 ;
  wire \r_FIFO_COUNT_reg[1]_4 ;
  wire \r_FIFO_COUNT_reg[1]_5 ;
  wire \r_FIFO_COUNT_reg[1]_6 ;
  wire \r_FIFO_COUNT_reg[1]_7 ;
  wire \r_FIFO_COUNT_reg[1]_8 ;
  wire \r_FIFO_COUNT_reg[1]_9 ;
  wire \r_FIFO_COUNT_reg[6]_0 ;
  wire \r_FIFO_COUNT_reg[6]_1 ;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__1_n_0 ;
  wire \r_RD_INDEX[1]_i_1__1_n_0 ;
  wire \r_RD_INDEX[2]_i_1__1_n_0 ;
  wire \r_RD_INDEX[3]_i_2__1_n_0 ;
  wire \r_RD_INDEX[3]_i_3__1_n_0 ;
  wire \r_RD_INDEX[4]_i_1__1_n_0 ;
  wire [4:0]r_WR_INDEX;
  wire \r_WR_INDEX[0]_i_1__1_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_1__2_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire \r_WR_INDEX[4]_i_4__0_n_0 ;
  wire \r_WR_INDEX_reg[0]_0 ;
  wire rd_en;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT6 #(
    .INIT(64'h00B8FFFF00B80000)) 
    \FIFO_WR[valid]_i_1 
       (.I0(\FSM_sequential_fifo_wr_stm[2]_i_2_n_0 ),
        .I1(out[2]),
        .I2(PRECvalid),
        .I3(out[0]),
        .I4(\FIFO_WR_reg[valid]0 ),
        .I5(\FIFO_WR_reg[valid]_0 ),
        .O(\FIFO_WR_reg[valid] ));
  LUT6 #(
    .INIT(64'h20202F2F000FF0FF)) 
    \FSM_sequential_fifo_wr_stm[0]_i_4 
       (.I0(\FSM_sequential_fifo_wr_stm_reg[0]_0 ),
        .I1(\r_FIFO_COUNT_reg[1]_7 ),
        .I2(out[1]),
        .I3(\FIFO_RD_reg[busy] ),
        .I4(PRECvalid),
        .I5(out[0]),
        .O(\FSM_sequential_fifo_wr_stm_reg[0] ));
  LUT6 #(
    .INIT(64'h0000001000000000)) 
    \FSM_sequential_fifo_wr_stm[1]_i_4 
       (.I0(\r_WR_INDEX_reg[0]_0 ),
        .I1(\r_FIFO_COUNT_reg[1]_8 ),
        .I2(\r_FIFO_COUNT_reg[0]_0 ),
        .I3(\r_FIFO_COUNT_reg[6]_1 ),
        .I4(\r_FIFO_COUNT_reg[1]_9 ),
        .I5(\r_FIFO_COUNT_reg[1]_1 ),
        .O(\FSM_sequential_fifo_wr_stm_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h3BFB40403B3B4040)) 
    \FSM_sequential_fifo_wr_stm[2]_i_1 
       (.I0(\FSM_sequential_fifo_wr_stm[2]_i_2_n_0 ),
        .I1(out[1]),
        .I2(out[0]),
        .I3(\FIFO_RD_reg[response] ),
        .I4(out[2]),
        .I5(in0),
        .O(\FSM_sequential_fifo_wr_stm_reg[2] ));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    \FSM_sequential_fifo_wr_stm[2]_i_2 
       (.I0(\FSM_sequential_fifo_wr_stm[2]_i_3_n_0 ),
        .I1(\r_FIFO_COUNT_reg[1]_0 ),
        .I2(\r_FIFO_COUNT_reg[1]_1 ),
        .I3(\r_FIFO_COUNT_reg[6]_0 ),
        .I4(\r_FIFO_COUNT_reg[1]_2 ),
        .I5(\r_FIFO_COUNT_reg[1]_3 ),
        .O(\FSM_sequential_fifo_wr_stm[2]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_fifo_wr_stm[2]_i_3 
       (.I0(\r_WR_INDEX_reg[0]_0 ),
        .I1(\r_FIFO_COUNT_reg[1]_4 ),
        .I2(\r_FIFO_COUNT_reg[1]_5 ),
        .I3(\r_FIFO_COUNT_reg[1]_6 ),
        .O(\FSM_sequential_fifo_wr_stm[2]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00800000)) 
    \WDOTime_intl[63]_i_1 
       (.I0(out[1]),
        .I1(nRST),
        .I2(out[2]),
        .I3(out[0]),
        .I4(\FSM_sequential_fifo_wr_stm[2]_i_2_n_0 ),
        .O(E));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__1_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__1_n_0,p_0_out_carry_i_3__1_n_0,p_0_out_carry_i_4__1_n_0,p_0_out_carry_i_5__6_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry__0
       (.CI(p_0_out_carry_n_0),
        .CO({NLW_p_0_out_carry__0_CO_UNCONNECTED[3:1],p_0_out_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,r_FIFO_COUNT_reg[4]}),
        .O({NLW_p_0_out_carry__0_O_UNCONNECTED[3:2],p_0_out_carry__0_n_6,p_0_out_carry__0_n_7}),
        .S({1'b0,1'b0,p_0_out_carry__0_i_1__1_n_0,p_0_out_carry__0_i_2__1_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_1__1
       (.I0(r_FIFO_COUNT_reg[5]),
        .I1(r_FIFO_COUNT_reg[6]),
        .O(p_0_out_carry__0_i_1__1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_2__1
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[5]),
        .O(p_0_out_carry__0_i_2__1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    p_0_out_carry_i_1__1
       (.I0(r_FIFO_COUNT_reg[1]),
        .O(p_0_out_carry_i_1__1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_2__1
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[4]),
        .O(p_0_out_carry_i_2__1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_3__1
       (.I0(r_FIFO_COUNT_reg[2]),
        .I1(r_FIFO_COUNT_reg[3]),
        .O(p_0_out_carry_i_3__1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_4__1
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[2]),
        .O(p_0_out_carry_i_4__1_n_0));
  LUT3 #(
    .INIT(8'h65)) 
    p_0_out_carry_i_5__6
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(p_0_out_carry_i_6__6_n_0),
        .I2(wr_en_reg),
        .O(p_0_out_carry_i_5__6_n_0));
  LUT5 #(
    .INIT(32'h00100000)) 
    p_0_out_carry_i_6__6
       (.I0(address[0]),
        .I1(address[3]),
        .I2(rd_en),
        .I3(address[2]),
        .I4(address[1]),
        .O(p_0_out_carry_i_6__6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__1 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAA6AA)) 
    \r_FIFO_COUNT[6]_i_1__6 
       (.I0(wr_en_reg),
        .I1(address[1]),
        .I2(address[2]),
        .I3(rd_en),
        .I4(address[3]),
        .I5(address[0]),
        .O(\r_FIFO_COUNT[6]_i_1__6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__6_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__1_n_0 ),
        .Q(r_FIFO_COUNT_reg[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[1] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__6_n_0 ),
        .D(p_0_out_carry_n_7),
        .Q(r_FIFO_COUNT_reg[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[2] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__6_n_0 ),
        .D(p_0_out_carry_n_6),
        .Q(r_FIFO_COUNT_reg[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[3] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__6_n_0 ),
        .D(p_0_out_carry_n_5),
        .Q(r_FIFO_COUNT_reg[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[4] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__6_n_0 ),
        .D(p_0_out_carry_n_4),
        .Q(r_FIFO_COUNT_reg[4]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[5] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__6_n_0 ),
        .D(p_0_out_carry__0_n_7),
        .Q(r_FIFO_COUNT_reg[5]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[6] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__6_n_0 ),
        .D(p_0_out_carry__0_n_6),
        .Q(r_FIFO_COUNT_reg[6]),
        .R(AR));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_0_5
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[1:0]),
        .DIB(Q[3:2]),
        .DIC(Q[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[1:0]),
        .DOB(o_rd_data[3:2]),
        .DOC(o_rd_data[5:4]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_6_11
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[7:6]),
        .DIB(Q[9:8]),
        .DIC(Q[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[7:6]),
        .DOB(o_rd_data[9:8]),
        .DOC(o_rd_data[11:10]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    \r_RD_INDEX[0]_i_1__1 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__1 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__1 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \r_RD_INDEX[3]_i_1__6 
       (.I0(p_0_out_carry_i_6__6_n_0),
        .I1(\r_RD_INDEX[3]_i_3__1_n_0 ),
        .I2(r_FIFO_COUNT_reg[1]),
        .I3(r_FIFO_COUNT_reg[0]),
        .I4(r_FIFO_COUNT_reg[4]),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__1 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \r_RD_INDEX[3]_i_3__1 
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[2]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(r_FIFO_COUNT_reg[5]),
        .O(\r_RD_INDEX[3]_i_3__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_RD_INDEX[4]_i_1__1 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[4]),
        .I2(r_RD_INDEX[0]),
        .I3(r_RD_INDEX[1]),
        .I4(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[4]_i_1__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[0]_i_1__1_n_0 ),
        .Q(r_RD_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[1] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[1]_i_1__1_n_0 ),
        .Q(r_RD_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[2] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[2]_i_1__1_n_0 ),
        .Q(r_RD_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[3] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[3]_i_2__1_n_0 ),
        .Q(r_RD_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[4] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[4]_i_1__1_n_0 ),
        .Q(r_RD_INDEX[4]),
        .R(AR));
  LUT1 #(
    .INIT(2'h1)) 
    \r_WR_INDEX[0]_i_1__1 
       (.I0(r_WR_INDEX[0]),
        .O(\r_WR_INDEX[0]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \r_WR_INDEX[4]_i_1__2 
       (.I0(\r_WR_INDEX_reg[0]_0 ),
        .I1(wr_en_reg),
        .O(\r_WR_INDEX[4]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_WR_INDEX[4]_i_2 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[4]),
        .I2(r_WR_INDEX[0]),
        .I3(r_WR_INDEX[1]),
        .I4(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    \r_WR_INDEX[4]_i_3__1 
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[5]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(\r_WR_INDEX[4]_i_4__0_n_0 ),
        .I4(r_FIFO_COUNT_reg[2]),
        .I5(r_FIFO_COUNT_reg[3]),
        .O(\r_WR_INDEX_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \r_WR_INDEX[4]_i_4__0 
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[0]),
        .O(\r_WR_INDEX[4]_i_4__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__2_n_0 ),
        .D(\r_WR_INDEX[0]_i_1__1_n_0 ),
        .Q(r_WR_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[1] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__2_n_0 ),
        .D(\r_WR_INDEX[1]_i_1_n_0 ),
        .Q(r_WR_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[2] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__2_n_0 ),
        .D(\r_WR_INDEX[2]_i_1_n_0 ),
        .Q(r_WR_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[3] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__2_n_0 ),
        .D(\r_WR_INDEX[3]_i_1_n_0 ),
        .Q(r_WR_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[4] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__2_n_0 ),
        .D(\r_WR_INDEX[4]_i_2_n_0 ),
        .Q(r_WR_INDEX[4]),
        .R(AR));
endmodule

(* ORIG_REF_NAME = "module_fifo_regs_no_flags" *) 
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_8
   (\r_WR_INDEX_reg[0]_0 ,
    \WDONBR_intl_reg[0] ,
    D,
    \DataOut_last_reg[11] ,
    \DataOut_stall_reg[11] ,
    AR,
    CLK,
    wr_en_reg,
    address,
    rd_en,
    \r_FIFO_COUNT_reg[1]_0 ,
    \r_FIFO_COUNT_reg[1]_1 ,
    \r_FIFO_COUNT_reg[1]_2 ,
    \fifo_rd_stm_reg[1] ,
    Q,
    \rdy_state_reg[1] ,
    \DataOut_last_reg[11]_0 ,
    \fifo_rd_stm_reg[0] ,
    \DataOut_intlH_reg[11] ,
    \cnt_fifo_reg[7] ,
    \cnt_fifo_reg[6] ,
    o_rd_data,
    \wr_data_reg[1][7] ,
    \wr_data_reg[0][7] ,
    \cnt_fifo_reg[7]_0 ,
    \cnt_fifo_reg[6]_0 ,
    \cnt_fifo_reg[7]_1 ,
    \cnt_fifo_reg[6]_1 ,
    \cnt_fifo_reg[7]_2 ,
    \cnt_fifo_reg[6]_2 ,
    \cnt_fifo_reg[7]_3 ,
    \cnt_fifo_reg[6]_3 ,
    \cnt_fifo_reg[7]_4 ,
    \cnt_fifo_reg[6]_4 ,
    \cnt_fifo_reg[7]_5 ,
    \cnt_fifo_reg[6]_5 ,
    \cnt_fifo_reg[7]_6 ,
    \cnt_fifo_reg[6]_6 ,
    \cnt_fifo_reg[7]_7 ,
    \cnt_fifo_reg[6]_7 ,
    \cnt_fifo_reg[7]_8 ,
    \cnt_fifo_reg[6]_8 ,
    \cnt_fifo_reg[7]_9 ,
    \cnt_fifo_reg[6]_9 ,
    \cnt_fifo_reg[7]_10 ,
    \cnt_fifo_reg[6]_10 ,
    p_0_in,
    \wr_data_reg[3][11] );
  output \r_WR_INDEX_reg[0]_0 ;
  output \WDONBR_intl_reg[0] ;
  output [11:0]D;
  output [11:0]\DataOut_last_reg[11] ;
  output [11:0]\DataOut_stall_reg[11] ;
  input [0:0]AR;
  input CLK;
  input wr_en_reg;
  input [3:0]address;
  input rd_en;
  input \r_FIFO_COUNT_reg[1]_0 ;
  input \r_FIFO_COUNT_reg[1]_1 ;
  input \r_FIFO_COUNT_reg[1]_2 ;
  input \fifo_rd_stm_reg[1] ;
  input [11:0]Q;
  input [1:0]\rdy_state_reg[1] ;
  input [11:0]\DataOut_last_reg[11]_0 ;
  input [0:0]\fifo_rd_stm_reg[0] ;
  input [11:0]\DataOut_intlH_reg[11] ;
  input \cnt_fifo_reg[7] ;
  input \cnt_fifo_reg[6] ;
  input [11:0]o_rd_data;
  input [11:0]\wr_data_reg[1][7] ;
  input [11:0]\wr_data_reg[0][7] ;
  input \cnt_fifo_reg[7]_0 ;
  input \cnt_fifo_reg[6]_0 ;
  input \cnt_fifo_reg[7]_1 ;
  input \cnt_fifo_reg[6]_1 ;
  input \cnt_fifo_reg[7]_2 ;
  input \cnt_fifo_reg[6]_2 ;
  input \cnt_fifo_reg[7]_3 ;
  input \cnt_fifo_reg[6]_3 ;
  input \cnt_fifo_reg[7]_4 ;
  input \cnt_fifo_reg[6]_4 ;
  input \cnt_fifo_reg[7]_5 ;
  input \cnt_fifo_reg[6]_5 ;
  input \cnt_fifo_reg[7]_6 ;
  input \cnt_fifo_reg[6]_6 ;
  input \cnt_fifo_reg[7]_7 ;
  input \cnt_fifo_reg[6]_7 ;
  input \cnt_fifo_reg[7]_8 ;
  input \cnt_fifo_reg[6]_8 ;
  input \cnt_fifo_reg[7]_9 ;
  input \cnt_fifo_reg[6]_9 ;
  input \cnt_fifo_reg[7]_10 ;
  input \cnt_fifo_reg[6]_10 ;
  input p_0_in;
  input [11:0]\wr_data_reg[3][11] ;

  wire [0:0]AR;
  wire CLK;
  wire [11:0]D;
  wire [11:0]\DataOut_intlH_reg[11] ;
  wire [11:0]\DataOut_last_reg[11] ;
  wire [11:0]\DataOut_last_reg[11]_0 ;
  wire \DataOut_stall[0]_i_4_n_0 ;
  wire \DataOut_stall[10]_i_4_n_0 ;
  wire \DataOut_stall[11]_i_5_n_0 ;
  wire \DataOut_stall[1]_i_4_n_0 ;
  wire \DataOut_stall[2]_i_4_n_0 ;
  wire \DataOut_stall[3]_i_4_n_0 ;
  wire \DataOut_stall[4]_i_4_n_0 ;
  wire \DataOut_stall[5]_i_4_n_0 ;
  wire \DataOut_stall[6]_i_4_n_0 ;
  wire \DataOut_stall[7]_i_4_n_0 ;
  wire \DataOut_stall[8]_i_4_n_0 ;
  wire \DataOut_stall[9]_i_4_n_0 ;
  wire \DataOut_stall_reg[0]_i_2_n_0 ;
  wire \DataOut_stall_reg[10]_i_2_n_0 ;
  wire [11:0]\DataOut_stall_reg[11] ;
  wire \DataOut_stall_reg[11]_i_3_n_0 ;
  wire \DataOut_stall_reg[1]_i_2_n_0 ;
  wire \DataOut_stall_reg[2]_i_2_n_0 ;
  wire \DataOut_stall_reg[3]_i_2_n_0 ;
  wire \DataOut_stall_reg[4]_i_2_n_0 ;
  wire \DataOut_stall_reg[5]_i_2_n_0 ;
  wire \DataOut_stall_reg[6]_i_2_n_0 ;
  wire \DataOut_stall_reg[7]_i_2_n_0 ;
  wire \DataOut_stall_reg[8]_i_2_n_0 ;
  wire \DataOut_stall_reg[9]_i_2_n_0 ;
  wire [11:0]Q;
  wire \WDONBR_intl_reg[0] ;
  wire [3:0]address;
  wire \cnt_fifo_reg[6] ;
  wire \cnt_fifo_reg[6]_0 ;
  wire \cnt_fifo_reg[6]_1 ;
  wire \cnt_fifo_reg[6]_10 ;
  wire \cnt_fifo_reg[6]_2 ;
  wire \cnt_fifo_reg[6]_3 ;
  wire \cnt_fifo_reg[6]_4 ;
  wire \cnt_fifo_reg[6]_5 ;
  wire \cnt_fifo_reg[6]_6 ;
  wire \cnt_fifo_reg[6]_7 ;
  wire \cnt_fifo_reg[6]_8 ;
  wire \cnt_fifo_reg[6]_9 ;
  wire \cnt_fifo_reg[7] ;
  wire \cnt_fifo_reg[7]_0 ;
  wire \cnt_fifo_reg[7]_1 ;
  wire \cnt_fifo_reg[7]_10 ;
  wire \cnt_fifo_reg[7]_2 ;
  wire \cnt_fifo_reg[7]_3 ;
  wire \cnt_fifo_reg[7]_4 ;
  wire \cnt_fifo_reg[7]_5 ;
  wire \cnt_fifo_reg[7]_6 ;
  wire \cnt_fifo_reg[7]_7 ;
  wire \cnt_fifo_reg[7]_8 ;
  wire \cnt_fifo_reg[7]_9 ;
  wire [0:0]\fifo_rd_stm_reg[0] ;
  wire \fifo_rd_stm_reg[1] ;
  wire [11:0]o_rd_data;
  wire p_0_in;
  wire p_0_out_carry__0_i_1__2_n_0;
  wire p_0_out_carry__0_i_2__2_n_0;
  wire p_0_out_carry__0_n_3;
  wire p_0_out_carry__0_n_6;
  wire p_0_out_carry__0_n_7;
  wire p_0_out_carry_i_1__2_n_0;
  wire p_0_out_carry_i_2__2_n_0;
  wire p_0_out_carry_i_3__2_n_0;
  wire p_0_out_carry_i_4__2_n_0;
  wire p_0_out_carry_i_5__7_n_0;
  wire p_0_out_carry_i_6__1_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__2_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__7_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire \r_FIFO_COUNT_reg[1]_0 ;
  wire \r_FIFO_COUNT_reg[1]_1 ;
  wire \r_FIFO_COUNT_reg[1]_2 ;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__2_n_0 ;
  wire \r_RD_INDEX[1]_i_1__2_n_0 ;
  wire \r_RD_INDEX[2]_i_1__2_n_0 ;
  wire \r_RD_INDEX[3]_i_2__2_n_0 ;
  wire \r_RD_INDEX[3]_i_3__2_n_0 ;
  wire \r_RD_INDEX[4]_i_1__2_n_0 ;
  wire [4:0]r_WR_INDEX;
  wire \r_WR_INDEX[0]_i_1__2_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_1__3_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire \r_WR_INDEX[4]_i_4__1_n_0 ;
  wire \r_WR_INDEX_reg[0]_0 ;
  wire [11:0]\rd_data12[3]_3 ;
  wire rd_en;
  wire [1:0]\rdy_state_reg[1] ;
  wire [11:0]\wr_data_reg[0][7] ;
  wire [11:0]\wr_data_reg[1][7] ;
  wire [11:0]\wr_data_reg[3][11] ;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT6 #(
    .INIT(64'h44F444F4FFF444F4)) 
    \DataOut[0]_i_1 
       (.I0(\fifo_rd_stm_reg[1] ),
        .I1(\DataOut_last_reg[11] [0]),
        .I2(\DataOut_last_reg[11]_0 [0]),
        .I3(\rdy_state_reg[1] [0]),
        .I4(Q[0]),
        .I5(\rdy_state_reg[1] [1]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h44F444F4FFF444F4)) 
    \DataOut[10]_i_1 
       (.I0(\fifo_rd_stm_reg[1] ),
        .I1(\DataOut_last_reg[11] [10]),
        .I2(\DataOut_last_reg[11]_0 [10]),
        .I3(\rdy_state_reg[1] [0]),
        .I4(Q[10]),
        .I5(\rdy_state_reg[1] [1]),
        .O(D[10]));
  LUT6 #(
    .INIT(64'h44FFF4FF4444F444)) 
    \DataOut[11]_i_1 
       (.I0(\fifo_rd_stm_reg[1] ),
        .I1(\DataOut_last_reg[11] [11]),
        .I2(Q[11]),
        .I3(\rdy_state_reg[1] [0]),
        .I4(\rdy_state_reg[1] [1]),
        .I5(\DataOut_last_reg[11]_0 [11]),
        .O(D[11]));
  LUT6 #(
    .INIT(64'h44FFF4FF4444F444)) 
    \DataOut[1]_i_1 
       (.I0(\fifo_rd_stm_reg[1] ),
        .I1(\DataOut_last_reg[11] [1]),
        .I2(Q[1]),
        .I3(\rdy_state_reg[1] [0]),
        .I4(\rdy_state_reg[1] [1]),
        .I5(\DataOut_last_reg[11]_0 [1]),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h44F444F4FFF444F4)) 
    \DataOut[2]_i_1 
       (.I0(\fifo_rd_stm_reg[1] ),
        .I1(\DataOut_last_reg[11] [2]),
        .I2(\DataOut_last_reg[11]_0 [2]),
        .I3(\rdy_state_reg[1] [0]),
        .I4(Q[2]),
        .I5(\rdy_state_reg[1] [1]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'h44F444F4FFF444F4)) 
    \DataOut[3]_i_1 
       (.I0(\fifo_rd_stm_reg[1] ),
        .I1(\DataOut_last_reg[11] [3]),
        .I2(\DataOut_last_reg[11]_0 [3]),
        .I3(\rdy_state_reg[1] [0]),
        .I4(Q[3]),
        .I5(\rdy_state_reg[1] [1]),
        .O(D[3]));
  LUT6 #(
    .INIT(64'h44F444F4FFF444F4)) 
    \DataOut[4]_i_1 
       (.I0(\fifo_rd_stm_reg[1] ),
        .I1(\DataOut_last_reg[11] [4]),
        .I2(\DataOut_last_reg[11]_0 [4]),
        .I3(\rdy_state_reg[1] [0]),
        .I4(Q[4]),
        .I5(\rdy_state_reg[1] [1]),
        .O(D[4]));
  LUT6 #(
    .INIT(64'h44FFF4FF4444F444)) 
    \DataOut[5]_i_1 
       (.I0(\fifo_rd_stm_reg[1] ),
        .I1(\DataOut_last_reg[11] [5]),
        .I2(Q[5]),
        .I3(\rdy_state_reg[1] [0]),
        .I4(\rdy_state_reg[1] [1]),
        .I5(\DataOut_last_reg[11]_0 [5]),
        .O(D[5]));
  LUT6 #(
    .INIT(64'h44FFF4FF4444F444)) 
    \DataOut[6]_i_1 
       (.I0(\fifo_rd_stm_reg[1] ),
        .I1(\DataOut_last_reg[11] [6]),
        .I2(Q[6]),
        .I3(\rdy_state_reg[1] [0]),
        .I4(\rdy_state_reg[1] [1]),
        .I5(\DataOut_last_reg[11]_0 [6]),
        .O(D[6]));
  LUT6 #(
    .INIT(64'h44FFF4FF4444F444)) 
    \DataOut[7]_i_1 
       (.I0(\fifo_rd_stm_reg[1] ),
        .I1(\DataOut_last_reg[11] [7]),
        .I2(Q[7]),
        .I3(\rdy_state_reg[1] [0]),
        .I4(\rdy_state_reg[1] [1]),
        .I5(\DataOut_last_reg[11]_0 [7]),
        .O(D[7]));
  LUT6 #(
    .INIT(64'h44FFF4FF4444F444)) 
    \DataOut[8]_i_1 
       (.I0(\fifo_rd_stm_reg[1] ),
        .I1(\DataOut_last_reg[11] [8]),
        .I2(Q[8]),
        .I3(\rdy_state_reg[1] [0]),
        .I4(\rdy_state_reg[1] [1]),
        .I5(\DataOut_last_reg[11]_0 [8]),
        .O(D[8]));
  LUT6 #(
    .INIT(64'h44FFF4FF4444F444)) 
    \DataOut[9]_i_1 
       (.I0(\fifo_rd_stm_reg[1] ),
        .I1(\DataOut_last_reg[11] [9]),
        .I2(Q[9]),
        .I3(\rdy_state_reg[1] [0]),
        .I4(\rdy_state_reg[1] [1]),
        .I5(\DataOut_last_reg[11]_0 [9]),
        .O(D[9]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut_last[0]_i_1 
       (.I0(\DataOut_stall_reg[11] [0]),
        .I1(\fifo_rd_stm_reg[0] ),
        .I2(\DataOut_intlH_reg[11] [0]),
        .O(\DataOut_last_reg[11] [0]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut_last[10]_i_1 
       (.I0(\DataOut_stall_reg[11] [10]),
        .I1(\fifo_rd_stm_reg[0] ),
        .I2(\DataOut_intlH_reg[11] [10]),
        .O(\DataOut_last_reg[11] [10]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut_last[11]_i_1 
       (.I0(\DataOut_stall_reg[11] [11]),
        .I1(\fifo_rd_stm_reg[0] ),
        .I2(\DataOut_intlH_reg[11] [11]),
        .O(\DataOut_last_reg[11] [11]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut_last[1]_i_1 
       (.I0(\DataOut_stall_reg[11] [1]),
        .I1(\fifo_rd_stm_reg[0] ),
        .I2(\DataOut_intlH_reg[11] [1]),
        .O(\DataOut_last_reg[11] [1]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut_last[2]_i_1 
       (.I0(\DataOut_stall_reg[11] [2]),
        .I1(\fifo_rd_stm_reg[0] ),
        .I2(\DataOut_intlH_reg[11] [2]),
        .O(\DataOut_last_reg[11] [2]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut_last[3]_i_1 
       (.I0(\DataOut_stall_reg[11] [3]),
        .I1(\fifo_rd_stm_reg[0] ),
        .I2(\DataOut_intlH_reg[11] [3]),
        .O(\DataOut_last_reg[11] [3]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut_last[4]_i_1 
       (.I0(\DataOut_stall_reg[11] [4]),
        .I1(\fifo_rd_stm_reg[0] ),
        .I2(\DataOut_intlH_reg[11] [4]),
        .O(\DataOut_last_reg[11] [4]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut_last[5]_i_1 
       (.I0(\DataOut_stall_reg[11] [5]),
        .I1(\fifo_rd_stm_reg[0] ),
        .I2(\DataOut_intlH_reg[11] [5]),
        .O(\DataOut_last_reg[11] [5]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut_last[6]_i_1 
       (.I0(\DataOut_stall_reg[11] [6]),
        .I1(\fifo_rd_stm_reg[0] ),
        .I2(\DataOut_intlH_reg[11] [6]),
        .O(\DataOut_last_reg[11] [6]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut_last[7]_i_1 
       (.I0(\DataOut_stall_reg[11] [7]),
        .I1(\fifo_rd_stm_reg[0] ),
        .I2(\DataOut_intlH_reg[11] [7]),
        .O(\DataOut_last_reg[11] [7]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut_last[8]_i_1 
       (.I0(\DataOut_stall_reg[11] [8]),
        .I1(\fifo_rd_stm_reg[0] ),
        .I2(\DataOut_intlH_reg[11] [8]),
        .O(\DataOut_last_reg[11] [8]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut_last[9]_i_1 
       (.I0(\DataOut_stall_reg[11] [9]),
        .I1(\fifo_rd_stm_reg[0] ),
        .I2(\DataOut_intlH_reg[11] [9]),
        .O(\DataOut_last_reg[11] [9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[0]_i_4 
       (.I0(\rd_data12[3]_3 [0]),
        .I1(o_rd_data[0]),
        .I2(address[1]),
        .I3(\wr_data_reg[1][7] [0]),
        .I4(address[0]),
        .I5(\wr_data_reg[0][7] [0]),
        .O(\DataOut_stall[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[10]_i_4 
       (.I0(\rd_data12[3]_3 [10]),
        .I1(o_rd_data[10]),
        .I2(address[1]),
        .I3(\wr_data_reg[1][7] [10]),
        .I4(address[0]),
        .I5(\wr_data_reg[0][7] [10]),
        .O(\DataOut_stall[10]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[11]_i_5 
       (.I0(\rd_data12[3]_3 [11]),
        .I1(o_rd_data[11]),
        .I2(address[1]),
        .I3(\wr_data_reg[1][7] [11]),
        .I4(address[0]),
        .I5(\wr_data_reg[0][7] [11]),
        .O(\DataOut_stall[11]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[1]_i_4 
       (.I0(\rd_data12[3]_3 [1]),
        .I1(o_rd_data[1]),
        .I2(address[1]),
        .I3(\wr_data_reg[1][7] [1]),
        .I4(address[0]),
        .I5(\wr_data_reg[0][7] [1]),
        .O(\DataOut_stall[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[2]_i_4 
       (.I0(\rd_data12[3]_3 [2]),
        .I1(o_rd_data[2]),
        .I2(address[1]),
        .I3(\wr_data_reg[1][7] [2]),
        .I4(address[0]),
        .I5(\wr_data_reg[0][7] [2]),
        .O(\DataOut_stall[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[3]_i_4 
       (.I0(\rd_data12[3]_3 [3]),
        .I1(o_rd_data[3]),
        .I2(address[1]),
        .I3(\wr_data_reg[1][7] [3]),
        .I4(address[0]),
        .I5(\wr_data_reg[0][7] [3]),
        .O(\DataOut_stall[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[4]_i_4 
       (.I0(\rd_data12[3]_3 [4]),
        .I1(o_rd_data[4]),
        .I2(address[1]),
        .I3(\wr_data_reg[1][7] [4]),
        .I4(address[0]),
        .I5(\wr_data_reg[0][7] [4]),
        .O(\DataOut_stall[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[5]_i_4 
       (.I0(\rd_data12[3]_3 [5]),
        .I1(o_rd_data[5]),
        .I2(address[1]),
        .I3(\wr_data_reg[1][7] [5]),
        .I4(address[0]),
        .I5(\wr_data_reg[0][7] [5]),
        .O(\DataOut_stall[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[6]_i_4 
       (.I0(\rd_data12[3]_3 [6]),
        .I1(o_rd_data[6]),
        .I2(address[1]),
        .I3(\wr_data_reg[1][7] [6]),
        .I4(address[0]),
        .I5(\wr_data_reg[0][7] [6]),
        .O(\DataOut_stall[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[7]_i_4 
       (.I0(\rd_data12[3]_3 [7]),
        .I1(o_rd_data[7]),
        .I2(address[1]),
        .I3(\wr_data_reg[1][7] [7]),
        .I4(address[0]),
        .I5(\wr_data_reg[0][7] [7]),
        .O(\DataOut_stall[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[8]_i_4 
       (.I0(\rd_data12[3]_3 [8]),
        .I1(o_rd_data[8]),
        .I2(address[1]),
        .I3(\wr_data_reg[1][7] [8]),
        .I4(address[0]),
        .I5(\wr_data_reg[0][7] [8]),
        .O(\DataOut_stall[8]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut_stall[9]_i_4 
       (.I0(\rd_data12[3]_3 [9]),
        .I1(o_rd_data[9]),
        .I2(address[1]),
        .I3(\wr_data_reg[1][7] [9]),
        .I4(address[0]),
        .I5(\wr_data_reg[0][7] [9]),
        .O(\DataOut_stall[9]_i_4_n_0 ));
  MUXF8 \DataOut_stall_reg[0]_i_1 
       (.I0(\DataOut_stall_reg[0]_i_2_n_0 ),
        .I1(\cnt_fifo_reg[7]_10 ),
        .O(\DataOut_stall_reg[11] [0]),
        .S(address[3]));
  MUXF7 \DataOut_stall_reg[0]_i_2 
       (.I0(\DataOut_stall[0]_i_4_n_0 ),
        .I1(\cnt_fifo_reg[6]_10 ),
        .O(\DataOut_stall_reg[0]_i_2_n_0 ),
        .S(address[2]));
  MUXF8 \DataOut_stall_reg[10]_i_1 
       (.I0(\DataOut_stall_reg[10]_i_2_n_0 ),
        .I1(\cnt_fifo_reg[7]_0 ),
        .O(\DataOut_stall_reg[11] [10]),
        .S(address[3]));
  MUXF7 \DataOut_stall_reg[10]_i_2 
       (.I0(\DataOut_stall[10]_i_4_n_0 ),
        .I1(\cnt_fifo_reg[6]_0 ),
        .O(\DataOut_stall_reg[10]_i_2_n_0 ),
        .S(address[2]));
  MUXF8 \DataOut_stall_reg[11]_i_2 
       (.I0(\DataOut_stall_reg[11]_i_3_n_0 ),
        .I1(\cnt_fifo_reg[7] ),
        .O(\DataOut_stall_reg[11] [11]),
        .S(address[3]));
  MUXF7 \DataOut_stall_reg[11]_i_3 
       (.I0(\DataOut_stall[11]_i_5_n_0 ),
        .I1(\cnt_fifo_reg[6] ),
        .O(\DataOut_stall_reg[11]_i_3_n_0 ),
        .S(address[2]));
  MUXF8 \DataOut_stall_reg[1]_i_1 
       (.I0(\DataOut_stall_reg[1]_i_2_n_0 ),
        .I1(\cnt_fifo_reg[7]_9 ),
        .O(\DataOut_stall_reg[11] [1]),
        .S(address[3]));
  MUXF7 \DataOut_stall_reg[1]_i_2 
       (.I0(\DataOut_stall[1]_i_4_n_0 ),
        .I1(\cnt_fifo_reg[6]_9 ),
        .O(\DataOut_stall_reg[1]_i_2_n_0 ),
        .S(address[2]));
  MUXF8 \DataOut_stall_reg[2]_i_1 
       (.I0(\DataOut_stall_reg[2]_i_2_n_0 ),
        .I1(\cnt_fifo_reg[7]_8 ),
        .O(\DataOut_stall_reg[11] [2]),
        .S(address[3]));
  MUXF7 \DataOut_stall_reg[2]_i_2 
       (.I0(\DataOut_stall[2]_i_4_n_0 ),
        .I1(\cnt_fifo_reg[6]_8 ),
        .O(\DataOut_stall_reg[2]_i_2_n_0 ),
        .S(address[2]));
  MUXF8 \DataOut_stall_reg[3]_i_1 
       (.I0(\DataOut_stall_reg[3]_i_2_n_0 ),
        .I1(\cnt_fifo_reg[7]_7 ),
        .O(\DataOut_stall_reg[11] [3]),
        .S(address[3]));
  MUXF7 \DataOut_stall_reg[3]_i_2 
       (.I0(\DataOut_stall[3]_i_4_n_0 ),
        .I1(\cnt_fifo_reg[6]_7 ),
        .O(\DataOut_stall_reg[3]_i_2_n_0 ),
        .S(address[2]));
  MUXF8 \DataOut_stall_reg[4]_i_1 
       (.I0(\DataOut_stall_reg[4]_i_2_n_0 ),
        .I1(\cnt_fifo_reg[7]_6 ),
        .O(\DataOut_stall_reg[11] [4]),
        .S(address[3]));
  MUXF7 \DataOut_stall_reg[4]_i_2 
       (.I0(\DataOut_stall[4]_i_4_n_0 ),
        .I1(\cnt_fifo_reg[6]_6 ),
        .O(\DataOut_stall_reg[4]_i_2_n_0 ),
        .S(address[2]));
  MUXF8 \DataOut_stall_reg[5]_i_1 
       (.I0(\DataOut_stall_reg[5]_i_2_n_0 ),
        .I1(\cnt_fifo_reg[7]_5 ),
        .O(\DataOut_stall_reg[11] [5]),
        .S(address[3]));
  MUXF7 \DataOut_stall_reg[5]_i_2 
       (.I0(\DataOut_stall[5]_i_4_n_0 ),
        .I1(\cnt_fifo_reg[6]_5 ),
        .O(\DataOut_stall_reg[5]_i_2_n_0 ),
        .S(address[2]));
  MUXF8 \DataOut_stall_reg[6]_i_1 
       (.I0(\DataOut_stall_reg[6]_i_2_n_0 ),
        .I1(\cnt_fifo_reg[7]_4 ),
        .O(\DataOut_stall_reg[11] [6]),
        .S(address[3]));
  MUXF7 \DataOut_stall_reg[6]_i_2 
       (.I0(\DataOut_stall[6]_i_4_n_0 ),
        .I1(\cnt_fifo_reg[6]_4 ),
        .O(\DataOut_stall_reg[6]_i_2_n_0 ),
        .S(address[2]));
  MUXF8 \DataOut_stall_reg[7]_i_1 
       (.I0(\DataOut_stall_reg[7]_i_2_n_0 ),
        .I1(\cnt_fifo_reg[7]_3 ),
        .O(\DataOut_stall_reg[11] [7]),
        .S(address[3]));
  MUXF7 \DataOut_stall_reg[7]_i_2 
       (.I0(\DataOut_stall[7]_i_4_n_0 ),
        .I1(\cnt_fifo_reg[6]_3 ),
        .O(\DataOut_stall_reg[7]_i_2_n_0 ),
        .S(address[2]));
  MUXF8 \DataOut_stall_reg[8]_i_1 
       (.I0(\DataOut_stall_reg[8]_i_2_n_0 ),
        .I1(\cnt_fifo_reg[7]_2 ),
        .O(\DataOut_stall_reg[11] [8]),
        .S(address[3]));
  MUXF7 \DataOut_stall_reg[8]_i_2 
       (.I0(\DataOut_stall[8]_i_4_n_0 ),
        .I1(\cnt_fifo_reg[6]_2 ),
        .O(\DataOut_stall_reg[8]_i_2_n_0 ),
        .S(address[2]));
  MUXF8 \DataOut_stall_reg[9]_i_1 
       (.I0(\DataOut_stall_reg[9]_i_2_n_0 ),
        .I1(\cnt_fifo_reg[7]_1 ),
        .O(\DataOut_stall_reg[11] [9]),
        .S(address[3]));
  MUXF7 \DataOut_stall_reg[9]_i_2 
       (.I0(\DataOut_stall[9]_i_4_n_0 ),
        .I1(\cnt_fifo_reg[6]_1 ),
        .O(\DataOut_stall_reg[9]_i_2_n_0 ),
        .S(address[2]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_fifo_wr_stm[2]_i_6 
       (.I0(\r_WR_INDEX_reg[0]_0 ),
        .I1(\r_FIFO_COUNT_reg[1]_0 ),
        .I2(\r_FIFO_COUNT_reg[1]_1 ),
        .I3(\r_FIFO_COUNT_reg[1]_2 ),
        .O(\WDONBR_intl_reg[0] ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__2_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__2_n_0,p_0_out_carry_i_3__2_n_0,p_0_out_carry_i_4__2_n_0,p_0_out_carry_i_5__7_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry__0
       (.CI(p_0_out_carry_n_0),
        .CO({NLW_p_0_out_carry__0_CO_UNCONNECTED[3:1],p_0_out_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,r_FIFO_COUNT_reg[4]}),
        .O({NLW_p_0_out_carry__0_O_UNCONNECTED[3:2],p_0_out_carry__0_n_6,p_0_out_carry__0_n_7}),
        .S({1'b0,1'b0,p_0_out_carry__0_i_1__2_n_0,p_0_out_carry__0_i_2__2_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_1__2
       (.I0(r_FIFO_COUNT_reg[5]),
        .I1(r_FIFO_COUNT_reg[6]),
        .O(p_0_out_carry__0_i_1__2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_2__2
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[5]),
        .O(p_0_out_carry__0_i_2__2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    p_0_out_carry_i_1__2
       (.I0(r_FIFO_COUNT_reg[1]),
        .O(p_0_out_carry_i_1__2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_2__2
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[4]),
        .O(p_0_out_carry_i_2__2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_3__2
       (.I0(r_FIFO_COUNT_reg[2]),
        .I1(r_FIFO_COUNT_reg[3]),
        .O(p_0_out_carry_i_3__2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_4__2
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[2]),
        .O(p_0_out_carry_i_4__2_n_0));
  LUT3 #(
    .INIT(8'h65)) 
    p_0_out_carry_i_5__7
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(p_0_out_carry_i_6__1_n_0),
        .I2(wr_en_reg),
        .O(p_0_out_carry_i_5__7_n_0));
  LUT5 #(
    .INIT(32'h00200000)) 
    p_0_out_carry_i_6__1
       (.I0(address[0]),
        .I1(address[3]),
        .I2(rd_en),
        .I3(address[2]),
        .I4(address[1]),
        .O(p_0_out_carry_i_6__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__2 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA6AAAAAAAAAA)) 
    \r_FIFO_COUNT[6]_i_1__7 
       (.I0(wr_en_reg),
        .I1(address[1]),
        .I2(address[2]),
        .I3(rd_en),
        .I4(address[3]),
        .I5(address[0]),
        .O(\r_FIFO_COUNT[6]_i_1__7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__7_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__2_n_0 ),
        .Q(r_FIFO_COUNT_reg[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[1] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__7_n_0 ),
        .D(p_0_out_carry_n_7),
        .Q(r_FIFO_COUNT_reg[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[2] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__7_n_0 ),
        .D(p_0_out_carry_n_6),
        .Q(r_FIFO_COUNT_reg[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[3] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__7_n_0 ),
        .D(p_0_out_carry_n_5),
        .Q(r_FIFO_COUNT_reg[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[4] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__7_n_0 ),
        .D(p_0_out_carry_n_4),
        .Q(r_FIFO_COUNT_reg[4]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[5] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__7_n_0 ),
        .D(p_0_out_carry__0_n_7),
        .Q(r_FIFO_COUNT_reg[5]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[6] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__7_n_0 ),
        .D(p_0_out_carry__0_n_6),
        .Q(r_FIFO_COUNT_reg[6]),
        .R(AR));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_0_5
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(\wr_data_reg[3][11] [1:0]),
        .DIB(\wr_data_reg[3][11] [3:2]),
        .DIC(\wr_data_reg[3][11] [5:4]),
        .DID({1'b0,1'b0}),
        .DOA(\rd_data12[3]_3 [1:0]),
        .DOB(\rd_data12[3]_3 [3:2]),
        .DOC(\rd_data12[3]_3 [5:4]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_6_11
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(\wr_data_reg[3][11] [7:6]),
        .DIB(\wr_data_reg[3][11] [9:8]),
        .DIC(\wr_data_reg[3][11] [11:10]),
        .DID({1'b0,1'b0}),
        .DOA(\rd_data12[3]_3 [7:6]),
        .DOB(\rd_data12[3]_3 [9:8]),
        .DOC(\rd_data12[3]_3 [11:10]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    \r_RD_INDEX[0]_i_1__2 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__2 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__2 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__2_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \r_RD_INDEX[3]_i_1__7 
       (.I0(p_0_out_carry_i_6__1_n_0),
        .I1(\r_RD_INDEX[3]_i_3__2_n_0 ),
        .I2(r_FIFO_COUNT_reg[1]),
        .I3(r_FIFO_COUNT_reg[0]),
        .I4(r_FIFO_COUNT_reg[4]),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__2 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \r_RD_INDEX[3]_i_3__2 
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[2]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(r_FIFO_COUNT_reg[5]),
        .O(\r_RD_INDEX[3]_i_3__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_RD_INDEX[4]_i_1__2 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[4]),
        .I2(r_RD_INDEX[0]),
        .I3(r_RD_INDEX[1]),
        .I4(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[4]_i_1__2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[0]_i_1__2_n_0 ),
        .Q(r_RD_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[1] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[1]_i_1__2_n_0 ),
        .Q(r_RD_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[2] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[2]_i_1__2_n_0 ),
        .Q(r_RD_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[3] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[3]_i_2__2_n_0 ),
        .Q(r_RD_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[4] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[4]_i_1__2_n_0 ),
        .Q(r_RD_INDEX[4]),
        .R(AR));
  LUT1 #(
    .INIT(2'h1)) 
    \r_WR_INDEX[0]_i_1__2 
       (.I0(r_WR_INDEX[0]),
        .O(\r_WR_INDEX[0]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \r_WR_INDEX[4]_i_1__3 
       (.I0(\r_WR_INDEX_reg[0]_0 ),
        .I1(wr_en_reg),
        .O(\r_WR_INDEX[4]_i_1__3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_WR_INDEX[4]_i_2 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[4]),
        .I2(r_WR_INDEX[0]),
        .I3(r_WR_INDEX[1]),
        .I4(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    \r_WR_INDEX[4]_i_3__2 
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[5]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(\r_WR_INDEX[4]_i_4__1_n_0 ),
        .I4(r_FIFO_COUNT_reg[2]),
        .I5(r_FIFO_COUNT_reg[3]),
        .O(\r_WR_INDEX_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \r_WR_INDEX[4]_i_4__1 
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[0]),
        .O(\r_WR_INDEX[4]_i_4__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__3_n_0 ),
        .D(\r_WR_INDEX[0]_i_1__2_n_0 ),
        .Q(r_WR_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[1] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__3_n_0 ),
        .D(\r_WR_INDEX[1]_i_1_n_0 ),
        .Q(r_WR_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[2] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__3_n_0 ),
        .D(\r_WR_INDEX[2]_i_1_n_0 ),
        .Q(r_WR_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[3] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__3_n_0 ),
        .D(\r_WR_INDEX[3]_i_1_n_0 ),
        .Q(r_WR_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[4] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__3_n_0 ),
        .D(\r_WR_INDEX[4]_i_2_n_0 ),
        .Q(r_WR_INDEX[4]),
        .R(AR));
endmodule

(* ORIG_REF_NAME = "module_fifo_regs_no_flags" *) 
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_9
   (\r_WR_INDEX_reg[0]_0 ,
    o_rd_data,
    AR,
    CLK,
    \cnt_fifo_reg[5] ,
    rd_en,
    address,
    wr_en_reg,
    p_0_in,
    Q);
  output \r_WR_INDEX_reg[0]_0 ;
  output [11:0]o_rd_data;
  input [0:0]AR;
  input CLK;
  input \cnt_fifo_reg[5] ;
  input rd_en;
  input [3:0]address;
  input wr_en_reg;
  input p_0_in;
  input [11:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire [11:0]Q;
  wire [3:0]address;
  wire \cnt_fifo_reg[5] ;
  wire [11:0]o_rd_data;
  wire p_0_in;
  wire p_0_out_carry__0_i_1__3_n_0;
  wire p_0_out_carry__0_i_2__3_n_0;
  wire p_0_out_carry__0_n_3;
  wire p_0_out_carry__0_n_6;
  wire p_0_out_carry__0_n_7;
  wire p_0_out_carry_i_1__3_n_0;
  wire p_0_out_carry_i_2__3_n_0;
  wire p_0_out_carry_i_3__3_n_0;
  wire p_0_out_carry_i_4__3_n_0;
  wire p_0_out_carry_i_5_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__3_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__3_n_0 ;
  wire \r_RD_INDEX[1]_i_1__3_n_0 ;
  wire \r_RD_INDEX[2]_i_1__3_n_0 ;
  wire \r_RD_INDEX[3]_i_2__3_n_0 ;
  wire \r_RD_INDEX[3]_i_3__8_n_0 ;
  wire \r_RD_INDEX[3]_i_4__0_n_0 ;
  wire \r_RD_INDEX[4]_i_1__3_n_0 ;
  wire [4:0]r_WR_INDEX;
  wire \r_WR_INDEX[0]_i_1__3_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_1__4_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire \r_WR_INDEX[4]_i_4__2_n_0 ;
  wire \r_WR_INDEX_reg[0]_0 ;
  wire rd_en;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__3_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__3_n_0,p_0_out_carry_i_3__3_n_0,p_0_out_carry_i_4__3_n_0,p_0_out_carry_i_5_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry__0
       (.CI(p_0_out_carry_n_0),
        .CO({NLW_p_0_out_carry__0_CO_UNCONNECTED[3:1],p_0_out_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,r_FIFO_COUNT_reg[4]}),
        .O({NLW_p_0_out_carry__0_O_UNCONNECTED[3:2],p_0_out_carry__0_n_6,p_0_out_carry__0_n_7}),
        .S({1'b0,1'b0,p_0_out_carry__0_i_1__3_n_0,p_0_out_carry__0_i_2__3_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_1__3
       (.I0(r_FIFO_COUNT_reg[5]),
        .I1(r_FIFO_COUNT_reg[6]),
        .O(p_0_out_carry__0_i_1__3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_2__3
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[5]),
        .O(p_0_out_carry__0_i_2__3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    p_0_out_carry_i_1__3
       (.I0(r_FIFO_COUNT_reg[1]),
        .O(p_0_out_carry_i_1__3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_2__3
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[4]),
        .O(p_0_out_carry_i_2__3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_3__3
       (.I0(r_FIFO_COUNT_reg[2]),
        .I1(r_FIFO_COUNT_reg[3]),
        .O(p_0_out_carry_i_3__3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry_i_4__3
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[2]),
        .O(p_0_out_carry_i_4__3_n_0));
  LUT6 #(
    .INIT(64'hAA9AAAAA55555555)) 
    p_0_out_carry_i_5
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(\cnt_fifo_reg[5] ),
        .I2(rd_en),
        .I3(address[3]),
        .I4(address[2]),
        .I5(wr_en_reg),
        .O(p_0_out_carry_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__3 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAA6AA)) 
    \r_FIFO_COUNT[6]_i_1 
       (.I0(wr_en_reg),
        .I1(address[2]),
        .I2(address[3]),
        .I3(rd_en),
        .I4(address[0]),
        .I5(address[1]),
        .O(\r_FIFO_COUNT[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__3_n_0 ),
        .Q(r_FIFO_COUNT_reg[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[1] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1_n_0 ),
        .D(p_0_out_carry_n_7),
        .Q(r_FIFO_COUNT_reg[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[2] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1_n_0 ),
        .D(p_0_out_carry_n_6),
        .Q(r_FIFO_COUNT_reg[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[3] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1_n_0 ),
        .D(p_0_out_carry_n_5),
        .Q(r_FIFO_COUNT_reg[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[4] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1_n_0 ),
        .D(p_0_out_carry_n_4),
        .Q(r_FIFO_COUNT_reg[4]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[5] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1_n_0 ),
        .D(p_0_out_carry__0_n_7),
        .Q(r_FIFO_COUNT_reg[5]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[6] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1_n_0 ),
        .D(p_0_out_carry__0_n_6),
        .Q(r_FIFO_COUNT_reg[6]),
        .R(AR));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_0_5
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[1:0]),
        .DIB(Q[3:2]),
        .DIC(Q[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[1:0]),
        .DOB(o_rd_data[3:2]),
        .DOC(o_rd_data[5:4]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    r_FIFO_DATA_reg_0_31_6_11
       (.ADDRA(r_RD_INDEX),
        .ADDRB(r_RD_INDEX),
        .ADDRC(r_RD_INDEX),
        .ADDRD(r_WR_INDEX),
        .DIA(Q[7:6]),
        .DIB(Q[9:8]),
        .DIC(Q[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[7:6]),
        .DOB(o_rd_data[9:8]),
        .DOC(o_rd_data[11:10]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    \r_RD_INDEX[0]_i_1__3 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1__3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__3 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__3 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__3_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \r_RD_INDEX[3]_i_1 
       (.I0(\r_RD_INDEX[3]_i_3__8_n_0 ),
        .I1(\r_RD_INDEX[3]_i_4__0_n_0 ),
        .I2(r_FIFO_COUNT_reg[1]),
        .I3(r_FIFO_COUNT_reg[0]),
        .I4(r_FIFO_COUNT_reg[4]),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__3 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__3_n_0 ));
  LUT5 #(
    .INIT(32'h00100000)) 
    \r_RD_INDEX[3]_i_3__8 
       (.I0(address[1]),
        .I1(address[0]),
        .I2(rd_en),
        .I3(address[3]),
        .I4(address[2]),
        .O(\r_RD_INDEX[3]_i_3__8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \r_RD_INDEX[3]_i_4__0 
       (.I0(r_FIFO_COUNT_reg[3]),
        .I1(r_FIFO_COUNT_reg[2]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(r_FIFO_COUNT_reg[5]),
        .O(\r_RD_INDEX[3]_i_4__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_RD_INDEX[4]_i_1__3 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[4]),
        .I2(r_RD_INDEX[0]),
        .I3(r_RD_INDEX[1]),
        .I4(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[4]_i_1__3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[0]_i_1__3_n_0 ),
        .Q(r_RD_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[1] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[1]_i_1__3_n_0 ),
        .Q(r_RD_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[2] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[2]_i_1__3_n_0 ),
        .Q(r_RD_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[3] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[3]_i_2__3_n_0 ),
        .Q(r_RD_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_RD_INDEX_reg[4] 
       (.C(CLK),
        .CE(r_RD_INDEX0),
        .D(\r_RD_INDEX[4]_i_1__3_n_0 ),
        .Q(r_RD_INDEX[4]),
        .R(AR));
  LUT1 #(
    .INIT(2'h1)) 
    \r_WR_INDEX[0]_i_1__3 
       (.I0(r_WR_INDEX[0]),
        .O(\r_WR_INDEX[0]_i_1__3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \r_WR_INDEX[4]_i_1__4 
       (.I0(\r_WR_INDEX_reg[0]_0 ),
        .I1(wr_en_reg),
        .O(\r_WR_INDEX[4]_i_1__4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_WR_INDEX[4]_i_2 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[4]),
        .I2(r_WR_INDEX[0]),
        .I3(r_WR_INDEX[1]),
        .I4(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    \r_WR_INDEX[4]_i_3__3 
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(r_FIFO_COUNT_reg[5]),
        .I2(r_FIFO_COUNT_reg[6]),
        .I3(\r_WR_INDEX[4]_i_4__2_n_0 ),
        .I4(r_FIFO_COUNT_reg[2]),
        .I5(r_FIFO_COUNT_reg[3]),
        .O(\r_WR_INDEX_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \r_WR_INDEX[4]_i_4__2 
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(r_FIFO_COUNT_reg[0]),
        .O(\r_WR_INDEX[4]_i_4__2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__4_n_0 ),
        .D(\r_WR_INDEX[0]_i_1__3_n_0 ),
        .Q(r_WR_INDEX[0]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[1] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__4_n_0 ),
        .D(\r_WR_INDEX[1]_i_1_n_0 ),
        .Q(r_WR_INDEX[1]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[2] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__4_n_0 ),
        .D(\r_WR_INDEX[2]_i_1_n_0 ),
        .Q(r_WR_INDEX[2]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[3] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__4_n_0 ),
        .D(\r_WR_INDEX[3]_i_1_n_0 ),
        .Q(r_WR_INDEX[3]),
        .R(AR));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[4] 
       (.C(CLK),
        .CE(\r_WR_INDEX[4]_i_1__4_n_0 ),
        .D(\r_WR_INDEX[4]_i_2_n_0 ),
        .Q(r_WR_INDEX[4]),
        .R(AR));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
