-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
-- Date        : Mon Aug 13 11:42:54 2018
-- Host        : idlab52-OptiPlex-790 running 64-bit Ubuntu 14.04.5 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/idlab-52/Desktop/GitVivado/WATCHMAN/prototype_watchman/prototype_watchman.srcs/sources_1/bd/prototype_watchman/ip/prototype_watchman_xlconstant_0_0/prototype_watchman_xlconstant_0_0_sim_netlist.vhdl
-- Design      : prototype_watchman_xlconstant_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity prototype_watchman_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of prototype_watchman_xlconstant_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of prototype_watchman_xlconstant_0_0 : entity is "prototype_watchman_xlconstant_0_0,xlconstant_v1_1_4_xlconstant,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of prototype_watchman_xlconstant_0_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of prototype_watchman_xlconstant_0_0 : entity is "xlconstant_v1_1_4_xlconstant,Vivado 2018.1";
end prototype_watchman_xlconstant_0_0;

architecture STRUCTURE of prototype_watchman_xlconstant_0_0 is
  signal \<const1>\ : STD_LOGIC;
begin
  dout(0) <= \<const1>\;
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
end STRUCTURE;
