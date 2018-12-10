
// file: CLK_MNG_WL.v
// 
// (c) Copyright 2008 - 2013 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
//----------------------------------------------------------------------------
// User entered comments
//----------------------------------------------------------------------------
// None
//
//----------------------------------------------------------------------------
//  Output     Output      Phase    Duty Cycle   Pk-to-Pk     Phase
//   Clock     Freq (MHz)  (degrees)    (%)     Jitter (ps)  Error (ps)
//----------------------------------------------------------------------------
// WL_CLK_300MHz___300.000______0.000______50.0_______79.341_____76.967
// WL_CLK_250MHz___250.000______0.000______50.0_______81.911_____76.967
// WL_CLK_200MHz___187.500______0.000______50.0_______86.155_____76.967
// WL_CLK_150MHz___150.000______0.000______50.0_______89.612_____76.967
// WL_CLK_100MHz___100.000______0.000______50.0_______96.283_____76.967
//
//----------------------------------------------------------------------------
// Input Clock   Freq (MHz)    Input Jitter (UI)
//----------------------------------------------------------------------------
// __primary_________100.000____________0.010

`timescale 1ps/1ps

module CLK_MNG_WL_clk_wiz 

 (// Clock in ports
  // Clock out ports
  output        WL_CLK_300MHz,
  output        WL_CLK_250MHz,
  output        WL_CLK_200MHz,
  output        WL_CLK_150MHz,
  output        WL_CLK_100MHz,
  // Status and control signals
  input         resetn,
  output        locked,
  input         REF_CLK_IN
 );
  // Input buffering
  //------------------------------------
wire REF_CLK_IN_CLK_MNG_WL;
wire clk_in2_CLK_MNG_WL;
  IBUF clkin1_ibufg
   (.O (REF_CLK_IN_CLK_MNG_WL),
    .I (REF_CLK_IN));




  // Clocking PRIMITIVE
  //------------------------------------

  // Instantiation of the MMCM PRIMITIVE
  //    * Unused inputs are tied off
  //    * Unused outputs are labeled unused

  wire        WL_CLK_300MHz_CLK_MNG_WL;
  wire        WL_CLK_250MHz_CLK_MNG_WL;
  wire        WL_CLK_200MHz_CLK_MNG_WL;
  wire        WL_CLK_150MHz_CLK_MNG_WL;
  wire        WL_CLK_100MHz_CLK_MNG_WL;
  wire        clk_out6_CLK_MNG_WL;
  wire        clk_out7_CLK_MNG_WL;

  wire [15:0] do_unused;
  wire        drdy_unused;
  wire        psdone_unused;
  wire        locked_int;
  wire        clkfbout_CLK_MNG_WL;
  wire        clkfbout_buf_CLK_MNG_WL;
  wire        clkfboutb_unused;
  wire        clkout5_unused;
  wire        clkout6_unused;
  wire        clkfbstopped_unused;
  wire        clkinstopped_unused;
  wire        reset_high;

  PLLE2_ADV
  #(.BANDWIDTH            ("OPTIMIZED"),
    .COMPENSATION         ("BUF_IN"),
    .STARTUP_WAIT         ("FALSE"),
    .DIVCLK_DIVIDE        (1),
    .CLKFBOUT_MULT        (15),
    .CLKFBOUT_PHASE       (0.000),
    .CLKOUT0_DIVIDE       (5),
    .CLKOUT0_PHASE        (0.000),
    .CLKOUT0_DUTY_CYCLE   (0.500),
    .CLKOUT1_DIVIDE       (6),
    .CLKOUT1_PHASE        (0.000),
    .CLKOUT1_DUTY_CYCLE   (0.500),
    .CLKOUT2_DIVIDE       (8),
    .CLKOUT2_PHASE        (0.000),
    .CLKOUT2_DUTY_CYCLE   (0.500),
    .CLKOUT3_DIVIDE       (10),
    .CLKOUT3_PHASE        (0.000),
    .CLKOUT3_DUTY_CYCLE   (0.500),
    .CLKOUT4_DIVIDE       (15),
    .CLKOUT4_PHASE        (0.000),
    .CLKOUT4_DUTY_CYCLE   (0.500),
    .CLKIN1_PERIOD        (10.000))
  plle2_adv_inst
    // Output clocks
   (
    .CLKFBOUT            (clkfbout_CLK_MNG_WL),
    .CLKOUT0             (WL_CLK_300MHz_CLK_MNG_WL),
    .CLKOUT1             (WL_CLK_250MHz_CLK_MNG_WL),
    .CLKOUT2             (WL_CLK_200MHz_CLK_MNG_WL),
    .CLKOUT3             (WL_CLK_150MHz_CLK_MNG_WL),
    .CLKOUT4             (WL_CLK_100MHz_CLK_MNG_WL),
    .CLKOUT5             (clkout5_unused),
     // Input clock control
    .CLKFBIN             (clkfbout_buf_CLK_MNG_WL),
    .CLKIN1              (REF_CLK_IN_CLK_MNG_WL),
    .CLKIN2              (1'b0),
     // Tied to always select the primary input clock
    .CLKINSEL            (1'b1),
    // Ports for dynamic reconfiguration
    .DADDR               (7'h0),
    .DCLK                (1'b0),
    .DEN                 (1'b0),
    .DI                  (16'h0),
    .DO                  (do_unused),
    .DRDY                (drdy_unused),
    .DWE                 (1'b0),
    // Other control and status signals
    .LOCKED              (locked_int),
    .PWRDWN              (1'b0),
    .RST                 (reset_high));
  assign reset_high = ~resetn; 

  assign locked = locked_int;
// Clock Monitor clock assigning
//--------------------------------------
 // Output buffering
  //-----------------------------------

  BUFG clkf_buf
   (.O (clkfbout_buf_CLK_MNG_WL),
    .I (clkfbout_CLK_MNG_WL));






  BUFG clkout1_buf
   (.O   (WL_CLK_300MHz),
    .I   (WL_CLK_300MHz_CLK_MNG_WL));


  BUFG clkout2_buf
   (.O   (WL_CLK_250MHz),
    .I   (WL_CLK_250MHz_CLK_MNG_WL));

  BUFG clkout3_buf
   (.O   (WL_CLK_200MHz),
    .I   (WL_CLK_200MHz_CLK_MNG_WL));

  BUFG clkout4_buf
   (.O   (WL_CLK_150MHz),
    .I   (WL_CLK_150MHz_CLK_MNG_WL));

  BUFG clkout5_buf
   (.O   (WL_CLK_100MHz),
    .I   (WL_CLK_100MHz_CLK_MNG_WL));



endmodule
