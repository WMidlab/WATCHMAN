-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
-- Date        : Mon Aug 13 11:46:25 2018
-- Host        : idlab52-OptiPlex-790 running 64-bit Ubuntu 14.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/idlab-52/Desktop/GitVivado/WATCHMAN/prototype_watchman/prototype_watchman.srcs/sources_1/bd/prototype_watchman/ip/prototype_watchman_xlconcat_0_0/prototype_watchman_xlconcat_0_0_stub.vhdl
-- Design      : prototype_watchman_xlconcat_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity prototype_watchman_xlconcat_0_0 is
  Port ( 
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );

end prototype_watchman_xlconcat_0_0;

architecture stub of prototype_watchman_xlconcat_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "In0[0:0],In1[0:0],dout[1:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "xlconcat_v2_1_1_xlconcat,Vivado 2018.1";
begin
end;
