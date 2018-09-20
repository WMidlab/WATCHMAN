// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Mon Aug 13 11:42:54 2018
// Host        : idlab52-OptiPlex-790 running 64-bit Ubuntu 14.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/idlab-52/Desktop/GitVivado/WATCHMAN/prototype_watchman/prototype_watchman.srcs/sources_1/bd/prototype_watchman/ip/prototype_watchman_example_0_0/prototype_watchman_example_0_0_sim_netlist.v
// Design      : prototype_watchman_example_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "prototype_watchman_example_0_0,example,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "example,Vivado 2018.1" *) 
(* NotValidForBitStream *)
module prototype_watchman_example_0_0
   (ap_clk,
    ap_rst_n,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    A_TVALID,
    A_TREADY,
    A_TDATA,
    B_TVALID,
    B_TREADY,
    B_TDATA);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF A:B, ASSOCIATED_RESET ap_rst_n, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN prototype_watchman_processing_system7_0_0_FCLK_CLK0" *) input ap_clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *) (* x_interface_parameter = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}" *) input ap_rst_n;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start" *) (* x_interface_parameter = "XIL_INTERFACENAME ap_ctrl, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {start {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} done {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} idle {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} ready {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}" *) input ap_start;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done" *) output ap_done;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle" *) output ap_idle;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready" *) output ap_ready;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 A TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME A, TDATA_NUM_BYTES 4, TUSER_WIDTH 0, LAYERED_METADATA undef, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN prototype_watchman_processing_system7_0_0_FCLK_CLK0" *) input A_TVALID;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 A TREADY" *) output A_TREADY;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 A TDATA" *) input [31:0]A_TDATA;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 B TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME B, TDATA_NUM_BYTES 4, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}} TDATA_WIDTH 32}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN prototype_watchman_processing_system7_0_0_FCLK_CLK0" *) output B_TVALID;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 B TREADY" *) input B_TREADY;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 B TDATA" *) output [31:0]B_TDATA;

  wire [31:0]A_TDATA;
  wire A_TREADY;
  wire A_TVALID;
  wire [31:0]B_TDATA;
  wire B_TREADY;
  wire B_TVALID;
  wire ap_clk;
  wire ap_done;
  wire ap_idle;
  wire ap_ready;
  wire ap_rst_n;
  wire ap_start;

  prototype_watchman_example_0_0_example U0
       (.A_TDATA(A_TDATA),
        .A_TREADY(A_TREADY),
        .A_TVALID(A_TVALID),
        .B_TDATA(B_TDATA),
        .B_TREADY(B_TREADY),
        .B_TVALID(B_TVALID),
        .ap_clk(ap_clk),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .ap_rst_n(ap_rst_n),
        .ap_start(ap_start));
endmodule

(* ORIG_REF_NAME = "example" *) 
module prototype_watchman_example_0_0_example
   (ap_clk,
    ap_rst_n,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    A_TDATA,
    A_TVALID,
    A_TREADY,
    B_TDATA,
    B_TVALID,
    B_TREADY);
  input ap_clk;
  input ap_rst_n;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [31:0]A_TDATA;
  input A_TVALID;
  output A_TREADY;
  output [31:0]B_TDATA;
  output B_TVALID;
  input B_TREADY;

  wire [31:0]A_0_data_out;
  wire A_0_load_B;
  wire [31:0]A_0_payload_A;
  wire \A_0_payload_A[31]_i_1_n_2 ;
  wire [31:0]A_0_payload_B;
  wire A_0_sel;
  wire A_0_sel_rd_i_1_n_2;
  wire A_0_sel_wr;
  wire A_0_sel_wr_i_1_n_2;
  wire \A_0_state[0]_i_1_n_2 ;
  wire \A_0_state[1]_i_2_n_2 ;
  wire \A_0_state_reg_n_2_[0] ;
  wire [31:0]A_TDATA;
  wire A_TREADY;
  wire A_TVALID;
  wire B_1_ack_in;
  wire B_1_load_B;
  wire [31:0]B_1_payload_A;
  wire \B_1_payload_A[31]_i_1_n_2 ;
  wire \B_1_payload_A[4]_i_5_n_2 ;
  wire \B_1_payload_A_reg[12]_i_1_n_2 ;
  wire \B_1_payload_A_reg[12]_i_1_n_3 ;
  wire \B_1_payload_A_reg[12]_i_1_n_4 ;
  wire \B_1_payload_A_reg[12]_i_1_n_5 ;
  wire \B_1_payload_A_reg[16]_i_1_n_2 ;
  wire \B_1_payload_A_reg[16]_i_1_n_3 ;
  wire \B_1_payload_A_reg[16]_i_1_n_4 ;
  wire \B_1_payload_A_reg[16]_i_1_n_5 ;
  wire \B_1_payload_A_reg[20]_i_1_n_2 ;
  wire \B_1_payload_A_reg[20]_i_1_n_3 ;
  wire \B_1_payload_A_reg[20]_i_1_n_4 ;
  wire \B_1_payload_A_reg[20]_i_1_n_5 ;
  wire \B_1_payload_A_reg[24]_i_1_n_2 ;
  wire \B_1_payload_A_reg[24]_i_1_n_3 ;
  wire \B_1_payload_A_reg[24]_i_1_n_4 ;
  wire \B_1_payload_A_reg[24]_i_1_n_5 ;
  wire \B_1_payload_A_reg[28]_i_1_n_2 ;
  wire \B_1_payload_A_reg[28]_i_1_n_3 ;
  wire \B_1_payload_A_reg[28]_i_1_n_4 ;
  wire \B_1_payload_A_reg[28]_i_1_n_5 ;
  wire \B_1_payload_A_reg[31]_i_2_n_4 ;
  wire \B_1_payload_A_reg[31]_i_2_n_5 ;
  wire \B_1_payload_A_reg[4]_i_1_n_2 ;
  wire \B_1_payload_A_reg[4]_i_1_n_3 ;
  wire \B_1_payload_A_reg[4]_i_1_n_4 ;
  wire \B_1_payload_A_reg[4]_i_1_n_5 ;
  wire \B_1_payload_A_reg[8]_i_1_n_2 ;
  wire \B_1_payload_A_reg[8]_i_1_n_3 ;
  wire \B_1_payload_A_reg[8]_i_1_n_4 ;
  wire \B_1_payload_A_reg[8]_i_1_n_5 ;
  wire [31:0]B_1_payload_B;
  wire B_1_sel;
  wire B_1_sel_rd_i_1_n_2;
  wire B_1_sel_wr;
  wire B_1_sel_wr_i_1_n_2;
  wire \B_1_state[0]_i_1_n_2 ;
  wire \B_1_state[1]_i_1_n_2 ;
  wire [31:0]B_TDATA;
  wire B_TREADY;
  wire B_TVALID;
  wire \ap_CS_fsm_reg_n_2_[0] ;
  wire ap_CS_fsm_state2;
  wire ap_CS_fsm_state3;
  wire ap_CS_fsm_state4;
  wire [3:0]ap_NS_fsm;
  wire ap_NS_fsm1;
  wire ap_clk;
  wire ap_done;
  wire ap_idle;
  wire ap_rst_n;
  wire ap_rst_n_inv;
  wire ap_start;
  wire exitcond_fu_62_p2;
  wire [5:0]i_1_fu_68_p2;
  wire [5:0]i_1_reg_84;
  wire i_1_reg_840;
  wire i_reg_51;
  wire \i_reg_51_reg_n_2_[0] ;
  wire \i_reg_51_reg_n_2_[1] ;
  wire \i_reg_51_reg_n_2_[2] ;
  wire \i_reg_51_reg_n_2_[3] ;
  wire \i_reg_51_reg_n_2_[4] ;
  wire \i_reg_51_reg_n_2_[5] ;
  wire [31:0]tmp_1_fu_74_p2;
  wire [3:2]\NLW_B_1_payload_A_reg[31]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_B_1_payload_A_reg[31]_i_2_O_UNCONNECTED ;

  assign ap_ready = ap_done;
  LUT3 #(
    .INIT(8'h0D)) 
    \A_0_payload_A[31]_i_1 
       (.I0(\A_0_state_reg_n_2_[0] ),
        .I1(A_TREADY),
        .I2(A_0_sel_wr),
        .O(\A_0_payload_A[31]_i_1_n_2 ));
  FDRE \A_0_payload_A_reg[0] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[0]),
        .Q(A_0_payload_A[0]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[10] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[10]),
        .Q(A_0_payload_A[10]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[11] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[11]),
        .Q(A_0_payload_A[11]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[12] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[12]),
        .Q(A_0_payload_A[12]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[13] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[13]),
        .Q(A_0_payload_A[13]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[14] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[14]),
        .Q(A_0_payload_A[14]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[15] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[15]),
        .Q(A_0_payload_A[15]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[16] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[16]),
        .Q(A_0_payload_A[16]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[17] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[17]),
        .Q(A_0_payload_A[17]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[18] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[18]),
        .Q(A_0_payload_A[18]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[19] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[19]),
        .Q(A_0_payload_A[19]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[1] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[1]),
        .Q(A_0_payload_A[1]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[20] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[20]),
        .Q(A_0_payload_A[20]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[21] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[21]),
        .Q(A_0_payload_A[21]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[22] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[22]),
        .Q(A_0_payload_A[22]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[23] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[23]),
        .Q(A_0_payload_A[23]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[24] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[24]),
        .Q(A_0_payload_A[24]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[25] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[25]),
        .Q(A_0_payload_A[25]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[26] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[26]),
        .Q(A_0_payload_A[26]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[27] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[27]),
        .Q(A_0_payload_A[27]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[28] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[28]),
        .Q(A_0_payload_A[28]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[29] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[29]),
        .Q(A_0_payload_A[29]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[2] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[2]),
        .Q(A_0_payload_A[2]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[30] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[30]),
        .Q(A_0_payload_A[30]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[31] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[31]),
        .Q(A_0_payload_A[31]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[3] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[3]),
        .Q(A_0_payload_A[3]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[4] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[4]),
        .Q(A_0_payload_A[4]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[5] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[5]),
        .Q(A_0_payload_A[5]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[6] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[6]),
        .Q(A_0_payload_A[6]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[7] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[7]),
        .Q(A_0_payload_A[7]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[8] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[8]),
        .Q(A_0_payload_A[8]),
        .R(1'b0));
  FDRE \A_0_payload_A_reg[9] 
       (.C(ap_clk),
        .CE(\A_0_payload_A[31]_i_1_n_2 ),
        .D(A_TDATA[9]),
        .Q(A_0_payload_A[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hA2)) 
    \A_0_payload_B[31]_i_1 
       (.I0(A_0_sel_wr),
        .I1(\A_0_state_reg_n_2_[0] ),
        .I2(A_TREADY),
        .O(A_0_load_B));
  FDRE \A_0_payload_B_reg[0] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[0]),
        .Q(A_0_payload_B[0]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[10] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[10]),
        .Q(A_0_payload_B[10]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[11] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[11]),
        .Q(A_0_payload_B[11]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[12] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[12]),
        .Q(A_0_payload_B[12]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[13] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[13]),
        .Q(A_0_payload_B[13]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[14] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[14]),
        .Q(A_0_payload_B[14]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[15] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[15]),
        .Q(A_0_payload_B[15]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[16] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[16]),
        .Q(A_0_payload_B[16]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[17] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[17]),
        .Q(A_0_payload_B[17]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[18] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[18]),
        .Q(A_0_payload_B[18]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[19] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[19]),
        .Q(A_0_payload_B[19]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[1] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[1]),
        .Q(A_0_payload_B[1]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[20] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[20]),
        .Q(A_0_payload_B[20]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[21] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[21]),
        .Q(A_0_payload_B[21]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[22] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[22]),
        .Q(A_0_payload_B[22]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[23] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[23]),
        .Q(A_0_payload_B[23]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[24] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[24]),
        .Q(A_0_payload_B[24]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[25] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[25]),
        .Q(A_0_payload_B[25]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[26] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[26]),
        .Q(A_0_payload_B[26]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[27] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[27]),
        .Q(A_0_payload_B[27]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[28] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[28]),
        .Q(A_0_payload_B[28]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[29] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[29]),
        .Q(A_0_payload_B[29]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[2] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[2]),
        .Q(A_0_payload_B[2]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[30] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[30]),
        .Q(A_0_payload_B[30]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[31] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[31]),
        .Q(A_0_payload_B[31]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[3] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[3]),
        .Q(A_0_payload_B[3]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[4] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[4]),
        .Q(A_0_payload_B[4]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[5] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[5]),
        .Q(A_0_payload_B[5]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[6] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[6]),
        .Q(A_0_payload_B[6]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[7] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[7]),
        .Q(A_0_payload_B[7]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[8] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[8]),
        .Q(A_0_payload_B[8]),
        .R(1'b0));
  FDRE \A_0_payload_B_reg[9] 
       (.C(ap_clk),
        .CE(A_0_load_B),
        .D(A_TDATA[9]),
        .Q(A_0_payload_B[9]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h7F80)) 
    A_0_sel_rd_i_1
       (.I0(ap_CS_fsm_state3),
        .I1(B_1_ack_in),
        .I2(\A_0_state_reg_n_2_[0] ),
        .I3(A_0_sel),
        .O(A_0_sel_rd_i_1_n_2));
  FDRE #(
    .INIT(1'b0)) 
    A_0_sel_rd_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(A_0_sel_rd_i_1_n_2),
        .Q(A_0_sel),
        .R(ap_rst_n_inv));
  LUT3 #(
    .INIT(8'h78)) 
    A_0_sel_wr_i_1
       (.I0(A_TREADY),
        .I1(A_TVALID),
        .I2(A_0_sel_wr),
        .O(A_0_sel_wr_i_1_n_2));
  FDRE #(
    .INIT(1'b0)) 
    A_0_sel_wr_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(A_0_sel_wr_i_1_n_2),
        .Q(A_0_sel_wr),
        .R(ap_rst_n_inv));
  LUT6 #(
    .INIT(64'hA820A8A0A8A0A8A0)) 
    \A_0_state[0]_i_1 
       (.I0(ap_rst_n),
        .I1(A_TREADY),
        .I2(\A_0_state_reg_n_2_[0] ),
        .I3(A_TVALID),
        .I4(ap_CS_fsm_state3),
        .I5(B_1_ack_in),
        .O(\A_0_state[0]_i_1_n_2 ));
  LUT1 #(
    .INIT(2'h1)) 
    \A_0_state[1]_i_1 
       (.I0(ap_rst_n),
        .O(ap_rst_n_inv));
  LUT5 #(
    .INIT(32'h8F88FFFF)) 
    \A_0_state[1]_i_2 
       (.I0(ap_CS_fsm_state3),
        .I1(B_1_ack_in),
        .I2(A_TVALID),
        .I3(A_TREADY),
        .I4(\A_0_state_reg_n_2_[0] ),
        .O(\A_0_state[1]_i_2_n_2 ));
  FDRE #(
    .INIT(1'b0)) 
    \A_0_state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\A_0_state[0]_i_1_n_2 ),
        .Q(\A_0_state_reg_n_2_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \A_0_state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\A_0_state[1]_i_2_n_2 ),
        .Q(A_TREADY),
        .R(ap_rst_n_inv));
  LUT3 #(
    .INIT(8'h1B)) 
    \B_1_payload_A[0]_i_1 
       (.I0(A_0_sel),
        .I1(A_0_payload_A[0]),
        .I2(A_0_payload_B[0]),
        .O(tmp_1_fu_74_p2[0]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[12]_i_2 
       (.I0(A_0_payload_B[12]),
        .I1(A_0_payload_A[12]),
        .I2(A_0_sel),
        .O(A_0_data_out[12]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[12]_i_3 
       (.I0(A_0_payload_B[11]),
        .I1(A_0_payload_A[11]),
        .I2(A_0_sel),
        .O(A_0_data_out[11]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[12]_i_4 
       (.I0(A_0_payload_B[10]),
        .I1(A_0_payload_A[10]),
        .I2(A_0_sel),
        .O(A_0_data_out[10]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[12]_i_5 
       (.I0(A_0_payload_B[9]),
        .I1(A_0_payload_A[9]),
        .I2(A_0_sel),
        .O(A_0_data_out[9]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[16]_i_2 
       (.I0(A_0_payload_B[16]),
        .I1(A_0_payload_A[16]),
        .I2(A_0_sel),
        .O(A_0_data_out[16]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[16]_i_3 
       (.I0(A_0_payload_B[15]),
        .I1(A_0_payload_A[15]),
        .I2(A_0_sel),
        .O(A_0_data_out[15]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[16]_i_4 
       (.I0(A_0_payload_B[14]),
        .I1(A_0_payload_A[14]),
        .I2(A_0_sel),
        .O(A_0_data_out[14]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[16]_i_5 
       (.I0(A_0_payload_B[13]),
        .I1(A_0_payload_A[13]),
        .I2(A_0_sel),
        .O(A_0_data_out[13]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[20]_i_2 
       (.I0(A_0_payload_B[20]),
        .I1(A_0_payload_A[20]),
        .I2(A_0_sel),
        .O(A_0_data_out[20]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[20]_i_3 
       (.I0(A_0_payload_B[19]),
        .I1(A_0_payload_A[19]),
        .I2(A_0_sel),
        .O(A_0_data_out[19]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[20]_i_4 
       (.I0(A_0_payload_B[18]),
        .I1(A_0_payload_A[18]),
        .I2(A_0_sel),
        .O(A_0_data_out[18]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[20]_i_5 
       (.I0(A_0_payload_B[17]),
        .I1(A_0_payload_A[17]),
        .I2(A_0_sel),
        .O(A_0_data_out[17]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[24]_i_2 
       (.I0(A_0_payload_B[24]),
        .I1(A_0_payload_A[24]),
        .I2(A_0_sel),
        .O(A_0_data_out[24]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[24]_i_3 
       (.I0(A_0_payload_B[23]),
        .I1(A_0_payload_A[23]),
        .I2(A_0_sel),
        .O(A_0_data_out[23]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[24]_i_4 
       (.I0(A_0_payload_B[22]),
        .I1(A_0_payload_A[22]),
        .I2(A_0_sel),
        .O(A_0_data_out[22]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[24]_i_5 
       (.I0(A_0_payload_B[21]),
        .I1(A_0_payload_A[21]),
        .I2(A_0_sel),
        .O(A_0_data_out[21]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[28]_i_2 
       (.I0(A_0_payload_B[28]),
        .I1(A_0_payload_A[28]),
        .I2(A_0_sel),
        .O(A_0_data_out[28]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[28]_i_3 
       (.I0(A_0_payload_B[27]),
        .I1(A_0_payload_A[27]),
        .I2(A_0_sel),
        .O(A_0_data_out[27]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[28]_i_4 
       (.I0(A_0_payload_B[26]),
        .I1(A_0_payload_A[26]),
        .I2(A_0_sel),
        .O(A_0_data_out[26]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[28]_i_5 
       (.I0(A_0_payload_B[25]),
        .I1(A_0_payload_A[25]),
        .I2(A_0_sel),
        .O(A_0_data_out[25]));
  LUT3 #(
    .INIT(8'h0D)) 
    \B_1_payload_A[31]_i_1 
       (.I0(B_TVALID),
        .I1(B_1_ack_in),
        .I2(B_1_sel_wr),
        .O(\B_1_payload_A[31]_i_1_n_2 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[31]_i_3 
       (.I0(A_0_payload_B[31]),
        .I1(A_0_payload_A[31]),
        .I2(A_0_sel),
        .O(A_0_data_out[31]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[31]_i_4 
       (.I0(A_0_payload_B[30]),
        .I1(A_0_payload_A[30]),
        .I2(A_0_sel),
        .O(A_0_data_out[30]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[31]_i_5 
       (.I0(A_0_payload_B[29]),
        .I1(A_0_payload_A[29]),
        .I2(A_0_sel),
        .O(A_0_data_out[29]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[4]_i_2 
       (.I0(A_0_payload_B[0]),
        .I1(A_0_payload_A[0]),
        .I2(A_0_sel),
        .O(A_0_data_out[0]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[4]_i_3 
       (.I0(A_0_payload_B[4]),
        .I1(A_0_payload_A[4]),
        .I2(A_0_sel),
        .O(A_0_data_out[4]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[4]_i_4 
       (.I0(A_0_payload_B[3]),
        .I1(A_0_payload_A[3]),
        .I2(A_0_sel),
        .O(A_0_data_out[3]));
  LUT3 #(
    .INIT(8'h53)) 
    \B_1_payload_A[4]_i_5 
       (.I0(A_0_payload_B[2]),
        .I1(A_0_payload_A[2]),
        .I2(A_0_sel),
        .O(\B_1_payload_A[4]_i_5_n_2 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[4]_i_6 
       (.I0(A_0_payload_B[1]),
        .I1(A_0_payload_A[1]),
        .I2(A_0_sel),
        .O(A_0_data_out[1]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[8]_i_2 
       (.I0(A_0_payload_B[8]),
        .I1(A_0_payload_A[8]),
        .I2(A_0_sel),
        .O(A_0_data_out[8]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[8]_i_3 
       (.I0(A_0_payload_B[7]),
        .I1(A_0_payload_A[7]),
        .I2(A_0_sel),
        .O(A_0_data_out[7]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[8]_i_4 
       (.I0(A_0_payload_B[6]),
        .I1(A_0_payload_A[6]),
        .I2(A_0_sel),
        .O(A_0_data_out[6]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_1_payload_A[8]_i_5 
       (.I0(A_0_payload_B[5]),
        .I1(A_0_payload_A[5]),
        .I2(A_0_sel),
        .O(A_0_data_out[5]));
  FDRE \B_1_payload_A_reg[0] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[0]),
        .Q(B_1_payload_A[0]),
        .R(1'b0));
  FDRE \B_1_payload_A_reg[10] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[10]),
        .Q(B_1_payload_A[10]),
        .R(1'b0));
  FDRE \B_1_payload_A_reg[11] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[11]),
        .Q(B_1_payload_A[11]),
        .R(1'b0));
  FDRE \B_1_payload_A_reg[12] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[12]),
        .Q(B_1_payload_A[12]),
        .R(1'b0));
  CARRY4 \B_1_payload_A_reg[12]_i_1 
       (.CI(\B_1_payload_A_reg[8]_i_1_n_2 ),
        .CO({\B_1_payload_A_reg[12]_i_1_n_2 ,\B_1_payload_A_reg[12]_i_1_n_3 ,\B_1_payload_A_reg[12]_i_1_n_4 ,\B_1_payload_A_reg[12]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(tmp_1_fu_74_p2[12:9]),
        .S(A_0_data_out[12:9]));
  FDRE \B_1_payload_A_reg[13] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[13]),
        .Q(B_1_payload_A[13]),
        .R(1'b0));
  FDRE \B_1_payload_A_reg[14] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[14]),
        .Q(B_1_payload_A[14]),
        .R(1'b0));
  FDRE \B_1_payload_A_reg[15] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[15]),
        .Q(B_1_payload_A[15]),
        .R(1'b0));
  FDRE \B_1_payload_A_reg[16] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[16]),
        .Q(B_1_payload_A[16]),
        .R(1'b0));
  CARRY4 \B_1_payload_A_reg[16]_i_1 
       (.CI(\B_1_payload_A_reg[12]_i_1_n_2 ),
        .CO({\B_1_payload_A_reg[16]_i_1_n_2 ,\B_1_payload_A_reg[16]_i_1_n_3 ,\B_1_payload_A_reg[16]_i_1_n_4 ,\B_1_payload_A_reg[16]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(tmp_1_fu_74_p2[16:13]),
        .S(A_0_data_out[16:13]));
  FDRE \B_1_payload_A_reg[17] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[17]),
        .Q(B_1_payload_A[17]),
        .R(1'b0));
  FDRE \B_1_payload_A_reg[18] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[18]),
        .Q(B_1_payload_A[18]),
        .R(1'b0));
  FDRE \B_1_payload_A_reg[19] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[19]),
        .Q(B_1_payload_A[19]),
        .R(1'b0));
  FDRE \B_1_payload_A_reg[1] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[1]),
        .Q(B_1_payload_A[1]),
        .R(1'b0));
  FDRE \B_1_payload_A_reg[20] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[20]),
        .Q(B_1_payload_A[20]),
        .R(1'b0));
  CARRY4 \B_1_payload_A_reg[20]_i_1 
       (.CI(\B_1_payload_A_reg[16]_i_1_n_2 ),
        .CO({\B_1_payload_A_reg[20]_i_1_n_2 ,\B_1_payload_A_reg[20]_i_1_n_3 ,\B_1_payload_A_reg[20]_i_1_n_4 ,\B_1_payload_A_reg[20]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(tmp_1_fu_74_p2[20:17]),
        .S(A_0_data_out[20:17]));
  FDRE \B_1_payload_A_reg[21] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[21]),
        .Q(B_1_payload_A[21]),
        .R(1'b0));
  FDRE \B_1_payload_A_reg[22] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[22]),
        .Q(B_1_payload_A[22]),
        .R(1'b0));
  FDRE \B_1_payload_A_reg[23] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[23]),
        .Q(B_1_payload_A[23]),
        .R(1'b0));
  FDRE \B_1_payload_A_reg[24] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[24]),
        .Q(B_1_payload_A[24]),
        .R(1'b0));
  CARRY4 \B_1_payload_A_reg[24]_i_1 
       (.CI(\B_1_payload_A_reg[20]_i_1_n_2 ),
        .CO({\B_1_payload_A_reg[24]_i_1_n_2 ,\B_1_payload_A_reg[24]_i_1_n_3 ,\B_1_payload_A_reg[24]_i_1_n_4 ,\B_1_payload_A_reg[24]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(tmp_1_fu_74_p2[24:21]),
        .S(A_0_data_out[24:21]));
  FDRE \B_1_payload_A_reg[25] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[25]),
        .Q(B_1_payload_A[25]),
        .R(1'b0));
  FDRE \B_1_payload_A_reg[26] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[26]),
        .Q(B_1_payload_A[26]),
        .R(1'b0));
  FDRE \B_1_payload_A_reg[27] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[27]),
        .Q(B_1_payload_A[27]),
        .R(1'b0));
  FDRE \B_1_payload_A_reg[28] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[28]),
        .Q(B_1_payload_A[28]),
        .R(1'b0));
  CARRY4 \B_1_payload_A_reg[28]_i_1 
       (.CI(\B_1_payload_A_reg[24]_i_1_n_2 ),
        .CO({\B_1_payload_A_reg[28]_i_1_n_2 ,\B_1_payload_A_reg[28]_i_1_n_3 ,\B_1_payload_A_reg[28]_i_1_n_4 ,\B_1_payload_A_reg[28]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(tmp_1_fu_74_p2[28:25]),
        .S(A_0_data_out[28:25]));
  FDRE \B_1_payload_A_reg[29] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[29]),
        .Q(B_1_payload_A[29]),
        .R(1'b0));
  FDRE \B_1_payload_A_reg[2] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[2]),
        .Q(B_1_payload_A[2]),
        .R(1'b0));
  FDRE \B_1_payload_A_reg[30] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[30]),
        .Q(B_1_payload_A[30]),
        .R(1'b0));
  FDRE \B_1_payload_A_reg[31] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[31]),
        .Q(B_1_payload_A[31]),
        .R(1'b0));
  CARRY4 \B_1_payload_A_reg[31]_i_2 
       (.CI(\B_1_payload_A_reg[28]_i_1_n_2 ),
        .CO({\NLW_B_1_payload_A_reg[31]_i_2_CO_UNCONNECTED [3:2],\B_1_payload_A_reg[31]_i_2_n_4 ,\B_1_payload_A_reg[31]_i_2_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_B_1_payload_A_reg[31]_i_2_O_UNCONNECTED [3],tmp_1_fu_74_p2[31:29]}),
        .S({1'b0,A_0_data_out[31:29]}));
  FDRE \B_1_payload_A_reg[3] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[3]),
        .Q(B_1_payload_A[3]),
        .R(1'b0));
  FDRE \B_1_payload_A_reg[4] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[4]),
        .Q(B_1_payload_A[4]),
        .R(1'b0));
  CARRY4 \B_1_payload_A_reg[4]_i_1 
       (.CI(1'b0),
        .CO({\B_1_payload_A_reg[4]_i_1_n_2 ,\B_1_payload_A_reg[4]_i_1_n_3 ,\B_1_payload_A_reg[4]_i_1_n_4 ,\B_1_payload_A_reg[4]_i_1_n_5 }),
        .CYINIT(A_0_data_out[0]),
        .DI({1'b0,1'b0,1'b1,1'b0}),
        .O(tmp_1_fu_74_p2[4:1]),
        .S({A_0_data_out[4:3],\B_1_payload_A[4]_i_5_n_2 ,A_0_data_out[1]}));
  FDRE \B_1_payload_A_reg[5] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[5]),
        .Q(B_1_payload_A[5]),
        .R(1'b0));
  FDRE \B_1_payload_A_reg[6] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[6]),
        .Q(B_1_payload_A[6]),
        .R(1'b0));
  FDRE \B_1_payload_A_reg[7] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[7]),
        .Q(B_1_payload_A[7]),
        .R(1'b0));
  FDRE \B_1_payload_A_reg[8] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[8]),
        .Q(B_1_payload_A[8]),
        .R(1'b0));
  CARRY4 \B_1_payload_A_reg[8]_i_1 
       (.CI(\B_1_payload_A_reg[4]_i_1_n_2 ),
        .CO({\B_1_payload_A_reg[8]_i_1_n_2 ,\B_1_payload_A_reg[8]_i_1_n_3 ,\B_1_payload_A_reg[8]_i_1_n_4 ,\B_1_payload_A_reg[8]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(tmp_1_fu_74_p2[8:5]),
        .S(A_0_data_out[8:5]));
  FDRE \B_1_payload_A_reg[9] 
       (.C(ap_clk),
        .CE(\B_1_payload_A[31]_i_1_n_2 ),
        .D(tmp_1_fu_74_p2[9]),
        .Q(B_1_payload_A[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hA2)) 
    \B_1_payload_B[31]_i_1 
       (.I0(B_1_sel_wr),
        .I1(B_TVALID),
        .I2(B_1_ack_in),
        .O(B_1_load_B));
  FDRE \B_1_payload_B_reg[0] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[0]),
        .Q(B_1_payload_B[0]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[10] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[10]),
        .Q(B_1_payload_B[10]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[11] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[11]),
        .Q(B_1_payload_B[11]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[12] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[12]),
        .Q(B_1_payload_B[12]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[13] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[13]),
        .Q(B_1_payload_B[13]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[14] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[14]),
        .Q(B_1_payload_B[14]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[15] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[15]),
        .Q(B_1_payload_B[15]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[16] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[16]),
        .Q(B_1_payload_B[16]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[17] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[17]),
        .Q(B_1_payload_B[17]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[18] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[18]),
        .Q(B_1_payload_B[18]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[19] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[19]),
        .Q(B_1_payload_B[19]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[1] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[1]),
        .Q(B_1_payload_B[1]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[20] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[20]),
        .Q(B_1_payload_B[20]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[21] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[21]),
        .Q(B_1_payload_B[21]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[22] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[22]),
        .Q(B_1_payload_B[22]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[23] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[23]),
        .Q(B_1_payload_B[23]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[24] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[24]),
        .Q(B_1_payload_B[24]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[25] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[25]),
        .Q(B_1_payload_B[25]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[26] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[26]),
        .Q(B_1_payload_B[26]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[27] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[27]),
        .Q(B_1_payload_B[27]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[28] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[28]),
        .Q(B_1_payload_B[28]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[29] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[29]),
        .Q(B_1_payload_B[29]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[2] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[2]),
        .Q(B_1_payload_B[2]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[30] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[30]),
        .Q(B_1_payload_B[30]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[31] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[31]),
        .Q(B_1_payload_B[31]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[3] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[3]),
        .Q(B_1_payload_B[3]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[4] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[4]),
        .Q(B_1_payload_B[4]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[5] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[5]),
        .Q(B_1_payload_B[5]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[6] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[6]),
        .Q(B_1_payload_B[6]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[7] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[7]),
        .Q(B_1_payload_B[7]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[8] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[8]),
        .Q(B_1_payload_B[8]),
        .R(1'b0));
  FDRE \B_1_payload_B_reg[9] 
       (.C(ap_clk),
        .CE(B_1_load_B),
        .D(tmp_1_fu_74_p2[9]),
        .Q(B_1_payload_B[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h78)) 
    B_1_sel_rd_i_1
       (.I0(B_TVALID),
        .I1(B_TREADY),
        .I2(B_1_sel),
        .O(B_1_sel_rd_i_1_n_2));
  FDRE #(
    .INIT(1'b0)) 
    B_1_sel_rd_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(B_1_sel_rd_i_1_n_2),
        .Q(B_1_sel),
        .R(ap_rst_n_inv));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    B_1_sel_wr_i_1
       (.I0(ap_CS_fsm_state3),
        .I1(B_1_ack_in),
        .I2(\A_0_state_reg_n_2_[0] ),
        .I3(B_1_sel_wr),
        .O(B_1_sel_wr_i_1_n_2));
  FDRE #(
    .INIT(1'b0)) 
    B_1_sel_wr_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(B_1_sel_wr_i_1_n_2),
        .Q(B_1_sel_wr),
        .R(ap_rst_n_inv));
  LUT6 #(
    .INIT(64'hA8A8088808880888)) 
    \B_1_state[0]_i_1 
       (.I0(ap_rst_n),
        .I1(B_TVALID),
        .I2(B_1_ack_in),
        .I3(B_TREADY),
        .I4(\A_0_state_reg_n_2_[0] ),
        .I5(ap_CS_fsm_state3),
        .O(\B_1_state[0]_i_1_n_2 ));
  LUT5 #(
    .INIT(32'hF7FFF0FF)) 
    \B_1_state[1]_i_1 
       (.I0(\A_0_state_reg_n_2_[0] ),
        .I1(ap_CS_fsm_state3),
        .I2(B_TREADY),
        .I3(B_TVALID),
        .I4(B_1_ack_in),
        .O(\B_1_state[1]_i_1_n_2 ));
  FDRE #(
    .INIT(1'b0)) 
    \B_1_state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\B_1_state[0]_i_1_n_2 ),
        .Q(B_TVALID),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \B_1_state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\B_1_state[1]_i_1_n_2 ),
        .Q(B_1_ack_in),
        .R(ap_rst_n_inv));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[0]_INST_0 
       (.I0(B_1_payload_B[0]),
        .I1(B_1_payload_A[0]),
        .I2(B_1_sel),
        .O(B_TDATA[0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[10]_INST_0 
       (.I0(B_1_payload_B[10]),
        .I1(B_1_payload_A[10]),
        .I2(B_1_sel),
        .O(B_TDATA[10]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[11]_INST_0 
       (.I0(B_1_payload_B[11]),
        .I1(B_1_payload_A[11]),
        .I2(B_1_sel),
        .O(B_TDATA[11]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[12]_INST_0 
       (.I0(B_1_payload_B[12]),
        .I1(B_1_payload_A[12]),
        .I2(B_1_sel),
        .O(B_TDATA[12]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[13]_INST_0 
       (.I0(B_1_payload_B[13]),
        .I1(B_1_payload_A[13]),
        .I2(B_1_sel),
        .O(B_TDATA[13]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[14]_INST_0 
       (.I0(B_1_payload_B[14]),
        .I1(B_1_payload_A[14]),
        .I2(B_1_sel),
        .O(B_TDATA[14]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[15]_INST_0 
       (.I0(B_1_payload_B[15]),
        .I1(B_1_payload_A[15]),
        .I2(B_1_sel),
        .O(B_TDATA[15]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[16]_INST_0 
       (.I0(B_1_payload_B[16]),
        .I1(B_1_payload_A[16]),
        .I2(B_1_sel),
        .O(B_TDATA[16]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[17]_INST_0 
       (.I0(B_1_payload_B[17]),
        .I1(B_1_payload_A[17]),
        .I2(B_1_sel),
        .O(B_TDATA[17]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[18]_INST_0 
       (.I0(B_1_payload_B[18]),
        .I1(B_1_payload_A[18]),
        .I2(B_1_sel),
        .O(B_TDATA[18]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[19]_INST_0 
       (.I0(B_1_payload_B[19]),
        .I1(B_1_payload_A[19]),
        .I2(B_1_sel),
        .O(B_TDATA[19]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[1]_INST_0 
       (.I0(B_1_payload_B[1]),
        .I1(B_1_payload_A[1]),
        .I2(B_1_sel),
        .O(B_TDATA[1]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[20]_INST_0 
       (.I0(B_1_payload_B[20]),
        .I1(B_1_payload_A[20]),
        .I2(B_1_sel),
        .O(B_TDATA[20]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[21]_INST_0 
       (.I0(B_1_payload_B[21]),
        .I1(B_1_payload_A[21]),
        .I2(B_1_sel),
        .O(B_TDATA[21]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[22]_INST_0 
       (.I0(B_1_payload_B[22]),
        .I1(B_1_payload_A[22]),
        .I2(B_1_sel),
        .O(B_TDATA[22]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[23]_INST_0 
       (.I0(B_1_payload_B[23]),
        .I1(B_1_payload_A[23]),
        .I2(B_1_sel),
        .O(B_TDATA[23]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[24]_INST_0 
       (.I0(B_1_payload_B[24]),
        .I1(B_1_payload_A[24]),
        .I2(B_1_sel),
        .O(B_TDATA[24]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[25]_INST_0 
       (.I0(B_1_payload_B[25]),
        .I1(B_1_payload_A[25]),
        .I2(B_1_sel),
        .O(B_TDATA[25]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[26]_INST_0 
       (.I0(B_1_payload_B[26]),
        .I1(B_1_payload_A[26]),
        .I2(B_1_sel),
        .O(B_TDATA[26]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[27]_INST_0 
       (.I0(B_1_payload_B[27]),
        .I1(B_1_payload_A[27]),
        .I2(B_1_sel),
        .O(B_TDATA[27]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[28]_INST_0 
       (.I0(B_1_payload_B[28]),
        .I1(B_1_payload_A[28]),
        .I2(B_1_sel),
        .O(B_TDATA[28]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[29]_INST_0 
       (.I0(B_1_payload_B[29]),
        .I1(B_1_payload_A[29]),
        .I2(B_1_sel),
        .O(B_TDATA[29]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[2]_INST_0 
       (.I0(B_1_payload_B[2]),
        .I1(B_1_payload_A[2]),
        .I2(B_1_sel),
        .O(B_TDATA[2]));
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[30]_INST_0 
       (.I0(B_1_payload_B[30]),
        .I1(B_1_payload_A[30]),
        .I2(B_1_sel),
        .O(B_TDATA[30]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[31]_INST_0 
       (.I0(B_1_payload_B[31]),
        .I1(B_1_payload_A[31]),
        .I2(B_1_sel),
        .O(B_TDATA[31]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[3]_INST_0 
       (.I0(B_1_payload_B[3]),
        .I1(B_1_payload_A[3]),
        .I2(B_1_sel),
        .O(B_TDATA[3]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[4]_INST_0 
       (.I0(B_1_payload_B[4]),
        .I1(B_1_payload_A[4]),
        .I2(B_1_sel),
        .O(B_TDATA[4]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[5]_INST_0 
       (.I0(B_1_payload_B[5]),
        .I1(B_1_payload_A[5]),
        .I2(B_1_sel),
        .O(B_TDATA[5]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[6]_INST_0 
       (.I0(B_1_payload_B[6]),
        .I1(B_1_payload_A[6]),
        .I2(B_1_sel),
        .O(B_TDATA[6]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[7]_INST_0 
       (.I0(B_1_payload_B[7]),
        .I1(B_1_payload_A[7]),
        .I2(B_1_sel),
        .O(B_TDATA[7]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[8]_INST_0 
       (.I0(B_1_payload_B[8]),
        .I1(B_1_payload_A[8]),
        .I2(B_1_sel),
        .O(B_TDATA[8]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \B_TDATA[9]_INST_0 
       (.I0(B_1_payload_B[9]),
        .I1(B_1_payload_A[9]),
        .I2(B_1_sel),
        .O(B_TDATA[9]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hF4444444)) 
    \ap_CS_fsm[0]_i_1 
       (.I0(ap_start),
        .I1(\ap_CS_fsm_reg_n_2_[0] ),
        .I2(B_1_ack_in),
        .I3(ap_CS_fsm_state2),
        .I4(exitcond_fu_62_p2),
        .O(ap_NS_fsm[0]));
  LUT5 #(
    .INIT(32'hFFEAC0EA)) 
    \ap_CS_fsm[1]_i_1 
       (.I0(ap_CS_fsm_state2),
        .I1(\ap_CS_fsm_reg_n_2_[0] ),
        .I2(ap_start),
        .I3(B_1_ack_in),
        .I4(ap_CS_fsm_state4),
        .O(ap_NS_fsm[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h44F0F4F0)) 
    \ap_CS_fsm[2]_i_1 
       (.I0(exitcond_fu_62_p2),
        .I1(ap_CS_fsm_state2),
        .I2(ap_CS_fsm_state3),
        .I3(B_1_ack_in),
        .I4(\A_0_state_reg_n_2_[0] ),
        .O(ap_NS_fsm[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \ap_CS_fsm[3]_i_1 
       (.I0(ap_CS_fsm_state3),
        .I1(\A_0_state_reg_n_2_[0] ),
        .I2(B_1_ack_in),
        .I3(ap_CS_fsm_state4),
        .O(ap_NS_fsm[3]));
  (* FSM_ENCODING = "none" *) 
  FDSE #(
    .INIT(1'b1)) 
    \ap_CS_fsm_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[0]),
        .Q(\ap_CS_fsm_reg_n_2_[0] ),
        .S(ap_rst_n_inv));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[1]),
        .Q(ap_CS_fsm_state2),
        .R(ap_rst_n_inv));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[2]),
        .Q(ap_CS_fsm_state3),
        .R(ap_rst_n_inv));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[3] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[3]),
        .Q(ap_CS_fsm_state4),
        .R(ap_rst_n_inv));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    ap_idle_INST_0
       (.I0(\ap_CS_fsm_reg_n_2_[0] ),
        .I1(ap_start),
        .O(ap_idle));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h80)) 
    ap_ready_INST_0
       (.I0(B_1_ack_in),
        .I1(ap_CS_fsm_state2),
        .I2(exitcond_fu_62_p2),
        .O(ap_done));
  LUT6 #(
    .INIT(64'h0000100000000000)) 
    ap_ready_INST_0_i_1
       (.I0(\i_reg_51_reg_n_2_[0] ),
        .I1(\i_reg_51_reg_n_2_[2] ),
        .I2(\i_reg_51_reg_n_2_[1] ),
        .I3(\i_reg_51_reg_n_2_[5] ),
        .I4(\i_reg_51_reg_n_2_[3] ),
        .I5(\i_reg_51_reg_n_2_[4] ),
        .O(exitcond_fu_62_p2));
  LUT1 #(
    .INIT(2'h1)) 
    \i_1_reg_84[0]_i_1 
       (.I0(\i_reg_51_reg_n_2_[0] ),
        .O(i_1_fu_68_p2[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \i_1_reg_84[1]_i_1 
       (.I0(\i_reg_51_reg_n_2_[0] ),
        .I1(\i_reg_51_reg_n_2_[1] ),
        .O(i_1_fu_68_p2[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \i_1_reg_84[2]_i_1 
       (.I0(\i_reg_51_reg_n_2_[0] ),
        .I1(\i_reg_51_reg_n_2_[1] ),
        .I2(\i_reg_51_reg_n_2_[2] ),
        .O(i_1_fu_68_p2[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \i_1_reg_84[3]_i_1 
       (.I0(\i_reg_51_reg_n_2_[1] ),
        .I1(\i_reg_51_reg_n_2_[0] ),
        .I2(\i_reg_51_reg_n_2_[2] ),
        .I3(\i_reg_51_reg_n_2_[3] ),
        .O(i_1_fu_68_p2[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \i_1_reg_84[4]_i_1 
       (.I0(\i_reg_51_reg_n_2_[2] ),
        .I1(\i_reg_51_reg_n_2_[0] ),
        .I2(\i_reg_51_reg_n_2_[1] ),
        .I3(\i_reg_51_reg_n_2_[3] ),
        .I4(\i_reg_51_reg_n_2_[4] ),
        .O(i_1_fu_68_p2[4]));
  LUT2 #(
    .INIT(4'h8)) 
    \i_1_reg_84[5]_i_1 
       (.I0(ap_CS_fsm_state2),
        .I1(B_1_ack_in),
        .O(i_1_reg_840));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \i_1_reg_84[5]_i_2 
       (.I0(\i_reg_51_reg_n_2_[3] ),
        .I1(\i_reg_51_reg_n_2_[1] ),
        .I2(\i_reg_51_reg_n_2_[0] ),
        .I3(\i_reg_51_reg_n_2_[2] ),
        .I4(\i_reg_51_reg_n_2_[4] ),
        .I5(\i_reg_51_reg_n_2_[5] ),
        .O(i_1_fu_68_p2[5]));
  FDRE \i_1_reg_84_reg[0] 
       (.C(ap_clk),
        .CE(i_1_reg_840),
        .D(i_1_fu_68_p2[0]),
        .Q(i_1_reg_84[0]),
        .R(1'b0));
  FDRE \i_1_reg_84_reg[1] 
       (.C(ap_clk),
        .CE(i_1_reg_840),
        .D(i_1_fu_68_p2[1]),
        .Q(i_1_reg_84[1]),
        .R(1'b0));
  FDRE \i_1_reg_84_reg[2] 
       (.C(ap_clk),
        .CE(i_1_reg_840),
        .D(i_1_fu_68_p2[2]),
        .Q(i_1_reg_84[2]),
        .R(1'b0));
  FDRE \i_1_reg_84_reg[3] 
       (.C(ap_clk),
        .CE(i_1_reg_840),
        .D(i_1_fu_68_p2[3]),
        .Q(i_1_reg_84[3]),
        .R(1'b0));
  FDRE \i_1_reg_84_reg[4] 
       (.C(ap_clk),
        .CE(i_1_reg_840),
        .D(i_1_fu_68_p2[4]),
        .Q(i_1_reg_84[4]),
        .R(1'b0));
  FDRE \i_1_reg_84_reg[5] 
       (.C(ap_clk),
        .CE(i_1_reg_840),
        .D(i_1_fu_68_p2[5]),
        .Q(i_1_reg_84[5]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0888)) 
    \i_reg_51[5]_i_1 
       (.I0(\ap_CS_fsm_reg_n_2_[0] ),
        .I1(ap_start),
        .I2(ap_CS_fsm_state4),
        .I3(B_1_ack_in),
        .O(i_reg_51));
  LUT2 #(
    .INIT(4'h8)) 
    \i_reg_51[5]_i_2 
       (.I0(B_1_ack_in),
        .I1(ap_CS_fsm_state4),
        .O(ap_NS_fsm1));
  FDRE \i_reg_51_reg[0] 
       (.C(ap_clk),
        .CE(ap_NS_fsm1),
        .D(i_1_reg_84[0]),
        .Q(\i_reg_51_reg_n_2_[0] ),
        .R(i_reg_51));
  FDRE \i_reg_51_reg[1] 
       (.C(ap_clk),
        .CE(ap_NS_fsm1),
        .D(i_1_reg_84[1]),
        .Q(\i_reg_51_reg_n_2_[1] ),
        .R(i_reg_51));
  FDRE \i_reg_51_reg[2] 
       (.C(ap_clk),
        .CE(ap_NS_fsm1),
        .D(i_1_reg_84[2]),
        .Q(\i_reg_51_reg_n_2_[2] ),
        .R(i_reg_51));
  FDRE \i_reg_51_reg[3] 
       (.C(ap_clk),
        .CE(ap_NS_fsm1),
        .D(i_1_reg_84[3]),
        .Q(\i_reg_51_reg_n_2_[3] ),
        .R(i_reg_51));
  FDRE \i_reg_51_reg[4] 
       (.C(ap_clk),
        .CE(ap_NS_fsm1),
        .D(i_1_reg_84[4]),
        .Q(\i_reg_51_reg_n_2_[4] ),
        .R(i_reg_51));
  FDRE \i_reg_51_reg[5] 
       (.C(ap_clk),
        .CE(ap_NS_fsm1),
        .D(i_1_reg_84[5]),
        .Q(\i_reg_51_reg_n_2_[5] ),
        .R(i_reg_51));
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
