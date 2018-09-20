-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
-- Date        : Mon Aug 13 11:42:53 2018
-- Host        : idlab52-OptiPlex-790 running 64-bit Ubuntu 14.04.5 LTS
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ prototype_watchman_example_0_0_sim_netlist.vhdl
-- Design      : prototype_watchman_example_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_example is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    A_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    A_TVALID : in STD_LOGIC;
    A_TREADY : out STD_LOGIC;
    B_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    B_TVALID : out STD_LOGIC;
    B_TREADY : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_example;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_example is
  signal A_0_data_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal A_0_load_B : STD_LOGIC;
  signal A_0_payload_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \A_0_payload_A[31]_i_1_n_2\ : STD_LOGIC;
  signal A_0_payload_B : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal A_0_sel : STD_LOGIC;
  signal A_0_sel_rd_i_1_n_2 : STD_LOGIC;
  signal A_0_sel_wr : STD_LOGIC;
  signal A_0_sel_wr_i_1_n_2 : STD_LOGIC;
  signal \A_0_state[0]_i_1_n_2\ : STD_LOGIC;
  signal \A_0_state[1]_i_2_n_2\ : STD_LOGIC;
  signal \A_0_state_reg_n_2_[0]\ : STD_LOGIC;
  signal \^a_tready\ : STD_LOGIC;
  signal B_1_ack_in : STD_LOGIC;
  signal B_1_load_B : STD_LOGIC;
  signal B_1_payload_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \B_1_payload_A[31]_i_1_n_2\ : STD_LOGIC;
  signal \B_1_payload_A[4]_i_5_n_2\ : STD_LOGIC;
  signal \B_1_payload_A_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \B_1_payload_A_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \B_1_payload_A_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \B_1_payload_A_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \B_1_payload_A_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \B_1_payload_A_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \B_1_payload_A_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \B_1_payload_A_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \B_1_payload_A_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \B_1_payload_A_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \B_1_payload_A_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \B_1_payload_A_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \B_1_payload_A_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \B_1_payload_A_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \B_1_payload_A_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \B_1_payload_A_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \B_1_payload_A_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \B_1_payload_A_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \B_1_payload_A_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \B_1_payload_A_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \B_1_payload_A_reg[31]_i_2_n_4\ : STD_LOGIC;
  signal \B_1_payload_A_reg[31]_i_2_n_5\ : STD_LOGIC;
  signal \B_1_payload_A_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \B_1_payload_A_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \B_1_payload_A_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \B_1_payload_A_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \B_1_payload_A_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \B_1_payload_A_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \B_1_payload_A_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \B_1_payload_A_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal B_1_payload_B : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal B_1_sel : STD_LOGIC;
  signal B_1_sel_rd_i_1_n_2 : STD_LOGIC;
  signal B_1_sel_wr : STD_LOGIC;
  signal B_1_sel_wr_i_1_n_2 : STD_LOGIC;
  signal \B_1_state[0]_i_1_n_2\ : STD_LOGIC;
  signal \B_1_state[1]_i_1_n_2\ : STD_LOGIC;
  signal \^b_tvalid\ : STD_LOGIC;
  signal \ap_CS_fsm_reg_n_2_[0]\ : STD_LOGIC;
  signal ap_CS_fsm_state2 : STD_LOGIC;
  signal ap_CS_fsm_state3 : STD_LOGIC;
  signal ap_CS_fsm_state4 : STD_LOGIC;
  signal ap_NS_fsm : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ap_NS_fsm1 : STD_LOGIC;
  signal \^ap_done\ : STD_LOGIC;
  signal ap_rst_n_inv : STD_LOGIC;
  signal exitcond_fu_62_p2 : STD_LOGIC;
  signal i_1_fu_68_p2 : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal i_1_reg_84 : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal i_1_reg_840 : STD_LOGIC;
  signal i_reg_51 : STD_LOGIC;
  signal \i_reg_51_reg_n_2_[0]\ : STD_LOGIC;
  signal \i_reg_51_reg_n_2_[1]\ : STD_LOGIC;
  signal \i_reg_51_reg_n_2_[2]\ : STD_LOGIC;
  signal \i_reg_51_reg_n_2_[3]\ : STD_LOGIC;
  signal \i_reg_51_reg_n_2_[4]\ : STD_LOGIC;
  signal \i_reg_51_reg_n_2_[5]\ : STD_LOGIC;
  signal tmp_1_fu_74_p2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_B_1_payload_A_reg[31]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_B_1_payload_A_reg[31]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of B_1_sel_rd_i_1 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of B_1_sel_wr_i_1 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \B_TDATA[0]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \B_TDATA[10]_INST_0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \B_TDATA[11]_INST_0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \B_TDATA[12]_INST_0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \B_TDATA[13]_INST_0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \B_TDATA[14]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \B_TDATA[15]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \B_TDATA[16]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \B_TDATA[17]_INST_0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \B_TDATA[18]_INST_0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \B_TDATA[19]_INST_0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \B_TDATA[1]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \B_TDATA[20]_INST_0\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \B_TDATA[21]_INST_0\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \B_TDATA[22]_INST_0\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \B_TDATA[23]_INST_0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \B_TDATA[24]_INST_0\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \B_TDATA[25]_INST_0\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \B_TDATA[26]_INST_0\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \B_TDATA[27]_INST_0\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \B_TDATA[28]_INST_0\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \B_TDATA[29]_INST_0\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \B_TDATA[2]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \B_TDATA[31]_INST_0\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \B_TDATA[3]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \B_TDATA[4]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \B_TDATA[5]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \B_TDATA[6]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \B_TDATA[7]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \B_TDATA[8]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \B_TDATA[9]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \ap_CS_fsm[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \ap_CS_fsm[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \ap_CS_fsm[3]_i_1\ : label is "soft_lutpair3";
  attribute FSM_ENCODING : string;
  attribute FSM_ENCODING of \ap_CS_fsm_reg[0]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[1]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[2]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[3]\ : label is "none";
  attribute SOFT_HLUTNM of ap_idle_INST_0 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of ap_ready_INST_0 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \i_1_reg_84[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \i_1_reg_84[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \i_1_reg_84[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \i_1_reg_84[4]_i_1\ : label is "soft_lutpair2";
begin
  A_TREADY <= \^a_tready\;
  B_TVALID <= \^b_tvalid\;
  ap_done <= \^ap_done\;
  ap_ready <= \^ap_done\;
\A_0_payload_A[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0D"
    )
        port map (
      I0 => \A_0_state_reg_n_2_[0]\,
      I1 => \^a_tready\,
      I2 => A_0_sel_wr,
      O => \A_0_payload_A[31]_i_1_n_2\
    );
\A_0_payload_A_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(0),
      Q => A_0_payload_A(0),
      R => '0'
    );
\A_0_payload_A_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(10),
      Q => A_0_payload_A(10),
      R => '0'
    );
\A_0_payload_A_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(11),
      Q => A_0_payload_A(11),
      R => '0'
    );
\A_0_payload_A_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(12),
      Q => A_0_payload_A(12),
      R => '0'
    );
\A_0_payload_A_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(13),
      Q => A_0_payload_A(13),
      R => '0'
    );
\A_0_payload_A_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(14),
      Q => A_0_payload_A(14),
      R => '0'
    );
\A_0_payload_A_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(15),
      Q => A_0_payload_A(15),
      R => '0'
    );
\A_0_payload_A_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(16),
      Q => A_0_payload_A(16),
      R => '0'
    );
\A_0_payload_A_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(17),
      Q => A_0_payload_A(17),
      R => '0'
    );
\A_0_payload_A_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(18),
      Q => A_0_payload_A(18),
      R => '0'
    );
\A_0_payload_A_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(19),
      Q => A_0_payload_A(19),
      R => '0'
    );
\A_0_payload_A_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(1),
      Q => A_0_payload_A(1),
      R => '0'
    );
\A_0_payload_A_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(20),
      Q => A_0_payload_A(20),
      R => '0'
    );
\A_0_payload_A_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(21),
      Q => A_0_payload_A(21),
      R => '0'
    );
\A_0_payload_A_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(22),
      Q => A_0_payload_A(22),
      R => '0'
    );
\A_0_payload_A_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(23),
      Q => A_0_payload_A(23),
      R => '0'
    );
\A_0_payload_A_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(24),
      Q => A_0_payload_A(24),
      R => '0'
    );
\A_0_payload_A_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(25),
      Q => A_0_payload_A(25),
      R => '0'
    );
\A_0_payload_A_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(26),
      Q => A_0_payload_A(26),
      R => '0'
    );
\A_0_payload_A_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(27),
      Q => A_0_payload_A(27),
      R => '0'
    );
\A_0_payload_A_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(28),
      Q => A_0_payload_A(28),
      R => '0'
    );
\A_0_payload_A_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(29),
      Q => A_0_payload_A(29),
      R => '0'
    );
\A_0_payload_A_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(2),
      Q => A_0_payload_A(2),
      R => '0'
    );
\A_0_payload_A_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(30),
      Q => A_0_payload_A(30),
      R => '0'
    );
\A_0_payload_A_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(31),
      Q => A_0_payload_A(31),
      R => '0'
    );
\A_0_payload_A_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(3),
      Q => A_0_payload_A(3),
      R => '0'
    );
\A_0_payload_A_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(4),
      Q => A_0_payload_A(4),
      R => '0'
    );
\A_0_payload_A_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(5),
      Q => A_0_payload_A(5),
      R => '0'
    );
\A_0_payload_A_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(6),
      Q => A_0_payload_A(6),
      R => '0'
    );
\A_0_payload_A_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(7),
      Q => A_0_payload_A(7),
      R => '0'
    );
\A_0_payload_A_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(8),
      Q => A_0_payload_A(8),
      R => '0'
    );
\A_0_payload_A_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \A_0_payload_A[31]_i_1_n_2\,
      D => A_TDATA(9),
      Q => A_0_payload_A(9),
      R => '0'
    );
\A_0_payload_B[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A2"
    )
        port map (
      I0 => A_0_sel_wr,
      I1 => \A_0_state_reg_n_2_[0]\,
      I2 => \^a_tready\,
      O => A_0_load_B
    );
\A_0_payload_B_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(0),
      Q => A_0_payload_B(0),
      R => '0'
    );
\A_0_payload_B_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(10),
      Q => A_0_payload_B(10),
      R => '0'
    );
\A_0_payload_B_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(11),
      Q => A_0_payload_B(11),
      R => '0'
    );
\A_0_payload_B_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(12),
      Q => A_0_payload_B(12),
      R => '0'
    );
\A_0_payload_B_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(13),
      Q => A_0_payload_B(13),
      R => '0'
    );
\A_0_payload_B_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(14),
      Q => A_0_payload_B(14),
      R => '0'
    );
\A_0_payload_B_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(15),
      Q => A_0_payload_B(15),
      R => '0'
    );
\A_0_payload_B_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(16),
      Q => A_0_payload_B(16),
      R => '0'
    );
\A_0_payload_B_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(17),
      Q => A_0_payload_B(17),
      R => '0'
    );
\A_0_payload_B_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(18),
      Q => A_0_payload_B(18),
      R => '0'
    );
\A_0_payload_B_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(19),
      Q => A_0_payload_B(19),
      R => '0'
    );
\A_0_payload_B_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(1),
      Q => A_0_payload_B(1),
      R => '0'
    );
\A_0_payload_B_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(20),
      Q => A_0_payload_B(20),
      R => '0'
    );
\A_0_payload_B_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(21),
      Q => A_0_payload_B(21),
      R => '0'
    );
\A_0_payload_B_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(22),
      Q => A_0_payload_B(22),
      R => '0'
    );
\A_0_payload_B_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(23),
      Q => A_0_payload_B(23),
      R => '0'
    );
\A_0_payload_B_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(24),
      Q => A_0_payload_B(24),
      R => '0'
    );
\A_0_payload_B_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(25),
      Q => A_0_payload_B(25),
      R => '0'
    );
\A_0_payload_B_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(26),
      Q => A_0_payload_B(26),
      R => '0'
    );
\A_0_payload_B_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(27),
      Q => A_0_payload_B(27),
      R => '0'
    );
\A_0_payload_B_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(28),
      Q => A_0_payload_B(28),
      R => '0'
    );
\A_0_payload_B_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(29),
      Q => A_0_payload_B(29),
      R => '0'
    );
\A_0_payload_B_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(2),
      Q => A_0_payload_B(2),
      R => '0'
    );
\A_0_payload_B_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(30),
      Q => A_0_payload_B(30),
      R => '0'
    );
\A_0_payload_B_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(31),
      Q => A_0_payload_B(31),
      R => '0'
    );
\A_0_payload_B_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(3),
      Q => A_0_payload_B(3),
      R => '0'
    );
\A_0_payload_B_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(4),
      Q => A_0_payload_B(4),
      R => '0'
    );
\A_0_payload_B_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(5),
      Q => A_0_payload_B(5),
      R => '0'
    );
\A_0_payload_B_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(6),
      Q => A_0_payload_B(6),
      R => '0'
    );
\A_0_payload_B_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(7),
      Q => A_0_payload_B(7),
      R => '0'
    );
\A_0_payload_B_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(8),
      Q => A_0_payload_B(8),
      R => '0'
    );
\A_0_payload_B_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => A_0_load_B,
      D => A_TDATA(9),
      Q => A_0_payload_B(9),
      R => '0'
    );
A_0_sel_rd_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => ap_CS_fsm_state3,
      I1 => B_1_ack_in,
      I2 => \A_0_state_reg_n_2_[0]\,
      I3 => A_0_sel,
      O => A_0_sel_rd_i_1_n_2
    );
A_0_sel_rd_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => A_0_sel_rd_i_1_n_2,
      Q => A_0_sel,
      R => ap_rst_n_inv
    );
A_0_sel_wr_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^a_tready\,
      I1 => A_TVALID,
      I2 => A_0_sel_wr,
      O => A_0_sel_wr_i_1_n_2
    );
A_0_sel_wr_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => A_0_sel_wr_i_1_n_2,
      Q => A_0_sel_wr,
      R => ap_rst_n_inv
    );
\A_0_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A820A8A0A8A0A8A0"
    )
        port map (
      I0 => ap_rst_n,
      I1 => \^a_tready\,
      I2 => \A_0_state_reg_n_2_[0]\,
      I3 => A_TVALID,
      I4 => ap_CS_fsm_state3,
      I5 => B_1_ack_in,
      O => \A_0_state[0]_i_1_n_2\
    );
\A_0_state[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ap_rst_n,
      O => ap_rst_n_inv
    );
\A_0_state[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8F88FFFF"
    )
        port map (
      I0 => ap_CS_fsm_state3,
      I1 => B_1_ack_in,
      I2 => A_TVALID,
      I3 => \^a_tready\,
      I4 => \A_0_state_reg_n_2_[0]\,
      O => \A_0_state[1]_i_2_n_2\
    );
\A_0_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \A_0_state[0]_i_1_n_2\,
      Q => \A_0_state_reg_n_2_[0]\,
      R => '0'
    );
\A_0_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \A_0_state[1]_i_2_n_2\,
      Q => \^a_tready\,
      R => ap_rst_n_inv
    );
\B_1_payload_A[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1B"
    )
        port map (
      I0 => A_0_sel,
      I1 => A_0_payload_A(0),
      I2 => A_0_payload_B(0),
      O => tmp_1_fu_74_p2(0)
    );
\B_1_payload_A[12]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(12),
      I1 => A_0_payload_A(12),
      I2 => A_0_sel,
      O => A_0_data_out(12)
    );
\B_1_payload_A[12]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(11),
      I1 => A_0_payload_A(11),
      I2 => A_0_sel,
      O => A_0_data_out(11)
    );
\B_1_payload_A[12]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(10),
      I1 => A_0_payload_A(10),
      I2 => A_0_sel,
      O => A_0_data_out(10)
    );
\B_1_payload_A[12]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(9),
      I1 => A_0_payload_A(9),
      I2 => A_0_sel,
      O => A_0_data_out(9)
    );
\B_1_payload_A[16]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(16),
      I1 => A_0_payload_A(16),
      I2 => A_0_sel,
      O => A_0_data_out(16)
    );
\B_1_payload_A[16]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(15),
      I1 => A_0_payload_A(15),
      I2 => A_0_sel,
      O => A_0_data_out(15)
    );
\B_1_payload_A[16]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(14),
      I1 => A_0_payload_A(14),
      I2 => A_0_sel,
      O => A_0_data_out(14)
    );
\B_1_payload_A[16]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(13),
      I1 => A_0_payload_A(13),
      I2 => A_0_sel,
      O => A_0_data_out(13)
    );
\B_1_payload_A[20]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(20),
      I1 => A_0_payload_A(20),
      I2 => A_0_sel,
      O => A_0_data_out(20)
    );
\B_1_payload_A[20]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(19),
      I1 => A_0_payload_A(19),
      I2 => A_0_sel,
      O => A_0_data_out(19)
    );
\B_1_payload_A[20]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(18),
      I1 => A_0_payload_A(18),
      I2 => A_0_sel,
      O => A_0_data_out(18)
    );
\B_1_payload_A[20]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(17),
      I1 => A_0_payload_A(17),
      I2 => A_0_sel,
      O => A_0_data_out(17)
    );
\B_1_payload_A[24]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(24),
      I1 => A_0_payload_A(24),
      I2 => A_0_sel,
      O => A_0_data_out(24)
    );
\B_1_payload_A[24]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(23),
      I1 => A_0_payload_A(23),
      I2 => A_0_sel,
      O => A_0_data_out(23)
    );
\B_1_payload_A[24]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(22),
      I1 => A_0_payload_A(22),
      I2 => A_0_sel,
      O => A_0_data_out(22)
    );
\B_1_payload_A[24]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(21),
      I1 => A_0_payload_A(21),
      I2 => A_0_sel,
      O => A_0_data_out(21)
    );
\B_1_payload_A[28]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(28),
      I1 => A_0_payload_A(28),
      I2 => A_0_sel,
      O => A_0_data_out(28)
    );
\B_1_payload_A[28]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(27),
      I1 => A_0_payload_A(27),
      I2 => A_0_sel,
      O => A_0_data_out(27)
    );
\B_1_payload_A[28]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(26),
      I1 => A_0_payload_A(26),
      I2 => A_0_sel,
      O => A_0_data_out(26)
    );
\B_1_payload_A[28]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(25),
      I1 => A_0_payload_A(25),
      I2 => A_0_sel,
      O => A_0_data_out(25)
    );
\B_1_payload_A[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0D"
    )
        port map (
      I0 => \^b_tvalid\,
      I1 => B_1_ack_in,
      I2 => B_1_sel_wr,
      O => \B_1_payload_A[31]_i_1_n_2\
    );
\B_1_payload_A[31]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(31),
      I1 => A_0_payload_A(31),
      I2 => A_0_sel,
      O => A_0_data_out(31)
    );
\B_1_payload_A[31]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(30),
      I1 => A_0_payload_A(30),
      I2 => A_0_sel,
      O => A_0_data_out(30)
    );
\B_1_payload_A[31]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(29),
      I1 => A_0_payload_A(29),
      I2 => A_0_sel,
      O => A_0_data_out(29)
    );
\B_1_payload_A[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(0),
      I1 => A_0_payload_A(0),
      I2 => A_0_sel,
      O => A_0_data_out(0)
    );
\B_1_payload_A[4]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(4),
      I1 => A_0_payload_A(4),
      I2 => A_0_sel,
      O => A_0_data_out(4)
    );
\B_1_payload_A[4]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(3),
      I1 => A_0_payload_A(3),
      I2 => A_0_sel,
      O => A_0_data_out(3)
    );
\B_1_payload_A[4]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"53"
    )
        port map (
      I0 => A_0_payload_B(2),
      I1 => A_0_payload_A(2),
      I2 => A_0_sel,
      O => \B_1_payload_A[4]_i_5_n_2\
    );
\B_1_payload_A[4]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(1),
      I1 => A_0_payload_A(1),
      I2 => A_0_sel,
      O => A_0_data_out(1)
    );
\B_1_payload_A[8]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(8),
      I1 => A_0_payload_A(8),
      I2 => A_0_sel,
      O => A_0_data_out(8)
    );
\B_1_payload_A[8]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(7),
      I1 => A_0_payload_A(7),
      I2 => A_0_sel,
      O => A_0_data_out(7)
    );
\B_1_payload_A[8]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(6),
      I1 => A_0_payload_A(6),
      I2 => A_0_sel,
      O => A_0_data_out(6)
    );
\B_1_payload_A[8]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => A_0_payload_B(5),
      I1 => A_0_payload_A(5),
      I2 => A_0_sel,
      O => A_0_data_out(5)
    );
\B_1_payload_A_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(0),
      Q => B_1_payload_A(0),
      R => '0'
    );
\B_1_payload_A_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(10),
      Q => B_1_payload_A(10),
      R => '0'
    );
\B_1_payload_A_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(11),
      Q => B_1_payload_A(11),
      R => '0'
    );
\B_1_payload_A_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(12),
      Q => B_1_payload_A(12),
      R => '0'
    );
\B_1_payload_A_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \B_1_payload_A_reg[8]_i_1_n_2\,
      CO(3) => \B_1_payload_A_reg[12]_i_1_n_2\,
      CO(2) => \B_1_payload_A_reg[12]_i_1_n_3\,
      CO(1) => \B_1_payload_A_reg[12]_i_1_n_4\,
      CO(0) => \B_1_payload_A_reg[12]_i_1_n_5\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => tmp_1_fu_74_p2(12 downto 9),
      S(3 downto 0) => A_0_data_out(12 downto 9)
    );
\B_1_payload_A_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(13),
      Q => B_1_payload_A(13),
      R => '0'
    );
\B_1_payload_A_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(14),
      Q => B_1_payload_A(14),
      R => '0'
    );
\B_1_payload_A_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(15),
      Q => B_1_payload_A(15),
      R => '0'
    );
\B_1_payload_A_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(16),
      Q => B_1_payload_A(16),
      R => '0'
    );
\B_1_payload_A_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \B_1_payload_A_reg[12]_i_1_n_2\,
      CO(3) => \B_1_payload_A_reg[16]_i_1_n_2\,
      CO(2) => \B_1_payload_A_reg[16]_i_1_n_3\,
      CO(1) => \B_1_payload_A_reg[16]_i_1_n_4\,
      CO(0) => \B_1_payload_A_reg[16]_i_1_n_5\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => tmp_1_fu_74_p2(16 downto 13),
      S(3 downto 0) => A_0_data_out(16 downto 13)
    );
\B_1_payload_A_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(17),
      Q => B_1_payload_A(17),
      R => '0'
    );
\B_1_payload_A_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(18),
      Q => B_1_payload_A(18),
      R => '0'
    );
\B_1_payload_A_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(19),
      Q => B_1_payload_A(19),
      R => '0'
    );
\B_1_payload_A_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(1),
      Q => B_1_payload_A(1),
      R => '0'
    );
\B_1_payload_A_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(20),
      Q => B_1_payload_A(20),
      R => '0'
    );
\B_1_payload_A_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \B_1_payload_A_reg[16]_i_1_n_2\,
      CO(3) => \B_1_payload_A_reg[20]_i_1_n_2\,
      CO(2) => \B_1_payload_A_reg[20]_i_1_n_3\,
      CO(1) => \B_1_payload_A_reg[20]_i_1_n_4\,
      CO(0) => \B_1_payload_A_reg[20]_i_1_n_5\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => tmp_1_fu_74_p2(20 downto 17),
      S(3 downto 0) => A_0_data_out(20 downto 17)
    );
\B_1_payload_A_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(21),
      Q => B_1_payload_A(21),
      R => '0'
    );
\B_1_payload_A_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(22),
      Q => B_1_payload_A(22),
      R => '0'
    );
\B_1_payload_A_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(23),
      Q => B_1_payload_A(23),
      R => '0'
    );
\B_1_payload_A_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(24),
      Q => B_1_payload_A(24),
      R => '0'
    );
\B_1_payload_A_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \B_1_payload_A_reg[20]_i_1_n_2\,
      CO(3) => \B_1_payload_A_reg[24]_i_1_n_2\,
      CO(2) => \B_1_payload_A_reg[24]_i_1_n_3\,
      CO(1) => \B_1_payload_A_reg[24]_i_1_n_4\,
      CO(0) => \B_1_payload_A_reg[24]_i_1_n_5\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => tmp_1_fu_74_p2(24 downto 21),
      S(3 downto 0) => A_0_data_out(24 downto 21)
    );
\B_1_payload_A_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(25),
      Q => B_1_payload_A(25),
      R => '0'
    );
\B_1_payload_A_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(26),
      Q => B_1_payload_A(26),
      R => '0'
    );
\B_1_payload_A_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(27),
      Q => B_1_payload_A(27),
      R => '0'
    );
\B_1_payload_A_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(28),
      Q => B_1_payload_A(28),
      R => '0'
    );
\B_1_payload_A_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \B_1_payload_A_reg[24]_i_1_n_2\,
      CO(3) => \B_1_payload_A_reg[28]_i_1_n_2\,
      CO(2) => \B_1_payload_A_reg[28]_i_1_n_3\,
      CO(1) => \B_1_payload_A_reg[28]_i_1_n_4\,
      CO(0) => \B_1_payload_A_reg[28]_i_1_n_5\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => tmp_1_fu_74_p2(28 downto 25),
      S(3 downto 0) => A_0_data_out(28 downto 25)
    );
\B_1_payload_A_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(29),
      Q => B_1_payload_A(29),
      R => '0'
    );
\B_1_payload_A_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(2),
      Q => B_1_payload_A(2),
      R => '0'
    );
\B_1_payload_A_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(30),
      Q => B_1_payload_A(30),
      R => '0'
    );
\B_1_payload_A_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(31),
      Q => B_1_payload_A(31),
      R => '0'
    );
\B_1_payload_A_reg[31]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \B_1_payload_A_reg[28]_i_1_n_2\,
      CO(3 downto 2) => \NLW_B_1_payload_A_reg[31]_i_2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \B_1_payload_A_reg[31]_i_2_n_4\,
      CO(0) => \B_1_payload_A_reg[31]_i_2_n_5\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_B_1_payload_A_reg[31]_i_2_O_UNCONNECTED\(3),
      O(2 downto 0) => tmp_1_fu_74_p2(31 downto 29),
      S(3) => '0',
      S(2 downto 0) => A_0_data_out(31 downto 29)
    );
\B_1_payload_A_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(3),
      Q => B_1_payload_A(3),
      R => '0'
    );
\B_1_payload_A_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(4),
      Q => B_1_payload_A(4),
      R => '0'
    );
\B_1_payload_A_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \B_1_payload_A_reg[4]_i_1_n_2\,
      CO(2) => \B_1_payload_A_reg[4]_i_1_n_3\,
      CO(1) => \B_1_payload_A_reg[4]_i_1_n_4\,
      CO(0) => \B_1_payload_A_reg[4]_i_1_n_5\,
      CYINIT => A_0_data_out(0),
      DI(3 downto 0) => B"0010",
      O(3 downto 0) => tmp_1_fu_74_p2(4 downto 1),
      S(3 downto 2) => A_0_data_out(4 downto 3),
      S(1) => \B_1_payload_A[4]_i_5_n_2\,
      S(0) => A_0_data_out(1)
    );
\B_1_payload_A_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(5),
      Q => B_1_payload_A(5),
      R => '0'
    );
\B_1_payload_A_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(6),
      Q => B_1_payload_A(6),
      R => '0'
    );
\B_1_payload_A_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(7),
      Q => B_1_payload_A(7),
      R => '0'
    );
\B_1_payload_A_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(8),
      Q => B_1_payload_A(8),
      R => '0'
    );
\B_1_payload_A_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \B_1_payload_A_reg[4]_i_1_n_2\,
      CO(3) => \B_1_payload_A_reg[8]_i_1_n_2\,
      CO(2) => \B_1_payload_A_reg[8]_i_1_n_3\,
      CO(1) => \B_1_payload_A_reg[8]_i_1_n_4\,
      CO(0) => \B_1_payload_A_reg[8]_i_1_n_5\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => tmp_1_fu_74_p2(8 downto 5),
      S(3 downto 0) => A_0_data_out(8 downto 5)
    );
\B_1_payload_A_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \B_1_payload_A[31]_i_1_n_2\,
      D => tmp_1_fu_74_p2(9),
      Q => B_1_payload_A(9),
      R => '0'
    );
\B_1_payload_B[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A2"
    )
        port map (
      I0 => B_1_sel_wr,
      I1 => \^b_tvalid\,
      I2 => B_1_ack_in,
      O => B_1_load_B
    );
\B_1_payload_B_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(0),
      Q => B_1_payload_B(0),
      R => '0'
    );
\B_1_payload_B_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(10),
      Q => B_1_payload_B(10),
      R => '0'
    );
\B_1_payload_B_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(11),
      Q => B_1_payload_B(11),
      R => '0'
    );
\B_1_payload_B_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(12),
      Q => B_1_payload_B(12),
      R => '0'
    );
\B_1_payload_B_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(13),
      Q => B_1_payload_B(13),
      R => '0'
    );
\B_1_payload_B_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(14),
      Q => B_1_payload_B(14),
      R => '0'
    );
\B_1_payload_B_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(15),
      Q => B_1_payload_B(15),
      R => '0'
    );
\B_1_payload_B_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(16),
      Q => B_1_payload_B(16),
      R => '0'
    );
\B_1_payload_B_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(17),
      Q => B_1_payload_B(17),
      R => '0'
    );
\B_1_payload_B_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(18),
      Q => B_1_payload_B(18),
      R => '0'
    );
\B_1_payload_B_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(19),
      Q => B_1_payload_B(19),
      R => '0'
    );
\B_1_payload_B_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(1),
      Q => B_1_payload_B(1),
      R => '0'
    );
\B_1_payload_B_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(20),
      Q => B_1_payload_B(20),
      R => '0'
    );
\B_1_payload_B_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(21),
      Q => B_1_payload_B(21),
      R => '0'
    );
\B_1_payload_B_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(22),
      Q => B_1_payload_B(22),
      R => '0'
    );
\B_1_payload_B_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(23),
      Q => B_1_payload_B(23),
      R => '0'
    );
\B_1_payload_B_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(24),
      Q => B_1_payload_B(24),
      R => '0'
    );
\B_1_payload_B_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(25),
      Q => B_1_payload_B(25),
      R => '0'
    );
\B_1_payload_B_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(26),
      Q => B_1_payload_B(26),
      R => '0'
    );
\B_1_payload_B_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(27),
      Q => B_1_payload_B(27),
      R => '0'
    );
\B_1_payload_B_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(28),
      Q => B_1_payload_B(28),
      R => '0'
    );
\B_1_payload_B_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(29),
      Q => B_1_payload_B(29),
      R => '0'
    );
\B_1_payload_B_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(2),
      Q => B_1_payload_B(2),
      R => '0'
    );
\B_1_payload_B_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(30),
      Q => B_1_payload_B(30),
      R => '0'
    );
\B_1_payload_B_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(31),
      Q => B_1_payload_B(31),
      R => '0'
    );
\B_1_payload_B_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(3),
      Q => B_1_payload_B(3),
      R => '0'
    );
\B_1_payload_B_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(4),
      Q => B_1_payload_B(4),
      R => '0'
    );
\B_1_payload_B_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(5),
      Q => B_1_payload_B(5),
      R => '0'
    );
\B_1_payload_B_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(6),
      Q => B_1_payload_B(6),
      R => '0'
    );
\B_1_payload_B_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(7),
      Q => B_1_payload_B(7),
      R => '0'
    );
\B_1_payload_B_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(8),
      Q => B_1_payload_B(8),
      R => '0'
    );
\B_1_payload_B_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => B_1_load_B,
      D => tmp_1_fu_74_p2(9),
      Q => B_1_payload_B(9),
      R => '0'
    );
B_1_sel_rd_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^b_tvalid\,
      I1 => B_TREADY,
      I2 => B_1_sel,
      O => B_1_sel_rd_i_1_n_2
    );
B_1_sel_rd_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => B_1_sel_rd_i_1_n_2,
      Q => B_1_sel,
      R => ap_rst_n_inv
    );
B_1_sel_wr_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => ap_CS_fsm_state3,
      I1 => B_1_ack_in,
      I2 => \A_0_state_reg_n_2_[0]\,
      I3 => B_1_sel_wr,
      O => B_1_sel_wr_i_1_n_2
    );
B_1_sel_wr_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => B_1_sel_wr_i_1_n_2,
      Q => B_1_sel_wr,
      R => ap_rst_n_inv
    );
\B_1_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A8A8088808880888"
    )
        port map (
      I0 => ap_rst_n,
      I1 => \^b_tvalid\,
      I2 => B_1_ack_in,
      I3 => B_TREADY,
      I4 => \A_0_state_reg_n_2_[0]\,
      I5 => ap_CS_fsm_state3,
      O => \B_1_state[0]_i_1_n_2\
    );
\B_1_state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F7FFF0FF"
    )
        port map (
      I0 => \A_0_state_reg_n_2_[0]\,
      I1 => ap_CS_fsm_state3,
      I2 => B_TREADY,
      I3 => \^b_tvalid\,
      I4 => B_1_ack_in,
      O => \B_1_state[1]_i_1_n_2\
    );
\B_1_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \B_1_state[0]_i_1_n_2\,
      Q => \^b_tvalid\,
      R => '0'
    );
\B_1_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \B_1_state[1]_i_1_n_2\,
      Q => B_1_ack_in,
      R => ap_rst_n_inv
    );
\B_TDATA[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(0),
      I1 => B_1_payload_A(0),
      I2 => B_1_sel,
      O => B_TDATA(0)
    );
\B_TDATA[10]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(10),
      I1 => B_1_payload_A(10),
      I2 => B_1_sel,
      O => B_TDATA(10)
    );
\B_TDATA[11]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(11),
      I1 => B_1_payload_A(11),
      I2 => B_1_sel,
      O => B_TDATA(11)
    );
\B_TDATA[12]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(12),
      I1 => B_1_payload_A(12),
      I2 => B_1_sel,
      O => B_TDATA(12)
    );
\B_TDATA[13]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(13),
      I1 => B_1_payload_A(13),
      I2 => B_1_sel,
      O => B_TDATA(13)
    );
\B_TDATA[14]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(14),
      I1 => B_1_payload_A(14),
      I2 => B_1_sel,
      O => B_TDATA(14)
    );
\B_TDATA[15]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(15),
      I1 => B_1_payload_A(15),
      I2 => B_1_sel,
      O => B_TDATA(15)
    );
\B_TDATA[16]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(16),
      I1 => B_1_payload_A(16),
      I2 => B_1_sel,
      O => B_TDATA(16)
    );
\B_TDATA[17]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(17),
      I1 => B_1_payload_A(17),
      I2 => B_1_sel,
      O => B_TDATA(17)
    );
\B_TDATA[18]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(18),
      I1 => B_1_payload_A(18),
      I2 => B_1_sel,
      O => B_TDATA(18)
    );
\B_TDATA[19]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(19),
      I1 => B_1_payload_A(19),
      I2 => B_1_sel,
      O => B_TDATA(19)
    );
\B_TDATA[1]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(1),
      I1 => B_1_payload_A(1),
      I2 => B_1_sel,
      O => B_TDATA(1)
    );
\B_TDATA[20]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(20),
      I1 => B_1_payload_A(20),
      I2 => B_1_sel,
      O => B_TDATA(20)
    );
\B_TDATA[21]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(21),
      I1 => B_1_payload_A(21),
      I2 => B_1_sel,
      O => B_TDATA(21)
    );
\B_TDATA[22]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(22),
      I1 => B_1_payload_A(22),
      I2 => B_1_sel,
      O => B_TDATA(22)
    );
\B_TDATA[23]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(23),
      I1 => B_1_payload_A(23),
      I2 => B_1_sel,
      O => B_TDATA(23)
    );
\B_TDATA[24]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(24),
      I1 => B_1_payload_A(24),
      I2 => B_1_sel,
      O => B_TDATA(24)
    );
\B_TDATA[25]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(25),
      I1 => B_1_payload_A(25),
      I2 => B_1_sel,
      O => B_TDATA(25)
    );
\B_TDATA[26]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(26),
      I1 => B_1_payload_A(26),
      I2 => B_1_sel,
      O => B_TDATA(26)
    );
\B_TDATA[27]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(27),
      I1 => B_1_payload_A(27),
      I2 => B_1_sel,
      O => B_TDATA(27)
    );
\B_TDATA[28]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(28),
      I1 => B_1_payload_A(28),
      I2 => B_1_sel,
      O => B_TDATA(28)
    );
\B_TDATA[29]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(29),
      I1 => B_1_payload_A(29),
      I2 => B_1_sel,
      O => B_TDATA(29)
    );
\B_TDATA[2]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(2),
      I1 => B_1_payload_A(2),
      I2 => B_1_sel,
      O => B_TDATA(2)
    );
\B_TDATA[30]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(30),
      I1 => B_1_payload_A(30),
      I2 => B_1_sel,
      O => B_TDATA(30)
    );
\B_TDATA[31]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(31),
      I1 => B_1_payload_A(31),
      I2 => B_1_sel,
      O => B_TDATA(31)
    );
\B_TDATA[3]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(3),
      I1 => B_1_payload_A(3),
      I2 => B_1_sel,
      O => B_TDATA(3)
    );
\B_TDATA[4]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(4),
      I1 => B_1_payload_A(4),
      I2 => B_1_sel,
      O => B_TDATA(4)
    );
\B_TDATA[5]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(5),
      I1 => B_1_payload_A(5),
      I2 => B_1_sel,
      O => B_TDATA(5)
    );
\B_TDATA[6]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(6),
      I1 => B_1_payload_A(6),
      I2 => B_1_sel,
      O => B_TDATA(6)
    );
\B_TDATA[7]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(7),
      I1 => B_1_payload_A(7),
      I2 => B_1_sel,
      O => B_TDATA(7)
    );
\B_TDATA[8]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(8),
      I1 => B_1_payload_A(8),
      I2 => B_1_sel,
      O => B_TDATA(8)
    );
\B_TDATA[9]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => B_1_payload_B(9),
      I1 => B_1_payload_A(9),
      I2 => B_1_sel,
      O => B_TDATA(9)
    );
\ap_CS_fsm[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F4444444"
    )
        port map (
      I0 => ap_start,
      I1 => \ap_CS_fsm_reg_n_2_[0]\,
      I2 => B_1_ack_in,
      I3 => ap_CS_fsm_state2,
      I4 => exitcond_fu_62_p2,
      O => ap_NS_fsm(0)
    );
\ap_CS_fsm[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAC0EA"
    )
        port map (
      I0 => ap_CS_fsm_state2,
      I1 => \ap_CS_fsm_reg_n_2_[0]\,
      I2 => ap_start,
      I3 => B_1_ack_in,
      I4 => ap_CS_fsm_state4,
      O => ap_NS_fsm(1)
    );
\ap_CS_fsm[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"44F0F4F0"
    )
        port map (
      I0 => exitcond_fu_62_p2,
      I1 => ap_CS_fsm_state2,
      I2 => ap_CS_fsm_state3,
      I3 => B_1_ack_in,
      I4 => \A_0_state_reg_n_2_[0]\,
      O => ap_NS_fsm(2)
    );
\ap_CS_fsm[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F80"
    )
        port map (
      I0 => ap_CS_fsm_state3,
      I1 => \A_0_state_reg_n_2_[0]\,
      I2 => B_1_ack_in,
      I3 => ap_CS_fsm_state4,
      O => ap_NS_fsm(3)
    );
\ap_CS_fsm_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(0),
      Q => \ap_CS_fsm_reg_n_2_[0]\,
      S => ap_rst_n_inv
    );
\ap_CS_fsm_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(1),
      Q => ap_CS_fsm_state2,
      R => ap_rst_n_inv
    );
\ap_CS_fsm_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(2),
      Q => ap_CS_fsm_state3,
      R => ap_rst_n_inv
    );
\ap_CS_fsm_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(3),
      Q => ap_CS_fsm_state4,
      R => ap_rst_n_inv
    );
ap_idle_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \ap_CS_fsm_reg_n_2_[0]\,
      I1 => ap_start,
      O => ap_idle
    );
ap_ready_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => B_1_ack_in,
      I1 => ap_CS_fsm_state2,
      I2 => exitcond_fu_62_p2,
      O => \^ap_done\
    );
ap_ready_INST_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000100000000000"
    )
        port map (
      I0 => \i_reg_51_reg_n_2_[0]\,
      I1 => \i_reg_51_reg_n_2_[2]\,
      I2 => \i_reg_51_reg_n_2_[1]\,
      I3 => \i_reg_51_reg_n_2_[5]\,
      I4 => \i_reg_51_reg_n_2_[3]\,
      I5 => \i_reg_51_reg_n_2_[4]\,
      O => exitcond_fu_62_p2
    );
\i_1_reg_84[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \i_reg_51_reg_n_2_[0]\,
      O => i_1_fu_68_p2(0)
    );
\i_1_reg_84[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \i_reg_51_reg_n_2_[0]\,
      I1 => \i_reg_51_reg_n_2_[1]\,
      O => i_1_fu_68_p2(1)
    );
\i_1_reg_84[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \i_reg_51_reg_n_2_[0]\,
      I1 => \i_reg_51_reg_n_2_[1]\,
      I2 => \i_reg_51_reg_n_2_[2]\,
      O => i_1_fu_68_p2(2)
    );
\i_1_reg_84[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \i_reg_51_reg_n_2_[1]\,
      I1 => \i_reg_51_reg_n_2_[0]\,
      I2 => \i_reg_51_reg_n_2_[2]\,
      I3 => \i_reg_51_reg_n_2_[3]\,
      O => i_1_fu_68_p2(3)
    );
\i_1_reg_84[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \i_reg_51_reg_n_2_[2]\,
      I1 => \i_reg_51_reg_n_2_[0]\,
      I2 => \i_reg_51_reg_n_2_[1]\,
      I3 => \i_reg_51_reg_n_2_[3]\,
      I4 => \i_reg_51_reg_n_2_[4]\,
      O => i_1_fu_68_p2(4)
    );
\i_1_reg_84[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => ap_CS_fsm_state2,
      I1 => B_1_ack_in,
      O => i_1_reg_840
    );
\i_1_reg_84[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \i_reg_51_reg_n_2_[3]\,
      I1 => \i_reg_51_reg_n_2_[1]\,
      I2 => \i_reg_51_reg_n_2_[0]\,
      I3 => \i_reg_51_reg_n_2_[2]\,
      I4 => \i_reg_51_reg_n_2_[4]\,
      I5 => \i_reg_51_reg_n_2_[5]\,
      O => i_1_fu_68_p2(5)
    );
\i_1_reg_84_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => i_1_reg_840,
      D => i_1_fu_68_p2(0),
      Q => i_1_reg_84(0),
      R => '0'
    );
\i_1_reg_84_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => i_1_reg_840,
      D => i_1_fu_68_p2(1),
      Q => i_1_reg_84(1),
      R => '0'
    );
\i_1_reg_84_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => i_1_reg_840,
      D => i_1_fu_68_p2(2),
      Q => i_1_reg_84(2),
      R => '0'
    );
\i_1_reg_84_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => i_1_reg_840,
      D => i_1_fu_68_p2(3),
      Q => i_1_reg_84(3),
      R => '0'
    );
\i_1_reg_84_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => i_1_reg_840,
      D => i_1_fu_68_p2(4),
      Q => i_1_reg_84(4),
      R => '0'
    );
\i_1_reg_84_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => i_1_reg_840,
      D => i_1_fu_68_p2(5),
      Q => i_1_reg_84(5),
      R => '0'
    );
\i_reg_51[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0888"
    )
        port map (
      I0 => \ap_CS_fsm_reg_n_2_[0]\,
      I1 => ap_start,
      I2 => ap_CS_fsm_state4,
      I3 => B_1_ack_in,
      O => i_reg_51
    );
\i_reg_51[5]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => B_1_ack_in,
      I1 => ap_CS_fsm_state4,
      O => ap_NS_fsm1
    );
\i_reg_51_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => i_1_reg_84(0),
      Q => \i_reg_51_reg_n_2_[0]\,
      R => i_reg_51
    );
\i_reg_51_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => i_1_reg_84(1),
      Q => \i_reg_51_reg_n_2_[1]\,
      R => i_reg_51
    );
\i_reg_51_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => i_1_reg_84(2),
      Q => \i_reg_51_reg_n_2_[2]\,
      R => i_reg_51
    );
\i_reg_51_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => i_1_reg_84(3),
      Q => \i_reg_51_reg_n_2_[3]\,
      R => i_reg_51
    );
\i_reg_51_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => i_1_reg_84(4),
      Q => \i_reg_51_reg_n_2_[4]\,
      R => i_reg_51
    );
\i_reg_51_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => i_1_reg_84(5),
      Q => \i_reg_51_reg_n_2_[5]\,
      R => i_reg_51
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    A_TVALID : in STD_LOGIC;
    A_TREADY : out STD_LOGIC;
    A_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    B_TVALID : out STD_LOGIC;
    B_TREADY : in STD_LOGIC;
    B_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "prototype_watchman_example_0_0,example,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "example,Vivado 2018.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute x_interface_info : string;
  attribute x_interface_info of A_TREADY : signal is "xilinx.com:interface:axis:1.0 A TREADY";
  attribute x_interface_info of A_TVALID : signal is "xilinx.com:interface:axis:1.0 A TVALID";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of A_TVALID : signal is "XIL_INTERFACENAME A, TDATA_NUM_BYTES 4, TUSER_WIDTH 0, LAYERED_METADATA undef, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN prototype_watchman_processing_system7_0_0_FCLK_CLK0";
  attribute x_interface_info of B_TREADY : signal is "xilinx.com:interface:axis:1.0 B TREADY";
  attribute x_interface_info of B_TVALID : signal is "xilinx.com:interface:axis:1.0 B TVALID";
  attribute x_interface_parameter of B_TVALID : signal is "XIL_INTERFACENAME B, TDATA_NUM_BYTES 4, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}} TDATA_WIDTH 32}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN prototype_watchman_processing_system7_0_0_FCLK_CLK0";
  attribute x_interface_info of ap_clk : signal is "xilinx.com:signal:clock:1.0 ap_clk CLK";
  attribute x_interface_parameter of ap_clk : signal is "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF A:B, ASSOCIATED_RESET ap_rst_n, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN prototype_watchman_processing_system7_0_0_FCLK_CLK0";
  attribute x_interface_info of ap_done : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done";
  attribute x_interface_info of ap_idle : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle";
  attribute x_interface_info of ap_ready : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready";
  attribute x_interface_info of ap_rst_n : signal is "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  attribute x_interface_parameter of ap_rst_n : signal is "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  attribute x_interface_info of ap_start : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start";
  attribute x_interface_parameter of ap_start : signal is "XIL_INTERFACENAME ap_ctrl, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {start {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} done {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} idle {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} ready {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  attribute x_interface_info of A_TDATA : signal is "xilinx.com:interface:axis:1.0 A TDATA";
  attribute x_interface_info of B_TDATA : signal is "xilinx.com:interface:axis:1.0 B TDATA";
begin
U0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_example
     port map (
      A_TDATA(31 downto 0) => A_TDATA(31 downto 0),
      A_TREADY => A_TREADY,
      A_TVALID => A_TVALID,
      B_TDATA(31 downto 0) => B_TDATA(31 downto 0),
      B_TREADY => B_TREADY,
      B_TVALID => B_TVALID,
      ap_clk => ap_clk,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_ready => ap_ready,
      ap_rst_n => ap_rst_n,
      ap_start => ap_start
    );
end STRUCTURE;
