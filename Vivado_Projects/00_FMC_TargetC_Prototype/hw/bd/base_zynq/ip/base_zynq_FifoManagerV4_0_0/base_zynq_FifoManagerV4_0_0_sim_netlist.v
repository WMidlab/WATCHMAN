// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
// Date        : Thu Jan 24 09:24:14 2019
// Host        : jonathan-Latitude-E7450 running 64-bit Linux Mint 18.1 Serena
// Command     : write_verilog -force -mode funcsim
//               /home/jonathan/VivadoProjects/00_WATCHMANN/TARGETC_Prototype/hw/bd/base_zynq/ip/base_zynq_FifoManagerV4_0_0/base_zynq_FifoManagerV4_0_0_sim_netlist.v
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
    TestFIFO,
    FIFO_ReadEn,
    FIFO_Time,
    FIFO_WdoAddr,
    FIFO_TrigInfo,
    FIFO_Spare,
    FIFO_Empty,
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 CLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME CLK, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN base_zynq_processing_system7_0_0_FCLK_CLK0" *) input CLK;
  input PRECvalid;
  output FIFOresponse;
  input TestFIFO;
  output FIFO_ReadEn;
  input [63:0]FIFO_Time;
  input [8:0]FIFO_WdoAddr;
  input [11:0]FIFO_TrigInfo;
  input [9:0]FIFO_Spare;
  input FIFO_Empty;
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
  wire [31:0]DataOut;
  wire FIFO_ReadEn;
  wire [9:0]FIFO_Spare;
  wire [63:0]FIFO_Time;
  wire [11:0]FIFO_TrigInfo;
  wire [8:0]FIFO_WdoAddr;
  wire FIFOresponse;
  wire FIFOvalid;
  wire PRECvalid;
  wire PSBUSY_i;
  wire TestFIFO;
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
        .DataOut(DataOut),
        .FIFO_ReadEn(FIFO_ReadEn),
        .FIFO_Spare(FIFO_Spare),
        .FIFO_Time(FIFO_Time),
        .FIFO_TrigInfo(FIFO_TrigInfo),
        .FIFO_WdoAddr(FIFO_WdoAddr),
        .FIFOresponse(FIFOresponse),
        .FIFOvalid(FIFOvalid),
        .PRECvalid(PRECvalid),
        .PSBUSY_i(PSBUSY_i),
        .TestFIFO(TestFIFO),
        .nRST(nRST),
        .ready_i(ready_i));
endmodule

(* ORIG_REF_NAME = "FifoManagerV4" *) 
module base_zynq_FifoManagerV4_0_0_FifoManagerV4
   (DataOut,
    FIFOresponse,
    FIFO_ReadEn,
    FIFOvalid,
    nRST,
    CLK,
    ready_i,
    FIFO_Time,
    FIFO_Spare,
    FIFO_TrigInfo,
    FIFO_WdoAddr,
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
    TestFIFO,
    PRECvalid);
  output [31:0]DataOut;
  output FIFOresponse;
  output FIFO_ReadEn;
  output FIFOvalid;
  input nRST;
  input CLK;
  input ready_i;
  input [63:0]FIFO_Time;
  input [9:0]FIFO_Spare;
  input [11:0]FIFO_TrigInfo;
  input [8:0]FIFO_WdoAddr;
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
  input TestFIFO;
  input PRECvalid;

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
  wire \DIGTime_intl_reg_n_0_[0] ;
  wire \DIGTime_intl_reg_n_0_[1] ;
  wire \DIGTime_intl_reg_n_0_[2] ;
  wire \DIGTime_intl_reg_n_0_[3] ;
  wire \DIGTime_intl_reg_n_0_[4] ;
  wire \DIGTime_intl_reg_n_0_[5] ;
  wire \DIGTime_intl_reg_n_0_[6] ;
  wire \DIGTime_intl_reg_n_0_[7] ;
  wire \DIGTime_intl_reg_n_0_[8] ;
  wire \DIGTime_intl_reg_n_0_[9] ;
  wire [31:0]DataOut;
  wire \DataOut[0]_i_2_n_0 ;
  wire \DataOut[10]_i_2_n_0 ;
  wire \DataOut[11]_i_10_n_0 ;
  wire \DataOut[11]_i_2_n_0 ;
  wire \DataOut[11]_i_5_n_0 ;
  wire \DataOut[11]_i_6_n_0 ;
  wire \DataOut[11]_i_8_n_0 ;
  wire \DataOut[12]_i_1_n_0 ;
  wire \DataOut[13]_i_1_n_0 ;
  wire \DataOut[14]_i_1_n_0 ;
  wire \DataOut[15]_i_1_n_0 ;
  wire \DataOut[16]_i_1_n_0 ;
  wire \DataOut[17]_i_1_n_0 ;
  wire \DataOut[18]_i_1_n_0 ;
  wire \DataOut[19]_i_1_n_0 ;
  wire \DataOut[1]_i_2_n_0 ;
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
  wire \DataOut[2]_i_2_n_0 ;
  wire \DataOut[30]_i_1_n_0 ;
  wire \DataOut[31]_i_1_n_0 ;
  wire \DataOut[31]_i_2_n_0 ;
  wire \DataOut[3]_i_2_n_0 ;
  wire \DataOut[4]_i_2_n_0 ;
  wire \DataOut[5]_i_2_n_0 ;
  wire \DataOut[6]_i_2_n_0 ;
  wire \DataOut[7]_i_2_n_0 ;
  wire \DataOut[8]_i_2_n_0 ;
  wire \DataOut[9]_i_2_n_0 ;
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
  wire \DataOut_intlH[13]_i_1_n_0 ;
  wire \DataOut_intlH[14]_i_1_n_0 ;
  wire \DataOut_intlH[15]_i_1_n_0 ;
  wire \DataOut_intlH[16]_i_1_n_0 ;
  wire \DataOut_intlH[17]_i_1_n_0 ;
  wire \DataOut_intlH[18]_i_1_n_0 ;
  wire \DataOut_intlH[19]_i_1_n_0 ;
  wire \DataOut_intlH[1]_i_1_n_0 ;
  wire \DataOut_intlH[1]_i_2_n_0 ;
  wire \DataOut_intlH[1]_i_3_n_0 ;
  wire \DataOut_intlH[20]_i_1_n_0 ;
  wire \DataOut_intlH[21]_i_1_n_0 ;
  wire \DataOut_intlH[22]_i_1_n_0 ;
  wire \DataOut_intlH[23]_i_1_n_0 ;
  wire \DataOut_intlH[24]_i_1_n_0 ;
  wire \DataOut_intlH[25]_i_1_n_0 ;
  wire \DataOut_intlH[26]_i_1_n_0 ;
  wire \DataOut_intlH[27]_i_1_n_0 ;
  wire \DataOut_intlH[28]_i_1_n_0 ;
  wire \DataOut_intlH[28]_i_2_n_0 ;
  wire \DataOut_intlH[29]_i_1_n_0 ;
  wire \DataOut_intlH[2]_i_1_n_0 ;
  wire \DataOut_intlH[2]_i_2_n_0 ;
  wire \DataOut_intlH[2]_i_3_n_0 ;
  wire \DataOut_intlH[30]_i_1_n_0 ;
  wire \DataOut_intlH[31]_i_1_n_0 ;
  wire \DataOut_intlH[31]_i_2_n_0 ;
  wire \DataOut_intlH[31]_i_3_n_0 ;
  wire \DataOut_intlH[31]_i_4_n_0 ;
  wire \DataOut_intlH[31]_i_5_n_0 ;
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
  wire \DataOut_intlH[8]_i_4_n_0 ;
  wire \DataOut_intlH[9]_i_1_n_0 ;
  wire \DataOut_intlH[9]_i_2_n_0 ;
  wire \DataOut_intlH[9]_i_3_n_0 ;
  wire \DataOut_intlH[9]_i_4_n_0 ;
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
  wire FIFO_ReadEn;
  wire FIFO_ReadEn_i_2_n_0;
  wire FIFO_ReadEn_i_5_n_0;
  wire FIFO_ReadEn_i_6_n_0;
  wire [9:0]FIFO_Spare;
  wire [63:0]FIFO_Time;
  wire [11:0]FIFO_TrigInfo;
  (* RTL_KEEP = "yes" *) wire \FIFO_WR[response] ;
  wire \FIFO_WR[response]_i_1_n_0 ;
  wire \FIFO_WR[valid]_i_2_n_0 ;
  wire \FIFO_WR_reg[valid]0 ;
  wire \FIFO_WR_reg[valid_n_0_] ;
  wire [8:0]FIFO_WdoAddr;
  wire FIFOresponse;
  wire FIFOvalid;
  wire FIFOvalid_i_1_n_0;
  wire FIFOvalid_i_3_n_0;
  wire \FSM_onehot_fifo_wr_stm[0]_i_2_n_0 ;
  wire \FSM_onehot_fifo_wr_stm[1]_i_1_n_0 ;
  wire \FSM_onehot_fifo_wr_stm[2]_i_1_n_0 ;
  wire \FSM_onehot_fifo_wr_stm[9]_i_1_n_0 ;
  wire \FSM_onehot_fifo_wr_stm[9]_i_3_n_0 ;
  wire \FSM_onehot_fifo_wr_stm[9]_i_4_n_0 ;
  wire \FSM_onehot_fifo_wr_stm[9]_i_5_n_0 ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_fifo_wr_stm_reg_n_0_[0] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_fifo_wr_stm_reg_n_0_[1] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_fifo_wr_stm_reg_n_0_[3] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_fifo_wr_stm_reg_n_0_[5] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_fifo_wr_stm_reg_n_0_[6] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_fifo_wr_stm_reg_n_0_[7] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_fifo_wr_stm_reg_n_0_[8] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_fifo_wr_stm_reg_n_0_[9] ;
  wire \GEN_FIFO[0].FIFOCH_n_0 ;
  wire \GEN_FIFO[0].FIFOCH_n_1 ;
  wire \GEN_FIFO[11].FIFOCH_n_25 ;
  wire \GEN_FIFO[11].FIFOCH_n_26 ;
  wire \GEN_FIFO[12].FIFOCH_n_1 ;
  wire \GEN_FIFO[12].FIFOCH_n_2 ;
  wire \GEN_FIFO[13].FIFOCH_n_1 ;
  wire \GEN_FIFO[13].FIFOCH_n_10 ;
  wire \GEN_FIFO[13].FIFOCH_n_11 ;
  wire \GEN_FIFO[13].FIFOCH_n_12 ;
  wire \GEN_FIFO[13].FIFOCH_n_13 ;
  wire \GEN_FIFO[13].FIFOCH_n_14 ;
  wire \GEN_FIFO[13].FIFOCH_n_15 ;
  wire \GEN_FIFO[13].FIFOCH_n_16 ;
  wire \GEN_FIFO[13].FIFOCH_n_17 ;
  wire \GEN_FIFO[13].FIFOCH_n_2 ;
  wire \GEN_FIFO[13].FIFOCH_n_4 ;
  wire \GEN_FIFO[13].FIFOCH_n_5 ;
  wire \GEN_FIFO[13].FIFOCH_n_6 ;
  wire \GEN_FIFO[13].FIFOCH_n_7 ;
  wire \GEN_FIFO[13].FIFOCH_n_8 ;
  wire \GEN_FIFO[13].FIFOCH_n_9 ;
  wire \GEN_FIFO[14].FIFOCH_n_1 ;
  wire \GEN_FIFO[14].FIFOCH_n_2 ;
  wire \GEN_FIFO[14].FIFOCH_n_3 ;
  wire \GEN_FIFO[14].FIFOCH_n_4 ;
  wire \GEN_FIFO[15].FIFOCH_n_1 ;
  wire \GEN_FIFO[15].FIFOCH_n_10 ;
  wire \GEN_FIFO[15].FIFOCH_n_11 ;
  wire \GEN_FIFO[15].FIFOCH_n_12 ;
  wire \GEN_FIFO[15].FIFOCH_n_13 ;
  wire \GEN_FIFO[15].FIFOCH_n_14 ;
  wire \GEN_FIFO[15].FIFOCH_n_15 ;
  wire \GEN_FIFO[15].FIFOCH_n_16 ;
  wire \GEN_FIFO[15].FIFOCH_n_17 ;
  wire \GEN_FIFO[15].FIFOCH_n_18 ;
  wire \GEN_FIFO[15].FIFOCH_n_19 ;
  wire \GEN_FIFO[15].FIFOCH_n_2 ;
  wire \GEN_FIFO[15].FIFOCH_n_20 ;
  wire \GEN_FIFO[15].FIFOCH_n_21 ;
  wire \GEN_FIFO[15].FIFOCH_n_22 ;
  wire \GEN_FIFO[15].FIFOCH_n_23 ;
  wire \GEN_FIFO[15].FIFOCH_n_24 ;
  wire \GEN_FIFO[15].FIFOCH_n_25 ;
  wire \GEN_FIFO[15].FIFOCH_n_26 ;
  wire \GEN_FIFO[15].FIFOCH_n_3 ;
  wire \GEN_FIFO[15].FIFOCH_n_4 ;
  wire \GEN_FIFO[15].FIFOCH_n_5 ;
  wire \GEN_FIFO[15].FIFOCH_n_6 ;
  wire \GEN_FIFO[15].FIFOCH_n_7 ;
  wire \GEN_FIFO[15].FIFOCH_n_8 ;
  wire \GEN_FIFO[15].FIFOCH_n_9 ;
  wire \GEN_FIFO[1].FIFOCH_n_0 ;
  wire \GEN_FIFO[1].FIFOCH_n_1 ;
  wire \GEN_FIFO[1].FIFOCH_n_10 ;
  wire \GEN_FIFO[1].FIFOCH_n_11 ;
  wire \GEN_FIFO[1].FIFOCH_n_2 ;
  wire \GEN_FIFO[1].FIFOCH_n_3 ;
  wire \GEN_FIFO[1].FIFOCH_n_4 ;
  wire \GEN_FIFO[1].FIFOCH_n_5 ;
  wire \GEN_FIFO[1].FIFOCH_n_6 ;
  wire \GEN_FIFO[1].FIFOCH_n_7 ;
  wire \GEN_FIFO[1].FIFOCH_n_8 ;
  wire \GEN_FIFO[1].FIFOCH_n_9 ;
  wire \GEN_FIFO[2].FIFOCH_n_0 ;
  wire \GEN_FIFO[2].FIFOCH_n_1 ;
  wire \GEN_FIFO[2].FIFOCH_n_16 ;
  wire \GEN_FIFO[2].FIFOCH_n_17 ;
  wire \GEN_FIFO[2].FIFOCH_n_18 ;
  wire \GEN_FIFO[2].FIFOCH_n_19 ;
  wire \GEN_FIFO[2].FIFOCH_n_2 ;
  wire \GEN_FIFO[2].FIFOCH_n_20 ;
  wire \GEN_FIFO[2].FIFOCH_n_21 ;
  wire \GEN_FIFO[2].FIFOCH_n_22 ;
  wire \GEN_FIFO[2].FIFOCH_n_23 ;
  wire \GEN_FIFO[2].FIFOCH_n_24 ;
  wire \GEN_FIFO[2].FIFOCH_n_25 ;
  wire \GEN_FIFO[2].FIFOCH_n_26 ;
  wire \GEN_FIFO[2].FIFOCH_n_27 ;
  wire \GEN_FIFO[2].FIFOCH_n_28 ;
  wire \GEN_FIFO[2].FIFOCH_n_3 ;
  wire \GEN_FIFO[3].FIFOCH_n_12 ;
  wire \GEN_FIFO[3].FIFOCH_n_13 ;
  wire \GEN_FIFO[3].FIFOCH_n_14 ;
  wire \GEN_FIFO[3].FIFOCH_n_15 ;
  wire \GEN_FIFO[3].FIFOCH_n_16 ;
  wire \GEN_FIFO[3].FIFOCH_n_17 ;
  wire \GEN_FIFO[3].FIFOCH_n_18 ;
  wire \GEN_FIFO[3].FIFOCH_n_19 ;
  wire \GEN_FIFO[3].FIFOCH_n_20 ;
  wire \GEN_FIFO[3].FIFOCH_n_21 ;
  wire \GEN_FIFO[3].FIFOCH_n_22 ;
  wire \GEN_FIFO[3].FIFOCH_n_23 ;
  wire \GEN_FIFO[4].FIFOCH_n_0 ;
  wire \GEN_FIFO[4].FIFOCH_n_1 ;
  wire \GEN_FIFO[5].FIFOCH_n_0 ;
  wire \GEN_FIFO[5].FIFOCH_n_1 ;
  wire \GEN_FIFO[5].FIFOCH_n_10 ;
  wire \GEN_FIFO[5].FIFOCH_n_11 ;
  wire \GEN_FIFO[5].FIFOCH_n_12 ;
  wire \GEN_FIFO[5].FIFOCH_n_2 ;
  wire \GEN_FIFO[5].FIFOCH_n_3 ;
  wire \GEN_FIFO[5].FIFOCH_n_4 ;
  wire \GEN_FIFO[5].FIFOCH_n_5 ;
  wire \GEN_FIFO[5].FIFOCH_n_6 ;
  wire \GEN_FIFO[5].FIFOCH_n_7 ;
  wire \GEN_FIFO[5].FIFOCH_n_8 ;
  wire \GEN_FIFO[5].FIFOCH_n_9 ;
  wire \GEN_FIFO[6].FIFOCH_n_1 ;
  wire \GEN_FIFO[6].FIFOCH_n_2 ;
  wire \GEN_FIFO[7].FIFOCH_n_1 ;
  wire \GEN_FIFO[7].FIFOCH_n_2 ;
  wire \GEN_FIFO[8].FIFOCH_n_0 ;
  wire \GEN_FIFO[8].FIFOCH_n_1 ;
  wire \GEN_FIFO[8].FIFOCH_n_10 ;
  wire \GEN_FIFO[8].FIFOCH_n_11 ;
  wire \GEN_FIFO[8].FIFOCH_n_12 ;
  wire \GEN_FIFO[8].FIFOCH_n_13 ;
  wire \GEN_FIFO[8].FIFOCH_n_14 ;
  wire \GEN_FIFO[8].FIFOCH_n_15 ;
  wire \GEN_FIFO[8].FIFOCH_n_16 ;
  wire \GEN_FIFO[8].FIFOCH_n_17 ;
  wire \GEN_FIFO[8].FIFOCH_n_18 ;
  wire \GEN_FIFO[8].FIFOCH_n_19 ;
  wire \GEN_FIFO[8].FIFOCH_n_2 ;
  wire \GEN_FIFO[8].FIFOCH_n_20 ;
  wire \GEN_FIFO[8].FIFOCH_n_21 ;
  wire \GEN_FIFO[8].FIFOCH_n_22 ;
  wire \GEN_FIFO[8].FIFOCH_n_23 ;
  wire \GEN_FIFO[8].FIFOCH_n_24 ;
  wire \GEN_FIFO[8].FIFOCH_n_25 ;
  wire \GEN_FIFO[8].FIFOCH_n_27 ;
  wire \GEN_FIFO[8].FIFOCH_n_3 ;
  wire \GEN_FIFO[8].FIFOCH_n_4 ;
  wire \GEN_FIFO[8].FIFOCH_n_5 ;
  wire \GEN_FIFO[8].FIFOCH_n_6 ;
  wire \GEN_FIFO[8].FIFOCH_n_7 ;
  wire \GEN_FIFO[8].FIFOCH_n_8 ;
  wire \GEN_FIFO[8].FIFOCH_n_9 ;
  wire \GEN_FIFO[9].FIFOCH_n_0 ;
  wire PRECvalid;
  wire PSBUSY_i;
  wire TestFIFO;
  wire [11:0]Trigger_intl;
  wire \Trigger_intl[10]_i_1_n_0 ;
  wire \Trigger_intl[3]_i_1_n_0 ;
  wire \Trigger_intl[4]_i_1_n_0 ;
  wire \Trigger_intl[5]_i_1_n_0 ;
  wire \Trigger_intl[6]_i_1_n_0 ;
  wire \Trigger_intl[9]_i_1_n_0 ;
  wire [8:0]WDONBR_intl;
  wire \WDONBR_intl[1]_i_1_n_0 ;
  wire \WDONBR_intl[2]_i_1_n_0 ;
  wire \WDONBR_intl[4]_i_1_n_0 ;
  wire \WDONBR_intl[5]_i_1_n_0 ;
  wire \WDONBR_intl[7]_i_1_n_0 ;
  wire \WDONBR_intl[8]_i_1_n_0 ;
  wire WDOTime_intl0;
  wire \WDOTime_intl[0]_i_1_n_0 ;
  wire \WDOTime_intl[10]_i_1_n_0 ;
  wire \WDOTime_intl[11]_i_1_n_0 ;
  wire \WDOTime_intl[12]_i_1_n_0 ;
  wire \WDOTime_intl[13]_i_1_n_0 ;
  wire \WDOTime_intl[14]_i_1_n_0 ;
  wire \WDOTime_intl[15]_i_1_n_0 ;
  wire \WDOTime_intl[16]_i_1_n_0 ;
  wire \WDOTime_intl[17]_i_1_n_0 ;
  wire \WDOTime_intl[18]_i_1_n_0 ;
  wire \WDOTime_intl[19]_i_1_n_0 ;
  wire \WDOTime_intl[1]_i_1_n_0 ;
  wire \WDOTime_intl[20]_i_1_n_0 ;
  wire \WDOTime_intl[21]_i_1_n_0 ;
  wire \WDOTime_intl[22]_i_1_n_0 ;
  wire \WDOTime_intl[23]_i_1_n_0 ;
  wire \WDOTime_intl[24]_i_1_n_0 ;
  wire \WDOTime_intl[25]_i_1_n_0 ;
  wire \WDOTime_intl[26]_i_1_n_0 ;
  wire \WDOTime_intl[27]_i_1_n_0 ;
  wire \WDOTime_intl[28]_i_1_n_0 ;
  wire \WDOTime_intl[29]_i_1_n_0 ;
  wire \WDOTime_intl[2]_i_1_n_0 ;
  wire \WDOTime_intl[30]_i_1_n_0 ;
  wire \WDOTime_intl[31]_i_2_n_0 ;
  wire \WDOTime_intl[3]_i_1_n_0 ;
  wire \WDOTime_intl[4]_i_1_n_0 ;
  wire \WDOTime_intl[5]_i_1_n_0 ;
  wire \WDOTime_intl[6]_i_1_n_0 ;
  wire \WDOTime_intl[7]_i_1_n_0 ;
  wire \WDOTime_intl[8]_i_1_n_0 ;
  wire \WDOTime_intl[9]_i_1_n_0 ;
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
  wire \cnt_fifo[0]_i_3_n_0 ;
  wire \cnt_fifo[1]_i_1_n_0 ;
  wire \cnt_fifo[2]_i_1_n_0 ;
  wire \cnt_fifo[3]_i_1_n_0 ;
  wire \cnt_fifo[4]_i_1_n_0 ;
  wire \cnt_fifo[5]_i_1_n_0 ;
  wire \cnt_fifo[6]_i_1_n_0 ;
  wire \cnt_fifo[7]_i_1_n_0 ;
  wire \cnt_fifo[8]_i_1_n_0 ;
  wire \cnt_fifo[8]_i_3_n_0 ;
  wire \cnt_fifo[8]_i_4_n_0 ;
  wire \cnt_fifo[8]_i_5_n_0 ;
  wire \cnt_fifo[8]_i_6_n_0 ;
  wire \cnt_fifo[8]_i_7_n_0 ;
  wire \cnt_fifo_reg_n_0_[0] ;
  wire \cnt_fifo_reg_n_0_[1] ;
  wire \cnt_fifo_reg_n_0_[2] ;
  wire \cnt_fifo_reg_n_0_[3] ;
  wire \cnt_fifo_reg_n_0_[4] ;
  wire [31:0]data1;
  wire [31:31]data3;
  wire [3:0]fifo_rd_stm;
  wire fifo_rd_stm0;
  wire \fifo_rd_stm[0]_i_2_n_0 ;
  wire \fifo_rd_stm[0]_i_3_n_0 ;
  wire \fifo_rd_stm[0]_i_4_n_0 ;
  wire \fifo_rd_stm[0]_i_6_n_0 ;
  wire \fifo_rd_stm[0]_i_7_n_0 ;
  wire \fifo_rd_stm[0]_i_8_n_0 ;
  wire \fifo_rd_stm[1]_i_2_n_0 ;
  wire \fifo_rd_stm[1]_i_3_n_0 ;
  wire \fifo_rd_stm[1]_i_4_n_0 ;
  wire \fifo_rd_stm[1]_i_5_n_0 ;
  wire \fifo_rd_stm[1]_i_6_n_0 ;
  wire \fifo_rd_stm[2]_i_2_n_0 ;
  wire \fifo_rd_stm[2]_i_3_n_0 ;
  wire \fifo_rd_stm[2]_i_4_n_0 ;
  wire \fifo_rd_stm[3]_i_3_n_0 ;
  wire \fifo_rd_stm[3]_i_4_n_0 ;
  wire \fifo_rd_stm[3]_i_5_n_0 ;
  wire \fifo_rd_stm_reg_n_0_[0] ;
  wire \fifo_rd_stm_reg_n_0_[1] ;
  wire \fifo_rd_stm_reg_n_0_[2] ;
  wire \fifo_rd_stm_reg_n_0_[3] ;
  wire [15:1]full;
  wire [2:0]last_fifo_rd_stm;
  wire \last_fifo_rd_stm[0]_i_1_n_0 ;
  wire \last_fifo_rd_stm[2]_i_1_n_0 ;
  wire nRST;
  wire p_0_in;
  wire [31:0]p_1_in;
  wire [5:5]r_FIFO_COUNT_reg;
  wire [5:5]r_FIFO_COUNT_reg_0;
  wire [5:5]r_FIFO_COUNT_reg_1;
  wire [5:5]r_FIFO_COUNT_reg_2;
  wire [5:5]r_FIFO_COUNT_reg_3;
  wire [5:5]r_FIFO_COUNT_reg_4;
  wire [11:0]\rd_data12[0]_0 ;
  wire [11:0]\rd_data12[10]_10 ;
  wire [11:0]\rd_data12[11]_11 ;
  wire [11:0]\rd_data12[12]_12 ;
  wire [11:0]\rd_data12[14]_14 ;
  wire [11:0]\rd_data12[2]_2 ;
  wire [11:0]\rd_data12[3]_3 ;
  wire [11:0]\rd_data12[4]_4 ;
  wire [11:0]\rd_data12[6]_6 ;
  wire [11:0]\rd_data12[7]_7 ;
  wire [11:0]\rd_data12[9]_9 ;
  wire rd_en;
  wire rd_en0;
  wire rd_en0__7;
  wire rd_en_i_1_n_0;
  wire rd_en_i_2_n_0;
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
  (* RTL_KEEP = "yes" *) wire wr_en;
  wire wr_en_i_1_n_0;
  wire wr_en_reg_n_0;

  FDRE \DIGTime_intl_reg[0] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Spare[0]),
        .Q(\DIGTime_intl_reg_n_0_[0] ),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \DIGTime_intl_reg[1] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Spare[1]),
        .Q(\DIGTime_intl_reg_n_0_[1] ),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \DIGTime_intl_reg[2] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Spare[2]),
        .Q(\DIGTime_intl_reg_n_0_[2] ),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \DIGTime_intl_reg[3] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Spare[3]),
        .Q(\DIGTime_intl_reg_n_0_[3] ),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \DIGTime_intl_reg[4] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Spare[4]),
        .Q(\DIGTime_intl_reg_n_0_[4] ),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \DIGTime_intl_reg[5] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Spare[5]),
        .Q(\DIGTime_intl_reg_n_0_[5] ),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \DIGTime_intl_reg[63] 
       (.C(CLK),
        .CE(1'b1),
        .D(\GEN_FIFO[8].FIFOCH_n_27 ),
        .Q(data3),
        .R(1'b0));
  FDRE \DIGTime_intl_reg[6] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Spare[6]),
        .Q(\DIGTime_intl_reg_n_0_[6] ),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \DIGTime_intl_reg[7] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Spare[7]),
        .Q(\DIGTime_intl_reg_n_0_[7] ),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \DIGTime_intl_reg[8] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Spare[8]),
        .Q(\DIGTime_intl_reg_n_0_[8] ),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \DIGTime_intl_reg[9] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Spare[9]),
        .Q(\DIGTime_intl_reg_n_0_[9] ),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF725072507250)) 
    \DataOut[0]_i_2 
       (.I0(rdy_state[0]),
        .I1(rdy_state[1]),
        .I2(\DataOut_last_reg_n_0_[0] ),
        .I3(DataOut_stall[0]),
        .I4(DataOut_intlH[0]),
        .I5(\DataOut[31]_i_2_n_0 ),
        .O(\DataOut[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF725072507250)) 
    \DataOut[10]_i_2 
       (.I0(rdy_state[0]),
        .I1(rdy_state[1]),
        .I2(\DataOut_last_reg_n_0_[10] ),
        .I3(DataOut_stall[10]),
        .I4(DataOut_intlH[10]),
        .I5(\DataOut[31]_i_2_n_0 ),
        .O(\DataOut[10]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut[11]_i_10 
       (.I0(address[2]),
        .I1(address[3]),
        .O(\DataOut[11]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF725072507250)) 
    \DataOut[11]_i_2 
       (.I0(rdy_state[0]),
        .I1(rdy_state[1]),
        .I2(\DataOut_last_reg_n_0_[11] ),
        .I3(DataOut_stall[11]),
        .I4(DataOut_intlH[11]),
        .I5(\DataOut[31]_i_2_n_0 ),
        .O(\DataOut[11]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \DataOut[11]_i_5 
       (.I0(address[0]),
        .I1(address[1]),
        .I2(address[3]),
        .I3(address[2]),
        .O(\DataOut[11]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h2000000000000000)) 
    \DataOut[11]_i_6 
       (.I0(\fifo_rd_stm_reg_n_0_[2] ),
        .I1(\fifo_rd_stm_reg_n_0_[3] ),
        .I2(\fifo_rd_stm_reg_n_0_[1] ),
        .I3(rdy_state[0]),
        .I4(rdy_state[1]),
        .I5(\fifo_rd_stm_reg_n_0_[0] ),
        .O(\DataOut[11]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \DataOut[11]_i_8 
       (.I0(address[2]),
        .I1(address[3]),
        .I2(address[1]),
        .I3(address[0]),
        .O(\DataOut[11]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h88F8)) 
    \DataOut[12]_i_1 
       (.I0(DataOut_intlH[12]),
        .I1(\DataOut[31]_i_2_n_0 ),
        .I2(\DataOut_last_reg_n_0_[12] ),
        .I3(rdy_state[0]),
        .O(\DataOut[12]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h88F8)) 
    \DataOut[13]_i_1 
       (.I0(DataOut_intlH[13]),
        .I1(\DataOut[31]_i_2_n_0 ),
        .I2(\DataOut_last_reg_n_0_[13] ),
        .I3(rdy_state[0]),
        .O(\DataOut[13]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h88F8)) 
    \DataOut[14]_i_1 
       (.I0(DataOut_intlH[14]),
        .I1(\DataOut[31]_i_2_n_0 ),
        .I2(\DataOut_last_reg_n_0_[14] ),
        .I3(rdy_state[0]),
        .O(\DataOut[14]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h88F8)) 
    \DataOut[15]_i_1 
       (.I0(DataOut_intlH[15]),
        .I1(\DataOut[31]_i_2_n_0 ),
        .I2(\DataOut_last_reg_n_0_[15] ),
        .I3(rdy_state[0]),
        .O(\DataOut[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h88F8)) 
    \DataOut[16]_i_1 
       (.I0(DataOut_intlH[16]),
        .I1(\DataOut[31]_i_2_n_0 ),
        .I2(\DataOut_last_reg_n_0_[16] ),
        .I3(rdy_state[0]),
        .O(\DataOut[16]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h88F8)) 
    \DataOut[17]_i_1 
       (.I0(DataOut_intlH[17]),
        .I1(\DataOut[31]_i_2_n_0 ),
        .I2(\DataOut_last_reg_n_0_[17] ),
        .I3(rdy_state[0]),
        .O(\DataOut[17]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h88F8)) 
    \DataOut[18]_i_1 
       (.I0(DataOut_intlH[18]),
        .I1(\DataOut[31]_i_2_n_0 ),
        .I2(\DataOut_last_reg_n_0_[18] ),
        .I3(rdy_state[0]),
        .O(\DataOut[18]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h88F8)) 
    \DataOut[19]_i_1 
       (.I0(DataOut_intlH[19]),
        .I1(\DataOut[31]_i_2_n_0 ),
        .I2(\DataOut_last_reg_n_0_[19] ),
        .I3(rdy_state[0]),
        .O(\DataOut[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF725072507250)) 
    \DataOut[1]_i_2 
       (.I0(rdy_state[0]),
        .I1(rdy_state[1]),
        .I2(\DataOut_last_reg_n_0_[1] ),
        .I3(DataOut_stall[1]),
        .I4(DataOut_intlH[1]),
        .I5(\DataOut[31]_i_2_n_0 ),
        .O(\DataOut[1]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h88F8)) 
    \DataOut[20]_i_1 
       (.I0(DataOut_intlH[20]),
        .I1(\DataOut[31]_i_2_n_0 ),
        .I2(\DataOut_last_reg_n_0_[20] ),
        .I3(rdy_state[0]),
        .O(\DataOut[20]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h88F8)) 
    \DataOut[21]_i_1 
       (.I0(DataOut_intlH[21]),
        .I1(\DataOut[31]_i_2_n_0 ),
        .I2(\DataOut_last_reg_n_0_[21] ),
        .I3(rdy_state[0]),
        .O(\DataOut[21]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h88F8)) 
    \DataOut[22]_i_1 
       (.I0(DataOut_intlH[22]),
        .I1(\DataOut[31]_i_2_n_0 ),
        .I2(\DataOut_last_reg_n_0_[22] ),
        .I3(rdy_state[0]),
        .O(\DataOut[22]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h88F8)) 
    \DataOut[23]_i_1 
       (.I0(DataOut_intlH[23]),
        .I1(\DataOut[31]_i_2_n_0 ),
        .I2(\DataOut_last_reg_n_0_[23] ),
        .I3(rdy_state[0]),
        .O(\DataOut[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h88F8)) 
    \DataOut[24]_i_1 
       (.I0(DataOut_intlH[24]),
        .I1(\DataOut[31]_i_2_n_0 ),
        .I2(\DataOut_last_reg_n_0_[24] ),
        .I3(rdy_state[0]),
        .O(\DataOut[24]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h88F8)) 
    \DataOut[25]_i_1 
       (.I0(DataOut_intlH[25]),
        .I1(\DataOut[31]_i_2_n_0 ),
        .I2(\DataOut_last_reg_n_0_[25] ),
        .I3(rdy_state[0]),
        .O(\DataOut[25]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h88F8)) 
    \DataOut[26]_i_1 
       (.I0(DataOut_intlH[26]),
        .I1(\DataOut[31]_i_2_n_0 ),
        .I2(\DataOut_last_reg_n_0_[26] ),
        .I3(rdy_state[0]),
        .O(\DataOut[26]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h88F8)) 
    \DataOut[27]_i_1 
       (.I0(DataOut_intlH[27]),
        .I1(\DataOut[31]_i_2_n_0 ),
        .I2(\DataOut_last_reg_n_0_[27] ),
        .I3(rdy_state[0]),
        .O(\DataOut[27]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h88F8)) 
    \DataOut[28]_i_1 
       (.I0(DataOut_intlH[28]),
        .I1(\DataOut[31]_i_2_n_0 ),
        .I2(\DataOut_last_reg_n_0_[28] ),
        .I3(rdy_state[0]),
        .O(\DataOut[28]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h88F8)) 
    \DataOut[29]_i_1 
       (.I0(DataOut_intlH[29]),
        .I1(\DataOut[31]_i_2_n_0 ),
        .I2(\DataOut_last_reg_n_0_[29] ),
        .I3(rdy_state[0]),
        .O(\DataOut[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF725072507250)) 
    \DataOut[2]_i_2 
       (.I0(rdy_state[0]),
        .I1(rdy_state[1]),
        .I2(\DataOut_last_reg_n_0_[2] ),
        .I3(DataOut_stall[2]),
        .I4(DataOut_intlH[2]),
        .I5(\DataOut[31]_i_2_n_0 ),
        .O(\DataOut[2]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h88F8)) 
    \DataOut[30]_i_1 
       (.I0(DataOut_intlH[30]),
        .I1(\DataOut[31]_i_2_n_0 ),
        .I2(\DataOut_last_reg_n_0_[30] ),
        .I3(rdy_state[0]),
        .O(\DataOut[30]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h88F8)) 
    \DataOut[31]_i_1 
       (.I0(DataOut_intlH[31]),
        .I1(\DataOut[31]_i_2_n_0 ),
        .I2(\DataOut_last_reg_n_0_[31] ),
        .I3(rdy_state[0]),
        .O(\DataOut[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000020000000)) 
    \DataOut[31]_i_2 
       (.I0(\fifo_rd_stm_reg_n_0_[2] ),
        .I1(\fifo_rd_stm_reg_n_0_[3] ),
        .I2(\fifo_rd_stm_reg_n_0_[1] ),
        .I3(rdy_state[0]),
        .I4(rdy_state[1]),
        .I5(\fifo_rd_stm_reg_n_0_[0] ),
        .O(\DataOut[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF725072507250)) 
    \DataOut[3]_i_2 
       (.I0(rdy_state[0]),
        .I1(rdy_state[1]),
        .I2(\DataOut_last_reg_n_0_[3] ),
        .I3(DataOut_stall[3]),
        .I4(DataOut_intlH[3]),
        .I5(\DataOut[31]_i_2_n_0 ),
        .O(\DataOut[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF725072507250)) 
    \DataOut[4]_i_2 
       (.I0(rdy_state[0]),
        .I1(rdy_state[1]),
        .I2(\DataOut_last_reg_n_0_[4] ),
        .I3(DataOut_stall[4]),
        .I4(DataOut_intlH[4]),
        .I5(\DataOut[31]_i_2_n_0 ),
        .O(\DataOut[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF725072507250)) 
    \DataOut[5]_i_2 
       (.I0(rdy_state[0]),
        .I1(rdy_state[1]),
        .I2(\DataOut_last_reg_n_0_[5] ),
        .I3(DataOut_stall[5]),
        .I4(DataOut_intlH[5]),
        .I5(\DataOut[31]_i_2_n_0 ),
        .O(\DataOut[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF725072507250)) 
    \DataOut[6]_i_2 
       (.I0(rdy_state[0]),
        .I1(rdy_state[1]),
        .I2(\DataOut_last_reg_n_0_[6] ),
        .I3(DataOut_stall[6]),
        .I4(DataOut_intlH[6]),
        .I5(\DataOut[31]_i_2_n_0 ),
        .O(\DataOut[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF725072507250)) 
    \DataOut[7]_i_2 
       (.I0(rdy_state[0]),
        .I1(rdy_state[1]),
        .I2(\DataOut_last_reg_n_0_[7] ),
        .I3(DataOut_stall[7]),
        .I4(DataOut_intlH[7]),
        .I5(\DataOut[31]_i_2_n_0 ),
        .O(\DataOut[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF725072507250)) 
    \DataOut[8]_i_2 
       (.I0(rdy_state[0]),
        .I1(rdy_state[1]),
        .I2(\DataOut_last_reg_n_0_[8] ),
        .I3(DataOut_stall[8]),
        .I4(DataOut_intlH[8]),
        .I5(\DataOut[31]_i_2_n_0 ),
        .O(\DataOut[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF725072507250)) 
    \DataOut[9]_i_2 
       (.I0(rdy_state[0]),
        .I1(rdy_state[1]),
        .I2(\DataOut_last_reg_n_0_[9] ),
        .I3(DataOut_stall[9]),
        .I4(DataOut_intlH[9]),
        .I5(\DataOut[31]_i_2_n_0 ),
        .O(\DataOut[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \DataOut_intlH[0]_i_1 
       (.I0(\DataOut_intlH[0]_i_2_n_0 ),
        .I1(\DIGTime_intl_reg_n_0_[0] ),
        .I2(\DataOut_intlH[8]_i_3_n_0 ),
        .I3(\WDOTime_intl_reg_n_0_[0] ),
        .I4(\DataOut_intlH[31]_i_4_n_0 ),
        .I5(\DataOut_intlH[0]_i_3_n_0 ),
        .O(\DataOut_intlH[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0320002000200020)) 
    \DataOut_intlH[0]_i_2 
       (.I0(Trigger_intl[0]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\cnt_fifo_reg_n_0_[2] ),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(data3),
        .I5(\cnt_fifo_reg_n_0_[1] ),
        .O(\DataOut_intlH[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000A0000000A0C0)) 
    \DataOut_intlH[0]_i_3 
       (.I0(WDONBR_intl[0]),
        .I1(data1[0]),
        .I2(\cnt_fifo_reg_n_0_[0] ),
        .I3(\cnt_fifo_reg_n_0_[2] ),
        .I4(\fifo_rd_stm_reg_n_0_[0] ),
        .I5(\cnt_fifo_reg_n_0_[1] ),
        .O(\DataOut_intlH[0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    \DataOut_intlH[10]_i_1 
       (.I0(\DataOut_intlH[31]_i_4_n_0 ),
        .I1(\WDOTime_intl_reg_n_0_[10] ),
        .I2(\DataOut_intlH[31]_i_5_n_0 ),
        .I3(data1[10]),
        .I4(\DataOut_intlH[10]_i_2_n_0 ),
        .O(\DataOut_intlH[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h002200C000220000)) 
    \DataOut_intlH[10]_i_2 
       (.I0(Trigger_intl[10]),
        .I1(\cnt_fifo_reg_n_0_[0] ),
        .I2(data3),
        .I3(\fifo_rd_stm_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\cnt_fifo_reg_n_0_[1] ),
        .O(\DataOut_intlH[10]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    \DataOut_intlH[11]_i_1 
       (.I0(\DataOut_intlH[31]_i_4_n_0 ),
        .I1(\WDOTime_intl_reg_n_0_[11] ),
        .I2(\DataOut_intlH[31]_i_5_n_0 ),
        .I3(data1[11]),
        .I4(\DataOut_intlH[11]_i_2_n_0 ),
        .O(\DataOut_intlH[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h002200C000220000)) 
    \DataOut_intlH[11]_i_2 
       (.I0(Trigger_intl[11]),
        .I1(\cnt_fifo_reg_n_0_[0] ),
        .I2(data3),
        .I3(\fifo_rd_stm_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\cnt_fifo_reg_n_0_[1] ),
        .O(\DataOut_intlH[11]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \DataOut_intlH[12]_i_1 
       (.I0(\DataOut_intlH[28]_i_2_n_0 ),
        .I1(\DataOut_intlH[31]_i_4_n_0 ),
        .I2(\WDOTime_intl_reg_n_0_[12] ),
        .I3(data1[12]),
        .I4(\DataOut_intlH[31]_i_5_n_0 ),
        .O(\DataOut_intlH[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \DataOut_intlH[13]_i_1 
       (.I0(\DataOut_intlH[31]_i_3_n_0 ),
        .I1(\DataOut_intlH[31]_i_4_n_0 ),
        .I2(\WDOTime_intl_reg_n_0_[13] ),
        .I3(data1[13]),
        .I4(\DataOut_intlH[31]_i_5_n_0 ),
        .O(\DataOut_intlH[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \DataOut_intlH[14]_i_1 
       (.I0(\DataOut_intlH[28]_i_2_n_0 ),
        .I1(\DataOut_intlH[31]_i_4_n_0 ),
        .I2(\WDOTime_intl_reg_n_0_[14] ),
        .I3(data1[14]),
        .I4(\DataOut_intlH[31]_i_5_n_0 ),
        .O(\DataOut_intlH[14]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \DataOut_intlH[15]_i_1 
       (.I0(\DataOut_intlH[31]_i_3_n_0 ),
        .I1(\DataOut_intlH[31]_i_4_n_0 ),
        .I2(\WDOTime_intl_reg_n_0_[15] ),
        .I3(data1[15]),
        .I4(\DataOut_intlH[31]_i_5_n_0 ),
        .O(\DataOut_intlH[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \DataOut_intlH[16]_i_1 
       (.I0(\DataOut_intlH[31]_i_3_n_0 ),
        .I1(\DataOut_intlH[31]_i_4_n_0 ),
        .I2(\WDOTime_intl_reg_n_0_[16] ),
        .I3(data1[16]),
        .I4(\DataOut_intlH[31]_i_5_n_0 ),
        .O(\DataOut_intlH[16]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \DataOut_intlH[17]_i_1 
       (.I0(\DataOut_intlH[31]_i_3_n_0 ),
        .I1(\DataOut_intlH[31]_i_4_n_0 ),
        .I2(\WDOTime_intl_reg_n_0_[17] ),
        .I3(data1[17]),
        .I4(\DataOut_intlH[31]_i_5_n_0 ),
        .O(\DataOut_intlH[17]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \DataOut_intlH[18]_i_1 
       (.I0(\DataOut_intlH[28]_i_2_n_0 ),
        .I1(\DataOut_intlH[31]_i_4_n_0 ),
        .I2(\WDOTime_intl_reg_n_0_[18] ),
        .I3(data1[18]),
        .I4(\DataOut_intlH[31]_i_5_n_0 ),
        .O(\DataOut_intlH[18]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \DataOut_intlH[19]_i_1 
       (.I0(\DataOut_intlH[31]_i_3_n_0 ),
        .I1(\DataOut_intlH[31]_i_4_n_0 ),
        .I2(\WDOTime_intl_reg_n_0_[19] ),
        .I3(data1[19]),
        .I4(\DataOut_intlH[31]_i_5_n_0 ),
        .O(\DataOut_intlH[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \DataOut_intlH[1]_i_1 
       (.I0(\DataOut_intlH[1]_i_2_n_0 ),
        .I1(\DIGTime_intl_reg_n_0_[1] ),
        .I2(\DataOut_intlH[8]_i_3_n_0 ),
        .I3(\WDOTime_intl_reg_n_0_[1] ),
        .I4(\DataOut_intlH[31]_i_4_n_0 ),
        .I5(\DataOut_intlH[1]_i_3_n_0 ),
        .O(\DataOut_intlH[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0320002000200020)) 
    \DataOut_intlH[1]_i_2 
       (.I0(Trigger_intl[1]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\cnt_fifo_reg_n_0_[2] ),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(data3),
        .I5(\cnt_fifo_reg_n_0_[1] ),
        .O(\DataOut_intlH[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000A0000000A0C0)) 
    \DataOut_intlH[1]_i_3 
       (.I0(WDONBR_intl[1]),
        .I1(data1[1]),
        .I2(\cnt_fifo_reg_n_0_[0] ),
        .I3(\cnt_fifo_reg_n_0_[2] ),
        .I4(\fifo_rd_stm_reg_n_0_[0] ),
        .I5(\cnt_fifo_reg_n_0_[1] ),
        .O(\DataOut_intlH[1]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \DataOut_intlH[20]_i_1 
       (.I0(\DataOut_intlH[28]_i_2_n_0 ),
        .I1(\DataOut_intlH[31]_i_4_n_0 ),
        .I2(\WDOTime_intl_reg_n_0_[20] ),
        .I3(data1[20]),
        .I4(\DataOut_intlH[31]_i_5_n_0 ),
        .O(\DataOut_intlH[20]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \DataOut_intlH[21]_i_1 
       (.I0(\DataOut_intlH[28]_i_2_n_0 ),
        .I1(\DataOut_intlH[31]_i_4_n_0 ),
        .I2(\WDOTime_intl_reg_n_0_[21] ),
        .I3(data1[21]),
        .I4(\DataOut_intlH[31]_i_5_n_0 ),
        .O(\DataOut_intlH[21]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \DataOut_intlH[22]_i_1 
       (.I0(\DataOut_intlH[31]_i_3_n_0 ),
        .I1(\DataOut_intlH[31]_i_4_n_0 ),
        .I2(\WDOTime_intl_reg_n_0_[22] ),
        .I3(data1[22]),
        .I4(\DataOut_intlH[31]_i_5_n_0 ),
        .O(\DataOut_intlH[22]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \DataOut_intlH[23]_i_1 
       (.I0(\DataOut_intlH[31]_i_3_n_0 ),
        .I1(\DataOut_intlH[31]_i_4_n_0 ),
        .I2(\WDOTime_intl_reg_n_0_[23] ),
        .I3(data1[23]),
        .I4(\DataOut_intlH[31]_i_5_n_0 ),
        .O(\DataOut_intlH[23]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \DataOut_intlH[24]_i_1 
       (.I0(\DataOut_intlH[31]_i_3_n_0 ),
        .I1(\DataOut_intlH[31]_i_4_n_0 ),
        .I2(\WDOTime_intl_reg_n_0_[24] ),
        .I3(data1[24]),
        .I4(\DataOut_intlH[31]_i_5_n_0 ),
        .O(\DataOut_intlH[24]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \DataOut_intlH[25]_i_1 
       (.I0(\DataOut_intlH[28]_i_2_n_0 ),
        .I1(\DataOut_intlH[31]_i_4_n_0 ),
        .I2(\WDOTime_intl_reg_n_0_[25] ),
        .I3(data1[25]),
        .I4(\DataOut_intlH[31]_i_5_n_0 ),
        .O(\DataOut_intlH[25]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \DataOut_intlH[26]_i_1 
       (.I0(\DataOut_intlH[31]_i_3_n_0 ),
        .I1(\DataOut_intlH[31]_i_4_n_0 ),
        .I2(\WDOTime_intl_reg_n_0_[26] ),
        .I3(data1[26]),
        .I4(\DataOut_intlH[31]_i_5_n_0 ),
        .O(\DataOut_intlH[26]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \DataOut_intlH[27]_i_1 
       (.I0(\DataOut_intlH[31]_i_3_n_0 ),
        .I1(\DataOut_intlH[31]_i_4_n_0 ),
        .I2(\WDOTime_intl_reg_n_0_[27] ),
        .I3(data1[27]),
        .I4(\DataOut_intlH[31]_i_5_n_0 ),
        .O(\DataOut_intlH[27]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \DataOut_intlH[28]_i_1 
       (.I0(\DataOut_intlH[28]_i_2_n_0 ),
        .I1(\DataOut_intlH[31]_i_4_n_0 ),
        .I2(\WDOTime_intl_reg_n_0_[28] ),
        .I3(data1[28]),
        .I4(\DataOut_intlH[31]_i_5_n_0 ),
        .O(\DataOut_intlH[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT5 #(
    .INIT(32'h04080400)) 
    \DataOut_intlH[28]_i_2 
       (.I0(\cnt_fifo_reg_n_0_[0] ),
        .I1(data3),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(\cnt_fifo_reg_n_0_[2] ),
        .I4(\cnt_fifo_reg_n_0_[1] ),
        .O(\DataOut_intlH[28]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \DataOut_intlH[29]_i_1 
       (.I0(\DataOut_intlH[31]_i_3_n_0 ),
        .I1(\DataOut_intlH[31]_i_4_n_0 ),
        .I2(\WDOTime_intl_reg_n_0_[29] ),
        .I3(data1[29]),
        .I4(\DataOut_intlH[31]_i_5_n_0 ),
        .O(\DataOut_intlH[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \DataOut_intlH[2]_i_1 
       (.I0(\DataOut_intlH[2]_i_2_n_0 ),
        .I1(\DIGTime_intl_reg_n_0_[2] ),
        .I2(\DataOut_intlH[8]_i_3_n_0 ),
        .I3(\WDOTime_intl_reg_n_0_[2] ),
        .I4(\DataOut_intlH[31]_i_4_n_0 ),
        .I5(\DataOut_intlH[2]_i_3_n_0 ),
        .O(\DataOut_intlH[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0320002000200020)) 
    \DataOut_intlH[2]_i_2 
       (.I0(Trigger_intl[2]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\cnt_fifo_reg_n_0_[2] ),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(data3),
        .I5(\cnt_fifo_reg_n_0_[1] ),
        .O(\DataOut_intlH[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000A0000000A0C0)) 
    \DataOut_intlH[2]_i_3 
       (.I0(WDONBR_intl[2]),
        .I1(data1[2]),
        .I2(\cnt_fifo_reg_n_0_[0] ),
        .I3(\cnt_fifo_reg_n_0_[2] ),
        .I4(\fifo_rd_stm_reg_n_0_[0] ),
        .I5(\cnt_fifo_reg_n_0_[1] ),
        .O(\DataOut_intlH[2]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \DataOut_intlH[30]_i_1 
       (.I0(\DataOut_intlH[31]_i_3_n_0 ),
        .I1(\DataOut_intlH[31]_i_4_n_0 ),
        .I2(\WDOTime_intl_reg_n_0_[30] ),
        .I3(data1[30]),
        .I4(\DataOut_intlH[31]_i_5_n_0 ),
        .O(\DataOut_intlH[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000503000)) 
    \DataOut_intlH[31]_i_1 
       (.I0(\fifo_rd_stm[0]_i_4_n_0 ),
        .I1(PSBUSY_i),
        .I2(ready_i),
        .I3(\fifo_rd_stm_reg_n_0_[0] ),
        .I4(\fifo_rd_stm_reg_n_0_[1] ),
        .I5(\fifo_rd_stm[1]_i_4_n_0 ),
        .O(\DataOut_intlH[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \DataOut_intlH[31]_i_2 
       (.I0(\DataOut_intlH[31]_i_3_n_0 ),
        .I1(\DataOut_intlH[31]_i_4_n_0 ),
        .I2(\WDOTime_intl_reg_n_0_[31] ),
        .I3(data1[31]),
        .I4(\DataOut_intlH[31]_i_5_n_0 ),
        .O(\DataOut_intlH[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT5 #(
    .INIT(32'h02000000)) 
    \DataOut_intlH[31]_i_3 
       (.I0(\cnt_fifo_reg_n_0_[1] ),
        .I1(\cnt_fifo_reg_n_0_[2] ),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(data3),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .O(\DataOut_intlH[31]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFF01)) 
    \DataOut_intlH[31]_i_4 
       (.I0(\cnt_fifo_reg_n_0_[0] ),
        .I1(\cnt_fifo_reg_n_0_[1] ),
        .I2(\cnt_fifo_reg_n_0_[2] ),
        .I3(\fifo_rd_stm_reg_n_0_[0] ),
        .O(\DataOut_intlH[31]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \DataOut_intlH[31]_i_5 
       (.I0(\cnt_fifo_reg_n_0_[0] ),
        .I1(\cnt_fifo_reg_n_0_[2] ),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(\cnt_fifo_reg_n_0_[1] ),
        .O(\DataOut_intlH[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \DataOut_intlH[3]_i_1 
       (.I0(\DataOut_intlH[3]_i_2_n_0 ),
        .I1(\DIGTime_intl_reg_n_0_[3] ),
        .I2(\DataOut_intlH[8]_i_3_n_0 ),
        .I3(\WDOTime_intl_reg_n_0_[3] ),
        .I4(\DataOut_intlH[31]_i_4_n_0 ),
        .I5(\DataOut_intlH[3]_i_3_n_0 ),
        .O(\DataOut_intlH[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0320002000200020)) 
    \DataOut_intlH[3]_i_2 
       (.I0(Trigger_intl[3]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\cnt_fifo_reg_n_0_[2] ),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(data3),
        .I5(\cnt_fifo_reg_n_0_[1] ),
        .O(\DataOut_intlH[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000A0000000A0C0)) 
    \DataOut_intlH[3]_i_3 
       (.I0(WDONBR_intl[3]),
        .I1(data1[3]),
        .I2(\cnt_fifo_reg_n_0_[0] ),
        .I3(\cnt_fifo_reg_n_0_[2] ),
        .I4(\fifo_rd_stm_reg_n_0_[0] ),
        .I5(\cnt_fifo_reg_n_0_[1] ),
        .O(\DataOut_intlH[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \DataOut_intlH[4]_i_1 
       (.I0(\DataOut_intlH[4]_i_2_n_0 ),
        .I1(\DIGTime_intl_reg_n_0_[4] ),
        .I2(\DataOut_intlH[8]_i_3_n_0 ),
        .I3(\WDOTime_intl_reg_n_0_[4] ),
        .I4(\DataOut_intlH[31]_i_4_n_0 ),
        .I5(\DataOut_intlH[4]_i_3_n_0 ),
        .O(\DataOut_intlH[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0320002000200020)) 
    \DataOut_intlH[4]_i_2 
       (.I0(Trigger_intl[4]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\cnt_fifo_reg_n_0_[2] ),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(data3),
        .I5(\cnt_fifo_reg_n_0_[1] ),
        .O(\DataOut_intlH[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000A0000000A0C0)) 
    \DataOut_intlH[4]_i_3 
       (.I0(WDONBR_intl[4]),
        .I1(data1[4]),
        .I2(\cnt_fifo_reg_n_0_[0] ),
        .I3(\cnt_fifo_reg_n_0_[2] ),
        .I4(\fifo_rd_stm_reg_n_0_[0] ),
        .I5(\cnt_fifo_reg_n_0_[1] ),
        .O(\DataOut_intlH[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \DataOut_intlH[5]_i_1 
       (.I0(\DataOut_intlH[5]_i_2_n_0 ),
        .I1(\DIGTime_intl_reg_n_0_[5] ),
        .I2(\DataOut_intlH[8]_i_3_n_0 ),
        .I3(\WDOTime_intl_reg_n_0_[5] ),
        .I4(\DataOut_intlH[31]_i_4_n_0 ),
        .I5(\DataOut_intlH[5]_i_3_n_0 ),
        .O(\DataOut_intlH[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0320002000200020)) 
    \DataOut_intlH[5]_i_2 
       (.I0(Trigger_intl[5]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\cnt_fifo_reg_n_0_[2] ),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(data3),
        .I5(\cnt_fifo_reg_n_0_[1] ),
        .O(\DataOut_intlH[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000A0000000A0C0)) 
    \DataOut_intlH[5]_i_3 
       (.I0(WDONBR_intl[5]),
        .I1(data1[5]),
        .I2(\cnt_fifo_reg_n_0_[0] ),
        .I3(\cnt_fifo_reg_n_0_[2] ),
        .I4(\fifo_rd_stm_reg_n_0_[0] ),
        .I5(\cnt_fifo_reg_n_0_[1] ),
        .O(\DataOut_intlH[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \DataOut_intlH[6]_i_1 
       (.I0(\DataOut_intlH[6]_i_2_n_0 ),
        .I1(\DIGTime_intl_reg_n_0_[6] ),
        .I2(\DataOut_intlH[8]_i_3_n_0 ),
        .I3(\WDOTime_intl_reg_n_0_[6] ),
        .I4(\DataOut_intlH[31]_i_4_n_0 ),
        .I5(\DataOut_intlH[6]_i_3_n_0 ),
        .O(\DataOut_intlH[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0320002000200020)) 
    \DataOut_intlH[6]_i_2 
       (.I0(Trigger_intl[6]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\cnt_fifo_reg_n_0_[2] ),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(data3),
        .I5(\cnt_fifo_reg_n_0_[1] ),
        .O(\DataOut_intlH[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000A0000000A0C0)) 
    \DataOut_intlH[6]_i_3 
       (.I0(WDONBR_intl[6]),
        .I1(data1[6]),
        .I2(\cnt_fifo_reg_n_0_[0] ),
        .I3(\cnt_fifo_reg_n_0_[2] ),
        .I4(\fifo_rd_stm_reg_n_0_[0] ),
        .I5(\cnt_fifo_reg_n_0_[1] ),
        .O(\DataOut_intlH[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \DataOut_intlH[7]_i_1 
       (.I0(\DataOut_intlH[7]_i_2_n_0 ),
        .I1(\DIGTime_intl_reg_n_0_[7] ),
        .I2(\DataOut_intlH[8]_i_3_n_0 ),
        .I3(\WDOTime_intl_reg_n_0_[7] ),
        .I4(\DataOut_intlH[31]_i_4_n_0 ),
        .I5(\DataOut_intlH[7]_i_3_n_0 ),
        .O(\DataOut_intlH[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0320002000200020)) 
    \DataOut_intlH[7]_i_2 
       (.I0(Trigger_intl[7]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\cnt_fifo_reg_n_0_[2] ),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(data3),
        .I5(\cnt_fifo_reg_n_0_[1] ),
        .O(\DataOut_intlH[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000A0000000A0C0)) 
    \DataOut_intlH[7]_i_3 
       (.I0(WDONBR_intl[7]),
        .I1(data1[7]),
        .I2(\cnt_fifo_reg_n_0_[0] ),
        .I3(\cnt_fifo_reg_n_0_[2] ),
        .I4(\fifo_rd_stm_reg_n_0_[0] ),
        .I5(\cnt_fifo_reg_n_0_[1] ),
        .O(\DataOut_intlH[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \DataOut_intlH[8]_i_1 
       (.I0(\DataOut_intlH[8]_i_2_n_0 ),
        .I1(\DIGTime_intl_reg_n_0_[8] ),
        .I2(\DataOut_intlH[8]_i_3_n_0 ),
        .I3(\WDOTime_intl_reg_n_0_[8] ),
        .I4(\DataOut_intlH[31]_i_4_n_0 ),
        .I5(\DataOut_intlH[8]_i_4_n_0 ),
        .O(\DataOut_intlH[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0320002000200020)) 
    \DataOut_intlH[8]_i_2 
       (.I0(Trigger_intl[8]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\cnt_fifo_reg_n_0_[2] ),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(data3),
        .I5(\cnt_fifo_reg_n_0_[1] ),
        .O(\DataOut_intlH[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \DataOut_intlH[8]_i_3 
       (.I0(\cnt_fifo_reg_n_0_[1] ),
        .I1(\cnt_fifo_reg_n_0_[2] ),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .O(\DataOut_intlH[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000A0000000A0C0)) 
    \DataOut_intlH[8]_i_4 
       (.I0(WDONBR_intl[8]),
        .I1(data1[8]),
        .I2(\cnt_fifo_reg_n_0_[0] ),
        .I3(\cnt_fifo_reg_n_0_[2] ),
        .I4(\fifo_rd_stm_reg_n_0_[0] ),
        .I5(\cnt_fifo_reg_n_0_[1] ),
        .O(\DataOut_intlH[8]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFF888)) 
    \DataOut_intlH[9]_i_1 
       (.I0(\DataOut_intlH[31]_i_5_n_0 ),
        .I1(data1[9]),
        .I2(Trigger_intl[9]),
        .I3(\DataOut_intlH[9]_i_2_n_0 ),
        .I4(\DataOut_intlH[9]_i_3_n_0 ),
        .I5(\DataOut_intlH[9]_i_4_n_0 ),
        .O(\DataOut_intlH[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \DataOut_intlH[9]_i_2 
       (.I0(\fifo_rd_stm_reg_n_0_[0] ),
        .I1(\cnt_fifo_reg_n_0_[2] ),
        .I2(\cnt_fifo_reg_n_0_[0] ),
        .O(\DataOut_intlH[9]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT5 #(
    .INIT(32'h00000080)) 
    \DataOut_intlH[9]_i_3 
       (.I0(\cnt_fifo_reg_n_0_[1] ),
        .I1(data3),
        .I2(\cnt_fifo_reg_n_0_[0] ),
        .I3(\cnt_fifo_reg_n_0_[2] ),
        .I4(\fifo_rd_stm_reg_n_0_[0] ),
        .O(\DataOut_intlH[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCCCCCCCC00000A0C)) 
    \DataOut_intlH[9]_i_4 
       (.I0(\DIGTime_intl_reg_n_0_[9] ),
        .I1(\WDOTime_intl_reg_n_0_[9] ),
        .I2(\cnt_fifo_reg_n_0_[0] ),
        .I3(\cnt_fifo_reg_n_0_[1] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .I5(\fifo_rd_stm_reg_n_0_[0] ),
        .O(\DataOut_intlH[9]_i_4_n_0 ));
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
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[12]_i_1 
       (.I0(DataOut_intlH[12]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[13]_i_1 
       (.I0(DataOut_intlH[13]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[13]));
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[14]_i_1 
       (.I0(DataOut_intlH[14]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[14]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[15]_i_1 
       (.I0(DataOut_intlH[15]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[15]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[16]_i_1 
       (.I0(DataOut_intlH[16]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[16]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[17]_i_1 
       (.I0(DataOut_intlH[17]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[17]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[18]_i_1 
       (.I0(DataOut_intlH[18]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[18]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[19]_i_1 
       (.I0(DataOut_intlH[19]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[19]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[20]_i_1 
       (.I0(DataOut_intlH[20]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[20]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[21]_i_1 
       (.I0(DataOut_intlH[21]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[21]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[22]_i_1 
       (.I0(DataOut_intlH[22]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[22]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[23]_i_1 
       (.I0(DataOut_intlH[23]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[23]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[24]_i_1 
       (.I0(DataOut_intlH[24]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[24]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[25]_i_1 
       (.I0(DataOut_intlH[25]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[25]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[26]_i_1 
       (.I0(DataOut_intlH[26]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[26]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[27]_i_1 
       (.I0(DataOut_intlH[27]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[27]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[28]_i_1 
       (.I0(DataOut_intlH[28]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[28]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[29]_i_1 
       (.I0(DataOut_intlH[29]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[29]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DataOut_last[30]_i_1 
       (.I0(DataOut_intlH[30]),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(p_1_in[30]));
  LUT4 #(
    .INIT(16'h0020)) 
    \DataOut_last[31]_i_1 
       (.I0(\fifo_rd_stm_reg_n_0_[1] ),
        .I1(\fifo_rd_stm_reg_n_0_[3] ),
        .I2(\fifo_rd_stm_reg_n_0_[2] ),
        .I3(ready_i),
        .O(DataOut_last));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
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
        .D(\GEN_FIFO[3].FIFOCH_n_23 ),
        .Q(DataOut[0]),
        .R(1'b0));
  FDRE \DataOut_reg[10] 
       (.C(CLK),
        .CE(1'b1),
        .D(\GEN_FIFO[3].FIFOCH_n_13 ),
        .Q(DataOut[10]),
        .R(1'b0));
  FDRE \DataOut_reg[11] 
       (.C(CLK),
        .CE(1'b1),
        .D(\GEN_FIFO[3].FIFOCH_n_12 ),
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
        .D(\GEN_FIFO[3].FIFOCH_n_22 ),
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
        .D(\GEN_FIFO[3].FIFOCH_n_21 ),
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
        .D(\GEN_FIFO[3].FIFOCH_n_20 ),
        .Q(DataOut[3]),
        .R(1'b0));
  FDRE \DataOut_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(\GEN_FIFO[3].FIFOCH_n_19 ),
        .Q(DataOut[4]),
        .R(1'b0));
  FDRE \DataOut_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .D(\GEN_FIFO[3].FIFOCH_n_18 ),
        .Q(DataOut[5]),
        .R(1'b0));
  FDRE \DataOut_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .D(\GEN_FIFO[3].FIFOCH_n_17 ),
        .Q(DataOut[6]),
        .R(1'b0));
  FDRE \DataOut_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .D(\GEN_FIFO[3].FIFOCH_n_16 ),
        .Q(DataOut[7]),
        .R(1'b0));
  FDRE \DataOut_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .D(\GEN_FIFO[3].FIFOCH_n_15 ),
        .Q(DataOut[8]),
        .R(1'b0));
  FDRE \DataOut_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .D(\GEN_FIFO[3].FIFOCH_n_14 ),
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
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT5 #(
    .INIT(32'hFFFE0002)) 
    \FIFO_RD[busy]_i_1 
       (.I0(\fifo_rd_stm_reg_n_0_[1] ),
        .I1(\fifo_rd_stm_reg_n_0_[3] ),
        .I2(\fifo_rd_stm_reg_n_0_[2] ),
        .I3(\fifo_rd_stm_reg_n_0_[0] ),
        .I4(\FIFO_RD_reg[busy]__0 ),
        .O(\FIFO_RD[busy]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT5 #(
    .INIT(32'hFFBE0002)) 
    \FIFO_RD[response]_i_1 
       (.I0(\fifo_rd_stm_reg_n_0_[1] ),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\fifo_rd_stm_reg_n_0_[2] ),
        .I3(\fifo_rd_stm_reg_n_0_[3] ),
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
  LUT2 #(
    .INIT(4'h2)) 
    FIFO_ReadEn_i_2
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[6] ),
        .I1(TestFIFO),
        .O(FIFO_ReadEn_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    FIFO_ReadEn_i_5
       (.I0(nRST),
        .I1(\FSM_onehot_fifo_wr_stm_reg_n_0_[6] ),
        .O(FIFO_ReadEn_i_5_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    FIFO_ReadEn_i_6
       (.I0(nRST),
        .I1(\FSM_onehot_fifo_wr_stm_reg_n_0_[7] ),
        .O(FIFO_ReadEn_i_6_n_0));
  FDRE FIFO_ReadEn_reg
       (.C(CLK),
        .CE(1'b1),
        .D(\GEN_FIFO[11].FIFOCH_n_26 ),
        .Q(FIFO_ReadEn),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hF1FFF000)) 
    \FIFO_WR[response]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[3] ),
        .I1(\FSM_onehot_fifo_wr_stm_reg_n_0_[0] ),
        .I2(\FIFO_WR[response] ),
        .I3(nRST),
        .I4(FIFOresponse),
        .O(\FIFO_WR[response]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \FIFO_WR[valid]_i_2 
       (.I0(\FIFO_WR[response] ),
        .I1(PRECvalid),
        .O(\FIFO_WR[valid]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF0F0F0F0F0202020)) 
    \FIFO_WR[valid]_i_3 
       (.I0(\FIFO_WR[response] ),
        .I1(PRECvalid),
        .I2(nRST),
        .I3(\FIFO_RD_reg[response_n_0_] ),
        .I4(\FSM_onehot_fifo_wr_stm_reg_n_0_[9] ),
        .I5(\FSM_onehot_fifo_wr_stm_reg_n_0_[6] ),
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
        .D(\GEN_FIFO[11].FIFOCH_n_25 ),
        .Q(\FIFO_WR_reg[valid_n_0_] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hB000FFFFB0000000)) 
    FIFOvalid_i_1
       (.I0(\fifo_rd_stm_reg_n_0_[1] ),
        .I1(PSBUSY_i),
        .I2(ready_i),
        .I3(\fifo_rd_stm_reg_n_0_[2] ),
        .I4(FIFOvalid_i_3_n_0),
        .I5(FIFOvalid),
        .O(FIFOvalid_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT5 #(
    .INIT(32'h1C081008)) 
    FIFOvalid_i_3
       (.I0(\fifo_rd_stm_reg_n_0_[0] ),
        .I1(\fifo_rd_stm_reg_n_0_[2] ),
        .I2(\fifo_rd_stm_reg_n_0_[3] ),
        .I3(\fifo_rd_stm_reg_n_0_[1] ),
        .I4(ready_i),
        .O(FIFOvalid_i_3_n_0));
  FDCE FIFOvalid_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(FIFOvalid_i_1_n_0),
        .Q(FIFOvalid));
  LUT3 #(
    .INIT(8'hF8)) 
    \FSM_onehot_fifo_wr_stm[0]_i_2 
       (.I0(\FIFO_RD_reg[busy]__0 ),
        .I1(\FSM_onehot_fifo_wr_stm_reg_n_0_[0] ),
        .I2(\FSM_onehot_fifo_wr_stm_reg_n_0_[9] ),
        .O(\FSM_onehot_fifo_wr_stm[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h4F44)) 
    \FSM_onehot_fifo_wr_stm[1]_i_1 
       (.I0(PRECvalid),
        .I1(\FSM_onehot_fifo_wr_stm_reg_n_0_[1] ),
        .I2(\FIFO_RD_reg[busy]__0 ),
        .I3(\FSM_onehot_fifo_wr_stm_reg_n_0_[0] ),
        .O(\FSM_onehot_fifo_wr_stm[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hC8)) 
    \FSM_onehot_fifo_wr_stm[2]_i_1 
       (.I0(\FIFO_WR[response] ),
        .I1(PRECvalid),
        .I2(\FSM_onehot_fifo_wr_stm_reg_n_0_[1] ),
        .O(\FSM_onehot_fifo_wr_stm[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \FSM_onehot_fifo_wr_stm[9]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[7] ),
        .I1(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I2(\FSM_onehot_fifo_wr_stm[9]_i_3_n_0 ),
        .I3(\FSM_onehot_fifo_wr_stm[9]_i_4_n_0 ),
        .I4(\FSM_onehot_fifo_wr_stm_reg_n_0_[1] ),
        .O(\FSM_onehot_fifo_wr_stm[9]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFEFEFE)) 
    \FSM_onehot_fifo_wr_stm[9]_i_3 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[5] ),
        .I1(wr_en),
        .I2(\FSM_onehot_fifo_wr_stm_reg_n_0_[6] ),
        .I3(\FSM_onehot_fifo_wr_stm_reg_n_0_[9] ),
        .I4(\FIFO_RD_reg[response_n_0_] ),
        .O(\FSM_onehot_fifo_wr_stm[9]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \FSM_onehot_fifo_wr_stm[9]_i_4 
       (.I0(\FIFO_WR[response] ),
        .I1(\FSM_onehot_fifo_wr_stm_reg_n_0_[0] ),
        .I2(\FSM_onehot_fifo_wr_stm_reg_n_0_[3] ),
        .O(\FSM_onehot_fifo_wr_stm[9]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_fifo_wr_stm[9]_i_5 
       (.I0(TestFIFO),
        .I1(\FSM_onehot_fifo_wr_stm_reg_n_0_[6] ),
        .O(\FSM_onehot_fifo_wr_stm[9]_i_5_n_0 ));
  (* FSM_ENCODED_STATES = "wrfull:0000001000,wrxrd:0000010000,respready:0000000100,respvalid:1000000000,read_fifo_info:0100000000,wait_fifo_info:0010000000,valid:0001000000,ready:0000000010,idle:0000000001,wr_tempo:0000100000" *) 
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_fifo_wr_stm_reg[0] 
       (.C(CLK),
        .CE(\FSM_onehot_fifo_wr_stm[9]_i_1_n_0 ),
        .D(\GEN_FIFO[14].FIFOCH_n_4 ),
        .PRE(\GEN_FIFO[0].FIFOCH_n_0 ),
        .Q(\FSM_onehot_fifo_wr_stm_reg_n_0_[0] ));
  (* FSM_ENCODED_STATES = "wrfull:0000001000,wrxrd:0000010000,respready:0000000100,respvalid:1000000000,read_fifo_info:0100000000,wait_fifo_info:0010000000,valid:0001000000,ready:0000000010,idle:0000000001,wr_tempo:0000100000" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_fifo_wr_stm_reg[1] 
       (.C(CLK),
        .CE(\FSM_onehot_fifo_wr_stm[9]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\FSM_onehot_fifo_wr_stm[1]_i_1_n_0 ),
        .Q(\FSM_onehot_fifo_wr_stm_reg_n_0_[1] ));
  (* FSM_ENCODED_STATES = "wrfull:0000001000,wrxrd:0000010000,respready:0000000100,respvalid:1000000000,read_fifo_info:0100000000,wait_fifo_info:0010000000,valid:0001000000,ready:0000000010,idle:0000000001,wr_tempo:0000100000" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_fifo_wr_stm_reg[2] 
       (.C(CLK),
        .CE(\FSM_onehot_fifo_wr_stm[9]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\FSM_onehot_fifo_wr_stm[2]_i_1_n_0 ),
        .Q(\FIFO_WR[response] ));
  (* FSM_ENCODED_STATES = "wrfull:0000001000,wrxrd:0000010000,respready:0000000100,respvalid:1000000000,read_fifo_info:0100000000,wait_fifo_info:0010000000,valid:0001000000,ready:0000000010,idle:0000000001,wr_tempo:0000100000" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_fifo_wr_stm_reg[3] 
       (.C(CLK),
        .CE(\FSM_onehot_fifo_wr_stm[9]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\GEN_FIFO[14].FIFOCH_n_3 ),
        .Q(\FSM_onehot_fifo_wr_stm_reg_n_0_[3] ));
  (* FSM_ENCODED_STATES = "wrfull:0000001000,wrxrd:0000010000,respready:0000000100,respvalid:1000000000,read_fifo_info:0100000000,wait_fifo_info:0010000000,valid:0001000000,ready:0000000010,idle:0000000001,wr_tempo:0000100000" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_fifo_wr_stm_reg[4] 
       (.C(CLK),
        .CE(\FSM_onehot_fifo_wr_stm[9]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\GEN_FIFO[2].FIFOCH_n_28 ),
        .Q(wr_en));
  (* FSM_ENCODED_STATES = "wrfull:0000001000,wrxrd:0000010000,respready:0000000100,respvalid:1000000000,read_fifo_info:0100000000,wait_fifo_info:0010000000,valid:0001000000,ready:0000000010,idle:0000000001,wr_tempo:0000100000" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_fifo_wr_stm_reg[5] 
       (.C(CLK),
        .CE(\FSM_onehot_fifo_wr_stm[9]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(wr_en),
        .Q(\FSM_onehot_fifo_wr_stm_reg_n_0_[5] ));
  (* FSM_ENCODED_STATES = "wrfull:0000001000,wrxrd:0000010000,respready:0000000100,respvalid:1000000000,read_fifo_info:0100000000,wait_fifo_info:0010000000,valid:0001000000,ready:0000000010,idle:0000000001,wr_tempo:0000100000" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_fifo_wr_stm_reg[6] 
       (.C(CLK),
        .CE(\FSM_onehot_fifo_wr_stm[9]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\FSM_onehot_fifo_wr_stm_reg_n_0_[5] ),
        .Q(\FSM_onehot_fifo_wr_stm_reg_n_0_[6] ));
  (* FSM_ENCODED_STATES = "wrfull:0000001000,wrxrd:0000010000,respready:0000000100,respvalid:1000000000,read_fifo_info:0100000000,wait_fifo_info:0010000000,valid:0001000000,ready:0000000010,idle:0000000001,wr_tempo:0000100000" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_fifo_wr_stm_reg[7] 
       (.C(CLK),
        .CE(\FSM_onehot_fifo_wr_stm[9]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\GEN_FIFO[13].FIFOCH_n_1 ),
        .Q(\FSM_onehot_fifo_wr_stm_reg_n_0_[7] ));
  (* FSM_ENCODED_STATES = "wrfull:0000001000,wrxrd:0000010000,respready:0000000100,respvalid:1000000000,read_fifo_info:0100000000,wait_fifo_info:0010000000,valid:0001000000,ready:0000000010,idle:0000000001,wr_tempo:0000100000" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_fifo_wr_stm_reg[8] 
       (.C(CLK),
        .CE(\FSM_onehot_fifo_wr_stm[9]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\FSM_onehot_fifo_wr_stm_reg_n_0_[7] ),
        .Q(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ));
  (* FSM_ENCODED_STATES = "wrfull:0000001000,wrxrd:0000010000,respready:0000000100,respvalid:1000000000,read_fifo_info:0100000000,wait_fifo_info:0010000000,valid:0001000000,ready:0000000010,idle:0000000001,wr_tempo:0000100000" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_fifo_wr_stm_reg[9] 
       (.C(CLK),
        .CE(\FSM_onehot_fifo_wr_stm[9]_i_1_n_0 ),
        .CLR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .D(\GEN_FIFO[2].FIFOCH_n_27 ),
        .Q(\FSM_onehot_fifo_wr_stm_reg_n_0_[9] ));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags \GEN_FIFO[0].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .Q(r_FIFO_COUNT_reg_3),
        .\WDONBR_intl_reg[1] (\GEN_FIFO[0].FIFOCH_n_1 ),
        .address(address),
        .\cnt_fifo_reg[5] (\GEN_FIFO[4].FIFOCH_n_0 ),
        .nRST(nRST),
        .o_rd_data(\rd_data12[0]_0 ),
        .p_0_in(p_0_in),
        .\r_FIFO_COUNT_reg[0]_0 (\GEN_FIFO[6].FIFOCH_n_2 ),
        .rd_en(rd_en),
        .\wr_data_reg[0][11] ({\wr_data_reg_n_0_[0][11] ,\wr_data_reg_n_0_[0][10] ,\wr_data_reg_n_0_[0][9] ,\wr_data_reg_n_0_[0][8] ,\wr_data_reg_n_0_[0][7] ,\wr_data_reg_n_0_[0][6] ,\wr_data_reg_n_0_[0][5] ,\wr_data_reg_n_0_[0][4] ,\wr_data_reg_n_0_[0][3] ,\wr_data_reg_n_0_[0][2] ,\wr_data_reg_n_0_[0][1] ,\wr_data_reg_n_0_[0][0] }),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_0 \GEN_FIFO[10].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .Q({\wr_data_reg_n_0_[10][11] ,\wr_data_reg_n_0_[10][10] ,\wr_data_reg_n_0_[10][9] ,\wr_data_reg_n_0_[10][8] ,\wr_data_reg_n_0_[10][7] ,\wr_data_reg_n_0_[10][6] ,\wr_data_reg_n_0_[10][5] ,\wr_data_reg_n_0_[10][4] ,\wr_data_reg_n_0_[10][3] ,\wr_data_reg_n_0_[10][2] ,\wr_data_reg_n_0_[10][1] ,\wr_data_reg_n_0_[10][0] }),
        .address(address),
        .\cnt_fifo_reg[6] (\GEN_FIFO[6].FIFOCH_n_1 ),
        .full(full[10]),
        .o_rd_data(\rd_data12[10]_10 ),
        .p_0_in(p_0_in),
        .rd_en(rd_en),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_1 \GEN_FIFO[11].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .D(DataOut_intlD),
        .FIFO_ReadEn(FIFO_ReadEn),
        .FIFO_ReadEn_reg(\GEN_FIFO[11].FIFOCH_n_26 ),
        .\FIFO_WR_reg[valid] (\GEN_FIFO[11].FIFOCH_n_25 ),
        .\FIFO_WR_reg[valid]0 (\FIFO_WR_reg[valid]0 ),
        .\FIFO_WR_reg[valid]_0 (\FIFO_WR_reg[valid_n_0_] ),
        .\FSM_onehot_fifo_wr_stm_reg[2] (\FIFO_WR[valid]_i_2_n_0 ),
        .\FSM_onehot_fifo_wr_stm_reg[6] (FIFO_ReadEn_i_2_n_0),
        .\FSM_onehot_fifo_wr_stm_reg[6]_0 (FIFO_ReadEn_i_5_n_0),
        .\FSM_onehot_fifo_wr_stm_reg[7] (FIFO_ReadEn_i_6_n_0),
        .Q({\wr_data_reg_n_0_[11][11] ,\wr_data_reg_n_0_[11][10] ,\wr_data_reg_n_0_[11][9] ,\wr_data_reg_n_0_[11][8] ,\wr_data_reg_n_0_[11][7] ,\wr_data_reg_n_0_[11][6] ,\wr_data_reg_n_0_[11][5] ,\wr_data_reg_n_0_[11][4] ,\wr_data_reg_n_0_[11][3] ,\wr_data_reg_n_0_[11][2] ,\wr_data_reg_n_0_[11][1] ,\wr_data_reg_n_0_[11][0] }),
        .address(address),
        .\cnt_fifo_reg[5] (\GEN_FIFO[7].FIFOCH_n_1 ),
        .full(full[11]),
        .o_rd_data(\rd_data12[11]_11 ),
        .out(\FSM_onehot_fifo_wr_stm_reg_n_0_[6] ),
        .p_0_in(p_0_in),
        .\r_FIFO_COUNT_reg[5]_0 (full[10:8]),
        .\r_FIFO_COUNT_reg[5]_1 (\GEN_FIFO[13].FIFOCH_n_17 ),
        .\r_FIFO_COUNT_reg[5]_2 (\GEN_FIFO[15].FIFOCH_n_26 ),
        .\r_FIFO_COUNT_reg[5]_3 (\GEN_FIFO[2].FIFOCH_n_1 ),
        .rd_en(rd_en),
        .\wr_data_reg[2][1] (\GEN_FIFO[2].FIFOCH_n_3 ),
        .\wr_data_reg[2][1]_0 (\GEN_FIFO[2].FIFOCH_n_16 ),
        .\wr_data_reg[2][1]_1 (\GEN_FIFO[2].FIFOCH_n_17 ),
        .\wr_data_reg[2][1]_2 (\GEN_FIFO[2].FIFOCH_n_18 ),
        .\wr_data_reg[2][1]_3 (\GEN_FIFO[2].FIFOCH_n_19 ),
        .\wr_data_reg[2][1]_4 (\GEN_FIFO[2].FIFOCH_n_20 ),
        .\wr_data_reg[2][7] (\GEN_FIFO[2].FIFOCH_n_21 ),
        .\wr_data_reg[2][7]_0 (\GEN_FIFO[2].FIFOCH_n_22 ),
        .\wr_data_reg[2][7]_1 (\GEN_FIFO[2].FIFOCH_n_23 ),
        .\wr_data_reg[2][7]_2 (\GEN_FIFO[2].FIFOCH_n_24 ),
        .\wr_data_reg[2][7]_3 (\GEN_FIFO[2].FIFOCH_n_25 ),
        .\wr_data_reg[2][7]_4 (\GEN_FIFO[2].FIFOCH_n_26 ),
        .\wr_data_reg[3][7] (\rd_data12[3]_3 ),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_2 \GEN_FIFO[12].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .\FSM_onehot_fifo_wr_stm_reg[6] (\FSM_onehot_fifo_wr_stm[9]_i_5_n_0 ),
        .Q(r_FIFO_COUNT_reg),
        .\WDONBR_intl_reg[1] (\GEN_FIFO[12].FIFOCH_n_2 ),
        .address(address),
        .\cnt_fifo_reg[5] (\GEN_FIFO[4].FIFOCH_n_0 ),
        .full(full[12]),
        .o_rd_data(\rd_data12[12]_12 ),
        .p_0_in(p_0_in),
        .\r_FIFO_COUNT_reg[5]_0 (full[11:8]),
        .\r_RD_INDEX_reg[4]_0 (\GEN_FIFO[12].FIFOCH_n_1 ),
        .rd_en(rd_en),
        .\wr_data_reg[12][11] ({\wr_data_reg_n_0_[12][11] ,\wr_data_reg_n_0_[12][10] ,\wr_data_reg_n_0_[12][9] ,\wr_data_reg_n_0_[12][8] ,\wr_data_reg_n_0_[12][7] ,\wr_data_reg_n_0_[12][6] ,\wr_data_reg_n_0_[12][5] ,\wr_data_reg_n_0_[12][4] ,\wr_data_reg_n_0_[12][3] ,\wr_data_reg_n_0_[12][2] ,\wr_data_reg_n_0_[12][1] ,\wr_data_reg_n_0_[12][0] }),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_3 \GEN_FIFO[13].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .D(\GEN_FIFO[13].FIFOCH_n_1 ),
        .\DataOut_stall_reg[0] (\GEN_FIFO[13].FIFOCH_n_4 ),
        .\DataOut_stall_reg[10] (\GEN_FIFO[13].FIFOCH_n_14 ),
        .\DataOut_stall_reg[11] (\GEN_FIFO[13].FIFOCH_n_15 ),
        .\DataOut_stall_reg[1] (\GEN_FIFO[13].FIFOCH_n_5 ),
        .\DataOut_stall_reg[2] (\GEN_FIFO[13].FIFOCH_n_6 ),
        .\DataOut_stall_reg[3] (\GEN_FIFO[13].FIFOCH_n_7 ),
        .\DataOut_stall_reg[4] (\GEN_FIFO[13].FIFOCH_n_8 ),
        .\DataOut_stall_reg[5] (\GEN_FIFO[13].FIFOCH_n_9 ),
        .\DataOut_stall_reg[6] (\GEN_FIFO[13].FIFOCH_n_10 ),
        .\DataOut_stall_reg[7] (\GEN_FIFO[13].FIFOCH_n_11 ),
        .\DataOut_stall_reg[8] (\GEN_FIFO[13].FIFOCH_n_12 ),
        .\DataOut_stall_reg[9] (\GEN_FIFO[13].FIFOCH_n_13 ),
        .FIFO_ReadEn_reg(\GEN_FIFO[13].FIFOCH_n_17 ),
        .\FSM_onehot_fifo_wr_stm_reg[6] (\GEN_FIFO[8].FIFOCH_n_24 ),
        .\FSM_onehot_fifo_wr_stm_reg[7] (\GEN_FIFO[13].FIFOCH_n_2 ),
        .Q(r_FIFO_COUNT_reg_0),
        .TestFIFO(TestFIFO),
        .WDOTime_intl0(WDOTime_intl0),
        .address(address),
        .\cnt_fifo_reg[5] (\GEN_FIFO[5].FIFOCH_n_0 ),
        .nRST(nRST),
        .o_rd_data(\rd_data12[10]_10 ),
        .out({\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ,\FSM_onehot_fifo_wr_stm_reg_n_0_[6] }),
        .p_0_in(p_0_in),
        .\r_FIFO_COUNT_reg[0]_0 (\GEN_FIFO[12].FIFOCH_n_1 ),
        .\r_FIFO_COUNT_reg[0]_1 (\GEN_FIFO[14].FIFOCH_n_2 ),
        .\r_FIFO_COUNT_reg[0]_2 (\GEN_FIFO[15].FIFOCH_n_25 ),
        .\r_FIFO_COUNT_reg[5]_0 (\GEN_FIFO[9].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[5]_1 (full[8]),
        .\r_FIFO_COUNT_reg[5]_2 (\GEN_FIFO[2].FIFOCH_n_1 ),
        .\r_FIFO_COUNT_reg[5]_3 (r_FIFO_COUNT_reg),
        .\r_FIFO_COUNT_reg[5]_4 (r_FIFO_COUNT_reg_1),
        .\r_FIFO_COUNT_reg[5]_5 (r_FIFO_COUNT_reg_2),
        .\r_RD_INDEX_reg[4]_0 (\GEN_FIFO[13].FIFOCH_n_16 ),
        .rd_en(rd_en),
        .\wr_data_reg[13][11] ({\wr_data_reg_n_0_[13][11] ,\wr_data_reg_n_0_[13][10] ,\wr_data_reg_n_0_[13][9] ,\wr_data_reg_n_0_[13][8] ,\wr_data_reg_n_0_[13][7] ,\wr_data_reg_n_0_[13][6] ,\wr_data_reg_n_0_[13][5] ,\wr_data_reg_n_0_[13][4] ,\wr_data_reg_n_0_[13][3] ,\wr_data_reg_n_0_[13][2] ,\wr_data_reg_n_0_[13][1] ,\wr_data_reg_n_0_[13][0] }),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_4 \GEN_FIFO[14].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .D({\GEN_FIFO[14].FIFOCH_n_3 ,\GEN_FIFO[14].FIFOCH_n_4 }),
        .\FIFO_RD_reg[busy] (\FSM_onehot_fifo_wr_stm[0]_i_2_n_0 ),
        .\FSM_onehot_fifo_wr_stm_reg[0] (\GEN_FIFO[14].FIFOCH_n_1 ),
        .PRECvalid(PRECvalid),
        .Q(r_FIFO_COUNT_reg_1),
        .address(address),
        .\cnt_fifo_reg[6] (\GEN_FIFO[6].FIFOCH_n_1 ),
        .full({full[15],full[12]}),
        .nRST(nRST),
        .o_rd_data(\rd_data12[14]_14 ),
        .out({\FSM_onehot_fifo_wr_stm_reg_n_0_[6] ,\FSM_onehot_fifo_wr_stm_reg_n_0_[3] ,\FIFO_WR[response] }),
        .p_0_in(p_0_in),
        .\r_FIFO_COUNT_reg[0]_0 (\GEN_FIFO[13].FIFOCH_n_16 ),
        .\r_FIFO_COUNT_reg[5]_0 (r_FIFO_COUNT_reg_0),
        .\r_FIFO_COUNT_reg[5]_1 (\GEN_FIFO[8].FIFOCH_n_25 ),
        .\r_FIFO_COUNT_reg[5]_2 (\GEN_FIFO[2].FIFOCH_n_1 ),
        .\r_RD_INDEX_reg[4]_0 (\GEN_FIFO[14].FIFOCH_n_2 ),
        .rd_en(rd_en),
        .\wr_data_reg[14][11] ({\wr_data_reg_n_0_[14][11] ,\wr_data_reg_n_0_[14][10] ,\wr_data_reg_n_0_[14][9] ,\wr_data_reg_n_0_[14][8] ,\wr_data_reg_n_0_[14][7] ,\wr_data_reg_n_0_[14][6] ,\wr_data_reg_n_0_[14][5] ,\wr_data_reg_n_0_[14][4] ,\wr_data_reg_n_0_[14][3] ,\wr_data_reg_n_0_[14][2] ,\wr_data_reg_n_0_[14][1] ,\wr_data_reg_n_0_[14][0] }),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_5 \GEN_FIFO[15].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .\DataOut_last_reg[0] (\GEN_FIFO[15].FIFOCH_n_1 ),
        .\DataOut_last_reg[10] (\GEN_FIFO[15].FIFOCH_n_11 ),
        .\DataOut_last_reg[11] (\GEN_FIFO[15].FIFOCH_n_12 ),
        .\DataOut_last_reg[1] (\GEN_FIFO[15].FIFOCH_n_2 ),
        .\DataOut_last_reg[2] (\GEN_FIFO[15].FIFOCH_n_3 ),
        .\DataOut_last_reg[3] (\GEN_FIFO[15].FIFOCH_n_4 ),
        .\DataOut_last_reg[4] (\GEN_FIFO[15].FIFOCH_n_5 ),
        .\DataOut_last_reg[5] (\GEN_FIFO[15].FIFOCH_n_6 ),
        .\DataOut_last_reg[6] (\GEN_FIFO[15].FIFOCH_n_7 ),
        .\DataOut_last_reg[7] (\GEN_FIFO[15].FIFOCH_n_8 ),
        .\DataOut_last_reg[8] (\GEN_FIFO[15].FIFOCH_n_9 ),
        .\DataOut_last_reg[9] (\GEN_FIFO[15].FIFOCH_n_10 ),
        .\DataOut_stall_reg[0] (\GEN_FIFO[15].FIFOCH_n_13 ),
        .\DataOut_stall_reg[10] (\GEN_FIFO[15].FIFOCH_n_23 ),
        .\DataOut_stall_reg[11] (\GEN_FIFO[15].FIFOCH_n_24 ),
        .\DataOut_stall_reg[1] (\GEN_FIFO[15].FIFOCH_n_14 ),
        .\DataOut_stall_reg[2] (\GEN_FIFO[15].FIFOCH_n_15 ),
        .\DataOut_stall_reg[3] (\GEN_FIFO[15].FIFOCH_n_16 ),
        .\DataOut_stall_reg[4] (\GEN_FIFO[15].FIFOCH_n_17 ),
        .\DataOut_stall_reg[5] (\GEN_FIFO[15].FIFOCH_n_18 ),
        .\DataOut_stall_reg[6] (\GEN_FIFO[15].FIFOCH_n_19 ),
        .\DataOut_stall_reg[7] (\GEN_FIFO[15].FIFOCH_n_20 ),
        .\DataOut_stall_reg[8] (\GEN_FIFO[15].FIFOCH_n_21 ),
        .\DataOut_stall_reg[9] (\GEN_FIFO[15].FIFOCH_n_22 ),
        .FIFO_ReadEn_reg(\GEN_FIFO[15].FIFOCH_n_26 ),
        .Q(r_FIFO_COUNT_reg_2),
        .address(address),
        .\cnt_fifo_reg[5] (\GEN_FIFO[7].FIFOCH_n_1 ),
        .\cnt_fifo_reg[5]_0 (\GEN_FIFO[8].FIFOCH_n_1 ),
        .\cnt_fifo_reg[5]_1 (\GEN_FIFO[8].FIFOCH_n_3 ),
        .\cnt_fifo_reg[5]_10 (\GEN_FIFO[8].FIFOCH_n_21 ),
        .\cnt_fifo_reg[5]_11 (\GEN_FIFO[8].FIFOCH_n_23 ),
        .\cnt_fifo_reg[5]_2 (\GEN_FIFO[8].FIFOCH_n_5 ),
        .\cnt_fifo_reg[5]_3 (\GEN_FIFO[8].FIFOCH_n_7 ),
        .\cnt_fifo_reg[5]_4 (\GEN_FIFO[8].FIFOCH_n_9 ),
        .\cnt_fifo_reg[5]_5 (\GEN_FIFO[8].FIFOCH_n_11 ),
        .\cnt_fifo_reg[5]_6 (\GEN_FIFO[8].FIFOCH_n_13 ),
        .\cnt_fifo_reg[5]_7 (\GEN_FIFO[8].FIFOCH_n_15 ),
        .\cnt_fifo_reg[5]_8 (\GEN_FIFO[8].FIFOCH_n_17 ),
        .\cnt_fifo_reg[5]_9 (\GEN_FIFO[8].FIFOCH_n_19 ),
        .\cnt_fifo_reg[6] (\GEN_FIFO[5].FIFOCH_n_1 ),
        .\cnt_fifo_reg[6]_0 (\fifo_rd_stm[0]_i_7_n_0 ),
        .\cnt_fifo_reg[6]_1 (\GEN_FIFO[5].FIFOCH_n_2 ),
        .\cnt_fifo_reg[6]_10 (\GEN_FIFO[5].FIFOCH_n_11 ),
        .\cnt_fifo_reg[6]_11 (\GEN_FIFO[5].FIFOCH_n_12 ),
        .\cnt_fifo_reg[6]_2 (\GEN_FIFO[5].FIFOCH_n_3 ),
        .\cnt_fifo_reg[6]_3 (\GEN_FIFO[5].FIFOCH_n_4 ),
        .\cnt_fifo_reg[6]_4 (\GEN_FIFO[5].FIFOCH_n_5 ),
        .\cnt_fifo_reg[6]_5 (\GEN_FIFO[5].FIFOCH_n_6 ),
        .\cnt_fifo_reg[6]_6 (\GEN_FIFO[5].FIFOCH_n_7 ),
        .\cnt_fifo_reg[6]_7 (\GEN_FIFO[5].FIFOCH_n_8 ),
        .\cnt_fifo_reg[6]_8 (\GEN_FIFO[5].FIFOCH_n_9 ),
        .\cnt_fifo_reg[6]_9 (\GEN_FIFO[5].FIFOCH_n_10 ),
        .\cnt_fifo_reg[7] (\DataOut[11]_i_8_n_0 ),
        .\cnt_fifo_reg[7]_0 (\DataOut[11]_i_10_n_0 ),
        .\cnt_fifo_reg[7]_1 (\GEN_FIFO[13].FIFOCH_n_4 ),
        .\cnt_fifo_reg[7]_10 (\GEN_FIFO[13].FIFOCH_n_13 ),
        .\cnt_fifo_reg[7]_11 (\GEN_FIFO[13].FIFOCH_n_14 ),
        .\cnt_fifo_reg[7]_12 (\GEN_FIFO[13].FIFOCH_n_15 ),
        .\cnt_fifo_reg[7]_2 (\GEN_FIFO[13].FIFOCH_n_5 ),
        .\cnt_fifo_reg[7]_3 (\GEN_FIFO[13].FIFOCH_n_6 ),
        .\cnt_fifo_reg[7]_4 (\GEN_FIFO[13].FIFOCH_n_7 ),
        .\cnt_fifo_reg[7]_5 (\GEN_FIFO[13].FIFOCH_n_8 ),
        .\cnt_fifo_reg[7]_6 (\GEN_FIFO[13].FIFOCH_n_9 ),
        .\cnt_fifo_reg[7]_7 (\GEN_FIFO[13].FIFOCH_n_10 ),
        .\cnt_fifo_reg[7]_8 (\GEN_FIFO[13].FIFOCH_n_11 ),
        .\cnt_fifo_reg[7]_9 (\GEN_FIFO[13].FIFOCH_n_12 ),
        .\cnt_fifo_reg[8] (\fifo_rd_stm[0]_i_8_n_0 ),
        .\cnt_fifo_reg[8]_0 (\GEN_FIFO[1].FIFOCH_n_0 ),
        .\cnt_fifo_reg[8]_1 (\GEN_FIFO[1].FIFOCH_n_1 ),
        .\cnt_fifo_reg[8]_10 (\GEN_FIFO[1].FIFOCH_n_10 ),
        .\cnt_fifo_reg[8]_11 (\GEN_FIFO[1].FIFOCH_n_11 ),
        .\cnt_fifo_reg[8]_2 (\GEN_FIFO[1].FIFOCH_n_2 ),
        .\cnt_fifo_reg[8]_3 (\GEN_FIFO[1].FIFOCH_n_3 ),
        .\cnt_fifo_reg[8]_4 (\GEN_FIFO[1].FIFOCH_n_4 ),
        .\cnt_fifo_reg[8]_5 (\GEN_FIFO[1].FIFOCH_n_5 ),
        .\cnt_fifo_reg[8]_6 (\GEN_FIFO[1].FIFOCH_n_6 ),
        .\cnt_fifo_reg[8]_7 (\GEN_FIFO[1].FIFOCH_n_7 ),
        .\cnt_fifo_reg[8]_8 (\GEN_FIFO[1].FIFOCH_n_8 ),
        .\cnt_fifo_reg[8]_9 (\GEN_FIFO[1].FIFOCH_n_9 ),
        .full(full[15]),
        .o_rd_data(\rd_data12[9]_9 ),
        .p_0_in(p_0_in),
        .\r_FIFO_COUNT_reg[0]_0 (\GEN_FIFO[14].FIFOCH_n_2 ),
        .\r_FIFO_COUNT_reg[5]_0 (r_FIFO_COUNT_reg_1),
        .\r_RD_INDEX_reg[4]_0 (\GEN_FIFO[15].FIFOCH_n_25 ),
        .rd_en(rd_en),
        .\wr_data_reg[0][7] (\rd_data12[0]_0 ),
        .\wr_data_reg[15][11] ({\wr_data_reg_n_0_[15][11] ,\wr_data_reg_n_0_[15][10] ,\wr_data_reg_n_0_[15][9] ,\wr_data_reg_n_0_[15][8] ,\wr_data_reg_n_0_[15][7] ,\wr_data_reg_n_0_[15][6] ,\wr_data_reg_n_0_[15][5] ,\wr_data_reg_n_0_[15][4] ,\wr_data_reg_n_0_[15][3] ,\wr_data_reg_n_0_[15][2] ,\wr_data_reg_n_0_[15][1] ,\wr_data_reg_n_0_[15][0] }),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_6 \GEN_FIFO[1].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .\DataOut_stall_reg[0] (\GEN_FIFO[1].FIFOCH_n_0 ),
        .\DataOut_stall_reg[10] (\GEN_FIFO[1].FIFOCH_n_10 ),
        .\DataOut_stall_reg[11] (\GEN_FIFO[1].FIFOCH_n_11 ),
        .\DataOut_stall_reg[1] (\GEN_FIFO[1].FIFOCH_n_1 ),
        .\DataOut_stall_reg[2] (\GEN_FIFO[1].FIFOCH_n_2 ),
        .\DataOut_stall_reg[3] (\GEN_FIFO[1].FIFOCH_n_3 ),
        .\DataOut_stall_reg[4] (\GEN_FIFO[1].FIFOCH_n_4 ),
        .\DataOut_stall_reg[5] (\GEN_FIFO[1].FIFOCH_n_5 ),
        .\DataOut_stall_reg[6] (\GEN_FIFO[1].FIFOCH_n_6 ),
        .\DataOut_stall_reg[7] (\GEN_FIFO[1].FIFOCH_n_7 ),
        .\DataOut_stall_reg[8] (\GEN_FIFO[1].FIFOCH_n_8 ),
        .\DataOut_stall_reg[9] (\GEN_FIFO[1].FIFOCH_n_9 ),
        .Q({\wr_data_reg_n_0_[1][11] ,\wr_data_reg_n_0_[1][10] ,\wr_data_reg_n_0_[1][9] ,\wr_data_reg_n_0_[1][8] ,\wr_data_reg_n_0_[1][7] ,\wr_data_reg_n_0_[1][6] ,\wr_data_reg_n_0_[1][5] ,\wr_data_reg_n_0_[1][4] ,\wr_data_reg_n_0_[1][3] ,\wr_data_reg_n_0_[1][2] ,\wr_data_reg_n_0_[1][1] ,\wr_data_reg_n_0_[1][0] }),
        .address(address),
        .\cnt_fifo_reg[5] (\GEN_FIFO[5].FIFOCH_n_0 ),
        .full(full[1]),
        .o_rd_data(\rd_data12[12]_12 ),
        .p_0_in(p_0_in),
        .rd_en(rd_en),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_7 \GEN_FIFO[2].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .D({\GEN_FIFO[2].FIFOCH_n_27 ,\GEN_FIFO[2].FIFOCH_n_28 }),
        .\DataOut_stall_reg[0] (\GEN_FIFO[2].FIFOCH_n_3 ),
        .\DataOut_stall_reg[10] (\GEN_FIFO[2].FIFOCH_n_25 ),
        .\DataOut_stall_reg[11] (\GEN_FIFO[2].FIFOCH_n_26 ),
        .\DataOut_stall_reg[1] (\GEN_FIFO[2].FIFOCH_n_16 ),
        .\DataOut_stall_reg[2] (\GEN_FIFO[2].FIFOCH_n_17 ),
        .\DataOut_stall_reg[3] (\GEN_FIFO[2].FIFOCH_n_18 ),
        .\DataOut_stall_reg[4] (\GEN_FIFO[2].FIFOCH_n_19 ),
        .\DataOut_stall_reg[5] (\GEN_FIFO[2].FIFOCH_n_20 ),
        .\DataOut_stall_reg[6] (\GEN_FIFO[2].FIFOCH_n_21 ),
        .\DataOut_stall_reg[7] (\GEN_FIFO[2].FIFOCH_n_22 ),
        .\DataOut_stall_reg[8] (\GEN_FIFO[2].FIFOCH_n_23 ),
        .\DataOut_stall_reg[9] (\GEN_FIFO[2].FIFOCH_n_24 ),
        .\FSM_onehot_fifo_wr_stm_reg[6] (\GEN_FIFO[8].FIFOCH_n_24 ),
        .\FSM_onehot_fifo_wr_stm_reg[6]_0 (\FSM_onehot_fifo_wr_stm[9]_i_5_n_0 ),
        .Q({\wr_data_reg_n_0_[2][11] ,\wr_data_reg_n_0_[2][10] ,\wr_data_reg_n_0_[2][9] ,\wr_data_reg_n_0_[2][8] ,\wr_data_reg_n_0_[2][7] ,\wr_data_reg_n_0_[2][6] ,\wr_data_reg_n_0_[2][5] ,\wr_data_reg_n_0_[2][4] ,\wr_data_reg_n_0_[2][3] ,\wr_data_reg_n_0_[2][2] ,\wr_data_reg_n_0_[2][1] ,\wr_data_reg_n_0_[2][0] }),
        .\WDONBR_intl_reg[1] (\GEN_FIFO[2].FIFOCH_n_1 ),
        .\WDONBR_intl_reg[1]_0 (\GEN_FIFO[2].FIFOCH_n_2 ),
        .\WDOTime_intl_reg[63] (\GEN_FIFO[2].FIFOCH_n_0 ),
        .address(address),
        .\cnt_fifo_reg[5] (\DataOut[11]_i_5_n_0 ),
        .\cnt_fifo_reg[6] (\GEN_FIFO[6].FIFOCH_n_1 ),
        .\cnt_fifo_reg[6]_0 (\GEN_FIFO[15].FIFOCH_n_13 ),
        .\cnt_fifo_reg[6]_1 (\GEN_FIFO[15].FIFOCH_n_14 ),
        .\cnt_fifo_reg[6]_10 (\GEN_FIFO[15].FIFOCH_n_23 ),
        .\cnt_fifo_reg[6]_11 (\GEN_FIFO[15].FIFOCH_n_24 ),
        .\cnt_fifo_reg[6]_2 (\GEN_FIFO[15].FIFOCH_n_15 ),
        .\cnt_fifo_reg[6]_3 (\GEN_FIFO[15].FIFOCH_n_16 ),
        .\cnt_fifo_reg[6]_4 (\GEN_FIFO[15].FIFOCH_n_17 ),
        .\cnt_fifo_reg[6]_5 (\GEN_FIFO[15].FIFOCH_n_18 ),
        .\cnt_fifo_reg[6]_6 (\GEN_FIFO[15].FIFOCH_n_19 ),
        .\cnt_fifo_reg[6]_7 (\GEN_FIFO[15].FIFOCH_n_20 ),
        .\cnt_fifo_reg[6]_8 (\GEN_FIFO[15].FIFOCH_n_21 ),
        .\cnt_fifo_reg[6]_9 (\GEN_FIFO[15].FIFOCH_n_22 ),
        .\cnt_fifo_reg[7] (\GEN_FIFO[13].FIFOCH_n_4 ),
        .\cnt_fifo_reg[7]_0 (\GEN_FIFO[13].FIFOCH_n_5 ),
        .\cnt_fifo_reg[7]_1 (\GEN_FIFO[13].FIFOCH_n_6 ),
        .\cnt_fifo_reg[7]_10 (\GEN_FIFO[13].FIFOCH_n_15 ),
        .\cnt_fifo_reg[7]_2 (\GEN_FIFO[13].FIFOCH_n_7 ),
        .\cnt_fifo_reg[7]_3 (\GEN_FIFO[13].FIFOCH_n_8 ),
        .\cnt_fifo_reg[7]_4 (\GEN_FIFO[13].FIFOCH_n_9 ),
        .\cnt_fifo_reg[7]_5 (\GEN_FIFO[13].FIFOCH_n_10 ),
        .\cnt_fifo_reg[7]_6 (\GEN_FIFO[13].FIFOCH_n_11 ),
        .\cnt_fifo_reg[7]_7 (\GEN_FIFO[13].FIFOCH_n_12 ),
        .\cnt_fifo_reg[7]_8 (\GEN_FIFO[13].FIFOCH_n_13 ),
        .\cnt_fifo_reg[7]_9 (\GEN_FIFO[13].FIFOCH_n_14 ),
        .\cnt_fifo_reg[8] (\GEN_FIFO[8].FIFOCH_n_0 ),
        .\cnt_fifo_reg[8]_0 (\GEN_FIFO[1].FIFOCH_n_0 ),
        .\cnt_fifo_reg[8]_1 (\GEN_FIFO[8].FIFOCH_n_2 ),
        .\cnt_fifo_reg[8]_10 (\GEN_FIFO[1].FIFOCH_n_5 ),
        .\cnt_fifo_reg[8]_11 (\GEN_FIFO[8].FIFOCH_n_12 ),
        .\cnt_fifo_reg[8]_12 (\GEN_FIFO[1].FIFOCH_n_6 ),
        .\cnt_fifo_reg[8]_13 (\GEN_FIFO[8].FIFOCH_n_14 ),
        .\cnt_fifo_reg[8]_14 (\GEN_FIFO[1].FIFOCH_n_7 ),
        .\cnt_fifo_reg[8]_15 (\GEN_FIFO[8].FIFOCH_n_16 ),
        .\cnt_fifo_reg[8]_16 (\GEN_FIFO[1].FIFOCH_n_8 ),
        .\cnt_fifo_reg[8]_17 (\GEN_FIFO[8].FIFOCH_n_18 ),
        .\cnt_fifo_reg[8]_18 (\GEN_FIFO[1].FIFOCH_n_9 ),
        .\cnt_fifo_reg[8]_19 (\GEN_FIFO[8].FIFOCH_n_20 ),
        .\cnt_fifo_reg[8]_2 (\GEN_FIFO[1].FIFOCH_n_1 ),
        .\cnt_fifo_reg[8]_20 (\GEN_FIFO[1].FIFOCH_n_10 ),
        .\cnt_fifo_reg[8]_21 (\GEN_FIFO[8].FIFOCH_n_22 ),
        .\cnt_fifo_reg[8]_22 (\GEN_FIFO[1].FIFOCH_n_11 ),
        .\cnt_fifo_reg[8]_3 (\GEN_FIFO[8].FIFOCH_n_4 ),
        .\cnt_fifo_reg[8]_4 (\GEN_FIFO[1].FIFOCH_n_2 ),
        .\cnt_fifo_reg[8]_5 (\GEN_FIFO[8].FIFOCH_n_6 ),
        .\cnt_fifo_reg[8]_6 (\GEN_FIFO[1].FIFOCH_n_3 ),
        .\cnt_fifo_reg[8]_7 (\GEN_FIFO[8].FIFOCH_n_8 ),
        .\cnt_fifo_reg[8]_8 (\GEN_FIFO[1].FIFOCH_n_4 ),
        .\cnt_fifo_reg[8]_9 (\GEN_FIFO[8].FIFOCH_n_10 ),
        .nRST(nRST),
        .o_rd_data(\rd_data12[2]_2 ),
        .out({\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ,\FSM_onehot_fifo_wr_stm_reg_n_0_[6] ,\FSM_onehot_fifo_wr_stm_reg_n_0_[3] }),
        .p_0_in(p_0_in),
        .\r_FIFO_COUNT_reg[5]_0 (\GEN_FIFO[9].FIFOCH_n_0 ),
        .\r_FIFO_COUNT_reg[5]_1 (\GEN_FIFO[13].FIFOCH_n_2 ),
        .\r_FIFO_COUNT_reg[5]_2 (\GEN_FIFO[12].FIFOCH_n_2 ),
        .\r_FIFO_COUNT_reg[5]_3 ({full[8],full[5],full[3],full[1]}),
        .\r_FIFO_COUNT_reg[5]_4 (\GEN_FIFO[8].FIFOCH_n_25 ),
        .\r_FIFO_COUNT_reg[5]_5 (\GEN_FIFO[14].FIFOCH_n_1 ),
        .\r_FIFO_COUNT_reg[5]_6 (\GEN_FIFO[0].FIFOCH_n_1 ),
        .\r_FIFO_COUNT_reg[5]_7 (\GEN_FIFO[4].FIFOCH_n_1 ),
        .rd_en(rd_en),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_8 \GEN_FIFO[3].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .D(p_1_in[11:0]),
        .\DataOut_intlH_reg[11] (DataOut_intlH[11:0]),
        .\DataOut_reg[11] ({\GEN_FIFO[3].FIFOCH_n_12 ,\GEN_FIFO[3].FIFOCH_n_13 ,\GEN_FIFO[3].FIFOCH_n_14 ,\GEN_FIFO[3].FIFOCH_n_15 ,\GEN_FIFO[3].FIFOCH_n_16 ,\GEN_FIFO[3].FIFOCH_n_17 ,\GEN_FIFO[3].FIFOCH_n_18 ,\GEN_FIFO[3].FIFOCH_n_19 ,\GEN_FIFO[3].FIFOCH_n_20 ,\GEN_FIFO[3].FIFOCH_n_21 ,\GEN_FIFO[3].FIFOCH_n_22 ,\GEN_FIFO[3].FIFOCH_n_23 }),
        .\DataOut_stall_reg[11] (\rd_data12[3]_3 ),
        .Q(\fifo_rd_stm_reg_n_0_[0] ),
        .\WDONBR_intl_reg[1] (full[3]),
        .address(address),
        .\cnt_fifo_reg[5] (\GEN_FIFO[7].FIFOCH_n_1 ),
        .\cnt_fifo_reg[5]_0 (\DataOut[11]_i_5_n_0 ),
        .\fifo_rd_stm_reg[2] (\DataOut[11]_i_6_n_0 ),
        .o_rd_data(\rd_data12[2]_2 ),
        .p_0_in(p_0_in),
        .rd_en(rd_en),
        .\rdy_state_reg[0] (\DataOut[0]_i_2_n_0 ),
        .\rdy_state_reg[0]_0 (\DataOut[1]_i_2_n_0 ),
        .\rdy_state_reg[0]_1 (\DataOut[2]_i_2_n_0 ),
        .\rdy_state_reg[0]_10 (\DataOut[11]_i_2_n_0 ),
        .\rdy_state_reg[0]_2 (\DataOut[3]_i_2_n_0 ),
        .\rdy_state_reg[0]_3 (\DataOut[4]_i_2_n_0 ),
        .\rdy_state_reg[0]_4 (\DataOut[5]_i_2_n_0 ),
        .\rdy_state_reg[0]_5 (\DataOut[6]_i_2_n_0 ),
        .\rdy_state_reg[0]_6 (\DataOut[7]_i_2_n_0 ),
        .\rdy_state_reg[0]_7 (\DataOut[8]_i_2_n_0 ),
        .\rdy_state_reg[0]_8 (\DataOut[9]_i_2_n_0 ),
        .\rdy_state_reg[0]_9 (\DataOut[10]_i_2_n_0 ),
        .\wr_data_reg[11][7] (\rd_data12[11]_11 ),
        .\wr_data_reg[3][11] ({\wr_data_reg_n_0_[3][11] ,\wr_data_reg_n_0_[3][10] ,\wr_data_reg_n_0_[3][9] ,\wr_data_reg_n_0_[3][8] ,\wr_data_reg_n_0_[3][7] ,\wr_data_reg_n_0_[3][6] ,\wr_data_reg_n_0_[3][5] ,\wr_data_reg_n_0_[3][4] ,\wr_data_reg_n_0_[3][3] ,\wr_data_reg_n_0_[3][2] ,\wr_data_reg_n_0_[3][1] ,\wr_data_reg_n_0_[3][0] }),
        .\wr_data_reg[9][1] (\GEN_FIFO[15].FIFOCH_n_1 ),
        .\wr_data_reg[9][1]_0 (\GEN_FIFO[15].FIFOCH_n_2 ),
        .\wr_data_reg[9][1]_1 (\GEN_FIFO[15].FIFOCH_n_3 ),
        .\wr_data_reg[9][1]_2 (\GEN_FIFO[15].FIFOCH_n_4 ),
        .\wr_data_reg[9][1]_3 (\GEN_FIFO[15].FIFOCH_n_5 ),
        .\wr_data_reg[9][1]_4 (\GEN_FIFO[15].FIFOCH_n_6 ),
        .\wr_data_reg[9][7] (\GEN_FIFO[15].FIFOCH_n_7 ),
        .\wr_data_reg[9][7]_0 (\GEN_FIFO[15].FIFOCH_n_8 ),
        .\wr_data_reg[9][7]_1 (\GEN_FIFO[15].FIFOCH_n_9 ),
        .\wr_data_reg[9][7]_2 (\GEN_FIFO[15].FIFOCH_n_10 ),
        .\wr_data_reg[9][7]_3 (\GEN_FIFO[15].FIFOCH_n_11 ),
        .\wr_data_reg[9][7]_4 (\GEN_FIFO[15].FIFOCH_n_12 ),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_9 \GEN_FIFO[4].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .Q(r_FIFO_COUNT_reg_4),
        .\WDONBR_intl_reg[1] (\GEN_FIFO[4].FIFOCH_n_1 ),
        .address(address),
        .o_rd_data(\rd_data12[4]_4 ),
        .p_0_in(p_0_in),
        .\r_FIFO_COUNT_reg[0]_0 (\GEN_FIFO[7].FIFOCH_n_2 ),
        .\r_RD_INDEX_reg[4]_0 (\GEN_FIFO[4].FIFOCH_n_0 ),
        .rd_en(rd_en),
        .\wr_data_reg[4][11] ({\wr_data_reg_n_0_[4][11] ,\wr_data_reg_n_0_[4][10] ,\wr_data_reg_n_0_[4][9] ,\wr_data_reg_n_0_[4][8] ,\wr_data_reg_n_0_[4][7] ,\wr_data_reg_n_0_[4][6] ,\wr_data_reg_n_0_[4][5] ,\wr_data_reg_n_0_[4][4] ,\wr_data_reg_n_0_[4][3] ,\wr_data_reg_n_0_[4][2] ,\wr_data_reg_n_0_[4][1] ,\wr_data_reg_n_0_[4][0] }),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_10 \GEN_FIFO[5].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .\DataOut_last_reg[0] (\GEN_FIFO[5].FIFOCH_n_1 ),
        .\DataOut_last_reg[10] (\GEN_FIFO[5].FIFOCH_n_11 ),
        .\DataOut_last_reg[11] (\GEN_FIFO[5].FIFOCH_n_12 ),
        .\DataOut_last_reg[1] (\GEN_FIFO[5].FIFOCH_n_2 ),
        .\DataOut_last_reg[2] (\GEN_FIFO[5].FIFOCH_n_3 ),
        .\DataOut_last_reg[3] (\GEN_FIFO[5].FIFOCH_n_4 ),
        .\DataOut_last_reg[4] (\GEN_FIFO[5].FIFOCH_n_5 ),
        .\DataOut_last_reg[5] (\GEN_FIFO[5].FIFOCH_n_6 ),
        .\DataOut_last_reg[6] (\GEN_FIFO[5].FIFOCH_n_7 ),
        .\DataOut_last_reg[7] (\GEN_FIFO[5].FIFOCH_n_8 ),
        .\DataOut_last_reg[8] (\GEN_FIFO[5].FIFOCH_n_9 ),
        .\DataOut_last_reg[9] (\GEN_FIFO[5].FIFOCH_n_10 ),
        .Q({\wr_data_reg_n_0_[5][11] ,\wr_data_reg_n_0_[5][10] ,\wr_data_reg_n_0_[5][9] ,\wr_data_reg_n_0_[5][8] ,\wr_data_reg_n_0_[5][7] ,\wr_data_reg_n_0_[5][6] ,\wr_data_reg_n_0_[5][5] ,\wr_data_reg_n_0_[5][4] ,\wr_data_reg_n_0_[5][3] ,\wr_data_reg_n_0_[5][2] ,\wr_data_reg_n_0_[5][1] ,\wr_data_reg_n_0_[5][0] }),
        .\WDONBR_intl_reg[1] (full[5]),
        .address(address),
        .o_rd_data(\rd_data12[7]_7 ),
        .p_0_in(p_0_in),
        .\r_RD_INDEX_reg[4]_0 (\GEN_FIFO[5].FIFOCH_n_0 ),
        .rd_en(rd_en),
        .\wr_data_reg[4][7] (\rd_data12[4]_4 ),
        .\wr_data_reg[6][7] (\rd_data12[6]_6 ),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_11 \GEN_FIFO[6].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .Q(r_FIFO_COUNT_reg_3),
        .address(address),
        .o_rd_data(\rd_data12[6]_6 ),
        .p_0_in(p_0_in),
        .\r_RD_INDEX_reg[4]_0 (\GEN_FIFO[6].FIFOCH_n_1 ),
        .\r_RD_INDEX_reg[4]_1 (\GEN_FIFO[6].FIFOCH_n_2 ),
        .rd_en(rd_en),
        .\wr_data_reg[6][11] ({\wr_data_reg_n_0_[6][11] ,\wr_data_reg_n_0_[6][10] ,\wr_data_reg_n_0_[6][9] ,\wr_data_reg_n_0_[6][8] ,\wr_data_reg_n_0_[6][7] ,\wr_data_reg_n_0_[6][6] ,\wr_data_reg_n_0_[6][5] ,\wr_data_reg_n_0_[6][4] ,\wr_data_reg_n_0_[6][3] ,\wr_data_reg_n_0_[6][2] ,\wr_data_reg_n_0_[6][1] ,\wr_data_reg_n_0_[6][0] }),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_12 \GEN_FIFO[7].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .Q(r_FIFO_COUNT_reg_4),
        .address(address),
        .o_rd_data(\rd_data12[7]_7 ),
        .p_0_in(p_0_in),
        .\r_RD_INDEX_reg[4]_0 (\GEN_FIFO[7].FIFOCH_n_1 ),
        .\r_RD_INDEX_reg[4]_1 (\GEN_FIFO[7].FIFOCH_n_2 ),
        .rd_en(rd_en),
        .\wr_data_reg[7][11] ({\wr_data_reg_n_0_[7][11] ,\wr_data_reg_n_0_[7][10] ,\wr_data_reg_n_0_[7][9] ,\wr_data_reg_n_0_[7][8] ,\wr_data_reg_n_0_[7][7] ,\wr_data_reg_n_0_[7][6] ,\wr_data_reg_n_0_[7][5] ,\wr_data_reg_n_0_[7][4] ,\wr_data_reg_n_0_[7][3] ,\wr_data_reg_n_0_[7][2] ,\wr_data_reg_n_0_[7][1] ,\wr_data_reg_n_0_[7][0] }),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_13 \GEN_FIFO[8].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .\DIGTime_intl_reg[63] (\GEN_FIFO[8].FIFOCH_n_27 ),
        .\DataOut_last_reg[0] (\GEN_FIFO[8].FIFOCH_n_1 ),
        .\DataOut_last_reg[10] (\GEN_FIFO[8].FIFOCH_n_21 ),
        .\DataOut_last_reg[11] (\GEN_FIFO[8].FIFOCH_n_23 ),
        .\DataOut_last_reg[1] (\GEN_FIFO[8].FIFOCH_n_3 ),
        .\DataOut_last_reg[2] (\GEN_FIFO[8].FIFOCH_n_5 ),
        .\DataOut_last_reg[3] (\GEN_FIFO[8].FIFOCH_n_7 ),
        .\DataOut_last_reg[4] (\GEN_FIFO[8].FIFOCH_n_9 ),
        .\DataOut_last_reg[5] (\GEN_FIFO[8].FIFOCH_n_11 ),
        .\DataOut_last_reg[6] (\GEN_FIFO[8].FIFOCH_n_13 ),
        .\DataOut_last_reg[7] (\GEN_FIFO[8].FIFOCH_n_15 ),
        .\DataOut_last_reg[8] (\GEN_FIFO[8].FIFOCH_n_17 ),
        .\DataOut_last_reg[9] (\GEN_FIFO[8].FIFOCH_n_19 ),
        .\DataOut_stall_reg[0] (\GEN_FIFO[8].FIFOCH_n_0 ),
        .\DataOut_stall_reg[10] (\GEN_FIFO[8].FIFOCH_n_20 ),
        .\DataOut_stall_reg[11] (\GEN_FIFO[8].FIFOCH_n_22 ),
        .\DataOut_stall_reg[1] (\GEN_FIFO[8].FIFOCH_n_2 ),
        .\DataOut_stall_reg[2] (\GEN_FIFO[8].FIFOCH_n_4 ),
        .\DataOut_stall_reg[3] (\GEN_FIFO[8].FIFOCH_n_6 ),
        .\DataOut_stall_reg[4] (\GEN_FIFO[8].FIFOCH_n_8 ),
        .\DataOut_stall_reg[5] (\GEN_FIFO[8].FIFOCH_n_10 ),
        .\DataOut_stall_reg[6] (\GEN_FIFO[8].FIFOCH_n_12 ),
        .\DataOut_stall_reg[7] (\GEN_FIFO[8].FIFOCH_n_14 ),
        .\DataOut_stall_reg[8] (\GEN_FIFO[8].FIFOCH_n_16 ),
        .\DataOut_stall_reg[9] (\GEN_FIFO[8].FIFOCH_n_18 ),
        .\FSM_onehot_fifo_wr_stm_reg[4] (\GEN_FIFO[8].FIFOCH_n_25 ),
        .Q({\wr_data_reg_n_0_[8][11] ,\wr_data_reg_n_0_[8][10] ,\wr_data_reg_n_0_[8][9] ,\wr_data_reg_n_0_[8][8] ,\wr_data_reg_n_0_[8][7] ,\wr_data_reg_n_0_[8][6] ,\wr_data_reg_n_0_[8][5] ,\wr_data_reg_n_0_[8][4] ,\wr_data_reg_n_0_[8][3] ,\wr_data_reg_n_0_[8][2] ,\wr_data_reg_n_0_[8][1] ,\wr_data_reg_n_0_[8][0] }),
        .TestFIFO(TestFIFO),
        .\WDOTime_intl_reg[63] (\GEN_FIFO[8].FIFOCH_n_24 ),
        .address(address),
        .\cnt_fifo_reg[5] (\GEN_FIFO[4].FIFOCH_n_0 ),
        .\cnt_fifo_reg[5]_0 (\GEN_FIFO[5].FIFOCH_n_0 ),
        .\cnt_fifo_reg[6] (\GEN_FIFO[5].FIFOCH_n_1 ),
        .\cnt_fifo_reg[6]_0 (\GEN_FIFO[5].FIFOCH_n_2 ),
        .\cnt_fifo_reg[6]_1 (\GEN_FIFO[5].FIFOCH_n_3 ),
        .\cnt_fifo_reg[6]_10 (\GEN_FIFO[5].FIFOCH_n_12 ),
        .\cnt_fifo_reg[6]_2 (\GEN_FIFO[5].FIFOCH_n_4 ),
        .\cnt_fifo_reg[6]_3 (\GEN_FIFO[5].FIFOCH_n_5 ),
        .\cnt_fifo_reg[6]_4 (\GEN_FIFO[5].FIFOCH_n_6 ),
        .\cnt_fifo_reg[6]_5 (\GEN_FIFO[5].FIFOCH_n_7 ),
        .\cnt_fifo_reg[6]_6 (\GEN_FIFO[5].FIFOCH_n_8 ),
        .\cnt_fifo_reg[6]_7 (\GEN_FIFO[5].FIFOCH_n_9 ),
        .\cnt_fifo_reg[6]_8 (\GEN_FIFO[5].FIFOCH_n_10 ),
        .\cnt_fifo_reg[6]_9 (\GEN_FIFO[5].FIFOCH_n_11 ),
        .data3(data3),
        .full(full[12:9]),
        .nRST(nRST),
        .o_rd_data(\rd_data12[9]_9 ),
        .out({\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ,\FSM_onehot_fifo_wr_stm_reg_n_0_[6] }),
        .p_0_in(p_0_in),
        .\r_FIFO_COUNT_reg[5]_0 (\GEN_FIFO[13].FIFOCH_n_2 ),
        .\r_FIFO_COUNT_reg[5]_1 (\GEN_FIFO[2].FIFOCH_n_1 ),
        .\r_WR_INDEX_reg[4]_0 (full[8]),
        .rd_en(rd_en),
        .\wr_data_reg[14][7] (\rd_data12[14]_14 ),
        .wr_en_reg(wr_en_reg_n_0));
  base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_14 \GEN_FIFO[9].FIFOCH 
       (.AR(\GEN_FIFO[0].FIFOCH_n_0 ),
        .CLK(CLK),
        .Q({\wr_data_reg_n_0_[9][11] ,\wr_data_reg_n_0_[9][10] ,\wr_data_reg_n_0_[9][9] ,\wr_data_reg_n_0_[9][8] ,\wr_data_reg_n_0_[9][7] ,\wr_data_reg_n_0_[9][6] ,\wr_data_reg_n_0_[9][5] ,\wr_data_reg_n_0_[9][4] ,\wr_data_reg_n_0_[9][3] ,\wr_data_reg_n_0_[9][2] ,\wr_data_reg_n_0_[9][1] ,\wr_data_reg_n_0_[9][0] }),
        .\WDOTime_intl_reg[63] (\GEN_FIFO[9].FIFOCH_n_0 ),
        .address(address),
        .\cnt_fifo_reg[5] (\GEN_FIFO[5].FIFOCH_n_0 ),
        .full(full[9]),
        .o_rd_data(\rd_data12[9]_9 ),
        .p_0_in(p_0_in),
        .\r_FIFO_COUNT_reg[5]_0 (full[12:10]),
        .rd_en(rd_en),
        .wr_en_reg(wr_en_reg_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    \Trigger_intl[10]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_TrigInfo[10]),
        .O(\Trigger_intl[10]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \Trigger_intl[3]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_TrigInfo[3]),
        .O(\Trigger_intl[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \Trigger_intl[4]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_TrigInfo[4]),
        .O(\Trigger_intl[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \Trigger_intl[5]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_TrigInfo[5]),
        .O(\Trigger_intl[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \Trigger_intl[6]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_TrigInfo[6]),
        .O(\Trigger_intl[6]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \Trigger_intl[9]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_TrigInfo[9]),
        .O(\Trigger_intl[9]_i_1_n_0 ));
  FDRE \Trigger_intl_reg[0] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_TrigInfo[0]),
        .Q(Trigger_intl[0]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDSE \Trigger_intl_reg[10] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\Trigger_intl[10]_i_1_n_0 ),
        .Q(Trigger_intl[10]),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDRE \Trigger_intl_reg[11] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_TrigInfo[11]),
        .Q(Trigger_intl[11]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \Trigger_intl_reg[1] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_TrigInfo[1]),
        .Q(Trigger_intl[1]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \Trigger_intl_reg[2] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_TrigInfo[2]),
        .Q(Trigger_intl[2]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDSE \Trigger_intl_reg[3] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\Trigger_intl[3]_i_1_n_0 ),
        .Q(Trigger_intl[3]),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \Trigger_intl_reg[4] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\Trigger_intl[4]_i_1_n_0 ),
        .Q(Trigger_intl[4]),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \Trigger_intl_reg[5] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\Trigger_intl[5]_i_1_n_0 ),
        .Q(Trigger_intl[5]),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \Trigger_intl_reg[6] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\Trigger_intl[6]_i_1_n_0 ),
        .Q(Trigger_intl[6]),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDRE \Trigger_intl_reg[7] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_TrigInfo[7]),
        .Q(Trigger_intl[7]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \Trigger_intl_reg[8] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_TrigInfo[8]),
        .Q(Trigger_intl[8]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDSE \Trigger_intl_reg[9] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\Trigger_intl[9]_i_1_n_0 ),
        .Q(Trigger_intl[9]),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDONBR_intl[1]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_WdoAddr[1]),
        .O(\WDONBR_intl[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDONBR_intl[2]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_WdoAddr[2]),
        .O(\WDONBR_intl[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDONBR_intl[4]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_WdoAddr[4]),
        .O(\WDONBR_intl[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDONBR_intl[5]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_WdoAddr[5]),
        .O(\WDONBR_intl[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDONBR_intl[7]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_WdoAddr[7]),
        .O(\WDONBR_intl[7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDONBR_intl[8]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_WdoAddr[8]),
        .O(\WDONBR_intl[8]_i_1_n_0 ));
  FDRE \WDONBR_intl_reg[0] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_WdoAddr[0]),
        .Q(WDONBR_intl[0]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDSE \WDONBR_intl_reg[1] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDONBR_intl[1]_i_1_n_0 ),
        .Q(WDONBR_intl[1]),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDONBR_intl_reg[2] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDONBR_intl[2]_i_1_n_0 ),
        .Q(WDONBR_intl[2]),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDRE \WDONBR_intl_reg[3] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_WdoAddr[3]),
        .Q(WDONBR_intl[3]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDSE \WDONBR_intl_reg[4] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDONBR_intl[4]_i_1_n_0 ),
        .Q(WDONBR_intl[4]),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDONBR_intl_reg[5] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDONBR_intl[5]_i_1_n_0 ),
        .Q(WDONBR_intl[5]),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDRE \WDONBR_intl_reg[6] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_WdoAddr[6]),
        .Q(WDONBR_intl[6]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDSE \WDONBR_intl_reg[7] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDONBR_intl[7]_i_1_n_0 ),
        .Q(WDONBR_intl[7]),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDONBR_intl_reg[8] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDONBR_intl[8]_i_1_n_0 ),
        .Q(WDONBR_intl[8]),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[0]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[0]),
        .O(\WDOTime_intl[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[10]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[10]),
        .O(\WDOTime_intl[10]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[11]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[11]),
        .O(\WDOTime_intl[11]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[12]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[12]),
        .O(\WDOTime_intl[12]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[13]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[13]),
        .O(\WDOTime_intl[13]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[14]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[14]),
        .O(\WDOTime_intl[14]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[15]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[15]),
        .O(\WDOTime_intl[15]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[16]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[16]),
        .O(\WDOTime_intl[16]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[17]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[17]),
        .O(\WDOTime_intl[17]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[18]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[18]),
        .O(\WDOTime_intl[18]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[19]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[19]),
        .O(\WDOTime_intl[19]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[1]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[1]),
        .O(\WDOTime_intl[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[20]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[20]),
        .O(\WDOTime_intl[20]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[21]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[21]),
        .O(\WDOTime_intl[21]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[22]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[22]),
        .O(\WDOTime_intl[22]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[23]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[23]),
        .O(\WDOTime_intl[23]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[24]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[24]),
        .O(\WDOTime_intl[24]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[25]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[25]),
        .O(\WDOTime_intl[25]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[26]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[26]),
        .O(\WDOTime_intl[26]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[27]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[27]),
        .O(\WDOTime_intl[27]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[28]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[28]),
        .O(\WDOTime_intl[28]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[29]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[29]),
        .O(\WDOTime_intl[29]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[2]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[2]),
        .O(\WDOTime_intl[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[30]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[30]),
        .O(\WDOTime_intl[30]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[31]_i_2 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[31]),
        .O(\WDOTime_intl[31]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[3]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[3]),
        .O(\WDOTime_intl[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[4]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[4]),
        .O(\WDOTime_intl[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[5]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[5]),
        .O(\WDOTime_intl[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[6]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[6]),
        .O(\WDOTime_intl[6]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[7]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[7]),
        .O(\WDOTime_intl[7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[8]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[8]),
        .O(\WDOTime_intl[8]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \WDOTime_intl[9]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg_n_0_[8] ),
        .I1(FIFO_Time[9]),
        .O(\WDOTime_intl[9]_i_1_n_0 ));
  FDSE \WDOTime_intl_reg[0] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[0]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[0] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[10] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[10]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[10] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[11] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[11]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[11] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[12] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[12]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[12] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[13] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[13]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[13] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[14] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[14]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[14] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[15] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[15]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[15] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[16] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[16]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[16] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[17] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[17]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[17] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[18] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[18]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[18] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[19] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[19]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[19] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[1] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[1]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[1] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[20] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[20]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[20] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[21] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[21]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[21] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[22] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[22]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[22] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[23] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[23]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[23] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[24] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[24]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[24] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[25] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[25]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[25] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[26] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[26]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[26] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[27] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[27]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[27] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[28] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[28]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[28] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[29] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[29]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[29] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[2] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[2]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[2] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[30] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[30]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[30] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[31] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[31]_i_2_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[31] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDRE \WDOTime_intl_reg[32] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[32]),
        .Q(data1[0]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[33] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[33]),
        .Q(data1[1]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[34] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[34]),
        .Q(data1[2]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[35] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[35]),
        .Q(data1[3]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[36] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[36]),
        .Q(data1[4]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[37] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[37]),
        .Q(data1[5]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[38] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[38]),
        .Q(data1[6]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[39] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[39]),
        .Q(data1[7]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDSE \WDOTime_intl_reg[3] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[3]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[3] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDRE \WDOTime_intl_reg[40] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[40]),
        .Q(data1[8]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[41] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[41]),
        .Q(data1[9]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[42] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[42]),
        .Q(data1[10]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[43] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[43]),
        .Q(data1[11]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[44] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[44]),
        .Q(data1[12]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[45] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[45]),
        .Q(data1[13]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[46] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[46]),
        .Q(data1[14]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[47] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[47]),
        .Q(data1[15]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[48] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[48]),
        .Q(data1[16]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[49] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[49]),
        .Q(data1[17]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDSE \WDOTime_intl_reg[4] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[4]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[4] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDRE \WDOTime_intl_reg[50] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[50]),
        .Q(data1[18]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[51] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[51]),
        .Q(data1[19]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[52] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[52]),
        .Q(data1[20]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[53] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[53]),
        .Q(data1[21]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[54] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[54]),
        .Q(data1[22]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[55] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[55]),
        .Q(data1[23]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[56] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[56]),
        .Q(data1[24]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[57] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[57]),
        .Q(data1[25]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[58] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[58]),
        .Q(data1[26]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[59] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[59]),
        .Q(data1[27]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDSE \WDOTime_intl_reg[5] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[5]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[5] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDRE \WDOTime_intl_reg[60] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[60]),
        .Q(data1[28]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[61] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[61]),
        .Q(data1[29]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[62] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[62]),
        .Q(data1[30]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDRE \WDOTime_intl_reg[63] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(FIFO_Time[63]),
        .Q(data1[31]),
        .R(\GEN_FIFO[2].FIFOCH_n_0 ));
  FDSE \WDOTime_intl_reg[6] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[6]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[6] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[7] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[7]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[7] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[8] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[8]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[8] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  FDSE \WDOTime_intl_reg[9] 
       (.C(CLK),
        .CE(WDOTime_intl0),
        .D(\WDOTime_intl[9]_i_1_n_0 ),
        .Q(\WDOTime_intl_reg_n_0_[9] ),
        .S(\GEN_FIFO[2].FIFOCH_n_2 ));
  LUT6 #(
    .INIT(64'h0030FFFFAABA0000)) 
    \cnt_fifo[0]_i_1 
       (.I0(\cnt_fifo[8]_i_4_n_0 ),
        .I1(\cnt_fifo[0]_i_2_n_0 ),
        .I2(\cnt_fifo[0]_i_3_n_0 ),
        .I3(\fifo_rd_stm[1]_i_3_n_0 ),
        .I4(cnt_fifo0),
        .I5(\cnt_fifo_reg_n_0_[0] ),
        .O(\cnt_fifo[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \cnt_fifo[0]_i_2 
       (.I0(\fifo_rd_stm_reg_n_0_[1] ),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\fifo_rd_stm_reg_n_0_[3] ),
        .O(\cnt_fifo[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \cnt_fifo[0]_i_3 
       (.I0(\fifo_rd_stm_reg_n_0_[3] ),
        .I1(\fifo_rd_stm_reg_n_0_[1] ),
        .O(\cnt_fifo[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h2F80)) 
    \cnt_fifo[1]_i_1 
       (.I0(\cnt_fifo[8]_i_4_n_0 ),
        .I1(\cnt_fifo_reg_n_0_[0] ),
        .I2(cnt_fifo0),
        .I3(\cnt_fifo_reg_n_0_[1] ),
        .O(\cnt_fifo[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \cnt_fifo[2]_i_1 
       (.I0(\cnt_fifo_reg_n_0_[1] ),
        .I1(\cnt_fifo_reg_n_0_[0] ),
        .I2(\cnt_fifo_reg_n_0_[2] ),
        .O(\cnt_fifo[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \cnt_fifo[3]_i_1 
       (.I0(\cnt_fifo_reg_n_0_[2] ),
        .I1(\cnt_fifo_reg_n_0_[0] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(\cnt_fifo_reg_n_0_[3] ),
        .O(\cnt_fifo[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \cnt_fifo[4]_i_1 
       (.I0(\cnt_fifo_reg_n_0_[3] ),
        .I1(\cnt_fifo_reg_n_0_[1] ),
        .I2(\cnt_fifo_reg_n_0_[0] ),
        .I3(\cnt_fifo_reg_n_0_[2] ),
        .I4(\cnt_fifo_reg_n_0_[4] ),
        .O(\cnt_fifo[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2F80)) 
    \cnt_fifo[5]_i_1 
       (.I0(\cnt_fifo[8]_i_4_n_0 ),
        .I1(\cnt_fifo[8]_i_5_n_0 ),
        .I2(cnt_fifo0),
        .I3(address[0]),
        .O(\cnt_fifo[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \cnt_fifo[6]_i_1 
       (.I0(address[0]),
        .I1(\cnt_fifo[8]_i_5_n_0 ),
        .I2(address[1]),
        .O(\cnt_fifo[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \cnt_fifo[7]_i_1 
       (.I0(\cnt_fifo[8]_i_5_n_0 ),
        .I1(address[0]),
        .I2(address[1]),
        .I3(address[2]),
        .O(\cnt_fifo[7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_fifo[8]_i_1 
       (.I0(cnt_fifo0),
        .I1(\cnt_fifo[8]_i_4_n_0 ),
        .O(\cnt_fifo[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000008088C00000)) 
    \cnt_fifo[8]_i_2 
       (.I0(ready_i),
        .I1(nRST),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(\fifo_rd_stm_reg_n_0_[1] ),
        .I4(\fifo_rd_stm_reg_n_0_[2] ),
        .I5(\fifo_rd_stm_reg_n_0_[3] ),
        .O(cnt_fifo0));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \cnt_fifo[8]_i_3 
       (.I0(address[2]),
        .I1(address[3]),
        .I2(address[1]),
        .I3(address[0]),
        .I4(\cnt_fifo[8]_i_5_n_0 ),
        .O(\cnt_fifo[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAEAAAEAAAFABA)) 
    \cnt_fifo[8]_i_4 
       (.I0(\fifo_rd_stm_reg_n_0_[3] ),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\fifo_rd_stm_reg_n_0_[1] ),
        .I3(rd_en0__7),
        .I4(\cnt_fifo[8]_i_6_n_0 ),
        .I5(\cnt_fifo[8]_i_7_n_0 ),
        .O(\cnt_fifo[8]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \cnt_fifo[8]_i_5 
       (.I0(\cnt_fifo_reg_n_0_[4] ),
        .I1(\cnt_fifo_reg_n_0_[3] ),
        .I2(\cnt_fifo_reg_n_0_[1] ),
        .I3(\cnt_fifo_reg_n_0_[0] ),
        .I4(\cnt_fifo_reg_n_0_[2] ),
        .O(\cnt_fifo[8]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt_fifo[8]_i_6 
       (.I0(\cnt_fifo_reg_n_0_[1] ),
        .I1(\cnt_fifo_reg_n_0_[2] ),
        .O(\cnt_fifo[8]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \cnt_fifo[8]_i_7 
       (.I0(address[1]),
        .I1(address[0]),
        .I2(address[3]),
        .I3(address[2]),
        .I4(\cnt_fifo_reg_n_0_[3] ),
        .I5(\cnt_fifo_reg_n_0_[4] ),
        .O(\cnt_fifo[8]_i_7_n_0 ));
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
        .CE(cnt_fifo0),
        .D(\cnt_fifo[2]_i_1_n_0 ),
        .Q(\cnt_fifo_reg_n_0_[2] ),
        .R(\cnt_fifo[8]_i_1_n_0 ));
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
        .CE(1'b1),
        .D(\cnt_fifo[5]_i_1_n_0 ),
        .Q(address[0]),
        .R(1'b0));
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
    .INIT(64'hEEFFEEFEEEEFEEEE)) 
    \fifo_rd_stm[0]_i_1 
       (.I0(\fifo_rd_stm[0]_i_2_n_0 ),
        .I1(\fifo_rd_stm[0]_i_3_n_0 ),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(\fifo_rd_stm[3]_i_4_n_0 ),
        .I4(\fifo_rd_stm[0]_i_4_n_0 ),
        .I5(rd_en0__7),
        .O(fifo_rd_stm[0]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT5 #(
    .INIT(32'h00003420)) 
    \fifo_rd_stm[0]_i_2 
       (.I0(\fifo_rd_stm_reg_n_0_[1] ),
        .I1(\fifo_rd_stm_reg_n_0_[3] ),
        .I2(\fifo_rd_stm_reg_n_0_[2] ),
        .I3(\fifo_rd_stm_reg_n_0_[0] ),
        .I4(ready_i),
        .O(\fifo_rd_stm[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAABBF)) 
    \fifo_rd_stm[0]_i_3 
       (.I0(\fifo_rd_stm[0]_i_6_n_0 ),
        .I1(\fifo_rd_stm_reg_n_0_[1] ),
        .I2(\FIFO_WR_reg[valid_n_0_] ),
        .I3(\fifo_rd_stm_reg_n_0_[0] ),
        .I4(\fifo_rd_stm_reg_n_0_[2] ),
        .I5(\fifo_rd_stm_reg_n_0_[3] ),
        .O(\fifo_rd_stm[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT5 #(
    .INIT(32'hFFFEFEFE)) 
    \fifo_rd_stm[0]_i_4 
       (.I0(\cnt_fifo_reg_n_0_[4] ),
        .I1(\cnt_fifo_reg_n_0_[3] ),
        .I2(\fifo_rd_stm[0]_i_7_n_0 ),
        .I3(\cnt_fifo_reg_n_0_[2] ),
        .I4(\cnt_fifo_reg_n_0_[1] ),
        .O(\fifo_rd_stm[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hDFFFFFFFFFFFFFFF)) 
    \fifo_rd_stm[0]_i_5 
       (.I0(\cnt_fifo_reg_n_0_[4] ),
        .I1(\fifo_rd_stm[0]_i_8_n_0 ),
        .I2(\cnt_fifo_reg_n_0_[3] ),
        .I3(\cnt_fifo_reg_n_0_[1] ),
        .I4(\cnt_fifo_reg_n_0_[0] ),
        .I5(\cnt_fifo_reg_n_0_[2] ),
        .O(rd_en0__7));
  LUT6 #(
    .INIT(64'h000000000CA00000)) 
    \fifo_rd_stm[0]_i_6 
       (.I0(PSBUSY_i),
        .I1(last_fifo_rd_stm[0]),
        .I2(\fifo_rd_stm_reg_n_0_[2] ),
        .I3(\fifo_rd_stm_reg_n_0_[3] ),
        .I4(\fifo_rd_stm_reg_n_0_[0] ),
        .I5(\fifo_rd_stm_reg_n_0_[1] ),
        .O(\fifo_rd_stm[0]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \fifo_rd_stm[0]_i_7 
       (.I0(address[1]),
        .I1(address[0]),
        .I2(address[3]),
        .I3(address[2]),
        .O(\fifo_rd_stm[0]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \fifo_rd_stm[0]_i_8 
       (.I0(address[3]),
        .I1(address[2]),
        .I2(address[1]),
        .I3(address[0]),
        .O(\fifo_rd_stm[0]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFAABA)) 
    \fifo_rd_stm[1]_i_1 
       (.I0(\fifo_rd_stm[1]_i_2_n_0 ),
        .I1(\fifo_rd_stm[1]_i_3_n_0 ),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(\fifo_rd_stm[1]_i_4_n_0 ),
        .I4(\fifo_rd_stm[1]_i_5_n_0 ),
        .I5(\fifo_rd_stm[1]_i_6_n_0 ),
        .O(fifo_rd_stm[1]));
  LUT6 #(
    .INIT(64'h00F0000800000008)) 
    \fifo_rd_stm[1]_i_2 
       (.I0(\FIFO_WR_reg[valid_n_0_] ),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\fifo_rd_stm_reg_n_0_[2] ),
        .I3(\fifo_rd_stm_reg_n_0_[3] ),
        .I4(\fifo_rd_stm_reg_n_0_[1] ),
        .I5(ready_i),
        .O(\fifo_rd_stm[1]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \fifo_rd_stm[1]_i_3 
       (.I0(PSBUSY_i),
        .I1(ready_i),
        .O(\fifo_rd_stm[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \fifo_rd_stm[1]_i_4 
       (.I0(\fifo_rd_stm_reg_n_0_[3] ),
        .I1(\fifo_rd_stm_reg_n_0_[2] ),
        .O(\fifo_rd_stm[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000008000000)) 
    \fifo_rd_stm[1]_i_5 
       (.I0(ready_i),
        .I1(last_fifo_rd_stm[2]),
        .I2(\fifo_rd_stm_reg_n_0_[1] ),
        .I3(\fifo_rd_stm_reg_n_0_[0] ),
        .I4(\fifo_rd_stm_reg_n_0_[3] ),
        .I5(\fifo_rd_stm_reg_n_0_[2] ),
        .O(\fifo_rd_stm[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00000000000050C0)) 
    \fifo_rd_stm[1]_i_6 
       (.I0(PSBUSY_i),
        .I1(\FIFO_WR_reg[valid_n_0_] ),
        .I2(\fifo_rd_stm_reg_n_0_[1] ),
        .I3(\fifo_rd_stm_reg_n_0_[3] ),
        .I4(\fifo_rd_stm_reg_n_0_[2] ),
        .I5(\fifo_rd_stm_reg_n_0_[0] ),
        .O(\fifo_rd_stm[1]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF40FF40FF40)) 
    \fifo_rd_stm[2]_i_1 
       (.I0(\FIFO_WR_reg[valid_n_0_] ),
        .I1(\fifo_rd_stm_reg_n_0_[1] ),
        .I2(\fifo_rd_stm[2]_i_2_n_0 ),
        .I3(\fifo_rd_stm[2]_i_3_n_0 ),
        .I4(\fifo_rd_stm[3]_i_5_n_0 ),
        .I5(\fifo_rd_stm[2]_i_4_n_0 ),
        .O(fifo_rd_stm[2]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \fifo_rd_stm[2]_i_2 
       (.I0(\fifo_rd_stm_reg_n_0_[3] ),
        .I1(\fifo_rd_stm_reg_n_0_[2] ),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .O(\fifo_rd_stm[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000F8000000000)) 
    \fifo_rd_stm[2]_i_3 
       (.I0(last_fifo_rd_stm[2]),
        .I1(ready_i),
        .I2(\fifo_rd_stm_reg_n_0_[3] ),
        .I3(\fifo_rd_stm_reg_n_0_[2] ),
        .I4(\fifo_rd_stm_reg_n_0_[1] ),
        .I5(\fifo_rd_stm_reg_n_0_[0] ),
        .O(\fifo_rd_stm[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    \fifo_rd_stm[2]_i_4 
       (.I0(ready_i),
        .I1(\fifo_rd_stm_reg_n_0_[1] ),
        .I2(\fifo_rd_stm_reg_n_0_[3] ),
        .I3(\fifo_rd_stm_reg_n_0_[2] ),
        .O(\fifo_rd_stm[2]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hF070F0F0)) 
    \fifo_rd_stm[3]_i_1 
       (.I0(\fifo_rd_stm_reg_n_0_[3] ),
        .I1(\fifo_rd_stm_reg_n_0_[2] ),
        .I2(nRST),
        .I3(\fifo_rd_stm_reg_n_0_[1] ),
        .I4(\fifo_rd_stm_reg_n_0_[0] ),
        .O(fifo_rd_stm0));
  LUT6 #(
    .INIT(64'h22F222FF22F2FFFF)) 
    \fifo_rd_stm[3]_i_2 
       (.I0(\fifo_rd_stm[3]_i_3_n_0 ),
        .I1(PSBUSY_i),
        .I2(\DataOut_stall[11]_i_1_n_0 ),
        .I3(ready_i),
        .I4(\fifo_rd_stm[3]_i_4_n_0 ),
        .I5(\fifo_rd_stm[3]_i_5_n_0 ),
        .O(fifo_rd_stm[3]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \fifo_rd_stm[3]_i_3 
       (.I0(\fifo_rd_stm_reg_n_0_[0] ),
        .I1(\fifo_rd_stm_reg_n_0_[1] ),
        .I2(\fifo_rd_stm_reg_n_0_[2] ),
        .I3(\fifo_rd_stm_reg_n_0_[3] ),
        .O(\fifo_rd_stm[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \fifo_rd_stm[3]_i_4 
       (.I0(\fifo_rd_stm_reg_n_0_[2] ),
        .I1(\fifo_rd_stm_reg_n_0_[3] ),
        .I2(\fifo_rd_stm_reg_n_0_[1] ),
        .O(\fifo_rd_stm[3]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \fifo_rd_stm[3]_i_5 
       (.I0(rd_en0__7),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .O(\fifo_rd_stm[3]_i_5_n_0 ));
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
  LUT5 #(
    .INIT(32'hFFEF0020)) 
    \last_fifo_rd_stm[0]_i_1 
       (.I0(\fifo_rd_stm_reg_n_0_[0] ),
        .I1(ready_i),
        .I2(nRST),
        .I3(\fifo_rd_stm[3]_i_4_n_0 ),
        .I4(last_fifo_rd_stm[0]),
        .O(\last_fifo_rd_stm[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00002000)) 
    \last_fifo_rd_stm[2]_i_1 
       (.I0(\fifo_rd_stm_reg_n_0_[2] ),
        .I1(\fifo_rd_stm_reg_n_0_[3] ),
        .I2(\fifo_rd_stm_reg_n_0_[1] ),
        .I3(nRST),
        .I4(ready_i),
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
  LUT3 #(
    .INIT(8'hB8)) 
    rd_en_i_1
       (.I0(rd_en_i_2_n_0),
        .I1(rd_en0),
        .I2(rd_en),
        .O(rd_en_i_1_n_0));
  LUT6 #(
    .INIT(64'hB000B000FF000000)) 
    rd_en_i_2
       (.I0(rd_en0__7),
        .I1(\fifo_rd_stm_reg_n_0_[0] ),
        .I2(\fifo_rd_stm_reg_n_0_[2] ),
        .I3(ready_i),
        .I4(\fifo_rd_stm_reg_n_0_[3] ),
        .I5(\fifo_rd_stm_reg_n_0_[1] ),
        .O(rd_en_i_2_n_0));
  LUT6 #(
    .INIT(64'h000FAA0000F0800F)) 
    rd_en_i_3
       (.I0(rd_en_i_4_n_0),
        .I1(\fifo_rd_stm[1]_i_3_n_0 ),
        .I2(\fifo_rd_stm_reg_n_0_[0] ),
        .I3(\fifo_rd_stm_reg_n_0_[2] ),
        .I4(\fifo_rd_stm_reg_n_0_[3] ),
        .I5(\fifo_rd_stm_reg_n_0_[1] ),
        .O(rd_en0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFEFFFF)) 
    rd_en_i_4
       (.I0(\fifo_rd_stm_reg_n_0_[0] ),
        .I1(\fifo_rd_stm[0]_i_7_n_0 ),
        .I2(\cnt_fifo_reg_n_0_[3] ),
        .I3(\cnt_fifo[8]_i_6_n_0 ),
        .I4(ready_i),
        .I5(\cnt_fifo_reg_n_0_[4] ),
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
  LUT3 #(
    .INIT(8'h80)) 
    \wr_data[0][11]_i_1 
       (.I0(nRST),
        .I1(PRECvalid),
        .I2(\FSM_onehot_fifo_wr_stm_reg_n_0_[1] ),
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
    .INIT(32'hAFBFA0A0)) 
    wr_en_i_1
       (.I0(wr_en),
        .I1(\FSM_onehot_fifo_wr_stm_reg_n_0_[5] ),
        .I2(nRST),
        .I3(\FSM_onehot_fifo_wr_stm_reg_n_0_[0] ),
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
    \WDONBR_intl_reg[1] ,
    o_rd_data,
    CLK,
    rd_en,
    address,
    \cnt_fifo_reg[5] ,
    wr_en_reg,
    \r_FIFO_COUNT_reg[0]_0 ,
    Q,
    nRST,
    p_0_in,
    \wr_data_reg[0][11] );
  output [0:0]AR;
  output \WDONBR_intl_reg[1] ;
  output [11:0]o_rd_data;
  input CLK;
  input rd_en;
  input [3:0]address;
  input \cnt_fifo_reg[5] ;
  input wr_en_reg;
  input \r_FIFO_COUNT_reg[0]_0 ;
  input [0:0]Q;
  input nRST;
  input p_0_in;
  input [11:0]\wr_data_reg[0][11] ;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]Q;
  wire \WDONBR_intl_reg[1] ;
  wire [3:0]address;
  wire \cnt_fifo_reg[5] ;
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
  wire \r_FIFO_COUNT_reg[0]_0 ;
  wire [6:0]r_FIFO_COUNT_reg__0;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1_n_0 ;
  wire \r_RD_INDEX[1]_i_1_n_0 ;
  wire \r_RD_INDEX[2]_i_1_n_0 ;
  wire \r_RD_INDEX[3]_i_2_n_0 ;
  wire \r_RD_INDEX[4]_i_1_n_0 ;
  wire [4:0]r_WR_INDEX;
  wire r_WR_INDEX0;
  wire \r_WR_INDEX[0]_i_1_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire \r_WR_INDEX[4]_i_3_n_0 ;
  wire rd_en;
  wire [11:0]\wr_data_reg[0][11] ;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT4 #(
    .INIT(16'hFDFF)) 
    FIFO_ReadEn_i_16
       (.I0(r_FIFO_COUNT_reg__0[5]),
        .I1(\r_WR_INDEX[4]_i_3_n_0 ),
        .I2(\r_FIFO_COUNT_reg[0]_0 ),
        .I3(Q),
        .O(\WDONBR_intl_reg[1] ));
  LUT1 #(
    .INIT(2'h1)) 
    FIFOvalid_i_2
       (.I0(nRST),
        .O(AR));
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
    .INIT(64'hAAAAAAA655555555)) 
    p_0_out_carry_i_5__2
       (.I0(r_FIFO_COUNT_reg__0[1]),
        .I1(rd_en),
        .I2(address[2]),
        .I3(address[3]),
        .I4(\cnt_fifo_reg[5] ),
        .I5(wr_en_reg),
        .O(p_0_out_carry_i_5__2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1 
       (.I0(r_FIFO_COUNT_reg__0[0]),
        .O(\r_FIFO_COUNT[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAA9AAAAAAAA)) 
    \r_FIFO_COUNT[6]_i_1__2 
       (.I0(wr_en_reg),
        .I1(address[1]),
        .I2(address[0]),
        .I3(address[3]),
        .I4(address[2]),
        .I5(rd_en),
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
        .DIA(\wr_data_reg[0][11] [1:0]),
        .DIB(\wr_data_reg[0][11] [3:2]),
        .DIC(\wr_data_reg[0][11] [5:4]),
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
        .DIA(\wr_data_reg[0][11] [7:6]),
        .DIB(\wr_data_reg[0][11] [9:8]),
        .DIC(\wr_data_reg[0][11] [11:10]),
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
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000C00000008)) 
    \r_RD_INDEX[3]_i_1__2 
       (.I0(\r_WR_INDEX[4]_i_3_n_0 ),
        .I1(rd_en),
        .I2(address[2]),
        .I3(address[3]),
        .I4(\cnt_fifo_reg[5] ),
        .I5(r_FIFO_COUNT_reg__0[5]),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \r_WR_INDEX[4]_i_1 
       (.I0(r_FIFO_COUNT_reg__0[5]),
        .I1(\r_WR_INDEX[4]_i_3_n_0 ),
        .I2(wr_en_reg),
        .O(r_WR_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
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
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \r_WR_INDEX[4]_i_3 
       (.I0(r_FIFO_COUNT_reg__0[0]),
        .I1(r_FIFO_COUNT_reg__0[6]),
        .I2(r_FIFO_COUNT_reg__0[4]),
        .I3(r_FIFO_COUNT_reg__0[3]),
        .I4(r_FIFO_COUNT_reg__0[1]),
        .I5(r_FIFO_COUNT_reg__0[2]),
        .O(\r_WR_INDEX[4]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_WR_INDEX0),
        .D(\r_WR_INDEX[0]_i_1_n_0 ),
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
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_0
   (full,
    o_rd_data,
    AR,
    CLK,
    \cnt_fifo_reg[6] ,
    address,
    rd_en,
    wr_en_reg,
    p_0_in,
    Q);
  output [0:0]full;
  output [11:0]o_rd_data;
  input [0:0]AR;
  input CLK;
  input \cnt_fifo_reg[6] ;
  input [3:0]address;
  input rd_en;
  input wr_en_reg;
  input p_0_in;
  input [11:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire [11:0]Q;
  wire [3:0]address;
  wire \cnt_fifo_reg[6] ;
  wire [0:0]full;
  wire [11:0]o_rd_data;
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
  wire p_0_out_carry_i_5__10_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__9_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__10_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__9_n_0 ;
  wire \r_RD_INDEX[1]_i_1__9_n_0 ;
  wire \r_RD_INDEX[2]_i_1__9_n_0 ;
  wire \r_RD_INDEX[3]_i_2__9_n_0 ;
  wire \r_RD_INDEX[4]_i_1__9_n_0 ;
  wire [4:0]r_WR_INDEX;
  wire r_WR_INDEX0;
  wire \r_WR_INDEX[0]_i_1__9_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire \r_WR_INDEX[4]_i_3__9_n_0 ;
  wire rd_en;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT2 #(
    .INIT(4'h2)) 
    FIFO_ReadEn_i_8
       (.I0(r_FIFO_COUNT_reg[5]),
        .I1(\r_WR_INDEX[4]_i_3__9_n_0 ),
        .O(full));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__9_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__9_n_0,p_0_out_carry_i_3__9_n_0,p_0_out_carry_i_4__9_n_0,p_0_out_carry_i_5__10_n_0}));
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
  LUT6 #(
    .INIT(64'hAA6AAAAA55555555)) 
    p_0_out_carry_i_5__10
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(\cnt_fifo_reg[6] ),
        .I2(address[3]),
        .I3(address[2]),
        .I4(rd_en),
        .I5(wr_en_reg),
        .O(p_0_out_carry_i_5__10_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__9 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__9_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA6AAAAAAAAAA)) 
    \r_FIFO_COUNT[6]_i_1__10 
       (.I0(wr_en_reg),
        .I1(rd_en),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[0]),
        .I5(address[1]),
        .O(\r_FIFO_COUNT[6]_i_1__10_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__10_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__9_n_0 ),
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
    \r_RD_INDEX[0]_i_1__9 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1__9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__9 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__9 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__9_n_0 ));
  LUT6 #(
    .INIT(64'h00C0000000800000)) 
    \r_RD_INDEX[3]_i_1__10 
       (.I0(\r_WR_INDEX[4]_i_3__9_n_0 ),
        .I1(\cnt_fifo_reg[6] ),
        .I2(address[3]),
        .I3(address[2]),
        .I4(rd_en),
        .I5(r_FIFO_COUNT_reg[5]),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__9 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h8A)) 
    \r_WR_INDEX[4]_i_1__9 
       (.I0(wr_en_reg),
        .I1(\r_WR_INDEX[4]_i_3__9_n_0 ),
        .I2(r_FIFO_COUNT_reg[5]),
        .O(r_WR_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
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
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \r_WR_INDEX[4]_i_3__9 
       (.I0(r_FIFO_COUNT_reg[0]),
        .I1(r_FIFO_COUNT_reg[6]),
        .I2(r_FIFO_COUNT_reg[4]),
        .I3(r_FIFO_COUNT_reg[3]),
        .I4(r_FIFO_COUNT_reg[1]),
        .I5(r_FIFO_COUNT_reg[2]),
        .O(\r_WR_INDEX[4]_i_3__9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_WR_INDEX0),
        .D(\r_WR_INDEX[0]_i_1__9_n_0 ),
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
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_1
   (D,
    o_rd_data,
    full,
    \FIFO_WR_reg[valid] ,
    FIFO_ReadEn_reg,
    AR,
    CLK,
    \cnt_fifo_reg[5] ,
    address,
    rd_en,
    wr_en_reg,
    \wr_data_reg[3][7] ,
    \wr_data_reg[2][1] ,
    \wr_data_reg[2][1]_0 ,
    \wr_data_reg[2][1]_1 ,
    \wr_data_reg[2][1]_2 ,
    \wr_data_reg[2][1]_3 ,
    \wr_data_reg[2][1]_4 ,
    \wr_data_reg[2][7] ,
    \wr_data_reg[2][7]_0 ,
    \wr_data_reg[2][7]_1 ,
    \wr_data_reg[2][7]_2 ,
    \wr_data_reg[2][7]_3 ,
    \wr_data_reg[2][7]_4 ,
    \r_FIFO_COUNT_reg[5]_0 ,
    \r_FIFO_COUNT_reg[5]_1 ,
    \r_FIFO_COUNT_reg[5]_2 ,
    \r_FIFO_COUNT_reg[5]_3 ,
    out,
    \FSM_onehot_fifo_wr_stm_reg[2] ,
    \FIFO_WR_reg[valid]0 ,
    \FIFO_WR_reg[valid]_0 ,
    \FSM_onehot_fifo_wr_stm_reg[6] ,
    \FSM_onehot_fifo_wr_stm_reg[6]_0 ,
    \FSM_onehot_fifo_wr_stm_reg[7] ,
    FIFO_ReadEn,
    p_0_in,
    Q);
  output [11:0]D;
  output [11:0]o_rd_data;
  output [0:0]full;
  output \FIFO_WR_reg[valid] ;
  output FIFO_ReadEn_reg;
  input [0:0]AR;
  input CLK;
  input \cnt_fifo_reg[5] ;
  input [3:0]address;
  input rd_en;
  input wr_en_reg;
  input [11:0]\wr_data_reg[3][7] ;
  input \wr_data_reg[2][1] ;
  input \wr_data_reg[2][1]_0 ;
  input \wr_data_reg[2][1]_1 ;
  input \wr_data_reg[2][1]_2 ;
  input \wr_data_reg[2][1]_3 ;
  input \wr_data_reg[2][1]_4 ;
  input \wr_data_reg[2][7] ;
  input \wr_data_reg[2][7]_0 ;
  input \wr_data_reg[2][7]_1 ;
  input \wr_data_reg[2][7]_2 ;
  input \wr_data_reg[2][7]_3 ;
  input \wr_data_reg[2][7]_4 ;
  input [2:0]\r_FIFO_COUNT_reg[5]_0 ;
  input \r_FIFO_COUNT_reg[5]_1 ;
  input \r_FIFO_COUNT_reg[5]_2 ;
  input \r_FIFO_COUNT_reg[5]_3 ;
  input [0:0]out;
  input \FSM_onehot_fifo_wr_stm_reg[2] ;
  input \FIFO_WR_reg[valid]0 ;
  input \FIFO_WR_reg[valid]_0 ;
  input \FSM_onehot_fifo_wr_stm_reg[6] ;
  input \FSM_onehot_fifo_wr_stm_reg[6]_0 ;
  input \FSM_onehot_fifo_wr_stm_reg[7] ;
  input FIFO_ReadEn;
  input p_0_in;
  input [11:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire [11:0]D;
  wire FIFO_ReadEn;
  wire FIFO_ReadEn_i_3_n_0;
  wire FIFO_ReadEn_reg;
  wire \FIFO_WR_reg[valid] ;
  wire \FIFO_WR_reg[valid]0 ;
  wire \FIFO_WR_reg[valid]_0 ;
  wire \FSM_onehot_fifo_wr_stm_reg[2] ;
  wire \FSM_onehot_fifo_wr_stm_reg[6] ;
  wire \FSM_onehot_fifo_wr_stm_reg[6]_0 ;
  wire \FSM_onehot_fifo_wr_stm_reg[7] ;
  wire [11:0]Q;
  wire [3:0]address;
  wire \cnt_fifo_reg[5] ;
  wire [0:0]full;
  wire [11:0]o_rd_data;
  wire [0:0]out;
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
  wire p_0_out_carry_i_5__13_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__10_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__13_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire [2:0]\r_FIFO_COUNT_reg[5]_0 ;
  wire \r_FIFO_COUNT_reg[5]_1 ;
  wire \r_FIFO_COUNT_reg[5]_2 ;
  wire \r_FIFO_COUNT_reg[5]_3 ;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__10_n_0 ;
  wire \r_RD_INDEX[1]_i_1__10_n_0 ;
  wire \r_RD_INDEX[2]_i_1__10_n_0 ;
  wire \r_RD_INDEX[3]_i_2__10_n_0 ;
  wire \r_RD_INDEX[4]_i_1__10_n_0 ;
  wire [4:0]r_WR_INDEX;
  wire r_WR_INDEX0;
  wire \r_WR_INDEX[0]_i_1__10_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire \r_WR_INDEX[4]_i_3__10_n_0 ;
  wire rd_en;
  wire \wr_data_reg[2][1] ;
  wire \wr_data_reg[2][1]_0 ;
  wire \wr_data_reg[2][1]_1 ;
  wire \wr_data_reg[2][1]_2 ;
  wire \wr_data_reg[2][1]_3 ;
  wire \wr_data_reg[2][1]_4 ;
  wire \wr_data_reg[2][7] ;
  wire \wr_data_reg[2][7]_0 ;
  wire \wr_data_reg[2][7]_1 ;
  wire \wr_data_reg[2][7]_2 ;
  wire \wr_data_reg[2][7]_3 ;
  wire \wr_data_reg[2][7]_4 ;
  wire [11:0]\wr_data_reg[3][7] ;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT6 #(
    .INIT(64'hFFFFFFFF05010400)) 
    \DataOut_stall[0]_i_1 
       (.I0(\cnt_fifo_reg[5] ),
        .I1(address[3]),
        .I2(address[2]),
        .I3(o_rd_data[0]),
        .I4(\wr_data_reg[3][7] [0]),
        .I5(\wr_data_reg[2][1] ),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFF05010400)) 
    \DataOut_stall[10]_i_1 
       (.I0(\cnt_fifo_reg[5] ),
        .I1(address[3]),
        .I2(address[2]),
        .I3(o_rd_data[10]),
        .I4(\wr_data_reg[3][7] [10]),
        .I5(\wr_data_reg[2][7]_3 ),
        .O(D[10]));
  LUT6 #(
    .INIT(64'hFFFFFFFF05010400)) 
    \DataOut_stall[11]_i_2 
       (.I0(\cnt_fifo_reg[5] ),
        .I1(address[3]),
        .I2(address[2]),
        .I3(o_rd_data[11]),
        .I4(\wr_data_reg[3][7] [11]),
        .I5(\wr_data_reg[2][7]_4 ),
        .O(D[11]));
  LUT6 #(
    .INIT(64'hFFFFFFFF05010400)) 
    \DataOut_stall[1]_i_1 
       (.I0(\cnt_fifo_reg[5] ),
        .I1(address[3]),
        .I2(address[2]),
        .I3(o_rd_data[1]),
        .I4(\wr_data_reg[3][7] [1]),
        .I5(\wr_data_reg[2][1]_0 ),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFF05010400)) 
    \DataOut_stall[2]_i_1 
       (.I0(\cnt_fifo_reg[5] ),
        .I1(address[3]),
        .I2(address[2]),
        .I3(o_rd_data[2]),
        .I4(\wr_data_reg[3][7] [2]),
        .I5(\wr_data_reg[2][1]_1 ),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFF05010400)) 
    \DataOut_stall[3]_i_1 
       (.I0(\cnt_fifo_reg[5] ),
        .I1(address[3]),
        .I2(address[2]),
        .I3(o_rd_data[3]),
        .I4(\wr_data_reg[3][7] [3]),
        .I5(\wr_data_reg[2][1]_2 ),
        .O(D[3]));
  LUT6 #(
    .INIT(64'hFFFFFFFF05010400)) 
    \DataOut_stall[4]_i_1 
       (.I0(\cnt_fifo_reg[5] ),
        .I1(address[3]),
        .I2(address[2]),
        .I3(o_rd_data[4]),
        .I4(\wr_data_reg[3][7] [4]),
        .I5(\wr_data_reg[2][1]_3 ),
        .O(D[4]));
  LUT6 #(
    .INIT(64'hFFFFFFFF05010400)) 
    \DataOut_stall[5]_i_1 
       (.I0(\cnt_fifo_reg[5] ),
        .I1(address[3]),
        .I2(address[2]),
        .I3(o_rd_data[5]),
        .I4(\wr_data_reg[3][7] [5]),
        .I5(\wr_data_reg[2][1]_4 ),
        .O(D[5]));
  LUT6 #(
    .INIT(64'hFFFFFFFF05010400)) 
    \DataOut_stall[6]_i_1 
       (.I0(\cnt_fifo_reg[5] ),
        .I1(address[3]),
        .I2(address[2]),
        .I3(o_rd_data[6]),
        .I4(\wr_data_reg[3][7] [6]),
        .I5(\wr_data_reg[2][7] ),
        .O(D[6]));
  LUT6 #(
    .INIT(64'hFFFFFFFF05010400)) 
    \DataOut_stall[7]_i_1 
       (.I0(\cnt_fifo_reg[5] ),
        .I1(address[3]),
        .I2(address[2]),
        .I3(o_rd_data[7]),
        .I4(\wr_data_reg[3][7] [7]),
        .I5(\wr_data_reg[2][7]_0 ),
        .O(D[7]));
  LUT6 #(
    .INIT(64'hFFFFFFFF05010400)) 
    \DataOut_stall[8]_i_1 
       (.I0(\cnt_fifo_reg[5] ),
        .I1(address[3]),
        .I2(address[2]),
        .I3(o_rd_data[8]),
        .I4(\wr_data_reg[3][7] [8]),
        .I5(\wr_data_reg[2][7]_1 ),
        .O(D[8]));
  LUT6 #(
    .INIT(64'hFFFFFFFF05010400)) 
    \DataOut_stall[9]_i_1 
       (.I0(\cnt_fifo_reg[5] ),
        .I1(address[3]),
        .I2(address[2]),
        .I3(o_rd_data[9]),
        .I4(\wr_data_reg[3][7] [9]),
        .I5(\wr_data_reg[2][7]_2 ),
        .O(D[9]));
  LUT6 #(
    .INIT(64'hAAAAFBFFAAAA0800)) 
    FIFO_ReadEn_i_1
       (.I0(\FSM_onehot_fifo_wr_stm_reg[6] ),
        .I1(FIFO_ReadEn_i_3_n_0),
        .I2(\r_FIFO_COUNT_reg[5]_3 ),
        .I3(\FSM_onehot_fifo_wr_stm_reg[6]_0 ),
        .I4(\FSM_onehot_fifo_wr_stm_reg[7] ),
        .I5(FIFO_ReadEn),
        .O(FIFO_ReadEn_reg));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    FIFO_ReadEn_i_3
       (.I0(full),
        .I1(\r_FIFO_COUNT_reg[5]_0 [2]),
        .I2(\r_FIFO_COUNT_reg[5]_0 [1]),
        .I3(\r_FIFO_COUNT_reg[5]_0 [0]),
        .I4(\r_FIFO_COUNT_reg[5]_1 ),
        .I5(\r_FIFO_COUNT_reg[5]_2 ),
        .O(FIFO_ReadEn_i_3_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    FIFO_ReadEn_i_7
       (.I0(r_FIFO_COUNT_reg[5]),
        .I1(\r_WR_INDEX[4]_i_3__10_n_0 ),
        .O(full));
  LUT6 #(
    .INIT(64'hFF20FFFFFF200000)) 
    \FIFO_WR[valid]_i_1 
       (.I0(FIFO_ReadEn_i_3_n_0),
        .I1(\r_FIFO_COUNT_reg[5]_3 ),
        .I2(out),
        .I3(\FSM_onehot_fifo_wr_stm_reg[2] ),
        .I4(\FIFO_WR_reg[valid]0 ),
        .I5(\FIFO_WR_reg[valid]_0 ),
        .O(\FIFO_WR_reg[valid] ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__10_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__10_n_0,p_0_out_carry_i_3__10_n_0,p_0_out_carry_i_4__10_n_0,p_0_out_carry_i_5__13_n_0}));
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
  LUT6 #(
    .INIT(64'hAA9AAAAA55555555)) 
    p_0_out_carry_i_5__13
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(\cnt_fifo_reg[5] ),
        .I2(address[3]),
        .I3(address[2]),
        .I4(rd_en),
        .I5(wr_en_reg),
        .O(p_0_out_carry_i_5__13_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__10 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__10_n_0 ));
  LUT6 #(
    .INIT(64'hA6AAAAAAAAAAAAAA)) 
    \r_FIFO_COUNT[6]_i_1__13 
       (.I0(wr_en_reg),
        .I1(rd_en),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\r_FIFO_COUNT[6]_i_1__13_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__13_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__10_n_0 ),
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
    \r_RD_INDEX[0]_i_1__10 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1__10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__10 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__10 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__10_n_0 ));
  LUT6 #(
    .INIT(64'h0030000000200000)) 
    \r_RD_INDEX[3]_i_1__13 
       (.I0(\r_WR_INDEX[4]_i_3__10_n_0 ),
        .I1(\cnt_fifo_reg[5] ),
        .I2(address[3]),
        .I3(address[2]),
        .I4(rd_en),
        .I5(r_FIFO_COUNT_reg[5]),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__10 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h8A)) 
    \r_WR_INDEX[4]_i_1__10 
       (.I0(wr_en_reg),
        .I1(\r_WR_INDEX[4]_i_3__10_n_0 ),
        .I2(r_FIFO_COUNT_reg[5]),
        .O(r_WR_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
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
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \r_WR_INDEX[4]_i_3__10 
       (.I0(r_FIFO_COUNT_reg[0]),
        .I1(r_FIFO_COUNT_reg[6]),
        .I2(r_FIFO_COUNT_reg[4]),
        .I3(r_FIFO_COUNT_reg[3]),
        .I4(r_FIFO_COUNT_reg[1]),
        .I5(r_FIFO_COUNT_reg[2]),
        .O(\r_WR_INDEX[4]_i_3__10_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_WR_INDEX0),
        .D(\r_WR_INDEX[0]_i_1__10_n_0 ),
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
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_10
   (\r_RD_INDEX_reg[4]_0 ,
    \DataOut_last_reg[0] ,
    \DataOut_last_reg[1] ,
    \DataOut_last_reg[2] ,
    \DataOut_last_reg[3] ,
    \DataOut_last_reg[4] ,
    \DataOut_last_reg[5] ,
    \DataOut_last_reg[6] ,
    \DataOut_last_reg[7] ,
    \DataOut_last_reg[8] ,
    \DataOut_last_reg[9] ,
    \DataOut_last_reg[10] ,
    \DataOut_last_reg[11] ,
    \WDONBR_intl_reg[1] ,
    AR,
    CLK,
    rd_en,
    address,
    wr_en_reg,
    o_rd_data,
    \wr_data_reg[4][7] ,
    \wr_data_reg[6][7] ,
    p_0_in,
    Q);
  output \r_RD_INDEX_reg[4]_0 ;
  output \DataOut_last_reg[0] ;
  output \DataOut_last_reg[1] ;
  output \DataOut_last_reg[2] ;
  output \DataOut_last_reg[3] ;
  output \DataOut_last_reg[4] ;
  output \DataOut_last_reg[5] ;
  output \DataOut_last_reg[6] ;
  output \DataOut_last_reg[7] ;
  output \DataOut_last_reg[8] ;
  output \DataOut_last_reg[9] ;
  output \DataOut_last_reg[10] ;
  output \DataOut_last_reg[11] ;
  output [0:0]\WDONBR_intl_reg[1] ;
  input [0:0]AR;
  input CLK;
  input rd_en;
  input [3:0]address;
  input wr_en_reg;
  input [11:0]o_rd_data;
  input [11:0]\wr_data_reg[4][7] ;
  input [11:0]\wr_data_reg[6][7] ;
  input p_0_in;
  input [11:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire \DataOut_last_reg[0] ;
  wire \DataOut_last_reg[10] ;
  wire \DataOut_last_reg[11] ;
  wire \DataOut_last_reg[1] ;
  wire \DataOut_last_reg[2] ;
  wire \DataOut_last_reg[3] ;
  wire \DataOut_last_reg[4] ;
  wire \DataOut_last_reg[5] ;
  wire \DataOut_last_reg[6] ;
  wire \DataOut_last_reg[7] ;
  wire \DataOut_last_reg[8] ;
  wire \DataOut_last_reg[9] ;
  wire [11:0]Q;
  wire [0:0]\WDONBR_intl_reg[1] ;
  wire [3:0]address;
  wire [11:0]o_rd_data;
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
  wire p_0_out_carry_i_5__8_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__4_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__8_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__4_n_0 ;
  wire \r_RD_INDEX[1]_i_1__4_n_0 ;
  wire \r_RD_INDEX[2]_i_1__4_n_0 ;
  wire \r_RD_INDEX[3]_i_2__4_n_0 ;
  wire \r_RD_INDEX[4]_i_1__4_n_0 ;
  wire \r_RD_INDEX_reg[4]_0 ;
  wire [4:0]r_WR_INDEX;
  wire r_WR_INDEX0;
  wire \r_WR_INDEX[0]_i_1__4_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire \r_WR_INDEX[4]_i_3__4_n_0 ;
  wire [11:0]\rd_data12[5]_5 ;
  wire rd_en;
  wire [11:0]\wr_data_reg[4][7] ;
  wire [11:0]\wr_data_reg[6][7] ;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT6 #(
    .INIT(64'hCCAAFFF0CCAA00F0)) 
    \DataOut[0]_i_6 
       (.I0(\rd_data12[5]_5 [0]),
        .I1(o_rd_data[0]),
        .I2(\wr_data_reg[4][7] [0]),
        .I3(address[1]),
        .I4(address[0]),
        .I5(\wr_data_reg[6][7] [0]),
        .O(\DataOut_last_reg[0] ));
  LUT6 #(
    .INIT(64'hCCAAFFF0CCAA00F0)) 
    \DataOut[10]_i_6 
       (.I0(\rd_data12[5]_5 [10]),
        .I1(o_rd_data[10]),
        .I2(\wr_data_reg[4][7] [10]),
        .I3(address[1]),
        .I4(address[0]),
        .I5(\wr_data_reg[6][7] [10]),
        .O(\DataOut_last_reg[10] ));
  LUT6 #(
    .INIT(64'hCCAAFFF0CCAA00F0)) 
    \DataOut[11]_i_9 
       (.I0(\rd_data12[5]_5 [11]),
        .I1(o_rd_data[11]),
        .I2(\wr_data_reg[4][7] [11]),
        .I3(address[1]),
        .I4(address[0]),
        .I5(\wr_data_reg[6][7] [11]),
        .O(\DataOut_last_reg[11] ));
  LUT6 #(
    .INIT(64'hCCAAFFF0CCAA00F0)) 
    \DataOut[1]_i_6 
       (.I0(\rd_data12[5]_5 [1]),
        .I1(o_rd_data[1]),
        .I2(\wr_data_reg[4][7] [1]),
        .I3(address[1]),
        .I4(address[0]),
        .I5(\wr_data_reg[6][7] [1]),
        .O(\DataOut_last_reg[1] ));
  LUT6 #(
    .INIT(64'hCCAAFFF0CCAA00F0)) 
    \DataOut[2]_i_6 
       (.I0(\rd_data12[5]_5 [2]),
        .I1(o_rd_data[2]),
        .I2(\wr_data_reg[4][7] [2]),
        .I3(address[1]),
        .I4(address[0]),
        .I5(\wr_data_reg[6][7] [2]),
        .O(\DataOut_last_reg[2] ));
  LUT6 #(
    .INIT(64'hCCAAFFF0CCAA00F0)) 
    \DataOut[3]_i_6 
       (.I0(\rd_data12[5]_5 [3]),
        .I1(o_rd_data[3]),
        .I2(\wr_data_reg[4][7] [3]),
        .I3(address[1]),
        .I4(address[0]),
        .I5(\wr_data_reg[6][7] [3]),
        .O(\DataOut_last_reg[3] ));
  LUT6 #(
    .INIT(64'hCCAAFFF0CCAA00F0)) 
    \DataOut[4]_i_6 
       (.I0(\rd_data12[5]_5 [4]),
        .I1(o_rd_data[4]),
        .I2(\wr_data_reg[4][7] [4]),
        .I3(address[1]),
        .I4(address[0]),
        .I5(\wr_data_reg[6][7] [4]),
        .O(\DataOut_last_reg[4] ));
  LUT6 #(
    .INIT(64'hCCAAFFF0CCAA00F0)) 
    \DataOut[5]_i_6 
       (.I0(\rd_data12[5]_5 [5]),
        .I1(o_rd_data[5]),
        .I2(\wr_data_reg[4][7] [5]),
        .I3(address[1]),
        .I4(address[0]),
        .I5(\wr_data_reg[6][7] [5]),
        .O(\DataOut_last_reg[5] ));
  LUT6 #(
    .INIT(64'hCCAAFFF0CCAA00F0)) 
    \DataOut[6]_i_6 
       (.I0(\rd_data12[5]_5 [6]),
        .I1(o_rd_data[6]),
        .I2(\wr_data_reg[4][7] [6]),
        .I3(address[1]),
        .I4(address[0]),
        .I5(\wr_data_reg[6][7] [6]),
        .O(\DataOut_last_reg[6] ));
  LUT6 #(
    .INIT(64'hCCAAFFF0CCAA00F0)) 
    \DataOut[7]_i_6 
       (.I0(\rd_data12[5]_5 [7]),
        .I1(o_rd_data[7]),
        .I2(\wr_data_reg[4][7] [7]),
        .I3(address[1]),
        .I4(address[0]),
        .I5(\wr_data_reg[6][7] [7]),
        .O(\DataOut_last_reg[7] ));
  LUT6 #(
    .INIT(64'hCCAAFFF0CCAA00F0)) 
    \DataOut[8]_i_6 
       (.I0(\rd_data12[5]_5 [8]),
        .I1(o_rd_data[8]),
        .I2(\wr_data_reg[4][7] [8]),
        .I3(address[1]),
        .I4(address[0]),
        .I5(\wr_data_reg[6][7] [8]),
        .O(\DataOut_last_reg[8] ));
  LUT6 #(
    .INIT(64'hCCAAFFF0CCAA00F0)) 
    \DataOut[9]_i_6 
       (.I0(\rd_data12[5]_5 [9]),
        .I1(o_rd_data[9]),
        .I2(\wr_data_reg[4][7] [9]),
        .I3(address[1]),
        .I4(address[0]),
        .I5(\wr_data_reg[6][7] [9]),
        .O(\DataOut_last_reg[9] ));
  LUT2 #(
    .INIT(4'h2)) 
    FIFO_ReadEn_i_13
       (.I0(r_FIFO_COUNT_reg[5]),
        .I1(\r_WR_INDEX[4]_i_3__4_n_0 ),
        .O(\WDONBR_intl_reg[1] ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__4_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__4_n_0,p_0_out_carry_i_3__4_n_0,p_0_out_carry_i_4__4_n_0,p_0_out_carry_i_5__8_n_0}));
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
    .INIT(64'hAA6AAAAA55555555)) 
    p_0_out_carry_i_5__8
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(rd_en),
        .I2(address[2]),
        .I3(address[3]),
        .I4(\r_RD_INDEX_reg[4]_0 ),
        .I5(wr_en_reg),
        .O(p_0_out_carry_i_5__8_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    p_0_out_carry_i_6__0
       (.I0(address[0]),
        .I1(address[1]),
        .O(\r_RD_INDEX_reg[4]_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__4 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__4_n_0 ));
  LUT6 #(
    .INIT(64'hAAA6AAAAAAAAAAAA)) 
    \r_FIFO_COUNT[6]_i_1__8 
       (.I0(wr_en_reg),
        .I1(address[0]),
        .I2(address[1]),
        .I3(address[3]),
        .I4(address[2]),
        .I5(rd_en),
        .O(\r_FIFO_COUNT[6]_i_1__8_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__8_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__4_n_0 ),
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
        .DOA(\rd_data12[5]_5 [1:0]),
        .DOB(\rd_data12[5]_5 [3:2]),
        .DOC(\rd_data12[5]_5 [5:4]),
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
        .DOA(\rd_data12[5]_5 [7:6]),
        .DOB(\rd_data12[5]_5 [9:8]),
        .DOC(\rd_data12[5]_5 [11:10]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    \r_RD_INDEX[0]_i_1__4 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1__4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__4 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__4 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__4_n_0 ));
  LUT6 #(
    .INIT(64'h00C0000000800000)) 
    \r_RD_INDEX[3]_i_1__8 
       (.I0(\r_WR_INDEX[4]_i_3__4_n_0 ),
        .I1(rd_en),
        .I2(address[2]),
        .I3(address[3]),
        .I4(\r_RD_INDEX_reg[4]_0 ),
        .I5(r_FIFO_COUNT_reg[5]),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__4 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h8A)) 
    \r_WR_INDEX[4]_i_1__4 
       (.I0(wr_en_reg),
        .I1(\r_WR_INDEX[4]_i_3__4_n_0 ),
        .I2(r_FIFO_COUNT_reg[5]),
        .O(r_WR_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
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
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \r_WR_INDEX[4]_i_3__4 
       (.I0(r_FIFO_COUNT_reg[0]),
        .I1(r_FIFO_COUNT_reg[6]),
        .I2(r_FIFO_COUNT_reg[4]),
        .I3(r_FIFO_COUNT_reg[3]),
        .I4(r_FIFO_COUNT_reg[1]),
        .I5(r_FIFO_COUNT_reg[2]),
        .O(\r_WR_INDEX[4]_i_3__4_n_0 ));
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
   (Q,
    \r_RD_INDEX_reg[4]_0 ,
    \r_RD_INDEX_reg[4]_1 ,
    o_rd_data,
    AR,
    CLK,
    rd_en,
    address,
    wr_en_reg,
    p_0_in,
    \wr_data_reg[6][11] );
  output [0:0]Q;
  output \r_RD_INDEX_reg[4]_0 ;
  output \r_RD_INDEX_reg[4]_1 ;
  output [11:0]o_rd_data;
  input [0:0]AR;
  input CLK;
  input rd_en;
  input [3:0]address;
  input wr_en_reg;
  input p_0_in;
  input [11:0]\wr_data_reg[6][11] ;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]Q;
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
  wire p_0_out_carry_i_5__11_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__5_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__11_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__5_n_0 ;
  wire \r_RD_INDEX[1]_i_1__5_n_0 ;
  wire \r_RD_INDEX[2]_i_1__5_n_0 ;
  wire \r_RD_INDEX[3]_i_2__5_n_0 ;
  wire \r_RD_INDEX[4]_i_1__5_n_0 ;
  wire \r_RD_INDEX_reg[4]_0 ;
  wire \r_RD_INDEX_reg[4]_1 ;
  wire [4:0]r_WR_INDEX;
  wire r_WR_INDEX0;
  wire \r_WR_INDEX[0]_i_1__5_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire rd_en;
  wire [11:0]\wr_data_reg[6][11] ;
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
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__5_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__5_n_0,p_0_out_carry_i_3__5_n_0,p_0_out_carry_i_4__5_n_0,p_0_out_carry_i_5__11_n_0}));
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
       (.I0(Q),
        .I1(r_FIFO_COUNT_reg[6]),
        .O(p_0_out_carry__0_i_1__5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_2__5
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(Q),
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
  LUT6 #(
    .INIT(64'hAA6AAAAA55555555)) 
    p_0_out_carry_i_5__11
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(rd_en),
        .I2(address[2]),
        .I3(address[3]),
        .I4(\r_RD_INDEX_reg[4]_0 ),
        .I5(wr_en_reg),
        .O(p_0_out_carry_i_5__11_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    p_0_out_carry_i_6__1
       (.I0(address[1]),
        .I1(address[0]),
        .O(\r_RD_INDEX_reg[4]_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__5 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__5_n_0 ));
  LUT6 #(
    .INIT(64'hAAA6AAAAAAAAAAAA)) 
    \r_FIFO_COUNT[6]_i_1__11 
       (.I0(wr_en_reg),
        .I1(address[1]),
        .I2(address[0]),
        .I3(address[3]),
        .I4(address[2]),
        .I5(rd_en),
        .O(\r_FIFO_COUNT[6]_i_1__11_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__11_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__5_n_0 ),
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
        .Q(Q),
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
        .DIA(\wr_data_reg[6][11] [1:0]),
        .DIB(\wr_data_reg[6][11] [3:2]),
        .DIC(\wr_data_reg[6][11] [5:4]),
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
        .DIA(\wr_data_reg[6][11] [7:6]),
        .DIB(\wr_data_reg[6][11] [9:8]),
        .DIC(\wr_data_reg[6][11] [11:10]),
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
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__5 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__5 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__5_n_0 ));
  LUT6 #(
    .INIT(64'h00C0000000800000)) 
    \r_RD_INDEX[3]_i_1__11 
       (.I0(\r_RD_INDEX_reg[4]_1 ),
        .I1(rd_en),
        .I2(address[2]),
        .I3(address[3]),
        .I4(\r_RD_INDEX_reg[4]_0 ),
        .I5(Q),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__5 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h8A)) 
    \r_WR_INDEX[4]_i_1__5 
       (.I0(wr_en_reg),
        .I1(\r_RD_INDEX_reg[4]_1 ),
        .I2(Q),
        .O(r_WR_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
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
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \r_WR_INDEX[4]_i_3__5 
       (.I0(r_FIFO_COUNT_reg[0]),
        .I1(r_FIFO_COUNT_reg[6]),
        .I2(r_FIFO_COUNT_reg[4]),
        .I3(r_FIFO_COUNT_reg[3]),
        .I4(r_FIFO_COUNT_reg[1]),
        .I5(r_FIFO_COUNT_reg[2]),
        .O(\r_RD_INDEX_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_WR_INDEX0),
        .D(\r_WR_INDEX[0]_i_1__5_n_0 ),
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
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_12
   (Q,
    \r_RD_INDEX_reg[4]_0 ,
    \r_RD_INDEX_reg[4]_1 ,
    o_rd_data,
    AR,
    CLK,
    rd_en,
    address,
    wr_en_reg,
    p_0_in,
    \wr_data_reg[7][11] );
  output [0:0]Q;
  output \r_RD_INDEX_reg[4]_0 ;
  output \r_RD_INDEX_reg[4]_1 ;
  output [11:0]o_rd_data;
  input [0:0]AR;
  input CLK;
  input rd_en;
  input [3:0]address;
  input wr_en_reg;
  input p_0_in;
  input [11:0]\wr_data_reg[7][11] ;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]Q;
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
  wire p_0_out_carry_i_5__14_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__6_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__14_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__6_n_0 ;
  wire \r_RD_INDEX[1]_i_1__6_n_0 ;
  wire \r_RD_INDEX[2]_i_1__6_n_0 ;
  wire \r_RD_INDEX[3]_i_2__6_n_0 ;
  wire \r_RD_INDEX[4]_i_1__6_n_0 ;
  wire \r_RD_INDEX_reg[4]_0 ;
  wire \r_RD_INDEX_reg[4]_1 ;
  wire [4:0]r_WR_INDEX;
  wire r_WR_INDEX0;
  wire \r_WR_INDEX[0]_i_1__6_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire rd_en;
  wire [11:0]\wr_data_reg[7][11] ;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT2 #(
    .INIT(4'h7)) 
    \DataOut_stall[11]_i_3 
       (.I0(address[0]),
        .I1(address[1]),
        .O(\r_RD_INDEX_reg[4]_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__6_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__6_n_0,p_0_out_carry_i_3__6_n_0,p_0_out_carry_i_4__6_n_0,p_0_out_carry_i_5__14_n_0}));
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
       (.I0(Q),
        .I1(r_FIFO_COUNT_reg[6]),
        .O(p_0_out_carry__0_i_1__6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_2__6
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(Q),
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
  LUT6 #(
    .INIT(64'hAAAAAA6A55555555)) 
    p_0_out_carry_i_5__14
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(rd_en),
        .I2(address[2]),
        .I3(address[3]),
        .I4(\r_RD_INDEX_reg[4]_0 ),
        .I5(wr_en_reg),
        .O(p_0_out_carry_i_5__14_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__6 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__6_n_0 ));
  LUT6 #(
    .INIT(64'hAA6AAAAAAAAAAAAA)) 
    \r_FIFO_COUNT[6]_i_1__14 
       (.I0(wr_en_reg),
        .I1(address[0]),
        .I2(address[1]),
        .I3(address[3]),
        .I4(address[2]),
        .I5(rd_en),
        .O(\r_FIFO_COUNT[6]_i_1__14_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__14_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__6_n_0 ),
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
        .Q(Q),
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
        .DIA(\wr_data_reg[7][11] [1:0]),
        .DIB(\wr_data_reg[7][11] [3:2]),
        .DIC(\wr_data_reg[7][11] [5:4]),
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
        .DIA(\wr_data_reg[7][11] [7:6]),
        .DIB(\wr_data_reg[7][11] [9:8]),
        .DIC(\wr_data_reg[7][11] [11:10]),
        .DID({1'b0,1'b0}),
        .DOA(o_rd_data[7:6]),
        .DOB(o_rd_data[9:8]),
        .DOC(o_rd_data[11:10]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    \r_RD_INDEX[0]_i_1__6 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1__6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__6 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__6 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__6_n_0 ));
  LUT6 #(
    .INIT(64'h000000C000000080)) 
    \r_RD_INDEX[3]_i_1__14 
       (.I0(\r_RD_INDEX_reg[4]_1 ),
        .I1(rd_en),
        .I2(address[2]),
        .I3(address[3]),
        .I4(\r_RD_INDEX_reg[4]_0 ),
        .I5(Q),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__6 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h8A)) 
    \r_WR_INDEX[4]_i_1__6 
       (.I0(wr_en_reg),
        .I1(\r_RD_INDEX_reg[4]_1 ),
        .I2(Q),
        .O(r_WR_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
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
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \r_WR_INDEX[4]_i_3__6 
       (.I0(r_FIFO_COUNT_reg[0]),
        .I1(r_FIFO_COUNT_reg[6]),
        .I2(r_FIFO_COUNT_reg[4]),
        .I3(r_FIFO_COUNT_reg[3]),
        .I4(r_FIFO_COUNT_reg[1]),
        .I5(r_FIFO_COUNT_reg[2]),
        .O(\r_RD_INDEX_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_WR_INDEX0),
        .D(\r_WR_INDEX[0]_i_1__6_n_0 ),
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
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_13
   (\DataOut_stall_reg[0] ,
    \DataOut_last_reg[0] ,
    \DataOut_stall_reg[1] ,
    \DataOut_last_reg[1] ,
    \DataOut_stall_reg[2] ,
    \DataOut_last_reg[2] ,
    \DataOut_stall_reg[3] ,
    \DataOut_last_reg[3] ,
    \DataOut_stall_reg[4] ,
    \DataOut_last_reg[4] ,
    \DataOut_stall_reg[5] ,
    \DataOut_last_reg[5] ,
    \DataOut_stall_reg[6] ,
    \DataOut_last_reg[6] ,
    \DataOut_stall_reg[7] ,
    \DataOut_last_reg[7] ,
    \DataOut_stall_reg[8] ,
    \DataOut_last_reg[8] ,
    \DataOut_stall_reg[9] ,
    \DataOut_last_reg[9] ,
    \DataOut_stall_reg[10] ,
    \DataOut_last_reg[10] ,
    \DataOut_stall_reg[11] ,
    \DataOut_last_reg[11] ,
    \WDOTime_intl_reg[63] ,
    \FSM_onehot_fifo_wr_stm_reg[4] ,
    \r_WR_INDEX_reg[4]_0 ,
    \DIGTime_intl_reg[63] ,
    AR,
    CLK,
    \cnt_fifo_reg[5] ,
    address,
    rd_en,
    wr_en_reg,
    \cnt_fifo_reg[6] ,
    \cnt_fifo_reg[5]_0 ,
    o_rd_data,
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
    \wr_data_reg[14][7] ,
    full,
    \r_FIFO_COUNT_reg[5]_0 ,
    out,
    TestFIFO,
    \r_FIFO_COUNT_reg[5]_1 ,
    nRST,
    data3,
    p_0_in,
    Q);
  output \DataOut_stall_reg[0] ;
  output \DataOut_last_reg[0] ;
  output \DataOut_stall_reg[1] ;
  output \DataOut_last_reg[1] ;
  output \DataOut_stall_reg[2] ;
  output \DataOut_last_reg[2] ;
  output \DataOut_stall_reg[3] ;
  output \DataOut_last_reg[3] ;
  output \DataOut_stall_reg[4] ;
  output \DataOut_last_reg[4] ;
  output \DataOut_stall_reg[5] ;
  output \DataOut_last_reg[5] ;
  output \DataOut_stall_reg[6] ;
  output \DataOut_last_reg[6] ;
  output \DataOut_stall_reg[7] ;
  output \DataOut_last_reg[7] ;
  output \DataOut_stall_reg[8] ;
  output \DataOut_last_reg[8] ;
  output \DataOut_stall_reg[9] ;
  output \DataOut_last_reg[9] ;
  output \DataOut_stall_reg[10] ;
  output \DataOut_last_reg[10] ;
  output \DataOut_stall_reg[11] ;
  output \DataOut_last_reg[11] ;
  output \WDOTime_intl_reg[63] ;
  output \FSM_onehot_fifo_wr_stm_reg[4] ;
  output [0:0]\r_WR_INDEX_reg[4]_0 ;
  output \DIGTime_intl_reg[63] ;
  input [0:0]AR;
  input CLK;
  input \cnt_fifo_reg[5] ;
  input [3:0]address;
  input rd_en;
  input wr_en_reg;
  input \cnt_fifo_reg[6] ;
  input \cnt_fifo_reg[5]_0 ;
  input [11:0]o_rd_data;
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
  input [11:0]\wr_data_reg[14][7] ;
  input [3:0]full;
  input \r_FIFO_COUNT_reg[5]_0 ;
  input [1:0]out;
  input TestFIFO;
  input \r_FIFO_COUNT_reg[5]_1 ;
  input nRST;
  input [0:0]data3;
  input p_0_in;
  input [11:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire \DIGTime_intl[63]_i_2_n_0 ;
  wire \DIGTime_intl_reg[63] ;
  wire \DataOut_last_reg[0] ;
  wire \DataOut_last_reg[10] ;
  wire \DataOut_last_reg[11] ;
  wire \DataOut_last_reg[1] ;
  wire \DataOut_last_reg[2] ;
  wire \DataOut_last_reg[3] ;
  wire \DataOut_last_reg[4] ;
  wire \DataOut_last_reg[5] ;
  wire \DataOut_last_reg[6] ;
  wire \DataOut_last_reg[7] ;
  wire \DataOut_last_reg[8] ;
  wire \DataOut_last_reg[9] ;
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
  wire \FSM_onehot_fifo_wr_stm_reg[4] ;
  wire [11:0]Q;
  wire TestFIFO;
  wire \WDOTime_intl_reg[63] ;
  wire [3:0]address;
  wire \cnt_fifo_reg[5] ;
  wire \cnt_fifo_reg[5]_0 ;
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
  wire [0:0]data3;
  wire [3:0]full;
  wire nRST;
  wire [11:0]o_rd_data;
  wire [1:0]out;
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
  wire p_0_out_carry_i_5__4_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__7_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__4_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire \r_FIFO_COUNT_reg[5]_0 ;
  wire \r_FIFO_COUNT_reg[5]_1 ;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__7_n_0 ;
  wire \r_RD_INDEX[1]_i_1__7_n_0 ;
  wire \r_RD_INDEX[2]_i_1__7_n_0 ;
  wire \r_RD_INDEX[3]_i_2__7_n_0 ;
  wire \r_RD_INDEX[3]_i_3_n_0 ;
  wire \r_RD_INDEX[4]_i_1__7_n_0 ;
  wire [4:0]r_WR_INDEX;
  wire r_WR_INDEX0;
  wire \r_WR_INDEX[0]_i_1__7_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire [0:0]\r_WR_INDEX_reg[4]_0 ;
  wire [11:0]\rd_data12[8]_8 ;
  wire rd_en;
  wire [11:0]\wr_data_reg[14][7] ;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT6 #(
    .INIT(64'hBBABFFFF88A80000)) 
    \DIGTime_intl[63]_i_1 
       (.I0(out[0]),
        .I1(out[1]),
        .I2(\DIGTime_intl[63]_i_2_n_0 ),
        .I3(\r_FIFO_COUNT_reg[5]_1 ),
        .I4(nRST),
        .I5(data3),
        .O(\DIGTime_intl_reg[63] ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \DIGTime_intl[63]_i_2 
       (.I0(\WDOTime_intl_reg[63] ),
        .I1(full[0]),
        .I2(full[1]),
        .I3(full[2]),
        .I4(full[3]),
        .I5(\r_FIFO_COUNT_reg[5]_0 ),
        .O(\DIGTime_intl[63]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0C000000000A0000)) 
    \DataOut[0]_i_7 
       (.I0(\rd_data12[8]_8 [0]),
        .I1(\wr_data_reg[14][7] [0]),
        .I2(address[0]),
        .I3(address[1]),
        .I4(address[3]),
        .I5(address[2]),
        .O(\DataOut_last_reg[0] ));
  LUT6 #(
    .INIT(64'h0C000000000A0000)) 
    \DataOut[10]_i_7 
       (.I0(\rd_data12[8]_8 [10]),
        .I1(\wr_data_reg[14][7] [10]),
        .I2(address[0]),
        .I3(address[1]),
        .I4(address[3]),
        .I5(address[2]),
        .O(\DataOut_last_reg[10] ));
  LUT6 #(
    .INIT(64'h0C000000000A0000)) 
    \DataOut[11]_i_11 
       (.I0(\rd_data12[8]_8 [11]),
        .I1(\wr_data_reg[14][7] [11]),
        .I2(address[0]),
        .I3(address[1]),
        .I4(address[3]),
        .I5(address[2]),
        .O(\DataOut_last_reg[11] ));
  LUT6 #(
    .INIT(64'h0C000000000A0000)) 
    \DataOut[1]_i_7 
       (.I0(\rd_data12[8]_8 [1]),
        .I1(\wr_data_reg[14][7] [1]),
        .I2(address[0]),
        .I3(address[1]),
        .I4(address[3]),
        .I5(address[2]),
        .O(\DataOut_last_reg[1] ));
  LUT6 #(
    .INIT(64'h0C000000000A0000)) 
    \DataOut[2]_i_7 
       (.I0(\rd_data12[8]_8 [2]),
        .I1(\wr_data_reg[14][7] [2]),
        .I2(address[0]),
        .I3(address[1]),
        .I4(address[3]),
        .I5(address[2]),
        .O(\DataOut_last_reg[2] ));
  LUT6 #(
    .INIT(64'h0C000000000A0000)) 
    \DataOut[3]_i_7 
       (.I0(\rd_data12[8]_8 [3]),
        .I1(\wr_data_reg[14][7] [3]),
        .I2(address[0]),
        .I3(address[1]),
        .I4(address[3]),
        .I5(address[2]),
        .O(\DataOut_last_reg[3] ));
  LUT6 #(
    .INIT(64'h0C000000000A0000)) 
    \DataOut[4]_i_7 
       (.I0(\rd_data12[8]_8 [4]),
        .I1(\wr_data_reg[14][7] [4]),
        .I2(address[0]),
        .I3(address[1]),
        .I4(address[3]),
        .I5(address[2]),
        .O(\DataOut_last_reg[4] ));
  LUT6 #(
    .INIT(64'h0C000000000A0000)) 
    \DataOut[5]_i_7 
       (.I0(\rd_data12[8]_8 [5]),
        .I1(\wr_data_reg[14][7] [5]),
        .I2(address[0]),
        .I3(address[1]),
        .I4(address[3]),
        .I5(address[2]),
        .O(\DataOut_last_reg[5] ));
  LUT6 #(
    .INIT(64'h0C000000000A0000)) 
    \DataOut[6]_i_7 
       (.I0(\rd_data12[8]_8 [6]),
        .I1(\wr_data_reg[14][7] [6]),
        .I2(address[0]),
        .I3(address[1]),
        .I4(address[3]),
        .I5(address[2]),
        .O(\DataOut_last_reg[6] ));
  LUT6 #(
    .INIT(64'h0C000000000A0000)) 
    \DataOut[7]_i_7 
       (.I0(\rd_data12[8]_8 [7]),
        .I1(\wr_data_reg[14][7] [7]),
        .I2(address[0]),
        .I3(address[1]),
        .I4(address[3]),
        .I5(address[2]),
        .O(\DataOut_last_reg[7] ));
  LUT6 #(
    .INIT(64'h0C000000000A0000)) 
    \DataOut[8]_i_7 
       (.I0(\rd_data12[8]_8 [8]),
        .I1(\wr_data_reg[14][7] [8]),
        .I2(address[0]),
        .I3(address[1]),
        .I4(address[3]),
        .I5(address[2]),
        .O(\DataOut_last_reg[8] ));
  LUT6 #(
    .INIT(64'h0C000000000A0000)) 
    \DataOut[9]_i_7 
       (.I0(\rd_data12[8]_8 [9]),
        .I1(\wr_data_reg[14][7] [9]),
        .I2(address[0]),
        .I3(address[1]),
        .I4(address[3]),
        .I5(address[2]),
        .O(\DataOut_last_reg[9] ));
  LUT6 #(
    .INIT(64'hBEAEBAAABAAABAAA)) 
    \DataOut_stall[0]_i_3 
       (.I0(\DataOut_last_reg[0] ),
        .I1(address[3]),
        .I2(address[2]),
        .I3(\cnt_fifo_reg[6] ),
        .I4(\cnt_fifo_reg[5]_0 ),
        .I5(o_rd_data[0]),
        .O(\DataOut_stall_reg[0] ));
  LUT6 #(
    .INIT(64'hBEAEBAAABAAABAAA)) 
    \DataOut_stall[10]_i_3 
       (.I0(\DataOut_last_reg[10] ),
        .I1(address[3]),
        .I2(address[2]),
        .I3(\cnt_fifo_reg[6]_9 ),
        .I4(\cnt_fifo_reg[5]_0 ),
        .I5(o_rd_data[10]),
        .O(\DataOut_stall_reg[10] ));
  LUT6 #(
    .INIT(64'hBEAEBAAABAAABAAA)) 
    \DataOut_stall[11]_i_5 
       (.I0(\DataOut_last_reg[11] ),
        .I1(address[3]),
        .I2(address[2]),
        .I3(\cnt_fifo_reg[6]_10 ),
        .I4(\cnt_fifo_reg[5]_0 ),
        .I5(o_rd_data[11]),
        .O(\DataOut_stall_reg[11] ));
  LUT6 #(
    .INIT(64'hBEAEBAAABAAABAAA)) 
    \DataOut_stall[1]_i_3 
       (.I0(\DataOut_last_reg[1] ),
        .I1(address[3]),
        .I2(address[2]),
        .I3(\cnt_fifo_reg[6]_0 ),
        .I4(\cnt_fifo_reg[5]_0 ),
        .I5(o_rd_data[1]),
        .O(\DataOut_stall_reg[1] ));
  LUT6 #(
    .INIT(64'hBEAEBAAABAAABAAA)) 
    \DataOut_stall[2]_i_3 
       (.I0(\DataOut_last_reg[2] ),
        .I1(address[3]),
        .I2(address[2]),
        .I3(\cnt_fifo_reg[6]_1 ),
        .I4(\cnt_fifo_reg[5]_0 ),
        .I5(o_rd_data[2]),
        .O(\DataOut_stall_reg[2] ));
  LUT6 #(
    .INIT(64'hBEAEBAAABAAABAAA)) 
    \DataOut_stall[3]_i_3 
       (.I0(\DataOut_last_reg[3] ),
        .I1(address[3]),
        .I2(address[2]),
        .I3(\cnt_fifo_reg[6]_2 ),
        .I4(\cnt_fifo_reg[5]_0 ),
        .I5(o_rd_data[3]),
        .O(\DataOut_stall_reg[3] ));
  LUT6 #(
    .INIT(64'hBEAEBAAABAAABAAA)) 
    \DataOut_stall[4]_i_3 
       (.I0(\DataOut_last_reg[4] ),
        .I1(address[3]),
        .I2(address[2]),
        .I3(\cnt_fifo_reg[6]_3 ),
        .I4(\cnt_fifo_reg[5]_0 ),
        .I5(o_rd_data[4]),
        .O(\DataOut_stall_reg[4] ));
  LUT6 #(
    .INIT(64'hBEAEBAAABAAABAAA)) 
    \DataOut_stall[5]_i_3 
       (.I0(\DataOut_last_reg[5] ),
        .I1(address[3]),
        .I2(address[2]),
        .I3(\cnt_fifo_reg[6]_4 ),
        .I4(\cnt_fifo_reg[5]_0 ),
        .I5(o_rd_data[5]),
        .O(\DataOut_stall_reg[5] ));
  LUT6 #(
    .INIT(64'hBEAEBAAABAAABAAA)) 
    \DataOut_stall[6]_i_3 
       (.I0(\DataOut_last_reg[6] ),
        .I1(address[3]),
        .I2(address[2]),
        .I3(\cnt_fifo_reg[6]_5 ),
        .I4(\cnt_fifo_reg[5]_0 ),
        .I5(o_rd_data[6]),
        .O(\DataOut_stall_reg[6] ));
  LUT6 #(
    .INIT(64'hBEAEBAAABAAABAAA)) 
    \DataOut_stall[7]_i_3 
       (.I0(\DataOut_last_reg[7] ),
        .I1(address[3]),
        .I2(address[2]),
        .I3(\cnt_fifo_reg[6]_6 ),
        .I4(\cnt_fifo_reg[5]_0 ),
        .I5(o_rd_data[7]),
        .O(\DataOut_stall_reg[7] ));
  LUT6 #(
    .INIT(64'hBEAEBAAABAAABAAA)) 
    \DataOut_stall[8]_i_3 
       (.I0(\DataOut_last_reg[8] ),
        .I1(address[3]),
        .I2(address[2]),
        .I3(\cnt_fifo_reg[6]_7 ),
        .I4(\cnt_fifo_reg[5]_0 ),
        .I5(o_rd_data[8]),
        .O(\DataOut_stall_reg[8] ));
  LUT6 #(
    .INIT(64'hBEAEBAAABAAABAAA)) 
    \DataOut_stall[9]_i_3 
       (.I0(\DataOut_last_reg[9] ),
        .I1(address[3]),
        .I2(address[2]),
        .I3(\cnt_fifo_reg[6]_8 ),
        .I4(\cnt_fifo_reg[5]_0 ),
        .I5(o_rd_data[9]),
        .O(\DataOut_stall_reg[9] ));
  LUT4 #(
    .INIT(16'h8000)) 
    \FSM_onehot_fifo_wr_stm[4]_i_2 
       (.I0(\r_WR_INDEX_reg[4]_0 ),
        .I1(full[0]),
        .I2(full[1]),
        .I3(full[2]),
        .O(\FSM_onehot_fifo_wr_stm_reg[4] ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    \WDOTime_intl[63]_i_3 
       (.I0(out[0]),
        .I1(TestFIFO),
        .I2(\r_RD_INDEX[3]_i_3_n_0 ),
        .I3(r_FIFO_COUNT_reg[5]),
        .O(\WDOTime_intl_reg[63] ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__7_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__7_n_0,p_0_out_carry_i_3__7_n_0,p_0_out_carry_i_4__7_n_0,p_0_out_carry_i_5__4_n_0}));
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
    p_0_out_carry_i_5__4
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(\cnt_fifo_reg[5] ),
        .I2(address[3]),
        .I3(address[2]),
        .I4(rd_en),
        .I5(wr_en_reg),
        .O(p_0_out_carry_i_5__4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__7 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__7_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAA6AA)) 
    \r_FIFO_COUNT[6]_i_1__4 
       (.I0(wr_en_reg),
        .I1(rd_en),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\r_FIFO_COUNT[6]_i_1__4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__4_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__7_n_0 ),
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
        .DOA(\rd_data12[8]_8 [1:0]),
        .DOB(\rd_data12[8]_8 [3:2]),
        .DOC(\rd_data12[8]_8 [5:4]),
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
        .DOA(\rd_data12[8]_8 [7:6]),
        .DOB(\rd_data12[8]_8 [9:8]),
        .DOC(\rd_data12[8]_8 [11:10]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    \r_RD_INDEX[0]_i_1__7 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1__7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__7 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__7 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__7_n_0 ));
  LUT6 #(
    .INIT(64'h0030000000200000)) 
    \r_RD_INDEX[3]_i_1__4 
       (.I0(\r_RD_INDEX[3]_i_3_n_0 ),
        .I1(\cnt_fifo_reg[5] ),
        .I2(address[3]),
        .I3(address[2]),
        .I4(rd_en),
        .I5(r_FIFO_COUNT_reg[5]),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__7 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \r_RD_INDEX[3]_i_3 
       (.I0(r_FIFO_COUNT_reg[0]),
        .I1(r_FIFO_COUNT_reg[6]),
        .I2(r_FIFO_COUNT_reg[4]),
        .I3(r_FIFO_COUNT_reg[3]),
        .I4(r_FIFO_COUNT_reg[1]),
        .I5(r_FIFO_COUNT_reg[2]),
        .O(\r_RD_INDEX[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
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
    \r_WR_INDEX[4]_i_1__7 
       (.I0(wr_en_reg),
        .I1(\r_WR_INDEX_reg[4]_0 ),
        .O(r_WR_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \r_WR_INDEX[4]_i_2 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[4]),
        .I2(r_WR_INDEX[0]),
        .I3(r_WR_INDEX[1]),
        .I4(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \r_WR_INDEX[4]_i_3__7 
       (.I0(r_FIFO_COUNT_reg[5]),
        .I1(\r_RD_INDEX[3]_i_3_n_0 ),
        .O(\r_WR_INDEX_reg[4]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_WR_INDEX0),
        .D(\r_WR_INDEX[0]_i_1__7_n_0 ),
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
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_14
   (\WDOTime_intl_reg[63] ,
    full,
    o_rd_data,
    AR,
    CLK,
    \cnt_fifo_reg[5] ,
    address,
    rd_en,
    wr_en_reg,
    \r_FIFO_COUNT_reg[5]_0 ,
    p_0_in,
    Q);
  output \WDOTime_intl_reg[63] ;
  output [0:0]full;
  output [11:0]o_rd_data;
  input [0:0]AR;
  input CLK;
  input \cnt_fifo_reg[5] ;
  input [3:0]address;
  input rd_en;
  input wr_en_reg;
  input [2:0]\r_FIFO_COUNT_reg[5]_0 ;
  input p_0_in;
  input [11:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire [11:0]Q;
  wire \WDOTime_intl_reg[63] ;
  wire [3:0]address;
  wire \cnt_fifo_reg[5] ;
  wire [0:0]full;
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
  wire p_0_out_carry_i_5__7_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__8_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__7_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire [2:0]\r_FIFO_COUNT_reg[5]_0 ;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__8_n_0 ;
  wire \r_RD_INDEX[1]_i_1__8_n_0 ;
  wire \r_RD_INDEX[2]_i_1__8_n_0 ;
  wire \r_RD_INDEX[3]_i_2__8_n_0 ;
  wire \r_RD_INDEX[4]_i_1__8_n_0 ;
  wire [4:0]r_WR_INDEX;
  wire r_WR_INDEX0;
  wire \r_WR_INDEX[0]_i_1__8_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire \r_WR_INDEX[4]_i_3__8_n_0 ;
  wire rd_en;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT2 #(
    .INIT(4'h2)) 
    FIFO_ReadEn_i_9
       (.I0(r_FIFO_COUNT_reg[5]),
        .I1(\r_WR_INDEX[4]_i_3__8_n_0 ),
        .O(full));
  LUT4 #(
    .INIT(16'h8000)) 
    \FSM_onehot_fifo_wr_stm[9]_i_6 
       (.I0(full),
        .I1(\r_FIFO_COUNT_reg[5]_0 [0]),
        .I2(\r_FIFO_COUNT_reg[5]_0 [1]),
        .I3(\r_FIFO_COUNT_reg[5]_0 [2]),
        .O(\WDOTime_intl_reg[63] ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__8_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__8_n_0,p_0_out_carry_i_3__8_n_0,p_0_out_carry_i_4__8_n_0,p_0_out_carry_i_5__7_n_0}));
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
    .INIT(64'hAA6AAAAA55555555)) 
    p_0_out_carry_i_5__7
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(\cnt_fifo_reg[5] ),
        .I2(address[3]),
        .I3(address[2]),
        .I4(rd_en),
        .I5(wr_en_reg),
        .O(p_0_out_carry_i_5__7_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__8 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__8_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA6AAAAAAAAAA)) 
    \r_FIFO_COUNT[6]_i_1__7 
       (.I0(wr_en_reg),
        .I1(rd_en),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\r_FIFO_COUNT[6]_i_1__7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__7_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__8_n_0 ),
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
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__8 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__8 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__8_n_0 ));
  LUT6 #(
    .INIT(64'h00C0000000800000)) 
    \r_RD_INDEX[3]_i_1__7 
       (.I0(\r_WR_INDEX[4]_i_3__8_n_0 ),
        .I1(\cnt_fifo_reg[5] ),
        .I2(address[3]),
        .I3(address[2]),
        .I4(rd_en),
        .I5(r_FIFO_COUNT_reg[5]),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__8 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h8A)) 
    \r_WR_INDEX[4]_i_1__8 
       (.I0(wr_en_reg),
        .I1(\r_WR_INDEX[4]_i_3__8_n_0 ),
        .I2(r_FIFO_COUNT_reg[5]),
        .O(r_WR_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
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
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \r_WR_INDEX[4]_i_3__8 
       (.I0(r_FIFO_COUNT_reg[0]),
        .I1(r_FIFO_COUNT_reg[6]),
        .I2(r_FIFO_COUNT_reg[4]),
        .I3(r_FIFO_COUNT_reg[3]),
        .I4(r_FIFO_COUNT_reg[1]),
        .I5(r_FIFO_COUNT_reg[2]),
        .O(\r_WR_INDEX[4]_i_3__8_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_WR_INDEX0),
        .D(\r_WR_INDEX[0]_i_1__8_n_0 ),
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
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_2
   (Q,
    \r_RD_INDEX_reg[4]_0 ,
    \WDONBR_intl_reg[1] ,
    full,
    o_rd_data,
    AR,
    CLK,
    \cnt_fifo_reg[5] ,
    address,
    rd_en,
    wr_en_reg,
    \r_FIFO_COUNT_reg[5]_0 ,
    \FSM_onehot_fifo_wr_stm_reg[6] ,
    p_0_in,
    \wr_data_reg[12][11] );
  output [0:0]Q;
  output \r_RD_INDEX_reg[4]_0 ;
  output \WDONBR_intl_reg[1] ;
  output [0:0]full;
  output [11:0]o_rd_data;
  input [0:0]AR;
  input CLK;
  input \cnt_fifo_reg[5] ;
  input [3:0]address;
  input rd_en;
  input wr_en_reg;
  input [3:0]\r_FIFO_COUNT_reg[5]_0 ;
  input \FSM_onehot_fifo_wr_stm_reg[6] ;
  input p_0_in;
  input [11:0]\wr_data_reg[12][11] ;

  wire [0:0]AR;
  wire CLK;
  wire \FSM_onehot_fifo_wr_stm_reg[6] ;
  wire [0:0]Q;
  wire \WDONBR_intl_reg[1] ;
  wire [3:0]address;
  wire \cnt_fifo_reg[5] ;
  wire [0:0]full;
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
  wire p_0_out_carry_i_5__3_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__11_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__3_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire [3:0]\r_FIFO_COUNT_reg[5]_0 ;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__11_n_0 ;
  wire \r_RD_INDEX[1]_i_1__11_n_0 ;
  wire \r_RD_INDEX[2]_i_1__11_n_0 ;
  wire \r_RD_INDEX[3]_i_2__11_n_0 ;
  wire \r_RD_INDEX[4]_i_1__11_n_0 ;
  wire \r_RD_INDEX_reg[4]_0 ;
  wire [4:0]r_WR_INDEX;
  wire r_WR_INDEX0;
  wire \r_WR_INDEX[0]_i_1__11_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire rd_en;
  wire [11:0]\wr_data_reg[12][11] ;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT2 #(
    .INIT(4'h2)) 
    \FSM_onehot_fifo_wr_stm[9]_i_8 
       (.I0(Q),
        .I1(\r_RD_INDEX_reg[4]_0 ),
        .O(full));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \WDOTime_intl[31]_i_3 
       (.I0(full),
        .I1(\r_FIFO_COUNT_reg[5]_0 [3]),
        .I2(\r_FIFO_COUNT_reg[5]_0 [2]),
        .I3(\r_FIFO_COUNT_reg[5]_0 [1]),
        .I4(\r_FIFO_COUNT_reg[5]_0 [0]),
        .I5(\FSM_onehot_fifo_wr_stm_reg[6] ),
        .O(\WDONBR_intl_reg[1] ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__11_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__11_n_0,p_0_out_carry_i_3__11_n_0,p_0_out_carry_i_4__11_n_0,p_0_out_carry_i_5__3_n_0}));
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
       (.I0(Q),
        .I1(r_FIFO_COUNT_reg[6]),
        .O(p_0_out_carry__0_i_1__11_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_2__11
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(Q),
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
    p_0_out_carry_i_5__3
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(\cnt_fifo_reg[5] ),
        .I2(address[2]),
        .I3(address[3]),
        .I4(rd_en),
        .I5(wr_en_reg),
        .O(p_0_out_carry_i_5__3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__11 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__11_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAA6AAA)) 
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
        .D(\r_FIFO_COUNT[0]_i_1__11_n_0 ),
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
        .Q(Q),
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
        .DIA(\wr_data_reg[12][11] [1:0]),
        .DIB(\wr_data_reg[12][11] [3:2]),
        .DIC(\wr_data_reg[12][11] [5:4]),
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
        .DIA(\wr_data_reg[12][11] [7:6]),
        .DIB(\wr_data_reg[12][11] [9:8]),
        .DIC(\wr_data_reg[12][11] [11:10]),
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
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__11 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__11 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__11_n_0 ));
  LUT6 #(
    .INIT(64'h3000000020000000)) 
    \r_RD_INDEX[3]_i_1__3 
       (.I0(\r_RD_INDEX_reg[4]_0 ),
        .I1(\cnt_fifo_reg[5] ),
        .I2(address[2]),
        .I3(address[3]),
        .I4(rd_en),
        .I5(Q),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__11 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h8A)) 
    \r_WR_INDEX[4]_i_1__11 
       (.I0(wr_en_reg),
        .I1(\r_RD_INDEX_reg[4]_0 ),
        .I2(Q),
        .O(r_WR_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
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
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \r_WR_INDEX[4]_i_3__11 
       (.I0(r_FIFO_COUNT_reg[0]),
        .I1(r_FIFO_COUNT_reg[6]),
        .I2(r_FIFO_COUNT_reg[4]),
        .I3(r_FIFO_COUNT_reg[3]),
        .I4(r_FIFO_COUNT_reg[1]),
        .I5(r_FIFO_COUNT_reg[2]),
        .O(\r_RD_INDEX_reg[4]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_WR_INDEX0),
        .D(\r_WR_INDEX[0]_i_1__11_n_0 ),
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
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_3
   (Q,
    D,
    \FSM_onehot_fifo_wr_stm_reg[7] ,
    WDOTime_intl0,
    \DataOut_stall_reg[0] ,
    \DataOut_stall_reg[1] ,
    \DataOut_stall_reg[2] ,
    \DataOut_stall_reg[3] ,
    \DataOut_stall_reg[4] ,
    \DataOut_stall_reg[5] ,
    \DataOut_stall_reg[6] ,
    \DataOut_stall_reg[7] ,
    \DataOut_stall_reg[8] ,
    \DataOut_stall_reg[9] ,
    \DataOut_stall_reg[10] ,
    \DataOut_stall_reg[11] ,
    \r_RD_INDEX_reg[4]_0 ,
    FIFO_ReadEn_reg,
    AR,
    CLK,
    address,
    \cnt_fifo_reg[5] ,
    rd_en,
    wr_en_reg,
    \r_FIFO_COUNT_reg[5]_0 ,
    \r_FIFO_COUNT_reg[5]_1 ,
    out,
    TestFIFO,
    \r_FIFO_COUNT_reg[5]_2 ,
    \FSM_onehot_fifo_wr_stm_reg[6] ,
    nRST,
    o_rd_data,
    \r_FIFO_COUNT_reg[0]_0 ,
    \r_FIFO_COUNT_reg[5]_3 ,
    \r_FIFO_COUNT_reg[5]_4 ,
    \r_FIFO_COUNT_reg[0]_1 ,
    \r_FIFO_COUNT_reg[0]_2 ,
    \r_FIFO_COUNT_reg[5]_5 ,
    p_0_in,
    \wr_data_reg[13][11] );
  output [0:0]Q;
  output [0:0]D;
  output \FSM_onehot_fifo_wr_stm_reg[7] ;
  output WDOTime_intl0;
  output \DataOut_stall_reg[0] ;
  output \DataOut_stall_reg[1] ;
  output \DataOut_stall_reg[2] ;
  output \DataOut_stall_reg[3] ;
  output \DataOut_stall_reg[4] ;
  output \DataOut_stall_reg[5] ;
  output \DataOut_stall_reg[6] ;
  output \DataOut_stall_reg[7] ;
  output \DataOut_stall_reg[8] ;
  output \DataOut_stall_reg[9] ;
  output \DataOut_stall_reg[10] ;
  output \DataOut_stall_reg[11] ;
  output \r_RD_INDEX_reg[4]_0 ;
  output FIFO_ReadEn_reg;
  input [0:0]AR;
  input CLK;
  input [3:0]address;
  input \cnt_fifo_reg[5] ;
  input rd_en;
  input wr_en_reg;
  input \r_FIFO_COUNT_reg[5]_0 ;
  input [0:0]\r_FIFO_COUNT_reg[5]_1 ;
  input [1:0]out;
  input TestFIFO;
  input \r_FIFO_COUNT_reg[5]_2 ;
  input \FSM_onehot_fifo_wr_stm_reg[6] ;
  input nRST;
  input [11:0]o_rd_data;
  input \r_FIFO_COUNT_reg[0]_0 ;
  input [0:0]\r_FIFO_COUNT_reg[5]_3 ;
  input [0:0]\r_FIFO_COUNT_reg[5]_4 ;
  input \r_FIFO_COUNT_reg[0]_1 ;
  input \r_FIFO_COUNT_reg[0]_2 ;
  input [0:0]\r_FIFO_COUNT_reg[5]_5 ;
  input p_0_in;
  input [11:0]\wr_data_reg[13][11] ;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]D;
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
  wire FIFO_ReadEn_reg;
  wire \FSM_onehot_fifo_wr_stm_reg[6] ;
  wire \FSM_onehot_fifo_wr_stm_reg[7] ;
  wire [0:0]Q;
  wire TestFIFO;
  wire WDOTime_intl0;
  wire [3:0]address;
  wire \cnt_fifo_reg[5] ;
  wire nRST;
  wire [11:0]o_rd_data;
  wire [1:0]out;
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
  wire p_0_out_carry_i_5__6_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__12_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__6_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire \r_FIFO_COUNT_reg[0]_0 ;
  wire \r_FIFO_COUNT_reg[0]_1 ;
  wire \r_FIFO_COUNT_reg[0]_2 ;
  wire \r_FIFO_COUNT_reg[5]_0 ;
  wire [0:0]\r_FIFO_COUNT_reg[5]_1 ;
  wire \r_FIFO_COUNT_reg[5]_2 ;
  wire [0:0]\r_FIFO_COUNT_reg[5]_3 ;
  wire [0:0]\r_FIFO_COUNT_reg[5]_4 ;
  wire [0:0]\r_FIFO_COUNT_reg[5]_5 ;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__12_n_0 ;
  wire \r_RD_INDEX[1]_i_1__12_n_0 ;
  wire \r_RD_INDEX[2]_i_1__12_n_0 ;
  wire \r_RD_INDEX[3]_i_2__12_n_0 ;
  wire \r_RD_INDEX[4]_i_1__12_n_0 ;
  wire \r_RD_INDEX_reg[4]_0 ;
  wire [4:0]r_WR_INDEX;
  wire r_WR_INDEX0;
  wire \r_WR_INDEX[0]_i_1__12_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire [11:0]\rd_data12[13]_13 ;
  wire rd_en;
  wire [11:0]\wr_data_reg[13][11] ;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT6 #(
    .INIT(64'h00000C00A0000000)) 
    \DataOut_stall[0]_i_5 
       (.I0(\rd_data12[13]_13 [0]),
        .I1(o_rd_data[0]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[0]),
        .I5(address[1]),
        .O(\DataOut_stall_reg[0] ));
  LUT6 #(
    .INIT(64'h00000C00A0000000)) 
    \DataOut_stall[10]_i_5 
       (.I0(\rd_data12[13]_13 [10]),
        .I1(o_rd_data[10]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[0]),
        .I5(address[1]),
        .O(\DataOut_stall_reg[10] ));
  LUT6 #(
    .INIT(64'h00000C00A0000000)) 
    \DataOut_stall[11]_i_7 
       (.I0(\rd_data12[13]_13 [11]),
        .I1(o_rd_data[11]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[0]),
        .I5(address[1]),
        .O(\DataOut_stall_reg[11] ));
  LUT6 #(
    .INIT(64'h00000C00A0000000)) 
    \DataOut_stall[1]_i_5 
       (.I0(\rd_data12[13]_13 [1]),
        .I1(o_rd_data[1]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[0]),
        .I5(address[1]),
        .O(\DataOut_stall_reg[1] ));
  LUT6 #(
    .INIT(64'h00000C00A0000000)) 
    \DataOut_stall[2]_i_5 
       (.I0(\rd_data12[13]_13 [2]),
        .I1(o_rd_data[2]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[0]),
        .I5(address[1]),
        .O(\DataOut_stall_reg[2] ));
  LUT6 #(
    .INIT(64'h00000C00A0000000)) 
    \DataOut_stall[3]_i_5 
       (.I0(\rd_data12[13]_13 [3]),
        .I1(o_rd_data[3]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[0]),
        .I5(address[1]),
        .O(\DataOut_stall_reg[3] ));
  LUT6 #(
    .INIT(64'h00000C00A0000000)) 
    \DataOut_stall[4]_i_5 
       (.I0(\rd_data12[13]_13 [4]),
        .I1(o_rd_data[4]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[0]),
        .I5(address[1]),
        .O(\DataOut_stall_reg[4] ));
  LUT6 #(
    .INIT(64'h00000C00A0000000)) 
    \DataOut_stall[5]_i_5 
       (.I0(\rd_data12[13]_13 [5]),
        .I1(o_rd_data[5]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[0]),
        .I5(address[1]),
        .O(\DataOut_stall_reg[5] ));
  LUT6 #(
    .INIT(64'h00000C00A0000000)) 
    \DataOut_stall[6]_i_5 
       (.I0(\rd_data12[13]_13 [6]),
        .I1(o_rd_data[6]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[0]),
        .I5(address[1]),
        .O(\DataOut_stall_reg[6] ));
  LUT6 #(
    .INIT(64'h00000C00A0000000)) 
    \DataOut_stall[7]_i_5 
       (.I0(\rd_data12[13]_13 [7]),
        .I1(o_rd_data[7]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[0]),
        .I5(address[1]),
        .O(\DataOut_stall_reg[7] ));
  LUT6 #(
    .INIT(64'h00000C00A0000000)) 
    \DataOut_stall[8]_i_5 
       (.I0(\rd_data12[13]_13 [8]),
        .I1(o_rd_data[8]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[0]),
        .I5(address[1]),
        .O(\DataOut_stall_reg[8] ));
  LUT6 #(
    .INIT(64'h00000C00A0000000)) 
    \DataOut_stall[9]_i_5 
       (.I0(\rd_data12[13]_13 [9]),
        .I1(o_rd_data[9]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[0]),
        .I5(address[1]),
        .O(\DataOut_stall_reg[9] ));
  LUT4 #(
    .INIT(16'h0400)) 
    FIFO_ReadEn_i_10
       (.I0(\r_RD_INDEX_reg[4]_0 ),
        .I1(Q),
        .I2(\r_FIFO_COUNT_reg[0]_0 ),
        .I3(\r_FIFO_COUNT_reg[5]_3 ),
        .O(FIFO_ReadEn_reg));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \FSM_onehot_fifo_wr_stm[7]_i_1 
       (.I0(\FSM_onehot_fifo_wr_stm_reg[7] ),
        .I1(\r_FIFO_COUNT_reg[5]_0 ),
        .I2(\r_FIFO_COUNT_reg[5]_1 ),
        .I3(out[0]),
        .I4(TestFIFO),
        .I5(\r_FIFO_COUNT_reg[5]_2 ),
        .O(D));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \FSM_onehot_fifo_wr_stm[9]_i_7 
       (.I0(Q),
        .I1(\r_RD_INDEX_reg[4]_0 ),
        .I2(\r_FIFO_COUNT_reg[5]_4 ),
        .I3(\r_FIFO_COUNT_reg[0]_1 ),
        .I4(\r_FIFO_COUNT_reg[0]_2 ),
        .I5(\r_FIFO_COUNT_reg[5]_5 ),
        .O(\FSM_onehot_fifo_wr_stm_reg[7] ));
  LUT6 #(
    .INIT(64'hAAAAEAAA00000000)) 
    \WDOTime_intl[63]_i_2 
       (.I0(out[1]),
        .I1(\FSM_onehot_fifo_wr_stm_reg[7] ),
        .I2(\r_FIFO_COUNT_reg[5]_0 ),
        .I3(\FSM_onehot_fifo_wr_stm_reg[6] ),
        .I4(\r_FIFO_COUNT_reg[5]_2 ),
        .I5(nRST),
        .O(WDOTime_intl0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__12_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__12_n_0,p_0_out_carry_i_3__12_n_0,p_0_out_carry_i_4__12_n_0,p_0_out_carry_i_5__6_n_0}));
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
       (.I0(Q),
        .I1(r_FIFO_COUNT_reg[6]),
        .O(p_0_out_carry__0_i_1__12_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_2__12
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(Q),
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
    .INIT(64'h6AAAAAAA55555555)) 
    p_0_out_carry_i_5__6
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(address[2]),
        .I2(address[3]),
        .I3(\cnt_fifo_reg[5] ),
        .I4(rd_en),
        .I5(wr_en_reg),
        .O(p_0_out_carry_i_5__6_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__12 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__12_n_0 ));
  LUT6 #(
    .INIT(64'hA6AAAAAAAAAAAAAA)) 
    \r_FIFO_COUNT[6]_i_1__6 
       (.I0(wr_en_reg),
        .I1(rd_en),
        .I2(address[1]),
        .I3(address[0]),
        .I4(address[3]),
        .I5(address[2]),
        .O(\r_FIFO_COUNT[6]_i_1__6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__6_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__12_n_0 ),
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
        .Q(Q),
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
        .DIA(\wr_data_reg[13][11] [1:0]),
        .DIB(\wr_data_reg[13][11] [3:2]),
        .DIC(\wr_data_reg[13][11] [5:4]),
        .DID({1'b0,1'b0}),
        .DOA(\rd_data12[13]_13 [1:0]),
        .DOB(\rd_data12[13]_13 [3:2]),
        .DOC(\rd_data12[13]_13 [5:4]),
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
        .DIA(\wr_data_reg[13][11] [7:6]),
        .DIB(\wr_data_reg[13][11] [9:8]),
        .DIC(\wr_data_reg[13][11] [11:10]),
        .DID({1'b0,1'b0}),
        .DOA(\rd_data12[13]_13 [7:6]),
        .DOB(\rd_data12[13]_13 [9:8]),
        .DOC(\rd_data12[13]_13 [11:10]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    \r_RD_INDEX[0]_i_1__12 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1__12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__12 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__12 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__12_n_0 ));
  LUT6 #(
    .INIT(64'hC000000080000000)) 
    \r_RD_INDEX[3]_i_1__6 
       (.I0(\r_RD_INDEX_reg[4]_0 ),
        .I1(address[2]),
        .I2(address[3]),
        .I3(\cnt_fifo_reg[5] ),
        .I4(rd_en),
        .I5(Q),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__12 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h8A)) 
    \r_WR_INDEX[4]_i_1__12 
       (.I0(wr_en_reg),
        .I1(\r_RD_INDEX_reg[4]_0 ),
        .I2(Q),
        .O(r_WR_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
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
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \r_WR_INDEX[4]_i_3__12 
       (.I0(r_FIFO_COUNT_reg[0]),
        .I1(r_FIFO_COUNT_reg[6]),
        .I2(r_FIFO_COUNT_reg[4]),
        .I3(r_FIFO_COUNT_reg[3]),
        .I4(r_FIFO_COUNT_reg[1]),
        .I5(r_FIFO_COUNT_reg[2]),
        .O(\r_RD_INDEX_reg[4]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_WR_INDEX0),
        .D(\r_WR_INDEX[0]_i_1__12_n_0 ),
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
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_4
   (Q,
    \FSM_onehot_fifo_wr_stm_reg[0] ,
    \r_RD_INDEX_reg[4]_0 ,
    D,
    p_0_in,
    o_rd_data,
    AR,
    CLK,
    address,
    \cnt_fifo_reg[6] ,
    rd_en,
    wr_en_reg,
    \r_FIFO_COUNT_reg[5]_0 ,
    \r_FIFO_COUNT_reg[0]_0 ,
    full,
    \FIFO_RD_reg[busy] ,
    \r_FIFO_COUNT_reg[5]_1 ,
    \r_FIFO_COUNT_reg[5]_2 ,
    out,
    PRECvalid,
    nRST,
    \wr_data_reg[14][11] );
  output [0:0]Q;
  output \FSM_onehot_fifo_wr_stm_reg[0] ;
  output \r_RD_INDEX_reg[4]_0 ;
  output [1:0]D;
  output p_0_in;
  output [11:0]o_rd_data;
  input [0:0]AR;
  input CLK;
  input [3:0]address;
  input \cnt_fifo_reg[6] ;
  input rd_en;
  input wr_en_reg;
  input [0:0]\r_FIFO_COUNT_reg[5]_0 ;
  input \r_FIFO_COUNT_reg[0]_0 ;
  input [1:0]full;
  input \FIFO_RD_reg[busy] ;
  input \r_FIFO_COUNT_reg[5]_1 ;
  input \r_FIFO_COUNT_reg[5]_2 ;
  input [2:0]out;
  input PRECvalid;
  input nRST;
  input [11:0]\wr_data_reg[14][11] ;

  wire [0:0]AR;
  wire CLK;
  wire [1:0]D;
  wire \FIFO_RD_reg[busy] ;
  wire \FSM_onehot_fifo_wr_stm_reg[0] ;
  wire PRECvalid;
  wire [0:0]Q;
  wire [3:0]address;
  wire \cnt_fifo_reg[6] ;
  wire [1:0]full;
  wire nRST;
  wire [11:0]o_rd_data;
  wire [2:0]out;
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
  wire p_0_out_carry_i_5__9_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__13_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__9_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire \r_FIFO_COUNT_reg[0]_0 ;
  wire [0:0]\r_FIFO_COUNT_reg[5]_0 ;
  wire \r_FIFO_COUNT_reg[5]_1 ;
  wire \r_FIFO_COUNT_reg[5]_2 ;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__13_n_0 ;
  wire \r_RD_INDEX[1]_i_1__13_n_0 ;
  wire \r_RD_INDEX[2]_i_1__13_n_0 ;
  wire \r_RD_INDEX[3]_i_2__13_n_0 ;
  wire \r_RD_INDEX[4]_i_1__13_n_0 ;
  wire \r_RD_INDEX_reg[4]_0 ;
  wire [4:0]r_WR_INDEX;
  wire r_WR_INDEX0;
  wire \r_WR_INDEX[0]_i_1__13_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire rd_en;
  wire [11:0]\wr_data_reg[14][11] ;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT5 #(
    .INIT(32'hFFBFAAAA)) 
    \FSM_onehot_fifo_wr_stm[0]_i_1 
       (.I0(\FIFO_RD_reg[busy] ),
        .I1(\FSM_onehot_fifo_wr_stm_reg[0] ),
        .I2(\r_FIFO_COUNT_reg[5]_1 ),
        .I3(\r_FIFO_COUNT_reg[5]_2 ),
        .I4(out[2]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h4444F44444444444)) 
    \FSM_onehot_fifo_wr_stm[3]_i_1 
       (.I0(PRECvalid),
        .I1(out[0]),
        .I2(\FSM_onehot_fifo_wr_stm_reg[0] ),
        .I3(\r_FIFO_COUNT_reg[5]_1 ),
        .I4(\r_FIFO_COUNT_reg[5]_2 ),
        .I5(out[1]),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h0020000000000000)) 
    \FSM_onehot_fifo_wr_stm[4]_i_3 
       (.I0(Q),
        .I1(\r_RD_INDEX_reg[4]_0 ),
        .I2(\r_FIFO_COUNT_reg[5]_0 ),
        .I3(\r_FIFO_COUNT_reg[0]_0 ),
        .I4(full[1]),
        .I5(full[0]),
        .O(\FSM_onehot_fifo_wr_stm_reg[0] ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__13_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__13_n_0,p_0_out_carry_i_3__13_n_0,p_0_out_carry_i_4__13_n_0,p_0_out_carry_i_5__9_n_0}));
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
       (.I0(Q),
        .I1(r_FIFO_COUNT_reg[6]),
        .O(p_0_out_carry__0_i_1__13_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_2__13
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(Q),
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
  LUT6 #(
    .INIT(64'h6AAAAAAA55555555)) 
    p_0_out_carry_i_5__9
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(address[2]),
        .I2(address[3]),
        .I3(\cnt_fifo_reg[6] ),
        .I4(rd_en),
        .I5(wr_en_reg),
        .O(p_0_out_carry_i_5__9_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__13 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__13_n_0 ));
  LUT6 #(
    .INIT(64'hA6AAAAAAAAAAAAAA)) 
    \r_FIFO_COUNT[6]_i_1__9 
       (.I0(wr_en_reg),
        .I1(rd_en),
        .I2(address[0]),
        .I3(address[1]),
        .I4(address[3]),
        .I5(address[2]),
        .O(\r_FIFO_COUNT[6]_i_1__9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__9_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__13_n_0 ),
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
        .Q(Q),
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
        .DIA(\wr_data_reg[14][11] [1:0]),
        .DIB(\wr_data_reg[14][11] [3:2]),
        .DIC(\wr_data_reg[14][11] [5:4]),
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
        .DIA(\wr_data_reg[14][11] [7:6]),
        .DIB(\wr_data_reg[14][11] [9:8]),
        .DIC(\wr_data_reg[14][11] [11:10]),
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
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__13 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__13 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__13_n_0 ));
  LUT6 #(
    .INIT(64'hC000000080000000)) 
    \r_RD_INDEX[3]_i_1__9 
       (.I0(\r_RD_INDEX_reg[4]_0 ),
        .I1(address[2]),
        .I2(address[3]),
        .I3(\cnt_fifo_reg[6] ),
        .I4(rd_en),
        .I5(Q),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__13 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h8A)) 
    \r_WR_INDEX[4]_i_1__13 
       (.I0(wr_en_reg),
        .I1(\r_RD_INDEX_reg[4]_0 ),
        .I2(Q),
        .O(r_WR_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
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
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \r_WR_INDEX[4]_i_3__13 
       (.I0(r_FIFO_COUNT_reg[0]),
        .I1(r_FIFO_COUNT_reg[6]),
        .I2(r_FIFO_COUNT_reg[4]),
        .I3(r_FIFO_COUNT_reg[3]),
        .I4(r_FIFO_COUNT_reg[1]),
        .I5(r_FIFO_COUNT_reg[2]),
        .O(\r_RD_INDEX_reg[4]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_WR_INDEX0),
        .D(\r_WR_INDEX[0]_i_1__13_n_0 ),
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
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_5
   (Q,
    \DataOut_last_reg[0] ,
    \DataOut_last_reg[1] ,
    \DataOut_last_reg[2] ,
    \DataOut_last_reg[3] ,
    \DataOut_last_reg[4] ,
    \DataOut_last_reg[5] ,
    \DataOut_last_reg[6] ,
    \DataOut_last_reg[7] ,
    \DataOut_last_reg[8] ,
    \DataOut_last_reg[9] ,
    \DataOut_last_reg[10] ,
    \DataOut_last_reg[11] ,
    \DataOut_stall_reg[0] ,
    \DataOut_stall_reg[1] ,
    \DataOut_stall_reg[2] ,
    \DataOut_stall_reg[3] ,
    \DataOut_stall_reg[4] ,
    \DataOut_stall_reg[5] ,
    \DataOut_stall_reg[6] ,
    \DataOut_stall_reg[7] ,
    \DataOut_stall_reg[8] ,
    \DataOut_stall_reg[9] ,
    \DataOut_stall_reg[10] ,
    \DataOut_stall_reg[11] ,
    \r_RD_INDEX_reg[4]_0 ,
    FIFO_ReadEn_reg,
    full,
    AR,
    CLK,
    rd_en,
    \cnt_fifo_reg[5] ,
    address,
    wr_en_reg,
    o_rd_data,
    \cnt_fifo_reg[7] ,
    \cnt_fifo_reg[6] ,
    \cnt_fifo_reg[7]_0 ,
    \cnt_fifo_reg[5]_0 ,
    \cnt_fifo_reg[8] ,
    \cnt_fifo_reg[6]_0 ,
    \wr_data_reg[0][7] ,
    \cnt_fifo_reg[7]_1 ,
    \cnt_fifo_reg[8]_0 ,
    \cnt_fifo_reg[6]_1 ,
    \cnt_fifo_reg[5]_1 ,
    \cnt_fifo_reg[7]_2 ,
    \cnt_fifo_reg[8]_1 ,
    \cnt_fifo_reg[6]_2 ,
    \cnt_fifo_reg[5]_2 ,
    \cnt_fifo_reg[7]_3 ,
    \cnt_fifo_reg[8]_2 ,
    \cnt_fifo_reg[6]_3 ,
    \cnt_fifo_reg[5]_3 ,
    \cnt_fifo_reg[7]_4 ,
    \cnt_fifo_reg[8]_3 ,
    \cnt_fifo_reg[6]_4 ,
    \cnt_fifo_reg[5]_4 ,
    \cnt_fifo_reg[7]_5 ,
    \cnt_fifo_reg[8]_4 ,
    \cnt_fifo_reg[6]_5 ,
    \cnt_fifo_reg[5]_5 ,
    \cnt_fifo_reg[7]_6 ,
    \cnt_fifo_reg[8]_5 ,
    \cnt_fifo_reg[6]_6 ,
    \cnt_fifo_reg[5]_6 ,
    \cnt_fifo_reg[7]_7 ,
    \cnt_fifo_reg[8]_6 ,
    \cnt_fifo_reg[6]_7 ,
    \cnt_fifo_reg[5]_7 ,
    \cnt_fifo_reg[7]_8 ,
    \cnt_fifo_reg[8]_7 ,
    \cnt_fifo_reg[6]_8 ,
    \cnt_fifo_reg[5]_8 ,
    \cnt_fifo_reg[7]_9 ,
    \cnt_fifo_reg[8]_8 ,
    \cnt_fifo_reg[6]_9 ,
    \cnt_fifo_reg[5]_9 ,
    \cnt_fifo_reg[7]_10 ,
    \cnt_fifo_reg[8]_9 ,
    \cnt_fifo_reg[6]_10 ,
    \cnt_fifo_reg[5]_10 ,
    \cnt_fifo_reg[7]_11 ,
    \cnt_fifo_reg[8]_10 ,
    \cnt_fifo_reg[6]_11 ,
    \cnt_fifo_reg[5]_11 ,
    \cnt_fifo_reg[7]_12 ,
    \cnt_fifo_reg[8]_11 ,
    \r_FIFO_COUNT_reg[0]_0 ,
    \r_FIFO_COUNT_reg[5]_0 ,
    p_0_in,
    \wr_data_reg[15][11] );
  output [0:0]Q;
  output \DataOut_last_reg[0] ;
  output \DataOut_last_reg[1] ;
  output \DataOut_last_reg[2] ;
  output \DataOut_last_reg[3] ;
  output \DataOut_last_reg[4] ;
  output \DataOut_last_reg[5] ;
  output \DataOut_last_reg[6] ;
  output \DataOut_last_reg[7] ;
  output \DataOut_last_reg[8] ;
  output \DataOut_last_reg[9] ;
  output \DataOut_last_reg[10] ;
  output \DataOut_last_reg[11] ;
  output \DataOut_stall_reg[0] ;
  output \DataOut_stall_reg[1] ;
  output \DataOut_stall_reg[2] ;
  output \DataOut_stall_reg[3] ;
  output \DataOut_stall_reg[4] ;
  output \DataOut_stall_reg[5] ;
  output \DataOut_stall_reg[6] ;
  output \DataOut_stall_reg[7] ;
  output \DataOut_stall_reg[8] ;
  output \DataOut_stall_reg[9] ;
  output \DataOut_stall_reg[10] ;
  output \DataOut_stall_reg[11] ;
  output \r_RD_INDEX_reg[4]_0 ;
  output FIFO_ReadEn_reg;
  output [0:0]full;
  input [0:0]AR;
  input CLK;
  input rd_en;
  input \cnt_fifo_reg[5] ;
  input [3:0]address;
  input wr_en_reg;
  input [11:0]o_rd_data;
  input \cnt_fifo_reg[7] ;
  input \cnt_fifo_reg[6] ;
  input \cnt_fifo_reg[7]_0 ;
  input \cnt_fifo_reg[5]_0 ;
  input \cnt_fifo_reg[8] ;
  input \cnt_fifo_reg[6]_0 ;
  input [11:0]\wr_data_reg[0][7] ;
  input \cnt_fifo_reg[7]_1 ;
  input \cnt_fifo_reg[8]_0 ;
  input \cnt_fifo_reg[6]_1 ;
  input \cnt_fifo_reg[5]_1 ;
  input \cnt_fifo_reg[7]_2 ;
  input \cnt_fifo_reg[8]_1 ;
  input \cnt_fifo_reg[6]_2 ;
  input \cnt_fifo_reg[5]_2 ;
  input \cnt_fifo_reg[7]_3 ;
  input \cnt_fifo_reg[8]_2 ;
  input \cnt_fifo_reg[6]_3 ;
  input \cnt_fifo_reg[5]_3 ;
  input \cnt_fifo_reg[7]_4 ;
  input \cnt_fifo_reg[8]_3 ;
  input \cnt_fifo_reg[6]_4 ;
  input \cnt_fifo_reg[5]_4 ;
  input \cnt_fifo_reg[7]_5 ;
  input \cnt_fifo_reg[8]_4 ;
  input \cnt_fifo_reg[6]_5 ;
  input \cnt_fifo_reg[5]_5 ;
  input \cnt_fifo_reg[7]_6 ;
  input \cnt_fifo_reg[8]_5 ;
  input \cnt_fifo_reg[6]_6 ;
  input \cnt_fifo_reg[5]_6 ;
  input \cnt_fifo_reg[7]_7 ;
  input \cnt_fifo_reg[8]_6 ;
  input \cnt_fifo_reg[6]_7 ;
  input \cnt_fifo_reg[5]_7 ;
  input \cnt_fifo_reg[7]_8 ;
  input \cnt_fifo_reg[8]_7 ;
  input \cnt_fifo_reg[6]_8 ;
  input \cnt_fifo_reg[5]_8 ;
  input \cnt_fifo_reg[7]_9 ;
  input \cnt_fifo_reg[8]_8 ;
  input \cnt_fifo_reg[6]_9 ;
  input \cnt_fifo_reg[5]_9 ;
  input \cnt_fifo_reg[7]_10 ;
  input \cnt_fifo_reg[8]_9 ;
  input \cnt_fifo_reg[6]_10 ;
  input \cnt_fifo_reg[5]_10 ;
  input \cnt_fifo_reg[7]_11 ;
  input \cnt_fifo_reg[8]_10 ;
  input \cnt_fifo_reg[6]_11 ;
  input \cnt_fifo_reg[5]_11 ;
  input \cnt_fifo_reg[7]_12 ;
  input \cnt_fifo_reg[8]_11 ;
  input \r_FIFO_COUNT_reg[0]_0 ;
  input [0:0]\r_FIFO_COUNT_reg[5]_0 ;
  input p_0_in;
  input [11:0]\wr_data_reg[15][11] ;

  wire [0:0]AR;
  wire CLK;
  wire \DataOut[0]_i_5_n_0 ;
  wire \DataOut[10]_i_5_n_0 ;
  wire \DataOut[11]_i_7_n_0 ;
  wire \DataOut[1]_i_5_n_0 ;
  wire \DataOut[2]_i_5_n_0 ;
  wire \DataOut[3]_i_5_n_0 ;
  wire \DataOut[4]_i_5_n_0 ;
  wire \DataOut[5]_i_5_n_0 ;
  wire \DataOut[6]_i_5_n_0 ;
  wire \DataOut[7]_i_5_n_0 ;
  wire \DataOut[8]_i_5_n_0 ;
  wire \DataOut[9]_i_5_n_0 ;
  wire \DataOut_last_reg[0] ;
  wire \DataOut_last_reg[10] ;
  wire \DataOut_last_reg[11] ;
  wire \DataOut_last_reg[1] ;
  wire \DataOut_last_reg[2] ;
  wire \DataOut_last_reg[3] ;
  wire \DataOut_last_reg[4] ;
  wire \DataOut_last_reg[5] ;
  wire \DataOut_last_reg[6] ;
  wire \DataOut_last_reg[7] ;
  wire \DataOut_last_reg[8] ;
  wire \DataOut_last_reg[9] ;
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
  wire FIFO_ReadEn_reg;
  wire [0:0]Q;
  wire [3:0]address;
  wire \cnt_fifo_reg[5] ;
  wire \cnt_fifo_reg[5]_0 ;
  wire \cnt_fifo_reg[5]_1 ;
  wire \cnt_fifo_reg[5]_10 ;
  wire \cnt_fifo_reg[5]_11 ;
  wire \cnt_fifo_reg[5]_2 ;
  wire \cnt_fifo_reg[5]_3 ;
  wire \cnt_fifo_reg[5]_4 ;
  wire \cnt_fifo_reg[5]_5 ;
  wire \cnt_fifo_reg[5]_6 ;
  wire \cnt_fifo_reg[5]_7 ;
  wire \cnt_fifo_reg[5]_8 ;
  wire \cnt_fifo_reg[5]_9 ;
  wire \cnt_fifo_reg[6] ;
  wire \cnt_fifo_reg[6]_0 ;
  wire \cnt_fifo_reg[6]_1 ;
  wire \cnt_fifo_reg[6]_10 ;
  wire \cnt_fifo_reg[6]_11 ;
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
  wire \cnt_fifo_reg[7]_11 ;
  wire \cnt_fifo_reg[7]_12 ;
  wire \cnt_fifo_reg[7]_2 ;
  wire \cnt_fifo_reg[7]_3 ;
  wire \cnt_fifo_reg[7]_4 ;
  wire \cnt_fifo_reg[7]_5 ;
  wire \cnt_fifo_reg[7]_6 ;
  wire \cnt_fifo_reg[7]_7 ;
  wire \cnt_fifo_reg[7]_8 ;
  wire \cnt_fifo_reg[7]_9 ;
  wire \cnt_fifo_reg[8] ;
  wire \cnt_fifo_reg[8]_0 ;
  wire \cnt_fifo_reg[8]_1 ;
  wire \cnt_fifo_reg[8]_10 ;
  wire \cnt_fifo_reg[8]_11 ;
  wire \cnt_fifo_reg[8]_2 ;
  wire \cnt_fifo_reg[8]_3 ;
  wire \cnt_fifo_reg[8]_4 ;
  wire \cnt_fifo_reg[8]_5 ;
  wire \cnt_fifo_reg[8]_6 ;
  wire \cnt_fifo_reg[8]_7 ;
  wire \cnt_fifo_reg[8]_8 ;
  wire \cnt_fifo_reg[8]_9 ;
  wire [0:0]full;
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
  wire p_0_out_carry_i_5__12_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__14_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__12_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire \r_FIFO_COUNT_reg[0]_0 ;
  wire [0:0]\r_FIFO_COUNT_reg[5]_0 ;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__14_n_0 ;
  wire \r_RD_INDEX[1]_i_1__14_n_0 ;
  wire \r_RD_INDEX[2]_i_1__14_n_0 ;
  wire \r_RD_INDEX[3]_i_2__14_n_0 ;
  wire \r_RD_INDEX[4]_i_1__14_n_0 ;
  wire \r_RD_INDEX_reg[4]_0 ;
  wire [4:0]r_WR_INDEX;
  wire r_WR_INDEX0;
  wire \r_WR_INDEX[0]_i_1__14_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire [11:0]\rd_data12[15]_15 ;
  wire rd_en;
  wire [11:0]\wr_data_reg[0][7] ;
  wire [11:0]\wr_data_reg[15][11] ;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \DataOut[0]_i_4 
       (.I0(\DataOut[0]_i_5_n_0 ),
        .I1(o_rd_data[0]),
        .I2(\cnt_fifo_reg[7] ),
        .I3(\cnt_fifo_reg[6] ),
        .I4(\cnt_fifo_reg[7]_0 ),
        .I5(\cnt_fifo_reg[5]_0 ),
        .O(\DataOut_last_reg[0] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF4F44)) 
    \DataOut[0]_i_5 
       (.I0(\cnt_fifo_reg[8] ),
        .I1(\rd_data12[15]_15 [0]),
        .I2(\cnt_fifo_reg[6]_0 ),
        .I3(\wr_data_reg[0][7] [0]),
        .I4(\cnt_fifo_reg[7]_1 ),
        .I5(\cnt_fifo_reg[8]_0 ),
        .O(\DataOut[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \DataOut[10]_i_4 
       (.I0(\DataOut[10]_i_5_n_0 ),
        .I1(o_rd_data[10]),
        .I2(\cnt_fifo_reg[7] ),
        .I3(\cnt_fifo_reg[6]_10 ),
        .I4(\cnt_fifo_reg[7]_0 ),
        .I5(\cnt_fifo_reg[5]_10 ),
        .O(\DataOut_last_reg[10] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF4F44)) 
    \DataOut[10]_i_5 
       (.I0(\cnt_fifo_reg[8] ),
        .I1(\rd_data12[15]_15 [10]),
        .I2(\cnt_fifo_reg[6]_0 ),
        .I3(\wr_data_reg[0][7] [10]),
        .I4(\cnt_fifo_reg[7]_11 ),
        .I5(\cnt_fifo_reg[8]_10 ),
        .O(\DataOut[10]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \DataOut[11]_i_4 
       (.I0(\DataOut[11]_i_7_n_0 ),
        .I1(o_rd_data[11]),
        .I2(\cnt_fifo_reg[7] ),
        .I3(\cnt_fifo_reg[6]_11 ),
        .I4(\cnt_fifo_reg[7]_0 ),
        .I5(\cnt_fifo_reg[5]_11 ),
        .O(\DataOut_last_reg[11] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF4F44)) 
    \DataOut[11]_i_7 
       (.I0(\cnt_fifo_reg[8] ),
        .I1(\rd_data12[15]_15 [11]),
        .I2(\cnt_fifo_reg[6]_0 ),
        .I3(\wr_data_reg[0][7] [11]),
        .I4(\cnt_fifo_reg[7]_12 ),
        .I5(\cnt_fifo_reg[8]_11 ),
        .O(\DataOut[11]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \DataOut[1]_i_4 
       (.I0(\DataOut[1]_i_5_n_0 ),
        .I1(o_rd_data[1]),
        .I2(\cnt_fifo_reg[7] ),
        .I3(\cnt_fifo_reg[6]_1 ),
        .I4(\cnt_fifo_reg[7]_0 ),
        .I5(\cnt_fifo_reg[5]_1 ),
        .O(\DataOut_last_reg[1] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF4F44)) 
    \DataOut[1]_i_5 
       (.I0(\cnt_fifo_reg[8] ),
        .I1(\rd_data12[15]_15 [1]),
        .I2(\cnt_fifo_reg[6]_0 ),
        .I3(\wr_data_reg[0][7] [1]),
        .I4(\cnt_fifo_reg[7]_2 ),
        .I5(\cnt_fifo_reg[8]_1 ),
        .O(\DataOut[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \DataOut[2]_i_4 
       (.I0(\DataOut[2]_i_5_n_0 ),
        .I1(o_rd_data[2]),
        .I2(\cnt_fifo_reg[7] ),
        .I3(\cnt_fifo_reg[6]_2 ),
        .I4(\cnt_fifo_reg[7]_0 ),
        .I5(\cnt_fifo_reg[5]_2 ),
        .O(\DataOut_last_reg[2] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF4F44)) 
    \DataOut[2]_i_5 
       (.I0(\cnt_fifo_reg[8] ),
        .I1(\rd_data12[15]_15 [2]),
        .I2(\cnt_fifo_reg[6]_0 ),
        .I3(\wr_data_reg[0][7] [2]),
        .I4(\cnt_fifo_reg[7]_3 ),
        .I5(\cnt_fifo_reg[8]_2 ),
        .O(\DataOut[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \DataOut[3]_i_4 
       (.I0(\DataOut[3]_i_5_n_0 ),
        .I1(o_rd_data[3]),
        .I2(\cnt_fifo_reg[7] ),
        .I3(\cnt_fifo_reg[6]_3 ),
        .I4(\cnt_fifo_reg[7]_0 ),
        .I5(\cnt_fifo_reg[5]_3 ),
        .O(\DataOut_last_reg[3] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF4F44)) 
    \DataOut[3]_i_5 
       (.I0(\cnt_fifo_reg[8] ),
        .I1(\rd_data12[15]_15 [3]),
        .I2(\cnt_fifo_reg[6]_0 ),
        .I3(\wr_data_reg[0][7] [3]),
        .I4(\cnt_fifo_reg[7]_4 ),
        .I5(\cnt_fifo_reg[8]_3 ),
        .O(\DataOut[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \DataOut[4]_i_4 
       (.I0(\DataOut[4]_i_5_n_0 ),
        .I1(o_rd_data[4]),
        .I2(\cnt_fifo_reg[7] ),
        .I3(\cnt_fifo_reg[6]_4 ),
        .I4(\cnt_fifo_reg[7]_0 ),
        .I5(\cnt_fifo_reg[5]_4 ),
        .O(\DataOut_last_reg[4] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF4F44)) 
    \DataOut[4]_i_5 
       (.I0(\cnt_fifo_reg[8] ),
        .I1(\rd_data12[15]_15 [4]),
        .I2(\cnt_fifo_reg[6]_0 ),
        .I3(\wr_data_reg[0][7] [4]),
        .I4(\cnt_fifo_reg[7]_5 ),
        .I5(\cnt_fifo_reg[8]_4 ),
        .O(\DataOut[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \DataOut[5]_i_4 
       (.I0(\DataOut[5]_i_5_n_0 ),
        .I1(o_rd_data[5]),
        .I2(\cnt_fifo_reg[7] ),
        .I3(\cnt_fifo_reg[6]_5 ),
        .I4(\cnt_fifo_reg[7]_0 ),
        .I5(\cnt_fifo_reg[5]_5 ),
        .O(\DataOut_last_reg[5] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF4F44)) 
    \DataOut[5]_i_5 
       (.I0(\cnt_fifo_reg[8] ),
        .I1(\rd_data12[15]_15 [5]),
        .I2(\cnt_fifo_reg[6]_0 ),
        .I3(\wr_data_reg[0][7] [5]),
        .I4(\cnt_fifo_reg[7]_6 ),
        .I5(\cnt_fifo_reg[8]_5 ),
        .O(\DataOut[5]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \DataOut[6]_i_4 
       (.I0(\DataOut[6]_i_5_n_0 ),
        .I1(o_rd_data[6]),
        .I2(\cnt_fifo_reg[7] ),
        .I3(\cnt_fifo_reg[6]_6 ),
        .I4(\cnt_fifo_reg[7]_0 ),
        .I5(\cnt_fifo_reg[5]_6 ),
        .O(\DataOut_last_reg[6] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF4F44)) 
    \DataOut[6]_i_5 
       (.I0(\cnt_fifo_reg[8] ),
        .I1(\rd_data12[15]_15 [6]),
        .I2(\cnt_fifo_reg[6]_0 ),
        .I3(\wr_data_reg[0][7] [6]),
        .I4(\cnt_fifo_reg[7]_7 ),
        .I5(\cnt_fifo_reg[8]_6 ),
        .O(\DataOut[6]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \DataOut[7]_i_4 
       (.I0(\DataOut[7]_i_5_n_0 ),
        .I1(o_rd_data[7]),
        .I2(\cnt_fifo_reg[7] ),
        .I3(\cnt_fifo_reg[6]_7 ),
        .I4(\cnt_fifo_reg[7]_0 ),
        .I5(\cnt_fifo_reg[5]_7 ),
        .O(\DataOut_last_reg[7] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF4F44)) 
    \DataOut[7]_i_5 
       (.I0(\cnt_fifo_reg[8] ),
        .I1(\rd_data12[15]_15 [7]),
        .I2(\cnt_fifo_reg[6]_0 ),
        .I3(\wr_data_reg[0][7] [7]),
        .I4(\cnt_fifo_reg[7]_8 ),
        .I5(\cnt_fifo_reg[8]_7 ),
        .O(\DataOut[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \DataOut[8]_i_4 
       (.I0(\DataOut[8]_i_5_n_0 ),
        .I1(o_rd_data[8]),
        .I2(\cnt_fifo_reg[7] ),
        .I3(\cnt_fifo_reg[6]_8 ),
        .I4(\cnt_fifo_reg[7]_0 ),
        .I5(\cnt_fifo_reg[5]_8 ),
        .O(\DataOut_last_reg[8] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF4F44)) 
    \DataOut[8]_i_5 
       (.I0(\cnt_fifo_reg[8] ),
        .I1(\rd_data12[15]_15 [8]),
        .I2(\cnt_fifo_reg[6]_0 ),
        .I3(\wr_data_reg[0][7] [8]),
        .I4(\cnt_fifo_reg[7]_9 ),
        .I5(\cnt_fifo_reg[8]_8 ),
        .O(\DataOut[8]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \DataOut[9]_i_4 
       (.I0(\DataOut[9]_i_5_n_0 ),
        .I1(o_rd_data[9]),
        .I2(\cnt_fifo_reg[7] ),
        .I3(\cnt_fifo_reg[6]_9 ),
        .I4(\cnt_fifo_reg[7]_0 ),
        .I5(\cnt_fifo_reg[5]_9 ),
        .O(\DataOut_last_reg[9] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF4F44)) 
    \DataOut[9]_i_5 
       (.I0(\cnt_fifo_reg[8] ),
        .I1(\rd_data12[15]_15 [9]),
        .I2(\cnt_fifo_reg[6]_0 ),
        .I3(\wr_data_reg[0][7] [9]),
        .I4(\cnt_fifo_reg[7]_10 ),
        .I5(\cnt_fifo_reg[8]_9 ),
        .O(\DataOut[9]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h8000000380000000)) 
    \DataOut_stall[0]_i_4 
       (.I0(\rd_data12[15]_15 [0]),
        .I1(address[1]),
        .I2(address[0]),
        .I3(address[3]),
        .I4(address[2]),
        .I5(\wr_data_reg[0][7] [0]),
        .O(\DataOut_stall_reg[0] ));
  LUT6 #(
    .INIT(64'h8000000380000000)) 
    \DataOut_stall[10]_i_4 
       (.I0(\rd_data12[15]_15 [10]),
        .I1(address[1]),
        .I2(address[0]),
        .I3(address[3]),
        .I4(address[2]),
        .I5(\wr_data_reg[0][7] [10]),
        .O(\DataOut_stall_reg[10] ));
  LUT6 #(
    .INIT(64'h8000000380000000)) 
    \DataOut_stall[11]_i_6 
       (.I0(\rd_data12[15]_15 [11]),
        .I1(address[1]),
        .I2(address[0]),
        .I3(address[3]),
        .I4(address[2]),
        .I5(\wr_data_reg[0][7] [11]),
        .O(\DataOut_stall_reg[11] ));
  LUT6 #(
    .INIT(64'h8000000380000000)) 
    \DataOut_stall[1]_i_4 
       (.I0(\rd_data12[15]_15 [1]),
        .I1(address[1]),
        .I2(address[0]),
        .I3(address[3]),
        .I4(address[2]),
        .I5(\wr_data_reg[0][7] [1]),
        .O(\DataOut_stall_reg[1] ));
  LUT6 #(
    .INIT(64'h8000000380000000)) 
    \DataOut_stall[2]_i_4 
       (.I0(\rd_data12[15]_15 [2]),
        .I1(address[1]),
        .I2(address[0]),
        .I3(address[3]),
        .I4(address[2]),
        .I5(\wr_data_reg[0][7] [2]),
        .O(\DataOut_stall_reg[2] ));
  LUT6 #(
    .INIT(64'h8000000380000000)) 
    \DataOut_stall[3]_i_4 
       (.I0(\rd_data12[15]_15 [3]),
        .I1(address[1]),
        .I2(address[0]),
        .I3(address[3]),
        .I4(address[2]),
        .I5(\wr_data_reg[0][7] [3]),
        .O(\DataOut_stall_reg[3] ));
  LUT6 #(
    .INIT(64'h8000000380000000)) 
    \DataOut_stall[4]_i_4 
       (.I0(\rd_data12[15]_15 [4]),
        .I1(address[1]),
        .I2(address[0]),
        .I3(address[3]),
        .I4(address[2]),
        .I5(\wr_data_reg[0][7] [4]),
        .O(\DataOut_stall_reg[4] ));
  LUT6 #(
    .INIT(64'h8000000380000000)) 
    \DataOut_stall[5]_i_4 
       (.I0(\rd_data12[15]_15 [5]),
        .I1(address[1]),
        .I2(address[0]),
        .I3(address[3]),
        .I4(address[2]),
        .I5(\wr_data_reg[0][7] [5]),
        .O(\DataOut_stall_reg[5] ));
  LUT6 #(
    .INIT(64'h8000000380000000)) 
    \DataOut_stall[6]_i_4 
       (.I0(\rd_data12[15]_15 [6]),
        .I1(address[1]),
        .I2(address[0]),
        .I3(address[3]),
        .I4(address[2]),
        .I5(\wr_data_reg[0][7] [6]),
        .O(\DataOut_stall_reg[6] ));
  LUT6 #(
    .INIT(64'h8000000380000000)) 
    \DataOut_stall[7]_i_4 
       (.I0(\rd_data12[15]_15 [7]),
        .I1(address[1]),
        .I2(address[0]),
        .I3(address[3]),
        .I4(address[2]),
        .I5(\wr_data_reg[0][7] [7]),
        .O(\DataOut_stall_reg[7] ));
  LUT6 #(
    .INIT(64'h8000000380000000)) 
    \DataOut_stall[8]_i_4 
       (.I0(\rd_data12[15]_15 [8]),
        .I1(address[1]),
        .I2(address[0]),
        .I3(address[3]),
        .I4(address[2]),
        .I5(\wr_data_reg[0][7] [8]),
        .O(\DataOut_stall_reg[8] ));
  LUT6 #(
    .INIT(64'h8000000380000000)) 
    \DataOut_stall[9]_i_4 
       (.I0(\rd_data12[15]_15 [9]),
        .I1(address[1]),
        .I2(address[0]),
        .I3(address[3]),
        .I4(address[2]),
        .I5(\wr_data_reg[0][7] [9]),
        .O(\DataOut_stall_reg[9] ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    FIFO_ReadEn_i_11
       (.I0(\r_RD_INDEX_reg[4]_0 ),
        .I1(Q),
        .I2(\r_FIFO_COUNT_reg[0]_0 ),
        .I3(\r_FIFO_COUNT_reg[5]_0 ),
        .O(FIFO_ReadEn_reg));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_onehot_fifo_wr_stm[4]_i_4 
       (.I0(Q),
        .I1(\r_RD_INDEX_reg[4]_0 ),
        .O(full));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__14_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__14_n_0,p_0_out_carry_i_3__14_n_0,p_0_out_carry_i_4__14_n_0,p_0_out_carry_i_5__12_n_0}));
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
       (.I0(Q),
        .I1(r_FIFO_COUNT_reg[6]),
        .O(p_0_out_carry__0_i_1__14_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    p_0_out_carry__0_i_2__14
       (.I0(r_FIFO_COUNT_reg[4]),
        .I1(Q),
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
  LUT6 #(
    .INIT(64'hA6AAAAAA55555555)) 
    p_0_out_carry_i_5__12
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(rd_en),
        .I2(\cnt_fifo_reg[5] ),
        .I3(address[2]),
        .I4(address[3]),
        .I5(wr_en_reg),
        .O(p_0_out_carry_i_5__12_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__14 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__14_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \r_FIFO_COUNT[6]_i_1__12 
       (.I0(wr_en_reg),
        .I1(address[3]),
        .I2(address[2]),
        .I3(address[1]),
        .I4(address[0]),
        .I5(rd_en),
        .O(\r_FIFO_COUNT[6]_i_1__12_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__12_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__14_n_0 ),
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
        .Q(Q),
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
        .DIA(\wr_data_reg[15][11] [1:0]),
        .DIB(\wr_data_reg[15][11] [3:2]),
        .DIC(\wr_data_reg[15][11] [5:4]),
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
        .DIA(\wr_data_reg[15][11] [7:6]),
        .DIB(\wr_data_reg[15][11] [9:8]),
        .DIC(\wr_data_reg[15][11] [11:10]),
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
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__14 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__14 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__14_n_0 ));
  LUT6 #(
    .INIT(64'h0C00000008000000)) 
    \r_RD_INDEX[3]_i_1__12 
       (.I0(\r_RD_INDEX_reg[4]_0 ),
        .I1(rd_en),
        .I2(\cnt_fifo_reg[5] ),
        .I3(address[2]),
        .I4(address[3]),
        .I5(Q),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__14 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h8A)) 
    \r_WR_INDEX[4]_i_1__14 
       (.I0(wr_en_reg),
        .I1(\r_RD_INDEX_reg[4]_0 ),
        .I2(Q),
        .O(r_WR_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
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
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \r_WR_INDEX[4]_i_3__14 
       (.I0(r_FIFO_COUNT_reg[0]),
        .I1(r_FIFO_COUNT_reg[6]),
        .I2(r_FIFO_COUNT_reg[4]),
        .I3(r_FIFO_COUNT_reg[3]),
        .I4(r_FIFO_COUNT_reg[1]),
        .I5(r_FIFO_COUNT_reg[2]),
        .O(\r_RD_INDEX_reg[4]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_WR_INDEX0),
        .D(\r_WR_INDEX[0]_i_1__14_n_0 ),
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
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_6
   (\DataOut_stall_reg[0] ,
    \DataOut_stall_reg[1] ,
    \DataOut_stall_reg[2] ,
    \DataOut_stall_reg[3] ,
    \DataOut_stall_reg[4] ,
    \DataOut_stall_reg[5] ,
    \DataOut_stall_reg[6] ,
    \DataOut_stall_reg[7] ,
    \DataOut_stall_reg[8] ,
    \DataOut_stall_reg[9] ,
    \DataOut_stall_reg[10] ,
    \DataOut_stall_reg[11] ,
    full,
    AR,
    CLK,
    address,
    \cnt_fifo_reg[5] ,
    rd_en,
    wr_en_reg,
    o_rd_data,
    p_0_in,
    Q);
  output \DataOut_stall_reg[0] ;
  output \DataOut_stall_reg[1] ;
  output \DataOut_stall_reg[2] ;
  output \DataOut_stall_reg[3] ;
  output \DataOut_stall_reg[4] ;
  output \DataOut_stall_reg[5] ;
  output \DataOut_stall_reg[6] ;
  output \DataOut_stall_reg[7] ;
  output \DataOut_stall_reg[8] ;
  output \DataOut_stall_reg[9] ;
  output \DataOut_stall_reg[10] ;
  output \DataOut_stall_reg[11] ;
  output [0:0]full;
  input [0:0]AR;
  input CLK;
  input [3:0]address;
  input \cnt_fifo_reg[5] ;
  input rd_en;
  input wr_en_reg;
  input [11:0]o_rd_data;
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
  wire [3:0]address;
  wire \cnt_fifo_reg[5] ;
  wire [0:0]full;
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
  wire p_0_out_carry_i_5__1_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__0_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__1_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__0_n_0 ;
  wire \r_RD_INDEX[1]_i_1__0_n_0 ;
  wire \r_RD_INDEX[2]_i_1__0_n_0 ;
  wire \r_RD_INDEX[3]_i_2__0_n_0 ;
  wire \r_RD_INDEX[4]_i_1__0_n_0 ;
  wire [4:0]r_WR_INDEX;
  wire r_WR_INDEX0;
  wire \r_WR_INDEX[0]_i_1__0_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire \r_WR_INDEX[4]_i_3__0_n_0 ;
  wire [11:0]\rd_data12[1]_1 ;
  wire rd_en;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT6 #(
    .INIT(64'h0000000A0000C000)) 
    \DataOut_stall[0]_i_6 
       (.I0(\rd_data12[1]_1 [0]),
        .I1(o_rd_data[0]),
        .I2(address[3]),
        .I3(address[2]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\DataOut_stall_reg[0] ));
  LUT6 #(
    .INIT(64'h0000000A0000C000)) 
    \DataOut_stall[10]_i_6 
       (.I0(\rd_data12[1]_1 [10]),
        .I1(o_rd_data[10]),
        .I2(address[3]),
        .I3(address[2]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\DataOut_stall_reg[10] ));
  LUT6 #(
    .INIT(64'h0000000A0000C000)) 
    \DataOut_stall[11]_i_8 
       (.I0(\rd_data12[1]_1 [11]),
        .I1(o_rd_data[11]),
        .I2(address[3]),
        .I3(address[2]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\DataOut_stall_reg[11] ));
  LUT6 #(
    .INIT(64'h0000000A0000C000)) 
    \DataOut_stall[1]_i_6 
       (.I0(\rd_data12[1]_1 [1]),
        .I1(o_rd_data[1]),
        .I2(address[3]),
        .I3(address[2]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\DataOut_stall_reg[1] ));
  LUT6 #(
    .INIT(64'h0000000A0000C000)) 
    \DataOut_stall[2]_i_6 
       (.I0(\rd_data12[1]_1 [2]),
        .I1(o_rd_data[2]),
        .I2(address[3]),
        .I3(address[2]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\DataOut_stall_reg[2] ));
  LUT6 #(
    .INIT(64'h0000000A0000C000)) 
    \DataOut_stall[3]_i_6 
       (.I0(\rd_data12[1]_1 [3]),
        .I1(o_rd_data[3]),
        .I2(address[3]),
        .I3(address[2]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\DataOut_stall_reg[3] ));
  LUT6 #(
    .INIT(64'h0000000A0000C000)) 
    \DataOut_stall[4]_i_6 
       (.I0(\rd_data12[1]_1 [4]),
        .I1(o_rd_data[4]),
        .I2(address[3]),
        .I3(address[2]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\DataOut_stall_reg[4] ));
  LUT6 #(
    .INIT(64'h0000000A0000C000)) 
    \DataOut_stall[5]_i_6 
       (.I0(\rd_data12[1]_1 [5]),
        .I1(o_rd_data[5]),
        .I2(address[3]),
        .I3(address[2]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\DataOut_stall_reg[5] ));
  LUT6 #(
    .INIT(64'h0000000A0000C000)) 
    \DataOut_stall[6]_i_6 
       (.I0(\rd_data12[1]_1 [6]),
        .I1(o_rd_data[6]),
        .I2(address[3]),
        .I3(address[2]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\DataOut_stall_reg[6] ));
  LUT6 #(
    .INIT(64'h0000000A0000C000)) 
    \DataOut_stall[7]_i_6 
       (.I0(\rd_data12[1]_1 [7]),
        .I1(o_rd_data[7]),
        .I2(address[3]),
        .I3(address[2]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\DataOut_stall_reg[7] ));
  LUT6 #(
    .INIT(64'h0000000A0000C000)) 
    \DataOut_stall[8]_i_6 
       (.I0(\rd_data12[1]_1 [8]),
        .I1(o_rd_data[8]),
        .I2(address[3]),
        .I3(address[2]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\DataOut_stall_reg[8] ));
  LUT6 #(
    .INIT(64'h0000000A0000C000)) 
    \DataOut_stall[9]_i_6 
       (.I0(\rd_data12[1]_1 [9]),
        .I1(o_rd_data[9]),
        .I2(address[3]),
        .I3(address[2]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\DataOut_stall_reg[9] ));
  LUT2 #(
    .INIT(4'h2)) 
    FIFO_ReadEn_i_14
       (.I0(r_FIFO_COUNT_reg[5]),
        .I1(\r_WR_INDEX[4]_i_3__0_n_0 ),
        .O(full));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__0_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__0_n_0,p_0_out_carry_i_3__0_n_0,p_0_out_carry_i_4__0_n_0,p_0_out_carry_i_5__1_n_0}));
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
    .INIT(64'hA9AAAAAA55555555)) 
    p_0_out_carry_i_5__1
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(address[2]),
        .I2(address[3]),
        .I3(\cnt_fifo_reg[5] ),
        .I4(rd_en),
        .I5(wr_en_reg),
        .O(p_0_out_carry_i_5__1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__0 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAA6AA)) 
    \r_FIFO_COUNT[6]_i_1__1 
       (.I0(wr_en_reg),
        .I1(rd_en),
        .I2(address[1]),
        .I3(address[0]),
        .I4(address[3]),
        .I5(address[2]),
        .O(\r_FIFO_COUNT[6]_i_1__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__1_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__0_n_0 ),
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
        .DOA(\rd_data12[1]_1 [1:0]),
        .DOB(\rd_data12[1]_1 [3:2]),
        .DOC(\rd_data12[1]_1 [5:4]),
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
        .DOA(\rd_data12[1]_1 [7:6]),
        .DOB(\rd_data12[1]_1 [9:8]),
        .DOC(\rd_data12[1]_1 [11:10]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    \r_RD_INDEX[0]_i_1__0 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__0 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__0 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h0300000002000000)) 
    \r_RD_INDEX[3]_i_1__1 
       (.I0(\r_WR_INDEX[4]_i_3__0_n_0 ),
        .I1(address[2]),
        .I2(address[3]),
        .I3(\cnt_fifo_reg[5] ),
        .I4(rd_en),
        .I5(r_FIFO_COUNT_reg[5]),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__0 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h8A)) 
    \r_WR_INDEX[4]_i_1__0 
       (.I0(wr_en_reg),
        .I1(\r_WR_INDEX[4]_i_3__0_n_0 ),
        .I2(r_FIFO_COUNT_reg[5]),
        .O(r_WR_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
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
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \r_WR_INDEX[4]_i_3__0 
       (.I0(r_FIFO_COUNT_reg[0]),
        .I1(r_FIFO_COUNT_reg[6]),
        .I2(r_FIFO_COUNT_reg[4]),
        .I3(r_FIFO_COUNT_reg[3]),
        .I4(r_FIFO_COUNT_reg[1]),
        .I5(r_FIFO_COUNT_reg[2]),
        .O(\r_WR_INDEX[4]_i_3__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_WR_INDEX0),
        .D(\r_WR_INDEX[0]_i_1__0_n_0 ),
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
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_7
   (\WDOTime_intl_reg[63] ,
    \WDONBR_intl_reg[1] ,
    \WDONBR_intl_reg[1]_0 ,
    \DataOut_stall_reg[0] ,
    o_rd_data,
    \DataOut_stall_reg[1] ,
    \DataOut_stall_reg[2] ,
    \DataOut_stall_reg[3] ,
    \DataOut_stall_reg[4] ,
    \DataOut_stall_reg[5] ,
    \DataOut_stall_reg[6] ,
    \DataOut_stall_reg[7] ,
    \DataOut_stall_reg[8] ,
    \DataOut_stall_reg[9] ,
    \DataOut_stall_reg[10] ,
    \DataOut_stall_reg[11] ,
    D,
    AR,
    CLK,
    address,
    \cnt_fifo_reg[6] ,
    rd_en,
    wr_en_reg,
    nRST,
    \FSM_onehot_fifo_wr_stm_reg[6] ,
    \r_FIFO_COUNT_reg[5]_0 ,
    \r_FIFO_COUNT_reg[5]_1 ,
    out,
    \r_FIFO_COUNT_reg[5]_2 ,
    \cnt_fifo_reg[5] ,
    \cnt_fifo_reg[8] ,
    \cnt_fifo_reg[6]_0 ,
    \cnt_fifo_reg[7] ,
    \cnt_fifo_reg[8]_0 ,
    \cnt_fifo_reg[8]_1 ,
    \cnt_fifo_reg[6]_1 ,
    \cnt_fifo_reg[7]_0 ,
    \cnt_fifo_reg[8]_2 ,
    \cnt_fifo_reg[8]_3 ,
    \cnt_fifo_reg[6]_2 ,
    \cnt_fifo_reg[7]_1 ,
    \cnt_fifo_reg[8]_4 ,
    \cnt_fifo_reg[8]_5 ,
    \cnt_fifo_reg[6]_3 ,
    \cnt_fifo_reg[7]_2 ,
    \cnt_fifo_reg[8]_6 ,
    \cnt_fifo_reg[8]_7 ,
    \cnt_fifo_reg[6]_4 ,
    \cnt_fifo_reg[7]_3 ,
    \cnt_fifo_reg[8]_8 ,
    \cnt_fifo_reg[8]_9 ,
    \cnt_fifo_reg[6]_5 ,
    \cnt_fifo_reg[7]_4 ,
    \cnt_fifo_reg[8]_10 ,
    \cnt_fifo_reg[8]_11 ,
    \cnt_fifo_reg[6]_6 ,
    \cnt_fifo_reg[7]_5 ,
    \cnt_fifo_reg[8]_12 ,
    \cnt_fifo_reg[8]_13 ,
    \cnt_fifo_reg[6]_7 ,
    \cnt_fifo_reg[7]_6 ,
    \cnt_fifo_reg[8]_14 ,
    \cnt_fifo_reg[8]_15 ,
    \cnt_fifo_reg[6]_8 ,
    \cnt_fifo_reg[7]_7 ,
    \cnt_fifo_reg[8]_16 ,
    \cnt_fifo_reg[8]_17 ,
    \cnt_fifo_reg[6]_9 ,
    \cnt_fifo_reg[7]_8 ,
    \cnt_fifo_reg[8]_18 ,
    \cnt_fifo_reg[8]_19 ,
    \cnt_fifo_reg[6]_10 ,
    \cnt_fifo_reg[7]_9 ,
    \cnt_fifo_reg[8]_20 ,
    \cnt_fifo_reg[8]_21 ,
    \cnt_fifo_reg[6]_11 ,
    \cnt_fifo_reg[7]_10 ,
    \cnt_fifo_reg[8]_22 ,
    \FSM_onehot_fifo_wr_stm_reg[6]_0 ,
    \r_FIFO_COUNT_reg[5]_3 ,
    \r_FIFO_COUNT_reg[5]_4 ,
    \r_FIFO_COUNT_reg[5]_5 ,
    \r_FIFO_COUNT_reg[5]_6 ,
    \r_FIFO_COUNT_reg[5]_7 ,
    p_0_in,
    Q);
  output \WDOTime_intl_reg[63] ;
  output \WDONBR_intl_reg[1] ;
  output \WDONBR_intl_reg[1]_0 ;
  output \DataOut_stall_reg[0] ;
  output [11:0]o_rd_data;
  output \DataOut_stall_reg[1] ;
  output \DataOut_stall_reg[2] ;
  output \DataOut_stall_reg[3] ;
  output \DataOut_stall_reg[4] ;
  output \DataOut_stall_reg[5] ;
  output \DataOut_stall_reg[6] ;
  output \DataOut_stall_reg[7] ;
  output \DataOut_stall_reg[8] ;
  output \DataOut_stall_reg[9] ;
  output \DataOut_stall_reg[10] ;
  output \DataOut_stall_reg[11] ;
  output [1:0]D;
  input [0:0]AR;
  input CLK;
  input [3:0]address;
  input \cnt_fifo_reg[6] ;
  input rd_en;
  input wr_en_reg;
  input nRST;
  input \FSM_onehot_fifo_wr_stm_reg[6] ;
  input \r_FIFO_COUNT_reg[5]_0 ;
  input \r_FIFO_COUNT_reg[5]_1 ;
  input [2:0]out;
  input \r_FIFO_COUNT_reg[5]_2 ;
  input \cnt_fifo_reg[5] ;
  input \cnt_fifo_reg[8] ;
  input \cnt_fifo_reg[6]_0 ;
  input \cnt_fifo_reg[7] ;
  input \cnt_fifo_reg[8]_0 ;
  input \cnt_fifo_reg[8]_1 ;
  input \cnt_fifo_reg[6]_1 ;
  input \cnt_fifo_reg[7]_0 ;
  input \cnt_fifo_reg[8]_2 ;
  input \cnt_fifo_reg[8]_3 ;
  input \cnt_fifo_reg[6]_2 ;
  input \cnt_fifo_reg[7]_1 ;
  input \cnt_fifo_reg[8]_4 ;
  input \cnt_fifo_reg[8]_5 ;
  input \cnt_fifo_reg[6]_3 ;
  input \cnt_fifo_reg[7]_2 ;
  input \cnt_fifo_reg[8]_6 ;
  input \cnt_fifo_reg[8]_7 ;
  input \cnt_fifo_reg[6]_4 ;
  input \cnt_fifo_reg[7]_3 ;
  input \cnt_fifo_reg[8]_8 ;
  input \cnt_fifo_reg[8]_9 ;
  input \cnt_fifo_reg[6]_5 ;
  input \cnt_fifo_reg[7]_4 ;
  input \cnt_fifo_reg[8]_10 ;
  input \cnt_fifo_reg[8]_11 ;
  input \cnt_fifo_reg[6]_6 ;
  input \cnt_fifo_reg[7]_5 ;
  input \cnt_fifo_reg[8]_12 ;
  input \cnt_fifo_reg[8]_13 ;
  input \cnt_fifo_reg[6]_7 ;
  input \cnt_fifo_reg[7]_6 ;
  input \cnt_fifo_reg[8]_14 ;
  input \cnt_fifo_reg[8]_15 ;
  input \cnt_fifo_reg[6]_8 ;
  input \cnt_fifo_reg[7]_7 ;
  input \cnt_fifo_reg[8]_16 ;
  input \cnt_fifo_reg[8]_17 ;
  input \cnt_fifo_reg[6]_9 ;
  input \cnt_fifo_reg[7]_8 ;
  input \cnt_fifo_reg[8]_18 ;
  input \cnt_fifo_reg[8]_19 ;
  input \cnt_fifo_reg[6]_10 ;
  input \cnt_fifo_reg[7]_9 ;
  input \cnt_fifo_reg[8]_20 ;
  input \cnt_fifo_reg[8]_21 ;
  input \cnt_fifo_reg[6]_11 ;
  input \cnt_fifo_reg[7]_10 ;
  input \cnt_fifo_reg[8]_22 ;
  input \FSM_onehot_fifo_wr_stm_reg[6]_0 ;
  input [3:0]\r_FIFO_COUNT_reg[5]_3 ;
  input \r_FIFO_COUNT_reg[5]_4 ;
  input \r_FIFO_COUNT_reg[5]_5 ;
  input \r_FIFO_COUNT_reg[5]_6 ;
  input \r_FIFO_COUNT_reg[5]_7 ;
  input p_0_in;
  input [11:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire [1:0]D;
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
  wire \FSM_onehot_fifo_wr_stm_reg[6] ;
  wire \FSM_onehot_fifo_wr_stm_reg[6]_0 ;
  wire [11:0]Q;
  wire \WDONBR_intl_reg[1] ;
  wire \WDONBR_intl_reg[1]_0 ;
  wire \WDOTime_intl_reg[63] ;
  wire [3:0]address;
  wire \cnt_fifo_reg[5] ;
  wire \cnt_fifo_reg[6] ;
  wire \cnt_fifo_reg[6]_0 ;
  wire \cnt_fifo_reg[6]_1 ;
  wire \cnt_fifo_reg[6]_10 ;
  wire \cnt_fifo_reg[6]_11 ;
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
  wire \cnt_fifo_reg[8] ;
  wire \cnt_fifo_reg[8]_0 ;
  wire \cnt_fifo_reg[8]_1 ;
  wire \cnt_fifo_reg[8]_10 ;
  wire \cnt_fifo_reg[8]_11 ;
  wire \cnt_fifo_reg[8]_12 ;
  wire \cnt_fifo_reg[8]_13 ;
  wire \cnt_fifo_reg[8]_14 ;
  wire \cnt_fifo_reg[8]_15 ;
  wire \cnt_fifo_reg[8]_16 ;
  wire \cnt_fifo_reg[8]_17 ;
  wire \cnt_fifo_reg[8]_18 ;
  wire \cnt_fifo_reg[8]_19 ;
  wire \cnt_fifo_reg[8]_2 ;
  wire \cnt_fifo_reg[8]_20 ;
  wire \cnt_fifo_reg[8]_21 ;
  wire \cnt_fifo_reg[8]_22 ;
  wire \cnt_fifo_reg[8]_3 ;
  wire \cnt_fifo_reg[8]_4 ;
  wire \cnt_fifo_reg[8]_5 ;
  wire \cnt_fifo_reg[8]_6 ;
  wire \cnt_fifo_reg[8]_7 ;
  wire \cnt_fifo_reg[8]_8 ;
  wire \cnt_fifo_reg[8]_9 ;
  wire [2:2]full;
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
  wire p_0_out_carry_i_5__0_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__1_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__0_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire \r_FIFO_COUNT_reg[5]_0 ;
  wire \r_FIFO_COUNT_reg[5]_1 ;
  wire \r_FIFO_COUNT_reg[5]_2 ;
  wire [3:0]\r_FIFO_COUNT_reg[5]_3 ;
  wire \r_FIFO_COUNT_reg[5]_4 ;
  wire \r_FIFO_COUNT_reg[5]_5 ;
  wire \r_FIFO_COUNT_reg[5]_6 ;
  wire \r_FIFO_COUNT_reg[5]_7 ;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__1_n_0 ;
  wire \r_RD_INDEX[1]_i_1__1_n_0 ;
  wire \r_RD_INDEX[2]_i_1__1_n_0 ;
  wire \r_RD_INDEX[3]_i_2__1_n_0 ;
  wire \r_RD_INDEX[4]_i_1__1_n_0 ;
  wire [4:0]r_WR_INDEX;
  wire r_WR_INDEX0;
  wire \r_WR_INDEX[0]_i_1__1_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire \r_WR_INDEX[4]_i_3__1_n_0 ;
  wire rd_en;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF8)) 
    \DataOut_stall[0]_i_2 
       (.I0(o_rd_data[0]),
        .I1(\cnt_fifo_reg[5] ),
        .I2(\cnt_fifo_reg[8] ),
        .I3(\cnt_fifo_reg[6]_0 ),
        .I4(\cnt_fifo_reg[7] ),
        .I5(\cnt_fifo_reg[8]_0 ),
        .O(\DataOut_stall_reg[0] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF8)) 
    \DataOut_stall[10]_i_2 
       (.I0(o_rd_data[10]),
        .I1(\cnt_fifo_reg[5] ),
        .I2(\cnt_fifo_reg[8]_19 ),
        .I3(\cnt_fifo_reg[6]_10 ),
        .I4(\cnt_fifo_reg[7]_9 ),
        .I5(\cnt_fifo_reg[8]_20 ),
        .O(\DataOut_stall_reg[10] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF8)) 
    \DataOut_stall[11]_i_4 
       (.I0(o_rd_data[11]),
        .I1(\cnt_fifo_reg[5] ),
        .I2(\cnt_fifo_reg[8]_21 ),
        .I3(\cnt_fifo_reg[6]_11 ),
        .I4(\cnt_fifo_reg[7]_10 ),
        .I5(\cnt_fifo_reg[8]_22 ),
        .O(\DataOut_stall_reg[11] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF8)) 
    \DataOut_stall[1]_i_2 
       (.I0(o_rd_data[1]),
        .I1(\cnt_fifo_reg[5] ),
        .I2(\cnt_fifo_reg[8]_1 ),
        .I3(\cnt_fifo_reg[6]_1 ),
        .I4(\cnt_fifo_reg[7]_0 ),
        .I5(\cnt_fifo_reg[8]_2 ),
        .O(\DataOut_stall_reg[1] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF8)) 
    \DataOut_stall[2]_i_2 
       (.I0(o_rd_data[2]),
        .I1(\cnt_fifo_reg[5] ),
        .I2(\cnt_fifo_reg[8]_3 ),
        .I3(\cnt_fifo_reg[6]_2 ),
        .I4(\cnt_fifo_reg[7]_1 ),
        .I5(\cnt_fifo_reg[8]_4 ),
        .O(\DataOut_stall_reg[2] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF8)) 
    \DataOut_stall[3]_i_2 
       (.I0(o_rd_data[3]),
        .I1(\cnt_fifo_reg[5] ),
        .I2(\cnt_fifo_reg[8]_5 ),
        .I3(\cnt_fifo_reg[6]_3 ),
        .I4(\cnt_fifo_reg[7]_2 ),
        .I5(\cnt_fifo_reg[8]_6 ),
        .O(\DataOut_stall_reg[3] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF8)) 
    \DataOut_stall[4]_i_2 
       (.I0(o_rd_data[4]),
        .I1(\cnt_fifo_reg[5] ),
        .I2(\cnt_fifo_reg[8]_7 ),
        .I3(\cnt_fifo_reg[6]_4 ),
        .I4(\cnt_fifo_reg[7]_3 ),
        .I5(\cnt_fifo_reg[8]_8 ),
        .O(\DataOut_stall_reg[4] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF8)) 
    \DataOut_stall[5]_i_2 
       (.I0(o_rd_data[5]),
        .I1(\cnt_fifo_reg[5] ),
        .I2(\cnt_fifo_reg[8]_9 ),
        .I3(\cnt_fifo_reg[6]_5 ),
        .I4(\cnt_fifo_reg[7]_4 ),
        .I5(\cnt_fifo_reg[8]_10 ),
        .O(\DataOut_stall_reg[5] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF8)) 
    \DataOut_stall[6]_i_2 
       (.I0(o_rd_data[6]),
        .I1(\cnt_fifo_reg[5] ),
        .I2(\cnt_fifo_reg[8]_11 ),
        .I3(\cnt_fifo_reg[6]_6 ),
        .I4(\cnt_fifo_reg[7]_5 ),
        .I5(\cnt_fifo_reg[8]_12 ),
        .O(\DataOut_stall_reg[6] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF8)) 
    \DataOut_stall[7]_i_2 
       (.I0(o_rd_data[7]),
        .I1(\cnt_fifo_reg[5] ),
        .I2(\cnt_fifo_reg[8]_13 ),
        .I3(\cnt_fifo_reg[6]_7 ),
        .I4(\cnt_fifo_reg[7]_6 ),
        .I5(\cnt_fifo_reg[8]_14 ),
        .O(\DataOut_stall_reg[7] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF8)) 
    \DataOut_stall[8]_i_2 
       (.I0(o_rd_data[8]),
        .I1(\cnt_fifo_reg[5] ),
        .I2(\cnt_fifo_reg[8]_15 ),
        .I3(\cnt_fifo_reg[6]_8 ),
        .I4(\cnt_fifo_reg[7]_7 ),
        .I5(\cnt_fifo_reg[8]_16 ),
        .O(\DataOut_stall_reg[8] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF8)) 
    \DataOut_stall[9]_i_2 
       (.I0(o_rd_data[9]),
        .I1(\cnt_fifo_reg[5] ),
        .I2(\cnt_fifo_reg[8]_17 ),
        .I3(\cnt_fifo_reg[6]_9 ),
        .I4(\cnt_fifo_reg[7]_8 ),
        .I5(\cnt_fifo_reg[8]_18 ),
        .O(\DataOut_stall_reg[9] ));
  LUT2 #(
    .INIT(4'h2)) 
    FIFO_ReadEn_i_12
       (.I0(r_FIFO_COUNT_reg[5]),
        .I1(\r_WR_INDEX[4]_i_3__1_n_0 ),
        .O(full));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF7FFF)) 
    FIFO_ReadEn_i_4
       (.I0(full),
        .I1(\r_FIFO_COUNT_reg[5]_3 [2]),
        .I2(\r_FIFO_COUNT_reg[5]_3 [0]),
        .I3(\r_FIFO_COUNT_reg[5]_3 [1]),
        .I4(\r_FIFO_COUNT_reg[5]_6 ),
        .I5(\r_FIFO_COUNT_reg[5]_7 ),
        .O(\WDONBR_intl_reg[1] ));
  LUT4 #(
    .INIT(16'h8AAA)) 
    \FSM_onehot_fifo_wr_stm[4]_i_1 
       (.I0(out[0]),
        .I1(\WDONBR_intl_reg[1] ),
        .I2(\r_FIFO_COUNT_reg[5]_4 ),
        .I3(\r_FIFO_COUNT_reg[5]_5 ),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFF40000000)) 
    \FSM_onehot_fifo_wr_stm[9]_i_2 
       (.I0(\WDONBR_intl_reg[1] ),
        .I1(\FSM_onehot_fifo_wr_stm_reg[6]_0 ),
        .I2(\r_FIFO_COUNT_reg[5]_3 [3]),
        .I3(\r_FIFO_COUNT_reg[5]_0 ),
        .I4(\r_FIFO_COUNT_reg[5]_1 ),
        .I5(out[2]),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h8888888808000000)) 
    \WDOTime_intl[31]_i_1 
       (.I0(out[1]),
        .I1(nRST),
        .I2(\WDONBR_intl_reg[1] ),
        .I3(\r_FIFO_COUNT_reg[5]_2 ),
        .I4(\r_FIFO_COUNT_reg[5]_1 ),
        .I5(out[2]),
        .O(\WDONBR_intl_reg[1]_0 ));
  LUT6 #(
    .INIT(64'h0000000020000000)) 
    \WDOTime_intl[63]_i_1 
       (.I0(nRST),
        .I1(\WDONBR_intl_reg[1] ),
        .I2(\FSM_onehot_fifo_wr_stm_reg[6] ),
        .I3(\r_FIFO_COUNT_reg[5]_0 ),
        .I4(\r_FIFO_COUNT_reg[5]_1 ),
        .I5(out[2]),
        .O(\WDOTime_intl_reg[63] ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__1_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__1_n_0,p_0_out_carry_i_3__1_n_0,p_0_out_carry_i_4__1_n_0,p_0_out_carry_i_5__0_n_0}));
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
  LUT6 #(
    .INIT(64'hA9AAAAAA55555555)) 
    p_0_out_carry_i_5__0
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(address[2]),
        .I2(address[3]),
        .I3(\cnt_fifo_reg[6] ),
        .I4(rd_en),
        .I5(wr_en_reg),
        .O(p_0_out_carry_i_5__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__1 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAA6AA)) 
    \r_FIFO_COUNT[6]_i_1__0 
       (.I0(wr_en_reg),
        .I1(rd_en),
        .I2(address[0]),
        .I3(address[1]),
        .I4(address[3]),
        .I5(address[2]),
        .O(\r_FIFO_COUNT[6]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__0_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__1_n_0 ),
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
    \r_RD_INDEX[0]_i_1__1 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__1 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__1 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h0300000002000000)) 
    \r_RD_INDEX[3]_i_1__0 
       (.I0(\r_WR_INDEX[4]_i_3__1_n_0 ),
        .I1(address[2]),
        .I2(address[3]),
        .I3(\cnt_fifo_reg[6] ),
        .I4(rd_en),
        .I5(r_FIFO_COUNT_reg[5]),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__1 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
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
  LUT3 #(
    .INIT(8'h8A)) 
    \r_WR_INDEX[4]_i_1__1 
       (.I0(wr_en_reg),
        .I1(\r_WR_INDEX[4]_i_3__1_n_0 ),
        .I2(r_FIFO_COUNT_reg[5]),
        .O(r_WR_INDEX0));
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
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \r_WR_INDEX[4]_i_3__1 
       (.I0(r_FIFO_COUNT_reg[0]),
        .I1(r_FIFO_COUNT_reg[6]),
        .I2(r_FIFO_COUNT_reg[4]),
        .I3(r_FIFO_COUNT_reg[3]),
        .I4(r_FIFO_COUNT_reg[1]),
        .I5(r_FIFO_COUNT_reg[2]),
        .O(\r_WR_INDEX[4]_i_3__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_WR_INDEX0),
        .D(\r_WR_INDEX[0]_i_1__1_n_0 ),
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
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_8
   (D,
    \DataOut_reg[11] ,
    \DataOut_stall_reg[11] ,
    \WDONBR_intl_reg[1] ,
    AR,
    CLK,
    \cnt_fifo_reg[5] ,
    address,
    rd_en,
    wr_en_reg,
    \wr_data_reg[9][1] ,
    \cnt_fifo_reg[5]_0 ,
    o_rd_data,
    Q,
    \DataOut_intlH_reg[11] ,
    \rdy_state_reg[0] ,
    \fifo_rd_stm_reg[2] ,
    \wr_data_reg[11][7] ,
    \wr_data_reg[9][1]_0 ,
    \rdy_state_reg[0]_0 ,
    \wr_data_reg[9][1]_1 ,
    \rdy_state_reg[0]_1 ,
    \wr_data_reg[9][1]_2 ,
    \rdy_state_reg[0]_2 ,
    \wr_data_reg[9][1]_3 ,
    \rdy_state_reg[0]_3 ,
    \wr_data_reg[9][1]_4 ,
    \rdy_state_reg[0]_4 ,
    \wr_data_reg[9][7] ,
    \rdy_state_reg[0]_5 ,
    \wr_data_reg[9][7]_0 ,
    \rdy_state_reg[0]_6 ,
    \wr_data_reg[9][7]_1 ,
    \rdy_state_reg[0]_7 ,
    \wr_data_reg[9][7]_2 ,
    \rdy_state_reg[0]_8 ,
    \wr_data_reg[9][7]_3 ,
    \rdy_state_reg[0]_9 ,
    \wr_data_reg[9][7]_4 ,
    \rdy_state_reg[0]_10 ,
    p_0_in,
    \wr_data_reg[3][11] );
  output [11:0]D;
  output [11:0]\DataOut_reg[11] ;
  output [11:0]\DataOut_stall_reg[11] ;
  output [0:0]\WDONBR_intl_reg[1] ;
  input [0:0]AR;
  input CLK;
  input \cnt_fifo_reg[5] ;
  input [3:0]address;
  input rd_en;
  input wr_en_reg;
  input \wr_data_reg[9][1] ;
  input \cnt_fifo_reg[5]_0 ;
  input [11:0]o_rd_data;
  input [0:0]Q;
  input [11:0]\DataOut_intlH_reg[11] ;
  input \rdy_state_reg[0] ;
  input \fifo_rd_stm_reg[2] ;
  input [11:0]\wr_data_reg[11][7] ;
  input \wr_data_reg[9][1]_0 ;
  input \rdy_state_reg[0]_0 ;
  input \wr_data_reg[9][1]_1 ;
  input \rdy_state_reg[0]_1 ;
  input \wr_data_reg[9][1]_2 ;
  input \rdy_state_reg[0]_2 ;
  input \wr_data_reg[9][1]_3 ;
  input \rdy_state_reg[0]_3 ;
  input \wr_data_reg[9][1]_4 ;
  input \rdy_state_reg[0]_4 ;
  input \wr_data_reg[9][7] ;
  input \rdy_state_reg[0]_5 ;
  input \wr_data_reg[9][7]_0 ;
  input \rdy_state_reg[0]_6 ;
  input \wr_data_reg[9][7]_1 ;
  input \rdy_state_reg[0]_7 ;
  input \wr_data_reg[9][7]_2 ;
  input \rdy_state_reg[0]_8 ;
  input \wr_data_reg[9][7]_3 ;
  input \rdy_state_reg[0]_9 ;
  input \wr_data_reg[9][7]_4 ;
  input \rdy_state_reg[0]_10 ;
  input p_0_in;
  input [11:0]\wr_data_reg[3][11] ;

  wire [0:0]AR;
  wire CLK;
  wire [11:0]D;
  wire \DataOut[0]_i_3_n_0 ;
  wire \DataOut[10]_i_3_n_0 ;
  wire \DataOut[11]_i_3_n_0 ;
  wire \DataOut[1]_i_3_n_0 ;
  wire \DataOut[2]_i_3_n_0 ;
  wire \DataOut[3]_i_3_n_0 ;
  wire \DataOut[4]_i_3_n_0 ;
  wire \DataOut[5]_i_3_n_0 ;
  wire \DataOut[6]_i_3_n_0 ;
  wire \DataOut[7]_i_3_n_0 ;
  wire \DataOut[8]_i_3_n_0 ;
  wire \DataOut[9]_i_3_n_0 ;
  wire [11:0]\DataOut_intlH_reg[11] ;
  wire [11:0]\DataOut_reg[11] ;
  wire [11:0]\DataOut_stall_reg[11] ;
  wire [0:0]Q;
  wire [0:0]\WDONBR_intl_reg[1] ;
  wire [3:0]address;
  wire \cnt_fifo_reg[5] ;
  wire \cnt_fifo_reg[5]_0 ;
  wire \fifo_rd_stm_reg[2] ;
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
  wire p_0_out_carry_i_5_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__2_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__2_n_0 ;
  wire \r_RD_INDEX[1]_i_1__2_n_0 ;
  wire \r_RD_INDEX[2]_i_1__2_n_0 ;
  wire \r_RD_INDEX[3]_i_2__2_n_0 ;
  wire \r_RD_INDEX[4]_i_1__2_n_0 ;
  wire [4:0]r_WR_INDEX;
  wire r_WR_INDEX0;
  wire \r_WR_INDEX[0]_i_1__2_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire \r_WR_INDEX[4]_i_3__2_n_0 ;
  wire rd_en;
  wire \rdy_state_reg[0] ;
  wire \rdy_state_reg[0]_0 ;
  wire \rdy_state_reg[0]_1 ;
  wire \rdy_state_reg[0]_10 ;
  wire \rdy_state_reg[0]_2 ;
  wire \rdy_state_reg[0]_3 ;
  wire \rdy_state_reg[0]_4 ;
  wire \rdy_state_reg[0]_5 ;
  wire \rdy_state_reg[0]_6 ;
  wire \rdy_state_reg[0]_7 ;
  wire \rdy_state_reg[0]_8 ;
  wire \rdy_state_reg[0]_9 ;
  wire [11:0]\wr_data_reg[11][7] ;
  wire [11:0]\wr_data_reg[3][11] ;
  wire \wr_data_reg[9][1] ;
  wire \wr_data_reg[9][1]_0 ;
  wire \wr_data_reg[9][1]_1 ;
  wire \wr_data_reg[9][1]_2 ;
  wire \wr_data_reg[9][1]_3 ;
  wire \wr_data_reg[9][1]_4 ;
  wire \wr_data_reg[9][7] ;
  wire \wr_data_reg[9][7]_0 ;
  wire \wr_data_reg[9][7]_1 ;
  wire \wr_data_reg[9][7]_2 ;
  wire \wr_data_reg[9][7]_3 ;
  wire \wr_data_reg[9][7]_4 ;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT6 #(
    .INIT(64'hFFFEFEFEAAAAAAAA)) 
    \DataOut[0]_i_1 
       (.I0(\rdy_state_reg[0] ),
        .I1(\DataOut[0]_i_3_n_0 ),
        .I2(\wr_data_reg[9][1] ),
        .I3(\cnt_fifo_reg[5]_0 ),
        .I4(o_rd_data[0]),
        .I5(\fifo_rd_stm_reg[2] ),
        .O(\DataOut_reg[11] [0]));
  LUT6 #(
    .INIT(64'h0C0A000000000000)) 
    \DataOut[0]_i_3 
       (.I0(\DataOut_stall_reg[11] [0]),
        .I1(\wr_data_reg[11][7] [0]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\DataOut[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFEFEAAAAAAAA)) 
    \DataOut[10]_i_1 
       (.I0(\rdy_state_reg[0]_9 ),
        .I1(\DataOut[10]_i_3_n_0 ),
        .I2(\wr_data_reg[9][7]_3 ),
        .I3(\cnt_fifo_reg[5]_0 ),
        .I4(o_rd_data[10]),
        .I5(\fifo_rd_stm_reg[2] ),
        .O(\DataOut_reg[11] [10]));
  LUT6 #(
    .INIT(64'h0C0A000000000000)) 
    \DataOut[10]_i_3 
       (.I0(\DataOut_stall_reg[11] [10]),
        .I1(\wr_data_reg[11][7] [10]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\DataOut[10]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFEFEAAAAAAAA)) 
    \DataOut[11]_i_1 
       (.I0(\rdy_state_reg[0]_10 ),
        .I1(\DataOut[11]_i_3_n_0 ),
        .I2(\wr_data_reg[9][7]_4 ),
        .I3(\cnt_fifo_reg[5]_0 ),
        .I4(o_rd_data[11]),
        .I5(\fifo_rd_stm_reg[2] ),
        .O(\DataOut_reg[11] [11]));
  LUT6 #(
    .INIT(64'h0C0A000000000000)) 
    \DataOut[11]_i_3 
       (.I0(\DataOut_stall_reg[11] [11]),
        .I1(\wr_data_reg[11][7] [11]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\DataOut[11]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFEFEAAAAAAAA)) 
    \DataOut[1]_i_1 
       (.I0(\rdy_state_reg[0]_0 ),
        .I1(\DataOut[1]_i_3_n_0 ),
        .I2(\wr_data_reg[9][1]_0 ),
        .I3(\cnt_fifo_reg[5]_0 ),
        .I4(o_rd_data[1]),
        .I5(\fifo_rd_stm_reg[2] ),
        .O(\DataOut_reg[11] [1]));
  LUT6 #(
    .INIT(64'h0C0A000000000000)) 
    \DataOut[1]_i_3 
       (.I0(\DataOut_stall_reg[11] [1]),
        .I1(\wr_data_reg[11][7] [1]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\DataOut[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFEFEAAAAAAAA)) 
    \DataOut[2]_i_1 
       (.I0(\rdy_state_reg[0]_1 ),
        .I1(\DataOut[2]_i_3_n_0 ),
        .I2(\wr_data_reg[9][1]_1 ),
        .I3(\cnt_fifo_reg[5]_0 ),
        .I4(o_rd_data[2]),
        .I5(\fifo_rd_stm_reg[2] ),
        .O(\DataOut_reg[11] [2]));
  LUT6 #(
    .INIT(64'h0C0A000000000000)) 
    \DataOut[2]_i_3 
       (.I0(\DataOut_stall_reg[11] [2]),
        .I1(\wr_data_reg[11][7] [2]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\DataOut[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFEFEAAAAAAAA)) 
    \DataOut[3]_i_1 
       (.I0(\rdy_state_reg[0]_2 ),
        .I1(\DataOut[3]_i_3_n_0 ),
        .I2(\wr_data_reg[9][1]_2 ),
        .I3(\cnt_fifo_reg[5]_0 ),
        .I4(o_rd_data[3]),
        .I5(\fifo_rd_stm_reg[2] ),
        .O(\DataOut_reg[11] [3]));
  LUT6 #(
    .INIT(64'h0C0A000000000000)) 
    \DataOut[3]_i_3 
       (.I0(\DataOut_stall_reg[11] [3]),
        .I1(\wr_data_reg[11][7] [3]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\DataOut[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFEFEAAAAAAAA)) 
    \DataOut[4]_i_1 
       (.I0(\rdy_state_reg[0]_3 ),
        .I1(\DataOut[4]_i_3_n_0 ),
        .I2(\wr_data_reg[9][1]_3 ),
        .I3(\cnt_fifo_reg[5]_0 ),
        .I4(o_rd_data[4]),
        .I5(\fifo_rd_stm_reg[2] ),
        .O(\DataOut_reg[11] [4]));
  LUT6 #(
    .INIT(64'h0C0A000000000000)) 
    \DataOut[4]_i_3 
       (.I0(\DataOut_stall_reg[11] [4]),
        .I1(\wr_data_reg[11][7] [4]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\DataOut[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFEFEAAAAAAAA)) 
    \DataOut[5]_i_1 
       (.I0(\rdy_state_reg[0]_4 ),
        .I1(\DataOut[5]_i_3_n_0 ),
        .I2(\wr_data_reg[9][1]_4 ),
        .I3(\cnt_fifo_reg[5]_0 ),
        .I4(o_rd_data[5]),
        .I5(\fifo_rd_stm_reg[2] ),
        .O(\DataOut_reg[11] [5]));
  LUT6 #(
    .INIT(64'h0C0A000000000000)) 
    \DataOut[5]_i_3 
       (.I0(\DataOut_stall_reg[11] [5]),
        .I1(\wr_data_reg[11][7] [5]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\DataOut[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFEFEAAAAAAAA)) 
    \DataOut[6]_i_1 
       (.I0(\rdy_state_reg[0]_5 ),
        .I1(\DataOut[6]_i_3_n_0 ),
        .I2(\wr_data_reg[9][7] ),
        .I3(\cnt_fifo_reg[5]_0 ),
        .I4(o_rd_data[6]),
        .I5(\fifo_rd_stm_reg[2] ),
        .O(\DataOut_reg[11] [6]));
  LUT6 #(
    .INIT(64'h0C0A000000000000)) 
    \DataOut[6]_i_3 
       (.I0(\DataOut_stall_reg[11] [6]),
        .I1(\wr_data_reg[11][7] [6]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\DataOut[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFEFEAAAAAAAA)) 
    \DataOut[7]_i_1 
       (.I0(\rdy_state_reg[0]_6 ),
        .I1(\DataOut[7]_i_3_n_0 ),
        .I2(\wr_data_reg[9][7]_0 ),
        .I3(\cnt_fifo_reg[5]_0 ),
        .I4(o_rd_data[7]),
        .I5(\fifo_rd_stm_reg[2] ),
        .O(\DataOut_reg[11] [7]));
  LUT6 #(
    .INIT(64'h0C0A000000000000)) 
    \DataOut[7]_i_3 
       (.I0(\DataOut_stall_reg[11] [7]),
        .I1(\wr_data_reg[11][7] [7]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\DataOut[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFEFEAAAAAAAA)) 
    \DataOut[8]_i_1 
       (.I0(\rdy_state_reg[0]_7 ),
        .I1(\DataOut[8]_i_3_n_0 ),
        .I2(\wr_data_reg[9][7]_1 ),
        .I3(\cnt_fifo_reg[5]_0 ),
        .I4(o_rd_data[8]),
        .I5(\fifo_rd_stm_reg[2] ),
        .O(\DataOut_reg[11] [8]));
  LUT6 #(
    .INIT(64'h0C0A000000000000)) 
    \DataOut[8]_i_3 
       (.I0(\DataOut_stall_reg[11] [8]),
        .I1(\wr_data_reg[11][7] [8]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\DataOut[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFEFEAAAAAAAA)) 
    \DataOut[9]_i_1 
       (.I0(\rdy_state_reg[0]_8 ),
        .I1(\DataOut[9]_i_3_n_0 ),
        .I2(\wr_data_reg[9][7]_2 ),
        .I3(\cnt_fifo_reg[5]_0 ),
        .I4(o_rd_data[9]),
        .I5(\fifo_rd_stm_reg[2] ),
        .O(\DataOut_reg[11] [9]));
  LUT6 #(
    .INIT(64'h0C0A000000000000)) 
    \DataOut[9]_i_3 
       (.I0(\DataOut_stall_reg[11] [9]),
        .I1(\wr_data_reg[11][7] [9]),
        .I2(address[2]),
        .I3(address[3]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\DataOut[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFEEEFFFFFEEE0000)) 
    \DataOut_last[0]_i_1 
       (.I0(\DataOut[0]_i_3_n_0 ),
        .I1(\wr_data_reg[9][1] ),
        .I2(\cnt_fifo_reg[5]_0 ),
        .I3(o_rd_data[0]),
        .I4(Q),
        .I5(\DataOut_intlH_reg[11] [0]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hFEEEFFFFFEEE0000)) 
    \DataOut_last[10]_i_1 
       (.I0(\DataOut[10]_i_3_n_0 ),
        .I1(\wr_data_reg[9][7]_3 ),
        .I2(\cnt_fifo_reg[5]_0 ),
        .I3(o_rd_data[10]),
        .I4(Q),
        .I5(\DataOut_intlH_reg[11] [10]),
        .O(D[10]));
  LUT6 #(
    .INIT(64'hFEEEFFFFFEEE0000)) 
    \DataOut_last[11]_i_1 
       (.I0(\DataOut[11]_i_3_n_0 ),
        .I1(\wr_data_reg[9][7]_4 ),
        .I2(\cnt_fifo_reg[5]_0 ),
        .I3(o_rd_data[11]),
        .I4(Q),
        .I5(\DataOut_intlH_reg[11] [11]),
        .O(D[11]));
  LUT6 #(
    .INIT(64'hFEEEFFFFFEEE0000)) 
    \DataOut_last[1]_i_1 
       (.I0(\DataOut[1]_i_3_n_0 ),
        .I1(\wr_data_reg[9][1]_0 ),
        .I2(\cnt_fifo_reg[5]_0 ),
        .I3(o_rd_data[1]),
        .I4(Q),
        .I5(\DataOut_intlH_reg[11] [1]),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hFEEEFFFFFEEE0000)) 
    \DataOut_last[2]_i_1 
       (.I0(\DataOut[2]_i_3_n_0 ),
        .I1(\wr_data_reg[9][1]_1 ),
        .I2(\cnt_fifo_reg[5]_0 ),
        .I3(o_rd_data[2]),
        .I4(Q),
        .I5(\DataOut_intlH_reg[11] [2]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hFEEEFFFFFEEE0000)) 
    \DataOut_last[3]_i_1 
       (.I0(\DataOut[3]_i_3_n_0 ),
        .I1(\wr_data_reg[9][1]_2 ),
        .I2(\cnt_fifo_reg[5]_0 ),
        .I3(o_rd_data[3]),
        .I4(Q),
        .I5(\DataOut_intlH_reg[11] [3]),
        .O(D[3]));
  LUT6 #(
    .INIT(64'hFEEEFFFFFEEE0000)) 
    \DataOut_last[4]_i_1 
       (.I0(\DataOut[4]_i_3_n_0 ),
        .I1(\wr_data_reg[9][1]_3 ),
        .I2(\cnt_fifo_reg[5]_0 ),
        .I3(o_rd_data[4]),
        .I4(Q),
        .I5(\DataOut_intlH_reg[11] [4]),
        .O(D[4]));
  LUT6 #(
    .INIT(64'hFEEEFFFFFEEE0000)) 
    \DataOut_last[5]_i_1 
       (.I0(\DataOut[5]_i_3_n_0 ),
        .I1(\wr_data_reg[9][1]_4 ),
        .I2(\cnt_fifo_reg[5]_0 ),
        .I3(o_rd_data[5]),
        .I4(Q),
        .I5(\DataOut_intlH_reg[11] [5]),
        .O(D[5]));
  LUT6 #(
    .INIT(64'hFEEEFFFFFEEE0000)) 
    \DataOut_last[6]_i_1 
       (.I0(\DataOut[6]_i_3_n_0 ),
        .I1(\wr_data_reg[9][7] ),
        .I2(\cnt_fifo_reg[5]_0 ),
        .I3(o_rd_data[6]),
        .I4(Q),
        .I5(\DataOut_intlH_reg[11] [6]),
        .O(D[6]));
  LUT6 #(
    .INIT(64'hFEEEFFFFFEEE0000)) 
    \DataOut_last[7]_i_1 
       (.I0(\DataOut[7]_i_3_n_0 ),
        .I1(\wr_data_reg[9][7]_0 ),
        .I2(\cnt_fifo_reg[5]_0 ),
        .I3(o_rd_data[7]),
        .I4(Q),
        .I5(\DataOut_intlH_reg[11] [7]),
        .O(D[7]));
  LUT6 #(
    .INIT(64'hFEEEFFFFFEEE0000)) 
    \DataOut_last[8]_i_1 
       (.I0(\DataOut[8]_i_3_n_0 ),
        .I1(\wr_data_reg[9][7]_1 ),
        .I2(\cnt_fifo_reg[5]_0 ),
        .I3(o_rd_data[8]),
        .I4(Q),
        .I5(\DataOut_intlH_reg[11] [8]),
        .O(D[8]));
  LUT6 #(
    .INIT(64'hFEEEFFFFFEEE0000)) 
    \DataOut_last[9]_i_1 
       (.I0(\DataOut[9]_i_3_n_0 ),
        .I1(\wr_data_reg[9][7]_2 ),
        .I2(\cnt_fifo_reg[5]_0 ),
        .I3(o_rd_data[9]),
        .I4(Q),
        .I5(\DataOut_intlH_reg[11] [9]),
        .O(D[9]));
  LUT2 #(
    .INIT(4'h2)) 
    FIFO_ReadEn_i_15
       (.I0(r_FIFO_COUNT_reg[5]),
        .I1(\r_WR_INDEX[4]_i_3__2_n_0 ),
        .O(\WDONBR_intl_reg[1] ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__2_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__2_n_0,p_0_out_carry_i_3__2_n_0,p_0_out_carry_i_4__2_n_0,p_0_out_carry_i_5_n_0}));
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
  LUT6 #(
    .INIT(64'hAAA9AAAA55555555)) 
    p_0_out_carry_i_5
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(\cnt_fifo_reg[5] ),
        .I2(address[2]),
        .I3(address[3]),
        .I4(rd_en),
        .I5(wr_en_reg),
        .O(p_0_out_carry_i_5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__2 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'hAAA6AAAAAAAAAAAA)) 
    \r_FIFO_COUNT[6]_i_1 
       (.I0(wr_en_reg),
        .I1(rd_en),
        .I2(address[3]),
        .I3(address[2]),
        .I4(address[1]),
        .I5(address[0]),
        .O(\r_FIFO_COUNT[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__2_n_0 ),
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
        .DIA(\wr_data_reg[3][11] [1:0]),
        .DIB(\wr_data_reg[3][11] [3:2]),
        .DIC(\wr_data_reg[3][11] [5:4]),
        .DID({1'b0,1'b0}),
        .DOA(\DataOut_stall_reg[11] [1:0]),
        .DOB(\DataOut_stall_reg[11] [3:2]),
        .DOC(\DataOut_stall_reg[11] [5:4]),
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
        .DOA(\DataOut_stall_reg[11] [7:6]),
        .DOB(\DataOut_stall_reg[11] [9:8]),
        .DOC(\DataOut_stall_reg[11] [11:10]),
        .DOD(NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK),
        .WE(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    \r_RD_INDEX[0]_i_1__2 
       (.I0(r_RD_INDEX[0]),
        .O(\r_RD_INDEX[0]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__2 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__2 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'h0003000000020000)) 
    \r_RD_INDEX[3]_i_1 
       (.I0(\r_WR_INDEX[4]_i_3__2_n_0 ),
        .I1(\cnt_fifo_reg[5] ),
        .I2(address[2]),
        .I3(address[3]),
        .I4(rd_en),
        .I5(r_FIFO_COUNT_reg[5]),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__2 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h8A)) 
    \r_WR_INDEX[4]_i_1__2 
       (.I0(wr_en_reg),
        .I1(\r_WR_INDEX[4]_i_3__2_n_0 ),
        .I2(r_FIFO_COUNT_reg[5]),
        .O(r_WR_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
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
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \r_WR_INDEX[4]_i_3__2 
       (.I0(r_FIFO_COUNT_reg[0]),
        .I1(r_FIFO_COUNT_reg[6]),
        .I2(r_FIFO_COUNT_reg[4]),
        .I3(r_FIFO_COUNT_reg[3]),
        .I4(r_FIFO_COUNT_reg[1]),
        .I5(r_FIFO_COUNT_reg[2]),
        .O(\r_WR_INDEX[4]_i_3__2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_WR_INDEX0),
        .D(\r_WR_INDEX[0]_i_1__2_n_0 ),
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
module base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_9
   (\r_RD_INDEX_reg[4]_0 ,
    \WDONBR_intl_reg[1] ,
    o_rd_data,
    AR,
    CLK,
    rd_en,
    address,
    wr_en_reg,
    \r_FIFO_COUNT_reg[0]_0 ,
    Q,
    p_0_in,
    \wr_data_reg[4][11] );
  output \r_RD_INDEX_reg[4]_0 ;
  output \WDONBR_intl_reg[1] ;
  output [11:0]o_rd_data;
  input [0:0]AR;
  input CLK;
  input rd_en;
  input [3:0]address;
  input wr_en_reg;
  input \r_FIFO_COUNT_reg[0]_0 ;
  input [0:0]Q;
  input p_0_in;
  input [11:0]\wr_data_reg[4][11] ;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]Q;
  wire \WDONBR_intl_reg[1] ;
  wire [3:0]address;
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
  wire p_0_out_carry_i_5__5_n_0;
  wire p_0_out_carry_n_0;
  wire p_0_out_carry_n_1;
  wire p_0_out_carry_n_2;
  wire p_0_out_carry_n_3;
  wire p_0_out_carry_n_4;
  wire p_0_out_carry_n_5;
  wire p_0_out_carry_n_6;
  wire p_0_out_carry_n_7;
  wire \r_FIFO_COUNT[0]_i_1__3_n_0 ;
  wire \r_FIFO_COUNT[6]_i_1__5_n_0 ;
  wire [6:0]r_FIFO_COUNT_reg;
  wire \r_FIFO_COUNT_reg[0]_0 ;
  wire [4:0]r_RD_INDEX;
  wire r_RD_INDEX0;
  wire \r_RD_INDEX[0]_i_1__3_n_0 ;
  wire \r_RD_INDEX[1]_i_1__3_n_0 ;
  wire \r_RD_INDEX[2]_i_1__3_n_0 ;
  wire \r_RD_INDEX[3]_i_2__3_n_0 ;
  wire \r_RD_INDEX[4]_i_1__3_n_0 ;
  wire \r_RD_INDEX_reg[4]_0 ;
  wire [4:0]r_WR_INDEX;
  wire r_WR_INDEX0;
  wire \r_WR_INDEX[0]_i_1__3_n_0 ;
  wire \r_WR_INDEX[1]_i_1_n_0 ;
  wire \r_WR_INDEX[2]_i_1_n_0 ;
  wire \r_WR_INDEX[3]_i_1_n_0 ;
  wire \r_WR_INDEX[4]_i_2_n_0 ;
  wire \r_WR_INDEX[4]_i_3__3_n_0 ;
  wire rd_en;
  wire [11:0]\wr_data_reg[4][11] ;
  wire wr_en_reg;
  wire [3:1]NLW_p_0_out_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_p_0_out_carry__0_O_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED;

  LUT4 #(
    .INIT(16'hFBFF)) 
    FIFO_ReadEn_i_17
       (.I0(\r_WR_INDEX[4]_i_3__3_n_0 ),
        .I1(r_FIFO_COUNT_reg[5]),
        .I2(\r_FIFO_COUNT_reg[0]_0 ),
        .I3(Q),
        .O(\WDONBR_intl_reg[1] ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 p_0_out_carry
       (.CI(1'b0),
        .CO({p_0_out_carry_n_0,p_0_out_carry_n_1,p_0_out_carry_n_2,p_0_out_carry_n_3}),
        .CYINIT(r_FIFO_COUNT_reg[0]),
        .DI({r_FIFO_COUNT_reg[3:1],p_0_out_carry_i_1__3_n_0}),
        .O({p_0_out_carry_n_4,p_0_out_carry_n_5,p_0_out_carry_n_6,p_0_out_carry_n_7}),
        .S({p_0_out_carry_i_2__3_n_0,p_0_out_carry_i_3__3_n_0,p_0_out_carry_i_4__3_n_0,p_0_out_carry_i_5__5_n_0}));
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
    .INIT(64'hAAAAAA6A55555555)) 
    p_0_out_carry_i_5__5
       (.I0(r_FIFO_COUNT_reg[1]),
        .I1(rd_en),
        .I2(address[2]),
        .I3(address[3]),
        .I4(\r_RD_INDEX_reg[4]_0 ),
        .I5(wr_en_reg),
        .O(p_0_out_carry_i_5__5_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    p_0_out_carry_i_6
       (.I0(address[0]),
        .I1(address[1]),
        .O(\r_RD_INDEX_reg[4]_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \r_FIFO_COUNT[0]_i_1__3 
       (.I0(r_FIFO_COUNT_reg[0]),
        .O(\r_FIFO_COUNT[0]_i_1__3_n_0 ));
  LUT6 #(
    .INIT(64'hAAA9AAAAAAAAAAAA)) 
    \r_FIFO_COUNT[6]_i_1__5 
       (.I0(wr_en_reg),
        .I1(address[0]),
        .I2(address[1]),
        .I3(address[3]),
        .I4(address[2]),
        .I5(rd_en),
        .O(\r_FIFO_COUNT[6]_i_1__5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_FIFO_COUNT_reg[0] 
       (.C(CLK),
        .CE(\r_FIFO_COUNT[6]_i_1__5_n_0 ),
        .D(\r_FIFO_COUNT[0]_i_1__3_n_0 ),
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
        .DIA(\wr_data_reg[4][11] [1:0]),
        .DIB(\wr_data_reg[4][11] [3:2]),
        .DIC(\wr_data_reg[4][11] [5:4]),
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
        .DIA(\wr_data_reg[4][11] [7:6]),
        .DIB(\wr_data_reg[4][11] [9:8]),
        .DIC(\wr_data_reg[4][11] [11:10]),
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
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_RD_INDEX[1]_i_1__3 
       (.I0(r_RD_INDEX[0]),
        .I1(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[1]_i_1__3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_RD_INDEX[2]_i_1__3 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .O(\r_RD_INDEX[2]_i_1__3_n_0 ));
  LUT6 #(
    .INIT(64'h000000C000000080)) 
    \r_RD_INDEX[3]_i_1__5 
       (.I0(\r_WR_INDEX[4]_i_3__3_n_0 ),
        .I1(rd_en),
        .I2(address[2]),
        .I3(address[3]),
        .I4(\r_RD_INDEX_reg[4]_0 ),
        .I5(r_FIFO_COUNT_reg[5]),
        .O(r_RD_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_RD_INDEX[3]_i_2__3 
       (.I0(r_RD_INDEX[2]),
        .I1(r_RD_INDEX[0]),
        .I2(r_RD_INDEX[1]),
        .I3(r_RD_INDEX[3]),
        .O(\r_RD_INDEX[3]_i_2__3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_WR_INDEX[1]_i_1 
       (.I0(r_WR_INDEX[0]),
        .I1(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_WR_INDEX[2]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .O(\r_WR_INDEX[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_WR_INDEX[3]_i_1 
       (.I0(r_WR_INDEX[2]),
        .I1(r_WR_INDEX[0]),
        .I2(r_WR_INDEX[1]),
        .I3(r_WR_INDEX[3]),
        .O(\r_WR_INDEX[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h8A)) 
    \r_WR_INDEX[4]_i_1__3 
       (.I0(wr_en_reg),
        .I1(\r_WR_INDEX[4]_i_3__3_n_0 ),
        .I2(r_FIFO_COUNT_reg[5]),
        .O(r_WR_INDEX0));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
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
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \r_WR_INDEX[4]_i_3__3 
       (.I0(r_FIFO_COUNT_reg[0]),
        .I1(r_FIFO_COUNT_reg[6]),
        .I2(r_FIFO_COUNT_reg[4]),
        .I3(r_FIFO_COUNT_reg[3]),
        .I4(r_FIFO_COUNT_reg[1]),
        .I5(r_FIFO_COUNT_reg[2]),
        .O(\r_WR_INDEX[4]_i_3__3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_WR_INDEX_reg[0] 
       (.C(CLK),
        .CE(r_WR_INDEX0),
        .D(\r_WR_INDEX[0]_i_1__3_n_0 ),
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
