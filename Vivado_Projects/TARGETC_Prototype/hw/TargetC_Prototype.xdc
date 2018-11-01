# ----------------------------------------------------------------------------
#     _____
#    / #   /____   \____
#  / \===\   \==/
# /___\===\___\/  AVNET ELECTRONICS MARKETING
#      \======/         www.em.avnet.com/drc
#       \====/
# ----------------------------------------------------------------------------
#
#  Created With Avnet Constraints Generator V0.8.0
#     Date: Tuesday, September 02, 2014
#     Time: 10:33:25 PM
#
#  This design is the property of Avnet.  Publication of this
#  design is not authorized without written consent from Avnet.
#
#  Please direct any questions to:
#     MicroZed.org Community Forums
#     http://www.microzed.org
#
#  Disclaimer:
#     Avnet, Inc. makes no warranty for the use of this code or design.
#     This code is provided  "As Is". Avnet, Inc assumes no responsibility for
#     any errors, which may appear in this code, nor does it make a commitment
#     to update the information contained herein. Avnet, Inc specifically
#     disclaims any implied warranties of fitness for a particular purpose.
#                      Copyright(c) 2014 Avnet, Inc.
#                              All rights reserved.
#
# ----------------------------------------------------------------------------
#
#  Notes:
#
#  20 April 2015
#     IO standards based upon Bank 34 and Bank 35 (and Bank 13) Vcco supply
#     options of 1.8V, 2.5V, or 3.3V are possible based upon the Vadj
#     jumper (J18) settings.  By default, Vadj is expected to be set to
#     1.8V but if a different voltage is used for a particular design, then
#     the corresponding IO standard within this UCF should also be updated
#     to reflect the actual Vadj jumper selection.
#
#     Net names are not allowed to contain hyphen characters '-' since this
#     is not a legal VHDL87 or Verilog character within an identifier.
#     HDL net names are adjusted to contain no hyphen characters '-' but
#     rather use underscore '_' characters.  Comment net name with the hyphen
#     characters will remain in place since these are intended to match the
#     schematic net names in order to better enable schematic search.
#
#     The string provided in the comment field provides the Zynq device pin
#     mapping through the expansion connector to the carrier card net name
#     according to the following format:
#
#     "<Zynq Pin>.<SOM Net>.<Connector Ref>.<Connector Pin>.<Carrier Net>"
#
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# BB Test Points
# ----------------------------------------------------------------------------

set_property PACKAGE_PIN E17 [get_ports BB1]             #{LA19_P}];  # "E17.JX2_LVDS_2_P.JX2.23.LA19_P"
#set_property PACKAGE_PIN H17 [get_ports {BB2}];             #{LA17_CC_N}];  # "H17.JX2_LVDS_12_N.JX2.55.LA17_CC_N"
#set_property PACKAGE_PIN Y14 [get_ports {BB3}];             #{LA04_N}];  # "Y14.JX1_LVDS_7_N.JX1.32.LA04_N"
#set_property PACKAGE_PIN U14 [get_ports {BB4}];     #{LA07_P}];  # "U14.JX1_LVDS_10_P.JX1.41.LA07_P"
set_property PACKAGE_PIN E19 [get_ports BB5]             #{LA21_N}];  # "E19.JX2_LVDS_4_N.JX2.31.LA21_N"


# ----------------------------------------------------------------------------
# FMC Expansion Connector - Bank 34
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN U19 [get_ports CLK0_M2C_N];  # "U19.JX1_LVDS_11_N.JX1.44.CLK0_M2C_N"
#set_property PACKAGE_PIN U18 [get_ports CLK0_M2C_P];  # "U18.JX1_LVDS_11_P.JX1.42.CLK0_M2C_P"

#set_property PACKAGE_PIN P16 [get_ports FMC_SCL];  # "P16.JX1_LVDS_23_N.JX1.84.FMC_SCL"  THESE PINS ARE NOT CONNECTED
#set_property PACKAGE_PIN P15 [get_ports FMC_SDA];  # "P15.JX1_LVDS_23_P.JX1.82.FMC_SDA"  THESE PINS ARE NOT CONNECTED

set_property PACKAGE_PIN T16 [get_ports SS_LD_SIN]
set_property PACKAGE_PIN U17 [get_ports SS_LD_DIR]
set_property PACKAGE_PIN W15 [get_ports REGCLR]

#set_property PACKAGE_PIN V15 [get_ports LA06_P];  # "V15.JX1_LVDS_9_P.JX1.36.LA06_P"

set_property PACKAGE_PIN W20 [get_ports DO_5]

#set_property PACKAGE_PIN V20 [get_ports LA09_P];  # "V20.JX1_LVDS_15_P.JX1.54.LA09_P"

set_property PACKAGE_PIN Y19 [get_ports DO_8]
set_property PACKAGE_PIN Y18 [get_ports DO_7]
set_property PACKAGE_PIN W16 [get_ports DO_1]
set_property PACKAGE_PIN V16 [get_ports RAMP]
set_property PACKAGE_PIN R17 [get_ports SS_RESET]
set_property PACKAGE_PIN R18 [get_ports DO_10]
set_property PACKAGE_PIN T17 [get_ports DO_6]
set_property PACKAGE_PIN V18 [get_ports DO_13]
set_property PACKAGE_PIN V17 [get_ports DO_12]
set_property PACKAGE_PIN W19 [get_ports DOE]
set_property PACKAGE_PIN W18 [get_ports DO_2]
set_property PACKAGE_PIN P18 [get_ports DO_3]
set_property PACKAGE_PIN N17 [get_ports DONE]
set_property PACKAGE_PIN Y16 [get_ports MONTIMING_P]	#{Y16}-{Jx1_LVDS_6_P}-{Jx1-29}-{LA03_P}-{P#118}
set_property PACKAGE_PIN Y17 [get_ports MONTIMING_N]	#{Y17}-{Jx1_LVDS_6_N}-{Jx1-31}-{LA03_N}-{P#117}

# ----------------------------------------------------------------------------
# FMC Expansion Connector - Bank 35
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN K18 [get_ports CLK1_M2C_N];  # "K18.JX2_LVDS_11_N.JX2.50.CLK1_M2C_N"
#set_property PACKAGE_PIN K17 [get_ports CLK1_M2C_P];  # "K17.JX2_LVDS_11_P.JX2.48.CLK1_M2C_P"
#set_property PACKAGE_PIN M14 [get_ports FMC_PRSNT_L];  # "M14.JX2_LVDS_22_P.JX2.87.FMC_PRSNT_L"

set_property PACKAGE_PIN H16 [get_ports DO_11]
set_property PACKAGE_PIN H18 [get_ports RDAD_CLK]
set_property PACKAGE_PIN J18 [get_ports RDAD_SIN]
set_property PACKAGE_PIN D18 [get_ports DO_14]
set_property PACKAGE_PIN D20 [get_ports SS_INCR]
set_property PACKAGE_PIN D19 [get_ports DO_4]
set_property PACKAGE_PIN E18 [get_ports DO_15]
set_property PACKAGE_PIN F17 [get_ports DO_16]
set_property PACKAGE_PIN F16 [get_ports DO_9]
set_property PACKAGE_PIN L20 [get_ports WR_CS_S4]
set_property PACKAGE_PIN L19 [get_ports RDAD_DIR]
set_property PACKAGE_PIN M17 [get_ports SAMPLESEL_ANY]
set_property PACKAGE_PIN J19 [get_ports WR_CS_S2]
set_property PACKAGE_PIN K19 [get_ports WR_CS_S3]
set_property PACKAGE_PIN G18 [get_ports WR_CS_S0]
set_property PACKAGE_PIN G17 [get_ports WR_CS_S1]
set_property PACKAGE_PIN F20 [get_ports GCC_RESET]
set_property PACKAGE_PIN F19 [get_ports WR_CS_S5]
set_property PACKAGE_PIN H20 [get_ports WR_RS_S0]
set_property PACKAGE_PIN J20 [get_ports WR_RS_S1]
set_property PACKAGE_PIN N16 [get_ports PCLK]
set_property PACKAGE_PIN N15 [get_ports SHOUT]
set_property PACKAGE_PIN L15 [get_ports SIN]
set_property PACKAGE_PIN L14 [get_ports SCLK]


# ----------------------------------------------------------------------------
# User LEDs - Bank 35
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# UNI/O MAC ID EEPROM - Bank 35
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# User Push Buttons - Bank 35
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# JA Pmod - Bank 35
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# JY Pmod - Bank 13 (Available on Z7020 device only)
# ----------------------------------------------------------------------------
# set_property PACKAGE_PIN U7 [get_ports JY0_1_P];  # "U7.BANK13_LVDS_0_P.JX1.87.JY0-1_P" - JY - Pin 1
# set_property PACKAGE_PIN V7 [get_ports JY0_1_N];  # "V7.BANK13_LVDS_0_N.JX1.89.JY0-1_N" - JY - Pin 2
# set_property PACKAGE_PIN T9 [get_ports JY2_3_P];  # "T9.BANK13_LVDS_1_P.JX1.88.JY2-3_P" - JY - Pin 3
# set_property PACKAGE_PIN U10 [get_ports JY2_3_N];  # "U10.BANK13_LVDS_1_N.JX1.90.JY2-3_N" - JY - Pin 4
# set_property PACKAGE_PIN V8 [get_ports JY4_5_P];  # "V8.BANK13_LVDS_2_P.JX1.91.JY4-5_P" - JY - Pin 7
# set_property PACKAGE_PIN W8 [get_ports JY4_5_N];  # "W8.BANK13_LVDS_2_N.JX1.93.JY4-5_N" - JY - Pin 8
# set_property PACKAGE_PIN T5 [get_ports JY6_7_P];  # "T5.BANK13_LVDS_3_P.JX1.92.JY6-7_P" - JY - Pin 9
# set_property PACKAGE_PIN U5 [get_ports JY6_7_N];  # "U5.BANK13_LVDS_3_N.JX1.94.JY6-7_N" - JY - Pin 10


# ----------------------------------------------------------------------------
# JZ Pmod - Bank 13 (Available on Z7020 device only)
# ----------------------------------------------------------------------------
# set_property PACKAGE_PIN Y12 [get_ports JZ0_1_P];  # "Y12.BANK13_LVDS_4_P.JX2.93.JZ0-1_P" - JZ - Pin 1
# set_property PACKAGE_PIN Y13 [get_ports JZ0_1_N];  # "Y13.BANK13_LVDS_4_N.JX2.95.JZ0-1_N" - JZ - Pin 2
# set_property PACKAGE_PIN V11 [get_ports JZ2_3_P];  # "V11.BANK13_LVDS_5_P.JX2.94.JZ2-3_P" - JZ - Pin 3
# set_property PACKAGE_PIN V10 [get_ports JZ2_3_N];  # "V10.BANK13_LVDS_5_N.JX2.96.JZ2-3_N" - JZ - Pin 4
# set_property PACKAGE_PIN V5 [get_ports JZ5];  # "V5.BANK13_SE_0.JX2.100.JZ5" - JZ - Pin 8
# set_property PACKAGE_PIN V6 [get_ports JZ6_7_P];  # "V6.BANK13_LVDS_6_P.JX2.97.JZ6-7_P" - JZ - Pin 9
# set_property PACKAGE_PIN W6 [get_ports JZ6_7_N];  # "W6.BANK13_LVDS_6_N.JX2.99.JZ6-7_N" - JZ - Pin 10


# ----------------------------------------------------------------------------
# IOSTANDARD Constraints
#
# Note that these IOSTANDARD constraints are applied to all IOs currently
# assigned within an I/O bank.  If these IOSTANDARD constraints are
# evaluated prior to other PACKAGE_PIN constraints being applied, then
# the IOSTANDARD specified will likely not be applied properly to those
# pins.  Therefore, bank wide IOSTANDARD constraints should be placed
# within the XDC file in a location that is evaluated AFTER all
# PACKAGE_PIN constraints within the target bank have been evaluated.
#
# Un-comment one or more of the following IOSTANDARD constraints according to
# the bank pin assignments that are required within a design.
# ----------------------------------------------------------------------------

# Set the bank voltage for IO Bank 34 to 3.3V by default.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 34]]

# Set the bank voltage for IO Bank 35 to 3.3V by default.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 35]]

# Set the bank voltage for IO Bank 13 to 3.3V by default. (I/O bank available on Z7020 device only)
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]]

# ----------------------------------------------------------------------------
# BB Test Points
# ----------------------------------------------------------------------------

set_property IOSTANDARD LVCMOS25 [get_ports BB1];             #{LA19_P}];  # "E17.JX2_LVDS_2_P.JX2.23.LA19_P"
#set_property IOSTANDARD LVCMOS25 [get_ports {BB2}];             #{LA17_CC_N}];  # "H17.JX2_LVDS_12_N.JX2.55.LA17_CC_N"
#set_property IOSTANDARD LVCMOS25 [get_ports {BB3}];             #{LA04_N}];  # "Y14.JX1_LVDS_7_N.JX1.32.LA04_N"
#set_property IOSTANDARD LVCMOS25 [get_ports {BB4}];     #{LA07_P}];  # "U14.JX1_LVDS_10_P.JX1.41.LA07_P"
set_property IOSTANDARD LVCMOS25 [get_ports BB5];             #{LA21_N}];  # "E19.JX2_LVDS_4_N.JX2.31.LA21_N"


#IOSTANDARD
#BANK 34
set_property IOSTANDARD LVDS_25 [get_ports MONTIMING_P]
set_property IOSTANDARD LVDS_25 [get_ports MONTIMING_N]

set_property PACKAGE_PIN P14 [get_ports SSTIN_P]		#{P14}-{Jx1_LVDS_5_P}-{Jx1-24}-{LA02_P}-{P#125}
set_property PACKAGE_PIN R14 [get_ports SSTIN_N]		#{R14}-{Jx1_LVDS_5_N}-{Jx1-26}-{LA02_N}-{P#126}
set_property IOSTANDARD LVDS_25 [get_ports SSTIN_P]			
set_property IOSTANDARD LVDS_25 [get_ports SSTIN_N]

set_property IOSTANDARD LVCMOS25 [get_ports SS_LD_SIN]
set_property IOSTANDARD LVCMOS25 [get_ports SS_LD_DIR]
set_property IOSTANDARD LVCMOS25 [get_ports REGCLR]
set_property IOSTANDARD LVCMOS25 [get_ports DO_5]
set_property IOSTANDARD LVCMOS25 [get_ports DO_7]
set_property IOSTANDARD LVCMOS25 [get_ports DO_8]
set_property IOSTANDARD LVCMOS25 [get_ports RAMP]
set_property IOSTANDARD LVCMOS25 [get_ports DO_1]
set_property IOSTANDARD LVCMOS25 [get_ports SS_RESET]
set_property IOSTANDARD LVCMOS25 [get_ports DO_6]
set_property IOSTANDARD LVCMOS25 [get_ports DO_10]
set_property IOSTANDARD LVCMOS25 [get_ports DO_12]
set_property IOSTANDARD LVCMOS25 [get_ports DO_13]
set_property IOSTANDARD LVCMOS25 [get_ports DO_2]
set_property IOSTANDARD LVCMOS25 [get_ports DOE]
set_property IOSTANDARD LVCMOS25 [get_ports DONE]
set_property IOSTANDARD LVCMOS25 [get_ports DO_3]

#BANK 35
set_property IOSTANDARD LVCMOS25 [get_ports DO_11]
set_property IOSTANDARD LVCMOS25 [get_ports RDAD_SIN]
set_property IOSTANDARD LVCMOS25 [get_ports RDAD_CLK]
set_property IOSTANDARD LVCMOS25 [get_ports DO_14]
set_property IOSTANDARD LVCMOS25 [get_ports DO_4]
set_property IOSTANDARD LVCMOS25 [get_ports SS_INCR]
set_property IOSTANDARD LVCMOS25 [get_ports DO_15]
set_property IOSTANDARD LVCMOS25 [get_ports DO_9]
set_property IOSTANDARD LVCMOS25 [get_ports DO_16]
set_property IOSTANDARD LVCMOS25 [get_ports RDAD_DIR]
set_property IOSTANDARD LVCMOS25 [get_ports WR_CS_S4]

set_property IOSTANDARD LVCMOS25 [get_ports SAMPLESEL_ANY]
set_property IOSTANDARD LVCMOS25 [get_ports WR_CS_S2]
set_property IOSTANDARD LVCMOS25 [get_ports WR_CS_S3]
set_property IOSTANDARD LVCMOS25 [get_ports WR_CS_S0]
set_property IOSTANDARD LVCMOS25 [get_ports WR_CS_S1]
set_property IOSTANDARD LVCMOS25 [get_ports WR_CS_S5]
set_property IOSTANDARD LVCMOS25 [get_ports GCC_RESET]
set_property IOSTANDARD LVCMOS25 [get_ports WR_RS_S1]
set_property IOSTANDARD LVCMOS25 [get_ports WR_RS_S0]

set_property IOSTANDARD LVCMOS25 [get_ports SHOUT]
set_property IOSTANDARD LVCMOS25 [get_ports PCLK]
set_property IOSTANDARD LVCMOS25 [get_ports SCLK]
set_property IOSTANDARD LVCMOS25 [get_ports SIN]
set_property IOSTANDARD LVCMOS25 [get_ports WR_CS_S4]
set_property PACKAGE_PIN M19 [get_ports WL_CLK_P]		#{M19}-{Jx2_LVDS_7_P}-{Jx2-36}-{LA24_P}-{P#58}
set_property PACKAGE_PIN M20 [get_ports WL_CLK_N]		#{M20}-{Jx2_LVDS_7_N}-{Jx2-38}-{LA24_N}-{P#57}
set_property IOSTANDARD LVDS_25 [get_ports WL_CLK_P]
set_property IOSTANDARD LVDS_25 [get_ports WL_CLK_N]

set_property PACKAGE_PIN K14 [get_ports HSCLK_P]		#{K14}-{Jx2_LVDS_18_P}-{Jx2-73}-{LA30_P}-{P#44}
set_property PACKAGE_PIN J14 [get_ports HSCLK_N]		#{J14}-{Jx2_LVDS_18_N}-{Jx2-75}-{LA30_N}-{P#43}
set_property IOSTANDARD LVDS_25 [get_ports HSCLK_P]
set_property IOSTANDARD LVDS_25 [get_ports HSCLK_N]



