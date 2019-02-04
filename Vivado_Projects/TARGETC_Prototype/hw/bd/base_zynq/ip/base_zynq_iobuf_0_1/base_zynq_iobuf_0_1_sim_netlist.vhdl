-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
-- Date        : Sat Feb  2 01:39:02 2019
-- Host        : jonathan-Latitude-E7450 running 64-bit Linux Mint 18.1 Serena
-- Command     : write_vhdl -force -mode funcsim
--               /home/jonathan/VivadoProjects/00_WATCHMANN/TARGETC_Prototype/hw/bd/base_zynq/ip/base_zynq_iobuf_0_1/base_zynq_iobuf_0_1_sim_netlist.vhdl
-- Design      : base_zynq_iobuf_0_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_iobuf_0_1_xil_defaultlib_iobuf is
  port (
    O : out STD_LOGIC;
    IO : inout STD_LOGIC;
    I : in STD_LOGIC;
    T : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of base_zynq_iobuf_0_1_xil_defaultlib_iobuf : entity is "xil_defaultlib_iobuf";
end base_zynq_iobuf_0_1_xil_defaultlib_iobuf;

architecture STRUCTURE of base_zynq_iobuf_0_1_xil_defaultlib_iobuf is
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of IBUF_inst : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of IBUF_inst : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of IBUF_inst : label is "AUTO";
  attribute box_type : string;
  attribute box_type of IBUF_inst : label is "PRIMITIVE";
  attribute CAPACITANCE of OBUFT_inst : label is "DONT_CARE";
  attribute box_type of OBUFT_inst : label is "PRIMITIVE";
begin
IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => IO,
      O => O
    );
OBUFT_inst: unisim.vcomponents.OBUFT
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => I,
      O => IO,
      T => T
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_iobuf_0_1 is
  port (
    O : out STD_LOGIC;
    IO : inout STD_LOGIC;
    I : in STD_LOGIC;
    T : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of base_zynq_iobuf_0_1 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of base_zynq_iobuf_0_1 : entity is "base_zynq_iobuf_0_1,iobuf,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of base_zynq_iobuf_0_1 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of base_zynq_iobuf_0_1 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of base_zynq_iobuf_0_1 : entity is "iobuf,Vivado 2018.2";
end base_zynq_iobuf_0_1;

architecture STRUCTURE of base_zynq_iobuf_0_1 is
begin
U0: entity work.base_zynq_iobuf_0_1_xil_defaultlib_iobuf
     port map (
      I => I,
      IO => IO,
      O => O,
      T => T
    );
end STRUCTURE;
