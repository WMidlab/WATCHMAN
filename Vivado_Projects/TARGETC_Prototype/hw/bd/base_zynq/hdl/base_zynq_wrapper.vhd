--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
--Date        : Sat Feb  2 12:21:41 2019
--Host        : jonathan-Latitude-E7450 running 64-bit Linux Mint 18.1 Serena
--Command     : generate_target base_zynq_wrapper.bd
--Design      : base_zynq_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_wrapper is
  port (
    BB1 : out STD_LOGIC;
    BB2 : out STD_LOGIC;
    BB3 : out STD_LOGIC;
    BB4 : out STD_LOGIC;
    BB5 : out STD_LOGIC;
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DONE : in STD_LOGIC;
    DO_1 : in STD_LOGIC;
    DO_10 : in STD_LOGIC;
    DO_11 : in STD_LOGIC;
    DO_12 : in STD_LOGIC;
    DO_13 : in STD_LOGIC;
    DO_14 : in STD_LOGIC;
    DO_15 : in STD_LOGIC;
    DO_16 : in STD_LOGIC;
    DO_2 : in STD_LOGIC;
    DO_3 : in STD_LOGIC;
    DO_4 : in STD_LOGIC;
    DO_5 : in STD_LOGIC;
    DO_6 : in STD_LOGIC;
    DO_7 : in STD_LOGIC;
    DO_8 : in STD_LOGIC;
    DO_9 : in STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    GCC_RESET : out STD_LOGIC;
    HCMPA : out STD_LOGIC_VECTOR ( 0 to 0 );
    HCMPB : out STD_LOGIC_VECTOR ( 0 to 0 );
    HCMPC : out STD_LOGIC_VECTOR ( 0 to 0 );
    HCMPD : out STD_LOGIC_VECTOR ( 0 to 0 );
    HSCLK_N : out STD_LOGIC;
    HSCLK_P : out STD_LOGIC;
    MONTIMING_N : in STD_LOGIC;
    MONTIMING_P : in STD_LOGIC;
    PCLK : out STD_LOGIC;
    RAMP : out STD_LOGIC;
    RDAD_CLK : out STD_LOGIC;
    RDAD_DIR : out STD_LOGIC;
    RDAD_SIN : out STD_LOGIC;
    REGCLR : out STD_LOGIC;
    SAMPLESEL_ANY : out STD_LOGIC;
    SCL : inout STD_LOGIC;
    SCLK : out STD_LOGIC;
    SDA : inout STD_LOGIC;
    SHOUT : in STD_LOGIC;
    SIN : out STD_LOGIC;
    SSTIN_N : out STD_LOGIC;
    SSTIN_P : out STD_LOGIC;
    SS_INCR : out STD_LOGIC;
    SS_LD_DIR : out STD_LOGIC;
    SS_LD_SIN : out STD_LOGIC;
    SS_RESET : out STD_LOGIC;
    TRIGA : in STD_LOGIC;
    TRIGB : in STD_LOGIC;
    TRIGC : in STD_LOGIC;
    TRIGD : in STD_LOGIC;
    WL_CLK_N : out STD_LOGIC;
    WL_CLK_P : out STD_LOGIC;
    WR_CS_S0 : out STD_LOGIC;
    WR_CS_S1 : out STD_LOGIC;
    WR_CS_S2 : out STD_LOGIC;
    WR_CS_S3 : out STD_LOGIC;
    WR_CS_S4 : out STD_LOGIC;
    WR_CS_S5 : out STD_LOGIC;
    WR_RS_S0 : out STD_LOGIC;
    WR_RS_S1 : out STD_LOGIC
  );
end base_zynq_wrapper;

architecture STRUCTURE of base_zynq_wrapper is
  component base_zynq is
  port (
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    DO_16 : in STD_LOGIC;
    DO_15 : in STD_LOGIC;
    DO_1 : in STD_LOGIC;
    DO_2 : in STD_LOGIC;
    DO_3 : in STD_LOGIC;
    DO_4 : in STD_LOGIC;
    DO_5 : in STD_LOGIC;
    DO_6 : in STD_LOGIC;
    DO_7 : in STD_LOGIC;
    DO_14 : in STD_LOGIC;
    DO_13 : in STD_LOGIC;
    DO_12 : in STD_LOGIC;
    DO_11 : in STD_LOGIC;
    DO_10 : in STD_LOGIC;
    DO_8 : in STD_LOGIC;
    DO_9 : in STD_LOGIC;
    SDA : inout STD_LOGIC;
    SCL : inout STD_LOGIC;
    HCMPA : out STD_LOGIC_VECTOR ( 0 to 0 );
    HCMPB : out STD_LOGIC_VECTOR ( 0 to 0 );
    HCMPC : out STD_LOGIC_VECTOR ( 0 to 0 );
    HCMPD : out STD_LOGIC_VECTOR ( 0 to 0 );
    SIN : out STD_LOGIC;
    SCLK : out STD_LOGIC;
    PCLK : out STD_LOGIC;
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
    SS_INCR : out STD_LOGIC;
    SS_RESET : out STD_LOGIC;
    REGCLR : out STD_LOGIC;
    SS_LD_SIN : out STD_LOGIC;
    SS_LD_DIR : out STD_LOGIC;
    RAMP : out STD_LOGIC;
    SSTIN_P : out STD_LOGIC;
    SSTIN_N : out STD_LOGIC;
    BB1 : out STD_LOGIC;
    BB4 : out STD_LOGIC;
    BB2 : out STD_LOGIC;
    BB3 : out STD_LOGIC;
    BB5 : out STD_LOGIC;
    MONTIMING_P : in STD_LOGIC;
    DONE : in STD_LOGIC;
    SHOUT : in STD_LOGIC;
    MONTIMING_N : in STD_LOGIC;
    TRIGA : in STD_LOGIC;
    TRIGB : in STD_LOGIC;
    TRIGC : in STD_LOGIC;
    TRIGD : in STD_LOGIC
  );
  end component base_zynq;
begin
base_zynq_i: component base_zynq
     port map (
      BB1 => BB1,
      BB2 => BB2,
      BB3 => BB3,
      BB4 => BB4,
      BB5 => BB5,
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      DONE => DONE,
      DO_1 => DO_1,
      DO_10 => DO_10,
      DO_11 => DO_11,
      DO_12 => DO_12,
      DO_13 => DO_13,
      DO_14 => DO_14,
      DO_15 => DO_15,
      DO_16 => DO_16,
      DO_2 => DO_2,
      DO_3 => DO_3,
      DO_4 => DO_4,
      DO_5 => DO_5,
      DO_6 => DO_6,
      DO_7 => DO_7,
      DO_8 => DO_8,
      DO_9 => DO_9,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      GCC_RESET => GCC_RESET,
      HCMPA(0) => HCMPA(0),
      HCMPB(0) => HCMPB(0),
      HCMPC(0) => HCMPC(0),
      HCMPD(0) => HCMPD(0),
      HSCLK_N => HSCLK_N,
      HSCLK_P => HSCLK_P,
      MONTIMING_N => MONTIMING_N,
      MONTIMING_P => MONTIMING_P,
      PCLK => PCLK,
      RAMP => RAMP,
      RDAD_CLK => RDAD_CLK,
      RDAD_DIR => RDAD_DIR,
      RDAD_SIN => RDAD_SIN,
      REGCLR => REGCLR,
      SAMPLESEL_ANY => SAMPLESEL_ANY,
      SCL => SCL,
      SCLK => SCLK,
      SDA => SDA,
      SHOUT => SHOUT,
      SIN => SIN,
      SSTIN_N => SSTIN_N,
      SSTIN_P => SSTIN_P,
      SS_INCR => SS_INCR,
      SS_LD_DIR => SS_LD_DIR,
      SS_LD_SIN => SS_LD_SIN,
      SS_RESET => SS_RESET,
      TRIGA => TRIGA,
      TRIGB => TRIGB,
      TRIGC => TRIGC,
      TRIGD => TRIGD,
      WL_CLK_N => WL_CLK_N,
      WL_CLK_P => WL_CLK_P,
      WR_CS_S0 => WR_CS_S0,
      WR_CS_S1 => WR_CS_S1,
      WR_CS_S2 => WR_CS_S2,
      WR_CS_S3 => WR_CS_S3,
      WR_CS_S4 => WR_CS_S4,
      WR_CS_S5 => WR_CS_S5,
      WR_RS_S0 => WR_RS_S0,
      WR_RS_S1 => WR_RS_S1
    );
end STRUCTURE;
