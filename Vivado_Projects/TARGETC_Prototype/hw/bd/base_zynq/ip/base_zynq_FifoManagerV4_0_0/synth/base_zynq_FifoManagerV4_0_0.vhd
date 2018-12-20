-- (c) Copyright 1995-2018 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:FifoManagerV4:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY base_zynq_FifoManagerV4_0_0 IS
  PORT (
    nRST : IN STD_LOGIC;
    CLK : IN STD_LOGIC;
    PRECvalid : IN STD_LOGIC;
    FIFOresponse : OUT STD_LOGIC;
    WDOTime : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    DIGTime : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    Trigger : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    WDONBR : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    CH0 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    CH1 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    CH2 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    CH3 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    CH4 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    CH5 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    CH6 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    CH7 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    CH8 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    CH9 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    CH10 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    CH11 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    CH12 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    CH13 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    CH14 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    CH15 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    FIFOvalid : OUT STD_LOGIC;
    ready_i : IN STD_LOGIC;
    PSBUSY_i : IN STD_LOGIC;
    DataOut : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END base_zynq_FifoManagerV4_0_0;

ARCHITECTURE base_zynq_FifoManagerV4_0_0_arch OF base_zynq_FifoManagerV4_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF base_zynq_FifoManagerV4_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT FifoManagerV4 IS
    GENERIC (
      C_M_AXIS_TDATA_WIDTH : INTEGER
    );
    PORT (
      nRST : IN STD_LOGIC;
      CLK : IN STD_LOGIC;
      PRECvalid : IN STD_LOGIC;
      FIFOresponse : OUT STD_LOGIC;
      WDOTime : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      DIGTime : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      Trigger : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      WDONBR : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      CH0 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      CH1 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      CH2 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      CH3 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      CH4 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      CH5 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      CH6 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      CH7 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      CH8 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      CH9 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      CH10 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      CH11 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      CH12 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      CH13 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      CH14 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      CH15 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      FIFOvalid : OUT STD_LOGIC;
      ready_i : IN STD_LOGIC;
      PSBUSY_i : IN STD_LOGIC;
      DataOut : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT FifoManagerV4;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF base_zynq_FifoManagerV4_0_0_arch: ARCHITECTURE IS "FifoManagerV4,Vivado 2018.2";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF base_zynq_FifoManagerV4_0_0_arch : ARCHITECTURE IS "base_zynq_FifoManagerV4_0_0,FifoManagerV4,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF base_zynq_FifoManagerV4_0_0_arch: ARCHITECTURE IS "base_zynq_FifoManagerV4_0_0,FifoManagerV4,{x_ipProduct=Vivado 2018.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=FifoManagerV4,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED,C_M_AXIS_TDATA_WIDTH=32}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF base_zynq_FifoManagerV4_0_0_arch: ARCHITECTURE IS "module_ref";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF CLK: SIGNAL IS "XIL_INTERFACENAME CLK, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN base_zynq_processing_system7_0_0_FCLK_CLK0";
  ATTRIBUTE X_INTERFACE_INFO OF CLK: SIGNAL IS "xilinx.com:signal:clock:1.0 CLK CLK";
BEGIN
  U0 : FifoManagerV4
    GENERIC MAP (
      C_M_AXIS_TDATA_WIDTH => 32
    )
    PORT MAP (
      nRST => nRST,
      CLK => CLK,
      PRECvalid => PRECvalid,
      FIFOresponse => FIFOresponse,
      WDOTime => WDOTime,
      DIGTime => DIGTime,
      Trigger => Trigger,
      WDONBR => WDONBR,
      CH0 => CH0,
      CH1 => CH1,
      CH2 => CH2,
      CH3 => CH3,
      CH4 => CH4,
      CH5 => CH5,
      CH6 => CH6,
      CH7 => CH7,
      CH8 => CH8,
      CH9 => CH9,
      CH10 => CH10,
      CH11 => CH11,
      CH12 => CH12,
      CH13 => CH13,
      CH14 => CH14,
      CH15 => CH15,
      FIFOvalid => FIFOvalid,
      ready_i => ready_i,
      PSBUSY_i => PSBUSY_i,
      DataOut => DataOut
    );
END base_zynq_FifoManagerV4_0_0_arch;
