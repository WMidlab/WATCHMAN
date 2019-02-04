// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
// Date        : Sat Feb  2 12:23:41 2019
// Host        : jonathan-Latitude-E7450 running 64-bit Linux Mint 18.1 Serena
// Command     : write_verilog -force -mode funcsim
//               /home/jonathan/VivadoProjects/00_WATCHMANN/TARGETC_Prototype/hw/bd/base_zynq/ip/base_zynq_axistream_0_0/base_zynq_axistream_0_0_sim_netlist.v
// Design      : base_zynq_axistream_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "base_zynq_axistream_0_0,axistream,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "axistream,Vivado 2018.2" *) 
(* NotValidForBitStream *)
module base_zynq_axistream_0_0
   (SW_nRST,
    TestStream,
    FIFOvalid,
    FIFOdata,
    StreamReady,
    Cnt_AXIS_DATA,
    CNT_CLR,
    M_AXIS_ACLK,
    M_AXIS_ARESETN,
    M_AXIS_TVALID,
    M_AXIS_TDATA,
    M_AXIS_TSTRB,
    M_AXIS_TLAST,
    M_AXIS_TREADY);
  input SW_nRST;
  input TestStream;
  input FIFOvalid;
  input [31:0]FIFOdata;
  output StreamReady;
  output [9:0]Cnt_AXIS_DATA;
  input CNT_CLR;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 M_AXIS_ACLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXIS_ACLK, ASSOCIATED_BUSIF M_AXIS, ASSOCIATED_RESET M_AXIS_ARESETN, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN base_zynq_processing_system7_0_0_FCLK_CLK0" *) input M_AXIS_ACLK;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 M_AXIS_ARESETN RST" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXIS_ARESETN, POLARITY ACTIVE_LOW" *) input M_AXIS_ARESETN;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN base_zynq_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef" *) output M_AXIS_TVALID;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) output [31:0]M_AXIS_TDATA;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS TSTRB" *) output [3:0]M_AXIS_TSTRB;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *) output M_AXIS_TLAST;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *) input M_AXIS_TREADY;

  wire \<const1> ;
  wire CNT_CLR;
  wire [9:0]Cnt_AXIS_DATA;
  wire [31:0]FIFOdata;
  wire FIFOvalid;
  wire M_AXIS_ACLK;
  wire M_AXIS_ARESETN;
  wire [31:0]M_AXIS_TDATA;
  wire M_AXIS_TLAST;
  wire M_AXIS_TREADY;
  wire M_AXIS_TVALID;
  wire SW_nRST;
  wire StreamReady;
  wire TestStream;

  assign M_AXIS_TSTRB[3] = \<const1> ;
  assign M_AXIS_TSTRB[2] = \<const1> ;
  assign M_AXIS_TSTRB[1] = \<const1> ;
  assign M_AXIS_TSTRB[0] = \<const1> ;
  base_zynq_axistream_0_0_axistream U0
       (.CNT_CLR(CNT_CLR),
        .FIFOdata(FIFOdata),
        .FIFOvalid(FIFOvalid),
        .M_AXIS_ACLK(M_AXIS_ACLK),
        .M_AXIS_ARESETN(M_AXIS_ARESETN),
        .M_AXIS_TDATA(M_AXIS_TDATA),
        .M_AXIS_TLAST(M_AXIS_TLAST),
        .M_AXIS_TREADY(M_AXIS_TREADY),
        .M_AXIS_TVALID(M_AXIS_TVALID),
        .Q(Cnt_AXIS_DATA),
        .SW_nRST(SW_nRST),
        .StreamReady(StreamReady),
        .TestStream(TestStream));
  VCC VCC
       (.P(\<const1> ));
endmodule

(* ORIG_REF_NAME = "axistream" *) 
module base_zynq_axistream_0_0_axistream
   (Q,
    StreamReady,
    M_AXIS_TDATA,
    M_AXIS_TVALID,
    M_AXIS_TLAST,
    M_AXIS_ARESETN,
    SW_nRST,
    TestStream,
    FIFOvalid,
    M_AXIS_TREADY,
    M_AXIS_ACLK,
    FIFOdata,
    CNT_CLR);
  output [9:0]Q;
  output StreamReady;
  output [31:0]M_AXIS_TDATA;
  output M_AXIS_TVALID;
  output M_AXIS_TLAST;
  input M_AXIS_ARESETN;
  input SW_nRST;
  input TestStream;
  input FIFOvalid;
  input M_AXIS_TREADY;
  input M_AXIS_ACLK;
  input [31:0]FIFOdata;
  input CNT_CLR;

  wire CNT_CLR;
  wire [31:0]FIFOdata;
  wire FIFOvalid;
  wire \FSM_sequential_mst_exec_state[0]_i_1_n_0 ;
  wire \FSM_sequential_mst_exec_state[0]_i_2_n_0 ;
  wire \FSM_sequential_mst_exec_state[1]_i_1_n_0 ;
  wire \FSM_sequential_mst_exec_state[1]_i_2_n_0 ;
  wire \FSM_sequential_mst_exec_state[2]_i_1_n_0 ;
  wire \FSM_sequential_mst_exec_state[2]_i_2_n_0 ;
  wire \FSM_sequential_mst_exec_state[2]_i_3_n_0 ;
  wire M_AXIS_ACLK;
  wire M_AXIS_ARESETN;
  wire [31:0]M_AXIS_TDATA;
  wire \M_AXIS_TDATA[31]_INST_0_i_1_n_0 ;
  wire [31:0]M_AXIS_TDATA_intl;
  wire [31:0]M_AXIS_TDATA_intl0_in;
  wire M_AXIS_TDATA_intl_2;
  wire [31:0]M_AXIS_TDATA_last;
  wire M_AXIS_TDATA_last_0;
  wire M_AXIS_TLAST;
  wire M_AXIS_TREADY;
  wire M_AXIS_TVALID;
  wire [9:0]Q;
  wire SW_nRST;
  wire StreamReady;
  wire StreamReady_intl_i_1_n_0;
  wire StreamReady_intl_i_2_n_0;
  wire StreamReady_intl_reg_n_0;
  wire TestStream;
  wire axis_tlast_delay_i_1_n_0;
  wire axis_tlast_delay_i_2_n_0;
  wire axis_tlast_delay_i_3_n_0;
  wire axis_tlast_delay_i_4_n_0;
  wire axis_tlast_delay_i_5_n_0;
  wire axis_tlast_delay_i_6_n_0;
  wire axis_tlast_delay_i_7_n_0;
  wire axis_tvalid_delay_i_1_n_0;
  wire [31:0]cnt_stream_out;
  wire \cnt_stream_out[9]_i_1_n_0 ;
  wire \cnt_stream_out[9]_i_4_n_0 ;
  wire cnt_stream_out_1;
  wire \cnt_stream_out_reg[16]_i_2_n_0 ;
  wire \cnt_stream_out_reg[16]_i_2_n_1 ;
  wire \cnt_stream_out_reg[16]_i_2_n_2 ;
  wire \cnt_stream_out_reg[16]_i_2_n_3 ;
  wire \cnt_stream_out_reg[20]_i_2_n_0 ;
  wire \cnt_stream_out_reg[20]_i_2_n_1 ;
  wire \cnt_stream_out_reg[20]_i_2_n_2 ;
  wire \cnt_stream_out_reg[20]_i_2_n_3 ;
  wire \cnt_stream_out_reg[24]_i_2_n_0 ;
  wire \cnt_stream_out_reg[24]_i_2_n_1 ;
  wire \cnt_stream_out_reg[24]_i_2_n_2 ;
  wire \cnt_stream_out_reg[24]_i_2_n_3 ;
  wire \cnt_stream_out_reg[28]_i_2_n_0 ;
  wire \cnt_stream_out_reg[28]_i_2_n_1 ;
  wire \cnt_stream_out_reg[28]_i_2_n_2 ;
  wire \cnt_stream_out_reg[28]_i_2_n_3 ;
  wire \cnt_stream_out_reg[31]_i_2_n_2 ;
  wire \cnt_stream_out_reg[31]_i_2_n_3 ;
  wire \cnt_stream_out_reg[4]_i_2_n_0 ;
  wire \cnt_stream_out_reg[4]_i_2_n_1 ;
  wire \cnt_stream_out_reg[4]_i_2_n_2 ;
  wire \cnt_stream_out_reg[4]_i_2_n_3 ;
  wire \cnt_stream_out_reg[8]_i_2_n_0 ;
  wire \cnt_stream_out_reg[8]_i_2_n_1 ;
  wire \cnt_stream_out_reg[8]_i_2_n_2 ;
  wire \cnt_stream_out_reg[8]_i_2_n_3 ;
  wire \cnt_stream_out_reg[9]_i_5_n_0 ;
  wire \cnt_stream_out_reg[9]_i_5_n_1 ;
  wire \cnt_stream_out_reg[9]_i_5_n_2 ;
  wire \cnt_stream_out_reg[9]_i_5_n_3 ;
  wire \cnt_stream_out_reg_n_0_[10] ;
  wire \cnt_stream_out_reg_n_0_[11] ;
  wire \cnt_stream_out_reg_n_0_[12] ;
  wire \cnt_stream_out_reg_n_0_[13] ;
  wire \cnt_stream_out_reg_n_0_[14] ;
  wire \cnt_stream_out_reg_n_0_[15] ;
  wire \cnt_stream_out_reg_n_0_[16] ;
  wire \cnt_stream_out_reg_n_0_[17] ;
  wire \cnt_stream_out_reg_n_0_[18] ;
  wire \cnt_stream_out_reg_n_0_[19] ;
  wire \cnt_stream_out_reg_n_0_[20] ;
  wire \cnt_stream_out_reg_n_0_[21] ;
  wire \cnt_stream_out_reg_n_0_[22] ;
  wire \cnt_stream_out_reg_n_0_[23] ;
  wire \cnt_stream_out_reg_n_0_[24] ;
  wire \cnt_stream_out_reg_n_0_[25] ;
  wire \cnt_stream_out_reg_n_0_[26] ;
  wire \cnt_stream_out_reg_n_0_[27] ;
  wire \cnt_stream_out_reg_n_0_[28] ;
  wire \cnt_stream_out_reg_n_0_[29] ;
  wire \cnt_stream_out_reg_n_0_[30] ;
  wire \cnt_stream_out_reg_n_0_[31] ;
  wire [31:1]in13;
  (* RTL_KEEP = "yes" *) wire [2:0]mst_exec_state;
  wire mst_exec_state1;
  wire mst_exec_state1_carry__0_i_1_n_0;
  wire mst_exec_state1_carry__0_i_2_n_0;
  wire mst_exec_state1_carry__0_i_3_n_0;
  wire mst_exec_state1_carry__0_i_4_n_0;
  wire mst_exec_state1_carry__0_i_5_n_0;
  wire mst_exec_state1_carry__0_n_0;
  wire mst_exec_state1_carry__0_n_1;
  wire mst_exec_state1_carry__0_n_2;
  wire mst_exec_state1_carry__0_n_3;
  wire mst_exec_state1_carry__1_i_1_n_0;
  wire mst_exec_state1_carry__1_i_2_n_0;
  wire mst_exec_state1_carry__1_i_3_n_0;
  wire mst_exec_state1_carry__1_i_4_n_0;
  wire mst_exec_state1_carry__1_n_0;
  wire mst_exec_state1_carry__1_n_1;
  wire mst_exec_state1_carry__1_n_2;
  wire mst_exec_state1_carry__1_n_3;
  wire mst_exec_state1_carry__2_i_1_n_0;
  wire mst_exec_state1_carry__2_i_2_n_0;
  wire mst_exec_state1_carry__2_i_3_n_0;
  wire mst_exec_state1_carry__2_i_4_n_0;
  wire mst_exec_state1_carry__2_n_1;
  wire mst_exec_state1_carry__2_n_2;
  wire mst_exec_state1_carry__2_n_3;
  wire mst_exec_state1_carry_i_1_n_0;
  wire mst_exec_state1_carry_i_2_n_0;
  wire mst_exec_state1_carry_i_3_n_0;
  wire mst_exec_state1_carry_i_4_n_0;
  wire mst_exec_state1_carry_i_5_n_0;
  wire mst_exec_state1_carry_i_6_n_0;
  wire mst_exec_state1_carry_n_0;
  wire mst_exec_state1_carry_n_1;
  wire mst_exec_state1_carry_n_2;
  wire mst_exec_state1_carry_n_3;
  wire tx_en;
  wire [1:0]tx_state;
  wire [3:2]\NLW_cnt_stream_out_reg[31]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_cnt_stream_out_reg[31]_i_2_O_UNCONNECTED ;
  wire [3:0]NLW_mst_exec_state1_carry_O_UNCONNECTED;
  wire [3:0]NLW_mst_exec_state1_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_mst_exec_state1_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_mst_exec_state1_carry__2_O_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \FSM_sequential_mst_exec_state[0]_i_1 
       (.I0(\FSM_sequential_mst_exec_state[0]_i_2_n_0 ),
        .I1(SW_nRST),
        .I2(M_AXIS_ARESETN),
        .O(\FSM_sequential_mst_exec_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFBF2F0FA0142000A)) 
    \FSM_sequential_mst_exec_state[0]_i_2 
       (.I0(mst_exec_state[0]),
        .I1(M_AXIS_TREADY),
        .I2(mst_exec_state[2]),
        .I3(mst_exec_state[1]),
        .I4(mst_exec_state1),
        .I5(mst_exec_state[0]),
        .O(\FSM_sequential_mst_exec_state[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hE2000000)) 
    \FSM_sequential_mst_exec_state[1]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(\FSM_sequential_mst_exec_state[2]_i_2_n_0 ),
        .I2(\FSM_sequential_mst_exec_state[1]_i_2_n_0 ),
        .I3(SW_nRST),
        .I4(M_AXIS_ARESETN),
        .O(\FSM_sequential_mst_exec_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0040004040FF40AA)) 
    \FSM_sequential_mst_exec_state[1]_i_2 
       (.I0(mst_exec_state[2]),
        .I1(M_AXIS_TREADY),
        .I2(mst_exec_state1),
        .I3(mst_exec_state[1]),
        .I4(FIFOvalid),
        .I5(mst_exec_state[0]),
        .O(\FSM_sequential_mst_exec_state[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000000002222E222)) 
    \FSM_sequential_mst_exec_state[2]_i_1 
       (.I0(mst_exec_state[2]),
        .I1(\FSM_sequential_mst_exec_state[2]_i_2_n_0 ),
        .I2(\FSM_sequential_mst_exec_state[2]_i_3_n_0 ),
        .I3(TestStream),
        .I4(FIFOvalid),
        .I5(\cnt_stream_out[9]_i_1_n_0 ),
        .O(\FSM_sequential_mst_exec_state[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h054F0F0F)) 
    \FSM_sequential_mst_exec_state[2]_i_2 
       (.I0(mst_exec_state[0]),
        .I1(M_AXIS_TREADY),
        .I2(mst_exec_state[2]),
        .I3(mst_exec_state[1]),
        .I4(mst_exec_state1),
        .O(\FSM_sequential_mst_exec_state[2]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \FSM_sequential_mst_exec_state[2]_i_3 
       (.I0(mst_exec_state[2]),
        .I1(mst_exec_state[0]),
        .I2(mst_exec_state[1]),
        .O(\FSM_sequential_mst_exec_state[2]_i_3_n_0 ));
  (* FSM_ENCODED_STATES = "send_test_stream:011,start_test_stream:100,idle:000,data_stream_stall:001,data_stream:010" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_mst_exec_state_reg[0] 
       (.C(M_AXIS_ACLK),
        .CE(1'b1),
        .D(\FSM_sequential_mst_exec_state[0]_i_1_n_0 ),
        .Q(mst_exec_state[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "send_test_stream:011,start_test_stream:100,idle:000,data_stream_stall:001,data_stream:010" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_mst_exec_state_reg[1] 
       (.C(M_AXIS_ACLK),
        .CE(1'b1),
        .D(\FSM_sequential_mst_exec_state[1]_i_1_n_0 ),
        .Q(mst_exec_state[1]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "send_test_stream:011,start_test_stream:100,idle:000,data_stream_stall:001,data_stream:010" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_mst_exec_state_reg[2] 
       (.C(M_AXIS_ACLK),
        .CE(1'b1),
        .D(\FSM_sequential_mst_exec_state[2]_i_1_n_0 ),
        .Q(mst_exec_state[2]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[0]_INST_0 
       (.I0(M_AXIS_TDATA_intl[0]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[0]),
        .O(M_AXIS_TDATA[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[10]_INST_0 
       (.I0(M_AXIS_TDATA_intl[10]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[10]),
        .O(M_AXIS_TDATA[10]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[11]_INST_0 
       (.I0(M_AXIS_TDATA_intl[11]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[11]),
        .O(M_AXIS_TDATA[11]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[12]_INST_0 
       (.I0(M_AXIS_TDATA_intl[12]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[12]),
        .O(M_AXIS_TDATA[12]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[13]_INST_0 
       (.I0(M_AXIS_TDATA_intl[13]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[13]),
        .O(M_AXIS_TDATA[13]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[14]_INST_0 
       (.I0(M_AXIS_TDATA_intl[14]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[14]),
        .O(M_AXIS_TDATA[14]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[15]_INST_0 
       (.I0(M_AXIS_TDATA_intl[15]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[15]),
        .O(M_AXIS_TDATA[15]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[16]_INST_0 
       (.I0(M_AXIS_TDATA_intl[16]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[16]),
        .O(M_AXIS_TDATA[16]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[17]_INST_0 
       (.I0(M_AXIS_TDATA_intl[17]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[17]),
        .O(M_AXIS_TDATA[17]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[18]_INST_0 
       (.I0(M_AXIS_TDATA_intl[18]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[18]),
        .O(M_AXIS_TDATA[18]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[19]_INST_0 
       (.I0(M_AXIS_TDATA_intl[19]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[19]),
        .O(M_AXIS_TDATA[19]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[1]_INST_0 
       (.I0(M_AXIS_TDATA_intl[1]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[1]),
        .O(M_AXIS_TDATA[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[20]_INST_0 
       (.I0(M_AXIS_TDATA_intl[20]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[20]),
        .O(M_AXIS_TDATA[20]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[21]_INST_0 
       (.I0(M_AXIS_TDATA_intl[21]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[21]),
        .O(M_AXIS_TDATA[21]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[22]_INST_0 
       (.I0(M_AXIS_TDATA_intl[22]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[22]),
        .O(M_AXIS_TDATA[22]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[23]_INST_0 
       (.I0(M_AXIS_TDATA_intl[23]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[23]),
        .O(M_AXIS_TDATA[23]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[24]_INST_0 
       (.I0(M_AXIS_TDATA_intl[24]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[24]),
        .O(M_AXIS_TDATA[24]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[25]_INST_0 
       (.I0(M_AXIS_TDATA_intl[25]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[25]),
        .O(M_AXIS_TDATA[25]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[26]_INST_0 
       (.I0(M_AXIS_TDATA_intl[26]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[26]),
        .O(M_AXIS_TDATA[26]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[27]_INST_0 
       (.I0(M_AXIS_TDATA_intl[27]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[27]),
        .O(M_AXIS_TDATA[27]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[28]_INST_0 
       (.I0(M_AXIS_TDATA_intl[28]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[28]),
        .O(M_AXIS_TDATA[28]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[29]_INST_0 
       (.I0(M_AXIS_TDATA_intl[29]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[29]),
        .O(M_AXIS_TDATA[29]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[2]_INST_0 
       (.I0(M_AXIS_TDATA_intl[2]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[2]),
        .O(M_AXIS_TDATA[2]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[30]_INST_0 
       (.I0(M_AXIS_TDATA_intl[30]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[30]),
        .O(M_AXIS_TDATA[30]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[31]_INST_0 
       (.I0(M_AXIS_TDATA_intl[31]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[31]),
        .O(M_AXIS_TDATA[31]));
  LUT5 #(
    .INIT(32'hDFDDDDFD)) 
    \M_AXIS_TDATA[31]_INST_0_i_1 
       (.I0(tx_state[0]),
        .I1(tx_state[1]),
        .I2(mst_exec_state[2]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[1]),
        .O(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[3]_INST_0 
       (.I0(M_AXIS_TDATA_intl[3]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[3]),
        .O(M_AXIS_TDATA[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[4]_INST_0 
       (.I0(M_AXIS_TDATA_intl[4]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[4]),
        .O(M_AXIS_TDATA[4]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[5]_INST_0 
       (.I0(M_AXIS_TDATA_intl[5]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[5]),
        .O(M_AXIS_TDATA[5]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[6]_INST_0 
       (.I0(M_AXIS_TDATA_intl[6]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[6]),
        .O(M_AXIS_TDATA[6]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[7]_INST_0 
       (.I0(M_AXIS_TDATA_intl[7]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[7]),
        .O(M_AXIS_TDATA[7]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[8]_INST_0 
       (.I0(M_AXIS_TDATA_intl[8]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[8]),
        .O(M_AXIS_TDATA[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \M_AXIS_TDATA[9]_INST_0 
       (.I0(M_AXIS_TDATA_intl[9]),
        .I1(\M_AXIS_TDATA[31]_INST_0_i_1_n_0 ),
        .I2(M_AXIS_TDATA_last[9]),
        .O(M_AXIS_TDATA[9]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[0]_i_1 
       (.I0(FIFOdata[0]),
        .I1(Q[0]),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[0]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[10]_i_1 
       (.I0(FIFOdata[10]),
        .I1(\cnt_stream_out_reg_n_0_[10] ),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[10]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[11]_i_1 
       (.I0(FIFOdata[11]),
        .I1(\cnt_stream_out_reg_n_0_[11] ),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[11]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[12]_i_1 
       (.I0(FIFOdata[12]),
        .I1(\cnt_stream_out_reg_n_0_[12] ),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[12]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[13]_i_1 
       (.I0(FIFOdata[13]),
        .I1(\cnt_stream_out_reg_n_0_[13] ),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[13]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[14]_i_1 
       (.I0(FIFOdata[14]),
        .I1(\cnt_stream_out_reg_n_0_[14] ),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[14]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[15]_i_1 
       (.I0(FIFOdata[15]),
        .I1(\cnt_stream_out_reg_n_0_[15] ),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[15]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[16]_i_1 
       (.I0(FIFOdata[16]),
        .I1(\cnt_stream_out_reg_n_0_[16] ),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[16]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[17]_i_1 
       (.I0(FIFOdata[17]),
        .I1(\cnt_stream_out_reg_n_0_[17] ),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[17]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[18]_i_1 
       (.I0(FIFOdata[18]),
        .I1(\cnt_stream_out_reg_n_0_[18] ),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[18]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[19]_i_1 
       (.I0(FIFOdata[19]),
        .I1(\cnt_stream_out_reg_n_0_[19] ),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[19]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[1]_i_1 
       (.I0(FIFOdata[1]),
        .I1(Q[1]),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[1]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[20]_i_1 
       (.I0(FIFOdata[20]),
        .I1(\cnt_stream_out_reg_n_0_[20] ),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[20]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[21]_i_1 
       (.I0(FIFOdata[21]),
        .I1(\cnt_stream_out_reg_n_0_[21] ),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[21]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[22]_i_1 
       (.I0(FIFOdata[22]),
        .I1(\cnt_stream_out_reg_n_0_[22] ),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[22]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[23]_i_1 
       (.I0(FIFOdata[23]),
        .I1(\cnt_stream_out_reg_n_0_[23] ),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[23]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[24]_i_1 
       (.I0(FIFOdata[24]),
        .I1(\cnt_stream_out_reg_n_0_[24] ),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[24]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[25]_i_1 
       (.I0(FIFOdata[25]),
        .I1(\cnt_stream_out_reg_n_0_[25] ),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[25]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[26]_i_1 
       (.I0(FIFOdata[26]),
        .I1(\cnt_stream_out_reg_n_0_[26] ),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[26]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[27]_i_1 
       (.I0(FIFOdata[27]),
        .I1(\cnt_stream_out_reg_n_0_[27] ),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[27]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[28]_i_1 
       (.I0(FIFOdata[28]),
        .I1(\cnt_stream_out_reg_n_0_[28] ),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[28]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[29]_i_1 
       (.I0(FIFOdata[29]),
        .I1(\cnt_stream_out_reg_n_0_[29] ),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[29]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[2]_i_1 
       (.I0(FIFOdata[2]),
        .I1(Q[2]),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[2]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[30]_i_1 
       (.I0(FIFOdata[30]),
        .I1(\cnt_stream_out_reg_n_0_[30] ),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[30]));
  LUT6 #(
    .INIT(64'h1B1A010001000100)) 
    \M_AXIS_TDATA_intl[31]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[0]),
        .I2(mst_exec_state[2]),
        .I3(FIFOvalid),
        .I4(M_AXIS_TREADY),
        .I5(mst_exec_state1),
        .O(M_AXIS_TDATA_intl_2));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[31]_i_2 
       (.I0(FIFOdata[31]),
        .I1(\cnt_stream_out_reg_n_0_[31] ),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[31]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[3]_i_1 
       (.I0(FIFOdata[3]),
        .I1(Q[3]),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[3]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[4]_i_1 
       (.I0(FIFOdata[4]),
        .I1(Q[4]),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[4]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[5]_i_1 
       (.I0(FIFOdata[5]),
        .I1(Q[5]),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[5]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[6]_i_1 
       (.I0(FIFOdata[6]),
        .I1(Q[6]),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[6]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[7]_i_1 
       (.I0(FIFOdata[7]),
        .I1(Q[7]),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[7]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[8]_i_1 
       (.I0(FIFOdata[8]),
        .I1(Q[8]),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[8]));
  LUT5 #(
    .INIT(32'h000CCCAA)) 
    \M_AXIS_TDATA_intl[9]_i_1 
       (.I0(FIFOdata[9]),
        .I1(Q[9]),
        .I2(mst_exec_state[1]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_intl0_in[9]));
  FDRE \M_AXIS_TDATA_intl_reg[0] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[0]),
        .Q(M_AXIS_TDATA_intl[0]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[10] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[10]),
        .Q(M_AXIS_TDATA_intl[10]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[11] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[11]),
        .Q(M_AXIS_TDATA_intl[11]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[12] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[12]),
        .Q(M_AXIS_TDATA_intl[12]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[13] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[13]),
        .Q(M_AXIS_TDATA_intl[13]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[14] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[14]),
        .Q(M_AXIS_TDATA_intl[14]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[15] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[15]),
        .Q(M_AXIS_TDATA_intl[15]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[16] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[16]),
        .Q(M_AXIS_TDATA_intl[16]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[17] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[17]),
        .Q(M_AXIS_TDATA_intl[17]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[18] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[18]),
        .Q(M_AXIS_TDATA_intl[18]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[19] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[19]),
        .Q(M_AXIS_TDATA_intl[19]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[1] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[1]),
        .Q(M_AXIS_TDATA_intl[1]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[20] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[20]),
        .Q(M_AXIS_TDATA_intl[20]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[21] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[21]),
        .Q(M_AXIS_TDATA_intl[21]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[22] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[22]),
        .Q(M_AXIS_TDATA_intl[22]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[23] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[23]),
        .Q(M_AXIS_TDATA_intl[23]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[24] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[24]),
        .Q(M_AXIS_TDATA_intl[24]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[25] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[25]),
        .Q(M_AXIS_TDATA_intl[25]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[26] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[26]),
        .Q(M_AXIS_TDATA_intl[26]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[27] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[27]),
        .Q(M_AXIS_TDATA_intl[27]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[28] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[28]),
        .Q(M_AXIS_TDATA_intl[28]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[29] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[29]),
        .Q(M_AXIS_TDATA_intl[29]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[2] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[2]),
        .Q(M_AXIS_TDATA_intl[2]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[30] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[30]),
        .Q(M_AXIS_TDATA_intl[30]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[31] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[31]),
        .Q(M_AXIS_TDATA_intl[31]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[3] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[3]),
        .Q(M_AXIS_TDATA_intl[3]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[4] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[4]),
        .Q(M_AXIS_TDATA_intl[4]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[5] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[5]),
        .Q(M_AXIS_TDATA_intl[5]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[6] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[6]),
        .Q(M_AXIS_TDATA_intl[6]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[7] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[7]),
        .Q(M_AXIS_TDATA_intl[7]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[8] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[8]),
        .Q(M_AXIS_TDATA_intl[8]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_intl_reg[9] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_intl_2),
        .D(M_AXIS_TDATA_intl0_in[9]),
        .Q(M_AXIS_TDATA_intl[9]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h000000E2)) 
    \M_AXIS_TDATA_last[31]_i_1 
       (.I0(FIFOvalid),
        .I1(mst_exec_state[1]),
        .I2(mst_exec_state1),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[2]),
        .O(M_AXIS_TDATA_last_0));
  FDRE \M_AXIS_TDATA_last_reg[0] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[0]),
        .Q(M_AXIS_TDATA_last[0]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[10] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[10]),
        .Q(M_AXIS_TDATA_last[10]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[11] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[11]),
        .Q(M_AXIS_TDATA_last[11]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[12] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[12]),
        .Q(M_AXIS_TDATA_last[12]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[13] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[13]),
        .Q(M_AXIS_TDATA_last[13]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[14] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[14]),
        .Q(M_AXIS_TDATA_last[14]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[15] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[15]),
        .Q(M_AXIS_TDATA_last[15]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[16] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[16]),
        .Q(M_AXIS_TDATA_last[16]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[17] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[17]),
        .Q(M_AXIS_TDATA_last[17]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[18] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[18]),
        .Q(M_AXIS_TDATA_last[18]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[19] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[19]),
        .Q(M_AXIS_TDATA_last[19]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[1] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[1]),
        .Q(M_AXIS_TDATA_last[1]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[20] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[20]),
        .Q(M_AXIS_TDATA_last[20]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[21] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[21]),
        .Q(M_AXIS_TDATA_last[21]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[22] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[22]),
        .Q(M_AXIS_TDATA_last[22]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[23] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[23]),
        .Q(M_AXIS_TDATA_last[23]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[24] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[24]),
        .Q(M_AXIS_TDATA_last[24]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[25] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[25]),
        .Q(M_AXIS_TDATA_last[25]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[26] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[26]),
        .Q(M_AXIS_TDATA_last[26]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[27] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[27]),
        .Q(M_AXIS_TDATA_last[27]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[28] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[28]),
        .Q(M_AXIS_TDATA_last[28]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[29] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[29]),
        .Q(M_AXIS_TDATA_last[29]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[2] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[2]),
        .Q(M_AXIS_TDATA_last[2]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[30] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[30]),
        .Q(M_AXIS_TDATA_last[30]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[31] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[31]),
        .Q(M_AXIS_TDATA_last[31]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[3] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[3]),
        .Q(M_AXIS_TDATA_last[3]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[4] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[4]),
        .Q(M_AXIS_TDATA_last[4]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[5] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[5]),
        .Q(M_AXIS_TDATA_last[5]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[6] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[6]),
        .Q(M_AXIS_TDATA_last[6]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[7] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[7]),
        .Q(M_AXIS_TDATA_last[7]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[8] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[8]),
        .Q(M_AXIS_TDATA_last[8]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_last_reg[9] 
       (.C(M_AXIS_ACLK),
        .CE(M_AXIS_TDATA_last_0),
        .D(FIFOdata[9]),
        .Q(M_AXIS_TDATA_last[9]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000C0C0AA)) 
    StreamReady_INST_0
       (.I0(StreamReady_intl_reg_n_0),
        .I1(mst_exec_state1),
        .I2(M_AXIS_TREADY),
        .I3(mst_exec_state[1]),
        .I4(mst_exec_state[0]),
        .I5(mst_exec_state[2]),
        .O(StreamReady));
  LUT6 #(
    .INIT(64'h7F77337740440044)) 
    StreamReady_intl_i_1
       (.I0(mst_exec_state[2]),
        .I1(StreamReady_intl_i_2_n_0),
        .I2(M_AXIS_TREADY),
        .I3(mst_exec_state[1]),
        .I4(mst_exec_state1),
        .I5(StreamReady_intl_reg_n_0),
        .O(StreamReady_intl_i_1_n_0));
  LUT4 #(
    .INIT(16'h0008)) 
    StreamReady_intl_i_2
       (.I0(M_AXIS_ARESETN),
        .I1(SW_nRST),
        .I2(mst_exec_state[2]),
        .I3(mst_exec_state[0]),
        .O(StreamReady_intl_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    StreamReady_intl_reg
       (.C(M_AXIS_ACLK),
        .CE(1'b1),
        .D(StreamReady_intl_i_1_n_0),
        .Q(StreamReady_intl_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    axis_tlast_delay_i_1
       (.I0(axis_tlast_delay_i_2_n_0),
        .I1(axis_tlast_delay_i_3_n_0),
        .I2(SW_nRST),
        .I3(M_AXIS_ARESETN),
        .O(axis_tlast_delay_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    axis_tlast_delay_i_2
       (.I0(\cnt_stream_out_reg_n_0_[28] ),
        .I1(\cnt_stream_out_reg_n_0_[29] ),
        .I2(\cnt_stream_out_reg_n_0_[26] ),
        .I3(\cnt_stream_out_reg_n_0_[27] ),
        .I4(\cnt_stream_out_reg_n_0_[31] ),
        .I5(\cnt_stream_out_reg_n_0_[30] ),
        .O(axis_tlast_delay_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    axis_tlast_delay_i_3
       (.I0(axis_tlast_delay_i_4_n_0),
        .I1(axis_tlast_delay_i_5_n_0),
        .I2(axis_tlast_delay_i_6_n_0),
        .I3(axis_tlast_delay_i_7_n_0),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(axis_tlast_delay_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    axis_tlast_delay_i_4
       (.I0(\cnt_stream_out_reg_n_0_[22] ),
        .I1(\cnt_stream_out_reg_n_0_[23] ),
        .I2(\cnt_stream_out_reg_n_0_[20] ),
        .I3(\cnt_stream_out_reg_n_0_[21] ),
        .I4(\cnt_stream_out_reg_n_0_[25] ),
        .I5(\cnt_stream_out_reg_n_0_[24] ),
        .O(axis_tlast_delay_i_4_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    axis_tlast_delay_i_5
       (.I0(\cnt_stream_out_reg_n_0_[16] ),
        .I1(\cnt_stream_out_reg_n_0_[17] ),
        .I2(\cnt_stream_out_reg_n_0_[14] ),
        .I3(\cnt_stream_out_reg_n_0_[15] ),
        .I4(\cnt_stream_out_reg_n_0_[19] ),
        .I5(\cnt_stream_out_reg_n_0_[18] ),
        .O(axis_tlast_delay_i_5_n_0));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    axis_tlast_delay_i_6
       (.I0(\cnt_stream_out_reg_n_0_[10] ),
        .I1(\cnt_stream_out_reg_n_0_[11] ),
        .I2(Q[9]),
        .I3(Q[8]),
        .I4(\cnt_stream_out_reg_n_0_[13] ),
        .I5(\cnt_stream_out_reg_n_0_[12] ),
        .O(axis_tlast_delay_i_6_n_0));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    axis_tlast_delay_i_7
       (.I0(Q[4]),
        .I1(Q[5]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[7]),
        .I5(Q[6]),
        .O(axis_tlast_delay_i_7_n_0));
  FDRE axis_tlast_delay_reg
       (.C(M_AXIS_ACLK),
        .CE(1'b1),
        .D(axis_tlast_delay_i_1_n_0),
        .Q(M_AXIS_TLAST),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0A28000000000000)) 
    axis_tvalid_delay_i_1
       (.I0(mst_exec_state1),
        .I1(mst_exec_state[1]),
        .I2(mst_exec_state[2]),
        .I3(mst_exec_state[0]),
        .I4(SW_nRST),
        .I5(M_AXIS_ARESETN),
        .O(axis_tvalid_delay_i_1_n_0));
  FDRE axis_tvalid_delay_reg
       (.C(M_AXIS_ACLK),
        .CE(1'b1),
        .D(axis_tvalid_delay_i_1_n_0),
        .Q(M_AXIS_TVALID),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00003616)) 
    \cnt_stream_out[0]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(Q[0]),
        .O(cnt_stream_out[0]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[10]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[10]),
        .O(cnt_stream_out[10]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[11]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[11]),
        .O(cnt_stream_out[11]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[12]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[12]),
        .O(cnt_stream_out[12]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[13]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[13]),
        .O(cnt_stream_out[13]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[14]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[14]),
        .O(cnt_stream_out[14]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[15]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[15]),
        .O(cnt_stream_out[15]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[16]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[16]),
        .O(cnt_stream_out[16]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[17]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[17]),
        .O(cnt_stream_out[17]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[18]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[18]),
        .O(cnt_stream_out[18]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[19]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[19]),
        .O(cnt_stream_out[19]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[1]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[1]),
        .O(cnt_stream_out[1]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[20]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[20]),
        .O(cnt_stream_out[20]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[21]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[21]),
        .O(cnt_stream_out[21]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[22]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[22]),
        .O(cnt_stream_out[22]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[23]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[23]),
        .O(cnt_stream_out[23]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[24]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[24]),
        .O(cnt_stream_out[24]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[25]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[25]),
        .O(cnt_stream_out[25]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[26]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[26]),
        .O(cnt_stream_out[26]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[27]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[27]),
        .O(cnt_stream_out[27]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[28]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[28]),
        .O(cnt_stream_out[28]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[29]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[29]),
        .O(cnt_stream_out[29]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[2]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[2]),
        .O(cnt_stream_out[2]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[30]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[30]),
        .O(cnt_stream_out[30]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[31]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[31]),
        .O(cnt_stream_out[31]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[3]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[3]),
        .O(cnt_stream_out[3]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[4]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[4]),
        .O(cnt_stream_out[4]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[5]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[5]),
        .O(cnt_stream_out[5]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[6]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[6]),
        .O(cnt_stream_out[6]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[7]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[7]),
        .O(cnt_stream_out[7]));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[8]_i_1 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[8]),
        .O(cnt_stream_out[8]));
  LUT2 #(
    .INIT(4'h7)) 
    \cnt_stream_out[9]_i_1 
       (.I0(M_AXIS_ARESETN),
        .I1(SW_nRST),
        .O(\cnt_stream_out[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAFAAAAAAAE)) 
    \cnt_stream_out[9]_i_2 
       (.I0(\cnt_stream_out[9]_i_4_n_0 ),
        .I1(TestStream),
        .I2(mst_exec_state[2]),
        .I3(mst_exec_state[0]),
        .I4(mst_exec_state[1]),
        .I5(CNT_CLR),
        .O(cnt_stream_out_1));
  LUT5 #(
    .INIT(32'h36160000)) 
    \cnt_stream_out[9]_i_3 
       (.I0(mst_exec_state[1]),
        .I1(mst_exec_state[2]),
        .I2(mst_exec_state[0]),
        .I3(mst_exec_state1),
        .I4(in13[9]),
        .O(cnt_stream_out[9]));
  LUT6 #(
    .INIT(64'h000000C0F3C0C0AA)) 
    \cnt_stream_out[9]_i_4 
       (.I0(FIFOvalid),
        .I1(mst_exec_state1),
        .I2(M_AXIS_TREADY),
        .I3(mst_exec_state[1]),
        .I4(mst_exec_state[0]),
        .I5(mst_exec_state[2]),
        .O(\cnt_stream_out[9]_i_4_n_0 ));
  FDRE \cnt_stream_out_reg[0] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[0]),
        .Q(Q[0]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \cnt_stream_out_reg[10] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[10]),
        .Q(\cnt_stream_out_reg_n_0_[10] ),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \cnt_stream_out_reg[11] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[11]),
        .Q(\cnt_stream_out_reg_n_0_[11] ),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \cnt_stream_out_reg[12] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[12]),
        .Q(\cnt_stream_out_reg_n_0_[12] ),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \cnt_stream_out_reg[13] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[13]),
        .Q(\cnt_stream_out_reg_n_0_[13] ),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \cnt_stream_out_reg[14] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[14]),
        .Q(\cnt_stream_out_reg_n_0_[14] ),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \cnt_stream_out_reg[15] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[15]),
        .Q(\cnt_stream_out_reg_n_0_[15] ),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \cnt_stream_out_reg[16] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[16]),
        .Q(\cnt_stream_out_reg_n_0_[16] ),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  CARRY4 \cnt_stream_out_reg[16]_i_2 
       (.CI(\cnt_stream_out_reg[9]_i_5_n_0 ),
        .CO({\cnt_stream_out_reg[16]_i_2_n_0 ,\cnt_stream_out_reg[16]_i_2_n_1 ,\cnt_stream_out_reg[16]_i_2_n_2 ,\cnt_stream_out_reg[16]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in13[16:13]),
        .S({\cnt_stream_out_reg_n_0_[16] ,\cnt_stream_out_reg_n_0_[15] ,\cnt_stream_out_reg_n_0_[14] ,\cnt_stream_out_reg_n_0_[13] }));
  FDRE \cnt_stream_out_reg[17] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[17]),
        .Q(\cnt_stream_out_reg_n_0_[17] ),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \cnt_stream_out_reg[18] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[18]),
        .Q(\cnt_stream_out_reg_n_0_[18] ),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \cnt_stream_out_reg[19] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[19]),
        .Q(\cnt_stream_out_reg_n_0_[19] ),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \cnt_stream_out_reg[1] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[1]),
        .Q(Q[1]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \cnt_stream_out_reg[20] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[20]),
        .Q(\cnt_stream_out_reg_n_0_[20] ),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  CARRY4 \cnt_stream_out_reg[20]_i_2 
       (.CI(\cnt_stream_out_reg[16]_i_2_n_0 ),
        .CO({\cnt_stream_out_reg[20]_i_2_n_0 ,\cnt_stream_out_reg[20]_i_2_n_1 ,\cnt_stream_out_reg[20]_i_2_n_2 ,\cnt_stream_out_reg[20]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in13[20:17]),
        .S({\cnt_stream_out_reg_n_0_[20] ,\cnt_stream_out_reg_n_0_[19] ,\cnt_stream_out_reg_n_0_[18] ,\cnt_stream_out_reg_n_0_[17] }));
  FDRE \cnt_stream_out_reg[21] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[21]),
        .Q(\cnt_stream_out_reg_n_0_[21] ),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \cnt_stream_out_reg[22] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[22]),
        .Q(\cnt_stream_out_reg_n_0_[22] ),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \cnt_stream_out_reg[23] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[23]),
        .Q(\cnt_stream_out_reg_n_0_[23] ),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \cnt_stream_out_reg[24] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[24]),
        .Q(\cnt_stream_out_reg_n_0_[24] ),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  CARRY4 \cnt_stream_out_reg[24]_i_2 
       (.CI(\cnt_stream_out_reg[20]_i_2_n_0 ),
        .CO({\cnt_stream_out_reg[24]_i_2_n_0 ,\cnt_stream_out_reg[24]_i_2_n_1 ,\cnt_stream_out_reg[24]_i_2_n_2 ,\cnt_stream_out_reg[24]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in13[24:21]),
        .S({\cnt_stream_out_reg_n_0_[24] ,\cnt_stream_out_reg_n_0_[23] ,\cnt_stream_out_reg_n_0_[22] ,\cnt_stream_out_reg_n_0_[21] }));
  FDRE \cnt_stream_out_reg[25] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[25]),
        .Q(\cnt_stream_out_reg_n_0_[25] ),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \cnt_stream_out_reg[26] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[26]),
        .Q(\cnt_stream_out_reg_n_0_[26] ),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \cnt_stream_out_reg[27] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[27]),
        .Q(\cnt_stream_out_reg_n_0_[27] ),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \cnt_stream_out_reg[28] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[28]),
        .Q(\cnt_stream_out_reg_n_0_[28] ),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  CARRY4 \cnt_stream_out_reg[28]_i_2 
       (.CI(\cnt_stream_out_reg[24]_i_2_n_0 ),
        .CO({\cnt_stream_out_reg[28]_i_2_n_0 ,\cnt_stream_out_reg[28]_i_2_n_1 ,\cnt_stream_out_reg[28]_i_2_n_2 ,\cnt_stream_out_reg[28]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in13[28:25]),
        .S({\cnt_stream_out_reg_n_0_[28] ,\cnt_stream_out_reg_n_0_[27] ,\cnt_stream_out_reg_n_0_[26] ,\cnt_stream_out_reg_n_0_[25] }));
  FDRE \cnt_stream_out_reg[29] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[29]),
        .Q(\cnt_stream_out_reg_n_0_[29] ),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \cnt_stream_out_reg[2] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[2]),
        .Q(Q[2]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \cnt_stream_out_reg[30] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[30]),
        .Q(\cnt_stream_out_reg_n_0_[30] ),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \cnt_stream_out_reg[31] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[31]),
        .Q(\cnt_stream_out_reg_n_0_[31] ),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  CARRY4 \cnt_stream_out_reg[31]_i_2 
       (.CI(\cnt_stream_out_reg[28]_i_2_n_0 ),
        .CO({\NLW_cnt_stream_out_reg[31]_i_2_CO_UNCONNECTED [3:2],\cnt_stream_out_reg[31]_i_2_n_2 ,\cnt_stream_out_reg[31]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_cnt_stream_out_reg[31]_i_2_O_UNCONNECTED [3],in13[31:29]}),
        .S({1'b0,\cnt_stream_out_reg_n_0_[31] ,\cnt_stream_out_reg_n_0_[30] ,\cnt_stream_out_reg_n_0_[29] }));
  FDRE \cnt_stream_out_reg[3] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[3]),
        .Q(Q[3]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \cnt_stream_out_reg[4] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[4]),
        .Q(Q[4]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  CARRY4 \cnt_stream_out_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\cnt_stream_out_reg[4]_i_2_n_0 ,\cnt_stream_out_reg[4]_i_2_n_1 ,\cnt_stream_out_reg[4]_i_2_n_2 ,\cnt_stream_out_reg[4]_i_2_n_3 }),
        .CYINIT(Q[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in13[4:1]),
        .S(Q[4:1]));
  FDRE \cnt_stream_out_reg[5] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[5]),
        .Q(Q[5]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \cnt_stream_out_reg[6] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[6]),
        .Q(Q[6]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \cnt_stream_out_reg[7] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[7]),
        .Q(Q[7]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  FDRE \cnt_stream_out_reg[8] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[8]),
        .Q(Q[8]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  CARRY4 \cnt_stream_out_reg[8]_i_2 
       (.CI(\cnt_stream_out_reg[4]_i_2_n_0 ),
        .CO({\cnt_stream_out_reg[8]_i_2_n_0 ,\cnt_stream_out_reg[8]_i_2_n_1 ,\cnt_stream_out_reg[8]_i_2_n_2 ,\cnt_stream_out_reg[8]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in13[8:5]),
        .S(Q[8:5]));
  FDRE \cnt_stream_out_reg[9] 
       (.C(M_AXIS_ACLK),
        .CE(cnt_stream_out_1),
        .D(cnt_stream_out[9]),
        .Q(Q[9]),
        .R(\cnt_stream_out[9]_i_1_n_0 ));
  CARRY4 \cnt_stream_out_reg[9]_i_5 
       (.CI(\cnt_stream_out_reg[8]_i_2_n_0 ),
        .CO({\cnt_stream_out_reg[9]_i_5_n_0 ,\cnt_stream_out_reg[9]_i_5_n_1 ,\cnt_stream_out_reg[9]_i_5_n_2 ,\cnt_stream_out_reg[9]_i_5_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in13[12:9]),
        .S({\cnt_stream_out_reg_n_0_[12] ,\cnt_stream_out_reg_n_0_[11] ,\cnt_stream_out_reg_n_0_[10] ,Q[9]}));
  CARRY4 mst_exec_state1_carry
       (.CI(1'b0),
        .CO({mst_exec_state1_carry_n_0,mst_exec_state1_carry_n_1,mst_exec_state1_carry_n_2,mst_exec_state1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,mst_exec_state1_carry_i_1_n_0,mst_exec_state1_carry_i_2_n_0}),
        .O(NLW_mst_exec_state1_carry_O_UNCONNECTED[3:0]),
        .S({mst_exec_state1_carry_i_3_n_0,mst_exec_state1_carry_i_4_n_0,mst_exec_state1_carry_i_5_n_0,mst_exec_state1_carry_i_6_n_0}));
  CARRY4 mst_exec_state1_carry__0
       (.CI(mst_exec_state1_carry_n_0),
        .CO({mst_exec_state1_carry__0_n_0,mst_exec_state1_carry__0_n_1,mst_exec_state1_carry__0_n_2,mst_exec_state1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,mst_exec_state1_carry__0_i_1_n_0}),
        .O(NLW_mst_exec_state1_carry__0_O_UNCONNECTED[3:0]),
        .S({mst_exec_state1_carry__0_i_2_n_0,mst_exec_state1_carry__0_i_3_n_0,mst_exec_state1_carry__0_i_4_n_0,mst_exec_state1_carry__0_i_5_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    mst_exec_state1_carry__0_i_1
       (.I0(Q[9]),
        .O(mst_exec_state1_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    mst_exec_state1_carry__0_i_2
       (.I0(\cnt_stream_out_reg_n_0_[15] ),
        .I1(\cnt_stream_out_reg_n_0_[14] ),
        .O(mst_exec_state1_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    mst_exec_state1_carry__0_i_3
       (.I0(\cnt_stream_out_reg_n_0_[13] ),
        .I1(\cnt_stream_out_reg_n_0_[12] ),
        .O(mst_exec_state1_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    mst_exec_state1_carry__0_i_4
       (.I0(\cnt_stream_out_reg_n_0_[11] ),
        .I1(\cnt_stream_out_reg_n_0_[10] ),
        .O(mst_exec_state1_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    mst_exec_state1_carry__0_i_5
       (.I0(Q[9]),
        .I1(Q[8]),
        .O(mst_exec_state1_carry__0_i_5_n_0));
  CARRY4 mst_exec_state1_carry__1
       (.CI(mst_exec_state1_carry__0_n_0),
        .CO({mst_exec_state1_carry__1_n_0,mst_exec_state1_carry__1_n_1,mst_exec_state1_carry__1_n_2,mst_exec_state1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_mst_exec_state1_carry__1_O_UNCONNECTED[3:0]),
        .S({mst_exec_state1_carry__1_i_1_n_0,mst_exec_state1_carry__1_i_2_n_0,mst_exec_state1_carry__1_i_3_n_0,mst_exec_state1_carry__1_i_4_n_0}));
  LUT2 #(
    .INIT(4'h1)) 
    mst_exec_state1_carry__1_i_1
       (.I0(\cnt_stream_out_reg_n_0_[23] ),
        .I1(\cnt_stream_out_reg_n_0_[22] ),
        .O(mst_exec_state1_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    mst_exec_state1_carry__1_i_2
       (.I0(\cnt_stream_out_reg_n_0_[21] ),
        .I1(\cnt_stream_out_reg_n_0_[20] ),
        .O(mst_exec_state1_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    mst_exec_state1_carry__1_i_3
       (.I0(\cnt_stream_out_reg_n_0_[19] ),
        .I1(\cnt_stream_out_reg_n_0_[18] ),
        .O(mst_exec_state1_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    mst_exec_state1_carry__1_i_4
       (.I0(\cnt_stream_out_reg_n_0_[17] ),
        .I1(\cnt_stream_out_reg_n_0_[16] ),
        .O(mst_exec_state1_carry__1_i_4_n_0));
  CARRY4 mst_exec_state1_carry__2
       (.CI(mst_exec_state1_carry__1_n_0),
        .CO({mst_exec_state1,mst_exec_state1_carry__2_n_1,mst_exec_state1_carry__2_n_2,mst_exec_state1_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({\cnt_stream_out_reg_n_0_[31] ,1'b0,1'b0,1'b0}),
        .O(NLW_mst_exec_state1_carry__2_O_UNCONNECTED[3:0]),
        .S({mst_exec_state1_carry__2_i_1_n_0,mst_exec_state1_carry__2_i_2_n_0,mst_exec_state1_carry__2_i_3_n_0,mst_exec_state1_carry__2_i_4_n_0}));
  LUT2 #(
    .INIT(4'h1)) 
    mst_exec_state1_carry__2_i_1
       (.I0(\cnt_stream_out_reg_n_0_[31] ),
        .I1(\cnt_stream_out_reg_n_0_[30] ),
        .O(mst_exec_state1_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    mst_exec_state1_carry__2_i_2
       (.I0(\cnt_stream_out_reg_n_0_[29] ),
        .I1(\cnt_stream_out_reg_n_0_[28] ),
        .O(mst_exec_state1_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    mst_exec_state1_carry__2_i_3
       (.I0(\cnt_stream_out_reg_n_0_[27] ),
        .I1(\cnt_stream_out_reg_n_0_[26] ),
        .O(mst_exec_state1_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    mst_exec_state1_carry__2_i_4
       (.I0(\cnt_stream_out_reg_n_0_[25] ),
        .I1(\cnt_stream_out_reg_n_0_[24] ),
        .O(mst_exec_state1_carry__2_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    mst_exec_state1_carry_i_1
       (.I0(Q[2]),
        .I1(Q[3]),
        .O(mst_exec_state1_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    mst_exec_state1_carry_i_2
       (.I0(Q[1]),
        .O(mst_exec_state1_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    mst_exec_state1_carry_i_3
       (.I0(Q[7]),
        .I1(Q[6]),
        .O(mst_exec_state1_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    mst_exec_state1_carry_i_4
       (.I0(Q[4]),
        .I1(Q[5]),
        .O(mst_exec_state1_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    mst_exec_state1_carry_i_5
       (.I0(Q[2]),
        .I1(Q[3]),
        .O(mst_exec_state1_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    mst_exec_state1_carry_i_6
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(mst_exec_state1_carry_i_6_n_0));
  LUT5 #(
    .INIT(32'h0040C080)) 
    \tx_state[0]_i_1 
       (.I0(mst_exec_state[0]),
        .I1(mst_exec_state1),
        .I2(M_AXIS_TREADY),
        .I3(mst_exec_state[1]),
        .I4(mst_exec_state[2]),
        .O(tx_en));
  FDRE \tx_state_reg[0] 
       (.C(M_AXIS_ACLK),
        .CE(1'b1),
        .D(tx_en),
        .Q(tx_state[0]),
        .R(1'b0));
  FDRE \tx_state_reg[1] 
       (.C(M_AXIS_ACLK),
        .CE(1'b1),
        .D(tx_state[0]),
        .Q(tx_state[1]),
        .R(1'b0));
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
