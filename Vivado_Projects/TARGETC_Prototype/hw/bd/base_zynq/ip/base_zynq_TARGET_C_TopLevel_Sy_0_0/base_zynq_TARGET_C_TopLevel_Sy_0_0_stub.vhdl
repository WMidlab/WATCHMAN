-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
-- Date        : Sat Feb  2 12:28:45 2019
-- Host        : jonathan-Latitude-E7450 running 64-bit Linux Mint 18.1 Serena
-- Command     : write_vhdl -force -mode synth_stub
--               /home/jonathan/VivadoProjects/00_WATCHMANN/TARGETC_Prototype/hw/bd/base_zynq/ip/base_zynq_TARGET_C_TopLevel_Sy_0_0/base_zynq_TARGET_C_TopLevel_Sy_0_0_stub.vhdl
-- Design      : base_zynq_TARGET_C_TopLevel_Sy_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity base_zynq_TARGET_C_TopLevel_Sy_0_0 is
  Port ( 
    SW_nRST : out STD_LOGIC;
    RefCLK_i1 : in STD_LOGIC;
    RefCLK_i2 : in STD_LOGIC;
    tc_axi_aclk : in STD_LOGIC;
    tc_axi_aresetn : in STD_LOGIC;
    tc_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    tc_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    tc_axi_awvalid : in STD_LOGIC;
    tc_axi_awready : out STD_LOGIC;
    tc_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    tc_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    tc_axi_wvalid : in STD_LOGIC;
    tc_axi_wready : out STD_LOGIC;
    tc_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    tc_axi_bvalid : out STD_LOGIC;
    tc_axi_bready : in STD_LOGIC;
    tc_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    tc_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    tc_axi_arvalid : in STD_LOGIC;
    tc_axi_arready : out STD_LOGIC;
    tc_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    tc_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    tc_axi_rvalid : out STD_LOGIC;
    tc_axi_rready : in STD_LOGIC;
    SIN : out STD_LOGIC;
    SCLK : out STD_LOGIC;
    PCLK : out STD_LOGIC;
    SHOUT : in STD_LOGIC;
    HSCLK_P : out STD_LOGIC;
    HSCLK_N : out STD_LOGIC;
    WR_RS_S0 : out STD_LOGIC;
    WR_RS_S1 : out STD_LOGIC;
    WR_CS_S0 : out STD_LOGIC;
    WR_CS_S1 : out STD_LOGIC;
    WR_CS_S2 : out STD_LOGIC;
    WR_CS_S3 : out STD_LOGIC;
    WR_CS_S4 : out STD_LOGIC;
    WR_CS_S5 : out STD_LOGIC;
    GCC_RESET : out STD_LOGIC;
    WL_CLK_P : out STD_LOGIC;
    WL_CLK_N : out STD_LOGIC;
    RDAD_CLK : out STD_LOGIC;
    RDAD_SIN : out STD_LOGIC;
    RDAD_DIR : out STD_LOGIC;
    SAMPLESEL_ANY : out STD_LOGIC;
    DO : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SS_INCR : out STD_LOGIC;
    DOE : out STD_LOGIC;
    DONE : in STD_LOGIC;
    SS_RESET : out STD_LOGIC;
    REGCLR : out STD_LOGIC;
    SS_LD_SIN : out STD_LOGIC;
    SS_LD_DIR : out STD_LOGIC;
    RAMP : out STD_LOGIC;
    SSTIN_P : out STD_LOGIC;
    SSTIN_N : out STD_LOGIC;
    MONTIMING_P : in STD_LOGIC;
    MONTIMING_N : in STD_LOGIC;
    Cnt_AXIS_DATA : in STD_LOGIC_VECTOR ( 9 downto 0 );
    CNT_CLR : out STD_LOGIC;
    FIFOvalid : out STD_LOGIC;
    FIFOdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    StreamReady : in STD_LOGIC;
    TrigA : in STD_LOGIC;
    TrigB : in STD_LOGIC;
    TrigC : in STD_LOGIC;
    TrigD : in STD_LOGIC;
    SSVALID_INTR : out STD_LOGIC;
    BB1 : out STD_LOGIC;
    BB2 : out STD_LOGIC;
    BB3 : out STD_LOGIC;
    BB4 : out STD_LOGIC;
    BB5 : out STD_LOGIC
  );

end base_zynq_TARGET_C_TopLevel_Sy_0_0;

architecture stub of base_zynq_TARGET_C_TopLevel_Sy_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "SW_nRST,RefCLK_i1,RefCLK_i2,tc_axi_aclk,tc_axi_aresetn,tc_axi_awaddr[31:0],tc_axi_awprot[2:0],tc_axi_awvalid,tc_axi_awready,tc_axi_wdata[31:0],tc_axi_wstrb[3:0],tc_axi_wvalid,tc_axi_wready,tc_axi_bresp[1:0],tc_axi_bvalid,tc_axi_bready,tc_axi_araddr[31:0],tc_axi_arprot[2:0],tc_axi_arvalid,tc_axi_arready,tc_axi_rdata[31:0],tc_axi_rresp[1:0],tc_axi_rvalid,tc_axi_rready,SIN,SCLK,PCLK,SHOUT,HSCLK_P,HSCLK_N,WR_RS_S0,WR_RS_S1,WR_CS_S0,WR_CS_S1,WR_CS_S2,WR_CS_S3,WR_CS_S4,WR_CS_S5,GCC_RESET,WL_CLK_P,WL_CLK_N,RDAD_CLK,RDAD_SIN,RDAD_DIR,SAMPLESEL_ANY,DO[15:0],SS_INCR,DOE,DONE,SS_RESET,REGCLR,SS_LD_SIN,SS_LD_DIR,RAMP,SSTIN_P,SSTIN_N,MONTIMING_P,MONTIMING_N,Cnt_AXIS_DATA[9:0],CNT_CLR,FIFOvalid,FIFOdata[31:0],StreamReady,TrigA,TrigB,TrigC,TrigD,SSVALID_INTR,BB1,BB2,BB3,BB4,BB5";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "TARGET_C_TopLevel_System,Vivado 2018.2";
begin
end;
