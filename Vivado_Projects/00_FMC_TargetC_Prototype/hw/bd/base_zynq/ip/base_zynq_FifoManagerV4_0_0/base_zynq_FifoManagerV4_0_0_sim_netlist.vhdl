-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
-- Date        : Thu Jan 24 09:24:14 2019
-- Host        : jonathan-Latitude-E7450 running 64-bit Linux Mint 18.1 Serena
-- Command     : write_vhdl -force -mode funcsim
--               /home/jonathan/VivadoProjects/00_WATCHMANN/TARGETC_Prototype/hw/bd/base_zynq/ip/base_zynq_FifoManagerV4_0_0/base_zynq_FifoManagerV4_0_0_sim_netlist.vhdl
-- Design      : base_zynq_FifoManagerV4_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags is
  port (
    AR : out STD_LOGIC_VECTOR ( 0 to 0 );
    \WDONBR_intl_reg[1]\ : out STD_LOGIC;
    o_rd_data : out STD_LOGIC_VECTOR ( 11 downto 0 );
    CLK : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    address : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \cnt_fifo_reg[5]\ : in STD_LOGIC;
    wr_en_reg : in STD_LOGIC;
    \r_FIFO_COUNT_reg[0]_0\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    nRST : in STD_LOGIC;
    p_0_in : in STD_LOGIC;
    \wr_data_reg[0][11]\ : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags : entity is "module_fifo_regs_no_flags";
end base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags;

architecture STRUCTURE of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags is
  signal \^ar\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \p_0_out_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_3\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_6\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_7\ : STD_LOGIC;
  signal p_0_out_carry_i_1_n_0 : STD_LOGIC;
  signal p_0_out_carry_i_2_n_0 : STD_LOGIC;
  signal p_0_out_carry_i_3_n_0 : STD_LOGIC;
  signal p_0_out_carry_i_4_n_0 : STD_LOGIC;
  signal \p_0_out_carry_i_5__2_n_0\ : STD_LOGIC;
  signal p_0_out_carry_n_0 : STD_LOGIC;
  signal p_0_out_carry_n_1 : STD_LOGIC;
  signal p_0_out_carry_n_2 : STD_LOGIC;
  signal p_0_out_carry_n_3 : STD_LOGIC;
  signal p_0_out_carry_n_4 : STD_LOGIC;
  signal p_0_out_carry_n_5 : STD_LOGIC;
  signal p_0_out_carry_n_6 : STD_LOGIC;
  signal p_0_out_carry_n_7 : STD_LOGIC;
  signal \r_FIFO_COUNT[0]_i_1_n_0\ : STD_LOGIC;
  signal \r_FIFO_COUNT[6]_i_1__2_n_0\ : STD_LOGIC;
  signal \r_FIFO_COUNT_reg__0\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal r_RD_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_RD_INDEX0 : STD_LOGIC;
  signal \r_RD_INDEX[0]_i_1_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[1]_i_1_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[2]_i_1_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[3]_i_2_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[4]_i_1_n_0\ : STD_LOGIC;
  signal r_WR_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_WR_INDEX0 : STD_LOGIC;
  signal \r_WR_INDEX[0]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[1]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[2]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[3]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_2_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_3_n_0\ : STD_LOGIC;
  signal \NLW_p_0_out_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_p_0_out_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of p_0_out_carry : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \p_0_out_carry__0\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_0_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_6_11 : label is "";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \r_RD_INDEX[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \r_RD_INDEX[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \r_RD_INDEX[3]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \r_RD_INDEX[4]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \r_WR_INDEX[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \r_WR_INDEX[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \r_WR_INDEX[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \r_WR_INDEX[4]_i_2\ : label is "soft_lutpair1";
begin
  AR(0) <= \^ar\(0);
FIFO_ReadEn_i_16: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FDFF"
    )
        port map (
      I0 => \r_FIFO_COUNT_reg__0\(5),
      I1 => \r_WR_INDEX[4]_i_3_n_0\,
      I2 => \r_FIFO_COUNT_reg[0]_0\,
      I3 => Q(0),
      O => \WDONBR_intl_reg[1]\
    );
FIFOvalid_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => nRST,
      O => \^ar\(0)
    );
p_0_out_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => p_0_out_carry_n_0,
      CO(2) => p_0_out_carry_n_1,
      CO(1) => p_0_out_carry_n_2,
      CO(0) => p_0_out_carry_n_3,
      CYINIT => \r_FIFO_COUNT_reg__0\(0),
      DI(3 downto 1) => \r_FIFO_COUNT_reg__0\(3 downto 1),
      DI(0) => p_0_out_carry_i_1_n_0,
      O(3) => p_0_out_carry_n_4,
      O(2) => p_0_out_carry_n_5,
      O(1) => p_0_out_carry_n_6,
      O(0) => p_0_out_carry_n_7,
      S(3) => p_0_out_carry_i_2_n_0,
      S(2) => p_0_out_carry_i_3_n_0,
      S(1) => p_0_out_carry_i_4_n_0,
      S(0) => \p_0_out_carry_i_5__2_n_0\
    );
\p_0_out_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => p_0_out_carry_n_0,
      CO(3 downto 1) => \NLW_p_0_out_carry__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \p_0_out_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \r_FIFO_COUNT_reg__0\(4),
      O(3 downto 2) => \NLW_p_0_out_carry__0_O_UNCONNECTED\(3 downto 2),
      O(1) => \p_0_out_carry__0_n_6\,
      O(0) => \p_0_out_carry__0_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \p_0_out_carry__0_i_1_n_0\,
      S(0) => \p_0_out_carry__0_i_2_n_0\
    );
\p_0_out_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \r_FIFO_COUNT_reg__0\(5),
      I1 => \r_FIFO_COUNT_reg__0\(6),
      O => \p_0_out_carry__0_i_1_n_0\
    );
\p_0_out_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \r_FIFO_COUNT_reg__0\(4),
      I1 => \r_FIFO_COUNT_reg__0\(5),
      O => \p_0_out_carry__0_i_2_n_0\
    );
p_0_out_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \r_FIFO_COUNT_reg__0\(1),
      O => p_0_out_carry_i_1_n_0
    );
p_0_out_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \r_FIFO_COUNT_reg__0\(3),
      I1 => \r_FIFO_COUNT_reg__0\(4),
      O => p_0_out_carry_i_2_n_0
    );
p_0_out_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \r_FIFO_COUNT_reg__0\(2),
      I1 => \r_FIFO_COUNT_reg__0\(3),
      O => p_0_out_carry_i_3_n_0
    );
p_0_out_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \r_FIFO_COUNT_reg__0\(1),
      I1 => \r_FIFO_COUNT_reg__0\(2),
      O => p_0_out_carry_i_4_n_0
    );
\p_0_out_carry_i_5__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA655555555"
    )
        port map (
      I0 => \r_FIFO_COUNT_reg__0\(1),
      I1 => rd_en,
      I2 => address(2),
      I3 => address(3),
      I4 => \cnt_fifo_reg[5]\,
      I5 => wr_en_reg,
      O => \p_0_out_carry_i_5__2_n_0\
    );
\r_FIFO_COUNT[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \r_FIFO_COUNT_reg__0\(0),
      O => \r_FIFO_COUNT[0]_i_1_n_0\
    );
\r_FIFO_COUNT[6]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA9AAAAAAAA"
    )
        port map (
      I0 => wr_en_reg,
      I1 => address(1),
      I2 => address(0),
      I3 => address(3),
      I4 => address(2),
      I5 => rd_en,
      O => \r_FIFO_COUNT[6]_i_1__2_n_0\
    );
\r_FIFO_COUNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__2_n_0\,
      D => \r_FIFO_COUNT[0]_i_1_n_0\,
      Q => \r_FIFO_COUNT_reg__0\(0),
      R => \^ar\(0)
    );
\r_FIFO_COUNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__2_n_0\,
      D => p_0_out_carry_n_7,
      Q => \r_FIFO_COUNT_reg__0\(1),
      R => \^ar\(0)
    );
\r_FIFO_COUNT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__2_n_0\,
      D => p_0_out_carry_n_6,
      Q => \r_FIFO_COUNT_reg__0\(2),
      R => \^ar\(0)
    );
\r_FIFO_COUNT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__2_n_0\,
      D => p_0_out_carry_n_5,
      Q => \r_FIFO_COUNT_reg__0\(3),
      R => \^ar\(0)
    );
\r_FIFO_COUNT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__2_n_0\,
      D => p_0_out_carry_n_4,
      Q => \r_FIFO_COUNT_reg__0\(4),
      R => \^ar\(0)
    );
\r_FIFO_COUNT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__2_n_0\,
      D => \p_0_out_carry__0_n_7\,
      Q => \r_FIFO_COUNT_reg__0\(5),
      R => \^ar\(0)
    );
\r_FIFO_COUNT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__2_n_0\,
      D => \p_0_out_carry__0_n_6\,
      Q => \r_FIFO_COUNT_reg__0\(6),
      R => \^ar\(0)
    );
r_FIFO_DATA_reg_0_31_0_5: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => \wr_data_reg[0][11]\(1 downto 0),
      DIB(1 downto 0) => \wr_data_reg[0][11]\(3 downto 2),
      DIC(1 downto 0) => \wr_data_reg[0][11]\(5 downto 4),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => o_rd_data(1 downto 0),
      DOB(1 downto 0) => o_rd_data(3 downto 2),
      DOC(1 downto 0) => o_rd_data(5 downto 4),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
r_FIFO_DATA_reg_0_31_6_11: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => \wr_data_reg[0][11]\(7 downto 6),
      DIB(1 downto 0) => \wr_data_reg[0][11]\(9 downto 8),
      DIC(1 downto 0) => \wr_data_reg[0][11]\(11 downto 10),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => o_rd_data(7 downto 6),
      DOB(1 downto 0) => o_rd_data(9 downto 8),
      DOC(1 downto 0) => o_rd_data(11 downto 10),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
\r_RD_INDEX[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_RD_INDEX(0),
      O => \r_RD_INDEX[0]_i_1_n_0\
    );
\r_RD_INDEX[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_RD_INDEX(0),
      I1 => r_RD_INDEX(1),
      O => \r_RD_INDEX[1]_i_1_n_0\
    );
\r_RD_INDEX[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      O => \r_RD_INDEX[2]_i_1_n_0\
    );
\r_RD_INDEX[3]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000C00000008"
    )
        port map (
      I0 => \r_WR_INDEX[4]_i_3_n_0\,
      I1 => rd_en,
      I2 => address(2),
      I3 => address(3),
      I4 => \cnt_fifo_reg[5]\,
      I5 => \r_FIFO_COUNT_reg__0\(5),
      O => r_RD_INDEX0
    );
\r_RD_INDEX[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      I3 => r_RD_INDEX(3),
      O => \r_RD_INDEX[3]_i_2_n_0\
    );
\r_RD_INDEX[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(4),
      I2 => r_RD_INDEX(0),
      I3 => r_RD_INDEX(1),
      I4 => r_RD_INDEX(3),
      O => \r_RD_INDEX[4]_i_1_n_0\
    );
\r_RD_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[0]_i_1_n_0\,
      Q => r_RD_INDEX(0),
      R => \^ar\(0)
    );
\r_RD_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[1]_i_1_n_0\,
      Q => r_RD_INDEX(1),
      R => \^ar\(0)
    );
\r_RD_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[2]_i_1_n_0\,
      Q => r_RD_INDEX(2),
      R => \^ar\(0)
    );
\r_RD_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[3]_i_2_n_0\,
      Q => r_RD_INDEX(3),
      R => \^ar\(0)
    );
\r_RD_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[4]_i_1_n_0\,
      Q => r_RD_INDEX(4),
      R => \^ar\(0)
    );
\r_WR_INDEX[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_WR_INDEX(0),
      O => \r_WR_INDEX[0]_i_1_n_0\
    );
\r_WR_INDEX[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_WR_INDEX(0),
      I1 => r_WR_INDEX(1),
      O => \r_WR_INDEX[1]_i_1_n_0\
    );
\r_WR_INDEX[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      O => \r_WR_INDEX[2]_i_1_n_0\
    );
\r_WR_INDEX[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      I3 => r_WR_INDEX(3),
      O => \r_WR_INDEX[3]_i_1_n_0\
    );
\r_WR_INDEX[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => \r_FIFO_COUNT_reg__0\(5),
      I1 => \r_WR_INDEX[4]_i_3_n_0\,
      I2 => wr_en_reg,
      O => r_WR_INDEX0
    );
\r_WR_INDEX[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(4),
      I2 => r_WR_INDEX(0),
      I3 => r_WR_INDEX(1),
      I4 => r_WR_INDEX(3),
      O => \r_WR_INDEX[4]_i_2_n_0\
    );
\r_WR_INDEX[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \r_FIFO_COUNT_reg__0\(0),
      I1 => \r_FIFO_COUNT_reg__0\(6),
      I2 => \r_FIFO_COUNT_reg__0\(4),
      I3 => \r_FIFO_COUNT_reg__0\(3),
      I4 => \r_FIFO_COUNT_reg__0\(1),
      I5 => \r_FIFO_COUNT_reg__0\(2),
      O => \r_WR_INDEX[4]_i_3_n_0\
    );
\r_WR_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[0]_i_1_n_0\,
      Q => r_WR_INDEX(0),
      R => \^ar\(0)
    );
\r_WR_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[1]_i_1_n_0\,
      Q => r_WR_INDEX(1),
      R => \^ar\(0)
    );
\r_WR_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[2]_i_1_n_0\,
      Q => r_WR_INDEX(2),
      R => \^ar\(0)
    );
\r_WR_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[3]_i_1_n_0\,
      Q => r_WR_INDEX(3),
      R => \^ar\(0)
    );
\r_WR_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[4]_i_2_n_0\,
      Q => r_WR_INDEX(4),
      R => \^ar\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_0 is
  port (
    full : out STD_LOGIC_VECTOR ( 0 to 0 );
    o_rd_data : out STD_LOGIC_VECTOR ( 11 downto 0 );
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    \cnt_fifo_reg[6]\ : in STD_LOGIC;
    address : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_en : in STD_LOGIC;
    wr_en_reg : in STD_LOGIC;
    p_0_in : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_0 : entity is "module_fifo_regs_no_flags";
end base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_0;

architecture STRUCTURE of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_0 is
  signal \p_0_out_carry__0_i_1__9_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_i_2__9_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_3\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_6\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_7\ : STD_LOGIC;
  signal \p_0_out_carry_i_1__9_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_2__9_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_3__9_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_4__9_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_5__10_n_0\ : STD_LOGIC;
  signal p_0_out_carry_n_0 : STD_LOGIC;
  signal p_0_out_carry_n_1 : STD_LOGIC;
  signal p_0_out_carry_n_2 : STD_LOGIC;
  signal p_0_out_carry_n_3 : STD_LOGIC;
  signal p_0_out_carry_n_4 : STD_LOGIC;
  signal p_0_out_carry_n_5 : STD_LOGIC;
  signal p_0_out_carry_n_6 : STD_LOGIC;
  signal p_0_out_carry_n_7 : STD_LOGIC;
  signal \r_FIFO_COUNT[0]_i_1__9_n_0\ : STD_LOGIC;
  signal \r_FIFO_COUNT[6]_i_1__10_n_0\ : STD_LOGIC;
  signal r_FIFO_COUNT_reg : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal r_RD_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_RD_INDEX0 : STD_LOGIC;
  signal \r_RD_INDEX[0]_i_1__9_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[1]_i_1__9_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[2]_i_1__9_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[3]_i_2__9_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[4]_i_1__9_n_0\ : STD_LOGIC;
  signal r_WR_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_WR_INDEX0 : STD_LOGIC;
  signal \r_WR_INDEX[0]_i_1__9_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[1]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[2]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[3]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_2_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_3__9_n_0\ : STD_LOGIC;
  signal \NLW_p_0_out_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_p_0_out_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of p_0_out_carry : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \p_0_out_carry__0\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_0_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_6_11 : label is "";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \r_RD_INDEX[1]_i_1__9\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \r_RD_INDEX[2]_i_1__9\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \r_RD_INDEX[3]_i_2__9\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \r_RD_INDEX[4]_i_1__9\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \r_WR_INDEX[1]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \r_WR_INDEX[2]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \r_WR_INDEX[3]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \r_WR_INDEX[4]_i_2\ : label is "soft_lutpair5";
begin
FIFO_ReadEn_i_8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(5),
      I1 => \r_WR_INDEX[4]_i_3__9_n_0\,
      O => full(0)
    );
p_0_out_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => p_0_out_carry_n_0,
      CO(2) => p_0_out_carry_n_1,
      CO(1) => p_0_out_carry_n_2,
      CO(0) => p_0_out_carry_n_3,
      CYINIT => r_FIFO_COUNT_reg(0),
      DI(3 downto 1) => r_FIFO_COUNT_reg(3 downto 1),
      DI(0) => \p_0_out_carry_i_1__9_n_0\,
      O(3) => p_0_out_carry_n_4,
      O(2) => p_0_out_carry_n_5,
      O(1) => p_0_out_carry_n_6,
      O(0) => p_0_out_carry_n_7,
      S(3) => \p_0_out_carry_i_2__9_n_0\,
      S(2) => \p_0_out_carry_i_3__9_n_0\,
      S(1) => \p_0_out_carry_i_4__9_n_0\,
      S(0) => \p_0_out_carry_i_5__10_n_0\
    );
\p_0_out_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => p_0_out_carry_n_0,
      CO(3 downto 1) => \NLW_p_0_out_carry__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \p_0_out_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => r_FIFO_COUNT_reg(4),
      O(3 downto 2) => \NLW_p_0_out_carry__0_O_UNCONNECTED\(3 downto 2),
      O(1) => \p_0_out_carry__0_n_6\,
      O(0) => \p_0_out_carry__0_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \p_0_out_carry__0_i_1__9_n_0\,
      S(0) => \p_0_out_carry__0_i_2__9_n_0\
    );
\p_0_out_carry__0_i_1__9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(5),
      I1 => r_FIFO_COUNT_reg(6),
      O => \p_0_out_carry__0_i_1__9_n_0\
    );
\p_0_out_carry__0_i_2__9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(4),
      I1 => r_FIFO_COUNT_reg(5),
      O => \p_0_out_carry__0_i_2__9_n_0\
    );
\p_0_out_carry_i_1__9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      O => \p_0_out_carry_i_1__9_n_0\
    );
\p_0_out_carry_i_2__9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(3),
      I1 => r_FIFO_COUNT_reg(4),
      O => \p_0_out_carry_i_2__9_n_0\
    );
\p_0_out_carry_i_3__9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(2),
      I1 => r_FIFO_COUNT_reg(3),
      O => \p_0_out_carry_i_3__9_n_0\
    );
\p_0_out_carry_i_4__9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => r_FIFO_COUNT_reg(2),
      O => \p_0_out_carry_i_4__9_n_0\
    );
\p_0_out_carry_i_5__10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA6AAAAA55555555"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => \cnt_fifo_reg[6]\,
      I2 => address(3),
      I3 => address(2),
      I4 => rd_en,
      I5 => wr_en_reg,
      O => \p_0_out_carry_i_5__10_n_0\
    );
\r_FIFO_COUNT[0]_i_1__9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      O => \r_FIFO_COUNT[0]_i_1__9_n_0\
    );
\r_FIFO_COUNT[6]_i_1__10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAA6AAAAAAAAAA"
    )
        port map (
      I0 => wr_en_reg,
      I1 => rd_en,
      I2 => address(2),
      I3 => address(3),
      I4 => address(0),
      I5 => address(1),
      O => \r_FIFO_COUNT[6]_i_1__10_n_0\
    );
\r_FIFO_COUNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__10_n_0\,
      D => \r_FIFO_COUNT[0]_i_1__9_n_0\,
      Q => r_FIFO_COUNT_reg(0),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__10_n_0\,
      D => p_0_out_carry_n_7,
      Q => r_FIFO_COUNT_reg(1),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__10_n_0\,
      D => p_0_out_carry_n_6,
      Q => r_FIFO_COUNT_reg(2),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__10_n_0\,
      D => p_0_out_carry_n_5,
      Q => r_FIFO_COUNT_reg(3),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__10_n_0\,
      D => p_0_out_carry_n_4,
      Q => r_FIFO_COUNT_reg(4),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__10_n_0\,
      D => \p_0_out_carry__0_n_7\,
      Q => r_FIFO_COUNT_reg(5),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__10_n_0\,
      D => \p_0_out_carry__0_n_6\,
      Q => r_FIFO_COUNT_reg(6),
      R => AR(0)
    );
r_FIFO_DATA_reg_0_31_0_5: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => Q(1 downto 0),
      DIB(1 downto 0) => Q(3 downto 2),
      DIC(1 downto 0) => Q(5 downto 4),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => o_rd_data(1 downto 0),
      DOB(1 downto 0) => o_rd_data(3 downto 2),
      DOC(1 downto 0) => o_rd_data(5 downto 4),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
r_FIFO_DATA_reg_0_31_6_11: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => Q(7 downto 6),
      DIB(1 downto 0) => Q(9 downto 8),
      DIC(1 downto 0) => Q(11 downto 10),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => o_rd_data(7 downto 6),
      DOB(1 downto 0) => o_rd_data(9 downto 8),
      DOC(1 downto 0) => o_rd_data(11 downto 10),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
\r_RD_INDEX[0]_i_1__9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_RD_INDEX(0),
      O => \r_RD_INDEX[0]_i_1__9_n_0\
    );
\r_RD_INDEX[1]_i_1__9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_RD_INDEX(0),
      I1 => r_RD_INDEX(1),
      O => \r_RD_INDEX[1]_i_1__9_n_0\
    );
\r_RD_INDEX[2]_i_1__9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      O => \r_RD_INDEX[2]_i_1__9_n_0\
    );
\r_RD_INDEX[3]_i_1__10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00C0000000800000"
    )
        port map (
      I0 => \r_WR_INDEX[4]_i_3__9_n_0\,
      I1 => \cnt_fifo_reg[6]\,
      I2 => address(3),
      I3 => address(2),
      I4 => rd_en,
      I5 => r_FIFO_COUNT_reg(5),
      O => r_RD_INDEX0
    );
\r_RD_INDEX[3]_i_2__9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      I3 => r_RD_INDEX(3),
      O => \r_RD_INDEX[3]_i_2__9_n_0\
    );
\r_RD_INDEX[4]_i_1__9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(4),
      I2 => r_RD_INDEX(0),
      I3 => r_RD_INDEX(1),
      I4 => r_RD_INDEX(3),
      O => \r_RD_INDEX[4]_i_1__9_n_0\
    );
\r_RD_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[0]_i_1__9_n_0\,
      Q => r_RD_INDEX(0),
      R => AR(0)
    );
\r_RD_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[1]_i_1__9_n_0\,
      Q => r_RD_INDEX(1),
      R => AR(0)
    );
\r_RD_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[2]_i_1__9_n_0\,
      Q => r_RD_INDEX(2),
      R => AR(0)
    );
\r_RD_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[3]_i_2__9_n_0\,
      Q => r_RD_INDEX(3),
      R => AR(0)
    );
\r_RD_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[4]_i_1__9_n_0\,
      Q => r_RD_INDEX(4),
      R => AR(0)
    );
\r_WR_INDEX[0]_i_1__9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_WR_INDEX(0),
      O => \r_WR_INDEX[0]_i_1__9_n_0\
    );
\r_WR_INDEX[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_WR_INDEX(0),
      I1 => r_WR_INDEX(1),
      O => \r_WR_INDEX[1]_i_1_n_0\
    );
\r_WR_INDEX[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      O => \r_WR_INDEX[2]_i_1_n_0\
    );
\r_WR_INDEX[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      I3 => r_WR_INDEX(3),
      O => \r_WR_INDEX[3]_i_1_n_0\
    );
\r_WR_INDEX[4]_i_1__9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => wr_en_reg,
      I1 => \r_WR_INDEX[4]_i_3__9_n_0\,
      I2 => r_FIFO_COUNT_reg(5),
      O => r_WR_INDEX0
    );
\r_WR_INDEX[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(4),
      I2 => r_WR_INDEX(0),
      I3 => r_WR_INDEX(1),
      I4 => r_WR_INDEX(3),
      O => \r_WR_INDEX[4]_i_2_n_0\
    );
\r_WR_INDEX[4]_i_3__9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      I1 => r_FIFO_COUNT_reg(6),
      I2 => r_FIFO_COUNT_reg(4),
      I3 => r_FIFO_COUNT_reg(3),
      I4 => r_FIFO_COUNT_reg(1),
      I5 => r_FIFO_COUNT_reg(2),
      O => \r_WR_INDEX[4]_i_3__9_n_0\
    );
\r_WR_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[0]_i_1__9_n_0\,
      Q => r_WR_INDEX(0),
      R => AR(0)
    );
\r_WR_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[1]_i_1_n_0\,
      Q => r_WR_INDEX(1),
      R => AR(0)
    );
\r_WR_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[2]_i_1_n_0\,
      Q => r_WR_INDEX(2),
      R => AR(0)
    );
\r_WR_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[3]_i_1_n_0\,
      Q => r_WR_INDEX(3),
      R => AR(0)
    );
\r_WR_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[4]_i_2_n_0\,
      Q => r_WR_INDEX(4),
      R => AR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_1 is
  port (
    D : out STD_LOGIC_VECTOR ( 11 downto 0 );
    o_rd_data : out STD_LOGIC_VECTOR ( 11 downto 0 );
    full : out STD_LOGIC_VECTOR ( 0 to 0 );
    \FIFO_WR_reg[valid]\ : out STD_LOGIC;
    FIFO_ReadEn_reg : out STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    \cnt_fifo_reg[5]\ : in STD_LOGIC;
    address : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_en : in STD_LOGIC;
    wr_en_reg : in STD_LOGIC;
    \wr_data_reg[3][7]\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \wr_data_reg[2][1]\ : in STD_LOGIC;
    \wr_data_reg[2][1]_0\ : in STD_LOGIC;
    \wr_data_reg[2][1]_1\ : in STD_LOGIC;
    \wr_data_reg[2][1]_2\ : in STD_LOGIC;
    \wr_data_reg[2][1]_3\ : in STD_LOGIC;
    \wr_data_reg[2][1]_4\ : in STD_LOGIC;
    \wr_data_reg[2][7]\ : in STD_LOGIC;
    \wr_data_reg[2][7]_0\ : in STD_LOGIC;
    \wr_data_reg[2][7]_1\ : in STD_LOGIC;
    \wr_data_reg[2][7]_2\ : in STD_LOGIC;
    \wr_data_reg[2][7]_3\ : in STD_LOGIC;
    \wr_data_reg[2][7]_4\ : in STD_LOGIC;
    \r_FIFO_COUNT_reg[5]_0\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \r_FIFO_COUNT_reg[5]_1\ : in STD_LOGIC;
    \r_FIFO_COUNT_reg[5]_2\ : in STD_LOGIC;
    \r_FIFO_COUNT_reg[5]_3\ : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_onehot_fifo_wr_stm_reg[2]\ : in STD_LOGIC;
    \FIFO_WR_reg[valid]0\ : in STD_LOGIC;
    \FIFO_WR_reg[valid]_0\ : in STD_LOGIC;
    \FSM_onehot_fifo_wr_stm_reg[6]\ : in STD_LOGIC;
    \FSM_onehot_fifo_wr_stm_reg[6]_0\ : in STD_LOGIC;
    \FSM_onehot_fifo_wr_stm_reg[7]\ : in STD_LOGIC;
    FIFO_ReadEn : in STD_LOGIC;
    p_0_in : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_1 : entity is "module_fifo_regs_no_flags";
end base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_1;

architecture STRUCTURE of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_1 is
  signal FIFO_ReadEn_i_3_n_0 : STD_LOGIC;
  signal \^full\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^o_rd_data\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \p_0_out_carry__0_i_1__10_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_i_2__10_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_3\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_6\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_7\ : STD_LOGIC;
  signal \p_0_out_carry_i_1__10_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_2__10_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_3__10_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_4__10_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_5__13_n_0\ : STD_LOGIC;
  signal p_0_out_carry_n_0 : STD_LOGIC;
  signal p_0_out_carry_n_1 : STD_LOGIC;
  signal p_0_out_carry_n_2 : STD_LOGIC;
  signal p_0_out_carry_n_3 : STD_LOGIC;
  signal p_0_out_carry_n_4 : STD_LOGIC;
  signal p_0_out_carry_n_5 : STD_LOGIC;
  signal p_0_out_carry_n_6 : STD_LOGIC;
  signal p_0_out_carry_n_7 : STD_LOGIC;
  signal \r_FIFO_COUNT[0]_i_1__10_n_0\ : STD_LOGIC;
  signal \r_FIFO_COUNT[6]_i_1__13_n_0\ : STD_LOGIC;
  signal r_FIFO_COUNT_reg : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal r_RD_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_RD_INDEX0 : STD_LOGIC;
  signal \r_RD_INDEX[0]_i_1__10_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[1]_i_1__10_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[2]_i_1__10_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[3]_i_2__10_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[4]_i_1__10_n_0\ : STD_LOGIC;
  signal r_WR_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_WR_INDEX0 : STD_LOGIC;
  signal \r_WR_INDEX[0]_i_1__10_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[1]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[2]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[3]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_2_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_3__10_n_0\ : STD_LOGIC;
  signal \NLW_p_0_out_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_p_0_out_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of p_0_out_carry : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \p_0_out_carry__0\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_0_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_6_11 : label is "";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \r_RD_INDEX[1]_i_1__10\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \r_RD_INDEX[2]_i_1__10\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \r_RD_INDEX[3]_i_2__10\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \r_RD_INDEX[4]_i_1__10\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \r_WR_INDEX[1]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \r_WR_INDEX[2]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \r_WR_INDEX[3]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \r_WR_INDEX[4]_i_2\ : label is "soft_lutpair8";
begin
  full(0) <= \^full\(0);
  o_rd_data(11 downto 0) <= \^o_rd_data\(11 downto 0);
\DataOut_stall[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF05010400"
    )
        port map (
      I0 => \cnt_fifo_reg[5]\,
      I1 => address(3),
      I2 => address(2),
      I3 => \^o_rd_data\(0),
      I4 => \wr_data_reg[3][7]\(0),
      I5 => \wr_data_reg[2][1]\,
      O => D(0)
    );
\DataOut_stall[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF05010400"
    )
        port map (
      I0 => \cnt_fifo_reg[5]\,
      I1 => address(3),
      I2 => address(2),
      I3 => \^o_rd_data\(10),
      I4 => \wr_data_reg[3][7]\(10),
      I5 => \wr_data_reg[2][7]_3\,
      O => D(10)
    );
\DataOut_stall[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF05010400"
    )
        port map (
      I0 => \cnt_fifo_reg[5]\,
      I1 => address(3),
      I2 => address(2),
      I3 => \^o_rd_data\(11),
      I4 => \wr_data_reg[3][7]\(11),
      I5 => \wr_data_reg[2][7]_4\,
      O => D(11)
    );
\DataOut_stall[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF05010400"
    )
        port map (
      I0 => \cnt_fifo_reg[5]\,
      I1 => address(3),
      I2 => address(2),
      I3 => \^o_rd_data\(1),
      I4 => \wr_data_reg[3][7]\(1),
      I5 => \wr_data_reg[2][1]_0\,
      O => D(1)
    );
\DataOut_stall[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF05010400"
    )
        port map (
      I0 => \cnt_fifo_reg[5]\,
      I1 => address(3),
      I2 => address(2),
      I3 => \^o_rd_data\(2),
      I4 => \wr_data_reg[3][7]\(2),
      I5 => \wr_data_reg[2][1]_1\,
      O => D(2)
    );
\DataOut_stall[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF05010400"
    )
        port map (
      I0 => \cnt_fifo_reg[5]\,
      I1 => address(3),
      I2 => address(2),
      I3 => \^o_rd_data\(3),
      I4 => \wr_data_reg[3][7]\(3),
      I5 => \wr_data_reg[2][1]_2\,
      O => D(3)
    );
\DataOut_stall[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF05010400"
    )
        port map (
      I0 => \cnt_fifo_reg[5]\,
      I1 => address(3),
      I2 => address(2),
      I3 => \^o_rd_data\(4),
      I4 => \wr_data_reg[3][7]\(4),
      I5 => \wr_data_reg[2][1]_3\,
      O => D(4)
    );
\DataOut_stall[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF05010400"
    )
        port map (
      I0 => \cnt_fifo_reg[5]\,
      I1 => address(3),
      I2 => address(2),
      I3 => \^o_rd_data\(5),
      I4 => \wr_data_reg[3][7]\(5),
      I5 => \wr_data_reg[2][1]_4\,
      O => D(5)
    );
\DataOut_stall[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF05010400"
    )
        port map (
      I0 => \cnt_fifo_reg[5]\,
      I1 => address(3),
      I2 => address(2),
      I3 => \^o_rd_data\(6),
      I4 => \wr_data_reg[3][7]\(6),
      I5 => \wr_data_reg[2][7]\,
      O => D(6)
    );
\DataOut_stall[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF05010400"
    )
        port map (
      I0 => \cnt_fifo_reg[5]\,
      I1 => address(3),
      I2 => address(2),
      I3 => \^o_rd_data\(7),
      I4 => \wr_data_reg[3][7]\(7),
      I5 => \wr_data_reg[2][7]_0\,
      O => D(7)
    );
\DataOut_stall[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF05010400"
    )
        port map (
      I0 => \cnt_fifo_reg[5]\,
      I1 => address(3),
      I2 => address(2),
      I3 => \^o_rd_data\(8),
      I4 => \wr_data_reg[3][7]\(8),
      I5 => \wr_data_reg[2][7]_1\,
      O => D(8)
    );
\DataOut_stall[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF05010400"
    )
        port map (
      I0 => \cnt_fifo_reg[5]\,
      I1 => address(3),
      I2 => address(2),
      I3 => \^o_rd_data\(9),
      I4 => \wr_data_reg[3][7]\(9),
      I5 => \wr_data_reg[2][7]_2\,
      O => D(9)
    );
FIFO_ReadEn_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAFBFFAAAA0800"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg[6]\,
      I1 => FIFO_ReadEn_i_3_n_0,
      I2 => \r_FIFO_COUNT_reg[5]_3\,
      I3 => \FSM_onehot_fifo_wr_stm_reg[6]_0\,
      I4 => \FSM_onehot_fifo_wr_stm_reg[7]\,
      I5 => FIFO_ReadEn,
      O => FIFO_ReadEn_reg
    );
FIFO_ReadEn_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^full\(0),
      I1 => \r_FIFO_COUNT_reg[5]_0\(2),
      I2 => \r_FIFO_COUNT_reg[5]_0\(1),
      I3 => \r_FIFO_COUNT_reg[5]_0\(0),
      I4 => \r_FIFO_COUNT_reg[5]_1\,
      I5 => \r_FIFO_COUNT_reg[5]_2\,
      O => FIFO_ReadEn_i_3_n_0
    );
FIFO_ReadEn_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(5),
      I1 => \r_WR_INDEX[4]_i_3__10_n_0\,
      O => \^full\(0)
    );
\FIFO_WR[valid]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF20FFFFFF200000"
    )
        port map (
      I0 => FIFO_ReadEn_i_3_n_0,
      I1 => \r_FIFO_COUNT_reg[5]_3\,
      I2 => \out\(0),
      I3 => \FSM_onehot_fifo_wr_stm_reg[2]\,
      I4 => \FIFO_WR_reg[valid]0\,
      I5 => \FIFO_WR_reg[valid]_0\,
      O => \FIFO_WR_reg[valid]\
    );
p_0_out_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => p_0_out_carry_n_0,
      CO(2) => p_0_out_carry_n_1,
      CO(1) => p_0_out_carry_n_2,
      CO(0) => p_0_out_carry_n_3,
      CYINIT => r_FIFO_COUNT_reg(0),
      DI(3 downto 1) => r_FIFO_COUNT_reg(3 downto 1),
      DI(0) => \p_0_out_carry_i_1__10_n_0\,
      O(3) => p_0_out_carry_n_4,
      O(2) => p_0_out_carry_n_5,
      O(1) => p_0_out_carry_n_6,
      O(0) => p_0_out_carry_n_7,
      S(3) => \p_0_out_carry_i_2__10_n_0\,
      S(2) => \p_0_out_carry_i_3__10_n_0\,
      S(1) => \p_0_out_carry_i_4__10_n_0\,
      S(0) => \p_0_out_carry_i_5__13_n_0\
    );
\p_0_out_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => p_0_out_carry_n_0,
      CO(3 downto 1) => \NLW_p_0_out_carry__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \p_0_out_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => r_FIFO_COUNT_reg(4),
      O(3 downto 2) => \NLW_p_0_out_carry__0_O_UNCONNECTED\(3 downto 2),
      O(1) => \p_0_out_carry__0_n_6\,
      O(0) => \p_0_out_carry__0_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \p_0_out_carry__0_i_1__10_n_0\,
      S(0) => \p_0_out_carry__0_i_2__10_n_0\
    );
\p_0_out_carry__0_i_1__10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(5),
      I1 => r_FIFO_COUNT_reg(6),
      O => \p_0_out_carry__0_i_1__10_n_0\
    );
\p_0_out_carry__0_i_2__10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(4),
      I1 => r_FIFO_COUNT_reg(5),
      O => \p_0_out_carry__0_i_2__10_n_0\
    );
\p_0_out_carry_i_1__10\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      O => \p_0_out_carry_i_1__10_n_0\
    );
\p_0_out_carry_i_2__10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(3),
      I1 => r_FIFO_COUNT_reg(4),
      O => \p_0_out_carry_i_2__10_n_0\
    );
\p_0_out_carry_i_3__10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(2),
      I1 => r_FIFO_COUNT_reg(3),
      O => \p_0_out_carry_i_3__10_n_0\
    );
\p_0_out_carry_i_4__10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => r_FIFO_COUNT_reg(2),
      O => \p_0_out_carry_i_4__10_n_0\
    );
\p_0_out_carry_i_5__13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA9AAAAA55555555"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => \cnt_fifo_reg[5]\,
      I2 => address(3),
      I3 => address(2),
      I4 => rd_en,
      I5 => wr_en_reg,
      O => \p_0_out_carry_i_5__13_n_0\
    );
\r_FIFO_COUNT[0]_i_1__10\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      O => \r_FIFO_COUNT[0]_i_1__10_n_0\
    );
\r_FIFO_COUNT[6]_i_1__13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A6AAAAAAAAAAAAAA"
    )
        port map (
      I0 => wr_en_reg,
      I1 => rd_en,
      I2 => address(2),
      I3 => address(3),
      I4 => address(1),
      I5 => address(0),
      O => \r_FIFO_COUNT[6]_i_1__13_n_0\
    );
\r_FIFO_COUNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__13_n_0\,
      D => \r_FIFO_COUNT[0]_i_1__10_n_0\,
      Q => r_FIFO_COUNT_reg(0),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__13_n_0\,
      D => p_0_out_carry_n_7,
      Q => r_FIFO_COUNT_reg(1),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__13_n_0\,
      D => p_0_out_carry_n_6,
      Q => r_FIFO_COUNT_reg(2),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__13_n_0\,
      D => p_0_out_carry_n_5,
      Q => r_FIFO_COUNT_reg(3),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__13_n_0\,
      D => p_0_out_carry_n_4,
      Q => r_FIFO_COUNT_reg(4),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__13_n_0\,
      D => \p_0_out_carry__0_n_7\,
      Q => r_FIFO_COUNT_reg(5),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__13_n_0\,
      D => \p_0_out_carry__0_n_6\,
      Q => r_FIFO_COUNT_reg(6),
      R => AR(0)
    );
r_FIFO_DATA_reg_0_31_0_5: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => Q(1 downto 0),
      DIB(1 downto 0) => Q(3 downto 2),
      DIC(1 downto 0) => Q(5 downto 4),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => \^o_rd_data\(1 downto 0),
      DOB(1 downto 0) => \^o_rd_data\(3 downto 2),
      DOC(1 downto 0) => \^o_rd_data\(5 downto 4),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
r_FIFO_DATA_reg_0_31_6_11: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => Q(7 downto 6),
      DIB(1 downto 0) => Q(9 downto 8),
      DIC(1 downto 0) => Q(11 downto 10),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => \^o_rd_data\(7 downto 6),
      DOB(1 downto 0) => \^o_rd_data\(9 downto 8),
      DOC(1 downto 0) => \^o_rd_data\(11 downto 10),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
\r_RD_INDEX[0]_i_1__10\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_RD_INDEX(0),
      O => \r_RD_INDEX[0]_i_1__10_n_0\
    );
\r_RD_INDEX[1]_i_1__10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_RD_INDEX(0),
      I1 => r_RD_INDEX(1),
      O => \r_RD_INDEX[1]_i_1__10_n_0\
    );
\r_RD_INDEX[2]_i_1__10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      O => \r_RD_INDEX[2]_i_1__10_n_0\
    );
\r_RD_INDEX[3]_i_1__13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0030000000200000"
    )
        port map (
      I0 => \r_WR_INDEX[4]_i_3__10_n_0\,
      I1 => \cnt_fifo_reg[5]\,
      I2 => address(3),
      I3 => address(2),
      I4 => rd_en,
      I5 => r_FIFO_COUNT_reg(5),
      O => r_RD_INDEX0
    );
\r_RD_INDEX[3]_i_2__10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      I3 => r_RD_INDEX(3),
      O => \r_RD_INDEX[3]_i_2__10_n_0\
    );
\r_RD_INDEX[4]_i_1__10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(4),
      I2 => r_RD_INDEX(0),
      I3 => r_RD_INDEX(1),
      I4 => r_RD_INDEX(3),
      O => \r_RD_INDEX[4]_i_1__10_n_0\
    );
\r_RD_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[0]_i_1__10_n_0\,
      Q => r_RD_INDEX(0),
      R => AR(0)
    );
\r_RD_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[1]_i_1__10_n_0\,
      Q => r_RD_INDEX(1),
      R => AR(0)
    );
\r_RD_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[2]_i_1__10_n_0\,
      Q => r_RD_INDEX(2),
      R => AR(0)
    );
\r_RD_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[3]_i_2__10_n_0\,
      Q => r_RD_INDEX(3),
      R => AR(0)
    );
\r_RD_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[4]_i_1__10_n_0\,
      Q => r_RD_INDEX(4),
      R => AR(0)
    );
\r_WR_INDEX[0]_i_1__10\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_WR_INDEX(0),
      O => \r_WR_INDEX[0]_i_1__10_n_0\
    );
\r_WR_INDEX[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_WR_INDEX(0),
      I1 => r_WR_INDEX(1),
      O => \r_WR_INDEX[1]_i_1_n_0\
    );
\r_WR_INDEX[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      O => \r_WR_INDEX[2]_i_1_n_0\
    );
\r_WR_INDEX[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      I3 => r_WR_INDEX(3),
      O => \r_WR_INDEX[3]_i_1_n_0\
    );
\r_WR_INDEX[4]_i_1__10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => wr_en_reg,
      I1 => \r_WR_INDEX[4]_i_3__10_n_0\,
      I2 => r_FIFO_COUNT_reg(5),
      O => r_WR_INDEX0
    );
\r_WR_INDEX[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(4),
      I2 => r_WR_INDEX(0),
      I3 => r_WR_INDEX(1),
      I4 => r_WR_INDEX(3),
      O => \r_WR_INDEX[4]_i_2_n_0\
    );
\r_WR_INDEX[4]_i_3__10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      I1 => r_FIFO_COUNT_reg(6),
      I2 => r_FIFO_COUNT_reg(4),
      I3 => r_FIFO_COUNT_reg(3),
      I4 => r_FIFO_COUNT_reg(1),
      I5 => r_FIFO_COUNT_reg(2),
      O => \r_WR_INDEX[4]_i_3__10_n_0\
    );
\r_WR_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[0]_i_1__10_n_0\,
      Q => r_WR_INDEX(0),
      R => AR(0)
    );
\r_WR_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[1]_i_1_n_0\,
      Q => r_WR_INDEX(1),
      R => AR(0)
    );
\r_WR_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[2]_i_1_n_0\,
      Q => r_WR_INDEX(2),
      R => AR(0)
    );
\r_WR_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[3]_i_1_n_0\,
      Q => r_WR_INDEX(3),
      R => AR(0)
    );
\r_WR_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[4]_i_2_n_0\,
      Q => r_WR_INDEX(4),
      R => AR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_10 is
  port (
    \r_RD_INDEX_reg[4]_0\ : out STD_LOGIC;
    \DataOut_last_reg[0]\ : out STD_LOGIC;
    \DataOut_last_reg[1]\ : out STD_LOGIC;
    \DataOut_last_reg[2]\ : out STD_LOGIC;
    \DataOut_last_reg[3]\ : out STD_LOGIC;
    \DataOut_last_reg[4]\ : out STD_LOGIC;
    \DataOut_last_reg[5]\ : out STD_LOGIC;
    \DataOut_last_reg[6]\ : out STD_LOGIC;
    \DataOut_last_reg[7]\ : out STD_LOGIC;
    \DataOut_last_reg[8]\ : out STD_LOGIC;
    \DataOut_last_reg[9]\ : out STD_LOGIC;
    \DataOut_last_reg[10]\ : out STD_LOGIC;
    \DataOut_last_reg[11]\ : out STD_LOGIC;
    \WDONBR_intl_reg[1]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    address : in STD_LOGIC_VECTOR ( 3 downto 0 );
    wr_en_reg : in STD_LOGIC;
    o_rd_data : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \wr_data_reg[4][7]\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \wr_data_reg[6][7]\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    p_0_in : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_10 : entity is "module_fifo_regs_no_flags";
end base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_10;

architecture STRUCTURE of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_10 is
  signal \p_0_out_carry__0_i_1__4_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_i_2__4_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_3\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_6\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_7\ : STD_LOGIC;
  signal \p_0_out_carry_i_1__4_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_2__4_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_3__4_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_4__4_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_5__8_n_0\ : STD_LOGIC;
  signal p_0_out_carry_n_0 : STD_LOGIC;
  signal p_0_out_carry_n_1 : STD_LOGIC;
  signal p_0_out_carry_n_2 : STD_LOGIC;
  signal p_0_out_carry_n_3 : STD_LOGIC;
  signal p_0_out_carry_n_4 : STD_LOGIC;
  signal p_0_out_carry_n_5 : STD_LOGIC;
  signal p_0_out_carry_n_6 : STD_LOGIC;
  signal p_0_out_carry_n_7 : STD_LOGIC;
  signal \r_FIFO_COUNT[0]_i_1__4_n_0\ : STD_LOGIC;
  signal \r_FIFO_COUNT[6]_i_1__8_n_0\ : STD_LOGIC;
  signal r_FIFO_COUNT_reg : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal r_RD_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_RD_INDEX0 : STD_LOGIC;
  signal \r_RD_INDEX[0]_i_1__4_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[1]_i_1__4_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[2]_i_1__4_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[3]_i_2__4_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[4]_i_1__4_n_0\ : STD_LOGIC;
  signal \^r_rd_index_reg[4]_0\ : STD_LOGIC;
  signal r_WR_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_WR_INDEX0 : STD_LOGIC;
  signal \r_WR_INDEX[0]_i_1__4_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[1]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[2]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[3]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_2_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_3__4_n_0\ : STD_LOGIC;
  signal \rd_data12[5]_5\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \NLW_p_0_out_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_p_0_out_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of p_0_out_carry : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \p_0_out_carry__0\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_0_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_6_11 : label is "";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \r_RD_INDEX[1]_i_1__4\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \r_RD_INDEX[2]_i_1__4\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \r_RD_INDEX[3]_i_2__4\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \r_RD_INDEX[4]_i_1__4\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \r_WR_INDEX[1]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \r_WR_INDEX[2]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \r_WR_INDEX[3]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \r_WR_INDEX[4]_i_2\ : label is "soft_lutpair46";
begin
  \r_RD_INDEX_reg[4]_0\ <= \^r_rd_index_reg[4]_0\;
\DataOut[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAFFF0CCAA00F0"
    )
        port map (
      I0 => \rd_data12[5]_5\(0),
      I1 => o_rd_data(0),
      I2 => \wr_data_reg[4][7]\(0),
      I3 => address(1),
      I4 => address(0),
      I5 => \wr_data_reg[6][7]\(0),
      O => \DataOut_last_reg[0]\
    );
\DataOut[10]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAFFF0CCAA00F0"
    )
        port map (
      I0 => \rd_data12[5]_5\(10),
      I1 => o_rd_data(10),
      I2 => \wr_data_reg[4][7]\(10),
      I3 => address(1),
      I4 => address(0),
      I5 => \wr_data_reg[6][7]\(10),
      O => \DataOut_last_reg[10]\
    );
\DataOut[11]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAFFF0CCAA00F0"
    )
        port map (
      I0 => \rd_data12[5]_5\(11),
      I1 => o_rd_data(11),
      I2 => \wr_data_reg[4][7]\(11),
      I3 => address(1),
      I4 => address(0),
      I5 => \wr_data_reg[6][7]\(11),
      O => \DataOut_last_reg[11]\
    );
\DataOut[1]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAFFF0CCAA00F0"
    )
        port map (
      I0 => \rd_data12[5]_5\(1),
      I1 => o_rd_data(1),
      I2 => \wr_data_reg[4][7]\(1),
      I3 => address(1),
      I4 => address(0),
      I5 => \wr_data_reg[6][7]\(1),
      O => \DataOut_last_reg[1]\
    );
\DataOut[2]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAFFF0CCAA00F0"
    )
        port map (
      I0 => \rd_data12[5]_5\(2),
      I1 => o_rd_data(2),
      I2 => \wr_data_reg[4][7]\(2),
      I3 => address(1),
      I4 => address(0),
      I5 => \wr_data_reg[6][7]\(2),
      O => \DataOut_last_reg[2]\
    );
\DataOut[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAFFF0CCAA00F0"
    )
        port map (
      I0 => \rd_data12[5]_5\(3),
      I1 => o_rd_data(3),
      I2 => \wr_data_reg[4][7]\(3),
      I3 => address(1),
      I4 => address(0),
      I5 => \wr_data_reg[6][7]\(3),
      O => \DataOut_last_reg[3]\
    );
\DataOut[4]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAFFF0CCAA00F0"
    )
        port map (
      I0 => \rd_data12[5]_5\(4),
      I1 => o_rd_data(4),
      I2 => \wr_data_reg[4][7]\(4),
      I3 => address(1),
      I4 => address(0),
      I5 => \wr_data_reg[6][7]\(4),
      O => \DataOut_last_reg[4]\
    );
\DataOut[5]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAFFF0CCAA00F0"
    )
        port map (
      I0 => \rd_data12[5]_5\(5),
      I1 => o_rd_data(5),
      I2 => \wr_data_reg[4][7]\(5),
      I3 => address(1),
      I4 => address(0),
      I5 => \wr_data_reg[6][7]\(5),
      O => \DataOut_last_reg[5]\
    );
\DataOut[6]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAFFF0CCAA00F0"
    )
        port map (
      I0 => \rd_data12[5]_5\(6),
      I1 => o_rd_data(6),
      I2 => \wr_data_reg[4][7]\(6),
      I3 => address(1),
      I4 => address(0),
      I5 => \wr_data_reg[6][7]\(6),
      O => \DataOut_last_reg[6]\
    );
\DataOut[7]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAFFF0CCAA00F0"
    )
        port map (
      I0 => \rd_data12[5]_5\(7),
      I1 => o_rd_data(7),
      I2 => \wr_data_reg[4][7]\(7),
      I3 => address(1),
      I4 => address(0),
      I5 => \wr_data_reg[6][7]\(7),
      O => \DataOut_last_reg[7]\
    );
\DataOut[8]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAFFF0CCAA00F0"
    )
        port map (
      I0 => \rd_data12[5]_5\(8),
      I1 => o_rd_data(8),
      I2 => \wr_data_reg[4][7]\(8),
      I3 => address(1),
      I4 => address(0),
      I5 => \wr_data_reg[6][7]\(8),
      O => \DataOut_last_reg[8]\
    );
\DataOut[9]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAFFF0CCAA00F0"
    )
        port map (
      I0 => \rd_data12[5]_5\(9),
      I1 => o_rd_data(9),
      I2 => \wr_data_reg[4][7]\(9),
      I3 => address(1),
      I4 => address(0),
      I5 => \wr_data_reg[6][7]\(9),
      O => \DataOut_last_reg[9]\
    );
FIFO_ReadEn_i_13: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(5),
      I1 => \r_WR_INDEX[4]_i_3__4_n_0\,
      O => \WDONBR_intl_reg[1]\(0)
    );
p_0_out_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => p_0_out_carry_n_0,
      CO(2) => p_0_out_carry_n_1,
      CO(1) => p_0_out_carry_n_2,
      CO(0) => p_0_out_carry_n_3,
      CYINIT => r_FIFO_COUNT_reg(0),
      DI(3 downto 1) => r_FIFO_COUNT_reg(3 downto 1),
      DI(0) => \p_0_out_carry_i_1__4_n_0\,
      O(3) => p_0_out_carry_n_4,
      O(2) => p_0_out_carry_n_5,
      O(1) => p_0_out_carry_n_6,
      O(0) => p_0_out_carry_n_7,
      S(3) => \p_0_out_carry_i_2__4_n_0\,
      S(2) => \p_0_out_carry_i_3__4_n_0\,
      S(1) => \p_0_out_carry_i_4__4_n_0\,
      S(0) => \p_0_out_carry_i_5__8_n_0\
    );
\p_0_out_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => p_0_out_carry_n_0,
      CO(3 downto 1) => \NLW_p_0_out_carry__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \p_0_out_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => r_FIFO_COUNT_reg(4),
      O(3 downto 2) => \NLW_p_0_out_carry__0_O_UNCONNECTED\(3 downto 2),
      O(1) => \p_0_out_carry__0_n_6\,
      O(0) => \p_0_out_carry__0_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \p_0_out_carry__0_i_1__4_n_0\,
      S(0) => \p_0_out_carry__0_i_2__4_n_0\
    );
\p_0_out_carry__0_i_1__4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(5),
      I1 => r_FIFO_COUNT_reg(6),
      O => \p_0_out_carry__0_i_1__4_n_0\
    );
\p_0_out_carry__0_i_2__4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(4),
      I1 => r_FIFO_COUNT_reg(5),
      O => \p_0_out_carry__0_i_2__4_n_0\
    );
\p_0_out_carry_i_1__4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      O => \p_0_out_carry_i_1__4_n_0\
    );
\p_0_out_carry_i_2__4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(3),
      I1 => r_FIFO_COUNT_reg(4),
      O => \p_0_out_carry_i_2__4_n_0\
    );
\p_0_out_carry_i_3__4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(2),
      I1 => r_FIFO_COUNT_reg(3),
      O => \p_0_out_carry_i_3__4_n_0\
    );
\p_0_out_carry_i_4__4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => r_FIFO_COUNT_reg(2),
      O => \p_0_out_carry_i_4__4_n_0\
    );
\p_0_out_carry_i_5__8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA6AAAAA55555555"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => rd_en,
      I2 => address(2),
      I3 => address(3),
      I4 => \^r_rd_index_reg[4]_0\,
      I5 => wr_en_reg,
      O => \p_0_out_carry_i_5__8_n_0\
    );
\p_0_out_carry_i_6__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => address(0),
      I1 => address(1),
      O => \^r_rd_index_reg[4]_0\
    );
\r_FIFO_COUNT[0]_i_1__4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      O => \r_FIFO_COUNT[0]_i_1__4_n_0\
    );
\r_FIFO_COUNT[6]_i_1__8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA6AAAAAAAAAAAA"
    )
        port map (
      I0 => wr_en_reg,
      I1 => address(0),
      I2 => address(1),
      I3 => address(3),
      I4 => address(2),
      I5 => rd_en,
      O => \r_FIFO_COUNT[6]_i_1__8_n_0\
    );
\r_FIFO_COUNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__8_n_0\,
      D => \r_FIFO_COUNT[0]_i_1__4_n_0\,
      Q => r_FIFO_COUNT_reg(0),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__8_n_0\,
      D => p_0_out_carry_n_7,
      Q => r_FIFO_COUNT_reg(1),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__8_n_0\,
      D => p_0_out_carry_n_6,
      Q => r_FIFO_COUNT_reg(2),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__8_n_0\,
      D => p_0_out_carry_n_5,
      Q => r_FIFO_COUNT_reg(3),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__8_n_0\,
      D => p_0_out_carry_n_4,
      Q => r_FIFO_COUNT_reg(4),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__8_n_0\,
      D => \p_0_out_carry__0_n_7\,
      Q => r_FIFO_COUNT_reg(5),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__8_n_0\,
      D => \p_0_out_carry__0_n_6\,
      Q => r_FIFO_COUNT_reg(6),
      R => AR(0)
    );
r_FIFO_DATA_reg_0_31_0_5: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => Q(1 downto 0),
      DIB(1 downto 0) => Q(3 downto 2),
      DIC(1 downto 0) => Q(5 downto 4),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => \rd_data12[5]_5\(1 downto 0),
      DOB(1 downto 0) => \rd_data12[5]_5\(3 downto 2),
      DOC(1 downto 0) => \rd_data12[5]_5\(5 downto 4),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
r_FIFO_DATA_reg_0_31_6_11: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => Q(7 downto 6),
      DIB(1 downto 0) => Q(9 downto 8),
      DIC(1 downto 0) => Q(11 downto 10),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => \rd_data12[5]_5\(7 downto 6),
      DOB(1 downto 0) => \rd_data12[5]_5\(9 downto 8),
      DOC(1 downto 0) => \rd_data12[5]_5\(11 downto 10),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
\r_RD_INDEX[0]_i_1__4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_RD_INDEX(0),
      O => \r_RD_INDEX[0]_i_1__4_n_0\
    );
\r_RD_INDEX[1]_i_1__4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_RD_INDEX(0),
      I1 => r_RD_INDEX(1),
      O => \r_RD_INDEX[1]_i_1__4_n_0\
    );
\r_RD_INDEX[2]_i_1__4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      O => \r_RD_INDEX[2]_i_1__4_n_0\
    );
\r_RD_INDEX[3]_i_1__8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00C0000000800000"
    )
        port map (
      I0 => \r_WR_INDEX[4]_i_3__4_n_0\,
      I1 => rd_en,
      I2 => address(2),
      I3 => address(3),
      I4 => \^r_rd_index_reg[4]_0\,
      I5 => r_FIFO_COUNT_reg(5),
      O => r_RD_INDEX0
    );
\r_RD_INDEX[3]_i_2__4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      I3 => r_RD_INDEX(3),
      O => \r_RD_INDEX[3]_i_2__4_n_0\
    );
\r_RD_INDEX[4]_i_1__4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(4),
      I2 => r_RD_INDEX(0),
      I3 => r_RD_INDEX(1),
      I4 => r_RD_INDEX(3),
      O => \r_RD_INDEX[4]_i_1__4_n_0\
    );
\r_RD_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[0]_i_1__4_n_0\,
      Q => r_RD_INDEX(0),
      R => AR(0)
    );
\r_RD_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[1]_i_1__4_n_0\,
      Q => r_RD_INDEX(1),
      R => AR(0)
    );
\r_RD_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[2]_i_1__4_n_0\,
      Q => r_RD_INDEX(2),
      R => AR(0)
    );
\r_RD_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[3]_i_2__4_n_0\,
      Q => r_RD_INDEX(3),
      R => AR(0)
    );
\r_RD_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[4]_i_1__4_n_0\,
      Q => r_RD_INDEX(4),
      R => AR(0)
    );
\r_WR_INDEX[0]_i_1__4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_WR_INDEX(0),
      O => \r_WR_INDEX[0]_i_1__4_n_0\
    );
\r_WR_INDEX[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_WR_INDEX(0),
      I1 => r_WR_INDEX(1),
      O => \r_WR_INDEX[1]_i_1_n_0\
    );
\r_WR_INDEX[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      O => \r_WR_INDEX[2]_i_1_n_0\
    );
\r_WR_INDEX[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      I3 => r_WR_INDEX(3),
      O => \r_WR_INDEX[3]_i_1_n_0\
    );
\r_WR_INDEX[4]_i_1__4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => wr_en_reg,
      I1 => \r_WR_INDEX[4]_i_3__4_n_0\,
      I2 => r_FIFO_COUNT_reg(5),
      O => r_WR_INDEX0
    );
\r_WR_INDEX[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(4),
      I2 => r_WR_INDEX(0),
      I3 => r_WR_INDEX(1),
      I4 => r_WR_INDEX(3),
      O => \r_WR_INDEX[4]_i_2_n_0\
    );
\r_WR_INDEX[4]_i_3__4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      I1 => r_FIFO_COUNT_reg(6),
      I2 => r_FIFO_COUNT_reg(4),
      I3 => r_FIFO_COUNT_reg(3),
      I4 => r_FIFO_COUNT_reg(1),
      I5 => r_FIFO_COUNT_reg(2),
      O => \r_WR_INDEX[4]_i_3__4_n_0\
    );
\r_WR_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[0]_i_1__4_n_0\,
      Q => r_WR_INDEX(0),
      R => AR(0)
    );
\r_WR_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[1]_i_1_n_0\,
      Q => r_WR_INDEX(1),
      R => AR(0)
    );
\r_WR_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[2]_i_1_n_0\,
      Q => r_WR_INDEX(2),
      R => AR(0)
    );
\r_WR_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[3]_i_1_n_0\,
      Q => r_WR_INDEX(3),
      R => AR(0)
    );
\r_WR_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[4]_i_2_n_0\,
      Q => r_WR_INDEX(4),
      R => AR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_11 is
  port (
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    \r_RD_INDEX_reg[4]_0\ : out STD_LOGIC;
    \r_RD_INDEX_reg[4]_1\ : out STD_LOGIC;
    o_rd_data : out STD_LOGIC_VECTOR ( 11 downto 0 );
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    address : in STD_LOGIC_VECTOR ( 3 downto 0 );
    wr_en_reg : in STD_LOGIC;
    p_0_in : in STD_LOGIC;
    \wr_data_reg[6][11]\ : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_11 : entity is "module_fifo_regs_no_flags";
end base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_11;

architecture STRUCTURE of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_11 is
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \p_0_out_carry__0_i_1__5_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_i_2__5_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_3\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_6\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_7\ : STD_LOGIC;
  signal \p_0_out_carry_i_1__5_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_2__5_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_3__5_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_4__5_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_5__11_n_0\ : STD_LOGIC;
  signal p_0_out_carry_n_0 : STD_LOGIC;
  signal p_0_out_carry_n_1 : STD_LOGIC;
  signal p_0_out_carry_n_2 : STD_LOGIC;
  signal p_0_out_carry_n_3 : STD_LOGIC;
  signal p_0_out_carry_n_4 : STD_LOGIC;
  signal p_0_out_carry_n_5 : STD_LOGIC;
  signal p_0_out_carry_n_6 : STD_LOGIC;
  signal p_0_out_carry_n_7 : STD_LOGIC;
  signal \r_FIFO_COUNT[0]_i_1__5_n_0\ : STD_LOGIC;
  signal \r_FIFO_COUNT[6]_i_1__11_n_0\ : STD_LOGIC;
  signal r_FIFO_COUNT_reg : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal r_RD_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_RD_INDEX0 : STD_LOGIC;
  signal \r_RD_INDEX[0]_i_1__5_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[1]_i_1__5_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[2]_i_1__5_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[3]_i_2__5_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[4]_i_1__5_n_0\ : STD_LOGIC;
  signal \^r_rd_index_reg[4]_0\ : STD_LOGIC;
  signal \^r_rd_index_reg[4]_1\ : STD_LOGIC;
  signal r_WR_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_WR_INDEX0 : STD_LOGIC;
  signal \r_WR_INDEX[0]_i_1__5_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[1]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[2]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[3]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_2_n_0\ : STD_LOGIC;
  signal \NLW_p_0_out_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_p_0_out_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of p_0_out_carry : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \p_0_out_carry__0\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_0_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_6_11 : label is "";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \r_RD_INDEX[1]_i_1__5\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \r_RD_INDEX[2]_i_1__5\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \r_RD_INDEX[3]_i_2__5\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \r_RD_INDEX[4]_i_1__5\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \r_WR_INDEX[1]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \r_WR_INDEX[2]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \r_WR_INDEX[3]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \r_WR_INDEX[4]_i_2\ : label is "soft_lutpair50";
begin
  Q(0) <= \^q\(0);
  \r_RD_INDEX_reg[4]_0\ <= \^r_rd_index_reg[4]_0\;
  \r_RD_INDEX_reg[4]_1\ <= \^r_rd_index_reg[4]_1\;
p_0_out_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => p_0_out_carry_n_0,
      CO(2) => p_0_out_carry_n_1,
      CO(1) => p_0_out_carry_n_2,
      CO(0) => p_0_out_carry_n_3,
      CYINIT => r_FIFO_COUNT_reg(0),
      DI(3 downto 1) => r_FIFO_COUNT_reg(3 downto 1),
      DI(0) => \p_0_out_carry_i_1__5_n_0\,
      O(3) => p_0_out_carry_n_4,
      O(2) => p_0_out_carry_n_5,
      O(1) => p_0_out_carry_n_6,
      O(0) => p_0_out_carry_n_7,
      S(3) => \p_0_out_carry_i_2__5_n_0\,
      S(2) => \p_0_out_carry_i_3__5_n_0\,
      S(1) => \p_0_out_carry_i_4__5_n_0\,
      S(0) => \p_0_out_carry_i_5__11_n_0\
    );
\p_0_out_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => p_0_out_carry_n_0,
      CO(3 downto 1) => \NLW_p_0_out_carry__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \p_0_out_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => r_FIFO_COUNT_reg(4),
      O(3 downto 2) => \NLW_p_0_out_carry__0_O_UNCONNECTED\(3 downto 2),
      O(1) => \p_0_out_carry__0_n_6\,
      O(0) => \p_0_out_carry__0_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \p_0_out_carry__0_i_1__5_n_0\,
      S(0) => \p_0_out_carry__0_i_2__5_n_0\
    );
\p_0_out_carry__0_i_1__5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(0),
      I1 => r_FIFO_COUNT_reg(6),
      O => \p_0_out_carry__0_i_1__5_n_0\
    );
\p_0_out_carry__0_i_2__5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(4),
      I1 => \^q\(0),
      O => \p_0_out_carry__0_i_2__5_n_0\
    );
\p_0_out_carry_i_1__5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      O => \p_0_out_carry_i_1__5_n_0\
    );
\p_0_out_carry_i_2__5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(3),
      I1 => r_FIFO_COUNT_reg(4),
      O => \p_0_out_carry_i_2__5_n_0\
    );
\p_0_out_carry_i_3__5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(2),
      I1 => r_FIFO_COUNT_reg(3),
      O => \p_0_out_carry_i_3__5_n_0\
    );
\p_0_out_carry_i_4__5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => r_FIFO_COUNT_reg(2),
      O => \p_0_out_carry_i_4__5_n_0\
    );
\p_0_out_carry_i_5__11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA6AAAAA55555555"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => rd_en,
      I2 => address(2),
      I3 => address(3),
      I4 => \^r_rd_index_reg[4]_0\,
      I5 => wr_en_reg,
      O => \p_0_out_carry_i_5__11_n_0\
    );
\p_0_out_carry_i_6__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => address(1),
      I1 => address(0),
      O => \^r_rd_index_reg[4]_0\
    );
\r_FIFO_COUNT[0]_i_1__5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      O => \r_FIFO_COUNT[0]_i_1__5_n_0\
    );
\r_FIFO_COUNT[6]_i_1__11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA6AAAAAAAAAAAA"
    )
        port map (
      I0 => wr_en_reg,
      I1 => address(1),
      I2 => address(0),
      I3 => address(3),
      I4 => address(2),
      I5 => rd_en,
      O => \r_FIFO_COUNT[6]_i_1__11_n_0\
    );
\r_FIFO_COUNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__11_n_0\,
      D => \r_FIFO_COUNT[0]_i_1__5_n_0\,
      Q => r_FIFO_COUNT_reg(0),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__11_n_0\,
      D => p_0_out_carry_n_7,
      Q => r_FIFO_COUNT_reg(1),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__11_n_0\,
      D => p_0_out_carry_n_6,
      Q => r_FIFO_COUNT_reg(2),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__11_n_0\,
      D => p_0_out_carry_n_5,
      Q => r_FIFO_COUNT_reg(3),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__11_n_0\,
      D => p_0_out_carry_n_4,
      Q => r_FIFO_COUNT_reg(4),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__11_n_0\,
      D => \p_0_out_carry__0_n_7\,
      Q => \^q\(0),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__11_n_0\,
      D => \p_0_out_carry__0_n_6\,
      Q => r_FIFO_COUNT_reg(6),
      R => AR(0)
    );
r_FIFO_DATA_reg_0_31_0_5: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => \wr_data_reg[6][11]\(1 downto 0),
      DIB(1 downto 0) => \wr_data_reg[6][11]\(3 downto 2),
      DIC(1 downto 0) => \wr_data_reg[6][11]\(5 downto 4),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => o_rd_data(1 downto 0),
      DOB(1 downto 0) => o_rd_data(3 downto 2),
      DOC(1 downto 0) => o_rd_data(5 downto 4),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
r_FIFO_DATA_reg_0_31_6_11: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => \wr_data_reg[6][11]\(7 downto 6),
      DIB(1 downto 0) => \wr_data_reg[6][11]\(9 downto 8),
      DIC(1 downto 0) => \wr_data_reg[6][11]\(11 downto 10),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => o_rd_data(7 downto 6),
      DOB(1 downto 0) => o_rd_data(9 downto 8),
      DOC(1 downto 0) => o_rd_data(11 downto 10),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
\r_RD_INDEX[0]_i_1__5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_RD_INDEX(0),
      O => \r_RD_INDEX[0]_i_1__5_n_0\
    );
\r_RD_INDEX[1]_i_1__5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_RD_INDEX(0),
      I1 => r_RD_INDEX(1),
      O => \r_RD_INDEX[1]_i_1__5_n_0\
    );
\r_RD_INDEX[2]_i_1__5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      O => \r_RD_INDEX[2]_i_1__5_n_0\
    );
\r_RD_INDEX[3]_i_1__11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00C0000000800000"
    )
        port map (
      I0 => \^r_rd_index_reg[4]_1\,
      I1 => rd_en,
      I2 => address(2),
      I3 => address(3),
      I4 => \^r_rd_index_reg[4]_0\,
      I5 => \^q\(0),
      O => r_RD_INDEX0
    );
\r_RD_INDEX[3]_i_2__5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      I3 => r_RD_INDEX(3),
      O => \r_RD_INDEX[3]_i_2__5_n_0\
    );
\r_RD_INDEX[4]_i_1__5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(4),
      I2 => r_RD_INDEX(0),
      I3 => r_RD_INDEX(1),
      I4 => r_RD_INDEX(3),
      O => \r_RD_INDEX[4]_i_1__5_n_0\
    );
\r_RD_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[0]_i_1__5_n_0\,
      Q => r_RD_INDEX(0),
      R => AR(0)
    );
\r_RD_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[1]_i_1__5_n_0\,
      Q => r_RD_INDEX(1),
      R => AR(0)
    );
\r_RD_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[2]_i_1__5_n_0\,
      Q => r_RD_INDEX(2),
      R => AR(0)
    );
\r_RD_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[3]_i_2__5_n_0\,
      Q => r_RD_INDEX(3),
      R => AR(0)
    );
\r_RD_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[4]_i_1__5_n_0\,
      Q => r_RD_INDEX(4),
      R => AR(0)
    );
\r_WR_INDEX[0]_i_1__5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_WR_INDEX(0),
      O => \r_WR_INDEX[0]_i_1__5_n_0\
    );
\r_WR_INDEX[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_WR_INDEX(0),
      I1 => r_WR_INDEX(1),
      O => \r_WR_INDEX[1]_i_1_n_0\
    );
\r_WR_INDEX[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      O => \r_WR_INDEX[2]_i_1_n_0\
    );
\r_WR_INDEX[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      I3 => r_WR_INDEX(3),
      O => \r_WR_INDEX[3]_i_1_n_0\
    );
\r_WR_INDEX[4]_i_1__5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => wr_en_reg,
      I1 => \^r_rd_index_reg[4]_1\,
      I2 => \^q\(0),
      O => r_WR_INDEX0
    );
\r_WR_INDEX[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(4),
      I2 => r_WR_INDEX(0),
      I3 => r_WR_INDEX(1),
      I4 => r_WR_INDEX(3),
      O => \r_WR_INDEX[4]_i_2_n_0\
    );
\r_WR_INDEX[4]_i_3__5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      I1 => r_FIFO_COUNT_reg(6),
      I2 => r_FIFO_COUNT_reg(4),
      I3 => r_FIFO_COUNT_reg(3),
      I4 => r_FIFO_COUNT_reg(1),
      I5 => r_FIFO_COUNT_reg(2),
      O => \^r_rd_index_reg[4]_1\
    );
\r_WR_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[0]_i_1__5_n_0\,
      Q => r_WR_INDEX(0),
      R => AR(0)
    );
\r_WR_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[1]_i_1_n_0\,
      Q => r_WR_INDEX(1),
      R => AR(0)
    );
\r_WR_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[2]_i_1_n_0\,
      Q => r_WR_INDEX(2),
      R => AR(0)
    );
\r_WR_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[3]_i_1_n_0\,
      Q => r_WR_INDEX(3),
      R => AR(0)
    );
\r_WR_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[4]_i_2_n_0\,
      Q => r_WR_INDEX(4),
      R => AR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_12 is
  port (
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    \r_RD_INDEX_reg[4]_0\ : out STD_LOGIC;
    \r_RD_INDEX_reg[4]_1\ : out STD_LOGIC;
    o_rd_data : out STD_LOGIC_VECTOR ( 11 downto 0 );
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    address : in STD_LOGIC_VECTOR ( 3 downto 0 );
    wr_en_reg : in STD_LOGIC;
    p_0_in : in STD_LOGIC;
    \wr_data_reg[7][11]\ : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_12 : entity is "module_fifo_regs_no_flags";
end base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_12;

architecture STRUCTURE of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_12 is
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \p_0_out_carry__0_i_1__6_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_i_2__6_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_3\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_6\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_7\ : STD_LOGIC;
  signal \p_0_out_carry_i_1__6_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_2__6_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_3__6_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_4__6_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_5__14_n_0\ : STD_LOGIC;
  signal p_0_out_carry_n_0 : STD_LOGIC;
  signal p_0_out_carry_n_1 : STD_LOGIC;
  signal p_0_out_carry_n_2 : STD_LOGIC;
  signal p_0_out_carry_n_3 : STD_LOGIC;
  signal p_0_out_carry_n_4 : STD_LOGIC;
  signal p_0_out_carry_n_5 : STD_LOGIC;
  signal p_0_out_carry_n_6 : STD_LOGIC;
  signal p_0_out_carry_n_7 : STD_LOGIC;
  signal \r_FIFO_COUNT[0]_i_1__6_n_0\ : STD_LOGIC;
  signal \r_FIFO_COUNT[6]_i_1__14_n_0\ : STD_LOGIC;
  signal r_FIFO_COUNT_reg : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal r_RD_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_RD_INDEX0 : STD_LOGIC;
  signal \r_RD_INDEX[0]_i_1__6_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[1]_i_1__6_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[2]_i_1__6_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[3]_i_2__6_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[4]_i_1__6_n_0\ : STD_LOGIC;
  signal \^r_rd_index_reg[4]_0\ : STD_LOGIC;
  signal \^r_rd_index_reg[4]_1\ : STD_LOGIC;
  signal r_WR_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_WR_INDEX0 : STD_LOGIC;
  signal \r_WR_INDEX[0]_i_1__6_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[1]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[2]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[3]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_2_n_0\ : STD_LOGIC;
  signal \NLW_p_0_out_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_p_0_out_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of p_0_out_carry : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \p_0_out_carry__0\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_0_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_6_11 : label is "";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \r_RD_INDEX[1]_i_1__6\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \r_RD_INDEX[2]_i_1__6\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \r_RD_INDEX[3]_i_2__6\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \r_RD_INDEX[4]_i_1__6\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \r_WR_INDEX[1]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \r_WR_INDEX[2]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \r_WR_INDEX[3]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \r_WR_INDEX[4]_i_2\ : label is "soft_lutpair54";
begin
  Q(0) <= \^q\(0);
  \r_RD_INDEX_reg[4]_0\ <= \^r_rd_index_reg[4]_0\;
  \r_RD_INDEX_reg[4]_1\ <= \^r_rd_index_reg[4]_1\;
\DataOut_stall[11]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => address(0),
      I1 => address(1),
      O => \^r_rd_index_reg[4]_0\
    );
p_0_out_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => p_0_out_carry_n_0,
      CO(2) => p_0_out_carry_n_1,
      CO(1) => p_0_out_carry_n_2,
      CO(0) => p_0_out_carry_n_3,
      CYINIT => r_FIFO_COUNT_reg(0),
      DI(3 downto 1) => r_FIFO_COUNT_reg(3 downto 1),
      DI(0) => \p_0_out_carry_i_1__6_n_0\,
      O(3) => p_0_out_carry_n_4,
      O(2) => p_0_out_carry_n_5,
      O(1) => p_0_out_carry_n_6,
      O(0) => p_0_out_carry_n_7,
      S(3) => \p_0_out_carry_i_2__6_n_0\,
      S(2) => \p_0_out_carry_i_3__6_n_0\,
      S(1) => \p_0_out_carry_i_4__6_n_0\,
      S(0) => \p_0_out_carry_i_5__14_n_0\
    );
\p_0_out_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => p_0_out_carry_n_0,
      CO(3 downto 1) => \NLW_p_0_out_carry__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \p_0_out_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => r_FIFO_COUNT_reg(4),
      O(3 downto 2) => \NLW_p_0_out_carry__0_O_UNCONNECTED\(3 downto 2),
      O(1) => \p_0_out_carry__0_n_6\,
      O(0) => \p_0_out_carry__0_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \p_0_out_carry__0_i_1__6_n_0\,
      S(0) => \p_0_out_carry__0_i_2__6_n_0\
    );
\p_0_out_carry__0_i_1__6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(0),
      I1 => r_FIFO_COUNT_reg(6),
      O => \p_0_out_carry__0_i_1__6_n_0\
    );
\p_0_out_carry__0_i_2__6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(4),
      I1 => \^q\(0),
      O => \p_0_out_carry__0_i_2__6_n_0\
    );
\p_0_out_carry_i_1__6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      O => \p_0_out_carry_i_1__6_n_0\
    );
\p_0_out_carry_i_2__6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(3),
      I1 => r_FIFO_COUNT_reg(4),
      O => \p_0_out_carry_i_2__6_n_0\
    );
\p_0_out_carry_i_3__6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(2),
      I1 => r_FIFO_COUNT_reg(3),
      O => \p_0_out_carry_i_3__6_n_0\
    );
\p_0_out_carry_i_4__6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => r_FIFO_COUNT_reg(2),
      O => \p_0_out_carry_i_4__6_n_0\
    );
\p_0_out_carry_i_5__14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAA6A55555555"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => rd_en,
      I2 => address(2),
      I3 => address(3),
      I4 => \^r_rd_index_reg[4]_0\,
      I5 => wr_en_reg,
      O => \p_0_out_carry_i_5__14_n_0\
    );
\r_FIFO_COUNT[0]_i_1__6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      O => \r_FIFO_COUNT[0]_i_1__6_n_0\
    );
\r_FIFO_COUNT[6]_i_1__14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA6AAAAAAAAAAAAA"
    )
        port map (
      I0 => wr_en_reg,
      I1 => address(0),
      I2 => address(1),
      I3 => address(3),
      I4 => address(2),
      I5 => rd_en,
      O => \r_FIFO_COUNT[6]_i_1__14_n_0\
    );
\r_FIFO_COUNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__14_n_0\,
      D => \r_FIFO_COUNT[0]_i_1__6_n_0\,
      Q => r_FIFO_COUNT_reg(0),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__14_n_0\,
      D => p_0_out_carry_n_7,
      Q => r_FIFO_COUNT_reg(1),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__14_n_0\,
      D => p_0_out_carry_n_6,
      Q => r_FIFO_COUNT_reg(2),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__14_n_0\,
      D => p_0_out_carry_n_5,
      Q => r_FIFO_COUNT_reg(3),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__14_n_0\,
      D => p_0_out_carry_n_4,
      Q => r_FIFO_COUNT_reg(4),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__14_n_0\,
      D => \p_0_out_carry__0_n_7\,
      Q => \^q\(0),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__14_n_0\,
      D => \p_0_out_carry__0_n_6\,
      Q => r_FIFO_COUNT_reg(6),
      R => AR(0)
    );
r_FIFO_DATA_reg_0_31_0_5: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => \wr_data_reg[7][11]\(1 downto 0),
      DIB(1 downto 0) => \wr_data_reg[7][11]\(3 downto 2),
      DIC(1 downto 0) => \wr_data_reg[7][11]\(5 downto 4),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => o_rd_data(1 downto 0),
      DOB(1 downto 0) => o_rd_data(3 downto 2),
      DOC(1 downto 0) => o_rd_data(5 downto 4),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
r_FIFO_DATA_reg_0_31_6_11: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => \wr_data_reg[7][11]\(7 downto 6),
      DIB(1 downto 0) => \wr_data_reg[7][11]\(9 downto 8),
      DIC(1 downto 0) => \wr_data_reg[7][11]\(11 downto 10),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => o_rd_data(7 downto 6),
      DOB(1 downto 0) => o_rd_data(9 downto 8),
      DOC(1 downto 0) => o_rd_data(11 downto 10),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
\r_RD_INDEX[0]_i_1__6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_RD_INDEX(0),
      O => \r_RD_INDEX[0]_i_1__6_n_0\
    );
\r_RD_INDEX[1]_i_1__6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_RD_INDEX(0),
      I1 => r_RD_INDEX(1),
      O => \r_RD_INDEX[1]_i_1__6_n_0\
    );
\r_RD_INDEX[2]_i_1__6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      O => \r_RD_INDEX[2]_i_1__6_n_0\
    );
\r_RD_INDEX[3]_i_1__14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000C000000080"
    )
        port map (
      I0 => \^r_rd_index_reg[4]_1\,
      I1 => rd_en,
      I2 => address(2),
      I3 => address(3),
      I4 => \^r_rd_index_reg[4]_0\,
      I5 => \^q\(0),
      O => r_RD_INDEX0
    );
\r_RD_INDEX[3]_i_2__6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      I3 => r_RD_INDEX(3),
      O => \r_RD_INDEX[3]_i_2__6_n_0\
    );
\r_RD_INDEX[4]_i_1__6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(4),
      I2 => r_RD_INDEX(0),
      I3 => r_RD_INDEX(1),
      I4 => r_RD_INDEX(3),
      O => \r_RD_INDEX[4]_i_1__6_n_0\
    );
\r_RD_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[0]_i_1__6_n_0\,
      Q => r_RD_INDEX(0),
      R => AR(0)
    );
\r_RD_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[1]_i_1__6_n_0\,
      Q => r_RD_INDEX(1),
      R => AR(0)
    );
\r_RD_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[2]_i_1__6_n_0\,
      Q => r_RD_INDEX(2),
      R => AR(0)
    );
\r_RD_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[3]_i_2__6_n_0\,
      Q => r_RD_INDEX(3),
      R => AR(0)
    );
\r_RD_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[4]_i_1__6_n_0\,
      Q => r_RD_INDEX(4),
      R => AR(0)
    );
\r_WR_INDEX[0]_i_1__6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_WR_INDEX(0),
      O => \r_WR_INDEX[0]_i_1__6_n_0\
    );
\r_WR_INDEX[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_WR_INDEX(0),
      I1 => r_WR_INDEX(1),
      O => \r_WR_INDEX[1]_i_1_n_0\
    );
\r_WR_INDEX[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      O => \r_WR_INDEX[2]_i_1_n_0\
    );
\r_WR_INDEX[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      I3 => r_WR_INDEX(3),
      O => \r_WR_INDEX[3]_i_1_n_0\
    );
\r_WR_INDEX[4]_i_1__6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => wr_en_reg,
      I1 => \^r_rd_index_reg[4]_1\,
      I2 => \^q\(0),
      O => r_WR_INDEX0
    );
\r_WR_INDEX[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(4),
      I2 => r_WR_INDEX(0),
      I3 => r_WR_INDEX(1),
      I4 => r_WR_INDEX(3),
      O => \r_WR_INDEX[4]_i_2_n_0\
    );
\r_WR_INDEX[4]_i_3__6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      I1 => r_FIFO_COUNT_reg(6),
      I2 => r_FIFO_COUNT_reg(4),
      I3 => r_FIFO_COUNT_reg(3),
      I4 => r_FIFO_COUNT_reg(1),
      I5 => r_FIFO_COUNT_reg(2),
      O => \^r_rd_index_reg[4]_1\
    );
\r_WR_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[0]_i_1__6_n_0\,
      Q => r_WR_INDEX(0),
      R => AR(0)
    );
\r_WR_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[1]_i_1_n_0\,
      Q => r_WR_INDEX(1),
      R => AR(0)
    );
\r_WR_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[2]_i_1_n_0\,
      Q => r_WR_INDEX(2),
      R => AR(0)
    );
\r_WR_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[3]_i_1_n_0\,
      Q => r_WR_INDEX(3),
      R => AR(0)
    );
\r_WR_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[4]_i_2_n_0\,
      Q => r_WR_INDEX(4),
      R => AR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_13 is
  port (
    \DataOut_stall_reg[0]\ : out STD_LOGIC;
    \DataOut_last_reg[0]\ : out STD_LOGIC;
    \DataOut_stall_reg[1]\ : out STD_LOGIC;
    \DataOut_last_reg[1]\ : out STD_LOGIC;
    \DataOut_stall_reg[2]\ : out STD_LOGIC;
    \DataOut_last_reg[2]\ : out STD_LOGIC;
    \DataOut_stall_reg[3]\ : out STD_LOGIC;
    \DataOut_last_reg[3]\ : out STD_LOGIC;
    \DataOut_stall_reg[4]\ : out STD_LOGIC;
    \DataOut_last_reg[4]\ : out STD_LOGIC;
    \DataOut_stall_reg[5]\ : out STD_LOGIC;
    \DataOut_last_reg[5]\ : out STD_LOGIC;
    \DataOut_stall_reg[6]\ : out STD_LOGIC;
    \DataOut_last_reg[6]\ : out STD_LOGIC;
    \DataOut_stall_reg[7]\ : out STD_LOGIC;
    \DataOut_last_reg[7]\ : out STD_LOGIC;
    \DataOut_stall_reg[8]\ : out STD_LOGIC;
    \DataOut_last_reg[8]\ : out STD_LOGIC;
    \DataOut_stall_reg[9]\ : out STD_LOGIC;
    \DataOut_last_reg[9]\ : out STD_LOGIC;
    \DataOut_stall_reg[10]\ : out STD_LOGIC;
    \DataOut_last_reg[10]\ : out STD_LOGIC;
    \DataOut_stall_reg[11]\ : out STD_LOGIC;
    \DataOut_last_reg[11]\ : out STD_LOGIC;
    \WDOTime_intl_reg[63]\ : out STD_LOGIC;
    \FSM_onehot_fifo_wr_stm_reg[4]\ : out STD_LOGIC;
    \r_WR_INDEX_reg[4]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \DIGTime_intl_reg[63]\ : out STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    \cnt_fifo_reg[5]\ : in STD_LOGIC;
    address : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_en : in STD_LOGIC;
    wr_en_reg : in STD_LOGIC;
    \cnt_fifo_reg[6]\ : in STD_LOGIC;
    \cnt_fifo_reg[5]_0\ : in STD_LOGIC;
    o_rd_data : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \cnt_fifo_reg[6]_0\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_1\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_2\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_3\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_4\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_5\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_6\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_7\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_8\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_9\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_10\ : in STD_LOGIC;
    \wr_data_reg[14][7]\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    full : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \r_FIFO_COUNT_reg[5]_0\ : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TestFIFO : in STD_LOGIC;
    \r_FIFO_COUNT_reg[5]_1\ : in STD_LOGIC;
    nRST : in STD_LOGIC;
    data3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    p_0_in : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_13 : entity is "module_fifo_regs_no_flags";
end base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_13;

architecture STRUCTURE of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_13 is
  signal \DIGTime_intl[63]_i_2_n_0\ : STD_LOGIC;
  signal \^dataout_last_reg[0]\ : STD_LOGIC;
  signal \^dataout_last_reg[10]\ : STD_LOGIC;
  signal \^dataout_last_reg[11]\ : STD_LOGIC;
  signal \^dataout_last_reg[1]\ : STD_LOGIC;
  signal \^dataout_last_reg[2]\ : STD_LOGIC;
  signal \^dataout_last_reg[3]\ : STD_LOGIC;
  signal \^dataout_last_reg[4]\ : STD_LOGIC;
  signal \^dataout_last_reg[5]\ : STD_LOGIC;
  signal \^dataout_last_reg[6]\ : STD_LOGIC;
  signal \^dataout_last_reg[7]\ : STD_LOGIC;
  signal \^dataout_last_reg[8]\ : STD_LOGIC;
  signal \^dataout_last_reg[9]\ : STD_LOGIC;
  signal \^wdotime_intl_reg[63]\ : STD_LOGIC;
  signal \p_0_out_carry__0_i_1__7_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_i_2__7_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_3\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_6\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_7\ : STD_LOGIC;
  signal \p_0_out_carry_i_1__7_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_2__7_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_3__7_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_4__7_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_5__4_n_0\ : STD_LOGIC;
  signal p_0_out_carry_n_0 : STD_LOGIC;
  signal p_0_out_carry_n_1 : STD_LOGIC;
  signal p_0_out_carry_n_2 : STD_LOGIC;
  signal p_0_out_carry_n_3 : STD_LOGIC;
  signal p_0_out_carry_n_4 : STD_LOGIC;
  signal p_0_out_carry_n_5 : STD_LOGIC;
  signal p_0_out_carry_n_6 : STD_LOGIC;
  signal p_0_out_carry_n_7 : STD_LOGIC;
  signal \r_FIFO_COUNT[0]_i_1__7_n_0\ : STD_LOGIC;
  signal \r_FIFO_COUNT[6]_i_1__4_n_0\ : STD_LOGIC;
  signal r_FIFO_COUNT_reg : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal r_RD_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_RD_INDEX0 : STD_LOGIC;
  signal \r_RD_INDEX[0]_i_1__7_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[1]_i_1__7_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[2]_i_1__7_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[3]_i_2__7_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[3]_i_3_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[4]_i_1__7_n_0\ : STD_LOGIC;
  signal r_WR_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_WR_INDEX0 : STD_LOGIC;
  signal \r_WR_INDEX[0]_i_1__7_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[1]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[2]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[3]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_2_n_0\ : STD_LOGIC;
  signal \^r_wr_index_reg[4]_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \rd_data12[8]_8\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \NLW_p_0_out_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_p_0_out_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \WDOTime_intl[63]_i_3\ : label is "soft_lutpair59";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of p_0_out_carry : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \p_0_out_carry__0\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_0_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_6_11 : label is "";
  attribute SOFT_HLUTNM of \r_RD_INDEX[1]_i_1__7\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \r_RD_INDEX[2]_i_1__7\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \r_RD_INDEX[3]_i_2__7\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \r_RD_INDEX[4]_i_1__7\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \r_WR_INDEX[1]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \r_WR_INDEX[2]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \r_WR_INDEX[3]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \r_WR_INDEX[4]_i_2\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \r_WR_INDEX[4]_i_3__7\ : label is "soft_lutpair59";
begin
  \DataOut_last_reg[0]\ <= \^dataout_last_reg[0]\;
  \DataOut_last_reg[10]\ <= \^dataout_last_reg[10]\;
  \DataOut_last_reg[11]\ <= \^dataout_last_reg[11]\;
  \DataOut_last_reg[1]\ <= \^dataout_last_reg[1]\;
  \DataOut_last_reg[2]\ <= \^dataout_last_reg[2]\;
  \DataOut_last_reg[3]\ <= \^dataout_last_reg[3]\;
  \DataOut_last_reg[4]\ <= \^dataout_last_reg[4]\;
  \DataOut_last_reg[5]\ <= \^dataout_last_reg[5]\;
  \DataOut_last_reg[6]\ <= \^dataout_last_reg[6]\;
  \DataOut_last_reg[7]\ <= \^dataout_last_reg[7]\;
  \DataOut_last_reg[8]\ <= \^dataout_last_reg[8]\;
  \DataOut_last_reg[9]\ <= \^dataout_last_reg[9]\;
  \WDOTime_intl_reg[63]\ <= \^wdotime_intl_reg[63]\;
  \r_WR_INDEX_reg[4]_0\(0) <= \^r_wr_index_reg[4]_0\(0);
\DIGTime_intl[63]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBABFFFF88A80000"
    )
        port map (
      I0 => \out\(0),
      I1 => \out\(1),
      I2 => \DIGTime_intl[63]_i_2_n_0\,
      I3 => \r_FIFO_COUNT_reg[5]_1\,
      I4 => nRST,
      I5 => data3(0),
      O => \DIGTime_intl_reg[63]\
    );
\DIGTime_intl[63]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^wdotime_intl_reg[63]\,
      I1 => full(0),
      I2 => full(1),
      I3 => full(2),
      I4 => full(3),
      I5 => \r_FIFO_COUNT_reg[5]_0\,
      O => \DIGTime_intl[63]_i_2_n_0\
    );
\DataOut[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C000000000A0000"
    )
        port map (
      I0 => \rd_data12[8]_8\(0),
      I1 => \wr_data_reg[14][7]\(0),
      I2 => address(0),
      I3 => address(1),
      I4 => address(3),
      I5 => address(2),
      O => \^dataout_last_reg[0]\
    );
\DataOut[10]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C000000000A0000"
    )
        port map (
      I0 => \rd_data12[8]_8\(10),
      I1 => \wr_data_reg[14][7]\(10),
      I2 => address(0),
      I3 => address(1),
      I4 => address(3),
      I5 => address(2),
      O => \^dataout_last_reg[10]\
    );
\DataOut[11]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C000000000A0000"
    )
        port map (
      I0 => \rd_data12[8]_8\(11),
      I1 => \wr_data_reg[14][7]\(11),
      I2 => address(0),
      I3 => address(1),
      I4 => address(3),
      I5 => address(2),
      O => \^dataout_last_reg[11]\
    );
\DataOut[1]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C000000000A0000"
    )
        port map (
      I0 => \rd_data12[8]_8\(1),
      I1 => \wr_data_reg[14][7]\(1),
      I2 => address(0),
      I3 => address(1),
      I4 => address(3),
      I5 => address(2),
      O => \^dataout_last_reg[1]\
    );
\DataOut[2]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C000000000A0000"
    )
        port map (
      I0 => \rd_data12[8]_8\(2),
      I1 => \wr_data_reg[14][7]\(2),
      I2 => address(0),
      I3 => address(1),
      I4 => address(3),
      I5 => address(2),
      O => \^dataout_last_reg[2]\
    );
\DataOut[3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C000000000A0000"
    )
        port map (
      I0 => \rd_data12[8]_8\(3),
      I1 => \wr_data_reg[14][7]\(3),
      I2 => address(0),
      I3 => address(1),
      I4 => address(3),
      I5 => address(2),
      O => \^dataout_last_reg[3]\
    );
\DataOut[4]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C000000000A0000"
    )
        port map (
      I0 => \rd_data12[8]_8\(4),
      I1 => \wr_data_reg[14][7]\(4),
      I2 => address(0),
      I3 => address(1),
      I4 => address(3),
      I5 => address(2),
      O => \^dataout_last_reg[4]\
    );
\DataOut[5]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C000000000A0000"
    )
        port map (
      I0 => \rd_data12[8]_8\(5),
      I1 => \wr_data_reg[14][7]\(5),
      I2 => address(0),
      I3 => address(1),
      I4 => address(3),
      I5 => address(2),
      O => \^dataout_last_reg[5]\
    );
\DataOut[6]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C000000000A0000"
    )
        port map (
      I0 => \rd_data12[8]_8\(6),
      I1 => \wr_data_reg[14][7]\(6),
      I2 => address(0),
      I3 => address(1),
      I4 => address(3),
      I5 => address(2),
      O => \^dataout_last_reg[6]\
    );
\DataOut[7]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C000000000A0000"
    )
        port map (
      I0 => \rd_data12[8]_8\(7),
      I1 => \wr_data_reg[14][7]\(7),
      I2 => address(0),
      I3 => address(1),
      I4 => address(3),
      I5 => address(2),
      O => \^dataout_last_reg[7]\
    );
\DataOut[8]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C000000000A0000"
    )
        port map (
      I0 => \rd_data12[8]_8\(8),
      I1 => \wr_data_reg[14][7]\(8),
      I2 => address(0),
      I3 => address(1),
      I4 => address(3),
      I5 => address(2),
      O => \^dataout_last_reg[8]\
    );
\DataOut[9]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C000000000A0000"
    )
        port map (
      I0 => \rd_data12[8]_8\(9),
      I1 => \wr_data_reg[14][7]\(9),
      I2 => address(0),
      I3 => address(1),
      I4 => address(3),
      I5 => address(2),
      O => \^dataout_last_reg[9]\
    );
\DataOut_stall[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BEAEBAAABAAABAAA"
    )
        port map (
      I0 => \^dataout_last_reg[0]\,
      I1 => address(3),
      I2 => address(2),
      I3 => \cnt_fifo_reg[6]\,
      I4 => \cnt_fifo_reg[5]_0\,
      I5 => o_rd_data(0),
      O => \DataOut_stall_reg[0]\
    );
\DataOut_stall[10]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BEAEBAAABAAABAAA"
    )
        port map (
      I0 => \^dataout_last_reg[10]\,
      I1 => address(3),
      I2 => address(2),
      I3 => \cnt_fifo_reg[6]_9\,
      I4 => \cnt_fifo_reg[5]_0\,
      I5 => o_rd_data(10),
      O => \DataOut_stall_reg[10]\
    );
\DataOut_stall[11]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BEAEBAAABAAABAAA"
    )
        port map (
      I0 => \^dataout_last_reg[11]\,
      I1 => address(3),
      I2 => address(2),
      I3 => \cnt_fifo_reg[6]_10\,
      I4 => \cnt_fifo_reg[5]_0\,
      I5 => o_rd_data(11),
      O => \DataOut_stall_reg[11]\
    );
\DataOut_stall[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BEAEBAAABAAABAAA"
    )
        port map (
      I0 => \^dataout_last_reg[1]\,
      I1 => address(3),
      I2 => address(2),
      I3 => \cnt_fifo_reg[6]_0\,
      I4 => \cnt_fifo_reg[5]_0\,
      I5 => o_rd_data(1),
      O => \DataOut_stall_reg[1]\
    );
\DataOut_stall[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BEAEBAAABAAABAAA"
    )
        port map (
      I0 => \^dataout_last_reg[2]\,
      I1 => address(3),
      I2 => address(2),
      I3 => \cnt_fifo_reg[6]_1\,
      I4 => \cnt_fifo_reg[5]_0\,
      I5 => o_rd_data(2),
      O => \DataOut_stall_reg[2]\
    );
\DataOut_stall[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BEAEBAAABAAABAAA"
    )
        port map (
      I0 => \^dataout_last_reg[3]\,
      I1 => address(3),
      I2 => address(2),
      I3 => \cnt_fifo_reg[6]_2\,
      I4 => \cnt_fifo_reg[5]_0\,
      I5 => o_rd_data(3),
      O => \DataOut_stall_reg[3]\
    );
\DataOut_stall[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BEAEBAAABAAABAAA"
    )
        port map (
      I0 => \^dataout_last_reg[4]\,
      I1 => address(3),
      I2 => address(2),
      I3 => \cnt_fifo_reg[6]_3\,
      I4 => \cnt_fifo_reg[5]_0\,
      I5 => o_rd_data(4),
      O => \DataOut_stall_reg[4]\
    );
\DataOut_stall[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BEAEBAAABAAABAAA"
    )
        port map (
      I0 => \^dataout_last_reg[5]\,
      I1 => address(3),
      I2 => address(2),
      I3 => \cnt_fifo_reg[6]_4\,
      I4 => \cnt_fifo_reg[5]_0\,
      I5 => o_rd_data(5),
      O => \DataOut_stall_reg[5]\
    );
\DataOut_stall[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BEAEBAAABAAABAAA"
    )
        port map (
      I0 => \^dataout_last_reg[6]\,
      I1 => address(3),
      I2 => address(2),
      I3 => \cnt_fifo_reg[6]_5\,
      I4 => \cnt_fifo_reg[5]_0\,
      I5 => o_rd_data(6),
      O => \DataOut_stall_reg[6]\
    );
\DataOut_stall[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BEAEBAAABAAABAAA"
    )
        port map (
      I0 => \^dataout_last_reg[7]\,
      I1 => address(3),
      I2 => address(2),
      I3 => \cnt_fifo_reg[6]_6\,
      I4 => \cnt_fifo_reg[5]_0\,
      I5 => o_rd_data(7),
      O => \DataOut_stall_reg[7]\
    );
\DataOut_stall[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BEAEBAAABAAABAAA"
    )
        port map (
      I0 => \^dataout_last_reg[8]\,
      I1 => address(3),
      I2 => address(2),
      I3 => \cnt_fifo_reg[6]_7\,
      I4 => \cnt_fifo_reg[5]_0\,
      I5 => o_rd_data(8),
      O => \DataOut_stall_reg[8]\
    );
\DataOut_stall[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BEAEBAAABAAABAAA"
    )
        port map (
      I0 => \^dataout_last_reg[9]\,
      I1 => address(3),
      I2 => address(2),
      I3 => \cnt_fifo_reg[6]_8\,
      I4 => \cnt_fifo_reg[5]_0\,
      I5 => o_rd_data(9),
      O => \DataOut_stall_reg[9]\
    );
\FSM_onehot_fifo_wr_stm[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^r_wr_index_reg[4]_0\(0),
      I1 => full(0),
      I2 => full(1),
      I3 => full(2),
      O => \FSM_onehot_fifo_wr_stm_reg[4]\
    );
\WDOTime_intl[63]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => \out\(0),
      I1 => TestFIFO,
      I2 => \r_RD_INDEX[3]_i_3_n_0\,
      I3 => r_FIFO_COUNT_reg(5),
      O => \^wdotime_intl_reg[63]\
    );
p_0_out_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => p_0_out_carry_n_0,
      CO(2) => p_0_out_carry_n_1,
      CO(1) => p_0_out_carry_n_2,
      CO(0) => p_0_out_carry_n_3,
      CYINIT => r_FIFO_COUNT_reg(0),
      DI(3 downto 1) => r_FIFO_COUNT_reg(3 downto 1),
      DI(0) => \p_0_out_carry_i_1__7_n_0\,
      O(3) => p_0_out_carry_n_4,
      O(2) => p_0_out_carry_n_5,
      O(1) => p_0_out_carry_n_6,
      O(0) => p_0_out_carry_n_7,
      S(3) => \p_0_out_carry_i_2__7_n_0\,
      S(2) => \p_0_out_carry_i_3__7_n_0\,
      S(1) => \p_0_out_carry_i_4__7_n_0\,
      S(0) => \p_0_out_carry_i_5__4_n_0\
    );
\p_0_out_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => p_0_out_carry_n_0,
      CO(3 downto 1) => \NLW_p_0_out_carry__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \p_0_out_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => r_FIFO_COUNT_reg(4),
      O(3 downto 2) => \NLW_p_0_out_carry__0_O_UNCONNECTED\(3 downto 2),
      O(1) => \p_0_out_carry__0_n_6\,
      O(0) => \p_0_out_carry__0_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \p_0_out_carry__0_i_1__7_n_0\,
      S(0) => \p_0_out_carry__0_i_2__7_n_0\
    );
\p_0_out_carry__0_i_1__7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(5),
      I1 => r_FIFO_COUNT_reg(6),
      O => \p_0_out_carry__0_i_1__7_n_0\
    );
\p_0_out_carry__0_i_2__7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(4),
      I1 => r_FIFO_COUNT_reg(5),
      O => \p_0_out_carry__0_i_2__7_n_0\
    );
\p_0_out_carry_i_1__7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      O => \p_0_out_carry_i_1__7_n_0\
    );
\p_0_out_carry_i_2__7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(3),
      I1 => r_FIFO_COUNT_reg(4),
      O => \p_0_out_carry_i_2__7_n_0\
    );
\p_0_out_carry_i_3__7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(2),
      I1 => r_FIFO_COUNT_reg(3),
      O => \p_0_out_carry_i_3__7_n_0\
    );
\p_0_out_carry_i_4__7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => r_FIFO_COUNT_reg(2),
      O => \p_0_out_carry_i_4__7_n_0\
    );
\p_0_out_carry_i_5__4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA9AAAAA55555555"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => \cnt_fifo_reg[5]\,
      I2 => address(3),
      I3 => address(2),
      I4 => rd_en,
      I5 => wr_en_reg,
      O => \p_0_out_carry_i_5__4_n_0\
    );
\r_FIFO_COUNT[0]_i_1__7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      O => \r_FIFO_COUNT[0]_i_1__7_n_0\
    );
\r_FIFO_COUNT[6]_i_1__4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAA6AA"
    )
        port map (
      I0 => wr_en_reg,
      I1 => rd_en,
      I2 => address(2),
      I3 => address(3),
      I4 => address(1),
      I5 => address(0),
      O => \r_FIFO_COUNT[6]_i_1__4_n_0\
    );
\r_FIFO_COUNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__4_n_0\,
      D => \r_FIFO_COUNT[0]_i_1__7_n_0\,
      Q => r_FIFO_COUNT_reg(0),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__4_n_0\,
      D => p_0_out_carry_n_7,
      Q => r_FIFO_COUNT_reg(1),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__4_n_0\,
      D => p_0_out_carry_n_6,
      Q => r_FIFO_COUNT_reg(2),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__4_n_0\,
      D => p_0_out_carry_n_5,
      Q => r_FIFO_COUNT_reg(3),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__4_n_0\,
      D => p_0_out_carry_n_4,
      Q => r_FIFO_COUNT_reg(4),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__4_n_0\,
      D => \p_0_out_carry__0_n_7\,
      Q => r_FIFO_COUNT_reg(5),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__4_n_0\,
      D => \p_0_out_carry__0_n_6\,
      Q => r_FIFO_COUNT_reg(6),
      R => AR(0)
    );
r_FIFO_DATA_reg_0_31_0_5: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => Q(1 downto 0),
      DIB(1 downto 0) => Q(3 downto 2),
      DIC(1 downto 0) => Q(5 downto 4),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => \rd_data12[8]_8\(1 downto 0),
      DOB(1 downto 0) => \rd_data12[8]_8\(3 downto 2),
      DOC(1 downto 0) => \rd_data12[8]_8\(5 downto 4),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
r_FIFO_DATA_reg_0_31_6_11: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => Q(7 downto 6),
      DIB(1 downto 0) => Q(9 downto 8),
      DIC(1 downto 0) => Q(11 downto 10),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => \rd_data12[8]_8\(7 downto 6),
      DOB(1 downto 0) => \rd_data12[8]_8\(9 downto 8),
      DOC(1 downto 0) => \rd_data12[8]_8\(11 downto 10),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
\r_RD_INDEX[0]_i_1__7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_RD_INDEX(0),
      O => \r_RD_INDEX[0]_i_1__7_n_0\
    );
\r_RD_INDEX[1]_i_1__7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_RD_INDEX(0),
      I1 => r_RD_INDEX(1),
      O => \r_RD_INDEX[1]_i_1__7_n_0\
    );
\r_RD_INDEX[2]_i_1__7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      O => \r_RD_INDEX[2]_i_1__7_n_0\
    );
\r_RD_INDEX[3]_i_1__4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0030000000200000"
    )
        port map (
      I0 => \r_RD_INDEX[3]_i_3_n_0\,
      I1 => \cnt_fifo_reg[5]\,
      I2 => address(3),
      I3 => address(2),
      I4 => rd_en,
      I5 => r_FIFO_COUNT_reg(5),
      O => r_RD_INDEX0
    );
\r_RD_INDEX[3]_i_2__7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      I3 => r_RD_INDEX(3),
      O => \r_RD_INDEX[3]_i_2__7_n_0\
    );
\r_RD_INDEX[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      I1 => r_FIFO_COUNT_reg(6),
      I2 => r_FIFO_COUNT_reg(4),
      I3 => r_FIFO_COUNT_reg(3),
      I4 => r_FIFO_COUNT_reg(1),
      I5 => r_FIFO_COUNT_reg(2),
      O => \r_RD_INDEX[3]_i_3_n_0\
    );
\r_RD_INDEX[4]_i_1__7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(4),
      I2 => r_RD_INDEX(0),
      I3 => r_RD_INDEX(1),
      I4 => r_RD_INDEX(3),
      O => \r_RD_INDEX[4]_i_1__7_n_0\
    );
\r_RD_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[0]_i_1__7_n_0\,
      Q => r_RD_INDEX(0),
      R => AR(0)
    );
\r_RD_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[1]_i_1__7_n_0\,
      Q => r_RD_INDEX(1),
      R => AR(0)
    );
\r_RD_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[2]_i_1__7_n_0\,
      Q => r_RD_INDEX(2),
      R => AR(0)
    );
\r_RD_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[3]_i_2__7_n_0\,
      Q => r_RD_INDEX(3),
      R => AR(0)
    );
\r_RD_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[4]_i_1__7_n_0\,
      Q => r_RD_INDEX(4),
      R => AR(0)
    );
\r_WR_INDEX[0]_i_1__7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_WR_INDEX(0),
      O => \r_WR_INDEX[0]_i_1__7_n_0\
    );
\r_WR_INDEX[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_WR_INDEX(0),
      I1 => r_WR_INDEX(1),
      O => \r_WR_INDEX[1]_i_1_n_0\
    );
\r_WR_INDEX[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      O => \r_WR_INDEX[2]_i_1_n_0\
    );
\r_WR_INDEX[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      I3 => r_WR_INDEX(3),
      O => \r_WR_INDEX[3]_i_1_n_0\
    );
\r_WR_INDEX[4]_i_1__7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => wr_en_reg,
      I1 => \^r_wr_index_reg[4]_0\(0),
      O => r_WR_INDEX0
    );
\r_WR_INDEX[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(4),
      I2 => r_WR_INDEX(0),
      I3 => r_WR_INDEX(1),
      I4 => r_WR_INDEX(3),
      O => \r_WR_INDEX[4]_i_2_n_0\
    );
\r_WR_INDEX[4]_i_3__7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(5),
      I1 => \r_RD_INDEX[3]_i_3_n_0\,
      O => \^r_wr_index_reg[4]_0\(0)
    );
\r_WR_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[0]_i_1__7_n_0\,
      Q => r_WR_INDEX(0),
      R => AR(0)
    );
\r_WR_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[1]_i_1_n_0\,
      Q => r_WR_INDEX(1),
      R => AR(0)
    );
\r_WR_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[2]_i_1_n_0\,
      Q => r_WR_INDEX(2),
      R => AR(0)
    );
\r_WR_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[3]_i_1_n_0\,
      Q => r_WR_INDEX(3),
      R => AR(0)
    );
\r_WR_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[4]_i_2_n_0\,
      Q => r_WR_INDEX(4),
      R => AR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_14 is
  port (
    \WDOTime_intl_reg[63]\ : out STD_LOGIC;
    full : out STD_LOGIC_VECTOR ( 0 to 0 );
    o_rd_data : out STD_LOGIC_VECTOR ( 11 downto 0 );
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    \cnt_fifo_reg[5]\ : in STD_LOGIC;
    address : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_en : in STD_LOGIC;
    wr_en_reg : in STD_LOGIC;
    \r_FIFO_COUNT_reg[5]_0\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    p_0_in : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_14 : entity is "module_fifo_regs_no_flags";
end base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_14;

architecture STRUCTURE of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_14 is
  signal \^full\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \p_0_out_carry__0_i_1__8_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_i_2__8_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_3\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_6\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_7\ : STD_LOGIC;
  signal \p_0_out_carry_i_1__8_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_2__8_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_3__8_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_4__8_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_5__7_n_0\ : STD_LOGIC;
  signal p_0_out_carry_n_0 : STD_LOGIC;
  signal p_0_out_carry_n_1 : STD_LOGIC;
  signal p_0_out_carry_n_2 : STD_LOGIC;
  signal p_0_out_carry_n_3 : STD_LOGIC;
  signal p_0_out_carry_n_4 : STD_LOGIC;
  signal p_0_out_carry_n_5 : STD_LOGIC;
  signal p_0_out_carry_n_6 : STD_LOGIC;
  signal p_0_out_carry_n_7 : STD_LOGIC;
  signal \r_FIFO_COUNT[0]_i_1__8_n_0\ : STD_LOGIC;
  signal \r_FIFO_COUNT[6]_i_1__7_n_0\ : STD_LOGIC;
  signal r_FIFO_COUNT_reg : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal r_RD_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_RD_INDEX0 : STD_LOGIC;
  signal \r_RD_INDEX[0]_i_1__8_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[1]_i_1__8_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[2]_i_1__8_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[3]_i_2__8_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[4]_i_1__8_n_0\ : STD_LOGIC;
  signal r_WR_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_WR_INDEX0 : STD_LOGIC;
  signal \r_WR_INDEX[0]_i_1__8_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[1]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[2]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[3]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_2_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_3__8_n_0\ : STD_LOGIC;
  signal \NLW_p_0_out_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_p_0_out_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of p_0_out_carry : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \p_0_out_carry__0\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_0_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_6_11 : label is "";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \r_RD_INDEX[1]_i_1__8\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \r_RD_INDEX[2]_i_1__8\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \r_RD_INDEX[3]_i_2__8\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \r_RD_INDEX[4]_i_1__8\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \r_WR_INDEX[1]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \r_WR_INDEX[2]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \r_WR_INDEX[3]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \r_WR_INDEX[4]_i_2\ : label is "soft_lutpair63";
begin
  full(0) <= \^full\(0);
FIFO_ReadEn_i_9: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(5),
      I1 => \r_WR_INDEX[4]_i_3__8_n_0\,
      O => \^full\(0)
    );
\FSM_onehot_fifo_wr_stm[9]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^full\(0),
      I1 => \r_FIFO_COUNT_reg[5]_0\(0),
      I2 => \r_FIFO_COUNT_reg[5]_0\(1),
      I3 => \r_FIFO_COUNT_reg[5]_0\(2),
      O => \WDOTime_intl_reg[63]\
    );
p_0_out_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => p_0_out_carry_n_0,
      CO(2) => p_0_out_carry_n_1,
      CO(1) => p_0_out_carry_n_2,
      CO(0) => p_0_out_carry_n_3,
      CYINIT => r_FIFO_COUNT_reg(0),
      DI(3 downto 1) => r_FIFO_COUNT_reg(3 downto 1),
      DI(0) => \p_0_out_carry_i_1__8_n_0\,
      O(3) => p_0_out_carry_n_4,
      O(2) => p_0_out_carry_n_5,
      O(1) => p_0_out_carry_n_6,
      O(0) => p_0_out_carry_n_7,
      S(3) => \p_0_out_carry_i_2__8_n_0\,
      S(2) => \p_0_out_carry_i_3__8_n_0\,
      S(1) => \p_0_out_carry_i_4__8_n_0\,
      S(0) => \p_0_out_carry_i_5__7_n_0\
    );
\p_0_out_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => p_0_out_carry_n_0,
      CO(3 downto 1) => \NLW_p_0_out_carry__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \p_0_out_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => r_FIFO_COUNT_reg(4),
      O(3 downto 2) => \NLW_p_0_out_carry__0_O_UNCONNECTED\(3 downto 2),
      O(1) => \p_0_out_carry__0_n_6\,
      O(0) => \p_0_out_carry__0_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \p_0_out_carry__0_i_1__8_n_0\,
      S(0) => \p_0_out_carry__0_i_2__8_n_0\
    );
\p_0_out_carry__0_i_1__8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(5),
      I1 => r_FIFO_COUNT_reg(6),
      O => \p_0_out_carry__0_i_1__8_n_0\
    );
\p_0_out_carry__0_i_2__8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(4),
      I1 => r_FIFO_COUNT_reg(5),
      O => \p_0_out_carry__0_i_2__8_n_0\
    );
\p_0_out_carry_i_1__8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      O => \p_0_out_carry_i_1__8_n_0\
    );
\p_0_out_carry_i_2__8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(3),
      I1 => r_FIFO_COUNT_reg(4),
      O => \p_0_out_carry_i_2__8_n_0\
    );
\p_0_out_carry_i_3__8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(2),
      I1 => r_FIFO_COUNT_reg(3),
      O => \p_0_out_carry_i_3__8_n_0\
    );
\p_0_out_carry_i_4__8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => r_FIFO_COUNT_reg(2),
      O => \p_0_out_carry_i_4__8_n_0\
    );
\p_0_out_carry_i_5__7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA6AAAAA55555555"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => \cnt_fifo_reg[5]\,
      I2 => address(3),
      I3 => address(2),
      I4 => rd_en,
      I5 => wr_en_reg,
      O => \p_0_out_carry_i_5__7_n_0\
    );
\r_FIFO_COUNT[0]_i_1__8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      O => \r_FIFO_COUNT[0]_i_1__8_n_0\
    );
\r_FIFO_COUNT[6]_i_1__7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAA6AAAAAAAAAA"
    )
        port map (
      I0 => wr_en_reg,
      I1 => rd_en,
      I2 => address(2),
      I3 => address(3),
      I4 => address(1),
      I5 => address(0),
      O => \r_FIFO_COUNT[6]_i_1__7_n_0\
    );
\r_FIFO_COUNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__7_n_0\,
      D => \r_FIFO_COUNT[0]_i_1__8_n_0\,
      Q => r_FIFO_COUNT_reg(0),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__7_n_0\,
      D => p_0_out_carry_n_7,
      Q => r_FIFO_COUNT_reg(1),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__7_n_0\,
      D => p_0_out_carry_n_6,
      Q => r_FIFO_COUNT_reg(2),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__7_n_0\,
      D => p_0_out_carry_n_5,
      Q => r_FIFO_COUNT_reg(3),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__7_n_0\,
      D => p_0_out_carry_n_4,
      Q => r_FIFO_COUNT_reg(4),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__7_n_0\,
      D => \p_0_out_carry__0_n_7\,
      Q => r_FIFO_COUNT_reg(5),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__7_n_0\,
      D => \p_0_out_carry__0_n_6\,
      Q => r_FIFO_COUNT_reg(6),
      R => AR(0)
    );
r_FIFO_DATA_reg_0_31_0_5: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => Q(1 downto 0),
      DIB(1 downto 0) => Q(3 downto 2),
      DIC(1 downto 0) => Q(5 downto 4),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => o_rd_data(1 downto 0),
      DOB(1 downto 0) => o_rd_data(3 downto 2),
      DOC(1 downto 0) => o_rd_data(5 downto 4),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
r_FIFO_DATA_reg_0_31_6_11: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => Q(7 downto 6),
      DIB(1 downto 0) => Q(9 downto 8),
      DIC(1 downto 0) => Q(11 downto 10),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => o_rd_data(7 downto 6),
      DOB(1 downto 0) => o_rd_data(9 downto 8),
      DOC(1 downto 0) => o_rd_data(11 downto 10),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
\r_RD_INDEX[0]_i_1__8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_RD_INDEX(0),
      O => \r_RD_INDEX[0]_i_1__8_n_0\
    );
\r_RD_INDEX[1]_i_1__8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_RD_INDEX(0),
      I1 => r_RD_INDEX(1),
      O => \r_RD_INDEX[1]_i_1__8_n_0\
    );
\r_RD_INDEX[2]_i_1__8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      O => \r_RD_INDEX[2]_i_1__8_n_0\
    );
\r_RD_INDEX[3]_i_1__7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00C0000000800000"
    )
        port map (
      I0 => \r_WR_INDEX[4]_i_3__8_n_0\,
      I1 => \cnt_fifo_reg[5]\,
      I2 => address(3),
      I3 => address(2),
      I4 => rd_en,
      I5 => r_FIFO_COUNT_reg(5),
      O => r_RD_INDEX0
    );
\r_RD_INDEX[3]_i_2__8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      I3 => r_RD_INDEX(3),
      O => \r_RD_INDEX[3]_i_2__8_n_0\
    );
\r_RD_INDEX[4]_i_1__8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(4),
      I2 => r_RD_INDEX(0),
      I3 => r_RD_INDEX(1),
      I4 => r_RD_INDEX(3),
      O => \r_RD_INDEX[4]_i_1__8_n_0\
    );
\r_RD_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[0]_i_1__8_n_0\,
      Q => r_RD_INDEX(0),
      R => AR(0)
    );
\r_RD_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[1]_i_1__8_n_0\,
      Q => r_RD_INDEX(1),
      R => AR(0)
    );
\r_RD_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[2]_i_1__8_n_0\,
      Q => r_RD_INDEX(2),
      R => AR(0)
    );
\r_RD_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[3]_i_2__8_n_0\,
      Q => r_RD_INDEX(3),
      R => AR(0)
    );
\r_RD_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[4]_i_1__8_n_0\,
      Q => r_RD_INDEX(4),
      R => AR(0)
    );
\r_WR_INDEX[0]_i_1__8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_WR_INDEX(0),
      O => \r_WR_INDEX[0]_i_1__8_n_0\
    );
\r_WR_INDEX[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_WR_INDEX(0),
      I1 => r_WR_INDEX(1),
      O => \r_WR_INDEX[1]_i_1_n_0\
    );
\r_WR_INDEX[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      O => \r_WR_INDEX[2]_i_1_n_0\
    );
\r_WR_INDEX[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      I3 => r_WR_INDEX(3),
      O => \r_WR_INDEX[3]_i_1_n_0\
    );
\r_WR_INDEX[4]_i_1__8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => wr_en_reg,
      I1 => \r_WR_INDEX[4]_i_3__8_n_0\,
      I2 => r_FIFO_COUNT_reg(5),
      O => r_WR_INDEX0
    );
\r_WR_INDEX[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(4),
      I2 => r_WR_INDEX(0),
      I3 => r_WR_INDEX(1),
      I4 => r_WR_INDEX(3),
      O => \r_WR_INDEX[4]_i_2_n_0\
    );
\r_WR_INDEX[4]_i_3__8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      I1 => r_FIFO_COUNT_reg(6),
      I2 => r_FIFO_COUNT_reg(4),
      I3 => r_FIFO_COUNT_reg(3),
      I4 => r_FIFO_COUNT_reg(1),
      I5 => r_FIFO_COUNT_reg(2),
      O => \r_WR_INDEX[4]_i_3__8_n_0\
    );
\r_WR_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[0]_i_1__8_n_0\,
      Q => r_WR_INDEX(0),
      R => AR(0)
    );
\r_WR_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[1]_i_1_n_0\,
      Q => r_WR_INDEX(1),
      R => AR(0)
    );
\r_WR_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[2]_i_1_n_0\,
      Q => r_WR_INDEX(2),
      R => AR(0)
    );
\r_WR_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[3]_i_1_n_0\,
      Q => r_WR_INDEX(3),
      R => AR(0)
    );
\r_WR_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[4]_i_2_n_0\,
      Q => r_WR_INDEX(4),
      R => AR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_2 is
  port (
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    \r_RD_INDEX_reg[4]_0\ : out STD_LOGIC;
    \WDONBR_intl_reg[1]\ : out STD_LOGIC;
    full : out STD_LOGIC_VECTOR ( 0 to 0 );
    o_rd_data : out STD_LOGIC_VECTOR ( 11 downto 0 );
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    \cnt_fifo_reg[5]\ : in STD_LOGIC;
    address : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_en : in STD_LOGIC;
    wr_en_reg : in STD_LOGIC;
    \r_FIFO_COUNT_reg[5]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \FSM_onehot_fifo_wr_stm_reg[6]\ : in STD_LOGIC;
    p_0_in : in STD_LOGIC;
    \wr_data_reg[12][11]\ : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_2 : entity is "module_fifo_regs_no_flags";
end base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_2;

architecture STRUCTURE of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_2 is
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^full\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \p_0_out_carry__0_i_1__11_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_i_2__11_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_3\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_6\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_7\ : STD_LOGIC;
  signal \p_0_out_carry_i_1__11_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_2__11_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_3__11_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_4__11_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_5__3_n_0\ : STD_LOGIC;
  signal p_0_out_carry_n_0 : STD_LOGIC;
  signal p_0_out_carry_n_1 : STD_LOGIC;
  signal p_0_out_carry_n_2 : STD_LOGIC;
  signal p_0_out_carry_n_3 : STD_LOGIC;
  signal p_0_out_carry_n_4 : STD_LOGIC;
  signal p_0_out_carry_n_5 : STD_LOGIC;
  signal p_0_out_carry_n_6 : STD_LOGIC;
  signal p_0_out_carry_n_7 : STD_LOGIC;
  signal \r_FIFO_COUNT[0]_i_1__11_n_0\ : STD_LOGIC;
  signal \r_FIFO_COUNT[6]_i_1__3_n_0\ : STD_LOGIC;
  signal r_FIFO_COUNT_reg : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal r_RD_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_RD_INDEX0 : STD_LOGIC;
  signal \r_RD_INDEX[0]_i_1__11_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[1]_i_1__11_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[2]_i_1__11_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[3]_i_2__11_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[4]_i_1__11_n_0\ : STD_LOGIC;
  signal \^r_rd_index_reg[4]_0\ : STD_LOGIC;
  signal r_WR_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_WR_INDEX0 : STD_LOGIC;
  signal \r_WR_INDEX[0]_i_1__11_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[1]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[2]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[3]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_2_n_0\ : STD_LOGIC;
  signal \NLW_p_0_out_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_p_0_out_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of p_0_out_carry : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \p_0_out_carry__0\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_0_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_6_11 : label is "";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \r_RD_INDEX[1]_i_1__11\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \r_RD_INDEX[2]_i_1__11\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \r_RD_INDEX[3]_i_2__11\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \r_RD_INDEX[4]_i_1__11\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \r_WR_INDEX[1]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \r_WR_INDEX[2]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \r_WR_INDEX[3]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \r_WR_INDEX[4]_i_2\ : label is "soft_lutpair13";
begin
  Q(0) <= \^q\(0);
  full(0) <= \^full\(0);
  \r_RD_INDEX_reg[4]_0\ <= \^r_rd_index_reg[4]_0\;
\FSM_onehot_fifo_wr_stm[9]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^r_rd_index_reg[4]_0\,
      O => \^full\(0)
    );
\WDOTime_intl[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^full\(0),
      I1 => \r_FIFO_COUNT_reg[5]_0\(3),
      I2 => \r_FIFO_COUNT_reg[5]_0\(2),
      I3 => \r_FIFO_COUNT_reg[5]_0\(1),
      I4 => \r_FIFO_COUNT_reg[5]_0\(0),
      I5 => \FSM_onehot_fifo_wr_stm_reg[6]\,
      O => \WDONBR_intl_reg[1]\
    );
p_0_out_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => p_0_out_carry_n_0,
      CO(2) => p_0_out_carry_n_1,
      CO(1) => p_0_out_carry_n_2,
      CO(0) => p_0_out_carry_n_3,
      CYINIT => r_FIFO_COUNT_reg(0),
      DI(3 downto 1) => r_FIFO_COUNT_reg(3 downto 1),
      DI(0) => \p_0_out_carry_i_1__11_n_0\,
      O(3) => p_0_out_carry_n_4,
      O(2) => p_0_out_carry_n_5,
      O(1) => p_0_out_carry_n_6,
      O(0) => p_0_out_carry_n_7,
      S(3) => \p_0_out_carry_i_2__11_n_0\,
      S(2) => \p_0_out_carry_i_3__11_n_0\,
      S(1) => \p_0_out_carry_i_4__11_n_0\,
      S(0) => \p_0_out_carry_i_5__3_n_0\
    );
\p_0_out_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => p_0_out_carry_n_0,
      CO(3 downto 1) => \NLW_p_0_out_carry__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \p_0_out_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => r_FIFO_COUNT_reg(4),
      O(3 downto 2) => \NLW_p_0_out_carry__0_O_UNCONNECTED\(3 downto 2),
      O(1) => \p_0_out_carry__0_n_6\,
      O(0) => \p_0_out_carry__0_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \p_0_out_carry__0_i_1__11_n_0\,
      S(0) => \p_0_out_carry__0_i_2__11_n_0\
    );
\p_0_out_carry__0_i_1__11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(0),
      I1 => r_FIFO_COUNT_reg(6),
      O => \p_0_out_carry__0_i_1__11_n_0\
    );
\p_0_out_carry__0_i_2__11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(4),
      I1 => \^q\(0),
      O => \p_0_out_carry__0_i_2__11_n_0\
    );
\p_0_out_carry_i_1__11\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      O => \p_0_out_carry_i_1__11_n_0\
    );
\p_0_out_carry_i_2__11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(3),
      I1 => r_FIFO_COUNT_reg(4),
      O => \p_0_out_carry_i_2__11_n_0\
    );
\p_0_out_carry_i_3__11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(2),
      I1 => r_FIFO_COUNT_reg(3),
      O => \p_0_out_carry_i_3__11_n_0\
    );
\p_0_out_carry_i_4__11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => r_FIFO_COUNT_reg(2),
      O => \p_0_out_carry_i_4__11_n_0\
    );
\p_0_out_carry_i_5__3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9AAAAAAA55555555"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => \cnt_fifo_reg[5]\,
      I2 => address(2),
      I3 => address(3),
      I4 => rd_en,
      I5 => wr_en_reg,
      O => \p_0_out_carry_i_5__3_n_0\
    );
\r_FIFO_COUNT[0]_i_1__11\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      O => \r_FIFO_COUNT[0]_i_1__11_n_0\
    );
\r_FIFO_COUNT[6]_i_1__3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAA6AAA"
    )
        port map (
      I0 => wr_en_reg,
      I1 => rd_en,
      I2 => address(3),
      I3 => address(2),
      I4 => address(1),
      I5 => address(0),
      O => \r_FIFO_COUNT[6]_i_1__3_n_0\
    );
\r_FIFO_COUNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__3_n_0\,
      D => \r_FIFO_COUNT[0]_i_1__11_n_0\,
      Q => r_FIFO_COUNT_reg(0),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__3_n_0\,
      D => p_0_out_carry_n_7,
      Q => r_FIFO_COUNT_reg(1),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__3_n_0\,
      D => p_0_out_carry_n_6,
      Q => r_FIFO_COUNT_reg(2),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__3_n_0\,
      D => p_0_out_carry_n_5,
      Q => r_FIFO_COUNT_reg(3),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__3_n_0\,
      D => p_0_out_carry_n_4,
      Q => r_FIFO_COUNT_reg(4),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__3_n_0\,
      D => \p_0_out_carry__0_n_7\,
      Q => \^q\(0),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__3_n_0\,
      D => \p_0_out_carry__0_n_6\,
      Q => r_FIFO_COUNT_reg(6),
      R => AR(0)
    );
r_FIFO_DATA_reg_0_31_0_5: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => \wr_data_reg[12][11]\(1 downto 0),
      DIB(1 downto 0) => \wr_data_reg[12][11]\(3 downto 2),
      DIC(1 downto 0) => \wr_data_reg[12][11]\(5 downto 4),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => o_rd_data(1 downto 0),
      DOB(1 downto 0) => o_rd_data(3 downto 2),
      DOC(1 downto 0) => o_rd_data(5 downto 4),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
r_FIFO_DATA_reg_0_31_6_11: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => \wr_data_reg[12][11]\(7 downto 6),
      DIB(1 downto 0) => \wr_data_reg[12][11]\(9 downto 8),
      DIC(1 downto 0) => \wr_data_reg[12][11]\(11 downto 10),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => o_rd_data(7 downto 6),
      DOB(1 downto 0) => o_rd_data(9 downto 8),
      DOC(1 downto 0) => o_rd_data(11 downto 10),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
\r_RD_INDEX[0]_i_1__11\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_RD_INDEX(0),
      O => \r_RD_INDEX[0]_i_1__11_n_0\
    );
\r_RD_INDEX[1]_i_1__11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_RD_INDEX(0),
      I1 => r_RD_INDEX(1),
      O => \r_RD_INDEX[1]_i_1__11_n_0\
    );
\r_RD_INDEX[2]_i_1__11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      O => \r_RD_INDEX[2]_i_1__11_n_0\
    );
\r_RD_INDEX[3]_i_1__3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3000000020000000"
    )
        port map (
      I0 => \^r_rd_index_reg[4]_0\,
      I1 => \cnt_fifo_reg[5]\,
      I2 => address(2),
      I3 => address(3),
      I4 => rd_en,
      I5 => \^q\(0),
      O => r_RD_INDEX0
    );
\r_RD_INDEX[3]_i_2__11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      I3 => r_RD_INDEX(3),
      O => \r_RD_INDEX[3]_i_2__11_n_0\
    );
\r_RD_INDEX[4]_i_1__11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(4),
      I2 => r_RD_INDEX(0),
      I3 => r_RD_INDEX(1),
      I4 => r_RD_INDEX(3),
      O => \r_RD_INDEX[4]_i_1__11_n_0\
    );
\r_RD_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[0]_i_1__11_n_0\,
      Q => r_RD_INDEX(0),
      R => AR(0)
    );
\r_RD_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[1]_i_1__11_n_0\,
      Q => r_RD_INDEX(1),
      R => AR(0)
    );
\r_RD_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[2]_i_1__11_n_0\,
      Q => r_RD_INDEX(2),
      R => AR(0)
    );
\r_RD_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[3]_i_2__11_n_0\,
      Q => r_RD_INDEX(3),
      R => AR(0)
    );
\r_RD_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[4]_i_1__11_n_0\,
      Q => r_RD_INDEX(4),
      R => AR(0)
    );
\r_WR_INDEX[0]_i_1__11\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_WR_INDEX(0),
      O => \r_WR_INDEX[0]_i_1__11_n_0\
    );
\r_WR_INDEX[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_WR_INDEX(0),
      I1 => r_WR_INDEX(1),
      O => \r_WR_INDEX[1]_i_1_n_0\
    );
\r_WR_INDEX[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      O => \r_WR_INDEX[2]_i_1_n_0\
    );
\r_WR_INDEX[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      I3 => r_WR_INDEX(3),
      O => \r_WR_INDEX[3]_i_1_n_0\
    );
\r_WR_INDEX[4]_i_1__11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => wr_en_reg,
      I1 => \^r_rd_index_reg[4]_0\,
      I2 => \^q\(0),
      O => r_WR_INDEX0
    );
\r_WR_INDEX[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(4),
      I2 => r_WR_INDEX(0),
      I3 => r_WR_INDEX(1),
      I4 => r_WR_INDEX(3),
      O => \r_WR_INDEX[4]_i_2_n_0\
    );
\r_WR_INDEX[4]_i_3__11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      I1 => r_FIFO_COUNT_reg(6),
      I2 => r_FIFO_COUNT_reg(4),
      I3 => r_FIFO_COUNT_reg(3),
      I4 => r_FIFO_COUNT_reg(1),
      I5 => r_FIFO_COUNT_reg(2),
      O => \^r_rd_index_reg[4]_0\
    );
\r_WR_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[0]_i_1__11_n_0\,
      Q => r_WR_INDEX(0),
      R => AR(0)
    );
\r_WR_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[1]_i_1_n_0\,
      Q => r_WR_INDEX(1),
      R => AR(0)
    );
\r_WR_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[2]_i_1_n_0\,
      Q => r_WR_INDEX(2),
      R => AR(0)
    );
\r_WR_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[3]_i_1_n_0\,
      Q => r_WR_INDEX(3),
      R => AR(0)
    );
\r_WR_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[4]_i_2_n_0\,
      Q => r_WR_INDEX(4),
      R => AR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_3 is
  port (
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_onehot_fifo_wr_stm_reg[7]\ : out STD_LOGIC;
    WDOTime_intl0 : out STD_LOGIC;
    \DataOut_stall_reg[0]\ : out STD_LOGIC;
    \DataOut_stall_reg[1]\ : out STD_LOGIC;
    \DataOut_stall_reg[2]\ : out STD_LOGIC;
    \DataOut_stall_reg[3]\ : out STD_LOGIC;
    \DataOut_stall_reg[4]\ : out STD_LOGIC;
    \DataOut_stall_reg[5]\ : out STD_LOGIC;
    \DataOut_stall_reg[6]\ : out STD_LOGIC;
    \DataOut_stall_reg[7]\ : out STD_LOGIC;
    \DataOut_stall_reg[8]\ : out STD_LOGIC;
    \DataOut_stall_reg[9]\ : out STD_LOGIC;
    \DataOut_stall_reg[10]\ : out STD_LOGIC;
    \DataOut_stall_reg[11]\ : out STD_LOGIC;
    \r_RD_INDEX_reg[4]_0\ : out STD_LOGIC;
    FIFO_ReadEn_reg : out STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    address : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \cnt_fifo_reg[5]\ : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    wr_en_reg : in STD_LOGIC;
    \r_FIFO_COUNT_reg[5]_0\ : in STD_LOGIC;
    \r_FIFO_COUNT_reg[5]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \out\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TestFIFO : in STD_LOGIC;
    \r_FIFO_COUNT_reg[5]_2\ : in STD_LOGIC;
    \FSM_onehot_fifo_wr_stm_reg[6]\ : in STD_LOGIC;
    nRST : in STD_LOGIC;
    o_rd_data : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \r_FIFO_COUNT_reg[0]_0\ : in STD_LOGIC;
    \r_FIFO_COUNT_reg[5]_3\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \r_FIFO_COUNT_reg[5]_4\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \r_FIFO_COUNT_reg[0]_1\ : in STD_LOGIC;
    \r_FIFO_COUNT_reg[0]_2\ : in STD_LOGIC;
    \r_FIFO_COUNT_reg[5]_5\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    p_0_in : in STD_LOGIC;
    \wr_data_reg[13][11]\ : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_3 : entity is "module_fifo_regs_no_flags";
end base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_3;

architecture STRUCTURE of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_3 is
  signal \^fsm_onehot_fifo_wr_stm_reg[7]\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \p_0_out_carry__0_i_1__12_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_i_2__12_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_3\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_6\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_7\ : STD_LOGIC;
  signal \p_0_out_carry_i_1__12_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_2__12_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_3__12_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_4__12_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_5__6_n_0\ : STD_LOGIC;
  signal p_0_out_carry_n_0 : STD_LOGIC;
  signal p_0_out_carry_n_1 : STD_LOGIC;
  signal p_0_out_carry_n_2 : STD_LOGIC;
  signal p_0_out_carry_n_3 : STD_LOGIC;
  signal p_0_out_carry_n_4 : STD_LOGIC;
  signal p_0_out_carry_n_5 : STD_LOGIC;
  signal p_0_out_carry_n_6 : STD_LOGIC;
  signal p_0_out_carry_n_7 : STD_LOGIC;
  signal \r_FIFO_COUNT[0]_i_1__12_n_0\ : STD_LOGIC;
  signal \r_FIFO_COUNT[6]_i_1__6_n_0\ : STD_LOGIC;
  signal r_FIFO_COUNT_reg : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal r_RD_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_RD_INDEX0 : STD_LOGIC;
  signal \r_RD_INDEX[0]_i_1__12_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[1]_i_1__12_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[2]_i_1__12_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[3]_i_2__12_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[4]_i_1__12_n_0\ : STD_LOGIC;
  signal \^r_rd_index_reg[4]_0\ : STD_LOGIC;
  signal r_WR_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_WR_INDEX0 : STD_LOGIC;
  signal \r_WR_INDEX[0]_i_1__12_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[1]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[2]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[3]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_2_n_0\ : STD_LOGIC;
  signal \rd_data12[13]_13\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \NLW_p_0_out_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_p_0_out_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of p_0_out_carry : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \p_0_out_carry__0\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_0_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_6_11 : label is "";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \r_RD_INDEX[1]_i_1__12\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \r_RD_INDEX[2]_i_1__12\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \r_RD_INDEX[3]_i_2__12\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \r_RD_INDEX[4]_i_1__12\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \r_WR_INDEX[1]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \r_WR_INDEX[2]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \r_WR_INDEX[3]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \r_WR_INDEX[4]_i_2\ : label is "soft_lutpair17";
begin
  \FSM_onehot_fifo_wr_stm_reg[7]\ <= \^fsm_onehot_fifo_wr_stm_reg[7]\;
  Q(0) <= \^q\(0);
  \r_RD_INDEX_reg[4]_0\ <= \^r_rd_index_reg[4]_0\;
\DataOut_stall[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000C00A0000000"
    )
        port map (
      I0 => \rd_data12[13]_13\(0),
      I1 => o_rd_data(0),
      I2 => address(2),
      I3 => address(3),
      I4 => address(0),
      I5 => address(1),
      O => \DataOut_stall_reg[0]\
    );
\DataOut_stall[10]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000C00A0000000"
    )
        port map (
      I0 => \rd_data12[13]_13\(10),
      I1 => o_rd_data(10),
      I2 => address(2),
      I3 => address(3),
      I4 => address(0),
      I5 => address(1),
      O => \DataOut_stall_reg[10]\
    );
\DataOut_stall[11]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000C00A0000000"
    )
        port map (
      I0 => \rd_data12[13]_13\(11),
      I1 => o_rd_data(11),
      I2 => address(2),
      I3 => address(3),
      I4 => address(0),
      I5 => address(1),
      O => \DataOut_stall_reg[11]\
    );
\DataOut_stall[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000C00A0000000"
    )
        port map (
      I0 => \rd_data12[13]_13\(1),
      I1 => o_rd_data(1),
      I2 => address(2),
      I3 => address(3),
      I4 => address(0),
      I5 => address(1),
      O => \DataOut_stall_reg[1]\
    );
\DataOut_stall[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000C00A0000000"
    )
        port map (
      I0 => \rd_data12[13]_13\(2),
      I1 => o_rd_data(2),
      I2 => address(2),
      I3 => address(3),
      I4 => address(0),
      I5 => address(1),
      O => \DataOut_stall_reg[2]\
    );
\DataOut_stall[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000C00A0000000"
    )
        port map (
      I0 => \rd_data12[13]_13\(3),
      I1 => o_rd_data(3),
      I2 => address(2),
      I3 => address(3),
      I4 => address(0),
      I5 => address(1),
      O => \DataOut_stall_reg[3]\
    );
\DataOut_stall[4]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000C00A0000000"
    )
        port map (
      I0 => \rd_data12[13]_13\(4),
      I1 => o_rd_data(4),
      I2 => address(2),
      I3 => address(3),
      I4 => address(0),
      I5 => address(1),
      O => \DataOut_stall_reg[4]\
    );
\DataOut_stall[5]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000C00A0000000"
    )
        port map (
      I0 => \rd_data12[13]_13\(5),
      I1 => o_rd_data(5),
      I2 => address(2),
      I3 => address(3),
      I4 => address(0),
      I5 => address(1),
      O => \DataOut_stall_reg[5]\
    );
\DataOut_stall[6]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000C00A0000000"
    )
        port map (
      I0 => \rd_data12[13]_13\(6),
      I1 => o_rd_data(6),
      I2 => address(2),
      I3 => address(3),
      I4 => address(0),
      I5 => address(1),
      O => \DataOut_stall_reg[6]\
    );
\DataOut_stall[7]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000C00A0000000"
    )
        port map (
      I0 => \rd_data12[13]_13\(7),
      I1 => o_rd_data(7),
      I2 => address(2),
      I3 => address(3),
      I4 => address(0),
      I5 => address(1),
      O => \DataOut_stall_reg[7]\
    );
\DataOut_stall[8]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000C00A0000000"
    )
        port map (
      I0 => \rd_data12[13]_13\(8),
      I1 => o_rd_data(8),
      I2 => address(2),
      I3 => address(3),
      I4 => address(0),
      I5 => address(1),
      O => \DataOut_stall_reg[8]\
    );
\DataOut_stall[9]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000C00A0000000"
    )
        port map (
      I0 => \rd_data12[13]_13\(9),
      I1 => o_rd_data(9),
      I2 => address(2),
      I3 => address(3),
      I4 => address(0),
      I5 => address(1),
      O => \DataOut_stall_reg[9]\
    );
FIFO_ReadEn_i_10: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => \^r_rd_index_reg[4]_0\,
      I1 => \^q\(0),
      I2 => \r_FIFO_COUNT_reg[0]_0\,
      I3 => \r_FIFO_COUNT_reg[5]_3\(0),
      O => FIFO_ReadEn_reg
    );
\FSM_onehot_fifo_wr_stm[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => \^fsm_onehot_fifo_wr_stm_reg[7]\,
      I1 => \r_FIFO_COUNT_reg[5]_0\,
      I2 => \r_FIFO_COUNT_reg[5]_1\(0),
      I3 => \out\(0),
      I4 => TestFIFO,
      I5 => \r_FIFO_COUNT_reg[5]_2\,
      O => D(0)
    );
\FSM_onehot_fifo_wr_stm[9]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000002000000000"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^r_rd_index_reg[4]_0\,
      I2 => \r_FIFO_COUNT_reg[5]_4\(0),
      I3 => \r_FIFO_COUNT_reg[0]_1\,
      I4 => \r_FIFO_COUNT_reg[0]_2\,
      I5 => \r_FIFO_COUNT_reg[5]_5\(0),
      O => \^fsm_onehot_fifo_wr_stm_reg[7]\
    );
\WDOTime_intl[63]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAEAAA00000000"
    )
        port map (
      I0 => \out\(1),
      I1 => \^fsm_onehot_fifo_wr_stm_reg[7]\,
      I2 => \r_FIFO_COUNT_reg[5]_0\,
      I3 => \FSM_onehot_fifo_wr_stm_reg[6]\,
      I4 => \r_FIFO_COUNT_reg[5]_2\,
      I5 => nRST,
      O => WDOTime_intl0
    );
p_0_out_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => p_0_out_carry_n_0,
      CO(2) => p_0_out_carry_n_1,
      CO(1) => p_0_out_carry_n_2,
      CO(0) => p_0_out_carry_n_3,
      CYINIT => r_FIFO_COUNT_reg(0),
      DI(3 downto 1) => r_FIFO_COUNT_reg(3 downto 1),
      DI(0) => \p_0_out_carry_i_1__12_n_0\,
      O(3) => p_0_out_carry_n_4,
      O(2) => p_0_out_carry_n_5,
      O(1) => p_0_out_carry_n_6,
      O(0) => p_0_out_carry_n_7,
      S(3) => \p_0_out_carry_i_2__12_n_0\,
      S(2) => \p_0_out_carry_i_3__12_n_0\,
      S(1) => \p_0_out_carry_i_4__12_n_0\,
      S(0) => \p_0_out_carry_i_5__6_n_0\
    );
\p_0_out_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => p_0_out_carry_n_0,
      CO(3 downto 1) => \NLW_p_0_out_carry__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \p_0_out_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => r_FIFO_COUNT_reg(4),
      O(3 downto 2) => \NLW_p_0_out_carry__0_O_UNCONNECTED\(3 downto 2),
      O(1) => \p_0_out_carry__0_n_6\,
      O(0) => \p_0_out_carry__0_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \p_0_out_carry__0_i_1__12_n_0\,
      S(0) => \p_0_out_carry__0_i_2__12_n_0\
    );
\p_0_out_carry__0_i_1__12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(0),
      I1 => r_FIFO_COUNT_reg(6),
      O => \p_0_out_carry__0_i_1__12_n_0\
    );
\p_0_out_carry__0_i_2__12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(4),
      I1 => \^q\(0),
      O => \p_0_out_carry__0_i_2__12_n_0\
    );
\p_0_out_carry_i_1__12\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      O => \p_0_out_carry_i_1__12_n_0\
    );
\p_0_out_carry_i_2__12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(3),
      I1 => r_FIFO_COUNT_reg(4),
      O => \p_0_out_carry_i_2__12_n_0\
    );
\p_0_out_carry_i_3__12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(2),
      I1 => r_FIFO_COUNT_reg(3),
      O => \p_0_out_carry_i_3__12_n_0\
    );
\p_0_out_carry_i_4__12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => r_FIFO_COUNT_reg(2),
      O => \p_0_out_carry_i_4__12_n_0\
    );
\p_0_out_carry_i_5__6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAA55555555"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => address(2),
      I2 => address(3),
      I3 => \cnt_fifo_reg[5]\,
      I4 => rd_en,
      I5 => wr_en_reg,
      O => \p_0_out_carry_i_5__6_n_0\
    );
\r_FIFO_COUNT[0]_i_1__12\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      O => \r_FIFO_COUNT[0]_i_1__12_n_0\
    );
\r_FIFO_COUNT[6]_i_1__6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A6AAAAAAAAAAAAAA"
    )
        port map (
      I0 => wr_en_reg,
      I1 => rd_en,
      I2 => address(1),
      I3 => address(0),
      I4 => address(3),
      I5 => address(2),
      O => \r_FIFO_COUNT[6]_i_1__6_n_0\
    );
\r_FIFO_COUNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__6_n_0\,
      D => \r_FIFO_COUNT[0]_i_1__12_n_0\,
      Q => r_FIFO_COUNT_reg(0),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__6_n_0\,
      D => p_0_out_carry_n_7,
      Q => r_FIFO_COUNT_reg(1),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__6_n_0\,
      D => p_0_out_carry_n_6,
      Q => r_FIFO_COUNT_reg(2),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__6_n_0\,
      D => p_0_out_carry_n_5,
      Q => r_FIFO_COUNT_reg(3),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__6_n_0\,
      D => p_0_out_carry_n_4,
      Q => r_FIFO_COUNT_reg(4),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__6_n_0\,
      D => \p_0_out_carry__0_n_7\,
      Q => \^q\(0),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__6_n_0\,
      D => \p_0_out_carry__0_n_6\,
      Q => r_FIFO_COUNT_reg(6),
      R => AR(0)
    );
r_FIFO_DATA_reg_0_31_0_5: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => \wr_data_reg[13][11]\(1 downto 0),
      DIB(1 downto 0) => \wr_data_reg[13][11]\(3 downto 2),
      DIC(1 downto 0) => \wr_data_reg[13][11]\(5 downto 4),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => \rd_data12[13]_13\(1 downto 0),
      DOB(1 downto 0) => \rd_data12[13]_13\(3 downto 2),
      DOC(1 downto 0) => \rd_data12[13]_13\(5 downto 4),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
r_FIFO_DATA_reg_0_31_6_11: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => \wr_data_reg[13][11]\(7 downto 6),
      DIB(1 downto 0) => \wr_data_reg[13][11]\(9 downto 8),
      DIC(1 downto 0) => \wr_data_reg[13][11]\(11 downto 10),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => \rd_data12[13]_13\(7 downto 6),
      DOB(1 downto 0) => \rd_data12[13]_13\(9 downto 8),
      DOC(1 downto 0) => \rd_data12[13]_13\(11 downto 10),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
\r_RD_INDEX[0]_i_1__12\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_RD_INDEX(0),
      O => \r_RD_INDEX[0]_i_1__12_n_0\
    );
\r_RD_INDEX[1]_i_1__12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_RD_INDEX(0),
      I1 => r_RD_INDEX(1),
      O => \r_RD_INDEX[1]_i_1__12_n_0\
    );
\r_RD_INDEX[2]_i_1__12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      O => \r_RD_INDEX[2]_i_1__12_n_0\
    );
\r_RD_INDEX[3]_i_1__6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C000000080000000"
    )
        port map (
      I0 => \^r_rd_index_reg[4]_0\,
      I1 => address(2),
      I2 => address(3),
      I3 => \cnt_fifo_reg[5]\,
      I4 => rd_en,
      I5 => \^q\(0),
      O => r_RD_INDEX0
    );
\r_RD_INDEX[3]_i_2__12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      I3 => r_RD_INDEX(3),
      O => \r_RD_INDEX[3]_i_2__12_n_0\
    );
\r_RD_INDEX[4]_i_1__12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(4),
      I2 => r_RD_INDEX(0),
      I3 => r_RD_INDEX(1),
      I4 => r_RD_INDEX(3),
      O => \r_RD_INDEX[4]_i_1__12_n_0\
    );
\r_RD_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[0]_i_1__12_n_0\,
      Q => r_RD_INDEX(0),
      R => AR(0)
    );
\r_RD_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[1]_i_1__12_n_0\,
      Q => r_RD_INDEX(1),
      R => AR(0)
    );
\r_RD_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[2]_i_1__12_n_0\,
      Q => r_RD_INDEX(2),
      R => AR(0)
    );
\r_RD_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[3]_i_2__12_n_0\,
      Q => r_RD_INDEX(3),
      R => AR(0)
    );
\r_RD_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[4]_i_1__12_n_0\,
      Q => r_RD_INDEX(4),
      R => AR(0)
    );
\r_WR_INDEX[0]_i_1__12\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_WR_INDEX(0),
      O => \r_WR_INDEX[0]_i_1__12_n_0\
    );
\r_WR_INDEX[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_WR_INDEX(0),
      I1 => r_WR_INDEX(1),
      O => \r_WR_INDEX[1]_i_1_n_0\
    );
\r_WR_INDEX[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      O => \r_WR_INDEX[2]_i_1_n_0\
    );
\r_WR_INDEX[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      I3 => r_WR_INDEX(3),
      O => \r_WR_INDEX[3]_i_1_n_0\
    );
\r_WR_INDEX[4]_i_1__12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => wr_en_reg,
      I1 => \^r_rd_index_reg[4]_0\,
      I2 => \^q\(0),
      O => r_WR_INDEX0
    );
\r_WR_INDEX[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(4),
      I2 => r_WR_INDEX(0),
      I3 => r_WR_INDEX(1),
      I4 => r_WR_INDEX(3),
      O => \r_WR_INDEX[4]_i_2_n_0\
    );
\r_WR_INDEX[4]_i_3__12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      I1 => r_FIFO_COUNT_reg(6),
      I2 => r_FIFO_COUNT_reg(4),
      I3 => r_FIFO_COUNT_reg(3),
      I4 => r_FIFO_COUNT_reg(1),
      I5 => r_FIFO_COUNT_reg(2),
      O => \^r_rd_index_reg[4]_0\
    );
\r_WR_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[0]_i_1__12_n_0\,
      Q => r_WR_INDEX(0),
      R => AR(0)
    );
\r_WR_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[1]_i_1_n_0\,
      Q => r_WR_INDEX(1),
      R => AR(0)
    );
\r_WR_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[2]_i_1_n_0\,
      Q => r_WR_INDEX(2),
      R => AR(0)
    );
\r_WR_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[3]_i_1_n_0\,
      Q => r_WR_INDEX(3),
      R => AR(0)
    );
\r_WR_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[4]_i_2_n_0\,
      Q => r_WR_INDEX(4),
      R => AR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_4 is
  port (
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_onehot_fifo_wr_stm_reg[0]\ : out STD_LOGIC;
    \r_RD_INDEX_reg[4]_0\ : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    p_0_in : out STD_LOGIC;
    o_rd_data : out STD_LOGIC_VECTOR ( 11 downto 0 );
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    address : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \cnt_fifo_reg[6]\ : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    wr_en_reg : in STD_LOGIC;
    \r_FIFO_COUNT_reg[5]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \r_FIFO_COUNT_reg[0]_0\ : in STD_LOGIC;
    full : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \FIFO_RD_reg[busy]\ : in STD_LOGIC;
    \r_FIFO_COUNT_reg[5]_1\ : in STD_LOGIC;
    \r_FIFO_COUNT_reg[5]_2\ : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    PRECvalid : in STD_LOGIC;
    nRST : in STD_LOGIC;
    \wr_data_reg[14][11]\ : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_4 : entity is "module_fifo_regs_no_flags";
end base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_4;

architecture STRUCTURE of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_4 is
  signal \^fsm_onehot_fifo_wr_stm_reg[0]\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^p_0_in\ : STD_LOGIC;
  signal \p_0_out_carry__0_i_1__13_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_i_2__13_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_3\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_6\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_7\ : STD_LOGIC;
  signal \p_0_out_carry_i_1__13_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_2__13_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_3__13_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_4__13_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_5__9_n_0\ : STD_LOGIC;
  signal p_0_out_carry_n_0 : STD_LOGIC;
  signal p_0_out_carry_n_1 : STD_LOGIC;
  signal p_0_out_carry_n_2 : STD_LOGIC;
  signal p_0_out_carry_n_3 : STD_LOGIC;
  signal p_0_out_carry_n_4 : STD_LOGIC;
  signal p_0_out_carry_n_5 : STD_LOGIC;
  signal p_0_out_carry_n_6 : STD_LOGIC;
  signal p_0_out_carry_n_7 : STD_LOGIC;
  signal \r_FIFO_COUNT[0]_i_1__13_n_0\ : STD_LOGIC;
  signal \r_FIFO_COUNT[6]_i_1__9_n_0\ : STD_LOGIC;
  signal r_FIFO_COUNT_reg : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal r_RD_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_RD_INDEX0 : STD_LOGIC;
  signal \r_RD_INDEX[0]_i_1__13_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[1]_i_1__13_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[2]_i_1__13_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[3]_i_2__13_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[4]_i_1__13_n_0\ : STD_LOGIC;
  signal \^r_rd_index_reg[4]_0\ : STD_LOGIC;
  signal r_WR_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_WR_INDEX0 : STD_LOGIC;
  signal \r_WR_INDEX[0]_i_1__13_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[1]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[2]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[3]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_2_n_0\ : STD_LOGIC;
  signal \NLW_p_0_out_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_p_0_out_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of p_0_out_carry : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \p_0_out_carry__0\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_0_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_6_11 : label is "";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \r_RD_INDEX[1]_i_1__13\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \r_RD_INDEX[2]_i_1__13\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \r_RD_INDEX[3]_i_2__13\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \r_RD_INDEX[4]_i_1__13\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \r_WR_INDEX[1]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \r_WR_INDEX[2]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \r_WR_INDEX[3]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \r_WR_INDEX[4]_i_2\ : label is "soft_lutpair20";
begin
  \FSM_onehot_fifo_wr_stm_reg[0]\ <= \^fsm_onehot_fifo_wr_stm_reg[0]\;
  Q(0) <= \^q\(0);
  p_0_in <= \^p_0_in\;
  \r_RD_INDEX_reg[4]_0\ <= \^r_rd_index_reg[4]_0\;
\FSM_onehot_fifo_wr_stm[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBFAAAA"
    )
        port map (
      I0 => \FIFO_RD_reg[busy]\,
      I1 => \^fsm_onehot_fifo_wr_stm_reg[0]\,
      I2 => \r_FIFO_COUNT_reg[5]_1\,
      I3 => \r_FIFO_COUNT_reg[5]_2\,
      I4 => \out\(2),
      O => D(0)
    );
\FSM_onehot_fifo_wr_stm[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444F44444444444"
    )
        port map (
      I0 => PRECvalid,
      I1 => \out\(0),
      I2 => \^fsm_onehot_fifo_wr_stm_reg[0]\,
      I3 => \r_FIFO_COUNT_reg[5]_1\,
      I4 => \r_FIFO_COUNT_reg[5]_2\,
      I5 => \out\(1),
      O => D(1)
    );
\FSM_onehot_fifo_wr_stm[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0020000000000000"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^r_rd_index_reg[4]_0\,
      I2 => \r_FIFO_COUNT_reg[5]_0\(0),
      I3 => \r_FIFO_COUNT_reg[0]_0\,
      I4 => full(1),
      I5 => full(0),
      O => \^fsm_onehot_fifo_wr_stm_reg[0]\
    );
p_0_out_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => p_0_out_carry_n_0,
      CO(2) => p_0_out_carry_n_1,
      CO(1) => p_0_out_carry_n_2,
      CO(0) => p_0_out_carry_n_3,
      CYINIT => r_FIFO_COUNT_reg(0),
      DI(3 downto 1) => r_FIFO_COUNT_reg(3 downto 1),
      DI(0) => \p_0_out_carry_i_1__13_n_0\,
      O(3) => p_0_out_carry_n_4,
      O(2) => p_0_out_carry_n_5,
      O(1) => p_0_out_carry_n_6,
      O(0) => p_0_out_carry_n_7,
      S(3) => \p_0_out_carry_i_2__13_n_0\,
      S(2) => \p_0_out_carry_i_3__13_n_0\,
      S(1) => \p_0_out_carry_i_4__13_n_0\,
      S(0) => \p_0_out_carry_i_5__9_n_0\
    );
\p_0_out_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => p_0_out_carry_n_0,
      CO(3 downto 1) => \NLW_p_0_out_carry__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \p_0_out_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => r_FIFO_COUNT_reg(4),
      O(3 downto 2) => \NLW_p_0_out_carry__0_O_UNCONNECTED\(3 downto 2),
      O(1) => \p_0_out_carry__0_n_6\,
      O(0) => \p_0_out_carry__0_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \p_0_out_carry__0_i_1__13_n_0\,
      S(0) => \p_0_out_carry__0_i_2__13_n_0\
    );
\p_0_out_carry__0_i_1__13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(0),
      I1 => r_FIFO_COUNT_reg(6),
      O => \p_0_out_carry__0_i_1__13_n_0\
    );
\p_0_out_carry__0_i_2__13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(4),
      I1 => \^q\(0),
      O => \p_0_out_carry__0_i_2__13_n_0\
    );
\p_0_out_carry_i_1__13\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      O => \p_0_out_carry_i_1__13_n_0\
    );
\p_0_out_carry_i_2__13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(3),
      I1 => r_FIFO_COUNT_reg(4),
      O => \p_0_out_carry_i_2__13_n_0\
    );
\p_0_out_carry_i_3__13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(2),
      I1 => r_FIFO_COUNT_reg(3),
      O => \p_0_out_carry_i_3__13_n_0\
    );
\p_0_out_carry_i_4__13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => r_FIFO_COUNT_reg(2),
      O => \p_0_out_carry_i_4__13_n_0\
    );
\p_0_out_carry_i_5__9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAA55555555"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => address(2),
      I2 => address(3),
      I3 => \cnt_fifo_reg[6]\,
      I4 => rd_en,
      I5 => wr_en_reg,
      O => \p_0_out_carry_i_5__9_n_0\
    );
\r_FIFO_COUNT[0]_i_1__13\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      O => \r_FIFO_COUNT[0]_i_1__13_n_0\
    );
\r_FIFO_COUNT[6]_i_1__9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A6AAAAAAAAAAAAAA"
    )
        port map (
      I0 => wr_en_reg,
      I1 => rd_en,
      I2 => address(0),
      I3 => address(1),
      I4 => address(3),
      I5 => address(2),
      O => \r_FIFO_COUNT[6]_i_1__9_n_0\
    );
\r_FIFO_COUNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__9_n_0\,
      D => \r_FIFO_COUNT[0]_i_1__13_n_0\,
      Q => r_FIFO_COUNT_reg(0),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__9_n_0\,
      D => p_0_out_carry_n_7,
      Q => r_FIFO_COUNT_reg(1),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__9_n_0\,
      D => p_0_out_carry_n_6,
      Q => r_FIFO_COUNT_reg(2),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__9_n_0\,
      D => p_0_out_carry_n_5,
      Q => r_FIFO_COUNT_reg(3),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__9_n_0\,
      D => p_0_out_carry_n_4,
      Q => r_FIFO_COUNT_reg(4),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__9_n_0\,
      D => \p_0_out_carry__0_n_7\,
      Q => \^q\(0),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__9_n_0\,
      D => \p_0_out_carry__0_n_6\,
      Q => r_FIFO_COUNT_reg(6),
      R => AR(0)
    );
r_FIFO_DATA_reg_0_31_0_5: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => \wr_data_reg[14][11]\(1 downto 0),
      DIB(1 downto 0) => \wr_data_reg[14][11]\(3 downto 2),
      DIC(1 downto 0) => \wr_data_reg[14][11]\(5 downto 4),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => o_rd_data(1 downto 0),
      DOB(1 downto 0) => o_rd_data(3 downto 2),
      DOC(1 downto 0) => o_rd_data(5 downto 4),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => \^p_0_in\
    );
r_FIFO_DATA_reg_0_31_0_5_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => wr_en_reg,
      I1 => nRST,
      O => \^p_0_in\
    );
r_FIFO_DATA_reg_0_31_6_11: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => \wr_data_reg[14][11]\(7 downto 6),
      DIB(1 downto 0) => \wr_data_reg[14][11]\(9 downto 8),
      DIC(1 downto 0) => \wr_data_reg[14][11]\(11 downto 10),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => o_rd_data(7 downto 6),
      DOB(1 downto 0) => o_rd_data(9 downto 8),
      DOC(1 downto 0) => o_rd_data(11 downto 10),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => \^p_0_in\
    );
\r_RD_INDEX[0]_i_1__13\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_RD_INDEX(0),
      O => \r_RD_INDEX[0]_i_1__13_n_0\
    );
\r_RD_INDEX[1]_i_1__13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_RD_INDEX(0),
      I1 => r_RD_INDEX(1),
      O => \r_RD_INDEX[1]_i_1__13_n_0\
    );
\r_RD_INDEX[2]_i_1__13\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      O => \r_RD_INDEX[2]_i_1__13_n_0\
    );
\r_RD_INDEX[3]_i_1__9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C000000080000000"
    )
        port map (
      I0 => \^r_rd_index_reg[4]_0\,
      I1 => address(2),
      I2 => address(3),
      I3 => \cnt_fifo_reg[6]\,
      I4 => rd_en,
      I5 => \^q\(0),
      O => r_RD_INDEX0
    );
\r_RD_INDEX[3]_i_2__13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      I3 => r_RD_INDEX(3),
      O => \r_RD_INDEX[3]_i_2__13_n_0\
    );
\r_RD_INDEX[4]_i_1__13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(4),
      I2 => r_RD_INDEX(0),
      I3 => r_RD_INDEX(1),
      I4 => r_RD_INDEX(3),
      O => \r_RD_INDEX[4]_i_1__13_n_0\
    );
\r_RD_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[0]_i_1__13_n_0\,
      Q => r_RD_INDEX(0),
      R => AR(0)
    );
\r_RD_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[1]_i_1__13_n_0\,
      Q => r_RD_INDEX(1),
      R => AR(0)
    );
\r_RD_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[2]_i_1__13_n_0\,
      Q => r_RD_INDEX(2),
      R => AR(0)
    );
\r_RD_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[3]_i_2__13_n_0\,
      Q => r_RD_INDEX(3),
      R => AR(0)
    );
\r_RD_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[4]_i_1__13_n_0\,
      Q => r_RD_INDEX(4),
      R => AR(0)
    );
\r_WR_INDEX[0]_i_1__13\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_WR_INDEX(0),
      O => \r_WR_INDEX[0]_i_1__13_n_0\
    );
\r_WR_INDEX[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_WR_INDEX(0),
      I1 => r_WR_INDEX(1),
      O => \r_WR_INDEX[1]_i_1_n_0\
    );
\r_WR_INDEX[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      O => \r_WR_INDEX[2]_i_1_n_0\
    );
\r_WR_INDEX[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      I3 => r_WR_INDEX(3),
      O => \r_WR_INDEX[3]_i_1_n_0\
    );
\r_WR_INDEX[4]_i_1__13\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => wr_en_reg,
      I1 => \^r_rd_index_reg[4]_0\,
      I2 => \^q\(0),
      O => r_WR_INDEX0
    );
\r_WR_INDEX[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(4),
      I2 => r_WR_INDEX(0),
      I3 => r_WR_INDEX(1),
      I4 => r_WR_INDEX(3),
      O => \r_WR_INDEX[4]_i_2_n_0\
    );
\r_WR_INDEX[4]_i_3__13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      I1 => r_FIFO_COUNT_reg(6),
      I2 => r_FIFO_COUNT_reg(4),
      I3 => r_FIFO_COUNT_reg(3),
      I4 => r_FIFO_COUNT_reg(1),
      I5 => r_FIFO_COUNT_reg(2),
      O => \^r_rd_index_reg[4]_0\
    );
\r_WR_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[0]_i_1__13_n_0\,
      Q => r_WR_INDEX(0),
      R => AR(0)
    );
\r_WR_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[1]_i_1_n_0\,
      Q => r_WR_INDEX(1),
      R => AR(0)
    );
\r_WR_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[2]_i_1_n_0\,
      Q => r_WR_INDEX(2),
      R => AR(0)
    );
\r_WR_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[3]_i_1_n_0\,
      Q => r_WR_INDEX(3),
      R => AR(0)
    );
\r_WR_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[4]_i_2_n_0\,
      Q => r_WR_INDEX(4),
      R => AR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_5 is
  port (
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    \DataOut_last_reg[0]\ : out STD_LOGIC;
    \DataOut_last_reg[1]\ : out STD_LOGIC;
    \DataOut_last_reg[2]\ : out STD_LOGIC;
    \DataOut_last_reg[3]\ : out STD_LOGIC;
    \DataOut_last_reg[4]\ : out STD_LOGIC;
    \DataOut_last_reg[5]\ : out STD_LOGIC;
    \DataOut_last_reg[6]\ : out STD_LOGIC;
    \DataOut_last_reg[7]\ : out STD_LOGIC;
    \DataOut_last_reg[8]\ : out STD_LOGIC;
    \DataOut_last_reg[9]\ : out STD_LOGIC;
    \DataOut_last_reg[10]\ : out STD_LOGIC;
    \DataOut_last_reg[11]\ : out STD_LOGIC;
    \DataOut_stall_reg[0]\ : out STD_LOGIC;
    \DataOut_stall_reg[1]\ : out STD_LOGIC;
    \DataOut_stall_reg[2]\ : out STD_LOGIC;
    \DataOut_stall_reg[3]\ : out STD_LOGIC;
    \DataOut_stall_reg[4]\ : out STD_LOGIC;
    \DataOut_stall_reg[5]\ : out STD_LOGIC;
    \DataOut_stall_reg[6]\ : out STD_LOGIC;
    \DataOut_stall_reg[7]\ : out STD_LOGIC;
    \DataOut_stall_reg[8]\ : out STD_LOGIC;
    \DataOut_stall_reg[9]\ : out STD_LOGIC;
    \DataOut_stall_reg[10]\ : out STD_LOGIC;
    \DataOut_stall_reg[11]\ : out STD_LOGIC;
    \r_RD_INDEX_reg[4]_0\ : out STD_LOGIC;
    FIFO_ReadEn_reg : out STD_LOGIC;
    full : out STD_LOGIC_VECTOR ( 0 to 0 );
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    \cnt_fifo_reg[5]\ : in STD_LOGIC;
    address : in STD_LOGIC_VECTOR ( 3 downto 0 );
    wr_en_reg : in STD_LOGIC;
    o_rd_data : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \cnt_fifo_reg[7]\ : in STD_LOGIC;
    \cnt_fifo_reg[6]\ : in STD_LOGIC;
    \cnt_fifo_reg[7]_0\ : in STD_LOGIC;
    \cnt_fifo_reg[5]_0\ : in STD_LOGIC;
    \cnt_fifo_reg[8]\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_0\ : in STD_LOGIC;
    \wr_data_reg[0][7]\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \cnt_fifo_reg[7]_1\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_0\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_1\ : in STD_LOGIC;
    \cnt_fifo_reg[5]_1\ : in STD_LOGIC;
    \cnt_fifo_reg[7]_2\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_1\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_2\ : in STD_LOGIC;
    \cnt_fifo_reg[5]_2\ : in STD_LOGIC;
    \cnt_fifo_reg[7]_3\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_2\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_3\ : in STD_LOGIC;
    \cnt_fifo_reg[5]_3\ : in STD_LOGIC;
    \cnt_fifo_reg[7]_4\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_3\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_4\ : in STD_LOGIC;
    \cnt_fifo_reg[5]_4\ : in STD_LOGIC;
    \cnt_fifo_reg[7]_5\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_4\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_5\ : in STD_LOGIC;
    \cnt_fifo_reg[5]_5\ : in STD_LOGIC;
    \cnt_fifo_reg[7]_6\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_5\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_6\ : in STD_LOGIC;
    \cnt_fifo_reg[5]_6\ : in STD_LOGIC;
    \cnt_fifo_reg[7]_7\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_6\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_7\ : in STD_LOGIC;
    \cnt_fifo_reg[5]_7\ : in STD_LOGIC;
    \cnt_fifo_reg[7]_8\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_7\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_8\ : in STD_LOGIC;
    \cnt_fifo_reg[5]_8\ : in STD_LOGIC;
    \cnt_fifo_reg[7]_9\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_8\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_9\ : in STD_LOGIC;
    \cnt_fifo_reg[5]_9\ : in STD_LOGIC;
    \cnt_fifo_reg[7]_10\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_9\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_10\ : in STD_LOGIC;
    \cnt_fifo_reg[5]_10\ : in STD_LOGIC;
    \cnt_fifo_reg[7]_11\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_10\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_11\ : in STD_LOGIC;
    \cnt_fifo_reg[5]_11\ : in STD_LOGIC;
    \cnt_fifo_reg[7]_12\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_11\ : in STD_LOGIC;
    \r_FIFO_COUNT_reg[0]_0\ : in STD_LOGIC;
    \r_FIFO_COUNT_reg[5]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    p_0_in : in STD_LOGIC;
    \wr_data_reg[15][11]\ : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_5 : entity is "module_fifo_regs_no_flags";
end base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_5;

architecture STRUCTURE of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_5 is
  signal \DataOut[0]_i_5_n_0\ : STD_LOGIC;
  signal \DataOut[10]_i_5_n_0\ : STD_LOGIC;
  signal \DataOut[11]_i_7_n_0\ : STD_LOGIC;
  signal \DataOut[1]_i_5_n_0\ : STD_LOGIC;
  signal \DataOut[2]_i_5_n_0\ : STD_LOGIC;
  signal \DataOut[3]_i_5_n_0\ : STD_LOGIC;
  signal \DataOut[4]_i_5_n_0\ : STD_LOGIC;
  signal \DataOut[5]_i_5_n_0\ : STD_LOGIC;
  signal \DataOut[6]_i_5_n_0\ : STD_LOGIC;
  signal \DataOut[7]_i_5_n_0\ : STD_LOGIC;
  signal \DataOut[8]_i_5_n_0\ : STD_LOGIC;
  signal \DataOut[9]_i_5_n_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \p_0_out_carry__0_i_1__14_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_i_2__14_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_3\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_6\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_7\ : STD_LOGIC;
  signal \p_0_out_carry_i_1__14_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_2__14_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_3__14_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_4__14_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_5__12_n_0\ : STD_LOGIC;
  signal p_0_out_carry_n_0 : STD_LOGIC;
  signal p_0_out_carry_n_1 : STD_LOGIC;
  signal p_0_out_carry_n_2 : STD_LOGIC;
  signal p_0_out_carry_n_3 : STD_LOGIC;
  signal p_0_out_carry_n_4 : STD_LOGIC;
  signal p_0_out_carry_n_5 : STD_LOGIC;
  signal p_0_out_carry_n_6 : STD_LOGIC;
  signal p_0_out_carry_n_7 : STD_LOGIC;
  signal \r_FIFO_COUNT[0]_i_1__14_n_0\ : STD_LOGIC;
  signal \r_FIFO_COUNT[6]_i_1__12_n_0\ : STD_LOGIC;
  signal r_FIFO_COUNT_reg : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal r_RD_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_RD_INDEX0 : STD_LOGIC;
  signal \r_RD_INDEX[0]_i_1__14_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[1]_i_1__14_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[2]_i_1__14_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[3]_i_2__14_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[4]_i_1__14_n_0\ : STD_LOGIC;
  signal \^r_rd_index_reg[4]_0\ : STD_LOGIC;
  signal r_WR_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_WR_INDEX0 : STD_LOGIC;
  signal \r_WR_INDEX[0]_i_1__14_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[1]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[2]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[3]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_2_n_0\ : STD_LOGIC;
  signal \rd_data12[15]_15\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \NLW_p_0_out_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_p_0_out_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of FIFO_ReadEn_i_11 : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \FSM_onehot_fifo_wr_stm[4]_i_4\ : label is "soft_lutpair26";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of p_0_out_carry : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \p_0_out_carry__0\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_0_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_6_11 : label is "";
  attribute SOFT_HLUTNM of \r_RD_INDEX[1]_i_1__14\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \r_RD_INDEX[2]_i_1__14\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \r_RD_INDEX[3]_i_2__14\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \r_RD_INDEX[4]_i_1__14\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \r_WR_INDEX[1]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \r_WR_INDEX[2]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \r_WR_INDEX[3]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \r_WR_INDEX[4]_i_2\ : label is "soft_lutpair24";
begin
  Q(0) <= \^q\(0);
  \r_RD_INDEX_reg[4]_0\ <= \^r_rd_index_reg[4]_0\;
\DataOut[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \DataOut[0]_i_5_n_0\,
      I1 => o_rd_data(0),
      I2 => \cnt_fifo_reg[7]\,
      I3 => \cnt_fifo_reg[6]\,
      I4 => \cnt_fifo_reg[7]_0\,
      I5 => \cnt_fifo_reg[5]_0\,
      O => \DataOut_last_reg[0]\
    );
\DataOut[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF4F44"
    )
        port map (
      I0 => \cnt_fifo_reg[8]\,
      I1 => \rd_data12[15]_15\(0),
      I2 => \cnt_fifo_reg[6]_0\,
      I3 => \wr_data_reg[0][7]\(0),
      I4 => \cnt_fifo_reg[7]_1\,
      I5 => \cnt_fifo_reg[8]_0\,
      O => \DataOut[0]_i_5_n_0\
    );
\DataOut[10]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \DataOut[10]_i_5_n_0\,
      I1 => o_rd_data(10),
      I2 => \cnt_fifo_reg[7]\,
      I3 => \cnt_fifo_reg[6]_10\,
      I4 => \cnt_fifo_reg[7]_0\,
      I5 => \cnt_fifo_reg[5]_10\,
      O => \DataOut_last_reg[10]\
    );
\DataOut[10]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF4F44"
    )
        port map (
      I0 => \cnt_fifo_reg[8]\,
      I1 => \rd_data12[15]_15\(10),
      I2 => \cnt_fifo_reg[6]_0\,
      I3 => \wr_data_reg[0][7]\(10),
      I4 => \cnt_fifo_reg[7]_11\,
      I5 => \cnt_fifo_reg[8]_10\,
      O => \DataOut[10]_i_5_n_0\
    );
\DataOut[11]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \DataOut[11]_i_7_n_0\,
      I1 => o_rd_data(11),
      I2 => \cnt_fifo_reg[7]\,
      I3 => \cnt_fifo_reg[6]_11\,
      I4 => \cnt_fifo_reg[7]_0\,
      I5 => \cnt_fifo_reg[5]_11\,
      O => \DataOut_last_reg[11]\
    );
\DataOut[11]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF4F44"
    )
        port map (
      I0 => \cnt_fifo_reg[8]\,
      I1 => \rd_data12[15]_15\(11),
      I2 => \cnt_fifo_reg[6]_0\,
      I3 => \wr_data_reg[0][7]\(11),
      I4 => \cnt_fifo_reg[7]_12\,
      I5 => \cnt_fifo_reg[8]_11\,
      O => \DataOut[11]_i_7_n_0\
    );
\DataOut[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \DataOut[1]_i_5_n_0\,
      I1 => o_rd_data(1),
      I2 => \cnt_fifo_reg[7]\,
      I3 => \cnt_fifo_reg[6]_1\,
      I4 => \cnt_fifo_reg[7]_0\,
      I5 => \cnt_fifo_reg[5]_1\,
      O => \DataOut_last_reg[1]\
    );
\DataOut[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF4F44"
    )
        port map (
      I0 => \cnt_fifo_reg[8]\,
      I1 => \rd_data12[15]_15\(1),
      I2 => \cnt_fifo_reg[6]_0\,
      I3 => \wr_data_reg[0][7]\(1),
      I4 => \cnt_fifo_reg[7]_2\,
      I5 => \cnt_fifo_reg[8]_1\,
      O => \DataOut[1]_i_5_n_0\
    );
\DataOut[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \DataOut[2]_i_5_n_0\,
      I1 => o_rd_data(2),
      I2 => \cnt_fifo_reg[7]\,
      I3 => \cnt_fifo_reg[6]_2\,
      I4 => \cnt_fifo_reg[7]_0\,
      I5 => \cnt_fifo_reg[5]_2\,
      O => \DataOut_last_reg[2]\
    );
\DataOut[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF4F44"
    )
        port map (
      I0 => \cnt_fifo_reg[8]\,
      I1 => \rd_data12[15]_15\(2),
      I2 => \cnt_fifo_reg[6]_0\,
      I3 => \wr_data_reg[0][7]\(2),
      I4 => \cnt_fifo_reg[7]_3\,
      I5 => \cnt_fifo_reg[8]_2\,
      O => \DataOut[2]_i_5_n_0\
    );
\DataOut[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \DataOut[3]_i_5_n_0\,
      I1 => o_rd_data(3),
      I2 => \cnt_fifo_reg[7]\,
      I3 => \cnt_fifo_reg[6]_3\,
      I4 => \cnt_fifo_reg[7]_0\,
      I5 => \cnt_fifo_reg[5]_3\,
      O => \DataOut_last_reg[3]\
    );
\DataOut[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF4F44"
    )
        port map (
      I0 => \cnt_fifo_reg[8]\,
      I1 => \rd_data12[15]_15\(3),
      I2 => \cnt_fifo_reg[6]_0\,
      I3 => \wr_data_reg[0][7]\(3),
      I4 => \cnt_fifo_reg[7]_4\,
      I5 => \cnt_fifo_reg[8]_3\,
      O => \DataOut[3]_i_5_n_0\
    );
\DataOut[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \DataOut[4]_i_5_n_0\,
      I1 => o_rd_data(4),
      I2 => \cnt_fifo_reg[7]\,
      I3 => \cnt_fifo_reg[6]_4\,
      I4 => \cnt_fifo_reg[7]_0\,
      I5 => \cnt_fifo_reg[5]_4\,
      O => \DataOut_last_reg[4]\
    );
\DataOut[4]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF4F44"
    )
        port map (
      I0 => \cnt_fifo_reg[8]\,
      I1 => \rd_data12[15]_15\(4),
      I2 => \cnt_fifo_reg[6]_0\,
      I3 => \wr_data_reg[0][7]\(4),
      I4 => \cnt_fifo_reg[7]_5\,
      I5 => \cnt_fifo_reg[8]_4\,
      O => \DataOut[4]_i_5_n_0\
    );
\DataOut[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \DataOut[5]_i_5_n_0\,
      I1 => o_rd_data(5),
      I2 => \cnt_fifo_reg[7]\,
      I3 => \cnt_fifo_reg[6]_5\,
      I4 => \cnt_fifo_reg[7]_0\,
      I5 => \cnt_fifo_reg[5]_5\,
      O => \DataOut_last_reg[5]\
    );
\DataOut[5]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF4F44"
    )
        port map (
      I0 => \cnt_fifo_reg[8]\,
      I1 => \rd_data12[15]_15\(5),
      I2 => \cnt_fifo_reg[6]_0\,
      I3 => \wr_data_reg[0][7]\(5),
      I4 => \cnt_fifo_reg[7]_6\,
      I5 => \cnt_fifo_reg[8]_5\,
      O => \DataOut[5]_i_5_n_0\
    );
\DataOut[6]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \DataOut[6]_i_5_n_0\,
      I1 => o_rd_data(6),
      I2 => \cnt_fifo_reg[7]\,
      I3 => \cnt_fifo_reg[6]_6\,
      I4 => \cnt_fifo_reg[7]_0\,
      I5 => \cnt_fifo_reg[5]_6\,
      O => \DataOut_last_reg[6]\
    );
\DataOut[6]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF4F44"
    )
        port map (
      I0 => \cnt_fifo_reg[8]\,
      I1 => \rd_data12[15]_15\(6),
      I2 => \cnt_fifo_reg[6]_0\,
      I3 => \wr_data_reg[0][7]\(6),
      I4 => \cnt_fifo_reg[7]_7\,
      I5 => \cnt_fifo_reg[8]_6\,
      O => \DataOut[6]_i_5_n_0\
    );
\DataOut[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \DataOut[7]_i_5_n_0\,
      I1 => o_rd_data(7),
      I2 => \cnt_fifo_reg[7]\,
      I3 => \cnt_fifo_reg[6]_7\,
      I4 => \cnt_fifo_reg[7]_0\,
      I5 => \cnt_fifo_reg[5]_7\,
      O => \DataOut_last_reg[7]\
    );
\DataOut[7]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF4F44"
    )
        port map (
      I0 => \cnt_fifo_reg[8]\,
      I1 => \rd_data12[15]_15\(7),
      I2 => \cnt_fifo_reg[6]_0\,
      I3 => \wr_data_reg[0][7]\(7),
      I4 => \cnt_fifo_reg[7]_8\,
      I5 => \cnt_fifo_reg[8]_7\,
      O => \DataOut[7]_i_5_n_0\
    );
\DataOut[8]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \DataOut[8]_i_5_n_0\,
      I1 => o_rd_data(8),
      I2 => \cnt_fifo_reg[7]\,
      I3 => \cnt_fifo_reg[6]_8\,
      I4 => \cnt_fifo_reg[7]_0\,
      I5 => \cnt_fifo_reg[5]_8\,
      O => \DataOut_last_reg[8]\
    );
\DataOut[8]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF4F44"
    )
        port map (
      I0 => \cnt_fifo_reg[8]\,
      I1 => \rd_data12[15]_15\(8),
      I2 => \cnt_fifo_reg[6]_0\,
      I3 => \wr_data_reg[0][7]\(8),
      I4 => \cnt_fifo_reg[7]_9\,
      I5 => \cnt_fifo_reg[8]_8\,
      O => \DataOut[8]_i_5_n_0\
    );
\DataOut[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \DataOut[9]_i_5_n_0\,
      I1 => o_rd_data(9),
      I2 => \cnt_fifo_reg[7]\,
      I3 => \cnt_fifo_reg[6]_9\,
      I4 => \cnt_fifo_reg[7]_0\,
      I5 => \cnt_fifo_reg[5]_9\,
      O => \DataOut_last_reg[9]\
    );
\DataOut[9]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF4F44"
    )
        port map (
      I0 => \cnt_fifo_reg[8]\,
      I1 => \rd_data12[15]_15\(9),
      I2 => \cnt_fifo_reg[6]_0\,
      I3 => \wr_data_reg[0][7]\(9),
      I4 => \cnt_fifo_reg[7]_10\,
      I5 => \cnt_fifo_reg[8]_9\,
      O => \DataOut[9]_i_5_n_0\
    );
\DataOut_stall[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000380000000"
    )
        port map (
      I0 => \rd_data12[15]_15\(0),
      I1 => address(1),
      I2 => address(0),
      I3 => address(3),
      I4 => address(2),
      I5 => \wr_data_reg[0][7]\(0),
      O => \DataOut_stall_reg[0]\
    );
\DataOut_stall[10]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000380000000"
    )
        port map (
      I0 => \rd_data12[15]_15\(10),
      I1 => address(1),
      I2 => address(0),
      I3 => address(3),
      I4 => address(2),
      I5 => \wr_data_reg[0][7]\(10),
      O => \DataOut_stall_reg[10]\
    );
\DataOut_stall[11]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000380000000"
    )
        port map (
      I0 => \rd_data12[15]_15\(11),
      I1 => address(1),
      I2 => address(0),
      I3 => address(3),
      I4 => address(2),
      I5 => \wr_data_reg[0][7]\(11),
      O => \DataOut_stall_reg[11]\
    );
\DataOut_stall[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000380000000"
    )
        port map (
      I0 => \rd_data12[15]_15\(1),
      I1 => address(1),
      I2 => address(0),
      I3 => address(3),
      I4 => address(2),
      I5 => \wr_data_reg[0][7]\(1),
      O => \DataOut_stall_reg[1]\
    );
\DataOut_stall[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000380000000"
    )
        port map (
      I0 => \rd_data12[15]_15\(2),
      I1 => address(1),
      I2 => address(0),
      I3 => address(3),
      I4 => address(2),
      I5 => \wr_data_reg[0][7]\(2),
      O => \DataOut_stall_reg[2]\
    );
\DataOut_stall[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000380000000"
    )
        port map (
      I0 => \rd_data12[15]_15\(3),
      I1 => address(1),
      I2 => address(0),
      I3 => address(3),
      I4 => address(2),
      I5 => \wr_data_reg[0][7]\(3),
      O => \DataOut_stall_reg[3]\
    );
\DataOut_stall[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000380000000"
    )
        port map (
      I0 => \rd_data12[15]_15\(4),
      I1 => address(1),
      I2 => address(0),
      I3 => address(3),
      I4 => address(2),
      I5 => \wr_data_reg[0][7]\(4),
      O => \DataOut_stall_reg[4]\
    );
\DataOut_stall[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000380000000"
    )
        port map (
      I0 => \rd_data12[15]_15\(5),
      I1 => address(1),
      I2 => address(0),
      I3 => address(3),
      I4 => address(2),
      I5 => \wr_data_reg[0][7]\(5),
      O => \DataOut_stall_reg[5]\
    );
\DataOut_stall[6]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000380000000"
    )
        port map (
      I0 => \rd_data12[15]_15\(6),
      I1 => address(1),
      I2 => address(0),
      I3 => address(3),
      I4 => address(2),
      I5 => \wr_data_reg[0][7]\(6),
      O => \DataOut_stall_reg[6]\
    );
\DataOut_stall[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000380000000"
    )
        port map (
      I0 => \rd_data12[15]_15\(7),
      I1 => address(1),
      I2 => address(0),
      I3 => address(3),
      I4 => address(2),
      I5 => \wr_data_reg[0][7]\(7),
      O => \DataOut_stall_reg[7]\
    );
\DataOut_stall[8]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000380000000"
    )
        port map (
      I0 => \rd_data12[15]_15\(8),
      I1 => address(1),
      I2 => address(0),
      I3 => address(3),
      I4 => address(2),
      I5 => \wr_data_reg[0][7]\(8),
      O => \DataOut_stall_reg[8]\
    );
\DataOut_stall[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000380000000"
    )
        port map (
      I0 => \rd_data12[15]_15\(9),
      I1 => address(1),
      I2 => address(0),
      I3 => address(3),
      I4 => address(2),
      I5 => \wr_data_reg[0][7]\(9),
      O => \DataOut_stall_reg[9]\
    );
FIFO_ReadEn_i_11: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => \^r_rd_index_reg[4]_0\,
      I1 => \^q\(0),
      I2 => \r_FIFO_COUNT_reg[0]_0\,
      I3 => \r_FIFO_COUNT_reg[5]_0\(0),
      O => FIFO_ReadEn_reg
    );
\FSM_onehot_fifo_wr_stm[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^r_rd_index_reg[4]_0\,
      O => full(0)
    );
p_0_out_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => p_0_out_carry_n_0,
      CO(2) => p_0_out_carry_n_1,
      CO(1) => p_0_out_carry_n_2,
      CO(0) => p_0_out_carry_n_3,
      CYINIT => r_FIFO_COUNT_reg(0),
      DI(3 downto 1) => r_FIFO_COUNT_reg(3 downto 1),
      DI(0) => \p_0_out_carry_i_1__14_n_0\,
      O(3) => p_0_out_carry_n_4,
      O(2) => p_0_out_carry_n_5,
      O(1) => p_0_out_carry_n_6,
      O(0) => p_0_out_carry_n_7,
      S(3) => \p_0_out_carry_i_2__14_n_0\,
      S(2) => \p_0_out_carry_i_3__14_n_0\,
      S(1) => \p_0_out_carry_i_4__14_n_0\,
      S(0) => \p_0_out_carry_i_5__12_n_0\
    );
\p_0_out_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => p_0_out_carry_n_0,
      CO(3 downto 1) => \NLW_p_0_out_carry__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \p_0_out_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => r_FIFO_COUNT_reg(4),
      O(3 downto 2) => \NLW_p_0_out_carry__0_O_UNCONNECTED\(3 downto 2),
      O(1) => \p_0_out_carry__0_n_6\,
      O(0) => \p_0_out_carry__0_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \p_0_out_carry__0_i_1__14_n_0\,
      S(0) => \p_0_out_carry__0_i_2__14_n_0\
    );
\p_0_out_carry__0_i_1__14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(0),
      I1 => r_FIFO_COUNT_reg(6),
      O => \p_0_out_carry__0_i_1__14_n_0\
    );
\p_0_out_carry__0_i_2__14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(4),
      I1 => \^q\(0),
      O => \p_0_out_carry__0_i_2__14_n_0\
    );
\p_0_out_carry_i_1__14\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      O => \p_0_out_carry_i_1__14_n_0\
    );
\p_0_out_carry_i_2__14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(3),
      I1 => r_FIFO_COUNT_reg(4),
      O => \p_0_out_carry_i_2__14_n_0\
    );
\p_0_out_carry_i_3__14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(2),
      I1 => r_FIFO_COUNT_reg(3),
      O => \p_0_out_carry_i_3__14_n_0\
    );
\p_0_out_carry_i_4__14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => r_FIFO_COUNT_reg(2),
      O => \p_0_out_carry_i_4__14_n_0\
    );
\p_0_out_carry_i_5__12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A6AAAAAA55555555"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => rd_en,
      I2 => \cnt_fifo_reg[5]\,
      I3 => address(2),
      I4 => address(3),
      I5 => wr_en_reg,
      O => \p_0_out_carry_i_5__12_n_0\
    );
\r_FIFO_COUNT[0]_i_1__14\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      O => \r_FIFO_COUNT[0]_i_1__14_n_0\
    );
\r_FIFO_COUNT[6]_i_1__12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => wr_en_reg,
      I1 => address(3),
      I2 => address(2),
      I3 => address(1),
      I4 => address(0),
      I5 => rd_en,
      O => \r_FIFO_COUNT[6]_i_1__12_n_0\
    );
\r_FIFO_COUNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__12_n_0\,
      D => \r_FIFO_COUNT[0]_i_1__14_n_0\,
      Q => r_FIFO_COUNT_reg(0),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__12_n_0\,
      D => p_0_out_carry_n_7,
      Q => r_FIFO_COUNT_reg(1),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__12_n_0\,
      D => p_0_out_carry_n_6,
      Q => r_FIFO_COUNT_reg(2),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__12_n_0\,
      D => p_0_out_carry_n_5,
      Q => r_FIFO_COUNT_reg(3),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__12_n_0\,
      D => p_0_out_carry_n_4,
      Q => r_FIFO_COUNT_reg(4),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__12_n_0\,
      D => \p_0_out_carry__0_n_7\,
      Q => \^q\(0),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__12_n_0\,
      D => \p_0_out_carry__0_n_6\,
      Q => r_FIFO_COUNT_reg(6),
      R => AR(0)
    );
r_FIFO_DATA_reg_0_31_0_5: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => \wr_data_reg[15][11]\(1 downto 0),
      DIB(1 downto 0) => \wr_data_reg[15][11]\(3 downto 2),
      DIC(1 downto 0) => \wr_data_reg[15][11]\(5 downto 4),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => \rd_data12[15]_15\(1 downto 0),
      DOB(1 downto 0) => \rd_data12[15]_15\(3 downto 2),
      DOC(1 downto 0) => \rd_data12[15]_15\(5 downto 4),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
r_FIFO_DATA_reg_0_31_6_11: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => \wr_data_reg[15][11]\(7 downto 6),
      DIB(1 downto 0) => \wr_data_reg[15][11]\(9 downto 8),
      DIC(1 downto 0) => \wr_data_reg[15][11]\(11 downto 10),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => \rd_data12[15]_15\(7 downto 6),
      DOB(1 downto 0) => \rd_data12[15]_15\(9 downto 8),
      DOC(1 downto 0) => \rd_data12[15]_15\(11 downto 10),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
\r_RD_INDEX[0]_i_1__14\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_RD_INDEX(0),
      O => \r_RD_INDEX[0]_i_1__14_n_0\
    );
\r_RD_INDEX[1]_i_1__14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_RD_INDEX(0),
      I1 => r_RD_INDEX(1),
      O => \r_RD_INDEX[1]_i_1__14_n_0\
    );
\r_RD_INDEX[2]_i_1__14\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      O => \r_RD_INDEX[2]_i_1__14_n_0\
    );
\r_RD_INDEX[3]_i_1__12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C00000008000000"
    )
        port map (
      I0 => \^r_rd_index_reg[4]_0\,
      I1 => rd_en,
      I2 => \cnt_fifo_reg[5]\,
      I3 => address(2),
      I4 => address(3),
      I5 => \^q\(0),
      O => r_RD_INDEX0
    );
\r_RD_INDEX[3]_i_2__14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      I3 => r_RD_INDEX(3),
      O => \r_RD_INDEX[3]_i_2__14_n_0\
    );
\r_RD_INDEX[4]_i_1__14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(4),
      I2 => r_RD_INDEX(0),
      I3 => r_RD_INDEX(1),
      I4 => r_RD_INDEX(3),
      O => \r_RD_INDEX[4]_i_1__14_n_0\
    );
\r_RD_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[0]_i_1__14_n_0\,
      Q => r_RD_INDEX(0),
      R => AR(0)
    );
\r_RD_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[1]_i_1__14_n_0\,
      Q => r_RD_INDEX(1),
      R => AR(0)
    );
\r_RD_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[2]_i_1__14_n_0\,
      Q => r_RD_INDEX(2),
      R => AR(0)
    );
\r_RD_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[3]_i_2__14_n_0\,
      Q => r_RD_INDEX(3),
      R => AR(0)
    );
\r_RD_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[4]_i_1__14_n_0\,
      Q => r_RD_INDEX(4),
      R => AR(0)
    );
\r_WR_INDEX[0]_i_1__14\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_WR_INDEX(0),
      O => \r_WR_INDEX[0]_i_1__14_n_0\
    );
\r_WR_INDEX[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_WR_INDEX(0),
      I1 => r_WR_INDEX(1),
      O => \r_WR_INDEX[1]_i_1_n_0\
    );
\r_WR_INDEX[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      O => \r_WR_INDEX[2]_i_1_n_0\
    );
\r_WR_INDEX[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      I3 => r_WR_INDEX(3),
      O => \r_WR_INDEX[3]_i_1_n_0\
    );
\r_WR_INDEX[4]_i_1__14\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => wr_en_reg,
      I1 => \^r_rd_index_reg[4]_0\,
      I2 => \^q\(0),
      O => r_WR_INDEX0
    );
\r_WR_INDEX[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(4),
      I2 => r_WR_INDEX(0),
      I3 => r_WR_INDEX(1),
      I4 => r_WR_INDEX(3),
      O => \r_WR_INDEX[4]_i_2_n_0\
    );
\r_WR_INDEX[4]_i_3__14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      I1 => r_FIFO_COUNT_reg(6),
      I2 => r_FIFO_COUNT_reg(4),
      I3 => r_FIFO_COUNT_reg(3),
      I4 => r_FIFO_COUNT_reg(1),
      I5 => r_FIFO_COUNT_reg(2),
      O => \^r_rd_index_reg[4]_0\
    );
\r_WR_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[0]_i_1__14_n_0\,
      Q => r_WR_INDEX(0),
      R => AR(0)
    );
\r_WR_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[1]_i_1_n_0\,
      Q => r_WR_INDEX(1),
      R => AR(0)
    );
\r_WR_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[2]_i_1_n_0\,
      Q => r_WR_INDEX(2),
      R => AR(0)
    );
\r_WR_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[3]_i_1_n_0\,
      Q => r_WR_INDEX(3),
      R => AR(0)
    );
\r_WR_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[4]_i_2_n_0\,
      Q => r_WR_INDEX(4),
      R => AR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_6 is
  port (
    \DataOut_stall_reg[0]\ : out STD_LOGIC;
    \DataOut_stall_reg[1]\ : out STD_LOGIC;
    \DataOut_stall_reg[2]\ : out STD_LOGIC;
    \DataOut_stall_reg[3]\ : out STD_LOGIC;
    \DataOut_stall_reg[4]\ : out STD_LOGIC;
    \DataOut_stall_reg[5]\ : out STD_LOGIC;
    \DataOut_stall_reg[6]\ : out STD_LOGIC;
    \DataOut_stall_reg[7]\ : out STD_LOGIC;
    \DataOut_stall_reg[8]\ : out STD_LOGIC;
    \DataOut_stall_reg[9]\ : out STD_LOGIC;
    \DataOut_stall_reg[10]\ : out STD_LOGIC;
    \DataOut_stall_reg[11]\ : out STD_LOGIC;
    full : out STD_LOGIC_VECTOR ( 0 to 0 );
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    address : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \cnt_fifo_reg[5]\ : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    wr_en_reg : in STD_LOGIC;
    o_rd_data : in STD_LOGIC_VECTOR ( 11 downto 0 );
    p_0_in : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_6 : entity is "module_fifo_regs_no_flags";
end base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_6;

architecture STRUCTURE of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_6 is
  signal \p_0_out_carry__0_i_1__0_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_i_2__0_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_3\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_6\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_7\ : STD_LOGIC;
  signal \p_0_out_carry_i_1__0_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_2__0_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_3__0_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_4__0_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_5__1_n_0\ : STD_LOGIC;
  signal p_0_out_carry_n_0 : STD_LOGIC;
  signal p_0_out_carry_n_1 : STD_LOGIC;
  signal p_0_out_carry_n_2 : STD_LOGIC;
  signal p_0_out_carry_n_3 : STD_LOGIC;
  signal p_0_out_carry_n_4 : STD_LOGIC;
  signal p_0_out_carry_n_5 : STD_LOGIC;
  signal p_0_out_carry_n_6 : STD_LOGIC;
  signal p_0_out_carry_n_7 : STD_LOGIC;
  signal \r_FIFO_COUNT[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \r_FIFO_COUNT[6]_i_1__1_n_0\ : STD_LOGIC;
  signal r_FIFO_COUNT_reg : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal r_RD_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_RD_INDEX0 : STD_LOGIC;
  signal \r_RD_INDEX[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[3]_i_2__0_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[4]_i_1__0_n_0\ : STD_LOGIC;
  signal r_WR_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_WR_INDEX0 : STD_LOGIC;
  signal \r_WR_INDEX[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[1]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[2]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[3]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_2_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_3__0_n_0\ : STD_LOGIC;
  signal \rd_data12[1]_1\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \NLW_p_0_out_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_p_0_out_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of p_0_out_carry : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \p_0_out_carry__0\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_0_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_6_11 : label is "";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \r_RD_INDEX[1]_i_1__0\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \r_RD_INDEX[2]_i_1__0\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \r_RD_INDEX[3]_i_2__0\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \r_RD_INDEX[4]_i_1__0\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \r_WR_INDEX[1]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \r_WR_INDEX[2]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \r_WR_INDEX[3]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \r_WR_INDEX[4]_i_2\ : label is "soft_lutpair30";
begin
\DataOut_stall[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000A0000C000"
    )
        port map (
      I0 => \rd_data12[1]_1\(0),
      I1 => o_rd_data(0),
      I2 => address(3),
      I3 => address(2),
      I4 => address(1),
      I5 => address(0),
      O => \DataOut_stall_reg[0]\
    );
\DataOut_stall[10]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000A0000C000"
    )
        port map (
      I0 => \rd_data12[1]_1\(10),
      I1 => o_rd_data(10),
      I2 => address(3),
      I3 => address(2),
      I4 => address(1),
      I5 => address(0),
      O => \DataOut_stall_reg[10]\
    );
\DataOut_stall[11]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000A0000C000"
    )
        port map (
      I0 => \rd_data12[1]_1\(11),
      I1 => o_rd_data(11),
      I2 => address(3),
      I3 => address(2),
      I4 => address(1),
      I5 => address(0),
      O => \DataOut_stall_reg[11]\
    );
\DataOut_stall[1]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000A0000C000"
    )
        port map (
      I0 => \rd_data12[1]_1\(1),
      I1 => o_rd_data(1),
      I2 => address(3),
      I3 => address(2),
      I4 => address(1),
      I5 => address(0),
      O => \DataOut_stall_reg[1]\
    );
\DataOut_stall[2]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000A0000C000"
    )
        port map (
      I0 => \rd_data12[1]_1\(2),
      I1 => o_rd_data(2),
      I2 => address(3),
      I3 => address(2),
      I4 => address(1),
      I5 => address(0),
      O => \DataOut_stall_reg[2]\
    );
\DataOut_stall[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000A0000C000"
    )
        port map (
      I0 => \rd_data12[1]_1\(3),
      I1 => o_rd_data(3),
      I2 => address(3),
      I3 => address(2),
      I4 => address(1),
      I5 => address(0),
      O => \DataOut_stall_reg[3]\
    );
\DataOut_stall[4]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000A0000C000"
    )
        port map (
      I0 => \rd_data12[1]_1\(4),
      I1 => o_rd_data(4),
      I2 => address(3),
      I3 => address(2),
      I4 => address(1),
      I5 => address(0),
      O => \DataOut_stall_reg[4]\
    );
\DataOut_stall[5]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000A0000C000"
    )
        port map (
      I0 => \rd_data12[1]_1\(5),
      I1 => o_rd_data(5),
      I2 => address(3),
      I3 => address(2),
      I4 => address(1),
      I5 => address(0),
      O => \DataOut_stall_reg[5]\
    );
\DataOut_stall[6]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000A0000C000"
    )
        port map (
      I0 => \rd_data12[1]_1\(6),
      I1 => o_rd_data(6),
      I2 => address(3),
      I3 => address(2),
      I4 => address(1),
      I5 => address(0),
      O => \DataOut_stall_reg[6]\
    );
\DataOut_stall[7]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000A0000C000"
    )
        port map (
      I0 => \rd_data12[1]_1\(7),
      I1 => o_rd_data(7),
      I2 => address(3),
      I3 => address(2),
      I4 => address(1),
      I5 => address(0),
      O => \DataOut_stall_reg[7]\
    );
\DataOut_stall[8]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000A0000C000"
    )
        port map (
      I0 => \rd_data12[1]_1\(8),
      I1 => o_rd_data(8),
      I2 => address(3),
      I3 => address(2),
      I4 => address(1),
      I5 => address(0),
      O => \DataOut_stall_reg[8]\
    );
\DataOut_stall[9]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000A0000C000"
    )
        port map (
      I0 => \rd_data12[1]_1\(9),
      I1 => o_rd_data(9),
      I2 => address(3),
      I3 => address(2),
      I4 => address(1),
      I5 => address(0),
      O => \DataOut_stall_reg[9]\
    );
FIFO_ReadEn_i_14: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(5),
      I1 => \r_WR_INDEX[4]_i_3__0_n_0\,
      O => full(0)
    );
p_0_out_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => p_0_out_carry_n_0,
      CO(2) => p_0_out_carry_n_1,
      CO(1) => p_0_out_carry_n_2,
      CO(0) => p_0_out_carry_n_3,
      CYINIT => r_FIFO_COUNT_reg(0),
      DI(3 downto 1) => r_FIFO_COUNT_reg(3 downto 1),
      DI(0) => \p_0_out_carry_i_1__0_n_0\,
      O(3) => p_0_out_carry_n_4,
      O(2) => p_0_out_carry_n_5,
      O(1) => p_0_out_carry_n_6,
      O(0) => p_0_out_carry_n_7,
      S(3) => \p_0_out_carry_i_2__0_n_0\,
      S(2) => \p_0_out_carry_i_3__0_n_0\,
      S(1) => \p_0_out_carry_i_4__0_n_0\,
      S(0) => \p_0_out_carry_i_5__1_n_0\
    );
\p_0_out_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => p_0_out_carry_n_0,
      CO(3 downto 1) => \NLW_p_0_out_carry__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \p_0_out_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => r_FIFO_COUNT_reg(4),
      O(3 downto 2) => \NLW_p_0_out_carry__0_O_UNCONNECTED\(3 downto 2),
      O(1) => \p_0_out_carry__0_n_6\,
      O(0) => \p_0_out_carry__0_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \p_0_out_carry__0_i_1__0_n_0\,
      S(0) => \p_0_out_carry__0_i_2__0_n_0\
    );
\p_0_out_carry__0_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(5),
      I1 => r_FIFO_COUNT_reg(6),
      O => \p_0_out_carry__0_i_1__0_n_0\
    );
\p_0_out_carry__0_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(4),
      I1 => r_FIFO_COUNT_reg(5),
      O => \p_0_out_carry__0_i_2__0_n_0\
    );
\p_0_out_carry_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      O => \p_0_out_carry_i_1__0_n_0\
    );
\p_0_out_carry_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(3),
      I1 => r_FIFO_COUNT_reg(4),
      O => \p_0_out_carry_i_2__0_n_0\
    );
\p_0_out_carry_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(2),
      I1 => r_FIFO_COUNT_reg(3),
      O => \p_0_out_carry_i_3__0_n_0\
    );
\p_0_out_carry_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => r_FIFO_COUNT_reg(2),
      O => \p_0_out_carry_i_4__0_n_0\
    );
\p_0_out_carry_i_5__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A9AAAAAA55555555"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => address(2),
      I2 => address(3),
      I3 => \cnt_fifo_reg[5]\,
      I4 => rd_en,
      I5 => wr_en_reg,
      O => \p_0_out_carry_i_5__1_n_0\
    );
\r_FIFO_COUNT[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      O => \r_FIFO_COUNT[0]_i_1__0_n_0\
    );
\r_FIFO_COUNT[6]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAA6AA"
    )
        port map (
      I0 => wr_en_reg,
      I1 => rd_en,
      I2 => address(1),
      I3 => address(0),
      I4 => address(3),
      I5 => address(2),
      O => \r_FIFO_COUNT[6]_i_1__1_n_0\
    );
\r_FIFO_COUNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__1_n_0\,
      D => \r_FIFO_COUNT[0]_i_1__0_n_0\,
      Q => r_FIFO_COUNT_reg(0),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__1_n_0\,
      D => p_0_out_carry_n_7,
      Q => r_FIFO_COUNT_reg(1),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__1_n_0\,
      D => p_0_out_carry_n_6,
      Q => r_FIFO_COUNT_reg(2),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__1_n_0\,
      D => p_0_out_carry_n_5,
      Q => r_FIFO_COUNT_reg(3),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__1_n_0\,
      D => p_0_out_carry_n_4,
      Q => r_FIFO_COUNT_reg(4),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__1_n_0\,
      D => \p_0_out_carry__0_n_7\,
      Q => r_FIFO_COUNT_reg(5),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__1_n_0\,
      D => \p_0_out_carry__0_n_6\,
      Q => r_FIFO_COUNT_reg(6),
      R => AR(0)
    );
r_FIFO_DATA_reg_0_31_0_5: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => Q(1 downto 0),
      DIB(1 downto 0) => Q(3 downto 2),
      DIC(1 downto 0) => Q(5 downto 4),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => \rd_data12[1]_1\(1 downto 0),
      DOB(1 downto 0) => \rd_data12[1]_1\(3 downto 2),
      DOC(1 downto 0) => \rd_data12[1]_1\(5 downto 4),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
r_FIFO_DATA_reg_0_31_6_11: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => Q(7 downto 6),
      DIB(1 downto 0) => Q(9 downto 8),
      DIC(1 downto 0) => Q(11 downto 10),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => \rd_data12[1]_1\(7 downto 6),
      DOB(1 downto 0) => \rd_data12[1]_1\(9 downto 8),
      DOC(1 downto 0) => \rd_data12[1]_1\(11 downto 10),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
\r_RD_INDEX[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_RD_INDEX(0),
      O => \r_RD_INDEX[0]_i_1__0_n_0\
    );
\r_RD_INDEX[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_RD_INDEX(0),
      I1 => r_RD_INDEX(1),
      O => \r_RD_INDEX[1]_i_1__0_n_0\
    );
\r_RD_INDEX[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      O => \r_RD_INDEX[2]_i_1__0_n_0\
    );
\r_RD_INDEX[3]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0300000002000000"
    )
        port map (
      I0 => \r_WR_INDEX[4]_i_3__0_n_0\,
      I1 => address(2),
      I2 => address(3),
      I3 => \cnt_fifo_reg[5]\,
      I4 => rd_en,
      I5 => r_FIFO_COUNT_reg(5),
      O => r_RD_INDEX0
    );
\r_RD_INDEX[3]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      I3 => r_RD_INDEX(3),
      O => \r_RD_INDEX[3]_i_2__0_n_0\
    );
\r_RD_INDEX[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(4),
      I2 => r_RD_INDEX(0),
      I3 => r_RD_INDEX(1),
      I4 => r_RD_INDEX(3),
      O => \r_RD_INDEX[4]_i_1__0_n_0\
    );
\r_RD_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[0]_i_1__0_n_0\,
      Q => r_RD_INDEX(0),
      R => AR(0)
    );
\r_RD_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[1]_i_1__0_n_0\,
      Q => r_RD_INDEX(1),
      R => AR(0)
    );
\r_RD_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[2]_i_1__0_n_0\,
      Q => r_RD_INDEX(2),
      R => AR(0)
    );
\r_RD_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[3]_i_2__0_n_0\,
      Q => r_RD_INDEX(3),
      R => AR(0)
    );
\r_RD_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[4]_i_1__0_n_0\,
      Q => r_RD_INDEX(4),
      R => AR(0)
    );
\r_WR_INDEX[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_WR_INDEX(0),
      O => \r_WR_INDEX[0]_i_1__0_n_0\
    );
\r_WR_INDEX[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_WR_INDEX(0),
      I1 => r_WR_INDEX(1),
      O => \r_WR_INDEX[1]_i_1_n_0\
    );
\r_WR_INDEX[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      O => \r_WR_INDEX[2]_i_1_n_0\
    );
\r_WR_INDEX[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      I3 => r_WR_INDEX(3),
      O => \r_WR_INDEX[3]_i_1_n_0\
    );
\r_WR_INDEX[4]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => wr_en_reg,
      I1 => \r_WR_INDEX[4]_i_3__0_n_0\,
      I2 => r_FIFO_COUNT_reg(5),
      O => r_WR_INDEX0
    );
\r_WR_INDEX[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(4),
      I2 => r_WR_INDEX(0),
      I3 => r_WR_INDEX(1),
      I4 => r_WR_INDEX(3),
      O => \r_WR_INDEX[4]_i_2_n_0\
    );
\r_WR_INDEX[4]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      I1 => r_FIFO_COUNT_reg(6),
      I2 => r_FIFO_COUNT_reg(4),
      I3 => r_FIFO_COUNT_reg(3),
      I4 => r_FIFO_COUNT_reg(1),
      I5 => r_FIFO_COUNT_reg(2),
      O => \r_WR_INDEX[4]_i_3__0_n_0\
    );
\r_WR_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[0]_i_1__0_n_0\,
      Q => r_WR_INDEX(0),
      R => AR(0)
    );
\r_WR_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[1]_i_1_n_0\,
      Q => r_WR_INDEX(1),
      R => AR(0)
    );
\r_WR_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[2]_i_1_n_0\,
      Q => r_WR_INDEX(2),
      R => AR(0)
    );
\r_WR_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[3]_i_1_n_0\,
      Q => r_WR_INDEX(3),
      R => AR(0)
    );
\r_WR_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[4]_i_2_n_0\,
      Q => r_WR_INDEX(4),
      R => AR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_7 is
  port (
    \WDOTime_intl_reg[63]\ : out STD_LOGIC;
    \WDONBR_intl_reg[1]\ : out STD_LOGIC;
    \WDONBR_intl_reg[1]_0\ : out STD_LOGIC;
    \DataOut_stall_reg[0]\ : out STD_LOGIC;
    o_rd_data : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \DataOut_stall_reg[1]\ : out STD_LOGIC;
    \DataOut_stall_reg[2]\ : out STD_LOGIC;
    \DataOut_stall_reg[3]\ : out STD_LOGIC;
    \DataOut_stall_reg[4]\ : out STD_LOGIC;
    \DataOut_stall_reg[5]\ : out STD_LOGIC;
    \DataOut_stall_reg[6]\ : out STD_LOGIC;
    \DataOut_stall_reg[7]\ : out STD_LOGIC;
    \DataOut_stall_reg[8]\ : out STD_LOGIC;
    \DataOut_stall_reg[9]\ : out STD_LOGIC;
    \DataOut_stall_reg[10]\ : out STD_LOGIC;
    \DataOut_stall_reg[11]\ : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    address : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \cnt_fifo_reg[6]\ : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    wr_en_reg : in STD_LOGIC;
    nRST : in STD_LOGIC;
    \FSM_onehot_fifo_wr_stm_reg[6]\ : in STD_LOGIC;
    \r_FIFO_COUNT_reg[5]_0\ : in STD_LOGIC;
    \r_FIFO_COUNT_reg[5]_1\ : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \r_FIFO_COUNT_reg[5]_2\ : in STD_LOGIC;
    \cnt_fifo_reg[5]\ : in STD_LOGIC;
    \cnt_fifo_reg[8]\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_0\ : in STD_LOGIC;
    \cnt_fifo_reg[7]\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_0\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_1\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_1\ : in STD_LOGIC;
    \cnt_fifo_reg[7]_0\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_2\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_3\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_2\ : in STD_LOGIC;
    \cnt_fifo_reg[7]_1\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_4\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_5\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_3\ : in STD_LOGIC;
    \cnt_fifo_reg[7]_2\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_6\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_7\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_4\ : in STD_LOGIC;
    \cnt_fifo_reg[7]_3\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_8\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_9\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_5\ : in STD_LOGIC;
    \cnt_fifo_reg[7]_4\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_10\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_11\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_6\ : in STD_LOGIC;
    \cnt_fifo_reg[7]_5\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_12\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_13\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_7\ : in STD_LOGIC;
    \cnt_fifo_reg[7]_6\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_14\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_15\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_8\ : in STD_LOGIC;
    \cnt_fifo_reg[7]_7\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_16\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_17\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_9\ : in STD_LOGIC;
    \cnt_fifo_reg[7]_8\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_18\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_19\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_10\ : in STD_LOGIC;
    \cnt_fifo_reg[7]_9\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_20\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_21\ : in STD_LOGIC;
    \cnt_fifo_reg[6]_11\ : in STD_LOGIC;
    \cnt_fifo_reg[7]_10\ : in STD_LOGIC;
    \cnt_fifo_reg[8]_22\ : in STD_LOGIC;
    \FSM_onehot_fifo_wr_stm_reg[6]_0\ : in STD_LOGIC;
    \r_FIFO_COUNT_reg[5]_3\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \r_FIFO_COUNT_reg[5]_4\ : in STD_LOGIC;
    \r_FIFO_COUNT_reg[5]_5\ : in STD_LOGIC;
    \r_FIFO_COUNT_reg[5]_6\ : in STD_LOGIC;
    \r_FIFO_COUNT_reg[5]_7\ : in STD_LOGIC;
    p_0_in : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_7 : entity is "module_fifo_regs_no_flags";
end base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_7;

architecture STRUCTURE of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_7 is
  signal \^wdonbr_intl_reg[1]\ : STD_LOGIC;
  signal full : STD_LOGIC_VECTOR ( 2 to 2 );
  signal \^o_rd_data\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \p_0_out_carry__0_i_1__1_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_i_2__1_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_3\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_6\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_7\ : STD_LOGIC;
  signal \p_0_out_carry_i_1__1_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_2__1_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_3__1_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_4__1_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_5__0_n_0\ : STD_LOGIC;
  signal p_0_out_carry_n_0 : STD_LOGIC;
  signal p_0_out_carry_n_1 : STD_LOGIC;
  signal p_0_out_carry_n_2 : STD_LOGIC;
  signal p_0_out_carry_n_3 : STD_LOGIC;
  signal p_0_out_carry_n_4 : STD_LOGIC;
  signal p_0_out_carry_n_5 : STD_LOGIC;
  signal p_0_out_carry_n_6 : STD_LOGIC;
  signal p_0_out_carry_n_7 : STD_LOGIC;
  signal \r_FIFO_COUNT[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \r_FIFO_COUNT[6]_i_1__0_n_0\ : STD_LOGIC;
  signal r_FIFO_COUNT_reg : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal r_RD_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_RD_INDEX0 : STD_LOGIC;
  signal \r_RD_INDEX[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[1]_i_1__1_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[2]_i_1__1_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[3]_i_2__1_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[4]_i_1__1_n_0\ : STD_LOGIC;
  signal r_WR_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_WR_INDEX0 : STD_LOGIC;
  signal \r_WR_INDEX[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[1]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[2]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[3]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_2_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_3__1_n_0\ : STD_LOGIC;
  signal \NLW_p_0_out_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_p_0_out_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of p_0_out_carry : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \p_0_out_carry__0\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_0_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_6_11 : label is "";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \r_RD_INDEX[1]_i_1__1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \r_RD_INDEX[2]_i_1__1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \r_RD_INDEX[3]_i_2__1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \r_RD_INDEX[4]_i_1__1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \r_WR_INDEX[1]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \r_WR_INDEX[2]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \r_WR_INDEX[3]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \r_WR_INDEX[4]_i_2\ : label is "soft_lutpair33";
begin
  \WDONBR_intl_reg[1]\ <= \^wdonbr_intl_reg[1]\;
  o_rd_data(11 downto 0) <= \^o_rd_data\(11 downto 0);
\DataOut_stall[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF8"
    )
        port map (
      I0 => \^o_rd_data\(0),
      I1 => \cnt_fifo_reg[5]\,
      I2 => \cnt_fifo_reg[8]\,
      I3 => \cnt_fifo_reg[6]_0\,
      I4 => \cnt_fifo_reg[7]\,
      I5 => \cnt_fifo_reg[8]_0\,
      O => \DataOut_stall_reg[0]\
    );
\DataOut_stall[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF8"
    )
        port map (
      I0 => \^o_rd_data\(10),
      I1 => \cnt_fifo_reg[5]\,
      I2 => \cnt_fifo_reg[8]_19\,
      I3 => \cnt_fifo_reg[6]_10\,
      I4 => \cnt_fifo_reg[7]_9\,
      I5 => \cnt_fifo_reg[8]_20\,
      O => \DataOut_stall_reg[10]\
    );
\DataOut_stall[11]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF8"
    )
        port map (
      I0 => \^o_rd_data\(11),
      I1 => \cnt_fifo_reg[5]\,
      I2 => \cnt_fifo_reg[8]_21\,
      I3 => \cnt_fifo_reg[6]_11\,
      I4 => \cnt_fifo_reg[7]_10\,
      I5 => \cnt_fifo_reg[8]_22\,
      O => \DataOut_stall_reg[11]\
    );
\DataOut_stall[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF8"
    )
        port map (
      I0 => \^o_rd_data\(1),
      I1 => \cnt_fifo_reg[5]\,
      I2 => \cnt_fifo_reg[8]_1\,
      I3 => \cnt_fifo_reg[6]_1\,
      I4 => \cnt_fifo_reg[7]_0\,
      I5 => \cnt_fifo_reg[8]_2\,
      O => \DataOut_stall_reg[1]\
    );
\DataOut_stall[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF8"
    )
        port map (
      I0 => \^o_rd_data\(2),
      I1 => \cnt_fifo_reg[5]\,
      I2 => \cnt_fifo_reg[8]_3\,
      I3 => \cnt_fifo_reg[6]_2\,
      I4 => \cnt_fifo_reg[7]_1\,
      I5 => \cnt_fifo_reg[8]_4\,
      O => \DataOut_stall_reg[2]\
    );
\DataOut_stall[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF8"
    )
        port map (
      I0 => \^o_rd_data\(3),
      I1 => \cnt_fifo_reg[5]\,
      I2 => \cnt_fifo_reg[8]_5\,
      I3 => \cnt_fifo_reg[6]_3\,
      I4 => \cnt_fifo_reg[7]_2\,
      I5 => \cnt_fifo_reg[8]_6\,
      O => \DataOut_stall_reg[3]\
    );
\DataOut_stall[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF8"
    )
        port map (
      I0 => \^o_rd_data\(4),
      I1 => \cnt_fifo_reg[5]\,
      I2 => \cnt_fifo_reg[8]_7\,
      I3 => \cnt_fifo_reg[6]_4\,
      I4 => \cnt_fifo_reg[7]_3\,
      I5 => \cnt_fifo_reg[8]_8\,
      O => \DataOut_stall_reg[4]\
    );
\DataOut_stall[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF8"
    )
        port map (
      I0 => \^o_rd_data\(5),
      I1 => \cnt_fifo_reg[5]\,
      I2 => \cnt_fifo_reg[8]_9\,
      I3 => \cnt_fifo_reg[6]_5\,
      I4 => \cnt_fifo_reg[7]_4\,
      I5 => \cnt_fifo_reg[8]_10\,
      O => \DataOut_stall_reg[5]\
    );
\DataOut_stall[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF8"
    )
        port map (
      I0 => \^o_rd_data\(6),
      I1 => \cnt_fifo_reg[5]\,
      I2 => \cnt_fifo_reg[8]_11\,
      I3 => \cnt_fifo_reg[6]_6\,
      I4 => \cnt_fifo_reg[7]_5\,
      I5 => \cnt_fifo_reg[8]_12\,
      O => \DataOut_stall_reg[6]\
    );
\DataOut_stall[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF8"
    )
        port map (
      I0 => \^o_rd_data\(7),
      I1 => \cnt_fifo_reg[5]\,
      I2 => \cnt_fifo_reg[8]_13\,
      I3 => \cnt_fifo_reg[6]_7\,
      I4 => \cnt_fifo_reg[7]_6\,
      I5 => \cnt_fifo_reg[8]_14\,
      O => \DataOut_stall_reg[7]\
    );
\DataOut_stall[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF8"
    )
        port map (
      I0 => \^o_rd_data\(8),
      I1 => \cnt_fifo_reg[5]\,
      I2 => \cnt_fifo_reg[8]_15\,
      I3 => \cnt_fifo_reg[6]_8\,
      I4 => \cnt_fifo_reg[7]_7\,
      I5 => \cnt_fifo_reg[8]_16\,
      O => \DataOut_stall_reg[8]\
    );
\DataOut_stall[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF8"
    )
        port map (
      I0 => \^o_rd_data\(9),
      I1 => \cnt_fifo_reg[5]\,
      I2 => \cnt_fifo_reg[8]_17\,
      I3 => \cnt_fifo_reg[6]_9\,
      I4 => \cnt_fifo_reg[7]_8\,
      I5 => \cnt_fifo_reg[8]_18\,
      O => \DataOut_stall_reg[9]\
    );
FIFO_ReadEn_i_12: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(5),
      I1 => \r_WR_INDEX[4]_i_3__1_n_0\,
      O => full(2)
    );
FIFO_ReadEn_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF7FFF"
    )
        port map (
      I0 => full(2),
      I1 => \r_FIFO_COUNT_reg[5]_3\(2),
      I2 => \r_FIFO_COUNT_reg[5]_3\(0),
      I3 => \r_FIFO_COUNT_reg[5]_3\(1),
      I4 => \r_FIFO_COUNT_reg[5]_6\,
      I5 => \r_FIFO_COUNT_reg[5]_7\,
      O => \^wdonbr_intl_reg[1]\
    );
\FSM_onehot_fifo_wr_stm[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8AAA"
    )
        port map (
      I0 => \out\(0),
      I1 => \^wdonbr_intl_reg[1]\,
      I2 => \r_FIFO_COUNT_reg[5]_4\,
      I3 => \r_FIFO_COUNT_reg[5]_5\,
      O => D(0)
    );
\FSM_onehot_fifo_wr_stm[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF40000000"
    )
        port map (
      I0 => \^wdonbr_intl_reg[1]\,
      I1 => \FSM_onehot_fifo_wr_stm_reg[6]_0\,
      I2 => \r_FIFO_COUNT_reg[5]_3\(3),
      I3 => \r_FIFO_COUNT_reg[5]_0\,
      I4 => \r_FIFO_COUNT_reg[5]_1\,
      I5 => \out\(2),
      O => D(1)
    );
\WDOTime_intl[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888888808000000"
    )
        port map (
      I0 => \out\(1),
      I1 => nRST,
      I2 => \^wdonbr_intl_reg[1]\,
      I3 => \r_FIFO_COUNT_reg[5]_2\,
      I4 => \r_FIFO_COUNT_reg[5]_1\,
      I5 => \out\(2),
      O => \WDONBR_intl_reg[1]_0\
    );
\WDOTime_intl[63]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000020000000"
    )
        port map (
      I0 => nRST,
      I1 => \^wdonbr_intl_reg[1]\,
      I2 => \FSM_onehot_fifo_wr_stm_reg[6]\,
      I3 => \r_FIFO_COUNT_reg[5]_0\,
      I4 => \r_FIFO_COUNT_reg[5]_1\,
      I5 => \out\(2),
      O => \WDOTime_intl_reg[63]\
    );
p_0_out_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => p_0_out_carry_n_0,
      CO(2) => p_0_out_carry_n_1,
      CO(1) => p_0_out_carry_n_2,
      CO(0) => p_0_out_carry_n_3,
      CYINIT => r_FIFO_COUNT_reg(0),
      DI(3 downto 1) => r_FIFO_COUNT_reg(3 downto 1),
      DI(0) => \p_0_out_carry_i_1__1_n_0\,
      O(3) => p_0_out_carry_n_4,
      O(2) => p_0_out_carry_n_5,
      O(1) => p_0_out_carry_n_6,
      O(0) => p_0_out_carry_n_7,
      S(3) => \p_0_out_carry_i_2__1_n_0\,
      S(2) => \p_0_out_carry_i_3__1_n_0\,
      S(1) => \p_0_out_carry_i_4__1_n_0\,
      S(0) => \p_0_out_carry_i_5__0_n_0\
    );
\p_0_out_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => p_0_out_carry_n_0,
      CO(3 downto 1) => \NLW_p_0_out_carry__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \p_0_out_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => r_FIFO_COUNT_reg(4),
      O(3 downto 2) => \NLW_p_0_out_carry__0_O_UNCONNECTED\(3 downto 2),
      O(1) => \p_0_out_carry__0_n_6\,
      O(0) => \p_0_out_carry__0_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \p_0_out_carry__0_i_1__1_n_0\,
      S(0) => \p_0_out_carry__0_i_2__1_n_0\
    );
\p_0_out_carry__0_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(5),
      I1 => r_FIFO_COUNT_reg(6),
      O => \p_0_out_carry__0_i_1__1_n_0\
    );
\p_0_out_carry__0_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(4),
      I1 => r_FIFO_COUNT_reg(5),
      O => \p_0_out_carry__0_i_2__1_n_0\
    );
\p_0_out_carry_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      O => \p_0_out_carry_i_1__1_n_0\
    );
\p_0_out_carry_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(3),
      I1 => r_FIFO_COUNT_reg(4),
      O => \p_0_out_carry_i_2__1_n_0\
    );
\p_0_out_carry_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(2),
      I1 => r_FIFO_COUNT_reg(3),
      O => \p_0_out_carry_i_3__1_n_0\
    );
\p_0_out_carry_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => r_FIFO_COUNT_reg(2),
      O => \p_0_out_carry_i_4__1_n_0\
    );
\p_0_out_carry_i_5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A9AAAAAA55555555"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => address(2),
      I2 => address(3),
      I3 => \cnt_fifo_reg[6]\,
      I4 => rd_en,
      I5 => wr_en_reg,
      O => \p_0_out_carry_i_5__0_n_0\
    );
\r_FIFO_COUNT[0]_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      O => \r_FIFO_COUNT[0]_i_1__1_n_0\
    );
\r_FIFO_COUNT[6]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAA6AA"
    )
        port map (
      I0 => wr_en_reg,
      I1 => rd_en,
      I2 => address(0),
      I3 => address(1),
      I4 => address(3),
      I5 => address(2),
      O => \r_FIFO_COUNT[6]_i_1__0_n_0\
    );
\r_FIFO_COUNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__0_n_0\,
      D => \r_FIFO_COUNT[0]_i_1__1_n_0\,
      Q => r_FIFO_COUNT_reg(0),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__0_n_0\,
      D => p_0_out_carry_n_7,
      Q => r_FIFO_COUNT_reg(1),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__0_n_0\,
      D => p_0_out_carry_n_6,
      Q => r_FIFO_COUNT_reg(2),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__0_n_0\,
      D => p_0_out_carry_n_5,
      Q => r_FIFO_COUNT_reg(3),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__0_n_0\,
      D => p_0_out_carry_n_4,
      Q => r_FIFO_COUNT_reg(4),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__0_n_0\,
      D => \p_0_out_carry__0_n_7\,
      Q => r_FIFO_COUNT_reg(5),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__0_n_0\,
      D => \p_0_out_carry__0_n_6\,
      Q => r_FIFO_COUNT_reg(6),
      R => AR(0)
    );
r_FIFO_DATA_reg_0_31_0_5: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => Q(1 downto 0),
      DIB(1 downto 0) => Q(3 downto 2),
      DIC(1 downto 0) => Q(5 downto 4),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => \^o_rd_data\(1 downto 0),
      DOB(1 downto 0) => \^o_rd_data\(3 downto 2),
      DOC(1 downto 0) => \^o_rd_data\(5 downto 4),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
r_FIFO_DATA_reg_0_31_6_11: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => Q(7 downto 6),
      DIB(1 downto 0) => Q(9 downto 8),
      DIC(1 downto 0) => Q(11 downto 10),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => \^o_rd_data\(7 downto 6),
      DOB(1 downto 0) => \^o_rd_data\(9 downto 8),
      DOC(1 downto 0) => \^o_rd_data\(11 downto 10),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
\r_RD_INDEX[0]_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_RD_INDEX(0),
      O => \r_RD_INDEX[0]_i_1__1_n_0\
    );
\r_RD_INDEX[1]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_RD_INDEX(0),
      I1 => r_RD_INDEX(1),
      O => \r_RD_INDEX[1]_i_1__1_n_0\
    );
\r_RD_INDEX[2]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      O => \r_RD_INDEX[2]_i_1__1_n_0\
    );
\r_RD_INDEX[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0300000002000000"
    )
        port map (
      I0 => \r_WR_INDEX[4]_i_3__1_n_0\,
      I1 => address(2),
      I2 => address(3),
      I3 => \cnt_fifo_reg[6]\,
      I4 => rd_en,
      I5 => r_FIFO_COUNT_reg(5),
      O => r_RD_INDEX0
    );
\r_RD_INDEX[3]_i_2__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      I3 => r_RD_INDEX(3),
      O => \r_RD_INDEX[3]_i_2__1_n_0\
    );
\r_RD_INDEX[4]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(4),
      I2 => r_RD_INDEX(0),
      I3 => r_RD_INDEX(1),
      I4 => r_RD_INDEX(3),
      O => \r_RD_INDEX[4]_i_1__1_n_0\
    );
\r_RD_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[0]_i_1__1_n_0\,
      Q => r_RD_INDEX(0),
      R => AR(0)
    );
\r_RD_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[1]_i_1__1_n_0\,
      Q => r_RD_INDEX(1),
      R => AR(0)
    );
\r_RD_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[2]_i_1__1_n_0\,
      Q => r_RD_INDEX(2),
      R => AR(0)
    );
\r_RD_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[3]_i_2__1_n_0\,
      Q => r_RD_INDEX(3),
      R => AR(0)
    );
\r_RD_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[4]_i_1__1_n_0\,
      Q => r_RD_INDEX(4),
      R => AR(0)
    );
\r_WR_INDEX[0]_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_WR_INDEX(0),
      O => \r_WR_INDEX[0]_i_1__1_n_0\
    );
\r_WR_INDEX[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_WR_INDEX(0),
      I1 => r_WR_INDEX(1),
      O => \r_WR_INDEX[1]_i_1_n_0\
    );
\r_WR_INDEX[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      O => \r_WR_INDEX[2]_i_1_n_0\
    );
\r_WR_INDEX[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      I3 => r_WR_INDEX(3),
      O => \r_WR_INDEX[3]_i_1_n_0\
    );
\r_WR_INDEX[4]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => wr_en_reg,
      I1 => \r_WR_INDEX[4]_i_3__1_n_0\,
      I2 => r_FIFO_COUNT_reg(5),
      O => r_WR_INDEX0
    );
\r_WR_INDEX[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(4),
      I2 => r_WR_INDEX(0),
      I3 => r_WR_INDEX(1),
      I4 => r_WR_INDEX(3),
      O => \r_WR_INDEX[4]_i_2_n_0\
    );
\r_WR_INDEX[4]_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      I1 => r_FIFO_COUNT_reg(6),
      I2 => r_FIFO_COUNT_reg(4),
      I3 => r_FIFO_COUNT_reg(3),
      I4 => r_FIFO_COUNT_reg(1),
      I5 => r_FIFO_COUNT_reg(2),
      O => \r_WR_INDEX[4]_i_3__1_n_0\
    );
\r_WR_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[0]_i_1__1_n_0\,
      Q => r_WR_INDEX(0),
      R => AR(0)
    );
\r_WR_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[1]_i_1_n_0\,
      Q => r_WR_INDEX(1),
      R => AR(0)
    );
\r_WR_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[2]_i_1_n_0\,
      Q => r_WR_INDEX(2),
      R => AR(0)
    );
\r_WR_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[3]_i_1_n_0\,
      Q => r_WR_INDEX(3),
      R => AR(0)
    );
\r_WR_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[4]_i_2_n_0\,
      Q => r_WR_INDEX(4),
      R => AR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_8 is
  port (
    D : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \DataOut_reg[11]\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \DataOut_stall_reg[11]\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \WDONBR_intl_reg[1]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    \cnt_fifo_reg[5]\ : in STD_LOGIC;
    address : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_en : in STD_LOGIC;
    wr_en_reg : in STD_LOGIC;
    \wr_data_reg[9][1]\ : in STD_LOGIC;
    \cnt_fifo_reg[5]_0\ : in STD_LOGIC;
    o_rd_data : in STD_LOGIC_VECTOR ( 11 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    \DataOut_intlH_reg[11]\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \rdy_state_reg[0]\ : in STD_LOGIC;
    \fifo_rd_stm_reg[2]\ : in STD_LOGIC;
    \wr_data_reg[11][7]\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \wr_data_reg[9][1]_0\ : in STD_LOGIC;
    \rdy_state_reg[0]_0\ : in STD_LOGIC;
    \wr_data_reg[9][1]_1\ : in STD_LOGIC;
    \rdy_state_reg[0]_1\ : in STD_LOGIC;
    \wr_data_reg[9][1]_2\ : in STD_LOGIC;
    \rdy_state_reg[0]_2\ : in STD_LOGIC;
    \wr_data_reg[9][1]_3\ : in STD_LOGIC;
    \rdy_state_reg[0]_3\ : in STD_LOGIC;
    \wr_data_reg[9][1]_4\ : in STD_LOGIC;
    \rdy_state_reg[0]_4\ : in STD_LOGIC;
    \wr_data_reg[9][7]\ : in STD_LOGIC;
    \rdy_state_reg[0]_5\ : in STD_LOGIC;
    \wr_data_reg[9][7]_0\ : in STD_LOGIC;
    \rdy_state_reg[0]_6\ : in STD_LOGIC;
    \wr_data_reg[9][7]_1\ : in STD_LOGIC;
    \rdy_state_reg[0]_7\ : in STD_LOGIC;
    \wr_data_reg[9][7]_2\ : in STD_LOGIC;
    \rdy_state_reg[0]_8\ : in STD_LOGIC;
    \wr_data_reg[9][7]_3\ : in STD_LOGIC;
    \rdy_state_reg[0]_9\ : in STD_LOGIC;
    \wr_data_reg[9][7]_4\ : in STD_LOGIC;
    \rdy_state_reg[0]_10\ : in STD_LOGIC;
    p_0_in : in STD_LOGIC;
    \wr_data_reg[3][11]\ : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_8 : entity is "module_fifo_regs_no_flags";
end base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_8;

architecture STRUCTURE of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_8 is
  signal \DataOut[0]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut[10]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut[11]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut[1]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut[2]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut[3]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut[4]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut[5]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut[6]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut[7]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut[8]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut[9]_i_3_n_0\ : STD_LOGIC;
  signal \^dataout_stall_reg[11]\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \p_0_out_carry__0_i_1__2_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_i_2__2_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_3\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_6\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_7\ : STD_LOGIC;
  signal \p_0_out_carry_i_1__2_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_2__2_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_3__2_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_4__2_n_0\ : STD_LOGIC;
  signal p_0_out_carry_i_5_n_0 : STD_LOGIC;
  signal p_0_out_carry_n_0 : STD_LOGIC;
  signal p_0_out_carry_n_1 : STD_LOGIC;
  signal p_0_out_carry_n_2 : STD_LOGIC;
  signal p_0_out_carry_n_3 : STD_LOGIC;
  signal p_0_out_carry_n_4 : STD_LOGIC;
  signal p_0_out_carry_n_5 : STD_LOGIC;
  signal p_0_out_carry_n_6 : STD_LOGIC;
  signal p_0_out_carry_n_7 : STD_LOGIC;
  signal \r_FIFO_COUNT[0]_i_1__2_n_0\ : STD_LOGIC;
  signal \r_FIFO_COUNT[6]_i_1_n_0\ : STD_LOGIC;
  signal r_FIFO_COUNT_reg : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal r_RD_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_RD_INDEX0 : STD_LOGIC;
  signal \r_RD_INDEX[0]_i_1__2_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[1]_i_1__2_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[2]_i_1__2_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[3]_i_2__2_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[4]_i_1__2_n_0\ : STD_LOGIC;
  signal r_WR_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_WR_INDEX0 : STD_LOGIC;
  signal \r_WR_INDEX[0]_i_1__2_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[1]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[2]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[3]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_2_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_3__2_n_0\ : STD_LOGIC;
  signal \NLW_p_0_out_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_p_0_out_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of p_0_out_carry : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \p_0_out_carry__0\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_0_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_6_11 : label is "";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \r_RD_INDEX[1]_i_1__2\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \r_RD_INDEX[2]_i_1__2\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \r_RD_INDEX[3]_i_2__2\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \r_RD_INDEX[4]_i_1__2\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \r_WR_INDEX[1]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \r_WR_INDEX[2]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \r_WR_INDEX[3]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \r_WR_INDEX[4]_i_2\ : label is "soft_lutpair37";
begin
  \DataOut_stall_reg[11]\(11 downto 0) <= \^dataout_stall_reg[11]\(11 downto 0);
\DataOut[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFEFEAAAAAAAA"
    )
        port map (
      I0 => \rdy_state_reg[0]\,
      I1 => \DataOut[0]_i_3_n_0\,
      I2 => \wr_data_reg[9][1]\,
      I3 => \cnt_fifo_reg[5]_0\,
      I4 => o_rd_data(0),
      I5 => \fifo_rd_stm_reg[2]\,
      O => \DataOut_reg[11]\(0)
    );
\DataOut[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C0A000000000000"
    )
        port map (
      I0 => \^dataout_stall_reg[11]\(0),
      I1 => \wr_data_reg[11][7]\(0),
      I2 => address(2),
      I3 => address(3),
      I4 => address(1),
      I5 => address(0),
      O => \DataOut[0]_i_3_n_0\
    );
\DataOut[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFEFEAAAAAAAA"
    )
        port map (
      I0 => \rdy_state_reg[0]_9\,
      I1 => \DataOut[10]_i_3_n_0\,
      I2 => \wr_data_reg[9][7]_3\,
      I3 => \cnt_fifo_reg[5]_0\,
      I4 => o_rd_data(10),
      I5 => \fifo_rd_stm_reg[2]\,
      O => \DataOut_reg[11]\(10)
    );
\DataOut[10]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C0A000000000000"
    )
        port map (
      I0 => \^dataout_stall_reg[11]\(10),
      I1 => \wr_data_reg[11][7]\(10),
      I2 => address(2),
      I3 => address(3),
      I4 => address(1),
      I5 => address(0),
      O => \DataOut[10]_i_3_n_0\
    );
\DataOut[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFEFEAAAAAAAA"
    )
        port map (
      I0 => \rdy_state_reg[0]_10\,
      I1 => \DataOut[11]_i_3_n_0\,
      I2 => \wr_data_reg[9][7]_4\,
      I3 => \cnt_fifo_reg[5]_0\,
      I4 => o_rd_data(11),
      I5 => \fifo_rd_stm_reg[2]\,
      O => \DataOut_reg[11]\(11)
    );
\DataOut[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C0A000000000000"
    )
        port map (
      I0 => \^dataout_stall_reg[11]\(11),
      I1 => \wr_data_reg[11][7]\(11),
      I2 => address(2),
      I3 => address(3),
      I4 => address(1),
      I5 => address(0),
      O => \DataOut[11]_i_3_n_0\
    );
\DataOut[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFEFEAAAAAAAA"
    )
        port map (
      I0 => \rdy_state_reg[0]_0\,
      I1 => \DataOut[1]_i_3_n_0\,
      I2 => \wr_data_reg[9][1]_0\,
      I3 => \cnt_fifo_reg[5]_0\,
      I4 => o_rd_data(1),
      I5 => \fifo_rd_stm_reg[2]\,
      O => \DataOut_reg[11]\(1)
    );
\DataOut[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C0A000000000000"
    )
        port map (
      I0 => \^dataout_stall_reg[11]\(1),
      I1 => \wr_data_reg[11][7]\(1),
      I2 => address(2),
      I3 => address(3),
      I4 => address(1),
      I5 => address(0),
      O => \DataOut[1]_i_3_n_0\
    );
\DataOut[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFEFEAAAAAAAA"
    )
        port map (
      I0 => \rdy_state_reg[0]_1\,
      I1 => \DataOut[2]_i_3_n_0\,
      I2 => \wr_data_reg[9][1]_1\,
      I3 => \cnt_fifo_reg[5]_0\,
      I4 => o_rd_data(2),
      I5 => \fifo_rd_stm_reg[2]\,
      O => \DataOut_reg[11]\(2)
    );
\DataOut[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C0A000000000000"
    )
        port map (
      I0 => \^dataout_stall_reg[11]\(2),
      I1 => \wr_data_reg[11][7]\(2),
      I2 => address(2),
      I3 => address(3),
      I4 => address(1),
      I5 => address(0),
      O => \DataOut[2]_i_3_n_0\
    );
\DataOut[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFEFEAAAAAAAA"
    )
        port map (
      I0 => \rdy_state_reg[0]_2\,
      I1 => \DataOut[3]_i_3_n_0\,
      I2 => \wr_data_reg[9][1]_2\,
      I3 => \cnt_fifo_reg[5]_0\,
      I4 => o_rd_data(3),
      I5 => \fifo_rd_stm_reg[2]\,
      O => \DataOut_reg[11]\(3)
    );
\DataOut[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C0A000000000000"
    )
        port map (
      I0 => \^dataout_stall_reg[11]\(3),
      I1 => \wr_data_reg[11][7]\(3),
      I2 => address(2),
      I3 => address(3),
      I4 => address(1),
      I5 => address(0),
      O => \DataOut[3]_i_3_n_0\
    );
\DataOut[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFEFEAAAAAAAA"
    )
        port map (
      I0 => \rdy_state_reg[0]_3\,
      I1 => \DataOut[4]_i_3_n_0\,
      I2 => \wr_data_reg[9][1]_3\,
      I3 => \cnt_fifo_reg[5]_0\,
      I4 => o_rd_data(4),
      I5 => \fifo_rd_stm_reg[2]\,
      O => \DataOut_reg[11]\(4)
    );
\DataOut[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C0A000000000000"
    )
        port map (
      I0 => \^dataout_stall_reg[11]\(4),
      I1 => \wr_data_reg[11][7]\(4),
      I2 => address(2),
      I3 => address(3),
      I4 => address(1),
      I5 => address(0),
      O => \DataOut[4]_i_3_n_0\
    );
\DataOut[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFEFEAAAAAAAA"
    )
        port map (
      I0 => \rdy_state_reg[0]_4\,
      I1 => \DataOut[5]_i_3_n_0\,
      I2 => \wr_data_reg[9][1]_4\,
      I3 => \cnt_fifo_reg[5]_0\,
      I4 => o_rd_data(5),
      I5 => \fifo_rd_stm_reg[2]\,
      O => \DataOut_reg[11]\(5)
    );
\DataOut[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C0A000000000000"
    )
        port map (
      I0 => \^dataout_stall_reg[11]\(5),
      I1 => \wr_data_reg[11][7]\(5),
      I2 => address(2),
      I3 => address(3),
      I4 => address(1),
      I5 => address(0),
      O => \DataOut[5]_i_3_n_0\
    );
\DataOut[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFEFEAAAAAAAA"
    )
        port map (
      I0 => \rdy_state_reg[0]_5\,
      I1 => \DataOut[6]_i_3_n_0\,
      I2 => \wr_data_reg[9][7]\,
      I3 => \cnt_fifo_reg[5]_0\,
      I4 => o_rd_data(6),
      I5 => \fifo_rd_stm_reg[2]\,
      O => \DataOut_reg[11]\(6)
    );
\DataOut[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C0A000000000000"
    )
        port map (
      I0 => \^dataout_stall_reg[11]\(6),
      I1 => \wr_data_reg[11][7]\(6),
      I2 => address(2),
      I3 => address(3),
      I4 => address(1),
      I5 => address(0),
      O => \DataOut[6]_i_3_n_0\
    );
\DataOut[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFEFEAAAAAAAA"
    )
        port map (
      I0 => \rdy_state_reg[0]_6\,
      I1 => \DataOut[7]_i_3_n_0\,
      I2 => \wr_data_reg[9][7]_0\,
      I3 => \cnt_fifo_reg[5]_0\,
      I4 => o_rd_data(7),
      I5 => \fifo_rd_stm_reg[2]\,
      O => \DataOut_reg[11]\(7)
    );
\DataOut[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C0A000000000000"
    )
        port map (
      I0 => \^dataout_stall_reg[11]\(7),
      I1 => \wr_data_reg[11][7]\(7),
      I2 => address(2),
      I3 => address(3),
      I4 => address(1),
      I5 => address(0),
      O => \DataOut[7]_i_3_n_0\
    );
\DataOut[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFEFEAAAAAAAA"
    )
        port map (
      I0 => \rdy_state_reg[0]_7\,
      I1 => \DataOut[8]_i_3_n_0\,
      I2 => \wr_data_reg[9][7]_1\,
      I3 => \cnt_fifo_reg[5]_0\,
      I4 => o_rd_data(8),
      I5 => \fifo_rd_stm_reg[2]\,
      O => \DataOut_reg[11]\(8)
    );
\DataOut[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C0A000000000000"
    )
        port map (
      I0 => \^dataout_stall_reg[11]\(8),
      I1 => \wr_data_reg[11][7]\(8),
      I2 => address(2),
      I3 => address(3),
      I4 => address(1),
      I5 => address(0),
      O => \DataOut[8]_i_3_n_0\
    );
\DataOut[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFEFEAAAAAAAA"
    )
        port map (
      I0 => \rdy_state_reg[0]_8\,
      I1 => \DataOut[9]_i_3_n_0\,
      I2 => \wr_data_reg[9][7]_2\,
      I3 => \cnt_fifo_reg[5]_0\,
      I4 => o_rd_data(9),
      I5 => \fifo_rd_stm_reg[2]\,
      O => \DataOut_reg[11]\(9)
    );
\DataOut[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C0A000000000000"
    )
        port map (
      I0 => \^dataout_stall_reg[11]\(9),
      I1 => \wr_data_reg[11][7]\(9),
      I2 => address(2),
      I3 => address(3),
      I4 => address(1),
      I5 => address(0),
      O => \DataOut[9]_i_3_n_0\
    );
\DataOut_last[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEEEFFFFFEEE0000"
    )
        port map (
      I0 => \DataOut[0]_i_3_n_0\,
      I1 => \wr_data_reg[9][1]\,
      I2 => \cnt_fifo_reg[5]_0\,
      I3 => o_rd_data(0),
      I4 => Q(0),
      I5 => \DataOut_intlH_reg[11]\(0),
      O => D(0)
    );
\DataOut_last[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEEEFFFFFEEE0000"
    )
        port map (
      I0 => \DataOut[10]_i_3_n_0\,
      I1 => \wr_data_reg[9][7]_3\,
      I2 => \cnt_fifo_reg[5]_0\,
      I3 => o_rd_data(10),
      I4 => Q(0),
      I5 => \DataOut_intlH_reg[11]\(10),
      O => D(10)
    );
\DataOut_last[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEEEFFFFFEEE0000"
    )
        port map (
      I0 => \DataOut[11]_i_3_n_0\,
      I1 => \wr_data_reg[9][7]_4\,
      I2 => \cnt_fifo_reg[5]_0\,
      I3 => o_rd_data(11),
      I4 => Q(0),
      I5 => \DataOut_intlH_reg[11]\(11),
      O => D(11)
    );
\DataOut_last[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEEEFFFFFEEE0000"
    )
        port map (
      I0 => \DataOut[1]_i_3_n_0\,
      I1 => \wr_data_reg[9][1]_0\,
      I2 => \cnt_fifo_reg[5]_0\,
      I3 => o_rd_data(1),
      I4 => Q(0),
      I5 => \DataOut_intlH_reg[11]\(1),
      O => D(1)
    );
\DataOut_last[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEEEFFFFFEEE0000"
    )
        port map (
      I0 => \DataOut[2]_i_3_n_0\,
      I1 => \wr_data_reg[9][1]_1\,
      I2 => \cnt_fifo_reg[5]_0\,
      I3 => o_rd_data(2),
      I4 => Q(0),
      I5 => \DataOut_intlH_reg[11]\(2),
      O => D(2)
    );
\DataOut_last[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEEEFFFFFEEE0000"
    )
        port map (
      I0 => \DataOut[3]_i_3_n_0\,
      I1 => \wr_data_reg[9][1]_2\,
      I2 => \cnt_fifo_reg[5]_0\,
      I3 => o_rd_data(3),
      I4 => Q(0),
      I5 => \DataOut_intlH_reg[11]\(3),
      O => D(3)
    );
\DataOut_last[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEEEFFFFFEEE0000"
    )
        port map (
      I0 => \DataOut[4]_i_3_n_0\,
      I1 => \wr_data_reg[9][1]_3\,
      I2 => \cnt_fifo_reg[5]_0\,
      I3 => o_rd_data(4),
      I4 => Q(0),
      I5 => \DataOut_intlH_reg[11]\(4),
      O => D(4)
    );
\DataOut_last[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEEEFFFFFEEE0000"
    )
        port map (
      I0 => \DataOut[5]_i_3_n_0\,
      I1 => \wr_data_reg[9][1]_4\,
      I2 => \cnt_fifo_reg[5]_0\,
      I3 => o_rd_data(5),
      I4 => Q(0),
      I5 => \DataOut_intlH_reg[11]\(5),
      O => D(5)
    );
\DataOut_last[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEEEFFFFFEEE0000"
    )
        port map (
      I0 => \DataOut[6]_i_3_n_0\,
      I1 => \wr_data_reg[9][7]\,
      I2 => \cnt_fifo_reg[5]_0\,
      I3 => o_rd_data(6),
      I4 => Q(0),
      I5 => \DataOut_intlH_reg[11]\(6),
      O => D(6)
    );
\DataOut_last[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEEEFFFFFEEE0000"
    )
        port map (
      I0 => \DataOut[7]_i_3_n_0\,
      I1 => \wr_data_reg[9][7]_0\,
      I2 => \cnt_fifo_reg[5]_0\,
      I3 => o_rd_data(7),
      I4 => Q(0),
      I5 => \DataOut_intlH_reg[11]\(7),
      O => D(7)
    );
\DataOut_last[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEEEFFFFFEEE0000"
    )
        port map (
      I0 => \DataOut[8]_i_3_n_0\,
      I1 => \wr_data_reg[9][7]_1\,
      I2 => \cnt_fifo_reg[5]_0\,
      I3 => o_rd_data(8),
      I4 => Q(0),
      I5 => \DataOut_intlH_reg[11]\(8),
      O => D(8)
    );
\DataOut_last[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEEEFFFFFEEE0000"
    )
        port map (
      I0 => \DataOut[9]_i_3_n_0\,
      I1 => \wr_data_reg[9][7]_2\,
      I2 => \cnt_fifo_reg[5]_0\,
      I3 => o_rd_data(9),
      I4 => Q(0),
      I5 => \DataOut_intlH_reg[11]\(9),
      O => D(9)
    );
FIFO_ReadEn_i_15: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(5),
      I1 => \r_WR_INDEX[4]_i_3__2_n_0\,
      O => \WDONBR_intl_reg[1]\(0)
    );
p_0_out_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => p_0_out_carry_n_0,
      CO(2) => p_0_out_carry_n_1,
      CO(1) => p_0_out_carry_n_2,
      CO(0) => p_0_out_carry_n_3,
      CYINIT => r_FIFO_COUNT_reg(0),
      DI(3 downto 1) => r_FIFO_COUNT_reg(3 downto 1),
      DI(0) => \p_0_out_carry_i_1__2_n_0\,
      O(3) => p_0_out_carry_n_4,
      O(2) => p_0_out_carry_n_5,
      O(1) => p_0_out_carry_n_6,
      O(0) => p_0_out_carry_n_7,
      S(3) => \p_0_out_carry_i_2__2_n_0\,
      S(2) => \p_0_out_carry_i_3__2_n_0\,
      S(1) => \p_0_out_carry_i_4__2_n_0\,
      S(0) => p_0_out_carry_i_5_n_0
    );
\p_0_out_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => p_0_out_carry_n_0,
      CO(3 downto 1) => \NLW_p_0_out_carry__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \p_0_out_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => r_FIFO_COUNT_reg(4),
      O(3 downto 2) => \NLW_p_0_out_carry__0_O_UNCONNECTED\(3 downto 2),
      O(1) => \p_0_out_carry__0_n_6\,
      O(0) => \p_0_out_carry__0_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \p_0_out_carry__0_i_1__2_n_0\,
      S(0) => \p_0_out_carry__0_i_2__2_n_0\
    );
\p_0_out_carry__0_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(5),
      I1 => r_FIFO_COUNT_reg(6),
      O => \p_0_out_carry__0_i_1__2_n_0\
    );
\p_0_out_carry__0_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(4),
      I1 => r_FIFO_COUNT_reg(5),
      O => \p_0_out_carry__0_i_2__2_n_0\
    );
\p_0_out_carry_i_1__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      O => \p_0_out_carry_i_1__2_n_0\
    );
\p_0_out_carry_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(3),
      I1 => r_FIFO_COUNT_reg(4),
      O => \p_0_out_carry_i_2__2_n_0\
    );
\p_0_out_carry_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(2),
      I1 => r_FIFO_COUNT_reg(3),
      O => \p_0_out_carry_i_3__2_n_0\
    );
\p_0_out_carry_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => r_FIFO_COUNT_reg(2),
      O => \p_0_out_carry_i_4__2_n_0\
    );
p_0_out_carry_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA9AAAA55555555"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => \cnt_fifo_reg[5]\,
      I2 => address(2),
      I3 => address(3),
      I4 => rd_en,
      I5 => wr_en_reg,
      O => p_0_out_carry_i_5_n_0
    );
\r_FIFO_COUNT[0]_i_1__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      O => \r_FIFO_COUNT[0]_i_1__2_n_0\
    );
\r_FIFO_COUNT[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA6AAAAAAAAAAAA"
    )
        port map (
      I0 => wr_en_reg,
      I1 => rd_en,
      I2 => address(3),
      I3 => address(2),
      I4 => address(1),
      I5 => address(0),
      O => \r_FIFO_COUNT[6]_i_1_n_0\
    );
\r_FIFO_COUNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1_n_0\,
      D => \r_FIFO_COUNT[0]_i_1__2_n_0\,
      Q => r_FIFO_COUNT_reg(0),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1_n_0\,
      D => p_0_out_carry_n_7,
      Q => r_FIFO_COUNT_reg(1),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1_n_0\,
      D => p_0_out_carry_n_6,
      Q => r_FIFO_COUNT_reg(2),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1_n_0\,
      D => p_0_out_carry_n_5,
      Q => r_FIFO_COUNT_reg(3),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1_n_0\,
      D => p_0_out_carry_n_4,
      Q => r_FIFO_COUNT_reg(4),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1_n_0\,
      D => \p_0_out_carry__0_n_7\,
      Q => r_FIFO_COUNT_reg(5),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1_n_0\,
      D => \p_0_out_carry__0_n_6\,
      Q => r_FIFO_COUNT_reg(6),
      R => AR(0)
    );
r_FIFO_DATA_reg_0_31_0_5: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => \wr_data_reg[3][11]\(1 downto 0),
      DIB(1 downto 0) => \wr_data_reg[3][11]\(3 downto 2),
      DIC(1 downto 0) => \wr_data_reg[3][11]\(5 downto 4),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => \^dataout_stall_reg[11]\(1 downto 0),
      DOB(1 downto 0) => \^dataout_stall_reg[11]\(3 downto 2),
      DOC(1 downto 0) => \^dataout_stall_reg[11]\(5 downto 4),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
r_FIFO_DATA_reg_0_31_6_11: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => \wr_data_reg[3][11]\(7 downto 6),
      DIB(1 downto 0) => \wr_data_reg[3][11]\(9 downto 8),
      DIC(1 downto 0) => \wr_data_reg[3][11]\(11 downto 10),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => \^dataout_stall_reg[11]\(7 downto 6),
      DOB(1 downto 0) => \^dataout_stall_reg[11]\(9 downto 8),
      DOC(1 downto 0) => \^dataout_stall_reg[11]\(11 downto 10),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
\r_RD_INDEX[0]_i_1__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_RD_INDEX(0),
      O => \r_RD_INDEX[0]_i_1__2_n_0\
    );
\r_RD_INDEX[1]_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_RD_INDEX(0),
      I1 => r_RD_INDEX(1),
      O => \r_RD_INDEX[1]_i_1__2_n_0\
    );
\r_RD_INDEX[2]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      O => \r_RD_INDEX[2]_i_1__2_n_0\
    );
\r_RD_INDEX[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0003000000020000"
    )
        port map (
      I0 => \r_WR_INDEX[4]_i_3__2_n_0\,
      I1 => \cnt_fifo_reg[5]\,
      I2 => address(2),
      I3 => address(3),
      I4 => rd_en,
      I5 => r_FIFO_COUNT_reg(5),
      O => r_RD_INDEX0
    );
\r_RD_INDEX[3]_i_2__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      I3 => r_RD_INDEX(3),
      O => \r_RD_INDEX[3]_i_2__2_n_0\
    );
\r_RD_INDEX[4]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(4),
      I2 => r_RD_INDEX(0),
      I3 => r_RD_INDEX(1),
      I4 => r_RD_INDEX(3),
      O => \r_RD_INDEX[4]_i_1__2_n_0\
    );
\r_RD_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[0]_i_1__2_n_0\,
      Q => r_RD_INDEX(0),
      R => AR(0)
    );
\r_RD_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[1]_i_1__2_n_0\,
      Q => r_RD_INDEX(1),
      R => AR(0)
    );
\r_RD_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[2]_i_1__2_n_0\,
      Q => r_RD_INDEX(2),
      R => AR(0)
    );
\r_RD_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[3]_i_2__2_n_0\,
      Q => r_RD_INDEX(3),
      R => AR(0)
    );
\r_RD_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[4]_i_1__2_n_0\,
      Q => r_RD_INDEX(4),
      R => AR(0)
    );
\r_WR_INDEX[0]_i_1__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_WR_INDEX(0),
      O => \r_WR_INDEX[0]_i_1__2_n_0\
    );
\r_WR_INDEX[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_WR_INDEX(0),
      I1 => r_WR_INDEX(1),
      O => \r_WR_INDEX[1]_i_1_n_0\
    );
\r_WR_INDEX[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      O => \r_WR_INDEX[2]_i_1_n_0\
    );
\r_WR_INDEX[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      I3 => r_WR_INDEX(3),
      O => \r_WR_INDEX[3]_i_1_n_0\
    );
\r_WR_INDEX[4]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => wr_en_reg,
      I1 => \r_WR_INDEX[4]_i_3__2_n_0\,
      I2 => r_FIFO_COUNT_reg(5),
      O => r_WR_INDEX0
    );
\r_WR_INDEX[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(4),
      I2 => r_WR_INDEX(0),
      I3 => r_WR_INDEX(1),
      I4 => r_WR_INDEX(3),
      O => \r_WR_INDEX[4]_i_2_n_0\
    );
\r_WR_INDEX[4]_i_3__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      I1 => r_FIFO_COUNT_reg(6),
      I2 => r_FIFO_COUNT_reg(4),
      I3 => r_FIFO_COUNT_reg(3),
      I4 => r_FIFO_COUNT_reg(1),
      I5 => r_FIFO_COUNT_reg(2),
      O => \r_WR_INDEX[4]_i_3__2_n_0\
    );
\r_WR_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[0]_i_1__2_n_0\,
      Q => r_WR_INDEX(0),
      R => AR(0)
    );
\r_WR_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[1]_i_1_n_0\,
      Q => r_WR_INDEX(1),
      R => AR(0)
    );
\r_WR_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[2]_i_1_n_0\,
      Q => r_WR_INDEX(2),
      R => AR(0)
    );
\r_WR_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[3]_i_1_n_0\,
      Q => r_WR_INDEX(3),
      R => AR(0)
    );
\r_WR_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[4]_i_2_n_0\,
      Q => r_WR_INDEX(4),
      R => AR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_9 is
  port (
    \r_RD_INDEX_reg[4]_0\ : out STD_LOGIC;
    \WDONBR_intl_reg[1]\ : out STD_LOGIC;
    o_rd_data : out STD_LOGIC_VECTOR ( 11 downto 0 );
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    address : in STD_LOGIC_VECTOR ( 3 downto 0 );
    wr_en_reg : in STD_LOGIC;
    \r_FIFO_COUNT_reg[0]_0\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    p_0_in : in STD_LOGIC;
    \wr_data_reg[4][11]\ : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_9 : entity is "module_fifo_regs_no_flags";
end base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_9;

architecture STRUCTURE of base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_9 is
  signal \p_0_out_carry__0_i_1__3_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_i_2__3_n_0\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_3\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_6\ : STD_LOGIC;
  signal \p_0_out_carry__0_n_7\ : STD_LOGIC;
  signal \p_0_out_carry_i_1__3_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_2__3_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_3__3_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_4__3_n_0\ : STD_LOGIC;
  signal \p_0_out_carry_i_5__5_n_0\ : STD_LOGIC;
  signal p_0_out_carry_n_0 : STD_LOGIC;
  signal p_0_out_carry_n_1 : STD_LOGIC;
  signal p_0_out_carry_n_2 : STD_LOGIC;
  signal p_0_out_carry_n_3 : STD_LOGIC;
  signal p_0_out_carry_n_4 : STD_LOGIC;
  signal p_0_out_carry_n_5 : STD_LOGIC;
  signal p_0_out_carry_n_6 : STD_LOGIC;
  signal p_0_out_carry_n_7 : STD_LOGIC;
  signal \r_FIFO_COUNT[0]_i_1__3_n_0\ : STD_LOGIC;
  signal \r_FIFO_COUNT[6]_i_1__5_n_0\ : STD_LOGIC;
  signal r_FIFO_COUNT_reg : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal r_RD_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_RD_INDEX0 : STD_LOGIC;
  signal \r_RD_INDEX[0]_i_1__3_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[1]_i_1__3_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[2]_i_1__3_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[3]_i_2__3_n_0\ : STD_LOGIC;
  signal \r_RD_INDEX[4]_i_1__3_n_0\ : STD_LOGIC;
  signal \^r_rd_index_reg[4]_0\ : STD_LOGIC;
  signal r_WR_INDEX : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r_WR_INDEX0 : STD_LOGIC;
  signal \r_WR_INDEX[0]_i_1__3_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[1]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[2]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[3]_i_1_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_2_n_0\ : STD_LOGIC;
  signal \r_WR_INDEX[4]_i_3__3_n_0\ : STD_LOGIC;
  signal \NLW_p_0_out_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_p_0_out_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of p_0_out_carry : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \p_0_out_carry__0\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_0_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of r_FIFO_DATA_reg_0_31_6_11 : label is "";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \r_RD_INDEX[1]_i_1__3\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \r_RD_INDEX[2]_i_1__3\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \r_RD_INDEX[3]_i_2__3\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \r_RD_INDEX[4]_i_1__3\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \r_WR_INDEX[1]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \r_WR_INDEX[2]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \r_WR_INDEX[3]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \r_WR_INDEX[4]_i_2\ : label is "soft_lutpair42";
begin
  \r_RD_INDEX_reg[4]_0\ <= \^r_rd_index_reg[4]_0\;
FIFO_ReadEn_i_17: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FBFF"
    )
        port map (
      I0 => \r_WR_INDEX[4]_i_3__3_n_0\,
      I1 => r_FIFO_COUNT_reg(5),
      I2 => \r_FIFO_COUNT_reg[0]_0\,
      I3 => Q(0),
      O => \WDONBR_intl_reg[1]\
    );
p_0_out_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => p_0_out_carry_n_0,
      CO(2) => p_0_out_carry_n_1,
      CO(1) => p_0_out_carry_n_2,
      CO(0) => p_0_out_carry_n_3,
      CYINIT => r_FIFO_COUNT_reg(0),
      DI(3 downto 1) => r_FIFO_COUNT_reg(3 downto 1),
      DI(0) => \p_0_out_carry_i_1__3_n_0\,
      O(3) => p_0_out_carry_n_4,
      O(2) => p_0_out_carry_n_5,
      O(1) => p_0_out_carry_n_6,
      O(0) => p_0_out_carry_n_7,
      S(3) => \p_0_out_carry_i_2__3_n_0\,
      S(2) => \p_0_out_carry_i_3__3_n_0\,
      S(1) => \p_0_out_carry_i_4__3_n_0\,
      S(0) => \p_0_out_carry_i_5__5_n_0\
    );
\p_0_out_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => p_0_out_carry_n_0,
      CO(3 downto 1) => \NLW_p_0_out_carry__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \p_0_out_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => r_FIFO_COUNT_reg(4),
      O(3 downto 2) => \NLW_p_0_out_carry__0_O_UNCONNECTED\(3 downto 2),
      O(1) => \p_0_out_carry__0_n_6\,
      O(0) => \p_0_out_carry__0_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \p_0_out_carry__0_i_1__3_n_0\,
      S(0) => \p_0_out_carry__0_i_2__3_n_0\
    );
\p_0_out_carry__0_i_1__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(5),
      I1 => r_FIFO_COUNT_reg(6),
      O => \p_0_out_carry__0_i_1__3_n_0\
    );
\p_0_out_carry__0_i_2__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(4),
      I1 => r_FIFO_COUNT_reg(5),
      O => \p_0_out_carry__0_i_2__3_n_0\
    );
\p_0_out_carry_i_1__3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      O => \p_0_out_carry_i_1__3_n_0\
    );
\p_0_out_carry_i_2__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(3),
      I1 => r_FIFO_COUNT_reg(4),
      O => \p_0_out_carry_i_2__3_n_0\
    );
\p_0_out_carry_i_3__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(2),
      I1 => r_FIFO_COUNT_reg(3),
      O => \p_0_out_carry_i_3__3_n_0\
    );
\p_0_out_carry_i_4__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => r_FIFO_COUNT_reg(2),
      O => \p_0_out_carry_i_4__3_n_0\
    );
\p_0_out_carry_i_5__5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAA6A55555555"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(1),
      I1 => rd_en,
      I2 => address(2),
      I3 => address(3),
      I4 => \^r_rd_index_reg[4]_0\,
      I5 => wr_en_reg,
      O => \p_0_out_carry_i_5__5_n_0\
    );
p_0_out_carry_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => address(0),
      I1 => address(1),
      O => \^r_rd_index_reg[4]_0\
    );
\r_FIFO_COUNT[0]_i_1__3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      O => \r_FIFO_COUNT[0]_i_1__3_n_0\
    );
\r_FIFO_COUNT[6]_i_1__5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA9AAAAAAAAAAAA"
    )
        port map (
      I0 => wr_en_reg,
      I1 => address(0),
      I2 => address(1),
      I3 => address(3),
      I4 => address(2),
      I5 => rd_en,
      O => \r_FIFO_COUNT[6]_i_1__5_n_0\
    );
\r_FIFO_COUNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__5_n_0\,
      D => \r_FIFO_COUNT[0]_i_1__3_n_0\,
      Q => r_FIFO_COUNT_reg(0),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__5_n_0\,
      D => p_0_out_carry_n_7,
      Q => r_FIFO_COUNT_reg(1),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__5_n_0\,
      D => p_0_out_carry_n_6,
      Q => r_FIFO_COUNT_reg(2),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__5_n_0\,
      D => p_0_out_carry_n_5,
      Q => r_FIFO_COUNT_reg(3),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__5_n_0\,
      D => p_0_out_carry_n_4,
      Q => r_FIFO_COUNT_reg(4),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__5_n_0\,
      D => \p_0_out_carry__0_n_7\,
      Q => r_FIFO_COUNT_reg(5),
      R => AR(0)
    );
\r_FIFO_COUNT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \r_FIFO_COUNT[6]_i_1__5_n_0\,
      D => \p_0_out_carry__0_n_6\,
      Q => r_FIFO_COUNT_reg(6),
      R => AR(0)
    );
r_FIFO_DATA_reg_0_31_0_5: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => \wr_data_reg[4][11]\(1 downto 0),
      DIB(1 downto 0) => \wr_data_reg[4][11]\(3 downto 2),
      DIC(1 downto 0) => \wr_data_reg[4][11]\(5 downto 4),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => o_rd_data(1 downto 0),
      DOB(1 downto 0) => o_rd_data(3 downto 2),
      DOC(1 downto 0) => o_rd_data(5 downto 4),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_0_5_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
r_FIFO_DATA_reg_0_31_6_11: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRB(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRC(4 downto 0) => r_RD_INDEX(4 downto 0),
      ADDRD(4 downto 0) => r_WR_INDEX(4 downto 0),
      DIA(1 downto 0) => \wr_data_reg[4][11]\(7 downto 6),
      DIB(1 downto 0) => \wr_data_reg[4][11]\(9 downto 8),
      DIC(1 downto 0) => \wr_data_reg[4][11]\(11 downto 10),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => o_rd_data(7 downto 6),
      DOB(1 downto 0) => o_rd_data(9 downto 8),
      DOC(1 downto 0) => o_rd_data(11 downto 10),
      DOD(1 downto 0) => NLW_r_FIFO_DATA_reg_0_31_6_11_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK,
      WE => p_0_in
    );
\r_RD_INDEX[0]_i_1__3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_RD_INDEX(0),
      O => \r_RD_INDEX[0]_i_1__3_n_0\
    );
\r_RD_INDEX[1]_i_1__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_RD_INDEX(0),
      I1 => r_RD_INDEX(1),
      O => \r_RD_INDEX[1]_i_1__3_n_0\
    );
\r_RD_INDEX[2]_i_1__3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      O => \r_RD_INDEX[2]_i_1__3_n_0\
    );
\r_RD_INDEX[3]_i_1__5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000C000000080"
    )
        port map (
      I0 => \r_WR_INDEX[4]_i_3__3_n_0\,
      I1 => rd_en,
      I2 => address(2),
      I3 => address(3),
      I4 => \^r_rd_index_reg[4]_0\,
      I5 => r_FIFO_COUNT_reg(5),
      O => r_RD_INDEX0
    );
\r_RD_INDEX[3]_i_2__3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(0),
      I2 => r_RD_INDEX(1),
      I3 => r_RD_INDEX(3),
      O => \r_RD_INDEX[3]_i_2__3_n_0\
    );
\r_RD_INDEX[4]_i_1__3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_RD_INDEX(2),
      I1 => r_RD_INDEX(4),
      I2 => r_RD_INDEX(0),
      I3 => r_RD_INDEX(1),
      I4 => r_RD_INDEX(3),
      O => \r_RD_INDEX[4]_i_1__3_n_0\
    );
\r_RD_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[0]_i_1__3_n_0\,
      Q => r_RD_INDEX(0),
      R => AR(0)
    );
\r_RD_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[1]_i_1__3_n_0\,
      Q => r_RD_INDEX(1),
      R => AR(0)
    );
\r_RD_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[2]_i_1__3_n_0\,
      Q => r_RD_INDEX(2),
      R => AR(0)
    );
\r_RD_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[3]_i_2__3_n_0\,
      Q => r_RD_INDEX(3),
      R => AR(0)
    );
\r_RD_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_RD_INDEX0,
      D => \r_RD_INDEX[4]_i_1__3_n_0\,
      Q => r_RD_INDEX(4),
      R => AR(0)
    );
\r_WR_INDEX[0]_i_1__3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_WR_INDEX(0),
      O => \r_WR_INDEX[0]_i_1__3_n_0\
    );
\r_WR_INDEX[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_WR_INDEX(0),
      I1 => r_WR_INDEX(1),
      O => \r_WR_INDEX[1]_i_1_n_0\
    );
\r_WR_INDEX[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      O => \r_WR_INDEX[2]_i_1_n_0\
    );
\r_WR_INDEX[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(0),
      I2 => r_WR_INDEX(1),
      I3 => r_WR_INDEX(3),
      O => \r_WR_INDEX[3]_i_1_n_0\
    );
\r_WR_INDEX[4]_i_1__3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => wr_en_reg,
      I1 => \r_WR_INDEX[4]_i_3__3_n_0\,
      I2 => r_FIFO_COUNT_reg(5),
      O => r_WR_INDEX0
    );
\r_WR_INDEX[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => r_WR_INDEX(2),
      I1 => r_WR_INDEX(4),
      I2 => r_WR_INDEX(0),
      I3 => r_WR_INDEX(1),
      I4 => r_WR_INDEX(3),
      O => \r_WR_INDEX[4]_i_2_n_0\
    );
\r_WR_INDEX[4]_i_3__3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => r_FIFO_COUNT_reg(0),
      I1 => r_FIFO_COUNT_reg(6),
      I2 => r_FIFO_COUNT_reg(4),
      I3 => r_FIFO_COUNT_reg(3),
      I4 => r_FIFO_COUNT_reg(1),
      I5 => r_FIFO_COUNT_reg(2),
      O => \r_WR_INDEX[4]_i_3__3_n_0\
    );
\r_WR_INDEX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[0]_i_1__3_n_0\,
      Q => r_WR_INDEX(0),
      R => AR(0)
    );
\r_WR_INDEX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[1]_i_1_n_0\,
      Q => r_WR_INDEX(1),
      R => AR(0)
    );
\r_WR_INDEX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[2]_i_1_n_0\,
      Q => r_WR_INDEX(2),
      R => AR(0)
    );
\r_WR_INDEX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[3]_i_1_n_0\,
      Q => r_WR_INDEX(3),
      R => AR(0)
    );
\r_WR_INDEX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r_WR_INDEX0,
      D => \r_WR_INDEX[4]_i_2_n_0\,
      Q => r_WR_INDEX(4),
      R => AR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_FifoManagerV4_0_0_FifoManagerV4 is
  port (
    DataOut : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FIFOresponse : out STD_LOGIC;
    FIFO_ReadEn : out STD_LOGIC;
    FIFOvalid : out STD_LOGIC;
    nRST : in STD_LOGIC;
    CLK : in STD_LOGIC;
    ready_i : in STD_LOGIC;
    FIFO_Time : in STD_LOGIC_VECTOR ( 63 downto 0 );
    FIFO_Spare : in STD_LOGIC_VECTOR ( 9 downto 0 );
    FIFO_TrigInfo : in STD_LOGIC_VECTOR ( 11 downto 0 );
    FIFO_WdoAddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    CH0 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH1 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH2 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH3 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH4 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH5 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH6 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH7 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH8 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH9 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH10 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH11 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH12 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH13 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH14 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH15 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    PSBUSY_i : in STD_LOGIC;
    TestFIFO : in STD_LOGIC;
    PRECvalid : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of base_zynq_FifoManagerV4_0_0_FifoManagerV4 : entity is "FifoManagerV4";
end base_zynq_FifoManagerV4_0_0_FifoManagerV4;

architecture STRUCTURE of base_zynq_FifoManagerV4_0_0_FifoManagerV4 is
  signal \DIGTime_intl_reg_n_0_[0]\ : STD_LOGIC;
  signal \DIGTime_intl_reg_n_0_[1]\ : STD_LOGIC;
  signal \DIGTime_intl_reg_n_0_[2]\ : STD_LOGIC;
  signal \DIGTime_intl_reg_n_0_[3]\ : STD_LOGIC;
  signal \DIGTime_intl_reg_n_0_[4]\ : STD_LOGIC;
  signal \DIGTime_intl_reg_n_0_[5]\ : STD_LOGIC;
  signal \DIGTime_intl_reg_n_0_[6]\ : STD_LOGIC;
  signal \DIGTime_intl_reg_n_0_[7]\ : STD_LOGIC;
  signal \DIGTime_intl_reg_n_0_[8]\ : STD_LOGIC;
  signal \DIGTime_intl_reg_n_0_[9]\ : STD_LOGIC;
  signal \DataOut[0]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut[10]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut[11]_i_10_n_0\ : STD_LOGIC;
  signal \DataOut[11]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut[11]_i_5_n_0\ : STD_LOGIC;
  signal \DataOut[11]_i_6_n_0\ : STD_LOGIC;
  signal \DataOut[11]_i_8_n_0\ : STD_LOGIC;
  signal \DataOut[12]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[13]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[14]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[15]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[16]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[17]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[18]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[19]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[1]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut[20]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[21]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[22]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[23]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[24]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[25]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[26]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[27]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[28]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[29]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[2]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut[30]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[31]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut[31]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut[3]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut[4]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut[5]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut[6]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut[7]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut[8]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut[9]_i_2_n_0\ : STD_LOGIC;
  signal DataOut_intlD : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal DataOut_intlH : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \DataOut_intlH[0]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[0]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[0]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[10]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[10]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[11]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[11]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[12]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[13]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[14]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[15]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[16]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[17]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[18]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[19]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[1]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[1]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[1]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[20]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[21]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[22]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[23]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[24]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[25]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[26]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[27]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[28]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[28]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[29]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[2]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[2]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[2]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[30]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[31]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[31]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[31]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[31]_i_4_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[31]_i_5_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[3]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[3]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[3]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[4]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[4]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[4]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[5]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[5]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[5]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[6]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[6]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[6]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[7]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[7]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[7]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[8]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[8]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[8]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[8]_i_4_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[9]_i_1_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[9]_i_2_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[9]_i_3_n_0\ : STD_LOGIC;
  signal \DataOut_intlH[9]_i_4_n_0\ : STD_LOGIC;
  signal DataOut_last : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[0]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[10]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[11]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[12]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[13]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[14]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[15]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[16]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[17]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[18]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[19]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[1]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[20]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[21]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[22]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[23]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[24]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[25]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[26]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[27]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[28]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[29]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[2]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[30]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[31]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[3]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[4]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[5]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[6]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[7]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[8]\ : STD_LOGIC;
  signal \DataOut_last_reg_n_0_[9]\ : STD_LOGIC;
  signal DataOut_stall : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \DataOut_stall[11]_i_1_n_0\ : STD_LOGIC;
  signal \FIFO_RD[busy]_i_1_n_0\ : STD_LOGIC;
  signal \FIFO_RD[response]_i_1_n_0\ : STD_LOGIC;
  signal \FIFO_RD_reg[busy]__0\ : STD_LOGIC;
  signal \FIFO_RD_reg[response_n_0_]\ : STD_LOGIC;
  signal \^fifo_readen\ : STD_LOGIC;
  signal FIFO_ReadEn_i_2_n_0 : STD_LOGIC;
  signal FIFO_ReadEn_i_5_n_0 : STD_LOGIC;
  signal FIFO_ReadEn_i_6_n_0 : STD_LOGIC;
  signal \FIFO_WR[response]\ : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of \FIFO_WR[response]\ : signal is "yes";
  signal \FIFO_WR[response]_i_1_n_0\ : STD_LOGIC;
  signal \FIFO_WR[valid]_i_2_n_0\ : STD_LOGIC;
  signal \FIFO_WR_reg[valid]0\ : STD_LOGIC;
  signal \FIFO_WR_reg[valid_n_0_]\ : STD_LOGIC;
  signal \^fiforesponse\ : STD_LOGIC;
  signal \^fifovalid\ : STD_LOGIC;
  signal FIFOvalid_i_1_n_0 : STD_LOGIC;
  signal FIFOvalid_i_3_n_0 : STD_LOGIC;
  signal \FSM_onehot_fifo_wr_stm[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_fifo_wr_stm[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_fifo_wr_stm[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_fifo_wr_stm[9]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_fifo_wr_stm[9]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_onehot_fifo_wr_stm[9]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_onehot_fifo_wr_stm[9]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_onehot_fifo_wr_stm_reg_n_0_[0]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_fifo_wr_stm_reg_n_0_[0]\ : signal is "yes";
  signal \FSM_onehot_fifo_wr_stm_reg_n_0_[1]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_fifo_wr_stm_reg_n_0_[1]\ : signal is "yes";
  signal \FSM_onehot_fifo_wr_stm_reg_n_0_[3]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_fifo_wr_stm_reg_n_0_[3]\ : signal is "yes";
  signal \FSM_onehot_fifo_wr_stm_reg_n_0_[5]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_fifo_wr_stm_reg_n_0_[5]\ : signal is "yes";
  signal \FSM_onehot_fifo_wr_stm_reg_n_0_[6]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_fifo_wr_stm_reg_n_0_[6]\ : signal is "yes";
  signal \FSM_onehot_fifo_wr_stm_reg_n_0_[7]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_fifo_wr_stm_reg_n_0_[7]\ : signal is "yes";
  signal \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\ : signal is "yes";
  signal \FSM_onehot_fifo_wr_stm_reg_n_0_[9]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_fifo_wr_stm_reg_n_0_[9]\ : signal is "yes";
  signal \GEN_FIFO[0].FIFOCH_n_0\ : STD_LOGIC;
  signal \GEN_FIFO[0].FIFOCH_n_1\ : STD_LOGIC;
  signal \GEN_FIFO[11].FIFOCH_n_25\ : STD_LOGIC;
  signal \GEN_FIFO[11].FIFOCH_n_26\ : STD_LOGIC;
  signal \GEN_FIFO[12].FIFOCH_n_1\ : STD_LOGIC;
  signal \GEN_FIFO[12].FIFOCH_n_2\ : STD_LOGIC;
  signal \GEN_FIFO[13].FIFOCH_n_1\ : STD_LOGIC;
  signal \GEN_FIFO[13].FIFOCH_n_10\ : STD_LOGIC;
  signal \GEN_FIFO[13].FIFOCH_n_11\ : STD_LOGIC;
  signal \GEN_FIFO[13].FIFOCH_n_12\ : STD_LOGIC;
  signal \GEN_FIFO[13].FIFOCH_n_13\ : STD_LOGIC;
  signal \GEN_FIFO[13].FIFOCH_n_14\ : STD_LOGIC;
  signal \GEN_FIFO[13].FIFOCH_n_15\ : STD_LOGIC;
  signal \GEN_FIFO[13].FIFOCH_n_16\ : STD_LOGIC;
  signal \GEN_FIFO[13].FIFOCH_n_17\ : STD_LOGIC;
  signal \GEN_FIFO[13].FIFOCH_n_2\ : STD_LOGIC;
  signal \GEN_FIFO[13].FIFOCH_n_4\ : STD_LOGIC;
  signal \GEN_FIFO[13].FIFOCH_n_5\ : STD_LOGIC;
  signal \GEN_FIFO[13].FIFOCH_n_6\ : STD_LOGIC;
  signal \GEN_FIFO[13].FIFOCH_n_7\ : STD_LOGIC;
  signal \GEN_FIFO[13].FIFOCH_n_8\ : STD_LOGIC;
  signal \GEN_FIFO[13].FIFOCH_n_9\ : STD_LOGIC;
  signal \GEN_FIFO[14].FIFOCH_n_1\ : STD_LOGIC;
  signal \GEN_FIFO[14].FIFOCH_n_2\ : STD_LOGIC;
  signal \GEN_FIFO[14].FIFOCH_n_3\ : STD_LOGIC;
  signal \GEN_FIFO[14].FIFOCH_n_4\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_1\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_10\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_11\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_12\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_13\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_14\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_15\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_16\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_17\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_18\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_19\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_2\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_20\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_21\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_22\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_23\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_24\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_25\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_26\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_3\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_4\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_5\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_6\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_7\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_8\ : STD_LOGIC;
  signal \GEN_FIFO[15].FIFOCH_n_9\ : STD_LOGIC;
  signal \GEN_FIFO[1].FIFOCH_n_0\ : STD_LOGIC;
  signal \GEN_FIFO[1].FIFOCH_n_1\ : STD_LOGIC;
  signal \GEN_FIFO[1].FIFOCH_n_10\ : STD_LOGIC;
  signal \GEN_FIFO[1].FIFOCH_n_11\ : STD_LOGIC;
  signal \GEN_FIFO[1].FIFOCH_n_2\ : STD_LOGIC;
  signal \GEN_FIFO[1].FIFOCH_n_3\ : STD_LOGIC;
  signal \GEN_FIFO[1].FIFOCH_n_4\ : STD_LOGIC;
  signal \GEN_FIFO[1].FIFOCH_n_5\ : STD_LOGIC;
  signal \GEN_FIFO[1].FIFOCH_n_6\ : STD_LOGIC;
  signal \GEN_FIFO[1].FIFOCH_n_7\ : STD_LOGIC;
  signal \GEN_FIFO[1].FIFOCH_n_8\ : STD_LOGIC;
  signal \GEN_FIFO[1].FIFOCH_n_9\ : STD_LOGIC;
  signal \GEN_FIFO[2].FIFOCH_n_0\ : STD_LOGIC;
  signal \GEN_FIFO[2].FIFOCH_n_1\ : STD_LOGIC;
  signal \GEN_FIFO[2].FIFOCH_n_16\ : STD_LOGIC;
  signal \GEN_FIFO[2].FIFOCH_n_17\ : STD_LOGIC;
  signal \GEN_FIFO[2].FIFOCH_n_18\ : STD_LOGIC;
  signal \GEN_FIFO[2].FIFOCH_n_19\ : STD_LOGIC;
  signal \GEN_FIFO[2].FIFOCH_n_2\ : STD_LOGIC;
  signal \GEN_FIFO[2].FIFOCH_n_20\ : STD_LOGIC;
  signal \GEN_FIFO[2].FIFOCH_n_21\ : STD_LOGIC;
  signal \GEN_FIFO[2].FIFOCH_n_22\ : STD_LOGIC;
  signal \GEN_FIFO[2].FIFOCH_n_23\ : STD_LOGIC;
  signal \GEN_FIFO[2].FIFOCH_n_24\ : STD_LOGIC;
  signal \GEN_FIFO[2].FIFOCH_n_25\ : STD_LOGIC;
  signal \GEN_FIFO[2].FIFOCH_n_26\ : STD_LOGIC;
  signal \GEN_FIFO[2].FIFOCH_n_27\ : STD_LOGIC;
  signal \GEN_FIFO[2].FIFOCH_n_28\ : STD_LOGIC;
  signal \GEN_FIFO[2].FIFOCH_n_3\ : STD_LOGIC;
  signal \GEN_FIFO[3].FIFOCH_n_12\ : STD_LOGIC;
  signal \GEN_FIFO[3].FIFOCH_n_13\ : STD_LOGIC;
  signal \GEN_FIFO[3].FIFOCH_n_14\ : STD_LOGIC;
  signal \GEN_FIFO[3].FIFOCH_n_15\ : STD_LOGIC;
  signal \GEN_FIFO[3].FIFOCH_n_16\ : STD_LOGIC;
  signal \GEN_FIFO[3].FIFOCH_n_17\ : STD_LOGIC;
  signal \GEN_FIFO[3].FIFOCH_n_18\ : STD_LOGIC;
  signal \GEN_FIFO[3].FIFOCH_n_19\ : STD_LOGIC;
  signal \GEN_FIFO[3].FIFOCH_n_20\ : STD_LOGIC;
  signal \GEN_FIFO[3].FIFOCH_n_21\ : STD_LOGIC;
  signal \GEN_FIFO[3].FIFOCH_n_22\ : STD_LOGIC;
  signal \GEN_FIFO[3].FIFOCH_n_23\ : STD_LOGIC;
  signal \GEN_FIFO[4].FIFOCH_n_0\ : STD_LOGIC;
  signal \GEN_FIFO[4].FIFOCH_n_1\ : STD_LOGIC;
  signal \GEN_FIFO[5].FIFOCH_n_0\ : STD_LOGIC;
  signal \GEN_FIFO[5].FIFOCH_n_1\ : STD_LOGIC;
  signal \GEN_FIFO[5].FIFOCH_n_10\ : STD_LOGIC;
  signal \GEN_FIFO[5].FIFOCH_n_11\ : STD_LOGIC;
  signal \GEN_FIFO[5].FIFOCH_n_12\ : STD_LOGIC;
  signal \GEN_FIFO[5].FIFOCH_n_2\ : STD_LOGIC;
  signal \GEN_FIFO[5].FIFOCH_n_3\ : STD_LOGIC;
  signal \GEN_FIFO[5].FIFOCH_n_4\ : STD_LOGIC;
  signal \GEN_FIFO[5].FIFOCH_n_5\ : STD_LOGIC;
  signal \GEN_FIFO[5].FIFOCH_n_6\ : STD_LOGIC;
  signal \GEN_FIFO[5].FIFOCH_n_7\ : STD_LOGIC;
  signal \GEN_FIFO[5].FIFOCH_n_8\ : STD_LOGIC;
  signal \GEN_FIFO[5].FIFOCH_n_9\ : STD_LOGIC;
  signal \GEN_FIFO[6].FIFOCH_n_1\ : STD_LOGIC;
  signal \GEN_FIFO[6].FIFOCH_n_2\ : STD_LOGIC;
  signal \GEN_FIFO[7].FIFOCH_n_1\ : STD_LOGIC;
  signal \GEN_FIFO[7].FIFOCH_n_2\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_0\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_1\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_10\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_11\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_12\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_13\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_14\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_15\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_16\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_17\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_18\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_19\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_2\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_20\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_21\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_22\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_23\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_24\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_25\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_27\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_3\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_4\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_5\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_6\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_7\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_8\ : STD_LOGIC;
  signal \GEN_FIFO[8].FIFOCH_n_9\ : STD_LOGIC;
  signal \GEN_FIFO[9].FIFOCH_n_0\ : STD_LOGIC;
  signal Trigger_intl : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \Trigger_intl[10]_i_1_n_0\ : STD_LOGIC;
  signal \Trigger_intl[3]_i_1_n_0\ : STD_LOGIC;
  signal \Trigger_intl[4]_i_1_n_0\ : STD_LOGIC;
  signal \Trigger_intl[5]_i_1_n_0\ : STD_LOGIC;
  signal \Trigger_intl[6]_i_1_n_0\ : STD_LOGIC;
  signal \Trigger_intl[9]_i_1_n_0\ : STD_LOGIC;
  signal WDONBR_intl : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \WDONBR_intl[1]_i_1_n_0\ : STD_LOGIC;
  signal \WDONBR_intl[2]_i_1_n_0\ : STD_LOGIC;
  signal \WDONBR_intl[4]_i_1_n_0\ : STD_LOGIC;
  signal \WDONBR_intl[5]_i_1_n_0\ : STD_LOGIC;
  signal \WDONBR_intl[7]_i_1_n_0\ : STD_LOGIC;
  signal \WDONBR_intl[8]_i_1_n_0\ : STD_LOGIC;
  signal WDOTime_intl0 : STD_LOGIC;
  signal \WDOTime_intl[0]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[10]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[11]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[12]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[13]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[14]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[15]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[16]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[17]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[18]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[19]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[1]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[20]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[21]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[22]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[23]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[24]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[25]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[26]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[27]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[28]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[29]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[2]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[30]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[31]_i_2_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[3]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[4]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[5]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[6]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[7]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[8]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl[9]_i_1_n_0\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[0]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[10]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[11]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[12]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[13]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[14]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[15]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[16]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[17]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[18]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[19]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[1]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[20]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[21]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[22]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[23]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[24]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[25]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[26]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[27]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[28]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[29]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[2]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[30]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[31]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[3]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[4]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[5]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[6]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[7]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[8]\ : STD_LOGIC;
  signal \WDOTime_intl_reg_n_0_[9]\ : STD_LOGIC;
  signal address : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal cnt_fifo0 : STD_LOGIC;
  signal \cnt_fifo[0]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_fifo[0]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_fifo[0]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_fifo[1]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_fifo[2]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_fifo[3]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_fifo[4]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_fifo[5]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_fifo[6]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_fifo[7]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_fifo[8]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_fifo[8]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_fifo[8]_i_4_n_0\ : STD_LOGIC;
  signal \cnt_fifo[8]_i_5_n_0\ : STD_LOGIC;
  signal \cnt_fifo[8]_i_6_n_0\ : STD_LOGIC;
  signal \cnt_fifo[8]_i_7_n_0\ : STD_LOGIC;
  signal \cnt_fifo_reg_n_0_[0]\ : STD_LOGIC;
  signal \cnt_fifo_reg_n_0_[1]\ : STD_LOGIC;
  signal \cnt_fifo_reg_n_0_[2]\ : STD_LOGIC;
  signal \cnt_fifo_reg_n_0_[3]\ : STD_LOGIC;
  signal \cnt_fifo_reg_n_0_[4]\ : STD_LOGIC;
  signal data1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal data3 : STD_LOGIC_VECTOR ( 31 to 31 );
  signal fifo_rd_stm : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal fifo_rd_stm0 : STD_LOGIC;
  signal \fifo_rd_stm[0]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_rd_stm[0]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_rd_stm[0]_i_4_n_0\ : STD_LOGIC;
  signal \fifo_rd_stm[0]_i_6_n_0\ : STD_LOGIC;
  signal \fifo_rd_stm[0]_i_7_n_0\ : STD_LOGIC;
  signal \fifo_rd_stm[0]_i_8_n_0\ : STD_LOGIC;
  signal \fifo_rd_stm[1]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_rd_stm[1]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_rd_stm[1]_i_4_n_0\ : STD_LOGIC;
  signal \fifo_rd_stm[1]_i_5_n_0\ : STD_LOGIC;
  signal \fifo_rd_stm[1]_i_6_n_0\ : STD_LOGIC;
  signal \fifo_rd_stm[2]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_rd_stm[2]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_rd_stm[2]_i_4_n_0\ : STD_LOGIC;
  signal \fifo_rd_stm[3]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_rd_stm[3]_i_4_n_0\ : STD_LOGIC;
  signal \fifo_rd_stm[3]_i_5_n_0\ : STD_LOGIC;
  signal \fifo_rd_stm_reg_n_0_[0]\ : STD_LOGIC;
  signal \fifo_rd_stm_reg_n_0_[1]\ : STD_LOGIC;
  signal \fifo_rd_stm_reg_n_0_[2]\ : STD_LOGIC;
  signal \fifo_rd_stm_reg_n_0_[3]\ : STD_LOGIC;
  signal full : STD_LOGIC_VECTOR ( 15 downto 1 );
  signal last_fifo_rd_stm : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \last_fifo_rd_stm[0]_i_1_n_0\ : STD_LOGIC;
  signal \last_fifo_rd_stm[2]_i_1_n_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal r_FIFO_COUNT_reg : STD_LOGIC_VECTOR ( 5 to 5 );
  signal r_FIFO_COUNT_reg_0 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal r_FIFO_COUNT_reg_1 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal r_FIFO_COUNT_reg_2 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal r_FIFO_COUNT_reg_3 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal r_FIFO_COUNT_reg_4 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal \rd_data12[0]_0\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \rd_data12[10]_10\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \rd_data12[11]_11\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \rd_data12[12]_12\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \rd_data12[14]_14\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \rd_data12[2]_2\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \rd_data12[3]_3\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \rd_data12[4]_4\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \rd_data12[6]_6\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \rd_data12[7]_7\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \rd_data12[9]_9\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal rd_en : STD_LOGIC;
  signal rd_en0 : STD_LOGIC;
  signal \rd_en0__7\ : STD_LOGIC;
  signal rd_en_i_1_n_0 : STD_LOGIC;
  signal rd_en_i_2_n_0 : STD_LOGIC;
  signal rd_en_i_4_n_0 : STD_LOGIC;
  signal rdy_state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \wr_data_reg[15]0\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[0][0]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[0][10]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[0][11]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[0][1]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[0][2]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[0][3]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[0][4]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[0][5]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[0][6]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[0][7]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[0][8]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[0][9]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[10][0]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[10][10]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[10][11]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[10][1]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[10][2]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[10][3]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[10][4]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[10][5]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[10][6]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[10][7]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[10][8]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[10][9]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[11][0]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[11][10]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[11][11]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[11][1]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[11][2]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[11][3]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[11][4]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[11][5]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[11][6]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[11][7]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[11][8]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[11][9]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[12][0]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[12][10]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[12][11]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[12][1]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[12][2]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[12][3]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[12][4]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[12][5]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[12][6]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[12][7]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[12][8]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[12][9]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[13][0]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[13][10]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[13][11]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[13][1]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[13][2]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[13][3]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[13][4]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[13][5]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[13][6]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[13][7]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[13][8]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[13][9]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[14][0]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[14][10]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[14][11]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[14][1]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[14][2]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[14][3]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[14][4]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[14][5]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[14][6]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[14][7]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[14][8]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[14][9]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[15][0]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[15][10]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[15][11]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[15][1]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[15][2]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[15][3]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[15][4]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[15][5]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[15][6]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[15][7]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[15][8]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[15][9]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[1][0]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[1][10]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[1][11]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[1][1]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[1][2]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[1][3]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[1][4]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[1][5]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[1][6]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[1][7]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[1][8]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[1][9]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[2][0]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[2][10]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[2][11]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[2][1]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[2][2]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[2][3]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[2][4]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[2][5]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[2][6]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[2][7]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[2][8]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[2][9]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[3][0]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[3][10]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[3][11]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[3][1]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[3][2]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[3][3]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[3][4]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[3][5]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[3][6]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[3][7]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[3][8]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[3][9]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[4][0]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[4][10]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[4][11]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[4][1]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[4][2]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[4][3]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[4][4]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[4][5]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[4][6]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[4][7]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[4][8]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[4][9]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[5][0]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[5][10]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[5][11]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[5][1]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[5][2]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[5][3]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[5][4]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[5][5]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[5][6]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[5][7]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[5][8]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[5][9]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[6][0]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[6][10]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[6][11]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[6][1]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[6][2]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[6][3]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[6][4]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[6][5]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[6][6]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[6][7]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[6][8]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[6][9]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[7][0]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[7][10]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[7][11]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[7][1]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[7][2]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[7][3]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[7][4]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[7][5]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[7][6]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[7][7]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[7][8]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[7][9]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[8][0]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[8][10]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[8][11]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[8][1]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[8][2]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[8][3]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[8][4]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[8][5]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[8][6]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[8][7]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[8][8]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[8][9]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[9][0]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[9][10]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[9][11]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[9][1]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[9][2]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[9][3]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[9][4]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[9][5]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[9][6]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[9][7]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[9][8]\ : STD_LOGIC;
  signal \wr_data_reg_n_0_[9][9]\ : STD_LOGIC;
  signal wr_en : STD_LOGIC;
  attribute RTL_KEEP of wr_en : signal is "yes";
  signal wr_en_i_1_n_0 : STD_LOGIC;
  signal wr_en_reg_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \DataOut[11]_i_10\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \DataOut[11]_i_5\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \DataOut[11]_i_8\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \DataOut_intlH[28]_i_2\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \DataOut_intlH[31]_i_3\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \DataOut_intlH[31]_i_5\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \DataOut_intlH[8]_i_3\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \DataOut_intlH[9]_i_2\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \DataOut_intlH[9]_i_3\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \DataOut_last[12]_i_1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \DataOut_last[13]_i_1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \DataOut_last[15]_i_1\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \DataOut_last[16]_i_1\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \DataOut_last[17]_i_1\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \DataOut_last[18]_i_1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \DataOut_last[19]_i_1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \DataOut_last[20]_i_1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \DataOut_last[21]_i_1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \DataOut_last[22]_i_1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \DataOut_last[23]_i_1\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \DataOut_last[24]_i_1\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \DataOut_last[25]_i_1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \DataOut_last[26]_i_1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \DataOut_last[27]_i_1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \DataOut_last[28]_i_1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \DataOut_last[29]_i_1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \DataOut_last[30]_i_1\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \DataOut_last[31]_i_2\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \FIFO_RD[busy]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \FIFO_RD[response]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of FIFOvalid_i_3 : label is "soft_lutpair70";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_fifo_wr_stm_reg[0]\ : label is "wrfull:0000001000,wrxrd:0000010000,respready:0000000100,respvalid:1000000000,read_fifo_info:0100000000,wait_fifo_info:0010000000,valid:0001000000,ready:0000000010,idle:0000000001,wr_tempo:0000100000";
  attribute KEEP : string;
  attribute KEEP of \FSM_onehot_fifo_wr_stm_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_fifo_wr_stm_reg[1]\ : label is "wrfull:0000001000,wrxrd:0000010000,respready:0000000100,respvalid:1000000000,read_fifo_info:0100000000,wait_fifo_info:0010000000,valid:0001000000,ready:0000000010,idle:0000000001,wr_tempo:0000100000";
  attribute KEEP of \FSM_onehot_fifo_wr_stm_reg[1]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_fifo_wr_stm_reg[2]\ : label is "wrfull:0000001000,wrxrd:0000010000,respready:0000000100,respvalid:1000000000,read_fifo_info:0100000000,wait_fifo_info:0010000000,valid:0001000000,ready:0000000010,idle:0000000001,wr_tempo:0000100000";
  attribute KEEP of \FSM_onehot_fifo_wr_stm_reg[2]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_fifo_wr_stm_reg[3]\ : label is "wrfull:0000001000,wrxrd:0000010000,respready:0000000100,respvalid:1000000000,read_fifo_info:0100000000,wait_fifo_info:0010000000,valid:0001000000,ready:0000000010,idle:0000000001,wr_tempo:0000100000";
  attribute KEEP of \FSM_onehot_fifo_wr_stm_reg[3]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_fifo_wr_stm_reg[4]\ : label is "wrfull:0000001000,wrxrd:0000010000,respready:0000000100,respvalid:1000000000,read_fifo_info:0100000000,wait_fifo_info:0010000000,valid:0001000000,ready:0000000010,idle:0000000001,wr_tempo:0000100000";
  attribute KEEP of \FSM_onehot_fifo_wr_stm_reg[4]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_fifo_wr_stm_reg[5]\ : label is "wrfull:0000001000,wrxrd:0000010000,respready:0000000100,respvalid:1000000000,read_fifo_info:0100000000,wait_fifo_info:0010000000,valid:0001000000,ready:0000000010,idle:0000000001,wr_tempo:0000100000";
  attribute KEEP of \FSM_onehot_fifo_wr_stm_reg[5]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_fifo_wr_stm_reg[6]\ : label is "wrfull:0000001000,wrxrd:0000010000,respready:0000000100,respvalid:1000000000,read_fifo_info:0100000000,wait_fifo_info:0010000000,valid:0001000000,ready:0000000010,idle:0000000001,wr_tempo:0000100000";
  attribute KEEP of \FSM_onehot_fifo_wr_stm_reg[6]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_fifo_wr_stm_reg[7]\ : label is "wrfull:0000001000,wrxrd:0000010000,respready:0000000100,respvalid:1000000000,read_fifo_info:0100000000,wait_fifo_info:0010000000,valid:0001000000,ready:0000000010,idle:0000000001,wr_tempo:0000100000";
  attribute KEEP of \FSM_onehot_fifo_wr_stm_reg[7]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_fifo_wr_stm_reg[8]\ : label is "wrfull:0000001000,wrxrd:0000010000,respready:0000000100,respvalid:1000000000,read_fifo_info:0100000000,wait_fifo_info:0010000000,valid:0001000000,ready:0000000010,idle:0000000001,wr_tempo:0000100000";
  attribute KEEP of \FSM_onehot_fifo_wr_stm_reg[8]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_fifo_wr_stm_reg[9]\ : label is "wrfull:0000001000,wrxrd:0000010000,respready:0000000100,respvalid:1000000000,read_fifo_info:0100000000,wait_fifo_info:0010000000,valid:0001000000,ready:0000000010,idle:0000000001,wr_tempo:0000100000";
  attribute KEEP of \FSM_onehot_fifo_wr_stm_reg[9]\ : label is "yes";
  attribute SOFT_HLUTNM of \cnt_fifo[0]_i_2\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \cnt_fifo[2]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \cnt_fifo[3]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \cnt_fifo[4]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \cnt_fifo[6]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \cnt_fifo[7]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \cnt_fifo[8]_i_3\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \cnt_fifo[8]_i_5\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \cnt_fifo[8]_i_6\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \fifo_rd_stm[0]_i_2\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \fifo_rd_stm[0]_i_4\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \fifo_rd_stm[0]_i_7\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \fifo_rd_stm[0]_i_8\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \fifo_rd_stm[1]_i_4\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \fifo_rd_stm[2]_i_2\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \fifo_rd_stm[2]_i_4\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \fifo_rd_stm[3]_i_3\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \fifo_rd_stm[3]_i_4\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \fifo_rd_stm[3]_i_5\ : label is "soft_lutpair81";
begin
  FIFO_ReadEn <= \^fifo_readen\;
  FIFOresponse <= \^fiforesponse\;
  FIFOvalid <= \^fifovalid\;
\DIGTime_intl_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Spare(0),
      Q => \DIGTime_intl_reg_n_0_[0]\,
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\DIGTime_intl_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Spare(1),
      Q => \DIGTime_intl_reg_n_0_[1]\,
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\DIGTime_intl_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Spare(2),
      Q => \DIGTime_intl_reg_n_0_[2]\,
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\DIGTime_intl_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Spare(3),
      Q => \DIGTime_intl_reg_n_0_[3]\,
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\DIGTime_intl_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Spare(4),
      Q => \DIGTime_intl_reg_n_0_[4]\,
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\DIGTime_intl_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Spare(5),
      Q => \DIGTime_intl_reg_n_0_[5]\,
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\DIGTime_intl_reg[63]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \GEN_FIFO[8].FIFOCH_n_27\,
      Q => data3(31),
      R => '0'
    );
\DIGTime_intl_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Spare(6),
      Q => \DIGTime_intl_reg_n_0_[6]\,
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\DIGTime_intl_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Spare(7),
      Q => \DIGTime_intl_reg_n_0_[7]\,
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\DIGTime_intl_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Spare(8),
      Q => \DIGTime_intl_reg_n_0_[8]\,
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\DIGTime_intl_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Spare(9),
      Q => \DIGTime_intl_reg_n_0_[9]\,
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\DataOut[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF725072507250"
    )
        port map (
      I0 => rdy_state(0),
      I1 => rdy_state(1),
      I2 => \DataOut_last_reg_n_0_[0]\,
      I3 => DataOut_stall(0),
      I4 => DataOut_intlH(0),
      I5 => \DataOut[31]_i_2_n_0\,
      O => \DataOut[0]_i_2_n_0\
    );
\DataOut[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF725072507250"
    )
        port map (
      I0 => rdy_state(0),
      I1 => rdy_state(1),
      I2 => \DataOut_last_reg_n_0_[10]\,
      I3 => DataOut_stall(10),
      I4 => DataOut_intlH(10),
      I5 => \DataOut[31]_i_2_n_0\,
      O => \DataOut[10]_i_2_n_0\
    );
\DataOut[11]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => address(2),
      I1 => address(3),
      O => \DataOut[11]_i_10_n_0\
    );
\DataOut[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF725072507250"
    )
        port map (
      I0 => rdy_state(0),
      I1 => rdy_state(1),
      I2 => \DataOut_last_reg_n_0_[11]\,
      I3 => DataOut_stall(11),
      I4 => DataOut_intlH(11),
      I5 => \DataOut[31]_i_2_n_0\,
      O => \DataOut[11]_i_2_n_0\
    );
\DataOut[11]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => address(0),
      I1 => address(1),
      I2 => address(3),
      I3 => address(2),
      O => \DataOut[11]_i_5_n_0\
    );
\DataOut[11]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000000000000000"
    )
        port map (
      I0 => \fifo_rd_stm_reg_n_0_[2]\,
      I1 => \fifo_rd_stm_reg_n_0_[3]\,
      I2 => \fifo_rd_stm_reg_n_0_[1]\,
      I3 => rdy_state(0),
      I4 => rdy_state(1),
      I5 => \fifo_rd_stm_reg_n_0_[0]\,
      O => \DataOut[11]_i_6_n_0\
    );
\DataOut[11]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => address(2),
      I1 => address(3),
      I2 => address(1),
      I3 => address(0),
      O => \DataOut[11]_i_8_n_0\
    );
\DataOut[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88F8"
    )
        port map (
      I0 => DataOut_intlH(12),
      I1 => \DataOut[31]_i_2_n_0\,
      I2 => \DataOut_last_reg_n_0_[12]\,
      I3 => rdy_state(0),
      O => \DataOut[12]_i_1_n_0\
    );
\DataOut[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88F8"
    )
        port map (
      I0 => DataOut_intlH(13),
      I1 => \DataOut[31]_i_2_n_0\,
      I2 => \DataOut_last_reg_n_0_[13]\,
      I3 => rdy_state(0),
      O => \DataOut[13]_i_1_n_0\
    );
\DataOut[14]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88F8"
    )
        port map (
      I0 => DataOut_intlH(14),
      I1 => \DataOut[31]_i_2_n_0\,
      I2 => \DataOut_last_reg_n_0_[14]\,
      I3 => rdy_state(0),
      O => \DataOut[14]_i_1_n_0\
    );
\DataOut[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88F8"
    )
        port map (
      I0 => DataOut_intlH(15),
      I1 => \DataOut[31]_i_2_n_0\,
      I2 => \DataOut_last_reg_n_0_[15]\,
      I3 => rdy_state(0),
      O => \DataOut[15]_i_1_n_0\
    );
\DataOut[16]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88F8"
    )
        port map (
      I0 => DataOut_intlH(16),
      I1 => \DataOut[31]_i_2_n_0\,
      I2 => \DataOut_last_reg_n_0_[16]\,
      I3 => rdy_state(0),
      O => \DataOut[16]_i_1_n_0\
    );
\DataOut[17]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88F8"
    )
        port map (
      I0 => DataOut_intlH(17),
      I1 => \DataOut[31]_i_2_n_0\,
      I2 => \DataOut_last_reg_n_0_[17]\,
      I3 => rdy_state(0),
      O => \DataOut[17]_i_1_n_0\
    );
\DataOut[18]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88F8"
    )
        port map (
      I0 => DataOut_intlH(18),
      I1 => \DataOut[31]_i_2_n_0\,
      I2 => \DataOut_last_reg_n_0_[18]\,
      I3 => rdy_state(0),
      O => \DataOut[18]_i_1_n_0\
    );
\DataOut[19]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88F8"
    )
        port map (
      I0 => DataOut_intlH(19),
      I1 => \DataOut[31]_i_2_n_0\,
      I2 => \DataOut_last_reg_n_0_[19]\,
      I3 => rdy_state(0),
      O => \DataOut[19]_i_1_n_0\
    );
\DataOut[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF725072507250"
    )
        port map (
      I0 => rdy_state(0),
      I1 => rdy_state(1),
      I2 => \DataOut_last_reg_n_0_[1]\,
      I3 => DataOut_stall(1),
      I4 => DataOut_intlH(1),
      I5 => \DataOut[31]_i_2_n_0\,
      O => \DataOut[1]_i_2_n_0\
    );
\DataOut[20]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88F8"
    )
        port map (
      I0 => DataOut_intlH(20),
      I1 => \DataOut[31]_i_2_n_0\,
      I2 => \DataOut_last_reg_n_0_[20]\,
      I3 => rdy_state(0),
      O => \DataOut[20]_i_1_n_0\
    );
\DataOut[21]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88F8"
    )
        port map (
      I0 => DataOut_intlH(21),
      I1 => \DataOut[31]_i_2_n_0\,
      I2 => \DataOut_last_reg_n_0_[21]\,
      I3 => rdy_state(0),
      O => \DataOut[21]_i_1_n_0\
    );
\DataOut[22]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88F8"
    )
        port map (
      I0 => DataOut_intlH(22),
      I1 => \DataOut[31]_i_2_n_0\,
      I2 => \DataOut_last_reg_n_0_[22]\,
      I3 => rdy_state(0),
      O => \DataOut[22]_i_1_n_0\
    );
\DataOut[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88F8"
    )
        port map (
      I0 => DataOut_intlH(23),
      I1 => \DataOut[31]_i_2_n_0\,
      I2 => \DataOut_last_reg_n_0_[23]\,
      I3 => rdy_state(0),
      O => \DataOut[23]_i_1_n_0\
    );
\DataOut[24]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88F8"
    )
        port map (
      I0 => DataOut_intlH(24),
      I1 => \DataOut[31]_i_2_n_0\,
      I2 => \DataOut_last_reg_n_0_[24]\,
      I3 => rdy_state(0),
      O => \DataOut[24]_i_1_n_0\
    );
\DataOut[25]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88F8"
    )
        port map (
      I0 => DataOut_intlH(25),
      I1 => \DataOut[31]_i_2_n_0\,
      I2 => \DataOut_last_reg_n_0_[25]\,
      I3 => rdy_state(0),
      O => \DataOut[25]_i_1_n_0\
    );
\DataOut[26]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88F8"
    )
        port map (
      I0 => DataOut_intlH(26),
      I1 => \DataOut[31]_i_2_n_0\,
      I2 => \DataOut_last_reg_n_0_[26]\,
      I3 => rdy_state(0),
      O => \DataOut[26]_i_1_n_0\
    );
\DataOut[27]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88F8"
    )
        port map (
      I0 => DataOut_intlH(27),
      I1 => \DataOut[31]_i_2_n_0\,
      I2 => \DataOut_last_reg_n_0_[27]\,
      I3 => rdy_state(0),
      O => \DataOut[27]_i_1_n_0\
    );
\DataOut[28]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88F8"
    )
        port map (
      I0 => DataOut_intlH(28),
      I1 => \DataOut[31]_i_2_n_0\,
      I2 => \DataOut_last_reg_n_0_[28]\,
      I3 => rdy_state(0),
      O => \DataOut[28]_i_1_n_0\
    );
\DataOut[29]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88F8"
    )
        port map (
      I0 => DataOut_intlH(29),
      I1 => \DataOut[31]_i_2_n_0\,
      I2 => \DataOut_last_reg_n_0_[29]\,
      I3 => rdy_state(0),
      O => \DataOut[29]_i_1_n_0\
    );
\DataOut[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF725072507250"
    )
        port map (
      I0 => rdy_state(0),
      I1 => rdy_state(1),
      I2 => \DataOut_last_reg_n_0_[2]\,
      I3 => DataOut_stall(2),
      I4 => DataOut_intlH(2),
      I5 => \DataOut[31]_i_2_n_0\,
      O => \DataOut[2]_i_2_n_0\
    );
\DataOut[30]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88F8"
    )
        port map (
      I0 => DataOut_intlH(30),
      I1 => \DataOut[31]_i_2_n_0\,
      I2 => \DataOut_last_reg_n_0_[30]\,
      I3 => rdy_state(0),
      O => \DataOut[30]_i_1_n_0\
    );
\DataOut[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88F8"
    )
        port map (
      I0 => DataOut_intlH(31),
      I1 => \DataOut[31]_i_2_n_0\,
      I2 => \DataOut_last_reg_n_0_[31]\,
      I3 => rdy_state(0),
      O => \DataOut[31]_i_1_n_0\
    );
\DataOut[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000020000000"
    )
        port map (
      I0 => \fifo_rd_stm_reg_n_0_[2]\,
      I1 => \fifo_rd_stm_reg_n_0_[3]\,
      I2 => \fifo_rd_stm_reg_n_0_[1]\,
      I3 => rdy_state(0),
      I4 => rdy_state(1),
      I5 => \fifo_rd_stm_reg_n_0_[0]\,
      O => \DataOut[31]_i_2_n_0\
    );
\DataOut[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF725072507250"
    )
        port map (
      I0 => rdy_state(0),
      I1 => rdy_state(1),
      I2 => \DataOut_last_reg_n_0_[3]\,
      I3 => DataOut_stall(3),
      I4 => DataOut_intlH(3),
      I5 => \DataOut[31]_i_2_n_0\,
      O => \DataOut[3]_i_2_n_0\
    );
\DataOut[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF725072507250"
    )
        port map (
      I0 => rdy_state(0),
      I1 => rdy_state(1),
      I2 => \DataOut_last_reg_n_0_[4]\,
      I3 => DataOut_stall(4),
      I4 => DataOut_intlH(4),
      I5 => \DataOut[31]_i_2_n_0\,
      O => \DataOut[4]_i_2_n_0\
    );
\DataOut[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF725072507250"
    )
        port map (
      I0 => rdy_state(0),
      I1 => rdy_state(1),
      I2 => \DataOut_last_reg_n_0_[5]\,
      I3 => DataOut_stall(5),
      I4 => DataOut_intlH(5),
      I5 => \DataOut[31]_i_2_n_0\,
      O => \DataOut[5]_i_2_n_0\
    );
\DataOut[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF725072507250"
    )
        port map (
      I0 => rdy_state(0),
      I1 => rdy_state(1),
      I2 => \DataOut_last_reg_n_0_[6]\,
      I3 => DataOut_stall(6),
      I4 => DataOut_intlH(6),
      I5 => \DataOut[31]_i_2_n_0\,
      O => \DataOut[6]_i_2_n_0\
    );
\DataOut[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF725072507250"
    )
        port map (
      I0 => rdy_state(0),
      I1 => rdy_state(1),
      I2 => \DataOut_last_reg_n_0_[7]\,
      I3 => DataOut_stall(7),
      I4 => DataOut_intlH(7),
      I5 => \DataOut[31]_i_2_n_0\,
      O => \DataOut[7]_i_2_n_0\
    );
\DataOut[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF725072507250"
    )
        port map (
      I0 => rdy_state(0),
      I1 => rdy_state(1),
      I2 => \DataOut_last_reg_n_0_[8]\,
      I3 => DataOut_stall(8),
      I4 => DataOut_intlH(8),
      I5 => \DataOut[31]_i_2_n_0\,
      O => \DataOut[8]_i_2_n_0\
    );
\DataOut[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF725072507250"
    )
        port map (
      I0 => rdy_state(0),
      I1 => rdy_state(1),
      I2 => \DataOut_last_reg_n_0_[9]\,
      I3 => DataOut_stall(9),
      I4 => DataOut_intlH(9),
      I5 => \DataOut[31]_i_2_n_0\,
      O => \DataOut[9]_i_2_n_0\
    );
\DataOut_intlH[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[0]_i_2_n_0\,
      I1 => \DIGTime_intl_reg_n_0_[0]\,
      I2 => \DataOut_intlH[8]_i_3_n_0\,
      I3 => \WDOTime_intl_reg_n_0_[0]\,
      I4 => \DataOut_intlH[31]_i_4_n_0\,
      I5 => \DataOut_intlH[0]_i_3_n_0\,
      O => \DataOut_intlH[0]_i_1_n_0\
    );
\DataOut_intlH[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0320002000200020"
    )
        port map (
      I0 => Trigger_intl(0),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      I2 => \cnt_fifo_reg_n_0_[2]\,
      I3 => \cnt_fifo_reg_n_0_[0]\,
      I4 => data3(31),
      I5 => \cnt_fifo_reg_n_0_[1]\,
      O => \DataOut_intlH[0]_i_2_n_0\
    );
\DataOut_intlH[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000A0000000A0C0"
    )
        port map (
      I0 => WDONBR_intl(0),
      I1 => data1(0),
      I2 => \cnt_fifo_reg_n_0_[0]\,
      I3 => \cnt_fifo_reg_n_0_[2]\,
      I4 => \fifo_rd_stm_reg_n_0_[0]\,
      I5 => \cnt_fifo_reg_n_0_[1]\,
      O => \DataOut_intlH[0]_i_3_n_0\
    );
\DataOut_intlH[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \DataOut_intlH[31]_i_4_n_0\,
      I1 => \WDOTime_intl_reg_n_0_[10]\,
      I2 => \DataOut_intlH[31]_i_5_n_0\,
      I3 => data1(10),
      I4 => \DataOut_intlH[10]_i_2_n_0\,
      O => \DataOut_intlH[10]_i_1_n_0\
    );
\DataOut_intlH[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"002200C000220000"
    )
        port map (
      I0 => Trigger_intl(10),
      I1 => \cnt_fifo_reg_n_0_[0]\,
      I2 => data3(31),
      I3 => \fifo_rd_stm_reg_n_0_[0]\,
      I4 => \cnt_fifo_reg_n_0_[2]\,
      I5 => \cnt_fifo_reg_n_0_[1]\,
      O => \DataOut_intlH[10]_i_2_n_0\
    );
\DataOut_intlH[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \DataOut_intlH[31]_i_4_n_0\,
      I1 => \WDOTime_intl_reg_n_0_[11]\,
      I2 => \DataOut_intlH[31]_i_5_n_0\,
      I3 => data1(11),
      I4 => \DataOut_intlH[11]_i_2_n_0\,
      O => \DataOut_intlH[11]_i_1_n_0\
    );
\DataOut_intlH[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"002200C000220000"
    )
        port map (
      I0 => Trigger_intl(11),
      I1 => \cnt_fifo_reg_n_0_[0]\,
      I2 => data3(31),
      I3 => \fifo_rd_stm_reg_n_0_[0]\,
      I4 => \cnt_fifo_reg_n_0_[2]\,
      I5 => \cnt_fifo_reg_n_0_[1]\,
      O => \DataOut_intlH[11]_i_2_n_0\
    );
\DataOut_intlH[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[28]_i_2_n_0\,
      I1 => \DataOut_intlH[31]_i_4_n_0\,
      I2 => \WDOTime_intl_reg_n_0_[12]\,
      I3 => data1(12),
      I4 => \DataOut_intlH[31]_i_5_n_0\,
      O => \DataOut_intlH[12]_i_1_n_0\
    );
\DataOut_intlH[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[31]_i_3_n_0\,
      I1 => \DataOut_intlH[31]_i_4_n_0\,
      I2 => \WDOTime_intl_reg_n_0_[13]\,
      I3 => data1(13),
      I4 => \DataOut_intlH[31]_i_5_n_0\,
      O => \DataOut_intlH[13]_i_1_n_0\
    );
\DataOut_intlH[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[28]_i_2_n_0\,
      I1 => \DataOut_intlH[31]_i_4_n_0\,
      I2 => \WDOTime_intl_reg_n_0_[14]\,
      I3 => data1(14),
      I4 => \DataOut_intlH[31]_i_5_n_0\,
      O => \DataOut_intlH[14]_i_1_n_0\
    );
\DataOut_intlH[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[31]_i_3_n_0\,
      I1 => \DataOut_intlH[31]_i_4_n_0\,
      I2 => \WDOTime_intl_reg_n_0_[15]\,
      I3 => data1(15),
      I4 => \DataOut_intlH[31]_i_5_n_0\,
      O => \DataOut_intlH[15]_i_1_n_0\
    );
\DataOut_intlH[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[31]_i_3_n_0\,
      I1 => \DataOut_intlH[31]_i_4_n_0\,
      I2 => \WDOTime_intl_reg_n_0_[16]\,
      I3 => data1(16),
      I4 => \DataOut_intlH[31]_i_5_n_0\,
      O => \DataOut_intlH[16]_i_1_n_0\
    );
\DataOut_intlH[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[31]_i_3_n_0\,
      I1 => \DataOut_intlH[31]_i_4_n_0\,
      I2 => \WDOTime_intl_reg_n_0_[17]\,
      I3 => data1(17),
      I4 => \DataOut_intlH[31]_i_5_n_0\,
      O => \DataOut_intlH[17]_i_1_n_0\
    );
\DataOut_intlH[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[28]_i_2_n_0\,
      I1 => \DataOut_intlH[31]_i_4_n_0\,
      I2 => \WDOTime_intl_reg_n_0_[18]\,
      I3 => data1(18),
      I4 => \DataOut_intlH[31]_i_5_n_0\,
      O => \DataOut_intlH[18]_i_1_n_0\
    );
\DataOut_intlH[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[31]_i_3_n_0\,
      I1 => \DataOut_intlH[31]_i_4_n_0\,
      I2 => \WDOTime_intl_reg_n_0_[19]\,
      I3 => data1(19),
      I4 => \DataOut_intlH[31]_i_5_n_0\,
      O => \DataOut_intlH[19]_i_1_n_0\
    );
\DataOut_intlH[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[1]_i_2_n_0\,
      I1 => \DIGTime_intl_reg_n_0_[1]\,
      I2 => \DataOut_intlH[8]_i_3_n_0\,
      I3 => \WDOTime_intl_reg_n_0_[1]\,
      I4 => \DataOut_intlH[31]_i_4_n_0\,
      I5 => \DataOut_intlH[1]_i_3_n_0\,
      O => \DataOut_intlH[1]_i_1_n_0\
    );
\DataOut_intlH[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0320002000200020"
    )
        port map (
      I0 => Trigger_intl(1),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      I2 => \cnt_fifo_reg_n_0_[2]\,
      I3 => \cnt_fifo_reg_n_0_[0]\,
      I4 => data3(31),
      I5 => \cnt_fifo_reg_n_0_[1]\,
      O => \DataOut_intlH[1]_i_2_n_0\
    );
\DataOut_intlH[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000A0000000A0C0"
    )
        port map (
      I0 => WDONBR_intl(1),
      I1 => data1(1),
      I2 => \cnt_fifo_reg_n_0_[0]\,
      I3 => \cnt_fifo_reg_n_0_[2]\,
      I4 => \fifo_rd_stm_reg_n_0_[0]\,
      I5 => \cnt_fifo_reg_n_0_[1]\,
      O => \DataOut_intlH[1]_i_3_n_0\
    );
\DataOut_intlH[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[28]_i_2_n_0\,
      I1 => \DataOut_intlH[31]_i_4_n_0\,
      I2 => \WDOTime_intl_reg_n_0_[20]\,
      I3 => data1(20),
      I4 => \DataOut_intlH[31]_i_5_n_0\,
      O => \DataOut_intlH[20]_i_1_n_0\
    );
\DataOut_intlH[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[28]_i_2_n_0\,
      I1 => \DataOut_intlH[31]_i_4_n_0\,
      I2 => \WDOTime_intl_reg_n_0_[21]\,
      I3 => data1(21),
      I4 => \DataOut_intlH[31]_i_5_n_0\,
      O => \DataOut_intlH[21]_i_1_n_0\
    );
\DataOut_intlH[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[31]_i_3_n_0\,
      I1 => \DataOut_intlH[31]_i_4_n_0\,
      I2 => \WDOTime_intl_reg_n_0_[22]\,
      I3 => data1(22),
      I4 => \DataOut_intlH[31]_i_5_n_0\,
      O => \DataOut_intlH[22]_i_1_n_0\
    );
\DataOut_intlH[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[31]_i_3_n_0\,
      I1 => \DataOut_intlH[31]_i_4_n_0\,
      I2 => \WDOTime_intl_reg_n_0_[23]\,
      I3 => data1(23),
      I4 => \DataOut_intlH[31]_i_5_n_0\,
      O => \DataOut_intlH[23]_i_1_n_0\
    );
\DataOut_intlH[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[31]_i_3_n_0\,
      I1 => \DataOut_intlH[31]_i_4_n_0\,
      I2 => \WDOTime_intl_reg_n_0_[24]\,
      I3 => data1(24),
      I4 => \DataOut_intlH[31]_i_5_n_0\,
      O => \DataOut_intlH[24]_i_1_n_0\
    );
\DataOut_intlH[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[28]_i_2_n_0\,
      I1 => \DataOut_intlH[31]_i_4_n_0\,
      I2 => \WDOTime_intl_reg_n_0_[25]\,
      I3 => data1(25),
      I4 => \DataOut_intlH[31]_i_5_n_0\,
      O => \DataOut_intlH[25]_i_1_n_0\
    );
\DataOut_intlH[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[31]_i_3_n_0\,
      I1 => \DataOut_intlH[31]_i_4_n_0\,
      I2 => \WDOTime_intl_reg_n_0_[26]\,
      I3 => data1(26),
      I4 => \DataOut_intlH[31]_i_5_n_0\,
      O => \DataOut_intlH[26]_i_1_n_0\
    );
\DataOut_intlH[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[31]_i_3_n_0\,
      I1 => \DataOut_intlH[31]_i_4_n_0\,
      I2 => \WDOTime_intl_reg_n_0_[27]\,
      I3 => data1(27),
      I4 => \DataOut_intlH[31]_i_5_n_0\,
      O => \DataOut_intlH[27]_i_1_n_0\
    );
\DataOut_intlH[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[28]_i_2_n_0\,
      I1 => \DataOut_intlH[31]_i_4_n_0\,
      I2 => \WDOTime_intl_reg_n_0_[28]\,
      I3 => data1(28),
      I4 => \DataOut_intlH[31]_i_5_n_0\,
      O => \DataOut_intlH[28]_i_1_n_0\
    );
\DataOut_intlH[28]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04080400"
    )
        port map (
      I0 => \cnt_fifo_reg_n_0_[0]\,
      I1 => data3(31),
      I2 => \fifo_rd_stm_reg_n_0_[0]\,
      I3 => \cnt_fifo_reg_n_0_[2]\,
      I4 => \cnt_fifo_reg_n_0_[1]\,
      O => \DataOut_intlH[28]_i_2_n_0\
    );
\DataOut_intlH[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[31]_i_3_n_0\,
      I1 => \DataOut_intlH[31]_i_4_n_0\,
      I2 => \WDOTime_intl_reg_n_0_[29]\,
      I3 => data1(29),
      I4 => \DataOut_intlH[31]_i_5_n_0\,
      O => \DataOut_intlH[29]_i_1_n_0\
    );
\DataOut_intlH[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[2]_i_2_n_0\,
      I1 => \DIGTime_intl_reg_n_0_[2]\,
      I2 => \DataOut_intlH[8]_i_3_n_0\,
      I3 => \WDOTime_intl_reg_n_0_[2]\,
      I4 => \DataOut_intlH[31]_i_4_n_0\,
      I5 => \DataOut_intlH[2]_i_3_n_0\,
      O => \DataOut_intlH[2]_i_1_n_0\
    );
\DataOut_intlH[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0320002000200020"
    )
        port map (
      I0 => Trigger_intl(2),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      I2 => \cnt_fifo_reg_n_0_[2]\,
      I3 => \cnt_fifo_reg_n_0_[0]\,
      I4 => data3(31),
      I5 => \cnt_fifo_reg_n_0_[1]\,
      O => \DataOut_intlH[2]_i_2_n_0\
    );
\DataOut_intlH[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000A0000000A0C0"
    )
        port map (
      I0 => WDONBR_intl(2),
      I1 => data1(2),
      I2 => \cnt_fifo_reg_n_0_[0]\,
      I3 => \cnt_fifo_reg_n_0_[2]\,
      I4 => \fifo_rd_stm_reg_n_0_[0]\,
      I5 => \cnt_fifo_reg_n_0_[1]\,
      O => \DataOut_intlH[2]_i_3_n_0\
    );
\DataOut_intlH[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[31]_i_3_n_0\,
      I1 => \DataOut_intlH[31]_i_4_n_0\,
      I2 => \WDOTime_intl_reg_n_0_[30]\,
      I3 => data1(30),
      I4 => \DataOut_intlH[31]_i_5_n_0\,
      O => \DataOut_intlH[30]_i_1_n_0\
    );
\DataOut_intlH[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000503000"
    )
        port map (
      I0 => \fifo_rd_stm[0]_i_4_n_0\,
      I1 => PSBUSY_i,
      I2 => ready_i,
      I3 => \fifo_rd_stm_reg_n_0_[0]\,
      I4 => \fifo_rd_stm_reg_n_0_[1]\,
      I5 => \fifo_rd_stm[1]_i_4_n_0\,
      O => \DataOut_intlH[31]_i_1_n_0\
    );
\DataOut_intlH[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[31]_i_3_n_0\,
      I1 => \DataOut_intlH[31]_i_4_n_0\,
      I2 => \WDOTime_intl_reg_n_0_[31]\,
      I3 => data1(31),
      I4 => \DataOut_intlH[31]_i_5_n_0\,
      O => \DataOut_intlH[31]_i_2_n_0\
    );
\DataOut_intlH[31]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => \cnt_fifo_reg_n_0_[1]\,
      I1 => \cnt_fifo_reg_n_0_[2]\,
      I2 => \fifo_rd_stm_reg_n_0_[0]\,
      I3 => data3(31),
      I4 => \cnt_fifo_reg_n_0_[0]\,
      O => \DataOut_intlH[31]_i_3_n_0\
    );
\DataOut_intlH[31]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF01"
    )
        port map (
      I0 => \cnt_fifo_reg_n_0_[0]\,
      I1 => \cnt_fifo_reg_n_0_[1]\,
      I2 => \cnt_fifo_reg_n_0_[2]\,
      I3 => \fifo_rd_stm_reg_n_0_[0]\,
      O => \DataOut_intlH[31]_i_4_n_0\
    );
\DataOut_intlH[31]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \cnt_fifo_reg_n_0_[0]\,
      I1 => \cnt_fifo_reg_n_0_[2]\,
      I2 => \fifo_rd_stm_reg_n_0_[0]\,
      I3 => \cnt_fifo_reg_n_0_[1]\,
      O => \DataOut_intlH[31]_i_5_n_0\
    );
\DataOut_intlH[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[3]_i_2_n_0\,
      I1 => \DIGTime_intl_reg_n_0_[3]\,
      I2 => \DataOut_intlH[8]_i_3_n_0\,
      I3 => \WDOTime_intl_reg_n_0_[3]\,
      I4 => \DataOut_intlH[31]_i_4_n_0\,
      I5 => \DataOut_intlH[3]_i_3_n_0\,
      O => \DataOut_intlH[3]_i_1_n_0\
    );
\DataOut_intlH[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0320002000200020"
    )
        port map (
      I0 => Trigger_intl(3),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      I2 => \cnt_fifo_reg_n_0_[2]\,
      I3 => \cnt_fifo_reg_n_0_[0]\,
      I4 => data3(31),
      I5 => \cnt_fifo_reg_n_0_[1]\,
      O => \DataOut_intlH[3]_i_2_n_0\
    );
\DataOut_intlH[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000A0000000A0C0"
    )
        port map (
      I0 => WDONBR_intl(3),
      I1 => data1(3),
      I2 => \cnt_fifo_reg_n_0_[0]\,
      I3 => \cnt_fifo_reg_n_0_[2]\,
      I4 => \fifo_rd_stm_reg_n_0_[0]\,
      I5 => \cnt_fifo_reg_n_0_[1]\,
      O => \DataOut_intlH[3]_i_3_n_0\
    );
\DataOut_intlH[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[4]_i_2_n_0\,
      I1 => \DIGTime_intl_reg_n_0_[4]\,
      I2 => \DataOut_intlH[8]_i_3_n_0\,
      I3 => \WDOTime_intl_reg_n_0_[4]\,
      I4 => \DataOut_intlH[31]_i_4_n_0\,
      I5 => \DataOut_intlH[4]_i_3_n_0\,
      O => \DataOut_intlH[4]_i_1_n_0\
    );
\DataOut_intlH[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0320002000200020"
    )
        port map (
      I0 => Trigger_intl(4),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      I2 => \cnt_fifo_reg_n_0_[2]\,
      I3 => \cnt_fifo_reg_n_0_[0]\,
      I4 => data3(31),
      I5 => \cnt_fifo_reg_n_0_[1]\,
      O => \DataOut_intlH[4]_i_2_n_0\
    );
\DataOut_intlH[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000A0000000A0C0"
    )
        port map (
      I0 => WDONBR_intl(4),
      I1 => data1(4),
      I2 => \cnt_fifo_reg_n_0_[0]\,
      I3 => \cnt_fifo_reg_n_0_[2]\,
      I4 => \fifo_rd_stm_reg_n_0_[0]\,
      I5 => \cnt_fifo_reg_n_0_[1]\,
      O => \DataOut_intlH[4]_i_3_n_0\
    );
\DataOut_intlH[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[5]_i_2_n_0\,
      I1 => \DIGTime_intl_reg_n_0_[5]\,
      I2 => \DataOut_intlH[8]_i_3_n_0\,
      I3 => \WDOTime_intl_reg_n_0_[5]\,
      I4 => \DataOut_intlH[31]_i_4_n_0\,
      I5 => \DataOut_intlH[5]_i_3_n_0\,
      O => \DataOut_intlH[5]_i_1_n_0\
    );
\DataOut_intlH[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0320002000200020"
    )
        port map (
      I0 => Trigger_intl(5),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      I2 => \cnt_fifo_reg_n_0_[2]\,
      I3 => \cnt_fifo_reg_n_0_[0]\,
      I4 => data3(31),
      I5 => \cnt_fifo_reg_n_0_[1]\,
      O => \DataOut_intlH[5]_i_2_n_0\
    );
\DataOut_intlH[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000A0000000A0C0"
    )
        port map (
      I0 => WDONBR_intl(5),
      I1 => data1(5),
      I2 => \cnt_fifo_reg_n_0_[0]\,
      I3 => \cnt_fifo_reg_n_0_[2]\,
      I4 => \fifo_rd_stm_reg_n_0_[0]\,
      I5 => \cnt_fifo_reg_n_0_[1]\,
      O => \DataOut_intlH[5]_i_3_n_0\
    );
\DataOut_intlH[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[6]_i_2_n_0\,
      I1 => \DIGTime_intl_reg_n_0_[6]\,
      I2 => \DataOut_intlH[8]_i_3_n_0\,
      I3 => \WDOTime_intl_reg_n_0_[6]\,
      I4 => \DataOut_intlH[31]_i_4_n_0\,
      I5 => \DataOut_intlH[6]_i_3_n_0\,
      O => \DataOut_intlH[6]_i_1_n_0\
    );
\DataOut_intlH[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0320002000200020"
    )
        port map (
      I0 => Trigger_intl(6),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      I2 => \cnt_fifo_reg_n_0_[2]\,
      I3 => \cnt_fifo_reg_n_0_[0]\,
      I4 => data3(31),
      I5 => \cnt_fifo_reg_n_0_[1]\,
      O => \DataOut_intlH[6]_i_2_n_0\
    );
\DataOut_intlH[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000A0000000A0C0"
    )
        port map (
      I0 => WDONBR_intl(6),
      I1 => data1(6),
      I2 => \cnt_fifo_reg_n_0_[0]\,
      I3 => \cnt_fifo_reg_n_0_[2]\,
      I4 => \fifo_rd_stm_reg_n_0_[0]\,
      I5 => \cnt_fifo_reg_n_0_[1]\,
      O => \DataOut_intlH[6]_i_3_n_0\
    );
\DataOut_intlH[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[7]_i_2_n_0\,
      I1 => \DIGTime_intl_reg_n_0_[7]\,
      I2 => \DataOut_intlH[8]_i_3_n_0\,
      I3 => \WDOTime_intl_reg_n_0_[7]\,
      I4 => \DataOut_intlH[31]_i_4_n_0\,
      I5 => \DataOut_intlH[7]_i_3_n_0\,
      O => \DataOut_intlH[7]_i_1_n_0\
    );
\DataOut_intlH[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0320002000200020"
    )
        port map (
      I0 => Trigger_intl(7),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      I2 => \cnt_fifo_reg_n_0_[2]\,
      I3 => \cnt_fifo_reg_n_0_[0]\,
      I4 => data3(31),
      I5 => \cnt_fifo_reg_n_0_[1]\,
      O => \DataOut_intlH[7]_i_2_n_0\
    );
\DataOut_intlH[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000A0000000A0C0"
    )
        port map (
      I0 => WDONBR_intl(7),
      I1 => data1(7),
      I2 => \cnt_fifo_reg_n_0_[0]\,
      I3 => \cnt_fifo_reg_n_0_[2]\,
      I4 => \fifo_rd_stm_reg_n_0_[0]\,
      I5 => \cnt_fifo_reg_n_0_[1]\,
      O => \DataOut_intlH[7]_i_3_n_0\
    );
\DataOut_intlH[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \DataOut_intlH[8]_i_2_n_0\,
      I1 => \DIGTime_intl_reg_n_0_[8]\,
      I2 => \DataOut_intlH[8]_i_3_n_0\,
      I3 => \WDOTime_intl_reg_n_0_[8]\,
      I4 => \DataOut_intlH[31]_i_4_n_0\,
      I5 => \DataOut_intlH[8]_i_4_n_0\,
      O => \DataOut_intlH[8]_i_1_n_0\
    );
\DataOut_intlH[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0320002000200020"
    )
        port map (
      I0 => Trigger_intl(8),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      I2 => \cnt_fifo_reg_n_0_[2]\,
      I3 => \cnt_fifo_reg_n_0_[0]\,
      I4 => data3(31),
      I5 => \cnt_fifo_reg_n_0_[1]\,
      O => \DataOut_intlH[8]_i_2_n_0\
    );
\DataOut_intlH[8]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \cnt_fifo_reg_n_0_[1]\,
      I1 => \cnt_fifo_reg_n_0_[2]\,
      I2 => \fifo_rd_stm_reg_n_0_[0]\,
      I3 => \cnt_fifo_reg_n_0_[0]\,
      O => \DataOut_intlH[8]_i_3_n_0\
    );
\DataOut_intlH[8]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000A0000000A0C0"
    )
        port map (
      I0 => WDONBR_intl(8),
      I1 => data1(8),
      I2 => \cnt_fifo_reg_n_0_[0]\,
      I3 => \cnt_fifo_reg_n_0_[2]\,
      I4 => \fifo_rd_stm_reg_n_0_[0]\,
      I5 => \cnt_fifo_reg_n_0_[1]\,
      O => \DataOut_intlH[8]_i_4_n_0\
    );
\DataOut_intlH[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFF888"
    )
        port map (
      I0 => \DataOut_intlH[31]_i_5_n_0\,
      I1 => data1(9),
      I2 => Trigger_intl(9),
      I3 => \DataOut_intlH[9]_i_2_n_0\,
      I4 => \DataOut_intlH[9]_i_3_n_0\,
      I5 => \DataOut_intlH[9]_i_4_n_0\,
      O => \DataOut_intlH[9]_i_1_n_0\
    );
\DataOut_intlH[9]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \fifo_rd_stm_reg_n_0_[0]\,
      I1 => \cnt_fifo_reg_n_0_[2]\,
      I2 => \cnt_fifo_reg_n_0_[0]\,
      O => \DataOut_intlH[9]_i_2_n_0\
    );
\DataOut_intlH[9]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => \cnt_fifo_reg_n_0_[1]\,
      I1 => data3(31),
      I2 => \cnt_fifo_reg_n_0_[0]\,
      I3 => \cnt_fifo_reg_n_0_[2]\,
      I4 => \fifo_rd_stm_reg_n_0_[0]\,
      O => \DataOut_intlH[9]_i_3_n_0\
    );
\DataOut_intlH[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCC00000A0C"
    )
        port map (
      I0 => \DIGTime_intl_reg_n_0_[9]\,
      I1 => \WDOTime_intl_reg_n_0_[9]\,
      I2 => \cnt_fifo_reg_n_0_[0]\,
      I3 => \cnt_fifo_reg_n_0_[1]\,
      I4 => \cnt_fifo_reg_n_0_[2]\,
      I5 => \fifo_rd_stm_reg_n_0_[0]\,
      O => \DataOut_intlH[9]_i_4_n_0\
    );
\DataOut_intlH_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[0]_i_1_n_0\,
      Q => DataOut_intlH(0)
    );
\DataOut_intlH_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[10]_i_1_n_0\,
      Q => DataOut_intlH(10)
    );
\DataOut_intlH_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[11]_i_1_n_0\,
      Q => DataOut_intlH(11)
    );
\DataOut_intlH_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[12]_i_1_n_0\,
      Q => DataOut_intlH(12)
    );
\DataOut_intlH_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[13]_i_1_n_0\,
      Q => DataOut_intlH(13)
    );
\DataOut_intlH_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[14]_i_1_n_0\,
      Q => DataOut_intlH(14)
    );
\DataOut_intlH_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[15]_i_1_n_0\,
      Q => DataOut_intlH(15)
    );
\DataOut_intlH_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[16]_i_1_n_0\,
      Q => DataOut_intlH(16)
    );
\DataOut_intlH_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[17]_i_1_n_0\,
      Q => DataOut_intlH(17)
    );
\DataOut_intlH_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[18]_i_1_n_0\,
      Q => DataOut_intlH(18)
    );
\DataOut_intlH_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[19]_i_1_n_0\,
      Q => DataOut_intlH(19)
    );
\DataOut_intlH_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[1]_i_1_n_0\,
      Q => DataOut_intlH(1)
    );
\DataOut_intlH_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[20]_i_1_n_0\,
      Q => DataOut_intlH(20)
    );
\DataOut_intlH_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[21]_i_1_n_0\,
      Q => DataOut_intlH(21)
    );
\DataOut_intlH_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[22]_i_1_n_0\,
      Q => DataOut_intlH(22)
    );
\DataOut_intlH_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[23]_i_1_n_0\,
      Q => DataOut_intlH(23)
    );
\DataOut_intlH_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[24]_i_1_n_0\,
      Q => DataOut_intlH(24)
    );
\DataOut_intlH_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[25]_i_1_n_0\,
      Q => DataOut_intlH(25)
    );
\DataOut_intlH_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[26]_i_1_n_0\,
      Q => DataOut_intlH(26)
    );
\DataOut_intlH_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[27]_i_1_n_0\,
      Q => DataOut_intlH(27)
    );
\DataOut_intlH_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[28]_i_1_n_0\,
      Q => DataOut_intlH(28)
    );
\DataOut_intlH_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[29]_i_1_n_0\,
      Q => DataOut_intlH(29)
    );
\DataOut_intlH_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[2]_i_1_n_0\,
      Q => DataOut_intlH(2)
    );
\DataOut_intlH_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[30]_i_1_n_0\,
      Q => DataOut_intlH(30)
    );
\DataOut_intlH_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[31]_i_2_n_0\,
      Q => DataOut_intlH(31)
    );
\DataOut_intlH_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[3]_i_1_n_0\,
      Q => DataOut_intlH(3)
    );
\DataOut_intlH_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[4]_i_1_n_0\,
      Q => DataOut_intlH(4)
    );
\DataOut_intlH_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[5]_i_1_n_0\,
      Q => DataOut_intlH(5)
    );
\DataOut_intlH_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[6]_i_1_n_0\,
      Q => DataOut_intlH(6)
    );
\DataOut_intlH_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[7]_i_1_n_0\,
      Q => DataOut_intlH(7)
    );
\DataOut_intlH_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[8]_i_1_n_0\,
      Q => DataOut_intlH(8)
    );
\DataOut_intlH_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_intlH[31]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \DataOut_intlH[9]_i_1_n_0\,
      Q => DataOut_intlH(9)
    );
\DataOut_last[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DataOut_intlH(12),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      O => p_1_in(12)
    );
\DataOut_last[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DataOut_intlH(13),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      O => p_1_in(13)
    );
\DataOut_last[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DataOut_intlH(14),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      O => p_1_in(14)
    );
\DataOut_last[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DataOut_intlH(15),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      O => p_1_in(15)
    );
\DataOut_last[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DataOut_intlH(16),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      O => p_1_in(16)
    );
\DataOut_last[17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DataOut_intlH(17),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      O => p_1_in(17)
    );
\DataOut_last[18]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DataOut_intlH(18),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      O => p_1_in(18)
    );
\DataOut_last[19]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DataOut_intlH(19),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      O => p_1_in(19)
    );
\DataOut_last[20]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DataOut_intlH(20),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      O => p_1_in(20)
    );
\DataOut_last[21]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DataOut_intlH(21),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      O => p_1_in(21)
    );
\DataOut_last[22]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DataOut_intlH(22),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      O => p_1_in(22)
    );
\DataOut_last[23]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DataOut_intlH(23),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      O => p_1_in(23)
    );
\DataOut_last[24]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DataOut_intlH(24),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      O => p_1_in(24)
    );
\DataOut_last[25]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DataOut_intlH(25),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      O => p_1_in(25)
    );
\DataOut_last[26]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DataOut_intlH(26),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      O => p_1_in(26)
    );
\DataOut_last[27]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DataOut_intlH(27),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      O => p_1_in(27)
    );
\DataOut_last[28]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DataOut_intlH(28),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      O => p_1_in(28)
    );
\DataOut_last[29]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DataOut_intlH(29),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      O => p_1_in(29)
    );
\DataOut_last[30]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DataOut_intlH(30),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      O => p_1_in(30)
    );
\DataOut_last[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => \fifo_rd_stm_reg_n_0_[1]\,
      I1 => \fifo_rd_stm_reg_n_0_[3]\,
      I2 => \fifo_rd_stm_reg_n_0_[2]\,
      I3 => ready_i,
      O => DataOut_last
    );
\DataOut_last[31]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DataOut_intlH(31),
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      O => p_1_in(31)
    );
\DataOut_last_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(0),
      Q => \DataOut_last_reg_n_0_[0]\
    );
\DataOut_last_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(10),
      Q => \DataOut_last_reg_n_0_[10]\
    );
\DataOut_last_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(11),
      Q => \DataOut_last_reg_n_0_[11]\
    );
\DataOut_last_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(12),
      Q => \DataOut_last_reg_n_0_[12]\
    );
\DataOut_last_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(13),
      Q => \DataOut_last_reg_n_0_[13]\
    );
\DataOut_last_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(14),
      Q => \DataOut_last_reg_n_0_[14]\
    );
\DataOut_last_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(15),
      Q => \DataOut_last_reg_n_0_[15]\
    );
\DataOut_last_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(16),
      Q => \DataOut_last_reg_n_0_[16]\
    );
\DataOut_last_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(17),
      Q => \DataOut_last_reg_n_0_[17]\
    );
\DataOut_last_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(18),
      Q => \DataOut_last_reg_n_0_[18]\
    );
\DataOut_last_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(19),
      Q => \DataOut_last_reg_n_0_[19]\
    );
\DataOut_last_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(1),
      Q => \DataOut_last_reg_n_0_[1]\
    );
\DataOut_last_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(20),
      Q => \DataOut_last_reg_n_0_[20]\
    );
\DataOut_last_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(21),
      Q => \DataOut_last_reg_n_0_[21]\
    );
\DataOut_last_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(22),
      Q => \DataOut_last_reg_n_0_[22]\
    );
\DataOut_last_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(23),
      Q => \DataOut_last_reg_n_0_[23]\
    );
\DataOut_last_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(24),
      Q => \DataOut_last_reg_n_0_[24]\
    );
\DataOut_last_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(25),
      Q => \DataOut_last_reg_n_0_[25]\
    );
\DataOut_last_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(26),
      Q => \DataOut_last_reg_n_0_[26]\
    );
\DataOut_last_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(27),
      Q => \DataOut_last_reg_n_0_[27]\
    );
\DataOut_last_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(28),
      Q => \DataOut_last_reg_n_0_[28]\
    );
\DataOut_last_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(29),
      Q => \DataOut_last_reg_n_0_[29]\
    );
\DataOut_last_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(2),
      Q => \DataOut_last_reg_n_0_[2]\
    );
\DataOut_last_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(30),
      Q => \DataOut_last_reg_n_0_[30]\
    );
\DataOut_last_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(31),
      Q => \DataOut_last_reg_n_0_[31]\
    );
\DataOut_last_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(3),
      Q => \DataOut_last_reg_n_0_[3]\
    );
\DataOut_last_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(4),
      Q => \DataOut_last_reg_n_0_[4]\
    );
\DataOut_last_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(5),
      Q => \DataOut_last_reg_n_0_[5]\
    );
\DataOut_last_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(6),
      Q => \DataOut_last_reg_n_0_[6]\
    );
\DataOut_last_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(7),
      Q => \DataOut_last_reg_n_0_[7]\
    );
\DataOut_last_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(8),
      Q => \DataOut_last_reg_n_0_[8]\
    );
\DataOut_last_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => DataOut_last,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => p_1_in(9),
      Q => \DataOut_last_reg_n_0_[9]\
    );
\DataOut_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \GEN_FIFO[3].FIFOCH_n_23\,
      Q => DataOut(0),
      R => '0'
    );
\DataOut_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \GEN_FIFO[3].FIFOCH_n_13\,
      Q => DataOut(10),
      R => '0'
    );
\DataOut_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \GEN_FIFO[3].FIFOCH_n_12\,
      Q => DataOut(11),
      R => '0'
    );
\DataOut_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \DataOut[12]_i_1_n_0\,
      Q => DataOut(12),
      R => '0'
    );
\DataOut_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \DataOut[13]_i_1_n_0\,
      Q => DataOut(13),
      R => '0'
    );
\DataOut_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \DataOut[14]_i_1_n_0\,
      Q => DataOut(14),
      R => '0'
    );
\DataOut_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \DataOut[15]_i_1_n_0\,
      Q => DataOut(15),
      R => '0'
    );
\DataOut_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \DataOut[16]_i_1_n_0\,
      Q => DataOut(16),
      R => '0'
    );
\DataOut_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \DataOut[17]_i_1_n_0\,
      Q => DataOut(17),
      R => '0'
    );
\DataOut_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \DataOut[18]_i_1_n_0\,
      Q => DataOut(18),
      R => '0'
    );
\DataOut_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \DataOut[19]_i_1_n_0\,
      Q => DataOut(19),
      R => '0'
    );
\DataOut_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \GEN_FIFO[3].FIFOCH_n_22\,
      Q => DataOut(1),
      R => '0'
    );
\DataOut_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \DataOut[20]_i_1_n_0\,
      Q => DataOut(20),
      R => '0'
    );
\DataOut_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \DataOut[21]_i_1_n_0\,
      Q => DataOut(21),
      R => '0'
    );
\DataOut_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \DataOut[22]_i_1_n_0\,
      Q => DataOut(22),
      R => '0'
    );
\DataOut_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \DataOut[23]_i_1_n_0\,
      Q => DataOut(23),
      R => '0'
    );
\DataOut_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \DataOut[24]_i_1_n_0\,
      Q => DataOut(24),
      R => '0'
    );
\DataOut_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \DataOut[25]_i_1_n_0\,
      Q => DataOut(25),
      R => '0'
    );
\DataOut_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \DataOut[26]_i_1_n_0\,
      Q => DataOut(26),
      R => '0'
    );
\DataOut_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \DataOut[27]_i_1_n_0\,
      Q => DataOut(27),
      R => '0'
    );
\DataOut_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \DataOut[28]_i_1_n_0\,
      Q => DataOut(28),
      R => '0'
    );
\DataOut_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \DataOut[29]_i_1_n_0\,
      Q => DataOut(29),
      R => '0'
    );
\DataOut_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \GEN_FIFO[3].FIFOCH_n_21\,
      Q => DataOut(2),
      R => '0'
    );
\DataOut_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \DataOut[30]_i_1_n_0\,
      Q => DataOut(30),
      R => '0'
    );
\DataOut_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \DataOut[31]_i_1_n_0\,
      Q => DataOut(31),
      R => '0'
    );
\DataOut_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \GEN_FIFO[3].FIFOCH_n_20\,
      Q => DataOut(3),
      R => '0'
    );
\DataOut_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \GEN_FIFO[3].FIFOCH_n_19\,
      Q => DataOut(4),
      R => '0'
    );
\DataOut_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \GEN_FIFO[3].FIFOCH_n_18\,
      Q => DataOut(5),
      R => '0'
    );
\DataOut_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \GEN_FIFO[3].FIFOCH_n_17\,
      Q => DataOut(6),
      R => '0'
    );
\DataOut_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \GEN_FIFO[3].FIFOCH_n_16\,
      Q => DataOut(7),
      R => '0'
    );
\DataOut_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \GEN_FIFO[3].FIFOCH_n_15\,
      Q => DataOut(8),
      R => '0'
    );
\DataOut_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \GEN_FIFO[3].FIFOCH_n_14\,
      Q => DataOut(9),
      R => '0'
    );
\DataOut_stall[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => \fifo_rd_stm_reg_n_0_[2]\,
      I1 => \fifo_rd_stm_reg_n_0_[3]\,
      I2 => \fifo_rd_stm_reg_n_0_[0]\,
      I3 => \fifo_rd_stm_reg_n_0_[1]\,
      O => \DataOut_stall[11]_i_1_n_0\
    );
\DataOut_stall_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_stall[11]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => DataOut_intlD(0),
      Q => DataOut_stall(0)
    );
\DataOut_stall_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_stall[11]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => DataOut_intlD(10),
      Q => DataOut_stall(10)
    );
\DataOut_stall_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_stall[11]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => DataOut_intlD(11),
      Q => DataOut_stall(11)
    );
\DataOut_stall_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_stall[11]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => DataOut_intlD(1),
      Q => DataOut_stall(1)
    );
\DataOut_stall_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_stall[11]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => DataOut_intlD(2),
      Q => DataOut_stall(2)
    );
\DataOut_stall_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_stall[11]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => DataOut_intlD(3),
      Q => DataOut_stall(3)
    );
\DataOut_stall_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_stall[11]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => DataOut_intlD(4),
      Q => DataOut_stall(4)
    );
\DataOut_stall_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_stall[11]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => DataOut_intlD(5),
      Q => DataOut_stall(5)
    );
\DataOut_stall_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_stall[11]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => DataOut_intlD(6),
      Q => DataOut_stall(6)
    );
\DataOut_stall_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_stall[11]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => DataOut_intlD(7),
      Q => DataOut_stall(7)
    );
\DataOut_stall_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_stall[11]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => DataOut_intlD(8),
      Q => DataOut_stall(8)
    );
\DataOut_stall_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => \DataOut_stall[11]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => DataOut_intlD(9),
      Q => DataOut_stall(9)
    );
\FIFO_RD[busy]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0002"
    )
        port map (
      I0 => \fifo_rd_stm_reg_n_0_[1]\,
      I1 => \fifo_rd_stm_reg_n_0_[3]\,
      I2 => \fifo_rd_stm_reg_n_0_[2]\,
      I3 => \fifo_rd_stm_reg_n_0_[0]\,
      I4 => \FIFO_RD_reg[busy]__0\,
      O => \FIFO_RD[busy]_i_1_n_0\
    );
\FIFO_RD[response]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBE0002"
    )
        port map (
      I0 => \fifo_rd_stm_reg_n_0_[1]\,
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      I2 => \fifo_rd_stm_reg_n_0_[2]\,
      I3 => \fifo_rd_stm_reg_n_0_[3]\,
      I4 => \FIFO_RD_reg[response_n_0_]\,
      O => \FIFO_RD[response]_i_1_n_0\
    );
\FIFO_RD_reg[busy]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \FIFO_RD[busy]_i_1_n_0\,
      Q => \FIFO_RD_reg[busy]__0\
    );
\FIFO_RD_reg[response]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \FIFO_RD[response]_i_1_n_0\,
      Q => \FIFO_RD_reg[response_n_0_]\
    );
FIFO_ReadEn_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[6]\,
      I1 => TestFIFO,
      O => FIFO_ReadEn_i_2_n_0
    );
FIFO_ReadEn_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => nRST,
      I1 => \FSM_onehot_fifo_wr_stm_reg_n_0_[6]\,
      O => FIFO_ReadEn_i_5_n_0
    );
FIFO_ReadEn_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => nRST,
      I1 => \FSM_onehot_fifo_wr_stm_reg_n_0_[7]\,
      O => FIFO_ReadEn_i_6_n_0
    );
FIFO_ReadEn_reg: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \GEN_FIFO[11].FIFOCH_n_26\,
      Q => \^fifo_readen\,
      R => '0'
    );
\FIFO_WR[response]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F1FFF000"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[3]\,
      I1 => \FSM_onehot_fifo_wr_stm_reg_n_0_[0]\,
      I2 => \FIFO_WR[response]\,
      I3 => nRST,
      I4 => \^fiforesponse\,
      O => \FIFO_WR[response]_i_1_n_0\
    );
\FIFO_WR[valid]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FIFO_WR[response]\,
      I1 => PRECvalid,
      O => \FIFO_WR[valid]_i_2_n_0\
    );
\FIFO_WR[valid]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0202020"
    )
        port map (
      I0 => \FIFO_WR[response]\,
      I1 => PRECvalid,
      I2 => nRST,
      I3 => \FIFO_RD_reg[response_n_0_]\,
      I4 => \FSM_onehot_fifo_wr_stm_reg_n_0_[9]\,
      I5 => \FSM_onehot_fifo_wr_stm_reg_n_0_[6]\,
      O => \FIFO_WR_reg[valid]0\
    );
\FIFO_WR_reg[response]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \FIFO_WR[response]_i_1_n_0\,
      Q => \^fiforesponse\,
      R => '0'
    );
\FIFO_WR_reg[valid]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => \GEN_FIFO[11].FIFOCH_n_25\,
      Q => \FIFO_WR_reg[valid_n_0_]\,
      R => '0'
    );
FIFOvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B000FFFFB0000000"
    )
        port map (
      I0 => \fifo_rd_stm_reg_n_0_[1]\,
      I1 => PSBUSY_i,
      I2 => ready_i,
      I3 => \fifo_rd_stm_reg_n_0_[2]\,
      I4 => FIFOvalid_i_3_n_0,
      I5 => \^fifovalid\,
      O => FIFOvalid_i_1_n_0
    );
FIFOvalid_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1C081008"
    )
        port map (
      I0 => \fifo_rd_stm_reg_n_0_[0]\,
      I1 => \fifo_rd_stm_reg_n_0_[2]\,
      I2 => \fifo_rd_stm_reg_n_0_[3]\,
      I3 => \fifo_rd_stm_reg_n_0_[1]\,
      I4 => ready_i,
      O => FIFOvalid_i_3_n_0
    );
FIFOvalid_reg: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => FIFOvalid_i_1_n_0,
      Q => \^fifovalid\
    );
\FSM_onehot_fifo_wr_stm[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => \FIFO_RD_reg[busy]__0\,
      I1 => \FSM_onehot_fifo_wr_stm_reg_n_0_[0]\,
      I2 => \FSM_onehot_fifo_wr_stm_reg_n_0_[9]\,
      O => \FSM_onehot_fifo_wr_stm[0]_i_2_n_0\
    );
\FSM_onehot_fifo_wr_stm[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => PRECvalid,
      I1 => \FSM_onehot_fifo_wr_stm_reg_n_0_[1]\,
      I2 => \FIFO_RD_reg[busy]__0\,
      I3 => \FSM_onehot_fifo_wr_stm_reg_n_0_[0]\,
      O => \FSM_onehot_fifo_wr_stm[1]_i_1_n_0\
    );
\FSM_onehot_fifo_wr_stm[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"C8"
    )
        port map (
      I0 => \FIFO_WR[response]\,
      I1 => PRECvalid,
      I2 => \FSM_onehot_fifo_wr_stm_reg_n_0_[1]\,
      O => \FSM_onehot_fifo_wr_stm[2]_i_1_n_0\
    );
\FSM_onehot_fifo_wr_stm[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[7]\,
      I1 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I2 => \FSM_onehot_fifo_wr_stm[9]_i_3_n_0\,
      I3 => \FSM_onehot_fifo_wr_stm[9]_i_4_n_0\,
      I4 => \FSM_onehot_fifo_wr_stm_reg_n_0_[1]\,
      O => \FSM_onehot_fifo_wr_stm[9]_i_1_n_0\
    );
\FSM_onehot_fifo_wr_stm[9]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFEFE"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[5]\,
      I1 => wr_en,
      I2 => \FSM_onehot_fifo_wr_stm_reg_n_0_[6]\,
      I3 => \FSM_onehot_fifo_wr_stm_reg_n_0_[9]\,
      I4 => \FIFO_RD_reg[response_n_0_]\,
      O => \FSM_onehot_fifo_wr_stm[9]_i_3_n_0\
    );
\FSM_onehot_fifo_wr_stm[9]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \FIFO_WR[response]\,
      I1 => \FSM_onehot_fifo_wr_stm_reg_n_0_[0]\,
      I2 => \FSM_onehot_fifo_wr_stm_reg_n_0_[3]\,
      O => \FSM_onehot_fifo_wr_stm[9]_i_4_n_0\
    );
\FSM_onehot_fifo_wr_stm[9]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => TestFIFO,
      I1 => \FSM_onehot_fifo_wr_stm_reg_n_0_[6]\,
      O => \FSM_onehot_fifo_wr_stm[9]_i_5_n_0\
    );
\FSM_onehot_fifo_wr_stm_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \FSM_onehot_fifo_wr_stm[9]_i_1_n_0\,
      D => \GEN_FIFO[14].FIFOCH_n_4\,
      PRE => \GEN_FIFO[0].FIFOCH_n_0\,
      Q => \FSM_onehot_fifo_wr_stm_reg_n_0_[0]\
    );
\FSM_onehot_fifo_wr_stm_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_onehot_fifo_wr_stm[9]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \FSM_onehot_fifo_wr_stm[1]_i_1_n_0\,
      Q => \FSM_onehot_fifo_wr_stm_reg_n_0_[1]\
    );
\FSM_onehot_fifo_wr_stm_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_onehot_fifo_wr_stm[9]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \FSM_onehot_fifo_wr_stm[2]_i_1_n_0\,
      Q => \FIFO_WR[response]\
    );
\FSM_onehot_fifo_wr_stm_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_onehot_fifo_wr_stm[9]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \GEN_FIFO[14].FIFOCH_n_3\,
      Q => \FSM_onehot_fifo_wr_stm_reg_n_0_[3]\
    );
\FSM_onehot_fifo_wr_stm_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_onehot_fifo_wr_stm[9]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \GEN_FIFO[2].FIFOCH_n_28\,
      Q => wr_en
    );
\FSM_onehot_fifo_wr_stm_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_onehot_fifo_wr_stm[9]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => wr_en,
      Q => \FSM_onehot_fifo_wr_stm_reg_n_0_[5]\
    );
\FSM_onehot_fifo_wr_stm_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_onehot_fifo_wr_stm[9]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \FSM_onehot_fifo_wr_stm_reg_n_0_[5]\,
      Q => \FSM_onehot_fifo_wr_stm_reg_n_0_[6]\
    );
\FSM_onehot_fifo_wr_stm_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_onehot_fifo_wr_stm[9]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \GEN_FIFO[13].FIFOCH_n_1\,
      Q => \FSM_onehot_fifo_wr_stm_reg_n_0_[7]\
    );
\FSM_onehot_fifo_wr_stm_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_onehot_fifo_wr_stm[9]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \FSM_onehot_fifo_wr_stm_reg_n_0_[7]\,
      Q => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\
    );
\FSM_onehot_fifo_wr_stm_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_onehot_fifo_wr_stm[9]_i_1_n_0\,
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => \GEN_FIFO[2].FIFOCH_n_27\,
      Q => \FSM_onehot_fifo_wr_stm_reg_n_0_[9]\
    );
\GEN_FIFO[0].FIFOCH\: entity work.base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags
     port map (
      AR(0) => \GEN_FIFO[0].FIFOCH_n_0\,
      CLK => CLK,
      Q(0) => r_FIFO_COUNT_reg_3(5),
      \WDONBR_intl_reg[1]\ => \GEN_FIFO[0].FIFOCH_n_1\,
      address(3 downto 0) => address(3 downto 0),
      \cnt_fifo_reg[5]\ => \GEN_FIFO[4].FIFOCH_n_0\,
      nRST => nRST,
      o_rd_data(11 downto 0) => \rd_data12[0]_0\(11 downto 0),
      p_0_in => p_0_in,
      \r_FIFO_COUNT_reg[0]_0\ => \GEN_FIFO[6].FIFOCH_n_2\,
      rd_en => rd_en,
      \wr_data_reg[0][11]\(11) => \wr_data_reg_n_0_[0][11]\,
      \wr_data_reg[0][11]\(10) => \wr_data_reg_n_0_[0][10]\,
      \wr_data_reg[0][11]\(9) => \wr_data_reg_n_0_[0][9]\,
      \wr_data_reg[0][11]\(8) => \wr_data_reg_n_0_[0][8]\,
      \wr_data_reg[0][11]\(7) => \wr_data_reg_n_0_[0][7]\,
      \wr_data_reg[0][11]\(6) => \wr_data_reg_n_0_[0][6]\,
      \wr_data_reg[0][11]\(5) => \wr_data_reg_n_0_[0][5]\,
      \wr_data_reg[0][11]\(4) => \wr_data_reg_n_0_[0][4]\,
      \wr_data_reg[0][11]\(3) => \wr_data_reg_n_0_[0][3]\,
      \wr_data_reg[0][11]\(2) => \wr_data_reg_n_0_[0][2]\,
      \wr_data_reg[0][11]\(1) => \wr_data_reg_n_0_[0][1]\,
      \wr_data_reg[0][11]\(0) => \wr_data_reg_n_0_[0][0]\,
      wr_en_reg => wr_en_reg_n_0
    );
\GEN_FIFO[10].FIFOCH\: entity work.base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_0
     port map (
      AR(0) => \GEN_FIFO[0].FIFOCH_n_0\,
      CLK => CLK,
      Q(11) => \wr_data_reg_n_0_[10][11]\,
      Q(10) => \wr_data_reg_n_0_[10][10]\,
      Q(9) => \wr_data_reg_n_0_[10][9]\,
      Q(8) => \wr_data_reg_n_0_[10][8]\,
      Q(7) => \wr_data_reg_n_0_[10][7]\,
      Q(6) => \wr_data_reg_n_0_[10][6]\,
      Q(5) => \wr_data_reg_n_0_[10][5]\,
      Q(4) => \wr_data_reg_n_0_[10][4]\,
      Q(3) => \wr_data_reg_n_0_[10][3]\,
      Q(2) => \wr_data_reg_n_0_[10][2]\,
      Q(1) => \wr_data_reg_n_0_[10][1]\,
      Q(0) => \wr_data_reg_n_0_[10][0]\,
      address(3 downto 0) => address(3 downto 0),
      \cnt_fifo_reg[6]\ => \GEN_FIFO[6].FIFOCH_n_1\,
      full(0) => full(10),
      o_rd_data(11 downto 0) => \rd_data12[10]_10\(11 downto 0),
      p_0_in => p_0_in,
      rd_en => rd_en,
      wr_en_reg => wr_en_reg_n_0
    );
\GEN_FIFO[11].FIFOCH\: entity work.base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_1
     port map (
      AR(0) => \GEN_FIFO[0].FIFOCH_n_0\,
      CLK => CLK,
      D(11 downto 0) => DataOut_intlD(11 downto 0),
      FIFO_ReadEn => \^fifo_readen\,
      FIFO_ReadEn_reg => \GEN_FIFO[11].FIFOCH_n_26\,
      \FIFO_WR_reg[valid]\ => \GEN_FIFO[11].FIFOCH_n_25\,
      \FIFO_WR_reg[valid]0\ => \FIFO_WR_reg[valid]0\,
      \FIFO_WR_reg[valid]_0\ => \FIFO_WR_reg[valid_n_0_]\,
      \FSM_onehot_fifo_wr_stm_reg[2]\ => \FIFO_WR[valid]_i_2_n_0\,
      \FSM_onehot_fifo_wr_stm_reg[6]\ => FIFO_ReadEn_i_2_n_0,
      \FSM_onehot_fifo_wr_stm_reg[6]_0\ => FIFO_ReadEn_i_5_n_0,
      \FSM_onehot_fifo_wr_stm_reg[7]\ => FIFO_ReadEn_i_6_n_0,
      Q(11) => \wr_data_reg_n_0_[11][11]\,
      Q(10) => \wr_data_reg_n_0_[11][10]\,
      Q(9) => \wr_data_reg_n_0_[11][9]\,
      Q(8) => \wr_data_reg_n_0_[11][8]\,
      Q(7) => \wr_data_reg_n_0_[11][7]\,
      Q(6) => \wr_data_reg_n_0_[11][6]\,
      Q(5) => \wr_data_reg_n_0_[11][5]\,
      Q(4) => \wr_data_reg_n_0_[11][4]\,
      Q(3) => \wr_data_reg_n_0_[11][3]\,
      Q(2) => \wr_data_reg_n_0_[11][2]\,
      Q(1) => \wr_data_reg_n_0_[11][1]\,
      Q(0) => \wr_data_reg_n_0_[11][0]\,
      address(3 downto 0) => address(3 downto 0),
      \cnt_fifo_reg[5]\ => \GEN_FIFO[7].FIFOCH_n_1\,
      full(0) => full(11),
      o_rd_data(11 downto 0) => \rd_data12[11]_11\(11 downto 0),
      \out\(0) => \FSM_onehot_fifo_wr_stm_reg_n_0_[6]\,
      p_0_in => p_0_in,
      \r_FIFO_COUNT_reg[5]_0\(2 downto 0) => full(10 downto 8),
      \r_FIFO_COUNT_reg[5]_1\ => \GEN_FIFO[13].FIFOCH_n_17\,
      \r_FIFO_COUNT_reg[5]_2\ => \GEN_FIFO[15].FIFOCH_n_26\,
      \r_FIFO_COUNT_reg[5]_3\ => \GEN_FIFO[2].FIFOCH_n_1\,
      rd_en => rd_en,
      \wr_data_reg[2][1]\ => \GEN_FIFO[2].FIFOCH_n_3\,
      \wr_data_reg[2][1]_0\ => \GEN_FIFO[2].FIFOCH_n_16\,
      \wr_data_reg[2][1]_1\ => \GEN_FIFO[2].FIFOCH_n_17\,
      \wr_data_reg[2][1]_2\ => \GEN_FIFO[2].FIFOCH_n_18\,
      \wr_data_reg[2][1]_3\ => \GEN_FIFO[2].FIFOCH_n_19\,
      \wr_data_reg[2][1]_4\ => \GEN_FIFO[2].FIFOCH_n_20\,
      \wr_data_reg[2][7]\ => \GEN_FIFO[2].FIFOCH_n_21\,
      \wr_data_reg[2][7]_0\ => \GEN_FIFO[2].FIFOCH_n_22\,
      \wr_data_reg[2][7]_1\ => \GEN_FIFO[2].FIFOCH_n_23\,
      \wr_data_reg[2][7]_2\ => \GEN_FIFO[2].FIFOCH_n_24\,
      \wr_data_reg[2][7]_3\ => \GEN_FIFO[2].FIFOCH_n_25\,
      \wr_data_reg[2][7]_4\ => \GEN_FIFO[2].FIFOCH_n_26\,
      \wr_data_reg[3][7]\(11 downto 0) => \rd_data12[3]_3\(11 downto 0),
      wr_en_reg => wr_en_reg_n_0
    );
\GEN_FIFO[12].FIFOCH\: entity work.base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_2
     port map (
      AR(0) => \GEN_FIFO[0].FIFOCH_n_0\,
      CLK => CLK,
      \FSM_onehot_fifo_wr_stm_reg[6]\ => \FSM_onehot_fifo_wr_stm[9]_i_5_n_0\,
      Q(0) => r_FIFO_COUNT_reg(5),
      \WDONBR_intl_reg[1]\ => \GEN_FIFO[12].FIFOCH_n_2\,
      address(3 downto 0) => address(3 downto 0),
      \cnt_fifo_reg[5]\ => \GEN_FIFO[4].FIFOCH_n_0\,
      full(0) => full(12),
      o_rd_data(11 downto 0) => \rd_data12[12]_12\(11 downto 0),
      p_0_in => p_0_in,
      \r_FIFO_COUNT_reg[5]_0\(3 downto 0) => full(11 downto 8),
      \r_RD_INDEX_reg[4]_0\ => \GEN_FIFO[12].FIFOCH_n_1\,
      rd_en => rd_en,
      \wr_data_reg[12][11]\(11) => \wr_data_reg_n_0_[12][11]\,
      \wr_data_reg[12][11]\(10) => \wr_data_reg_n_0_[12][10]\,
      \wr_data_reg[12][11]\(9) => \wr_data_reg_n_0_[12][9]\,
      \wr_data_reg[12][11]\(8) => \wr_data_reg_n_0_[12][8]\,
      \wr_data_reg[12][11]\(7) => \wr_data_reg_n_0_[12][7]\,
      \wr_data_reg[12][11]\(6) => \wr_data_reg_n_0_[12][6]\,
      \wr_data_reg[12][11]\(5) => \wr_data_reg_n_0_[12][5]\,
      \wr_data_reg[12][11]\(4) => \wr_data_reg_n_0_[12][4]\,
      \wr_data_reg[12][11]\(3) => \wr_data_reg_n_0_[12][3]\,
      \wr_data_reg[12][11]\(2) => \wr_data_reg_n_0_[12][2]\,
      \wr_data_reg[12][11]\(1) => \wr_data_reg_n_0_[12][1]\,
      \wr_data_reg[12][11]\(0) => \wr_data_reg_n_0_[12][0]\,
      wr_en_reg => wr_en_reg_n_0
    );
\GEN_FIFO[13].FIFOCH\: entity work.base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_3
     port map (
      AR(0) => \GEN_FIFO[0].FIFOCH_n_0\,
      CLK => CLK,
      D(0) => \GEN_FIFO[13].FIFOCH_n_1\,
      \DataOut_stall_reg[0]\ => \GEN_FIFO[13].FIFOCH_n_4\,
      \DataOut_stall_reg[10]\ => \GEN_FIFO[13].FIFOCH_n_14\,
      \DataOut_stall_reg[11]\ => \GEN_FIFO[13].FIFOCH_n_15\,
      \DataOut_stall_reg[1]\ => \GEN_FIFO[13].FIFOCH_n_5\,
      \DataOut_stall_reg[2]\ => \GEN_FIFO[13].FIFOCH_n_6\,
      \DataOut_stall_reg[3]\ => \GEN_FIFO[13].FIFOCH_n_7\,
      \DataOut_stall_reg[4]\ => \GEN_FIFO[13].FIFOCH_n_8\,
      \DataOut_stall_reg[5]\ => \GEN_FIFO[13].FIFOCH_n_9\,
      \DataOut_stall_reg[6]\ => \GEN_FIFO[13].FIFOCH_n_10\,
      \DataOut_stall_reg[7]\ => \GEN_FIFO[13].FIFOCH_n_11\,
      \DataOut_stall_reg[8]\ => \GEN_FIFO[13].FIFOCH_n_12\,
      \DataOut_stall_reg[9]\ => \GEN_FIFO[13].FIFOCH_n_13\,
      FIFO_ReadEn_reg => \GEN_FIFO[13].FIFOCH_n_17\,
      \FSM_onehot_fifo_wr_stm_reg[6]\ => \GEN_FIFO[8].FIFOCH_n_24\,
      \FSM_onehot_fifo_wr_stm_reg[7]\ => \GEN_FIFO[13].FIFOCH_n_2\,
      Q(0) => r_FIFO_COUNT_reg_0(5),
      TestFIFO => TestFIFO,
      WDOTime_intl0 => WDOTime_intl0,
      address(3 downto 0) => address(3 downto 0),
      \cnt_fifo_reg[5]\ => \GEN_FIFO[5].FIFOCH_n_0\,
      nRST => nRST,
      o_rd_data(11 downto 0) => \rd_data12[10]_10\(11 downto 0),
      \out\(1) => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      \out\(0) => \FSM_onehot_fifo_wr_stm_reg_n_0_[6]\,
      p_0_in => p_0_in,
      \r_FIFO_COUNT_reg[0]_0\ => \GEN_FIFO[12].FIFOCH_n_1\,
      \r_FIFO_COUNT_reg[0]_1\ => \GEN_FIFO[14].FIFOCH_n_2\,
      \r_FIFO_COUNT_reg[0]_2\ => \GEN_FIFO[15].FIFOCH_n_25\,
      \r_FIFO_COUNT_reg[5]_0\ => \GEN_FIFO[9].FIFOCH_n_0\,
      \r_FIFO_COUNT_reg[5]_1\(0) => full(8),
      \r_FIFO_COUNT_reg[5]_2\ => \GEN_FIFO[2].FIFOCH_n_1\,
      \r_FIFO_COUNT_reg[5]_3\(0) => r_FIFO_COUNT_reg(5),
      \r_FIFO_COUNT_reg[5]_4\(0) => r_FIFO_COUNT_reg_1(5),
      \r_FIFO_COUNT_reg[5]_5\(0) => r_FIFO_COUNT_reg_2(5),
      \r_RD_INDEX_reg[4]_0\ => \GEN_FIFO[13].FIFOCH_n_16\,
      rd_en => rd_en,
      \wr_data_reg[13][11]\(11) => \wr_data_reg_n_0_[13][11]\,
      \wr_data_reg[13][11]\(10) => \wr_data_reg_n_0_[13][10]\,
      \wr_data_reg[13][11]\(9) => \wr_data_reg_n_0_[13][9]\,
      \wr_data_reg[13][11]\(8) => \wr_data_reg_n_0_[13][8]\,
      \wr_data_reg[13][11]\(7) => \wr_data_reg_n_0_[13][7]\,
      \wr_data_reg[13][11]\(6) => \wr_data_reg_n_0_[13][6]\,
      \wr_data_reg[13][11]\(5) => \wr_data_reg_n_0_[13][5]\,
      \wr_data_reg[13][11]\(4) => \wr_data_reg_n_0_[13][4]\,
      \wr_data_reg[13][11]\(3) => \wr_data_reg_n_0_[13][3]\,
      \wr_data_reg[13][11]\(2) => \wr_data_reg_n_0_[13][2]\,
      \wr_data_reg[13][11]\(1) => \wr_data_reg_n_0_[13][1]\,
      \wr_data_reg[13][11]\(0) => \wr_data_reg_n_0_[13][0]\,
      wr_en_reg => wr_en_reg_n_0
    );
\GEN_FIFO[14].FIFOCH\: entity work.base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_4
     port map (
      AR(0) => \GEN_FIFO[0].FIFOCH_n_0\,
      CLK => CLK,
      D(1) => \GEN_FIFO[14].FIFOCH_n_3\,
      D(0) => \GEN_FIFO[14].FIFOCH_n_4\,
      \FIFO_RD_reg[busy]\ => \FSM_onehot_fifo_wr_stm[0]_i_2_n_0\,
      \FSM_onehot_fifo_wr_stm_reg[0]\ => \GEN_FIFO[14].FIFOCH_n_1\,
      PRECvalid => PRECvalid,
      Q(0) => r_FIFO_COUNT_reg_1(5),
      address(3 downto 0) => address(3 downto 0),
      \cnt_fifo_reg[6]\ => \GEN_FIFO[6].FIFOCH_n_1\,
      full(1) => full(15),
      full(0) => full(12),
      nRST => nRST,
      o_rd_data(11 downto 0) => \rd_data12[14]_14\(11 downto 0),
      \out\(2) => \FSM_onehot_fifo_wr_stm_reg_n_0_[6]\,
      \out\(1) => \FSM_onehot_fifo_wr_stm_reg_n_0_[3]\,
      \out\(0) => \FIFO_WR[response]\,
      p_0_in => p_0_in,
      \r_FIFO_COUNT_reg[0]_0\ => \GEN_FIFO[13].FIFOCH_n_16\,
      \r_FIFO_COUNT_reg[5]_0\(0) => r_FIFO_COUNT_reg_0(5),
      \r_FIFO_COUNT_reg[5]_1\ => \GEN_FIFO[8].FIFOCH_n_25\,
      \r_FIFO_COUNT_reg[5]_2\ => \GEN_FIFO[2].FIFOCH_n_1\,
      \r_RD_INDEX_reg[4]_0\ => \GEN_FIFO[14].FIFOCH_n_2\,
      rd_en => rd_en,
      \wr_data_reg[14][11]\(11) => \wr_data_reg_n_0_[14][11]\,
      \wr_data_reg[14][11]\(10) => \wr_data_reg_n_0_[14][10]\,
      \wr_data_reg[14][11]\(9) => \wr_data_reg_n_0_[14][9]\,
      \wr_data_reg[14][11]\(8) => \wr_data_reg_n_0_[14][8]\,
      \wr_data_reg[14][11]\(7) => \wr_data_reg_n_0_[14][7]\,
      \wr_data_reg[14][11]\(6) => \wr_data_reg_n_0_[14][6]\,
      \wr_data_reg[14][11]\(5) => \wr_data_reg_n_0_[14][5]\,
      \wr_data_reg[14][11]\(4) => \wr_data_reg_n_0_[14][4]\,
      \wr_data_reg[14][11]\(3) => \wr_data_reg_n_0_[14][3]\,
      \wr_data_reg[14][11]\(2) => \wr_data_reg_n_0_[14][2]\,
      \wr_data_reg[14][11]\(1) => \wr_data_reg_n_0_[14][1]\,
      \wr_data_reg[14][11]\(0) => \wr_data_reg_n_0_[14][0]\,
      wr_en_reg => wr_en_reg_n_0
    );
\GEN_FIFO[15].FIFOCH\: entity work.base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_5
     port map (
      AR(0) => \GEN_FIFO[0].FIFOCH_n_0\,
      CLK => CLK,
      \DataOut_last_reg[0]\ => \GEN_FIFO[15].FIFOCH_n_1\,
      \DataOut_last_reg[10]\ => \GEN_FIFO[15].FIFOCH_n_11\,
      \DataOut_last_reg[11]\ => \GEN_FIFO[15].FIFOCH_n_12\,
      \DataOut_last_reg[1]\ => \GEN_FIFO[15].FIFOCH_n_2\,
      \DataOut_last_reg[2]\ => \GEN_FIFO[15].FIFOCH_n_3\,
      \DataOut_last_reg[3]\ => \GEN_FIFO[15].FIFOCH_n_4\,
      \DataOut_last_reg[4]\ => \GEN_FIFO[15].FIFOCH_n_5\,
      \DataOut_last_reg[5]\ => \GEN_FIFO[15].FIFOCH_n_6\,
      \DataOut_last_reg[6]\ => \GEN_FIFO[15].FIFOCH_n_7\,
      \DataOut_last_reg[7]\ => \GEN_FIFO[15].FIFOCH_n_8\,
      \DataOut_last_reg[8]\ => \GEN_FIFO[15].FIFOCH_n_9\,
      \DataOut_last_reg[9]\ => \GEN_FIFO[15].FIFOCH_n_10\,
      \DataOut_stall_reg[0]\ => \GEN_FIFO[15].FIFOCH_n_13\,
      \DataOut_stall_reg[10]\ => \GEN_FIFO[15].FIFOCH_n_23\,
      \DataOut_stall_reg[11]\ => \GEN_FIFO[15].FIFOCH_n_24\,
      \DataOut_stall_reg[1]\ => \GEN_FIFO[15].FIFOCH_n_14\,
      \DataOut_stall_reg[2]\ => \GEN_FIFO[15].FIFOCH_n_15\,
      \DataOut_stall_reg[3]\ => \GEN_FIFO[15].FIFOCH_n_16\,
      \DataOut_stall_reg[4]\ => \GEN_FIFO[15].FIFOCH_n_17\,
      \DataOut_stall_reg[5]\ => \GEN_FIFO[15].FIFOCH_n_18\,
      \DataOut_stall_reg[6]\ => \GEN_FIFO[15].FIFOCH_n_19\,
      \DataOut_stall_reg[7]\ => \GEN_FIFO[15].FIFOCH_n_20\,
      \DataOut_stall_reg[8]\ => \GEN_FIFO[15].FIFOCH_n_21\,
      \DataOut_stall_reg[9]\ => \GEN_FIFO[15].FIFOCH_n_22\,
      FIFO_ReadEn_reg => \GEN_FIFO[15].FIFOCH_n_26\,
      Q(0) => r_FIFO_COUNT_reg_2(5),
      address(3 downto 0) => address(3 downto 0),
      \cnt_fifo_reg[5]\ => \GEN_FIFO[7].FIFOCH_n_1\,
      \cnt_fifo_reg[5]_0\ => \GEN_FIFO[8].FIFOCH_n_1\,
      \cnt_fifo_reg[5]_1\ => \GEN_FIFO[8].FIFOCH_n_3\,
      \cnt_fifo_reg[5]_10\ => \GEN_FIFO[8].FIFOCH_n_21\,
      \cnt_fifo_reg[5]_11\ => \GEN_FIFO[8].FIFOCH_n_23\,
      \cnt_fifo_reg[5]_2\ => \GEN_FIFO[8].FIFOCH_n_5\,
      \cnt_fifo_reg[5]_3\ => \GEN_FIFO[8].FIFOCH_n_7\,
      \cnt_fifo_reg[5]_4\ => \GEN_FIFO[8].FIFOCH_n_9\,
      \cnt_fifo_reg[5]_5\ => \GEN_FIFO[8].FIFOCH_n_11\,
      \cnt_fifo_reg[5]_6\ => \GEN_FIFO[8].FIFOCH_n_13\,
      \cnt_fifo_reg[5]_7\ => \GEN_FIFO[8].FIFOCH_n_15\,
      \cnt_fifo_reg[5]_8\ => \GEN_FIFO[8].FIFOCH_n_17\,
      \cnt_fifo_reg[5]_9\ => \GEN_FIFO[8].FIFOCH_n_19\,
      \cnt_fifo_reg[6]\ => \GEN_FIFO[5].FIFOCH_n_1\,
      \cnt_fifo_reg[6]_0\ => \fifo_rd_stm[0]_i_7_n_0\,
      \cnt_fifo_reg[6]_1\ => \GEN_FIFO[5].FIFOCH_n_2\,
      \cnt_fifo_reg[6]_10\ => \GEN_FIFO[5].FIFOCH_n_11\,
      \cnt_fifo_reg[6]_11\ => \GEN_FIFO[5].FIFOCH_n_12\,
      \cnt_fifo_reg[6]_2\ => \GEN_FIFO[5].FIFOCH_n_3\,
      \cnt_fifo_reg[6]_3\ => \GEN_FIFO[5].FIFOCH_n_4\,
      \cnt_fifo_reg[6]_4\ => \GEN_FIFO[5].FIFOCH_n_5\,
      \cnt_fifo_reg[6]_5\ => \GEN_FIFO[5].FIFOCH_n_6\,
      \cnt_fifo_reg[6]_6\ => \GEN_FIFO[5].FIFOCH_n_7\,
      \cnt_fifo_reg[6]_7\ => \GEN_FIFO[5].FIFOCH_n_8\,
      \cnt_fifo_reg[6]_8\ => \GEN_FIFO[5].FIFOCH_n_9\,
      \cnt_fifo_reg[6]_9\ => \GEN_FIFO[5].FIFOCH_n_10\,
      \cnt_fifo_reg[7]\ => \DataOut[11]_i_8_n_0\,
      \cnt_fifo_reg[7]_0\ => \DataOut[11]_i_10_n_0\,
      \cnt_fifo_reg[7]_1\ => \GEN_FIFO[13].FIFOCH_n_4\,
      \cnt_fifo_reg[7]_10\ => \GEN_FIFO[13].FIFOCH_n_13\,
      \cnt_fifo_reg[7]_11\ => \GEN_FIFO[13].FIFOCH_n_14\,
      \cnt_fifo_reg[7]_12\ => \GEN_FIFO[13].FIFOCH_n_15\,
      \cnt_fifo_reg[7]_2\ => \GEN_FIFO[13].FIFOCH_n_5\,
      \cnt_fifo_reg[7]_3\ => \GEN_FIFO[13].FIFOCH_n_6\,
      \cnt_fifo_reg[7]_4\ => \GEN_FIFO[13].FIFOCH_n_7\,
      \cnt_fifo_reg[7]_5\ => \GEN_FIFO[13].FIFOCH_n_8\,
      \cnt_fifo_reg[7]_6\ => \GEN_FIFO[13].FIFOCH_n_9\,
      \cnt_fifo_reg[7]_7\ => \GEN_FIFO[13].FIFOCH_n_10\,
      \cnt_fifo_reg[7]_8\ => \GEN_FIFO[13].FIFOCH_n_11\,
      \cnt_fifo_reg[7]_9\ => \GEN_FIFO[13].FIFOCH_n_12\,
      \cnt_fifo_reg[8]\ => \fifo_rd_stm[0]_i_8_n_0\,
      \cnt_fifo_reg[8]_0\ => \GEN_FIFO[1].FIFOCH_n_0\,
      \cnt_fifo_reg[8]_1\ => \GEN_FIFO[1].FIFOCH_n_1\,
      \cnt_fifo_reg[8]_10\ => \GEN_FIFO[1].FIFOCH_n_10\,
      \cnt_fifo_reg[8]_11\ => \GEN_FIFO[1].FIFOCH_n_11\,
      \cnt_fifo_reg[8]_2\ => \GEN_FIFO[1].FIFOCH_n_2\,
      \cnt_fifo_reg[8]_3\ => \GEN_FIFO[1].FIFOCH_n_3\,
      \cnt_fifo_reg[8]_4\ => \GEN_FIFO[1].FIFOCH_n_4\,
      \cnt_fifo_reg[8]_5\ => \GEN_FIFO[1].FIFOCH_n_5\,
      \cnt_fifo_reg[8]_6\ => \GEN_FIFO[1].FIFOCH_n_6\,
      \cnt_fifo_reg[8]_7\ => \GEN_FIFO[1].FIFOCH_n_7\,
      \cnt_fifo_reg[8]_8\ => \GEN_FIFO[1].FIFOCH_n_8\,
      \cnt_fifo_reg[8]_9\ => \GEN_FIFO[1].FIFOCH_n_9\,
      full(0) => full(15),
      o_rd_data(11 downto 0) => \rd_data12[9]_9\(11 downto 0),
      p_0_in => p_0_in,
      \r_FIFO_COUNT_reg[0]_0\ => \GEN_FIFO[14].FIFOCH_n_2\,
      \r_FIFO_COUNT_reg[5]_0\(0) => r_FIFO_COUNT_reg_1(5),
      \r_RD_INDEX_reg[4]_0\ => \GEN_FIFO[15].FIFOCH_n_25\,
      rd_en => rd_en,
      \wr_data_reg[0][7]\(11 downto 0) => \rd_data12[0]_0\(11 downto 0),
      \wr_data_reg[15][11]\(11) => \wr_data_reg_n_0_[15][11]\,
      \wr_data_reg[15][11]\(10) => \wr_data_reg_n_0_[15][10]\,
      \wr_data_reg[15][11]\(9) => \wr_data_reg_n_0_[15][9]\,
      \wr_data_reg[15][11]\(8) => \wr_data_reg_n_0_[15][8]\,
      \wr_data_reg[15][11]\(7) => \wr_data_reg_n_0_[15][7]\,
      \wr_data_reg[15][11]\(6) => \wr_data_reg_n_0_[15][6]\,
      \wr_data_reg[15][11]\(5) => \wr_data_reg_n_0_[15][5]\,
      \wr_data_reg[15][11]\(4) => \wr_data_reg_n_0_[15][4]\,
      \wr_data_reg[15][11]\(3) => \wr_data_reg_n_0_[15][3]\,
      \wr_data_reg[15][11]\(2) => \wr_data_reg_n_0_[15][2]\,
      \wr_data_reg[15][11]\(1) => \wr_data_reg_n_0_[15][1]\,
      \wr_data_reg[15][11]\(0) => \wr_data_reg_n_0_[15][0]\,
      wr_en_reg => wr_en_reg_n_0
    );
\GEN_FIFO[1].FIFOCH\: entity work.base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_6
     port map (
      AR(0) => \GEN_FIFO[0].FIFOCH_n_0\,
      CLK => CLK,
      \DataOut_stall_reg[0]\ => \GEN_FIFO[1].FIFOCH_n_0\,
      \DataOut_stall_reg[10]\ => \GEN_FIFO[1].FIFOCH_n_10\,
      \DataOut_stall_reg[11]\ => \GEN_FIFO[1].FIFOCH_n_11\,
      \DataOut_stall_reg[1]\ => \GEN_FIFO[1].FIFOCH_n_1\,
      \DataOut_stall_reg[2]\ => \GEN_FIFO[1].FIFOCH_n_2\,
      \DataOut_stall_reg[3]\ => \GEN_FIFO[1].FIFOCH_n_3\,
      \DataOut_stall_reg[4]\ => \GEN_FIFO[1].FIFOCH_n_4\,
      \DataOut_stall_reg[5]\ => \GEN_FIFO[1].FIFOCH_n_5\,
      \DataOut_stall_reg[6]\ => \GEN_FIFO[1].FIFOCH_n_6\,
      \DataOut_stall_reg[7]\ => \GEN_FIFO[1].FIFOCH_n_7\,
      \DataOut_stall_reg[8]\ => \GEN_FIFO[1].FIFOCH_n_8\,
      \DataOut_stall_reg[9]\ => \GEN_FIFO[1].FIFOCH_n_9\,
      Q(11) => \wr_data_reg_n_0_[1][11]\,
      Q(10) => \wr_data_reg_n_0_[1][10]\,
      Q(9) => \wr_data_reg_n_0_[1][9]\,
      Q(8) => \wr_data_reg_n_0_[1][8]\,
      Q(7) => \wr_data_reg_n_0_[1][7]\,
      Q(6) => \wr_data_reg_n_0_[1][6]\,
      Q(5) => \wr_data_reg_n_0_[1][5]\,
      Q(4) => \wr_data_reg_n_0_[1][4]\,
      Q(3) => \wr_data_reg_n_0_[1][3]\,
      Q(2) => \wr_data_reg_n_0_[1][2]\,
      Q(1) => \wr_data_reg_n_0_[1][1]\,
      Q(0) => \wr_data_reg_n_0_[1][0]\,
      address(3 downto 0) => address(3 downto 0),
      \cnt_fifo_reg[5]\ => \GEN_FIFO[5].FIFOCH_n_0\,
      full(0) => full(1),
      o_rd_data(11 downto 0) => \rd_data12[12]_12\(11 downto 0),
      p_0_in => p_0_in,
      rd_en => rd_en,
      wr_en_reg => wr_en_reg_n_0
    );
\GEN_FIFO[2].FIFOCH\: entity work.base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_7
     port map (
      AR(0) => \GEN_FIFO[0].FIFOCH_n_0\,
      CLK => CLK,
      D(1) => \GEN_FIFO[2].FIFOCH_n_27\,
      D(0) => \GEN_FIFO[2].FIFOCH_n_28\,
      \DataOut_stall_reg[0]\ => \GEN_FIFO[2].FIFOCH_n_3\,
      \DataOut_stall_reg[10]\ => \GEN_FIFO[2].FIFOCH_n_25\,
      \DataOut_stall_reg[11]\ => \GEN_FIFO[2].FIFOCH_n_26\,
      \DataOut_stall_reg[1]\ => \GEN_FIFO[2].FIFOCH_n_16\,
      \DataOut_stall_reg[2]\ => \GEN_FIFO[2].FIFOCH_n_17\,
      \DataOut_stall_reg[3]\ => \GEN_FIFO[2].FIFOCH_n_18\,
      \DataOut_stall_reg[4]\ => \GEN_FIFO[2].FIFOCH_n_19\,
      \DataOut_stall_reg[5]\ => \GEN_FIFO[2].FIFOCH_n_20\,
      \DataOut_stall_reg[6]\ => \GEN_FIFO[2].FIFOCH_n_21\,
      \DataOut_stall_reg[7]\ => \GEN_FIFO[2].FIFOCH_n_22\,
      \DataOut_stall_reg[8]\ => \GEN_FIFO[2].FIFOCH_n_23\,
      \DataOut_stall_reg[9]\ => \GEN_FIFO[2].FIFOCH_n_24\,
      \FSM_onehot_fifo_wr_stm_reg[6]\ => \GEN_FIFO[8].FIFOCH_n_24\,
      \FSM_onehot_fifo_wr_stm_reg[6]_0\ => \FSM_onehot_fifo_wr_stm[9]_i_5_n_0\,
      Q(11) => \wr_data_reg_n_0_[2][11]\,
      Q(10) => \wr_data_reg_n_0_[2][10]\,
      Q(9) => \wr_data_reg_n_0_[2][9]\,
      Q(8) => \wr_data_reg_n_0_[2][8]\,
      Q(7) => \wr_data_reg_n_0_[2][7]\,
      Q(6) => \wr_data_reg_n_0_[2][6]\,
      Q(5) => \wr_data_reg_n_0_[2][5]\,
      Q(4) => \wr_data_reg_n_0_[2][4]\,
      Q(3) => \wr_data_reg_n_0_[2][3]\,
      Q(2) => \wr_data_reg_n_0_[2][2]\,
      Q(1) => \wr_data_reg_n_0_[2][1]\,
      Q(0) => \wr_data_reg_n_0_[2][0]\,
      \WDONBR_intl_reg[1]\ => \GEN_FIFO[2].FIFOCH_n_1\,
      \WDONBR_intl_reg[1]_0\ => \GEN_FIFO[2].FIFOCH_n_2\,
      \WDOTime_intl_reg[63]\ => \GEN_FIFO[2].FIFOCH_n_0\,
      address(3 downto 0) => address(3 downto 0),
      \cnt_fifo_reg[5]\ => \DataOut[11]_i_5_n_0\,
      \cnt_fifo_reg[6]\ => \GEN_FIFO[6].FIFOCH_n_1\,
      \cnt_fifo_reg[6]_0\ => \GEN_FIFO[15].FIFOCH_n_13\,
      \cnt_fifo_reg[6]_1\ => \GEN_FIFO[15].FIFOCH_n_14\,
      \cnt_fifo_reg[6]_10\ => \GEN_FIFO[15].FIFOCH_n_23\,
      \cnt_fifo_reg[6]_11\ => \GEN_FIFO[15].FIFOCH_n_24\,
      \cnt_fifo_reg[6]_2\ => \GEN_FIFO[15].FIFOCH_n_15\,
      \cnt_fifo_reg[6]_3\ => \GEN_FIFO[15].FIFOCH_n_16\,
      \cnt_fifo_reg[6]_4\ => \GEN_FIFO[15].FIFOCH_n_17\,
      \cnt_fifo_reg[6]_5\ => \GEN_FIFO[15].FIFOCH_n_18\,
      \cnt_fifo_reg[6]_6\ => \GEN_FIFO[15].FIFOCH_n_19\,
      \cnt_fifo_reg[6]_7\ => \GEN_FIFO[15].FIFOCH_n_20\,
      \cnt_fifo_reg[6]_8\ => \GEN_FIFO[15].FIFOCH_n_21\,
      \cnt_fifo_reg[6]_9\ => \GEN_FIFO[15].FIFOCH_n_22\,
      \cnt_fifo_reg[7]\ => \GEN_FIFO[13].FIFOCH_n_4\,
      \cnt_fifo_reg[7]_0\ => \GEN_FIFO[13].FIFOCH_n_5\,
      \cnt_fifo_reg[7]_1\ => \GEN_FIFO[13].FIFOCH_n_6\,
      \cnt_fifo_reg[7]_10\ => \GEN_FIFO[13].FIFOCH_n_15\,
      \cnt_fifo_reg[7]_2\ => \GEN_FIFO[13].FIFOCH_n_7\,
      \cnt_fifo_reg[7]_3\ => \GEN_FIFO[13].FIFOCH_n_8\,
      \cnt_fifo_reg[7]_4\ => \GEN_FIFO[13].FIFOCH_n_9\,
      \cnt_fifo_reg[7]_5\ => \GEN_FIFO[13].FIFOCH_n_10\,
      \cnt_fifo_reg[7]_6\ => \GEN_FIFO[13].FIFOCH_n_11\,
      \cnt_fifo_reg[7]_7\ => \GEN_FIFO[13].FIFOCH_n_12\,
      \cnt_fifo_reg[7]_8\ => \GEN_FIFO[13].FIFOCH_n_13\,
      \cnt_fifo_reg[7]_9\ => \GEN_FIFO[13].FIFOCH_n_14\,
      \cnt_fifo_reg[8]\ => \GEN_FIFO[8].FIFOCH_n_0\,
      \cnt_fifo_reg[8]_0\ => \GEN_FIFO[1].FIFOCH_n_0\,
      \cnt_fifo_reg[8]_1\ => \GEN_FIFO[8].FIFOCH_n_2\,
      \cnt_fifo_reg[8]_10\ => \GEN_FIFO[1].FIFOCH_n_5\,
      \cnt_fifo_reg[8]_11\ => \GEN_FIFO[8].FIFOCH_n_12\,
      \cnt_fifo_reg[8]_12\ => \GEN_FIFO[1].FIFOCH_n_6\,
      \cnt_fifo_reg[8]_13\ => \GEN_FIFO[8].FIFOCH_n_14\,
      \cnt_fifo_reg[8]_14\ => \GEN_FIFO[1].FIFOCH_n_7\,
      \cnt_fifo_reg[8]_15\ => \GEN_FIFO[8].FIFOCH_n_16\,
      \cnt_fifo_reg[8]_16\ => \GEN_FIFO[1].FIFOCH_n_8\,
      \cnt_fifo_reg[8]_17\ => \GEN_FIFO[8].FIFOCH_n_18\,
      \cnt_fifo_reg[8]_18\ => \GEN_FIFO[1].FIFOCH_n_9\,
      \cnt_fifo_reg[8]_19\ => \GEN_FIFO[8].FIFOCH_n_20\,
      \cnt_fifo_reg[8]_2\ => \GEN_FIFO[1].FIFOCH_n_1\,
      \cnt_fifo_reg[8]_20\ => \GEN_FIFO[1].FIFOCH_n_10\,
      \cnt_fifo_reg[8]_21\ => \GEN_FIFO[8].FIFOCH_n_22\,
      \cnt_fifo_reg[8]_22\ => \GEN_FIFO[1].FIFOCH_n_11\,
      \cnt_fifo_reg[8]_3\ => \GEN_FIFO[8].FIFOCH_n_4\,
      \cnt_fifo_reg[8]_4\ => \GEN_FIFO[1].FIFOCH_n_2\,
      \cnt_fifo_reg[8]_5\ => \GEN_FIFO[8].FIFOCH_n_6\,
      \cnt_fifo_reg[8]_6\ => \GEN_FIFO[1].FIFOCH_n_3\,
      \cnt_fifo_reg[8]_7\ => \GEN_FIFO[8].FIFOCH_n_8\,
      \cnt_fifo_reg[8]_8\ => \GEN_FIFO[1].FIFOCH_n_4\,
      \cnt_fifo_reg[8]_9\ => \GEN_FIFO[8].FIFOCH_n_10\,
      nRST => nRST,
      o_rd_data(11 downto 0) => \rd_data12[2]_2\(11 downto 0),
      \out\(2) => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      \out\(1) => \FSM_onehot_fifo_wr_stm_reg_n_0_[6]\,
      \out\(0) => \FSM_onehot_fifo_wr_stm_reg_n_0_[3]\,
      p_0_in => p_0_in,
      \r_FIFO_COUNT_reg[5]_0\ => \GEN_FIFO[9].FIFOCH_n_0\,
      \r_FIFO_COUNT_reg[5]_1\ => \GEN_FIFO[13].FIFOCH_n_2\,
      \r_FIFO_COUNT_reg[5]_2\ => \GEN_FIFO[12].FIFOCH_n_2\,
      \r_FIFO_COUNT_reg[5]_3\(3) => full(8),
      \r_FIFO_COUNT_reg[5]_3\(2) => full(5),
      \r_FIFO_COUNT_reg[5]_3\(1) => full(3),
      \r_FIFO_COUNT_reg[5]_3\(0) => full(1),
      \r_FIFO_COUNT_reg[5]_4\ => \GEN_FIFO[8].FIFOCH_n_25\,
      \r_FIFO_COUNT_reg[5]_5\ => \GEN_FIFO[14].FIFOCH_n_1\,
      \r_FIFO_COUNT_reg[5]_6\ => \GEN_FIFO[0].FIFOCH_n_1\,
      \r_FIFO_COUNT_reg[5]_7\ => \GEN_FIFO[4].FIFOCH_n_1\,
      rd_en => rd_en,
      wr_en_reg => wr_en_reg_n_0
    );
\GEN_FIFO[3].FIFOCH\: entity work.base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_8
     port map (
      AR(0) => \GEN_FIFO[0].FIFOCH_n_0\,
      CLK => CLK,
      D(11 downto 0) => p_1_in(11 downto 0),
      \DataOut_intlH_reg[11]\(11 downto 0) => DataOut_intlH(11 downto 0),
      \DataOut_reg[11]\(11) => \GEN_FIFO[3].FIFOCH_n_12\,
      \DataOut_reg[11]\(10) => \GEN_FIFO[3].FIFOCH_n_13\,
      \DataOut_reg[11]\(9) => \GEN_FIFO[3].FIFOCH_n_14\,
      \DataOut_reg[11]\(8) => \GEN_FIFO[3].FIFOCH_n_15\,
      \DataOut_reg[11]\(7) => \GEN_FIFO[3].FIFOCH_n_16\,
      \DataOut_reg[11]\(6) => \GEN_FIFO[3].FIFOCH_n_17\,
      \DataOut_reg[11]\(5) => \GEN_FIFO[3].FIFOCH_n_18\,
      \DataOut_reg[11]\(4) => \GEN_FIFO[3].FIFOCH_n_19\,
      \DataOut_reg[11]\(3) => \GEN_FIFO[3].FIFOCH_n_20\,
      \DataOut_reg[11]\(2) => \GEN_FIFO[3].FIFOCH_n_21\,
      \DataOut_reg[11]\(1) => \GEN_FIFO[3].FIFOCH_n_22\,
      \DataOut_reg[11]\(0) => \GEN_FIFO[3].FIFOCH_n_23\,
      \DataOut_stall_reg[11]\(11 downto 0) => \rd_data12[3]_3\(11 downto 0),
      Q(0) => \fifo_rd_stm_reg_n_0_[0]\,
      \WDONBR_intl_reg[1]\(0) => full(3),
      address(3 downto 0) => address(3 downto 0),
      \cnt_fifo_reg[5]\ => \GEN_FIFO[7].FIFOCH_n_1\,
      \cnt_fifo_reg[5]_0\ => \DataOut[11]_i_5_n_0\,
      \fifo_rd_stm_reg[2]\ => \DataOut[11]_i_6_n_0\,
      o_rd_data(11 downto 0) => \rd_data12[2]_2\(11 downto 0),
      p_0_in => p_0_in,
      rd_en => rd_en,
      \rdy_state_reg[0]\ => \DataOut[0]_i_2_n_0\,
      \rdy_state_reg[0]_0\ => \DataOut[1]_i_2_n_0\,
      \rdy_state_reg[0]_1\ => \DataOut[2]_i_2_n_0\,
      \rdy_state_reg[0]_10\ => \DataOut[11]_i_2_n_0\,
      \rdy_state_reg[0]_2\ => \DataOut[3]_i_2_n_0\,
      \rdy_state_reg[0]_3\ => \DataOut[4]_i_2_n_0\,
      \rdy_state_reg[0]_4\ => \DataOut[5]_i_2_n_0\,
      \rdy_state_reg[0]_5\ => \DataOut[6]_i_2_n_0\,
      \rdy_state_reg[0]_6\ => \DataOut[7]_i_2_n_0\,
      \rdy_state_reg[0]_7\ => \DataOut[8]_i_2_n_0\,
      \rdy_state_reg[0]_8\ => \DataOut[9]_i_2_n_0\,
      \rdy_state_reg[0]_9\ => \DataOut[10]_i_2_n_0\,
      \wr_data_reg[11][7]\(11 downto 0) => \rd_data12[11]_11\(11 downto 0),
      \wr_data_reg[3][11]\(11) => \wr_data_reg_n_0_[3][11]\,
      \wr_data_reg[3][11]\(10) => \wr_data_reg_n_0_[3][10]\,
      \wr_data_reg[3][11]\(9) => \wr_data_reg_n_0_[3][9]\,
      \wr_data_reg[3][11]\(8) => \wr_data_reg_n_0_[3][8]\,
      \wr_data_reg[3][11]\(7) => \wr_data_reg_n_0_[3][7]\,
      \wr_data_reg[3][11]\(6) => \wr_data_reg_n_0_[3][6]\,
      \wr_data_reg[3][11]\(5) => \wr_data_reg_n_0_[3][5]\,
      \wr_data_reg[3][11]\(4) => \wr_data_reg_n_0_[3][4]\,
      \wr_data_reg[3][11]\(3) => \wr_data_reg_n_0_[3][3]\,
      \wr_data_reg[3][11]\(2) => \wr_data_reg_n_0_[3][2]\,
      \wr_data_reg[3][11]\(1) => \wr_data_reg_n_0_[3][1]\,
      \wr_data_reg[3][11]\(0) => \wr_data_reg_n_0_[3][0]\,
      \wr_data_reg[9][1]\ => \GEN_FIFO[15].FIFOCH_n_1\,
      \wr_data_reg[9][1]_0\ => \GEN_FIFO[15].FIFOCH_n_2\,
      \wr_data_reg[9][1]_1\ => \GEN_FIFO[15].FIFOCH_n_3\,
      \wr_data_reg[9][1]_2\ => \GEN_FIFO[15].FIFOCH_n_4\,
      \wr_data_reg[9][1]_3\ => \GEN_FIFO[15].FIFOCH_n_5\,
      \wr_data_reg[9][1]_4\ => \GEN_FIFO[15].FIFOCH_n_6\,
      \wr_data_reg[9][7]\ => \GEN_FIFO[15].FIFOCH_n_7\,
      \wr_data_reg[9][7]_0\ => \GEN_FIFO[15].FIFOCH_n_8\,
      \wr_data_reg[9][7]_1\ => \GEN_FIFO[15].FIFOCH_n_9\,
      \wr_data_reg[9][7]_2\ => \GEN_FIFO[15].FIFOCH_n_10\,
      \wr_data_reg[9][7]_3\ => \GEN_FIFO[15].FIFOCH_n_11\,
      \wr_data_reg[9][7]_4\ => \GEN_FIFO[15].FIFOCH_n_12\,
      wr_en_reg => wr_en_reg_n_0
    );
\GEN_FIFO[4].FIFOCH\: entity work.base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_9
     port map (
      AR(0) => \GEN_FIFO[0].FIFOCH_n_0\,
      CLK => CLK,
      Q(0) => r_FIFO_COUNT_reg_4(5),
      \WDONBR_intl_reg[1]\ => \GEN_FIFO[4].FIFOCH_n_1\,
      address(3 downto 0) => address(3 downto 0),
      o_rd_data(11 downto 0) => \rd_data12[4]_4\(11 downto 0),
      p_0_in => p_0_in,
      \r_FIFO_COUNT_reg[0]_0\ => \GEN_FIFO[7].FIFOCH_n_2\,
      \r_RD_INDEX_reg[4]_0\ => \GEN_FIFO[4].FIFOCH_n_0\,
      rd_en => rd_en,
      \wr_data_reg[4][11]\(11) => \wr_data_reg_n_0_[4][11]\,
      \wr_data_reg[4][11]\(10) => \wr_data_reg_n_0_[4][10]\,
      \wr_data_reg[4][11]\(9) => \wr_data_reg_n_0_[4][9]\,
      \wr_data_reg[4][11]\(8) => \wr_data_reg_n_0_[4][8]\,
      \wr_data_reg[4][11]\(7) => \wr_data_reg_n_0_[4][7]\,
      \wr_data_reg[4][11]\(6) => \wr_data_reg_n_0_[4][6]\,
      \wr_data_reg[4][11]\(5) => \wr_data_reg_n_0_[4][5]\,
      \wr_data_reg[4][11]\(4) => \wr_data_reg_n_0_[4][4]\,
      \wr_data_reg[4][11]\(3) => \wr_data_reg_n_0_[4][3]\,
      \wr_data_reg[4][11]\(2) => \wr_data_reg_n_0_[4][2]\,
      \wr_data_reg[4][11]\(1) => \wr_data_reg_n_0_[4][1]\,
      \wr_data_reg[4][11]\(0) => \wr_data_reg_n_0_[4][0]\,
      wr_en_reg => wr_en_reg_n_0
    );
\GEN_FIFO[5].FIFOCH\: entity work.base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_10
     port map (
      AR(0) => \GEN_FIFO[0].FIFOCH_n_0\,
      CLK => CLK,
      \DataOut_last_reg[0]\ => \GEN_FIFO[5].FIFOCH_n_1\,
      \DataOut_last_reg[10]\ => \GEN_FIFO[5].FIFOCH_n_11\,
      \DataOut_last_reg[11]\ => \GEN_FIFO[5].FIFOCH_n_12\,
      \DataOut_last_reg[1]\ => \GEN_FIFO[5].FIFOCH_n_2\,
      \DataOut_last_reg[2]\ => \GEN_FIFO[5].FIFOCH_n_3\,
      \DataOut_last_reg[3]\ => \GEN_FIFO[5].FIFOCH_n_4\,
      \DataOut_last_reg[4]\ => \GEN_FIFO[5].FIFOCH_n_5\,
      \DataOut_last_reg[5]\ => \GEN_FIFO[5].FIFOCH_n_6\,
      \DataOut_last_reg[6]\ => \GEN_FIFO[5].FIFOCH_n_7\,
      \DataOut_last_reg[7]\ => \GEN_FIFO[5].FIFOCH_n_8\,
      \DataOut_last_reg[8]\ => \GEN_FIFO[5].FIFOCH_n_9\,
      \DataOut_last_reg[9]\ => \GEN_FIFO[5].FIFOCH_n_10\,
      Q(11) => \wr_data_reg_n_0_[5][11]\,
      Q(10) => \wr_data_reg_n_0_[5][10]\,
      Q(9) => \wr_data_reg_n_0_[5][9]\,
      Q(8) => \wr_data_reg_n_0_[5][8]\,
      Q(7) => \wr_data_reg_n_0_[5][7]\,
      Q(6) => \wr_data_reg_n_0_[5][6]\,
      Q(5) => \wr_data_reg_n_0_[5][5]\,
      Q(4) => \wr_data_reg_n_0_[5][4]\,
      Q(3) => \wr_data_reg_n_0_[5][3]\,
      Q(2) => \wr_data_reg_n_0_[5][2]\,
      Q(1) => \wr_data_reg_n_0_[5][1]\,
      Q(0) => \wr_data_reg_n_0_[5][0]\,
      \WDONBR_intl_reg[1]\(0) => full(5),
      address(3 downto 0) => address(3 downto 0),
      o_rd_data(11 downto 0) => \rd_data12[7]_7\(11 downto 0),
      p_0_in => p_0_in,
      \r_RD_INDEX_reg[4]_0\ => \GEN_FIFO[5].FIFOCH_n_0\,
      rd_en => rd_en,
      \wr_data_reg[4][7]\(11 downto 0) => \rd_data12[4]_4\(11 downto 0),
      \wr_data_reg[6][7]\(11 downto 0) => \rd_data12[6]_6\(11 downto 0),
      wr_en_reg => wr_en_reg_n_0
    );
\GEN_FIFO[6].FIFOCH\: entity work.base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_11
     port map (
      AR(0) => \GEN_FIFO[0].FIFOCH_n_0\,
      CLK => CLK,
      Q(0) => r_FIFO_COUNT_reg_3(5),
      address(3 downto 0) => address(3 downto 0),
      o_rd_data(11 downto 0) => \rd_data12[6]_6\(11 downto 0),
      p_0_in => p_0_in,
      \r_RD_INDEX_reg[4]_0\ => \GEN_FIFO[6].FIFOCH_n_1\,
      \r_RD_INDEX_reg[4]_1\ => \GEN_FIFO[6].FIFOCH_n_2\,
      rd_en => rd_en,
      \wr_data_reg[6][11]\(11) => \wr_data_reg_n_0_[6][11]\,
      \wr_data_reg[6][11]\(10) => \wr_data_reg_n_0_[6][10]\,
      \wr_data_reg[6][11]\(9) => \wr_data_reg_n_0_[6][9]\,
      \wr_data_reg[6][11]\(8) => \wr_data_reg_n_0_[6][8]\,
      \wr_data_reg[6][11]\(7) => \wr_data_reg_n_0_[6][7]\,
      \wr_data_reg[6][11]\(6) => \wr_data_reg_n_0_[6][6]\,
      \wr_data_reg[6][11]\(5) => \wr_data_reg_n_0_[6][5]\,
      \wr_data_reg[6][11]\(4) => \wr_data_reg_n_0_[6][4]\,
      \wr_data_reg[6][11]\(3) => \wr_data_reg_n_0_[6][3]\,
      \wr_data_reg[6][11]\(2) => \wr_data_reg_n_0_[6][2]\,
      \wr_data_reg[6][11]\(1) => \wr_data_reg_n_0_[6][1]\,
      \wr_data_reg[6][11]\(0) => \wr_data_reg_n_0_[6][0]\,
      wr_en_reg => wr_en_reg_n_0
    );
\GEN_FIFO[7].FIFOCH\: entity work.base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_12
     port map (
      AR(0) => \GEN_FIFO[0].FIFOCH_n_0\,
      CLK => CLK,
      Q(0) => r_FIFO_COUNT_reg_4(5),
      address(3 downto 0) => address(3 downto 0),
      o_rd_data(11 downto 0) => \rd_data12[7]_7\(11 downto 0),
      p_0_in => p_0_in,
      \r_RD_INDEX_reg[4]_0\ => \GEN_FIFO[7].FIFOCH_n_1\,
      \r_RD_INDEX_reg[4]_1\ => \GEN_FIFO[7].FIFOCH_n_2\,
      rd_en => rd_en,
      \wr_data_reg[7][11]\(11) => \wr_data_reg_n_0_[7][11]\,
      \wr_data_reg[7][11]\(10) => \wr_data_reg_n_0_[7][10]\,
      \wr_data_reg[7][11]\(9) => \wr_data_reg_n_0_[7][9]\,
      \wr_data_reg[7][11]\(8) => \wr_data_reg_n_0_[7][8]\,
      \wr_data_reg[7][11]\(7) => \wr_data_reg_n_0_[7][7]\,
      \wr_data_reg[7][11]\(6) => \wr_data_reg_n_0_[7][6]\,
      \wr_data_reg[7][11]\(5) => \wr_data_reg_n_0_[7][5]\,
      \wr_data_reg[7][11]\(4) => \wr_data_reg_n_0_[7][4]\,
      \wr_data_reg[7][11]\(3) => \wr_data_reg_n_0_[7][3]\,
      \wr_data_reg[7][11]\(2) => \wr_data_reg_n_0_[7][2]\,
      \wr_data_reg[7][11]\(1) => \wr_data_reg_n_0_[7][1]\,
      \wr_data_reg[7][11]\(0) => \wr_data_reg_n_0_[7][0]\,
      wr_en_reg => wr_en_reg_n_0
    );
\GEN_FIFO[8].FIFOCH\: entity work.base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_13
     port map (
      AR(0) => \GEN_FIFO[0].FIFOCH_n_0\,
      CLK => CLK,
      \DIGTime_intl_reg[63]\ => \GEN_FIFO[8].FIFOCH_n_27\,
      \DataOut_last_reg[0]\ => \GEN_FIFO[8].FIFOCH_n_1\,
      \DataOut_last_reg[10]\ => \GEN_FIFO[8].FIFOCH_n_21\,
      \DataOut_last_reg[11]\ => \GEN_FIFO[8].FIFOCH_n_23\,
      \DataOut_last_reg[1]\ => \GEN_FIFO[8].FIFOCH_n_3\,
      \DataOut_last_reg[2]\ => \GEN_FIFO[8].FIFOCH_n_5\,
      \DataOut_last_reg[3]\ => \GEN_FIFO[8].FIFOCH_n_7\,
      \DataOut_last_reg[4]\ => \GEN_FIFO[8].FIFOCH_n_9\,
      \DataOut_last_reg[5]\ => \GEN_FIFO[8].FIFOCH_n_11\,
      \DataOut_last_reg[6]\ => \GEN_FIFO[8].FIFOCH_n_13\,
      \DataOut_last_reg[7]\ => \GEN_FIFO[8].FIFOCH_n_15\,
      \DataOut_last_reg[8]\ => \GEN_FIFO[8].FIFOCH_n_17\,
      \DataOut_last_reg[9]\ => \GEN_FIFO[8].FIFOCH_n_19\,
      \DataOut_stall_reg[0]\ => \GEN_FIFO[8].FIFOCH_n_0\,
      \DataOut_stall_reg[10]\ => \GEN_FIFO[8].FIFOCH_n_20\,
      \DataOut_stall_reg[11]\ => \GEN_FIFO[8].FIFOCH_n_22\,
      \DataOut_stall_reg[1]\ => \GEN_FIFO[8].FIFOCH_n_2\,
      \DataOut_stall_reg[2]\ => \GEN_FIFO[8].FIFOCH_n_4\,
      \DataOut_stall_reg[3]\ => \GEN_FIFO[8].FIFOCH_n_6\,
      \DataOut_stall_reg[4]\ => \GEN_FIFO[8].FIFOCH_n_8\,
      \DataOut_stall_reg[5]\ => \GEN_FIFO[8].FIFOCH_n_10\,
      \DataOut_stall_reg[6]\ => \GEN_FIFO[8].FIFOCH_n_12\,
      \DataOut_stall_reg[7]\ => \GEN_FIFO[8].FIFOCH_n_14\,
      \DataOut_stall_reg[8]\ => \GEN_FIFO[8].FIFOCH_n_16\,
      \DataOut_stall_reg[9]\ => \GEN_FIFO[8].FIFOCH_n_18\,
      \FSM_onehot_fifo_wr_stm_reg[4]\ => \GEN_FIFO[8].FIFOCH_n_25\,
      Q(11) => \wr_data_reg_n_0_[8][11]\,
      Q(10) => \wr_data_reg_n_0_[8][10]\,
      Q(9) => \wr_data_reg_n_0_[8][9]\,
      Q(8) => \wr_data_reg_n_0_[8][8]\,
      Q(7) => \wr_data_reg_n_0_[8][7]\,
      Q(6) => \wr_data_reg_n_0_[8][6]\,
      Q(5) => \wr_data_reg_n_0_[8][5]\,
      Q(4) => \wr_data_reg_n_0_[8][4]\,
      Q(3) => \wr_data_reg_n_0_[8][3]\,
      Q(2) => \wr_data_reg_n_0_[8][2]\,
      Q(1) => \wr_data_reg_n_0_[8][1]\,
      Q(0) => \wr_data_reg_n_0_[8][0]\,
      TestFIFO => TestFIFO,
      \WDOTime_intl_reg[63]\ => \GEN_FIFO[8].FIFOCH_n_24\,
      address(3 downto 0) => address(3 downto 0),
      \cnt_fifo_reg[5]\ => \GEN_FIFO[4].FIFOCH_n_0\,
      \cnt_fifo_reg[5]_0\ => \GEN_FIFO[5].FIFOCH_n_0\,
      \cnt_fifo_reg[6]\ => \GEN_FIFO[5].FIFOCH_n_1\,
      \cnt_fifo_reg[6]_0\ => \GEN_FIFO[5].FIFOCH_n_2\,
      \cnt_fifo_reg[6]_1\ => \GEN_FIFO[5].FIFOCH_n_3\,
      \cnt_fifo_reg[6]_10\ => \GEN_FIFO[5].FIFOCH_n_12\,
      \cnt_fifo_reg[6]_2\ => \GEN_FIFO[5].FIFOCH_n_4\,
      \cnt_fifo_reg[6]_3\ => \GEN_FIFO[5].FIFOCH_n_5\,
      \cnt_fifo_reg[6]_4\ => \GEN_FIFO[5].FIFOCH_n_6\,
      \cnt_fifo_reg[6]_5\ => \GEN_FIFO[5].FIFOCH_n_7\,
      \cnt_fifo_reg[6]_6\ => \GEN_FIFO[5].FIFOCH_n_8\,
      \cnt_fifo_reg[6]_7\ => \GEN_FIFO[5].FIFOCH_n_9\,
      \cnt_fifo_reg[6]_8\ => \GEN_FIFO[5].FIFOCH_n_10\,
      \cnt_fifo_reg[6]_9\ => \GEN_FIFO[5].FIFOCH_n_11\,
      data3(0) => data3(31),
      full(3 downto 0) => full(12 downto 9),
      nRST => nRST,
      o_rd_data(11 downto 0) => \rd_data12[9]_9\(11 downto 0),
      \out\(1) => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      \out\(0) => \FSM_onehot_fifo_wr_stm_reg_n_0_[6]\,
      p_0_in => p_0_in,
      \r_FIFO_COUNT_reg[5]_0\ => \GEN_FIFO[13].FIFOCH_n_2\,
      \r_FIFO_COUNT_reg[5]_1\ => \GEN_FIFO[2].FIFOCH_n_1\,
      \r_WR_INDEX_reg[4]_0\(0) => full(8),
      rd_en => rd_en,
      \wr_data_reg[14][7]\(11 downto 0) => \rd_data12[14]_14\(11 downto 0),
      wr_en_reg => wr_en_reg_n_0
    );
\GEN_FIFO[9].FIFOCH\: entity work.base_zynq_FifoManagerV4_0_0_module_fifo_regs_no_flags_14
     port map (
      AR(0) => \GEN_FIFO[0].FIFOCH_n_0\,
      CLK => CLK,
      Q(11) => \wr_data_reg_n_0_[9][11]\,
      Q(10) => \wr_data_reg_n_0_[9][10]\,
      Q(9) => \wr_data_reg_n_0_[9][9]\,
      Q(8) => \wr_data_reg_n_0_[9][8]\,
      Q(7) => \wr_data_reg_n_0_[9][7]\,
      Q(6) => \wr_data_reg_n_0_[9][6]\,
      Q(5) => \wr_data_reg_n_0_[9][5]\,
      Q(4) => \wr_data_reg_n_0_[9][4]\,
      Q(3) => \wr_data_reg_n_0_[9][3]\,
      Q(2) => \wr_data_reg_n_0_[9][2]\,
      Q(1) => \wr_data_reg_n_0_[9][1]\,
      Q(0) => \wr_data_reg_n_0_[9][0]\,
      \WDOTime_intl_reg[63]\ => \GEN_FIFO[9].FIFOCH_n_0\,
      address(3 downto 0) => address(3 downto 0),
      \cnt_fifo_reg[5]\ => \GEN_FIFO[5].FIFOCH_n_0\,
      full(0) => full(9),
      o_rd_data(11 downto 0) => \rd_data12[9]_9\(11 downto 0),
      p_0_in => p_0_in,
      \r_FIFO_COUNT_reg[5]_0\(2 downto 0) => full(12 downto 10),
      rd_en => rd_en,
      wr_en_reg => wr_en_reg_n_0
    );
\Trigger_intl[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_TrigInfo(10),
      O => \Trigger_intl[10]_i_1_n_0\
    );
\Trigger_intl[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_TrigInfo(3),
      O => \Trigger_intl[3]_i_1_n_0\
    );
\Trigger_intl[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_TrigInfo(4),
      O => \Trigger_intl[4]_i_1_n_0\
    );
\Trigger_intl[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_TrigInfo(5),
      O => \Trigger_intl[5]_i_1_n_0\
    );
\Trigger_intl[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_TrigInfo(6),
      O => \Trigger_intl[6]_i_1_n_0\
    );
\Trigger_intl[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_TrigInfo(9),
      O => \Trigger_intl[9]_i_1_n_0\
    );
\Trigger_intl_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_TrigInfo(0),
      Q => Trigger_intl(0),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\Trigger_intl_reg[10]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \Trigger_intl[10]_i_1_n_0\,
      Q => Trigger_intl(10),
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\Trigger_intl_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_TrigInfo(11),
      Q => Trigger_intl(11),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\Trigger_intl_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_TrigInfo(1),
      Q => Trigger_intl(1),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\Trigger_intl_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_TrigInfo(2),
      Q => Trigger_intl(2),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\Trigger_intl_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \Trigger_intl[3]_i_1_n_0\,
      Q => Trigger_intl(3),
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\Trigger_intl_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \Trigger_intl[4]_i_1_n_0\,
      Q => Trigger_intl(4),
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\Trigger_intl_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \Trigger_intl[5]_i_1_n_0\,
      Q => Trigger_intl(5),
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\Trigger_intl_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \Trigger_intl[6]_i_1_n_0\,
      Q => Trigger_intl(6),
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\Trigger_intl_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_TrigInfo(7),
      Q => Trigger_intl(7),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\Trigger_intl_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_TrigInfo(8),
      Q => Trigger_intl(8),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\Trigger_intl_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \Trigger_intl[9]_i_1_n_0\,
      Q => Trigger_intl(9),
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDONBR_intl[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_WdoAddr(1),
      O => \WDONBR_intl[1]_i_1_n_0\
    );
\WDONBR_intl[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_WdoAddr(2),
      O => \WDONBR_intl[2]_i_1_n_0\
    );
\WDONBR_intl[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_WdoAddr(4),
      O => \WDONBR_intl[4]_i_1_n_0\
    );
\WDONBR_intl[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_WdoAddr(5),
      O => \WDONBR_intl[5]_i_1_n_0\
    );
\WDONBR_intl[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_WdoAddr(7),
      O => \WDONBR_intl[7]_i_1_n_0\
    );
\WDONBR_intl[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_WdoAddr(8),
      O => \WDONBR_intl[8]_i_1_n_0\
    );
\WDONBR_intl_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_WdoAddr(0),
      Q => WDONBR_intl(0),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDONBR_intl_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDONBR_intl[1]_i_1_n_0\,
      Q => WDONBR_intl(1),
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDONBR_intl_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDONBR_intl[2]_i_1_n_0\,
      Q => WDONBR_intl(2),
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDONBR_intl_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_WdoAddr(3),
      Q => WDONBR_intl(3),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDONBR_intl_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDONBR_intl[4]_i_1_n_0\,
      Q => WDONBR_intl(4),
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDONBR_intl_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDONBR_intl[5]_i_1_n_0\,
      Q => WDONBR_intl(5),
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDONBR_intl_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_WdoAddr(6),
      Q => WDONBR_intl(6),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDONBR_intl_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDONBR_intl[7]_i_1_n_0\,
      Q => WDONBR_intl(7),
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDONBR_intl_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDONBR_intl[8]_i_1_n_0\,
      Q => WDONBR_intl(8),
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(0),
      O => \WDOTime_intl[0]_i_1_n_0\
    );
\WDOTime_intl[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(10),
      O => \WDOTime_intl[10]_i_1_n_0\
    );
\WDOTime_intl[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(11),
      O => \WDOTime_intl[11]_i_1_n_0\
    );
\WDOTime_intl[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(12),
      O => \WDOTime_intl[12]_i_1_n_0\
    );
\WDOTime_intl[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(13),
      O => \WDOTime_intl[13]_i_1_n_0\
    );
\WDOTime_intl[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(14),
      O => \WDOTime_intl[14]_i_1_n_0\
    );
\WDOTime_intl[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(15),
      O => \WDOTime_intl[15]_i_1_n_0\
    );
\WDOTime_intl[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(16),
      O => \WDOTime_intl[16]_i_1_n_0\
    );
\WDOTime_intl[17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(17),
      O => \WDOTime_intl[17]_i_1_n_0\
    );
\WDOTime_intl[18]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(18),
      O => \WDOTime_intl[18]_i_1_n_0\
    );
\WDOTime_intl[19]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(19),
      O => \WDOTime_intl[19]_i_1_n_0\
    );
\WDOTime_intl[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(1),
      O => \WDOTime_intl[1]_i_1_n_0\
    );
\WDOTime_intl[20]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(20),
      O => \WDOTime_intl[20]_i_1_n_0\
    );
\WDOTime_intl[21]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(21),
      O => \WDOTime_intl[21]_i_1_n_0\
    );
\WDOTime_intl[22]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(22),
      O => \WDOTime_intl[22]_i_1_n_0\
    );
\WDOTime_intl[23]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(23),
      O => \WDOTime_intl[23]_i_1_n_0\
    );
\WDOTime_intl[24]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(24),
      O => \WDOTime_intl[24]_i_1_n_0\
    );
\WDOTime_intl[25]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(25),
      O => \WDOTime_intl[25]_i_1_n_0\
    );
\WDOTime_intl[26]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(26),
      O => \WDOTime_intl[26]_i_1_n_0\
    );
\WDOTime_intl[27]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(27),
      O => \WDOTime_intl[27]_i_1_n_0\
    );
\WDOTime_intl[28]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(28),
      O => \WDOTime_intl[28]_i_1_n_0\
    );
\WDOTime_intl[29]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(29),
      O => \WDOTime_intl[29]_i_1_n_0\
    );
\WDOTime_intl[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(2),
      O => \WDOTime_intl[2]_i_1_n_0\
    );
\WDOTime_intl[30]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(30),
      O => \WDOTime_intl[30]_i_1_n_0\
    );
\WDOTime_intl[31]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(31),
      O => \WDOTime_intl[31]_i_2_n_0\
    );
\WDOTime_intl[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(3),
      O => \WDOTime_intl[3]_i_1_n_0\
    );
\WDOTime_intl[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(4),
      O => \WDOTime_intl[4]_i_1_n_0\
    );
\WDOTime_intl[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(5),
      O => \WDOTime_intl[5]_i_1_n_0\
    );
\WDOTime_intl[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(6),
      O => \WDOTime_intl[6]_i_1_n_0\
    );
\WDOTime_intl[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(7),
      O => \WDOTime_intl[7]_i_1_n_0\
    );
\WDOTime_intl[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(8),
      O => \WDOTime_intl[8]_i_1_n_0\
    );
\WDOTime_intl[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_fifo_wr_stm_reg_n_0_[8]\,
      I1 => FIFO_Time(9),
      O => \WDOTime_intl[9]_i_1_n_0\
    );
\WDOTime_intl_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[0]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[0]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[10]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[10]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[10]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[11]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[11]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[11]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[12]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[12]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[12]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[13]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[13]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[13]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[14]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[14]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[14]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[15]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[15]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[15]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[16]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[16]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[16]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[17]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[17]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[17]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[18]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[18]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[18]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[19]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[19]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[19]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[1]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[1]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[20]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[20]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[20]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[21]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[21]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[21]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[22]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[22]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[22]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[23]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[23]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[23]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[24]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[24]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[24]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[25]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[25]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[25]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[26]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[26]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[26]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[27]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[27]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[27]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[28]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[28]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[28]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[29]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[29]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[29]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[2]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[2]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[30]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[30]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[30]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[31]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[31]_i_2_n_0\,
      Q => \WDOTime_intl_reg_n_0_[31]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[32]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(32),
      Q => data1(0),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[33]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(33),
      Q => data1(1),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[34]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(34),
      Q => data1(2),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[35]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(35),
      Q => data1(3),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[36]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(36),
      Q => data1(4),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[37]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(37),
      Q => data1(5),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[38]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(38),
      Q => data1(6),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[39]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(39),
      Q => data1(7),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[3]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[3]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[40]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(40),
      Q => data1(8),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[41]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(41),
      Q => data1(9),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[42]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(42),
      Q => data1(10),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[43]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(43),
      Q => data1(11),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[44]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(44),
      Q => data1(12),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[45]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(45),
      Q => data1(13),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[46]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(46),
      Q => data1(14),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[47]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(47),
      Q => data1(15),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[48]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(48),
      Q => data1(16),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[49]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(49),
      Q => data1(17),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[4]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[4]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[50]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(50),
      Q => data1(18),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[51]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(51),
      Q => data1(19),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[52]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(52),
      Q => data1(20),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[53]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(53),
      Q => data1(21),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[54]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(54),
      Q => data1(22),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[55]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(55),
      Q => data1(23),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[56]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(56),
      Q => data1(24),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[57]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(57),
      Q => data1(25),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[58]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(58),
      Q => data1(26),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[59]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(59),
      Q => data1(27),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[5]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[5]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[60]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(60),
      Q => data1(28),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[61]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(61),
      Q => data1(29),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[62]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(62),
      Q => data1(30),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[63]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => FIFO_Time(63),
      Q => data1(31),
      R => \GEN_FIFO[2].FIFOCH_n_0\
    );
\WDOTime_intl_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[6]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[6]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[7]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[7]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[8]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[8]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\WDOTime_intl_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => CLK,
      CE => WDOTime_intl0,
      D => \WDOTime_intl[9]_i_1_n_0\,
      Q => \WDOTime_intl_reg_n_0_[9]\,
      S => \GEN_FIFO[2].FIFOCH_n_2\
    );
\cnt_fifo[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0030FFFFAABA0000"
    )
        port map (
      I0 => \cnt_fifo[8]_i_4_n_0\,
      I1 => \cnt_fifo[0]_i_2_n_0\,
      I2 => \cnt_fifo[0]_i_3_n_0\,
      I3 => \fifo_rd_stm[1]_i_3_n_0\,
      I4 => cnt_fifo0,
      I5 => \cnt_fifo_reg_n_0_[0]\,
      O => \cnt_fifo[0]_i_1_n_0\
    );
\cnt_fifo[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => \fifo_rd_stm_reg_n_0_[1]\,
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      I2 => \fifo_rd_stm_reg_n_0_[3]\,
      O => \cnt_fifo[0]_i_2_n_0\
    );
\cnt_fifo[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \fifo_rd_stm_reg_n_0_[3]\,
      I1 => \fifo_rd_stm_reg_n_0_[1]\,
      O => \cnt_fifo[0]_i_3_n_0\
    );
\cnt_fifo[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F80"
    )
        port map (
      I0 => \cnt_fifo[8]_i_4_n_0\,
      I1 => \cnt_fifo_reg_n_0_[0]\,
      I2 => cnt_fifo0,
      I3 => \cnt_fifo_reg_n_0_[1]\,
      O => \cnt_fifo[1]_i_1_n_0\
    );
\cnt_fifo[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \cnt_fifo_reg_n_0_[1]\,
      I1 => \cnt_fifo_reg_n_0_[0]\,
      I2 => \cnt_fifo_reg_n_0_[2]\,
      O => \cnt_fifo[2]_i_1_n_0\
    );
\cnt_fifo[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \cnt_fifo_reg_n_0_[2]\,
      I1 => \cnt_fifo_reg_n_0_[0]\,
      I2 => \cnt_fifo_reg_n_0_[1]\,
      I3 => \cnt_fifo_reg_n_0_[3]\,
      O => \cnt_fifo[3]_i_1_n_0\
    );
\cnt_fifo[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \cnt_fifo_reg_n_0_[3]\,
      I1 => \cnt_fifo_reg_n_0_[1]\,
      I2 => \cnt_fifo_reg_n_0_[0]\,
      I3 => \cnt_fifo_reg_n_0_[2]\,
      I4 => \cnt_fifo_reg_n_0_[4]\,
      O => \cnt_fifo[4]_i_1_n_0\
    );
\cnt_fifo[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F80"
    )
        port map (
      I0 => \cnt_fifo[8]_i_4_n_0\,
      I1 => \cnt_fifo[8]_i_5_n_0\,
      I2 => cnt_fifo0,
      I3 => address(0),
      O => \cnt_fifo[5]_i_1_n_0\
    );
\cnt_fifo[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => address(0),
      I1 => \cnt_fifo[8]_i_5_n_0\,
      I2 => address(1),
      O => \cnt_fifo[6]_i_1_n_0\
    );
\cnt_fifo[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \cnt_fifo[8]_i_5_n_0\,
      I1 => address(0),
      I2 => address(1),
      I3 => address(2),
      O => \cnt_fifo[7]_i_1_n_0\
    );
\cnt_fifo[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_fifo0,
      I1 => \cnt_fifo[8]_i_4_n_0\,
      O => \cnt_fifo[8]_i_1_n_0\
    );
\cnt_fifo[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000008088C00000"
    )
        port map (
      I0 => ready_i,
      I1 => nRST,
      I2 => \fifo_rd_stm_reg_n_0_[0]\,
      I3 => \fifo_rd_stm_reg_n_0_[1]\,
      I4 => \fifo_rd_stm_reg_n_0_[2]\,
      I5 => \fifo_rd_stm_reg_n_0_[3]\,
      O => cnt_fifo0
    );
\cnt_fifo[8]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => address(2),
      I1 => address(3),
      I2 => address(1),
      I3 => address(0),
      I4 => \cnt_fifo[8]_i_5_n_0\,
      O => \cnt_fifo[8]_i_3_n_0\
    );
\cnt_fifo[8]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAEAAAEAAAFABA"
    )
        port map (
      I0 => \fifo_rd_stm_reg_n_0_[3]\,
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      I2 => \fifo_rd_stm_reg_n_0_[1]\,
      I3 => \rd_en0__7\,
      I4 => \cnt_fifo[8]_i_6_n_0\,
      I5 => \cnt_fifo[8]_i_7_n_0\,
      O => \cnt_fifo[8]_i_4_n_0\
    );
\cnt_fifo[8]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \cnt_fifo_reg_n_0_[4]\,
      I1 => \cnt_fifo_reg_n_0_[3]\,
      I2 => \cnt_fifo_reg_n_0_[1]\,
      I3 => \cnt_fifo_reg_n_0_[0]\,
      I4 => \cnt_fifo_reg_n_0_[2]\,
      O => \cnt_fifo[8]_i_5_n_0\
    );
\cnt_fifo[8]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \cnt_fifo_reg_n_0_[1]\,
      I1 => \cnt_fifo_reg_n_0_[2]\,
      O => \cnt_fifo[8]_i_6_n_0\
    );
\cnt_fifo[8]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => address(1),
      I1 => address(0),
      I2 => address(3),
      I3 => address(2),
      I4 => \cnt_fifo_reg_n_0_[3]\,
      I5 => \cnt_fifo_reg_n_0_[4]\,
      O => \cnt_fifo[8]_i_7_n_0\
    );
\cnt_fifo_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \cnt_fifo[0]_i_1_n_0\,
      Q => \cnt_fifo_reg_n_0_[0]\,
      R => '0'
    );
\cnt_fifo_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \cnt_fifo[1]_i_1_n_0\,
      Q => \cnt_fifo_reg_n_0_[1]\,
      R => '0'
    );
\cnt_fifo_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => cnt_fifo0,
      D => \cnt_fifo[2]_i_1_n_0\,
      Q => \cnt_fifo_reg_n_0_[2]\,
      R => \cnt_fifo[8]_i_1_n_0\
    );
\cnt_fifo_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => cnt_fifo0,
      D => \cnt_fifo[3]_i_1_n_0\,
      Q => \cnt_fifo_reg_n_0_[3]\,
      R => \cnt_fifo[8]_i_1_n_0\
    );
\cnt_fifo_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => cnt_fifo0,
      D => \cnt_fifo[4]_i_1_n_0\,
      Q => \cnt_fifo_reg_n_0_[4]\,
      R => \cnt_fifo[8]_i_1_n_0\
    );
\cnt_fifo_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \cnt_fifo[5]_i_1_n_0\,
      Q => address(0),
      R => '0'
    );
\cnt_fifo_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => cnt_fifo0,
      D => \cnt_fifo[6]_i_1_n_0\,
      Q => address(1),
      R => \cnt_fifo[8]_i_1_n_0\
    );
\cnt_fifo_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => cnt_fifo0,
      D => \cnt_fifo[7]_i_1_n_0\,
      Q => address(2),
      R => \cnt_fifo[8]_i_1_n_0\
    );
\cnt_fifo_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => cnt_fifo0,
      D => \cnt_fifo[8]_i_3_n_0\,
      Q => address(3),
      R => \cnt_fifo[8]_i_1_n_0\
    );
\fifo_rd_stm[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEFFEEFEEEEFEEEE"
    )
        port map (
      I0 => \fifo_rd_stm[0]_i_2_n_0\,
      I1 => \fifo_rd_stm[0]_i_3_n_0\,
      I2 => \fifo_rd_stm_reg_n_0_[0]\,
      I3 => \fifo_rd_stm[3]_i_4_n_0\,
      I4 => \fifo_rd_stm[0]_i_4_n_0\,
      I5 => \rd_en0__7\,
      O => fifo_rd_stm(0)
    );
\fifo_rd_stm[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00003420"
    )
        port map (
      I0 => \fifo_rd_stm_reg_n_0_[1]\,
      I1 => \fifo_rd_stm_reg_n_0_[3]\,
      I2 => \fifo_rd_stm_reg_n_0_[2]\,
      I3 => \fifo_rd_stm_reg_n_0_[0]\,
      I4 => ready_i,
      O => \fifo_rd_stm[0]_i_2_n_0\
    );
\fifo_rd_stm[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAABBF"
    )
        port map (
      I0 => \fifo_rd_stm[0]_i_6_n_0\,
      I1 => \fifo_rd_stm_reg_n_0_[1]\,
      I2 => \FIFO_WR_reg[valid_n_0_]\,
      I3 => \fifo_rd_stm_reg_n_0_[0]\,
      I4 => \fifo_rd_stm_reg_n_0_[2]\,
      I5 => \fifo_rd_stm_reg_n_0_[3]\,
      O => \fifo_rd_stm[0]_i_3_n_0\
    );
\fifo_rd_stm[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFEFE"
    )
        port map (
      I0 => \cnt_fifo_reg_n_0_[4]\,
      I1 => \cnt_fifo_reg_n_0_[3]\,
      I2 => \fifo_rd_stm[0]_i_7_n_0\,
      I3 => \cnt_fifo_reg_n_0_[2]\,
      I4 => \cnt_fifo_reg_n_0_[1]\,
      O => \fifo_rd_stm[0]_i_4_n_0\
    );
\fifo_rd_stm[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \cnt_fifo_reg_n_0_[4]\,
      I1 => \fifo_rd_stm[0]_i_8_n_0\,
      I2 => \cnt_fifo_reg_n_0_[3]\,
      I3 => \cnt_fifo_reg_n_0_[1]\,
      I4 => \cnt_fifo_reg_n_0_[0]\,
      I5 => \cnt_fifo_reg_n_0_[2]\,
      O => \rd_en0__7\
    );
\fifo_rd_stm[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000CA00000"
    )
        port map (
      I0 => PSBUSY_i,
      I1 => last_fifo_rd_stm(0),
      I2 => \fifo_rd_stm_reg_n_0_[2]\,
      I3 => \fifo_rd_stm_reg_n_0_[3]\,
      I4 => \fifo_rd_stm_reg_n_0_[0]\,
      I5 => \fifo_rd_stm_reg_n_0_[1]\,
      O => \fifo_rd_stm[0]_i_6_n_0\
    );
\fifo_rd_stm[0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => address(1),
      I1 => address(0),
      I2 => address(3),
      I3 => address(2),
      O => \fifo_rd_stm[0]_i_7_n_0\
    );
\fifo_rd_stm[0]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => address(3),
      I1 => address(2),
      I2 => address(1),
      I3 => address(0),
      O => \fifo_rd_stm[0]_i_8_n_0\
    );
\fifo_rd_stm[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFAABA"
    )
        port map (
      I0 => \fifo_rd_stm[1]_i_2_n_0\,
      I1 => \fifo_rd_stm[1]_i_3_n_0\,
      I2 => \fifo_rd_stm_reg_n_0_[0]\,
      I3 => \fifo_rd_stm[1]_i_4_n_0\,
      I4 => \fifo_rd_stm[1]_i_5_n_0\,
      I5 => \fifo_rd_stm[1]_i_6_n_0\,
      O => fifo_rd_stm(1)
    );
\fifo_rd_stm[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00F0000800000008"
    )
        port map (
      I0 => \FIFO_WR_reg[valid_n_0_]\,
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      I2 => \fifo_rd_stm_reg_n_0_[2]\,
      I3 => \fifo_rd_stm_reg_n_0_[3]\,
      I4 => \fifo_rd_stm_reg_n_0_[1]\,
      I5 => ready_i,
      O => \fifo_rd_stm[1]_i_2_n_0\
    );
\fifo_rd_stm[1]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => PSBUSY_i,
      I1 => ready_i,
      O => \fifo_rd_stm[1]_i_3_n_0\
    );
\fifo_rd_stm[1]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \fifo_rd_stm_reg_n_0_[3]\,
      I1 => \fifo_rd_stm_reg_n_0_[2]\,
      O => \fifo_rd_stm[1]_i_4_n_0\
    );
\fifo_rd_stm[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000008000000"
    )
        port map (
      I0 => ready_i,
      I1 => last_fifo_rd_stm(2),
      I2 => \fifo_rd_stm_reg_n_0_[1]\,
      I3 => \fifo_rd_stm_reg_n_0_[0]\,
      I4 => \fifo_rd_stm_reg_n_0_[3]\,
      I5 => \fifo_rd_stm_reg_n_0_[2]\,
      O => \fifo_rd_stm[1]_i_5_n_0\
    );
\fifo_rd_stm[1]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000050C0"
    )
        port map (
      I0 => PSBUSY_i,
      I1 => \FIFO_WR_reg[valid_n_0_]\,
      I2 => \fifo_rd_stm_reg_n_0_[1]\,
      I3 => \fifo_rd_stm_reg_n_0_[3]\,
      I4 => \fifo_rd_stm_reg_n_0_[2]\,
      I5 => \fifo_rd_stm_reg_n_0_[0]\,
      O => \fifo_rd_stm[1]_i_6_n_0\
    );
\fifo_rd_stm[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF40FF40FF40"
    )
        port map (
      I0 => \FIFO_WR_reg[valid_n_0_]\,
      I1 => \fifo_rd_stm_reg_n_0_[1]\,
      I2 => \fifo_rd_stm[2]_i_2_n_0\,
      I3 => \fifo_rd_stm[2]_i_3_n_0\,
      I4 => \fifo_rd_stm[3]_i_5_n_0\,
      I5 => \fifo_rd_stm[2]_i_4_n_0\,
      O => fifo_rd_stm(2)
    );
\fifo_rd_stm[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \fifo_rd_stm_reg_n_0_[3]\,
      I1 => \fifo_rd_stm_reg_n_0_[2]\,
      I2 => \fifo_rd_stm_reg_n_0_[0]\,
      O => \fifo_rd_stm[2]_i_2_n_0\
    );
\fifo_rd_stm[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000F8000000000"
    )
        port map (
      I0 => last_fifo_rd_stm(2),
      I1 => ready_i,
      I2 => \fifo_rd_stm_reg_n_0_[3]\,
      I3 => \fifo_rd_stm_reg_n_0_[2]\,
      I4 => \fifo_rd_stm_reg_n_0_[1]\,
      I5 => \fifo_rd_stm_reg_n_0_[0]\,
      O => \fifo_rd_stm[2]_i_3_n_0\
    );
\fifo_rd_stm[2]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => ready_i,
      I1 => \fifo_rd_stm_reg_n_0_[1]\,
      I2 => \fifo_rd_stm_reg_n_0_[3]\,
      I3 => \fifo_rd_stm_reg_n_0_[2]\,
      O => \fifo_rd_stm[2]_i_4_n_0\
    );
\fifo_rd_stm[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F070F0F0"
    )
        port map (
      I0 => \fifo_rd_stm_reg_n_0_[3]\,
      I1 => \fifo_rd_stm_reg_n_0_[2]\,
      I2 => nRST,
      I3 => \fifo_rd_stm_reg_n_0_[1]\,
      I4 => \fifo_rd_stm_reg_n_0_[0]\,
      O => fifo_rd_stm0
    );
\fifo_rd_stm[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"22F222FF22F2FFFF"
    )
        port map (
      I0 => \fifo_rd_stm[3]_i_3_n_0\,
      I1 => PSBUSY_i,
      I2 => \DataOut_stall[11]_i_1_n_0\,
      I3 => ready_i,
      I4 => \fifo_rd_stm[3]_i_4_n_0\,
      I5 => \fifo_rd_stm[3]_i_5_n_0\,
      O => fifo_rd_stm(3)
    );
\fifo_rd_stm[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => \fifo_rd_stm_reg_n_0_[0]\,
      I1 => \fifo_rd_stm_reg_n_0_[1]\,
      I2 => \fifo_rd_stm_reg_n_0_[2]\,
      I3 => \fifo_rd_stm_reg_n_0_[3]\,
      O => \fifo_rd_stm[3]_i_3_n_0\
    );
\fifo_rd_stm[3]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => \fifo_rd_stm_reg_n_0_[2]\,
      I1 => \fifo_rd_stm_reg_n_0_[3]\,
      I2 => \fifo_rd_stm_reg_n_0_[1]\,
      O => \fifo_rd_stm[3]_i_4_n_0\
    );
\fifo_rd_stm[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \rd_en0__7\,
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      O => \fifo_rd_stm[3]_i_5_n_0\
    );
\fifo_rd_stm_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => fifo_rd_stm0,
      D => fifo_rd_stm(0),
      Q => \fifo_rd_stm_reg_n_0_[0]\,
      R => '0'
    );
\fifo_rd_stm_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => fifo_rd_stm0,
      D => fifo_rd_stm(1),
      Q => \fifo_rd_stm_reg_n_0_[1]\,
      R => '0'
    );
\fifo_rd_stm_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => fifo_rd_stm0,
      D => fifo_rd_stm(2),
      Q => \fifo_rd_stm_reg_n_0_[2]\,
      R => '0'
    );
\fifo_rd_stm_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => fifo_rd_stm0,
      D => fifo_rd_stm(3),
      Q => \fifo_rd_stm_reg_n_0_[3]\,
      R => '0'
    );
\last_fifo_rd_stm[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEF0020"
    )
        port map (
      I0 => \fifo_rd_stm_reg_n_0_[0]\,
      I1 => ready_i,
      I2 => nRST,
      I3 => \fifo_rd_stm[3]_i_4_n_0\,
      I4 => last_fifo_rd_stm(0),
      O => \last_fifo_rd_stm[0]_i_1_n_0\
    );
\last_fifo_rd_stm[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00002000"
    )
        port map (
      I0 => \fifo_rd_stm_reg_n_0_[2]\,
      I1 => \fifo_rd_stm_reg_n_0_[3]\,
      I2 => \fifo_rd_stm_reg_n_0_[1]\,
      I3 => nRST,
      I4 => ready_i,
      I5 => last_fifo_rd_stm(2),
      O => \last_fifo_rd_stm[2]_i_1_n_0\
    );
\last_fifo_rd_stm_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \last_fifo_rd_stm[0]_i_1_n_0\,
      Q => last_fifo_rd_stm(0),
      R => '0'
    );
\last_fifo_rd_stm_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \last_fifo_rd_stm[2]_i_1_n_0\,
      Q => last_fifo_rd_stm(2),
      R => '0'
    );
rd_en_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rd_en_i_2_n_0,
      I1 => rd_en0,
      I2 => rd_en,
      O => rd_en_i_1_n_0
    );
rd_en_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B000B000FF000000"
    )
        port map (
      I0 => \rd_en0__7\,
      I1 => \fifo_rd_stm_reg_n_0_[0]\,
      I2 => \fifo_rd_stm_reg_n_0_[2]\,
      I3 => ready_i,
      I4 => \fifo_rd_stm_reg_n_0_[3]\,
      I5 => \fifo_rd_stm_reg_n_0_[1]\,
      O => rd_en_i_2_n_0
    );
rd_en_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000FAA0000F0800F"
    )
        port map (
      I0 => rd_en_i_4_n_0,
      I1 => \fifo_rd_stm[1]_i_3_n_0\,
      I2 => \fifo_rd_stm_reg_n_0_[0]\,
      I3 => \fifo_rd_stm_reg_n_0_[2]\,
      I4 => \fifo_rd_stm_reg_n_0_[3]\,
      I5 => \fifo_rd_stm_reg_n_0_[1]\,
      O => rd_en0
    );
rd_en_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFEFFFF"
    )
        port map (
      I0 => \fifo_rd_stm_reg_n_0_[0]\,
      I1 => \fifo_rd_stm[0]_i_7_n_0\,
      I2 => \cnt_fifo_reg_n_0_[3]\,
      I3 => \cnt_fifo[8]_i_6_n_0\,
      I4 => ready_i,
      I5 => \cnt_fifo_reg_n_0_[4]\,
      O => rd_en_i_4_n_0
    );
rd_en_reg: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \GEN_FIFO[0].FIFOCH_n_0\,
      D => rd_en_i_1_n_0,
      Q => rd_en
    );
\rdy_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => ready_i,
      Q => rdy_state(0),
      R => '0'
    );
\rdy_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => rdy_state(0),
      Q => rdy_state(1),
      R => '0'
    );
\wr_data[0][11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => nRST,
      I1 => PRECvalid,
      I2 => \FSM_onehot_fifo_wr_stm_reg_n_0_[1]\,
      O => \wr_data_reg[15]0\
    );
\wr_data_reg[0][0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH0(0),
      Q => \wr_data_reg_n_0_[0][0]\,
      R => '0'
    );
\wr_data_reg[0][10]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH0(10),
      Q => \wr_data_reg_n_0_[0][10]\,
      R => '0'
    );
\wr_data_reg[0][11]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH0(11),
      Q => \wr_data_reg_n_0_[0][11]\,
      R => '0'
    );
\wr_data_reg[0][1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH0(1),
      Q => \wr_data_reg_n_0_[0][1]\,
      R => '0'
    );
\wr_data_reg[0][2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH0(2),
      Q => \wr_data_reg_n_0_[0][2]\,
      R => '0'
    );
\wr_data_reg[0][3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH0(3),
      Q => \wr_data_reg_n_0_[0][3]\,
      R => '0'
    );
\wr_data_reg[0][4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH0(4),
      Q => \wr_data_reg_n_0_[0][4]\,
      R => '0'
    );
\wr_data_reg[0][5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH0(5),
      Q => \wr_data_reg_n_0_[0][5]\,
      R => '0'
    );
\wr_data_reg[0][6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH0(6),
      Q => \wr_data_reg_n_0_[0][6]\,
      R => '0'
    );
\wr_data_reg[0][7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH0(7),
      Q => \wr_data_reg_n_0_[0][7]\,
      R => '0'
    );
\wr_data_reg[0][8]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH0(8),
      Q => \wr_data_reg_n_0_[0][8]\,
      R => '0'
    );
\wr_data_reg[0][9]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH0(9),
      Q => \wr_data_reg_n_0_[0][9]\,
      R => '0'
    );
\wr_data_reg[10][0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH10(0),
      Q => \wr_data_reg_n_0_[10][0]\,
      R => '0'
    );
\wr_data_reg[10][10]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH10(10),
      Q => \wr_data_reg_n_0_[10][10]\,
      R => '0'
    );
\wr_data_reg[10][11]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH10(11),
      Q => \wr_data_reg_n_0_[10][11]\,
      R => '0'
    );
\wr_data_reg[10][1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH10(1),
      Q => \wr_data_reg_n_0_[10][1]\,
      R => '0'
    );
\wr_data_reg[10][2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH10(2),
      Q => \wr_data_reg_n_0_[10][2]\,
      R => '0'
    );
\wr_data_reg[10][3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH10(3),
      Q => \wr_data_reg_n_0_[10][3]\,
      R => '0'
    );
\wr_data_reg[10][4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH10(4),
      Q => \wr_data_reg_n_0_[10][4]\,
      R => '0'
    );
\wr_data_reg[10][5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH10(5),
      Q => \wr_data_reg_n_0_[10][5]\,
      R => '0'
    );
\wr_data_reg[10][6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH10(6),
      Q => \wr_data_reg_n_0_[10][6]\,
      R => '0'
    );
\wr_data_reg[10][7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH10(7),
      Q => \wr_data_reg_n_0_[10][7]\,
      R => '0'
    );
\wr_data_reg[10][8]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH10(8),
      Q => \wr_data_reg_n_0_[10][8]\,
      R => '0'
    );
\wr_data_reg[10][9]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH10(9),
      Q => \wr_data_reg_n_0_[10][9]\,
      R => '0'
    );
\wr_data_reg[11][0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH11(0),
      Q => \wr_data_reg_n_0_[11][0]\,
      R => '0'
    );
\wr_data_reg[11][10]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH11(10),
      Q => \wr_data_reg_n_0_[11][10]\,
      R => '0'
    );
\wr_data_reg[11][11]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH11(11),
      Q => \wr_data_reg_n_0_[11][11]\,
      R => '0'
    );
\wr_data_reg[11][1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH11(1),
      Q => \wr_data_reg_n_0_[11][1]\,
      R => '0'
    );
\wr_data_reg[11][2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH11(2),
      Q => \wr_data_reg_n_0_[11][2]\,
      R => '0'
    );
\wr_data_reg[11][3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH11(3),
      Q => \wr_data_reg_n_0_[11][3]\,
      R => '0'
    );
\wr_data_reg[11][4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH11(4),
      Q => \wr_data_reg_n_0_[11][4]\,
      R => '0'
    );
\wr_data_reg[11][5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH11(5),
      Q => \wr_data_reg_n_0_[11][5]\,
      R => '0'
    );
\wr_data_reg[11][6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH11(6),
      Q => \wr_data_reg_n_0_[11][6]\,
      R => '0'
    );
\wr_data_reg[11][7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH11(7),
      Q => \wr_data_reg_n_0_[11][7]\,
      R => '0'
    );
\wr_data_reg[11][8]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH11(8),
      Q => \wr_data_reg_n_0_[11][8]\,
      R => '0'
    );
\wr_data_reg[11][9]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH11(9),
      Q => \wr_data_reg_n_0_[11][9]\,
      R => '0'
    );
\wr_data_reg[12][0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH12(0),
      Q => \wr_data_reg_n_0_[12][0]\,
      R => '0'
    );
\wr_data_reg[12][10]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH12(10),
      Q => \wr_data_reg_n_0_[12][10]\,
      R => '0'
    );
\wr_data_reg[12][11]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH12(11),
      Q => \wr_data_reg_n_0_[12][11]\,
      R => '0'
    );
\wr_data_reg[12][1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH12(1),
      Q => \wr_data_reg_n_0_[12][1]\,
      R => '0'
    );
\wr_data_reg[12][2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH12(2),
      Q => \wr_data_reg_n_0_[12][2]\,
      R => '0'
    );
\wr_data_reg[12][3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH12(3),
      Q => \wr_data_reg_n_0_[12][3]\,
      R => '0'
    );
\wr_data_reg[12][4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH12(4),
      Q => \wr_data_reg_n_0_[12][4]\,
      R => '0'
    );
\wr_data_reg[12][5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH12(5),
      Q => \wr_data_reg_n_0_[12][5]\,
      R => '0'
    );
\wr_data_reg[12][6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH12(6),
      Q => \wr_data_reg_n_0_[12][6]\,
      R => '0'
    );
\wr_data_reg[12][7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH12(7),
      Q => \wr_data_reg_n_0_[12][7]\,
      R => '0'
    );
\wr_data_reg[12][8]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH12(8),
      Q => \wr_data_reg_n_0_[12][8]\,
      R => '0'
    );
\wr_data_reg[12][9]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH12(9),
      Q => \wr_data_reg_n_0_[12][9]\,
      R => '0'
    );
\wr_data_reg[13][0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH13(0),
      Q => \wr_data_reg_n_0_[13][0]\,
      R => '0'
    );
\wr_data_reg[13][10]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH13(10),
      Q => \wr_data_reg_n_0_[13][10]\,
      R => '0'
    );
\wr_data_reg[13][11]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH13(11),
      Q => \wr_data_reg_n_0_[13][11]\,
      R => '0'
    );
\wr_data_reg[13][1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH13(1),
      Q => \wr_data_reg_n_0_[13][1]\,
      R => '0'
    );
\wr_data_reg[13][2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH13(2),
      Q => \wr_data_reg_n_0_[13][2]\,
      R => '0'
    );
\wr_data_reg[13][3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH13(3),
      Q => \wr_data_reg_n_0_[13][3]\,
      R => '0'
    );
\wr_data_reg[13][4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH13(4),
      Q => \wr_data_reg_n_0_[13][4]\,
      R => '0'
    );
\wr_data_reg[13][5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH13(5),
      Q => \wr_data_reg_n_0_[13][5]\,
      R => '0'
    );
\wr_data_reg[13][6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH13(6),
      Q => \wr_data_reg_n_0_[13][6]\,
      R => '0'
    );
\wr_data_reg[13][7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH13(7),
      Q => \wr_data_reg_n_0_[13][7]\,
      R => '0'
    );
\wr_data_reg[13][8]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH13(8),
      Q => \wr_data_reg_n_0_[13][8]\,
      R => '0'
    );
\wr_data_reg[13][9]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH13(9),
      Q => \wr_data_reg_n_0_[13][9]\,
      R => '0'
    );
\wr_data_reg[14][0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH14(0),
      Q => \wr_data_reg_n_0_[14][0]\,
      R => '0'
    );
\wr_data_reg[14][10]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH14(10),
      Q => \wr_data_reg_n_0_[14][10]\,
      R => '0'
    );
\wr_data_reg[14][11]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH14(11),
      Q => \wr_data_reg_n_0_[14][11]\,
      R => '0'
    );
\wr_data_reg[14][1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH14(1),
      Q => \wr_data_reg_n_0_[14][1]\,
      R => '0'
    );
\wr_data_reg[14][2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH14(2),
      Q => \wr_data_reg_n_0_[14][2]\,
      R => '0'
    );
\wr_data_reg[14][3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH14(3),
      Q => \wr_data_reg_n_0_[14][3]\,
      R => '0'
    );
\wr_data_reg[14][4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH14(4),
      Q => \wr_data_reg_n_0_[14][4]\,
      R => '0'
    );
\wr_data_reg[14][5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH14(5),
      Q => \wr_data_reg_n_0_[14][5]\,
      R => '0'
    );
\wr_data_reg[14][6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH14(6),
      Q => \wr_data_reg_n_0_[14][6]\,
      R => '0'
    );
\wr_data_reg[14][7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH14(7),
      Q => \wr_data_reg_n_0_[14][7]\,
      R => '0'
    );
\wr_data_reg[14][8]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH14(8),
      Q => \wr_data_reg_n_0_[14][8]\,
      R => '0'
    );
\wr_data_reg[14][9]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH14(9),
      Q => \wr_data_reg_n_0_[14][9]\,
      R => '0'
    );
\wr_data_reg[15][0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH15(0),
      Q => \wr_data_reg_n_0_[15][0]\,
      R => '0'
    );
\wr_data_reg[15][10]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH15(10),
      Q => \wr_data_reg_n_0_[15][10]\,
      R => '0'
    );
\wr_data_reg[15][11]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH15(11),
      Q => \wr_data_reg_n_0_[15][11]\,
      R => '0'
    );
\wr_data_reg[15][1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH15(1),
      Q => \wr_data_reg_n_0_[15][1]\,
      R => '0'
    );
\wr_data_reg[15][2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH15(2),
      Q => \wr_data_reg_n_0_[15][2]\,
      R => '0'
    );
\wr_data_reg[15][3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH15(3),
      Q => \wr_data_reg_n_0_[15][3]\,
      R => '0'
    );
\wr_data_reg[15][4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH15(4),
      Q => \wr_data_reg_n_0_[15][4]\,
      R => '0'
    );
\wr_data_reg[15][5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH15(5),
      Q => \wr_data_reg_n_0_[15][5]\,
      R => '0'
    );
\wr_data_reg[15][6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH15(6),
      Q => \wr_data_reg_n_0_[15][6]\,
      R => '0'
    );
\wr_data_reg[15][7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH15(7),
      Q => \wr_data_reg_n_0_[15][7]\,
      R => '0'
    );
\wr_data_reg[15][8]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH15(8),
      Q => \wr_data_reg_n_0_[15][8]\,
      R => '0'
    );
\wr_data_reg[15][9]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH15(9),
      Q => \wr_data_reg_n_0_[15][9]\,
      R => '0'
    );
\wr_data_reg[1][0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH1(0),
      Q => \wr_data_reg_n_0_[1][0]\,
      R => '0'
    );
\wr_data_reg[1][10]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH1(10),
      Q => \wr_data_reg_n_0_[1][10]\,
      R => '0'
    );
\wr_data_reg[1][11]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH1(11),
      Q => \wr_data_reg_n_0_[1][11]\,
      R => '0'
    );
\wr_data_reg[1][1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH1(1),
      Q => \wr_data_reg_n_0_[1][1]\,
      R => '0'
    );
\wr_data_reg[1][2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH1(2),
      Q => \wr_data_reg_n_0_[1][2]\,
      R => '0'
    );
\wr_data_reg[1][3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH1(3),
      Q => \wr_data_reg_n_0_[1][3]\,
      R => '0'
    );
\wr_data_reg[1][4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH1(4),
      Q => \wr_data_reg_n_0_[1][4]\,
      R => '0'
    );
\wr_data_reg[1][5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH1(5),
      Q => \wr_data_reg_n_0_[1][5]\,
      R => '0'
    );
\wr_data_reg[1][6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH1(6),
      Q => \wr_data_reg_n_0_[1][6]\,
      R => '0'
    );
\wr_data_reg[1][7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH1(7),
      Q => \wr_data_reg_n_0_[1][7]\,
      R => '0'
    );
\wr_data_reg[1][8]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH1(8),
      Q => \wr_data_reg_n_0_[1][8]\,
      R => '0'
    );
\wr_data_reg[1][9]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH1(9),
      Q => \wr_data_reg_n_0_[1][9]\,
      R => '0'
    );
\wr_data_reg[2][0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH2(0),
      Q => \wr_data_reg_n_0_[2][0]\,
      R => '0'
    );
\wr_data_reg[2][10]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH2(10),
      Q => \wr_data_reg_n_0_[2][10]\,
      R => '0'
    );
\wr_data_reg[2][11]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH2(11),
      Q => \wr_data_reg_n_0_[2][11]\,
      R => '0'
    );
\wr_data_reg[2][1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH2(1),
      Q => \wr_data_reg_n_0_[2][1]\,
      R => '0'
    );
\wr_data_reg[2][2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH2(2),
      Q => \wr_data_reg_n_0_[2][2]\,
      R => '0'
    );
\wr_data_reg[2][3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH2(3),
      Q => \wr_data_reg_n_0_[2][3]\,
      R => '0'
    );
\wr_data_reg[2][4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH2(4),
      Q => \wr_data_reg_n_0_[2][4]\,
      R => '0'
    );
\wr_data_reg[2][5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH2(5),
      Q => \wr_data_reg_n_0_[2][5]\,
      R => '0'
    );
\wr_data_reg[2][6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH2(6),
      Q => \wr_data_reg_n_0_[2][6]\,
      R => '0'
    );
\wr_data_reg[2][7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH2(7),
      Q => \wr_data_reg_n_0_[2][7]\,
      R => '0'
    );
\wr_data_reg[2][8]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH2(8),
      Q => \wr_data_reg_n_0_[2][8]\,
      R => '0'
    );
\wr_data_reg[2][9]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH2(9),
      Q => \wr_data_reg_n_0_[2][9]\,
      R => '0'
    );
\wr_data_reg[3][0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH3(0),
      Q => \wr_data_reg_n_0_[3][0]\,
      R => '0'
    );
\wr_data_reg[3][10]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH3(10),
      Q => \wr_data_reg_n_0_[3][10]\,
      R => '0'
    );
\wr_data_reg[3][11]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH3(11),
      Q => \wr_data_reg_n_0_[3][11]\,
      R => '0'
    );
\wr_data_reg[3][1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH3(1),
      Q => \wr_data_reg_n_0_[3][1]\,
      R => '0'
    );
\wr_data_reg[3][2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH3(2),
      Q => \wr_data_reg_n_0_[3][2]\,
      R => '0'
    );
\wr_data_reg[3][3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH3(3),
      Q => \wr_data_reg_n_0_[3][3]\,
      R => '0'
    );
\wr_data_reg[3][4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH3(4),
      Q => \wr_data_reg_n_0_[3][4]\,
      R => '0'
    );
\wr_data_reg[3][5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH3(5),
      Q => \wr_data_reg_n_0_[3][5]\,
      R => '0'
    );
\wr_data_reg[3][6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH3(6),
      Q => \wr_data_reg_n_0_[3][6]\,
      R => '0'
    );
\wr_data_reg[3][7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH3(7),
      Q => \wr_data_reg_n_0_[3][7]\,
      R => '0'
    );
\wr_data_reg[3][8]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH3(8),
      Q => \wr_data_reg_n_0_[3][8]\,
      R => '0'
    );
\wr_data_reg[3][9]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH3(9),
      Q => \wr_data_reg_n_0_[3][9]\,
      R => '0'
    );
\wr_data_reg[4][0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH4(0),
      Q => \wr_data_reg_n_0_[4][0]\,
      R => '0'
    );
\wr_data_reg[4][10]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH4(10),
      Q => \wr_data_reg_n_0_[4][10]\,
      R => '0'
    );
\wr_data_reg[4][11]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH4(11),
      Q => \wr_data_reg_n_0_[4][11]\,
      R => '0'
    );
\wr_data_reg[4][1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH4(1),
      Q => \wr_data_reg_n_0_[4][1]\,
      R => '0'
    );
\wr_data_reg[4][2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH4(2),
      Q => \wr_data_reg_n_0_[4][2]\,
      R => '0'
    );
\wr_data_reg[4][3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH4(3),
      Q => \wr_data_reg_n_0_[4][3]\,
      R => '0'
    );
\wr_data_reg[4][4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH4(4),
      Q => \wr_data_reg_n_0_[4][4]\,
      R => '0'
    );
\wr_data_reg[4][5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH4(5),
      Q => \wr_data_reg_n_0_[4][5]\,
      R => '0'
    );
\wr_data_reg[4][6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH4(6),
      Q => \wr_data_reg_n_0_[4][6]\,
      R => '0'
    );
\wr_data_reg[4][7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH4(7),
      Q => \wr_data_reg_n_0_[4][7]\,
      R => '0'
    );
\wr_data_reg[4][8]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH4(8),
      Q => \wr_data_reg_n_0_[4][8]\,
      R => '0'
    );
\wr_data_reg[4][9]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH4(9),
      Q => \wr_data_reg_n_0_[4][9]\,
      R => '0'
    );
\wr_data_reg[5][0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH5(0),
      Q => \wr_data_reg_n_0_[5][0]\,
      R => '0'
    );
\wr_data_reg[5][10]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH5(10),
      Q => \wr_data_reg_n_0_[5][10]\,
      R => '0'
    );
\wr_data_reg[5][11]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH5(11),
      Q => \wr_data_reg_n_0_[5][11]\,
      R => '0'
    );
\wr_data_reg[5][1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH5(1),
      Q => \wr_data_reg_n_0_[5][1]\,
      R => '0'
    );
\wr_data_reg[5][2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH5(2),
      Q => \wr_data_reg_n_0_[5][2]\,
      R => '0'
    );
\wr_data_reg[5][3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH5(3),
      Q => \wr_data_reg_n_0_[5][3]\,
      R => '0'
    );
\wr_data_reg[5][4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH5(4),
      Q => \wr_data_reg_n_0_[5][4]\,
      R => '0'
    );
\wr_data_reg[5][5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH5(5),
      Q => \wr_data_reg_n_0_[5][5]\,
      R => '0'
    );
\wr_data_reg[5][6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH5(6),
      Q => \wr_data_reg_n_0_[5][6]\,
      R => '0'
    );
\wr_data_reg[5][7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH5(7),
      Q => \wr_data_reg_n_0_[5][7]\,
      R => '0'
    );
\wr_data_reg[5][8]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH5(8),
      Q => \wr_data_reg_n_0_[5][8]\,
      R => '0'
    );
\wr_data_reg[5][9]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH5(9),
      Q => \wr_data_reg_n_0_[5][9]\,
      R => '0'
    );
\wr_data_reg[6][0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH6(0),
      Q => \wr_data_reg_n_0_[6][0]\,
      R => '0'
    );
\wr_data_reg[6][10]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH6(10),
      Q => \wr_data_reg_n_0_[6][10]\,
      R => '0'
    );
\wr_data_reg[6][11]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH6(11),
      Q => \wr_data_reg_n_0_[6][11]\,
      R => '0'
    );
\wr_data_reg[6][1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH6(1),
      Q => \wr_data_reg_n_0_[6][1]\,
      R => '0'
    );
\wr_data_reg[6][2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH6(2),
      Q => \wr_data_reg_n_0_[6][2]\,
      R => '0'
    );
\wr_data_reg[6][3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH6(3),
      Q => \wr_data_reg_n_0_[6][3]\,
      R => '0'
    );
\wr_data_reg[6][4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH6(4),
      Q => \wr_data_reg_n_0_[6][4]\,
      R => '0'
    );
\wr_data_reg[6][5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH6(5),
      Q => \wr_data_reg_n_0_[6][5]\,
      R => '0'
    );
\wr_data_reg[6][6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH6(6),
      Q => \wr_data_reg_n_0_[6][6]\,
      R => '0'
    );
\wr_data_reg[6][7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH6(7),
      Q => \wr_data_reg_n_0_[6][7]\,
      R => '0'
    );
\wr_data_reg[6][8]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH6(8),
      Q => \wr_data_reg_n_0_[6][8]\,
      R => '0'
    );
\wr_data_reg[6][9]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH6(9),
      Q => \wr_data_reg_n_0_[6][9]\,
      R => '0'
    );
\wr_data_reg[7][0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH7(0),
      Q => \wr_data_reg_n_0_[7][0]\,
      R => '0'
    );
\wr_data_reg[7][10]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH7(10),
      Q => \wr_data_reg_n_0_[7][10]\,
      R => '0'
    );
\wr_data_reg[7][11]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH7(11),
      Q => \wr_data_reg_n_0_[7][11]\,
      R => '0'
    );
\wr_data_reg[7][1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH7(1),
      Q => \wr_data_reg_n_0_[7][1]\,
      R => '0'
    );
\wr_data_reg[7][2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH7(2),
      Q => \wr_data_reg_n_0_[7][2]\,
      R => '0'
    );
\wr_data_reg[7][3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH7(3),
      Q => \wr_data_reg_n_0_[7][3]\,
      R => '0'
    );
\wr_data_reg[7][4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH7(4),
      Q => \wr_data_reg_n_0_[7][4]\,
      R => '0'
    );
\wr_data_reg[7][5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH7(5),
      Q => \wr_data_reg_n_0_[7][5]\,
      R => '0'
    );
\wr_data_reg[7][6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH7(6),
      Q => \wr_data_reg_n_0_[7][6]\,
      R => '0'
    );
\wr_data_reg[7][7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH7(7),
      Q => \wr_data_reg_n_0_[7][7]\,
      R => '0'
    );
\wr_data_reg[7][8]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH7(8),
      Q => \wr_data_reg_n_0_[7][8]\,
      R => '0'
    );
\wr_data_reg[7][9]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH7(9),
      Q => \wr_data_reg_n_0_[7][9]\,
      R => '0'
    );
\wr_data_reg[8][0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH8(0),
      Q => \wr_data_reg_n_0_[8][0]\,
      R => '0'
    );
\wr_data_reg[8][10]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH8(10),
      Q => \wr_data_reg_n_0_[8][10]\,
      R => '0'
    );
\wr_data_reg[8][11]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH8(11),
      Q => \wr_data_reg_n_0_[8][11]\,
      R => '0'
    );
\wr_data_reg[8][1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH8(1),
      Q => \wr_data_reg_n_0_[8][1]\,
      R => '0'
    );
\wr_data_reg[8][2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH8(2),
      Q => \wr_data_reg_n_0_[8][2]\,
      R => '0'
    );
\wr_data_reg[8][3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH8(3),
      Q => \wr_data_reg_n_0_[8][3]\,
      R => '0'
    );
\wr_data_reg[8][4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH8(4),
      Q => \wr_data_reg_n_0_[8][4]\,
      R => '0'
    );
\wr_data_reg[8][5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH8(5),
      Q => \wr_data_reg_n_0_[8][5]\,
      R => '0'
    );
\wr_data_reg[8][6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH8(6),
      Q => \wr_data_reg_n_0_[8][6]\,
      R => '0'
    );
\wr_data_reg[8][7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH8(7),
      Q => \wr_data_reg_n_0_[8][7]\,
      R => '0'
    );
\wr_data_reg[8][8]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH8(8),
      Q => \wr_data_reg_n_0_[8][8]\,
      R => '0'
    );
\wr_data_reg[8][9]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH8(9),
      Q => \wr_data_reg_n_0_[8][9]\,
      R => '0'
    );
\wr_data_reg[9][0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH9(0),
      Q => \wr_data_reg_n_0_[9][0]\,
      R => '0'
    );
\wr_data_reg[9][10]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH9(10),
      Q => \wr_data_reg_n_0_[9][10]\,
      R => '0'
    );
\wr_data_reg[9][11]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH9(11),
      Q => \wr_data_reg_n_0_[9][11]\,
      R => '0'
    );
\wr_data_reg[9][1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH9(1),
      Q => \wr_data_reg_n_0_[9][1]\,
      R => '0'
    );
\wr_data_reg[9][2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH9(2),
      Q => \wr_data_reg_n_0_[9][2]\,
      R => '0'
    );
\wr_data_reg[9][3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH9(3),
      Q => \wr_data_reg_n_0_[9][3]\,
      R => '0'
    );
\wr_data_reg[9][4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH9(4),
      Q => \wr_data_reg_n_0_[9][4]\,
      R => '0'
    );
\wr_data_reg[9][5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH9(5),
      Q => \wr_data_reg_n_0_[9][5]\,
      R => '0'
    );
\wr_data_reg[9][6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH9(6),
      Q => \wr_data_reg_n_0_[9][6]\,
      R => '0'
    );
\wr_data_reg[9][7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH9(7),
      Q => \wr_data_reg_n_0_[9][7]\,
      R => '0'
    );
\wr_data_reg[9][8]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH9(8),
      Q => \wr_data_reg_n_0_[9][8]\,
      R => '0'
    );
\wr_data_reg[9][9]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => \wr_data_reg[15]0\,
      D => CH9(9),
      Q => \wr_data_reg_n_0_[9][9]\,
      R => '0'
    );
wr_en_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFBFA0A0"
    )
        port map (
      I0 => wr_en,
      I1 => \FSM_onehot_fifo_wr_stm_reg_n_0_[5]\,
      I2 => nRST,
      I3 => \FSM_onehot_fifo_wr_stm_reg_n_0_[0]\,
      I4 => wr_en_reg_n_0,
      O => wr_en_i_1_n_0
    );
wr_en_reg: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => wr_en_i_1_n_0,
      Q => wr_en_reg_n_0,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_FifoManagerV4_0_0 is
  port (
    nRST : in STD_LOGIC;
    CLK : in STD_LOGIC;
    PRECvalid : in STD_LOGIC;
    FIFOresponse : out STD_LOGIC;
    TestFIFO : in STD_LOGIC;
    FIFO_ReadEn : out STD_LOGIC;
    FIFO_Time : in STD_LOGIC_VECTOR ( 63 downto 0 );
    FIFO_WdoAddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    FIFO_TrigInfo : in STD_LOGIC_VECTOR ( 11 downto 0 );
    FIFO_Spare : in STD_LOGIC_VECTOR ( 9 downto 0 );
    FIFO_Empty : in STD_LOGIC;
    CH0 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH1 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH2 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH3 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH4 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH5 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH6 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH7 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH8 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH9 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH10 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH11 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH12 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH13 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH14 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CH15 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    FIFOvalid : out STD_LOGIC;
    ready_i : in STD_LOGIC;
    PSBUSY_i : in STD_LOGIC;
    DataOut : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of base_zynq_FifoManagerV4_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of base_zynq_FifoManagerV4_0_0 : entity is "base_zynq_FifoManagerV4_0_0,FifoManagerV4,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of base_zynq_FifoManagerV4_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of base_zynq_FifoManagerV4_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of base_zynq_FifoManagerV4_0_0 : entity is "FifoManagerV4,Vivado 2018.2";
end base_zynq_FifoManagerV4_0_0;

architecture STRUCTURE of base_zynq_FifoManagerV4_0_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of CLK : signal is "xilinx.com:signal:clock:1.0 CLK CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of CLK : signal is "XIL_INTERFACENAME CLK, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN base_zynq_processing_system7_0_0_FCLK_CLK0";
begin
U0: entity work.base_zynq_FifoManagerV4_0_0_FifoManagerV4
     port map (
      CH0(11 downto 0) => CH0(11 downto 0),
      CH1(11 downto 0) => CH1(11 downto 0),
      CH10(11 downto 0) => CH10(11 downto 0),
      CH11(11 downto 0) => CH11(11 downto 0),
      CH12(11 downto 0) => CH12(11 downto 0),
      CH13(11 downto 0) => CH13(11 downto 0),
      CH14(11 downto 0) => CH14(11 downto 0),
      CH15(11 downto 0) => CH15(11 downto 0),
      CH2(11 downto 0) => CH2(11 downto 0),
      CH3(11 downto 0) => CH3(11 downto 0),
      CH4(11 downto 0) => CH4(11 downto 0),
      CH5(11 downto 0) => CH5(11 downto 0),
      CH6(11 downto 0) => CH6(11 downto 0),
      CH7(11 downto 0) => CH7(11 downto 0),
      CH8(11 downto 0) => CH8(11 downto 0),
      CH9(11 downto 0) => CH9(11 downto 0),
      CLK => CLK,
      DataOut(31 downto 0) => DataOut(31 downto 0),
      FIFO_ReadEn => FIFO_ReadEn,
      FIFO_Spare(9 downto 0) => FIFO_Spare(9 downto 0),
      FIFO_Time(63 downto 0) => FIFO_Time(63 downto 0),
      FIFO_TrigInfo(11 downto 0) => FIFO_TrigInfo(11 downto 0),
      FIFO_WdoAddr(8 downto 0) => FIFO_WdoAddr(8 downto 0),
      FIFOresponse => FIFOresponse,
      FIFOvalid => FIFOvalid,
      PRECvalid => PRECvalid,
      PSBUSY_i => PSBUSY_i,
      TestFIFO => TestFIFO,
      nRST => nRST,
      ready_i => ready_i
    );
end STRUCTURE;
