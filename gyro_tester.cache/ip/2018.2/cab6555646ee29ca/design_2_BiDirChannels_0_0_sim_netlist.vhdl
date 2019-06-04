-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Mon Jun  3 16:48:52 2019
-- Host        : LAPTOP-FM91H59Q running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_2_BiDirChannels_0_0_sim_netlist.vhdl
-- Design      : design_2_BiDirChannels_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_BiDirChannels_v1_0_S00_AXI is
  port (
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Q_reg : out STD_LOGIC_VECTOR ( 1 downto 0 );
    HS_DataOut : out STD_LOGIC;
    Q_reg_0 : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    hs_data_out_int : in STD_LOGIC;
    HS_DataIn : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    \r_reg_reg[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \r_reg_reg[7]_0\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \r_reg_reg[7]_1\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \r_reg_reg[7]_2\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_BiDirChannels_v1_0_S00_AXI;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_BiDirChannels_v1_0_S00_AXI is
  signal \^q\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^q_reg\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal aw_en_i_1_n_0 : STD_LOGIC;
  signal aw_en_reg_n_0 : STD_LOGIC;
  signal axi_araddr : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \axi_araddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_araddr[3]_i_1_n_0\ : STD_LOGIC;
  signal axi_arready0 : STD_LOGIC;
  signal \axi_awaddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_awaddr[3]_i_1_n_0\ : STD_LOGIC;
  signal axi_awready0 : STD_LOGIC;
  signal axi_awready_i_1_n_0 : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal axi_wready0 : STD_LOGIC;
  signal data_word_0 : STD_LOGIC_VECTOR ( 24 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 28 downto 0 );
  signal reg_data_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^s00_axi_arready\ : STD_LOGIC;
  signal \^s00_axi_awready\ : STD_LOGIC;
  signal \^s00_axi_bvalid\ : STD_LOGIC;
  signal \^s00_axi_rvalid\ : STD_LOGIC;
  signal \^s00_axi_wready\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[10]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[11]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[14]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[15]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[18]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[19]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[20]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[21]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[22]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[23]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[25]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[26]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[27]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[29]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[2]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[30]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[3]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[6]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[7]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[8]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[9]\ : STD_LOGIC;
  signal \slv_reg1[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[10]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[11]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[12]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[13]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[14]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[15]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[16]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[17]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[18]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[19]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[1]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[20]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[21]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[22]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[23]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[24]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[25]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[26]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[27]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[28]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[29]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[2]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[30]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[31]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[3]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[5]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[6]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[7]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[8]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[9]\ : STD_LOGIC;
  signal \slv_reg_rden__0\ : STD_LOGIC;
  signal \slv_reg_wren__0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \axi_araddr[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of axi_arready_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of axi_awready_i_2 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of axi_wready_i_1 : label is "soft_lutpair1";
begin
  Q(3 downto 0) <= \^q\(3 downto 0);
  Q_reg(1 downto 0) <= \^q_reg\(1 downto 0);
  s00_axi_arready <= \^s00_axi_arready\;
  s00_axi_awready <= \^s00_axi_awready\;
  s00_axi_bvalid <= \^s00_axi_bvalid\;
  s00_axi_rvalid <= \^s00_axi_rvalid\;
  s00_axi_wready <= \^s00_axi_wready\;
HS_DataOut_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => data_word_0(1),
      I1 => hs_data_out_int,
      I2 => data_word_0(0),
      O => HS_DataOut
    );
aw_en_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FFC4CCC4CCC4CC"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => aw_en_reg_n_0,
      I2 => \^s00_axi_awready\,
      I3 => s00_axi_wvalid,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => aw_en_i_1_n_0
    );
aw_en_reg: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => aw_en_i_1_n_0,
      Q => aw_en_reg_n_0,
      S => axi_awready_i_1_n_0
    );
\axi_araddr[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s00_axi_araddr(0),
      I1 => s00_axi_arvalid,
      I2 => \^s00_axi_arready\,
      I3 => axi_araddr(2),
      O => \axi_araddr[2]_i_1_n_0\
    );
\axi_araddr[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s00_axi_araddr(1),
      I1 => s00_axi_arvalid,
      I2 => \^s00_axi_arready\,
      I3 => axi_araddr(3),
      O => \axi_araddr[3]_i_1_n_0\
    );
\axi_araddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[2]_i_1_n_0\,
      Q => axi_araddr(2),
      R => axi_awready_i_1_n_0
    );
\axi_araddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[3]_i_1_n_0\,
      Q => axi_araddr(3),
      R => axi_awready_i_1_n_0
    );
axi_arready_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s00_axi_arready\,
      O => axi_arready0
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_arready0,
      Q => \^s00_axi_arready\,
      R => axi_awready_i_1_n_0
    );
\axi_awaddr[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFF08000000"
    )
        port map (
      I0 => s00_axi_awaddr(0),
      I1 => s00_axi_wvalid,
      I2 => \^s00_axi_awready\,
      I3 => aw_en_reg_n_0,
      I4 => s00_axi_awvalid,
      I5 => p_0_in(0),
      O => \axi_awaddr[2]_i_1_n_0\
    );
\axi_awaddr[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFF08000000"
    )
        port map (
      I0 => s00_axi_awaddr(1),
      I1 => s00_axi_wvalid,
      I2 => \^s00_axi_awready\,
      I3 => aw_en_reg_n_0,
      I4 => s00_axi_awvalid,
      I5 => p_0_in(1),
      O => \axi_awaddr[3]_i_1_n_0\
    );
\axi_awaddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[2]_i_1_n_0\,
      Q => p_0_in(0),
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[3]_i_1_n_0\,
      Q => p_0_in(1),
      R => axi_awready_i_1_n_0
    );
axi_awready_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_aresetn,
      O => axi_awready_i_1_n_0
    );
axi_awready_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \^s00_axi_awready\,
      I2 => aw_en_reg_n_0,
      I3 => s00_axi_awvalid,
      O => axi_awready0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_awready0,
      Q => \^s00_axi_awready\,
      R => axi_awready_i_1_n_0
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF80008000"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => s00_axi_wvalid,
      I2 => \^s00_axi_awready\,
      I3 => \^s00_axi_wready\,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => axi_bvalid_i_1_n_0
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_bvalid_i_1_n_0,
      Q => \^s00_axi_bvalid\,
      R => axi_awready_i_1_n_0
    );
\axi_rdata[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \^q_reg\(0),
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]\(0),
      I3 => axi_araddr(3),
      I4 => data_word_0(0),
      O => reg_data_out(0)
    );
\axi_rdata[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[10]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]_0\(2),
      I3 => axi_araddr(3),
      I4 => \slv_reg0_reg_n_0_[10]\,
      O => reg_data_out(10)
    );
\axi_rdata[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[11]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]_0\(3),
      I3 => axi_araddr(3),
      I4 => \slv_reg0_reg_n_0_[11]\,
      O => reg_data_out(11)
    );
\axi_rdata[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[12]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]_0\(4),
      I3 => axi_araddr(3),
      I4 => data_word_0(12),
      O => reg_data_out(12)
    );
\axi_rdata[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[13]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]_0\(5),
      I3 => axi_araddr(3),
      I4 => data_word_0(13),
      O => reg_data_out(13)
    );
\axi_rdata[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[14]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]_0\(6),
      I3 => axi_araddr(3),
      I4 => \slv_reg0_reg_n_0_[14]\,
      O => reg_data_out(14)
    );
\axi_rdata[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[15]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]_0\(7),
      I3 => axi_araddr(3),
      I4 => \slv_reg0_reg_n_0_[15]\,
      O => reg_data_out(15)
    );
\axi_rdata[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[16]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]_1\(0),
      I3 => axi_araddr(3),
      I4 => \^q\(0),
      O => reg_data_out(16)
    );
\axi_rdata[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[17]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]_1\(1),
      I3 => axi_araddr(3),
      I4 => \^q\(1),
      O => reg_data_out(17)
    );
\axi_rdata[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[18]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]_1\(2),
      I3 => axi_araddr(3),
      I4 => \slv_reg0_reg_n_0_[18]\,
      O => reg_data_out(18)
    );
\axi_rdata[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[19]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]_1\(3),
      I3 => axi_araddr(3),
      I4 => \slv_reg0_reg_n_0_[19]\,
      O => reg_data_out(19)
    );
\axi_rdata[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[1]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]\(1),
      I3 => axi_araddr(3),
      I4 => data_word_0(1),
      O => reg_data_out(1)
    );
\axi_rdata[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[20]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]_1\(4),
      I3 => axi_araddr(3),
      I4 => \slv_reg0_reg_n_0_[20]\,
      O => reg_data_out(20)
    );
\axi_rdata[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[21]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]_1\(5),
      I3 => axi_araddr(3),
      I4 => \slv_reg0_reg_n_0_[21]\,
      O => reg_data_out(21)
    );
\axi_rdata[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[22]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]_1\(6),
      I3 => axi_araddr(3),
      I4 => \slv_reg0_reg_n_0_[22]\,
      O => reg_data_out(22)
    );
\axi_rdata[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[23]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]_1\(7),
      I3 => axi_araddr(3),
      I4 => \slv_reg0_reg_n_0_[23]\,
      O => reg_data_out(23)
    );
\axi_rdata[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[24]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]_2\(0),
      I3 => axi_araddr(3),
      I4 => data_word_0(24),
      O => reg_data_out(24)
    );
\axi_rdata[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[25]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]_2\(1),
      I3 => axi_araddr(3),
      I4 => \slv_reg0_reg_n_0_[25]\,
      O => reg_data_out(25)
    );
\axi_rdata[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[26]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]_2\(2),
      I3 => axi_araddr(3),
      I4 => \slv_reg0_reg_n_0_[26]\,
      O => reg_data_out(26)
    );
\axi_rdata[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[27]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]_2\(3),
      I3 => axi_araddr(3),
      I4 => \slv_reg0_reg_n_0_[27]\,
      O => reg_data_out(27)
    );
\axi_rdata[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[28]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]_2\(4),
      I3 => axi_araddr(3),
      I4 => \^q\(2),
      O => reg_data_out(28)
    );
\axi_rdata[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[29]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]_2\(5),
      I3 => axi_araddr(3),
      I4 => \slv_reg0_reg_n_0_[29]\,
      O => reg_data_out(29)
    );
\axi_rdata[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[2]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]\(2),
      I3 => axi_araddr(3),
      I4 => \slv_reg0_reg_n_0_[2]\,
      O => reg_data_out(2)
    );
\axi_rdata[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[30]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]_2\(6),
      I3 => axi_araddr(3),
      I4 => \slv_reg0_reg_n_0_[30]\,
      O => reg_data_out(30)
    );
\axi_rdata[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[31]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]_2\(7),
      I3 => axi_araddr(3),
      I4 => \^q\(3),
      O => reg_data_out(31)
    );
\axi_rdata[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[3]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]\(3),
      I3 => axi_araddr(3),
      I4 => \slv_reg0_reg_n_0_[3]\,
      O => reg_data_out(3)
    );
\axi_rdata[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \^q_reg\(1),
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]\(4),
      I3 => axi_araddr(3),
      I4 => data_word_0(4),
      O => reg_data_out(4)
    );
\axi_rdata[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[5]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]\(5),
      I3 => axi_araddr(3),
      I4 => data_word_0(5),
      O => reg_data_out(5)
    );
\axi_rdata[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[6]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]\(6),
      I3 => axi_araddr(3),
      I4 => \slv_reg0_reg_n_0_[6]\,
      O => reg_data_out(6)
    );
\axi_rdata[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[7]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]\(7),
      I3 => axi_araddr(3),
      I4 => \slv_reg0_reg_n_0_[7]\,
      O => reg_data_out(7)
    );
\axi_rdata[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[8]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]_0\(0),
      I3 => axi_araddr(3),
      I4 => \slv_reg0_reg_n_0_[8]\,
      O => reg_data_out(8)
    );
\axi_rdata[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[9]\,
      I1 => axi_araddr(2),
      I2 => \r_reg_reg[7]_0\(1),
      I3 => axi_araddr(3),
      I4 => \slv_reg0_reg_n_0_[9]\,
      O => reg_data_out(9)
    );
\axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(0),
      Q => s00_axi_rdata(0),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(10),
      Q => s00_axi_rdata(10),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(11),
      Q => s00_axi_rdata(11),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(12),
      Q => s00_axi_rdata(12),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(13),
      Q => s00_axi_rdata(13),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(14),
      Q => s00_axi_rdata(14),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(15),
      Q => s00_axi_rdata(15),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(16),
      Q => s00_axi_rdata(16),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(17),
      Q => s00_axi_rdata(17),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(18),
      Q => s00_axi_rdata(18),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(19),
      Q => s00_axi_rdata(19),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(1),
      Q => s00_axi_rdata(1),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(20),
      Q => s00_axi_rdata(20),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(21),
      Q => s00_axi_rdata(21),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(22),
      Q => s00_axi_rdata(22),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(23),
      Q => s00_axi_rdata(23),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(24),
      Q => s00_axi_rdata(24),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(25),
      Q => s00_axi_rdata(25),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(26),
      Q => s00_axi_rdata(26),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(27),
      Q => s00_axi_rdata(27),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(28),
      Q => s00_axi_rdata(28),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(29),
      Q => s00_axi_rdata(29),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(2),
      Q => s00_axi_rdata(2),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(30),
      Q => s00_axi_rdata(30),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(31),
      Q => s00_axi_rdata(31),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(3),
      Q => s00_axi_rdata(3),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(4),
      Q => s00_axi_rdata(4),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(5),
      Q => s00_axi_rdata(5),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(6),
      Q => s00_axi_rdata(6),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(7),
      Q => s00_axi_rdata(7),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(8),
      Q => s00_axi_rdata(8),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(9),
      Q => s00_axi_rdata(9),
      R => axi_awready_i_1_n_0
    );
axi_rvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08F8"
    )
        port map (
      I0 => \^s00_axi_arready\,
      I1 => s00_axi_arvalid,
      I2 => \^s00_axi_rvalid\,
      I3 => s00_axi_rready,
      O => axi_rvalid_i_1_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_rvalid_i_1_n_0,
      Q => \^s00_axi_rvalid\,
      R => axi_awready_i_1_n_0
    );
axi_wready_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => s00_axi_wvalid,
      I2 => \^s00_axi_wready\,
      I3 => aw_en_reg_n_0,
      O => axi_wready0
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_wready0,
      Q => \^s00_axi_wready\,
      R => axi_awready_i_1_n_0
    );
\r_reg[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888B88"
    )
        port map (
      I0 => hs_data_out_int,
      I1 => data_word_0(24),
      I2 => data_word_0(4),
      I3 => HS_DataIn,
      I4 => data_word_0(5),
      O => D(0)
    );
\r_reg[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^q\(3),
      I1 => s00_axi_aresetn,
      O => Q_reg_0
    );
\slv_reg0[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(1),
      O => p_1_in(15)
    );
\slv_reg0[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(2),
      O => p_1_in(23)
    );
\slv_reg0[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(3),
      O => p_1_in(28)
    );
\slv_reg0[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^s00_axi_wready\,
      I1 => \^s00_axi_awready\,
      I2 => s00_axi_awvalid,
      I3 => s00_axi_wvalid,
      O => \slv_reg_wren__0\
    );
\slv_reg0[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(0),
      O => p_1_in(0)
    );
\slv_reg0_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(0),
      Q => data_word_0(0),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(10),
      Q => \slv_reg0_reg_n_0_[10]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(11),
      Q => \slv_reg0_reg_n_0_[11]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(12),
      Q => data_word_0(12),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(13),
      Q => data_word_0(13),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(14),
      Q => \slv_reg0_reg_n_0_[14]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(15),
      Q => \slv_reg0_reg_n_0_[15]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(16),
      Q => \^q\(0),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(17),
      Q => \^q\(1),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(18),
      Q => \slv_reg0_reg_n_0_[18]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(19),
      Q => \slv_reg0_reg_n_0_[19]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(1),
      Q => data_word_0(1),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(20),
      Q => \slv_reg0_reg_n_0_[20]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(21),
      Q => \slv_reg0_reg_n_0_[21]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(22),
      Q => \slv_reg0_reg_n_0_[22]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(23),
      Q => \slv_reg0_reg_n_0_[23]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(28),
      D => s00_axi_wdata(24),
      Q => data_word_0(24),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(28),
      D => s00_axi_wdata(25),
      Q => \slv_reg0_reg_n_0_[25]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(28),
      D => s00_axi_wdata(26),
      Q => \slv_reg0_reg_n_0_[26]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(28),
      D => s00_axi_wdata(27),
      Q => \slv_reg0_reg_n_0_[27]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(28),
      D => s00_axi_wdata(28),
      Q => \^q\(2),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(28),
      D => s00_axi_wdata(29),
      Q => \slv_reg0_reg_n_0_[29]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(2),
      Q => \slv_reg0_reg_n_0_[2]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(28),
      D => s00_axi_wdata(30),
      Q => \slv_reg0_reg_n_0_[30]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(28),
      D => s00_axi_wdata(31),
      Q => \^q\(3),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(3),
      Q => \slv_reg0_reg_n_0_[3]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(4),
      Q => data_word_0(4),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(5),
      Q => data_word_0(5),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(6),
      Q => \slv_reg0_reg_n_0_[6]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(7),
      Q => \slv_reg0_reg_n_0_[7]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(8),
      Q => \slv_reg0_reg_n_0_[8]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(9),
      Q => \slv_reg0_reg_n_0_[9]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(1),
      I2 => p_0_in(0),
      I3 => p_0_in(1),
      O => \slv_reg1[15]_i_1_n_0\
    );
\slv_reg1[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(2),
      I2 => p_0_in(0),
      I3 => p_0_in(1),
      O => \slv_reg1[23]_i_1_n_0\
    );
\slv_reg1[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(3),
      I2 => p_0_in(0),
      I3 => p_0_in(1),
      O => \slv_reg1[31]_i_1_n_0\
    );
\slv_reg1[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(0),
      I2 => p_0_in(0),
      I3 => p_0_in(1),
      O => \slv_reg1[7]_i_1_n_0\
    );
\slv_reg1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => \^q_reg\(0),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \slv_reg1_reg_n_0_[10]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \slv_reg1_reg_n_0_[11]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \slv_reg1_reg_n_0_[12]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \slv_reg1_reg_n_0_[13]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \slv_reg1_reg_n_0_[14]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \slv_reg1_reg_n_0_[15]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \slv_reg1_reg_n_0_[16]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \slv_reg1_reg_n_0_[17]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \slv_reg1_reg_n_0_[18]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \slv_reg1_reg_n_0_[19]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \slv_reg1_reg_n_0_[1]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \slv_reg1_reg_n_0_[20]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \slv_reg1_reg_n_0_[21]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \slv_reg1_reg_n_0_[22]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \slv_reg1_reg_n_0_[23]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \slv_reg1_reg_n_0_[24]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \slv_reg1_reg_n_0_[25]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \slv_reg1_reg_n_0_[26]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \slv_reg1_reg_n_0_[27]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \slv_reg1_reg_n_0_[28]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \slv_reg1_reg_n_0_[29]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \slv_reg1_reg_n_0_[2]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \slv_reg1_reg_n_0_[30]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \slv_reg1_reg_n_0_[31]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \slv_reg1_reg_n_0_[3]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \^q_reg\(1),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \slv_reg1_reg_n_0_[5]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \slv_reg1_reg_n_0_[6]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \slv_reg1_reg_n_0_[7]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \slv_reg1_reg_n_0_[8]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \slv_reg1_reg_n_0_[9]\,
      R => axi_awready_i_1_n_0
    );
slv_reg_rden: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s00_axi_rvalid\,
      I2 => \^s00_axi_arready\,
      O => \slv_reg_rden__0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_counter48Cycles is
  port (
    outSR_shift : out STD_LOGIC;
    in_shift_aux : out STD_LOGIC;
    HS_Clock : out STD_LOGIC;
    last_aux : out STD_LOGIC;
    out_start_stop_int : in STD_LOGIC;
    Q_reg : in STD_LOGIC;
    in_start_stop_int : in STD_LOGIC;
    \slv_reg0_reg[28]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_counter48Cycles;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_counter48Cycles is
  signal count_pulses : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \r_reg[0]_i_1__6_n_0\ : STD_LOGIC;
  signal \r_reg[1]_i_1__5_n_0\ : STD_LOGIC;
  signal \r_reg[2]_i_1__5_n_0\ : STD_LOGIC;
  signal \r_reg[3]_i_1__4_n_0\ : STD_LOGIC;
  signal \r_reg[4]_i_1__4_n_0\ : STD_LOGIC;
  signal \r_reg[5]_i_1__4_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \r_reg[0]_i_1__6\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \r_reg[1]_i_1__5\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \r_reg[2]_i_1__5\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \r_reg[3]_i_1__4\ : label is "soft_lutpair20";
begin
HS_Clock_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A956AAAA"
    )
        port map (
      I0 => \slv_reg0_reg[28]\(0),
      I1 => count_pulses(5),
      I2 => count_pulses(3),
      I3 => count_pulses(4),
      I4 => Q_reg,
      O => HS_Clock
    );
\Q_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02A80000"
    )
        port map (
      I0 => in_start_stop_int,
      I1 => count_pulses(5),
      I2 => count_pulses(3),
      I3 => count_pulses(4),
      I4 => Q_reg,
      O => in_shift_aux
    );
\Q_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => count_pulses(0),
      I1 => count_pulses(5),
      I2 => count_pulses(3),
      I3 => count_pulses(4),
      I4 => count_pulses(1),
      I5 => count_pulses(2),
      O => last_aux
    );
\r_reg[0]_i_1__6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_pulses(0),
      O => \r_reg[0]_i_1__6_n_0\
    );
\r_reg[1]_i_1__5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => count_pulses(0),
      I1 => count_pulses(1),
      O => \r_reg[1]_i_1__5_n_0\
    );
\r_reg[2]_i_1__5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
        port map (
      I0 => count_pulses(2),
      I1 => count_pulses(0),
      I2 => count_pulses(1),
      O => \r_reg[2]_i_1__5_n_0\
    );
\r_reg[32]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02A80000"
    )
        port map (
      I0 => out_start_stop_int,
      I1 => count_pulses(5),
      I2 => count_pulses(3),
      I3 => count_pulses(4),
      I4 => Q_reg,
      O => outSR_shift
    );
\r_reg[3]_i_1__4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CCC9"
    )
        port map (
      I0 => count_pulses(2),
      I1 => count_pulses(3),
      I2 => count_pulses(0),
      I3 => count_pulses(1),
      O => \r_reg[3]_i_1__4_n_0\
    );
\r_reg[4]_i_1__4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCCCC2"
    )
        port map (
      I0 => count_pulses(5),
      I1 => count_pulses(4),
      I2 => count_pulses(2),
      I3 => count_pulses(0),
      I4 => count_pulses(1),
      I5 => count_pulses(3),
      O => \r_reg[4]_i_1__4_n_0\
    );
\r_reg[5]_i_1__4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000001"
    )
        port map (
      I0 => count_pulses(2),
      I1 => count_pulses(3),
      I2 => count_pulses(0),
      I3 => count_pulses(1),
      I4 => count_pulses(4),
      I5 => count_pulses(5),
      O => \r_reg[5]_i_1__4_n_0\
    );
\r_reg_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_reg[0]_i_1__6_n_0\,
      Q => count_pulses(0)
    );
\r_reg_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_reg[1]_i_1__5_n_0\,
      Q => count_pulses(1)
    );
\r_reg_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_reg[2]_i_1__5_n_0\,
      Q => count_pulses(2)
    );
\r_reg_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_reg[3]_i_1__4_n_0\,
      Q => count_pulses(3)
    );
\r_reg_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_reg[4]_i_1__4_n_0\,
      Q => count_pulses(4)
    );
\r_reg_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_reg[5]_i_1__4_n_0\,
      Q => count_pulses(5)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff is
  port (
    m00_axis_tlast : out STD_LOGIC;
    rx_fifo_last_int : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff is
begin
Q_reg: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => rx_fifo_last_int,
      Q => m00_axis_tlast
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_14 is
  port (
    Q_reg_0 : out STD_LOGIC;
    CLK : in STD_LOGIC;
    MCK : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_14 : entity is "dff";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_14;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_14 is
begin
Q_reg: unisim.vcomponents.FDCE
     port map (
      C => MCK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => CLK,
      Q => Q_reg_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_15 is
  port (
    MCK : out STD_LOGIC;
    clock_base : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_15 : entity is "dff";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_15;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_15 is
  signal D0 : STD_LOGIC;
  signal \^mck\ : STD_LOGIC;
begin
  MCK <= \^mck\;
\Q_i_1__4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^mck\,
      O => D0
    );
Q_reg: unisim.vcomponents.FDCE
     port map (
      C => clock_base,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => D0,
      Q => \^mck\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_2 is
  port (
    a : out STD_LOGIC;
    in_next_int : in STD_LOGIC;
    clk0 : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_2 : entity is "dff";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_2;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_2 is
begin
Q_reg: unisim.vcomponents.FDCE
     port map (
      C => clk0,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => in_next_int,
      Q => a
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_3 is
  port (
    b : out STD_LOGIC;
    a : in STD_LOGIC;
    clk0 : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_3 : entity is "dff";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_3;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_3 is
begin
Q_reg: unisim.vcomponents.FDCE
     port map (
      C => clk0,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => a,
      Q => b
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_4 is
  port (
    a : out STD_LOGIC;
    out_next_int : in STD_LOGIC;
    clk0 : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_4 : entity is "dff";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_4;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_4 is
begin
Q_reg: unisim.vcomponents.FDCE
     port map (
      C => clk0,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => out_next_int,
      Q => a
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_5 is
  port (
    b : out STD_LOGIC;
    \r_reg_reg[31]_P\ : out STD_LOGIC;
    \r_reg_reg[30]_P\ : out STD_LOGIC;
    \r_reg_reg[29]_P\ : out STD_LOGIC;
    \r_reg_reg[28]_P\ : out STD_LOGIC;
    \r_reg_reg[27]_P\ : out STD_LOGIC;
    \r_reg_reg[26]_P\ : out STD_LOGIC;
    \r_reg_reg[25]_P\ : out STD_LOGIC;
    \r_reg_reg[24]_P\ : out STD_LOGIC;
    \r_reg_reg[23]_P\ : out STD_LOGIC;
    \r_reg_reg[22]_P\ : out STD_LOGIC;
    \r_reg_reg[21]_P\ : out STD_LOGIC;
    \r_reg_reg[20]_P\ : out STD_LOGIC;
    \r_reg_reg[19]_P\ : out STD_LOGIC;
    \r_reg_reg[18]_P\ : out STD_LOGIC;
    \r_reg_reg[17]_P\ : out STD_LOGIC;
    \r_reg_reg[16]_P\ : out STD_LOGIC;
    \r_reg_reg[15]_P\ : out STD_LOGIC;
    \r_reg_reg[14]_P\ : out STD_LOGIC;
    \r_reg_reg[13]_P\ : out STD_LOGIC;
    \r_reg_reg[12]_P\ : out STD_LOGIC;
    \r_reg_reg[11]_P\ : out STD_LOGIC;
    \r_reg_reg[10]_P\ : out STD_LOGIC;
    \r_reg_reg[9]_P\ : out STD_LOGIC;
    \r_reg_reg[8]_P\ : out STD_LOGIC;
    \r_reg_reg[7]_P\ : out STD_LOGIC;
    \r_reg_reg[6]_P\ : out STD_LOGIC;
    \r_reg_reg[5]_P\ : out STD_LOGIC;
    \r_reg_reg[4]_P\ : out STD_LOGIC;
    \r_reg_reg[3]_P\ : out STD_LOGIC;
    \r_reg_reg[2]_P\ : out STD_LOGIC;
    \r_reg_reg[1]_P\ : out STD_LOGIC;
    \r_reg_reg[0]_P\ : out STD_LOGIC;
    \r_reg_reg[32]\ : out STD_LOGIC;
    \r_reg_reg[1]_P_0\ : out STD_LOGIC;
    \r_reg_reg[1]_C\ : out STD_LOGIC;
    \r_reg_reg[2]_C\ : out STD_LOGIC;
    \r_reg_reg[3]_C\ : out STD_LOGIC;
    \r_reg_reg[4]_C\ : out STD_LOGIC;
    \r_reg_reg[5]_C\ : out STD_LOGIC;
    \r_reg_reg[6]_C\ : out STD_LOGIC;
    \r_reg_reg[7]_C\ : out STD_LOGIC;
    \r_reg_reg[8]_C\ : out STD_LOGIC;
    \r_reg_reg[9]_C\ : out STD_LOGIC;
    \r_reg_reg[10]_C\ : out STD_LOGIC;
    \r_reg_reg[11]_C\ : out STD_LOGIC;
    \r_reg_reg[12]_C\ : out STD_LOGIC;
    \r_reg_reg[13]_C\ : out STD_LOGIC;
    \r_reg_reg[14]_C\ : out STD_LOGIC;
    \r_reg_reg[15]_C\ : out STD_LOGIC;
    \r_reg_reg[16]_C\ : out STD_LOGIC;
    \r_reg_reg[17]_C\ : out STD_LOGIC;
    \r_reg_reg[18]_C\ : out STD_LOGIC;
    \r_reg_reg[19]_C\ : out STD_LOGIC;
    \r_reg_reg[20]_C\ : out STD_LOGIC;
    \r_reg_reg[21]_C\ : out STD_LOGIC;
    \r_reg_reg[22]_C\ : out STD_LOGIC;
    \r_reg_reg[23]_C\ : out STD_LOGIC;
    \r_reg_reg[24]_C\ : out STD_LOGIC;
    \r_reg_reg[25]_C\ : out STD_LOGIC;
    \r_reg_reg[26]_C\ : out STD_LOGIC;
    \r_reg_reg[27]_C\ : out STD_LOGIC;
    \r_reg_reg[28]_C\ : out STD_LOGIC;
    \r_reg_reg[29]_C\ : out STD_LOGIC;
    \r_reg_reg[30]_C\ : out STD_LOGIC;
    \r_reg_reg[31]_C\ : out STD_LOGIC;
    a : in STD_LOGIC;
    clk0 : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC;
    Q_reg_0 : in STD_LOGIC;
    out_start_stop_int : in STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC;
    \slv_reg0_reg[31]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_aresetn : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_5 : entity is "dff";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_5;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_5 is
  signal \^b\ : STD_LOGIC;
  signal \load0__0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \r_reg_reg[0]_LDC_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \r_reg_reg[0]_LDC_i_2\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \r_reg_reg[10]_LDC_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \r_reg_reg[10]_LDC_i_2\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \r_reg_reg[11]_LDC_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \r_reg_reg[11]_LDC_i_2\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \r_reg_reg[12]_LDC_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \r_reg_reg[12]_LDC_i_2\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \r_reg_reg[13]_LDC_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \r_reg_reg[13]_LDC_i_2\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \r_reg_reg[14]_LDC_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \r_reg_reg[14]_LDC_i_2\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \r_reg_reg[15]_LDC_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \r_reg_reg[15]_LDC_i_2\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \r_reg_reg[16]_LDC_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \r_reg_reg[16]_LDC_i_2\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \r_reg_reg[17]_LDC_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \r_reg_reg[17]_LDC_i_2\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \r_reg_reg[18]_LDC_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \r_reg_reg[18]_LDC_i_2\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \r_reg_reg[19]_LDC_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \r_reg_reg[19]_LDC_i_2\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \r_reg_reg[1]_LDC_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \r_reg_reg[1]_LDC_i_2\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \r_reg_reg[20]_LDC_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \r_reg_reg[20]_LDC_i_2\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \r_reg_reg[21]_LDC_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \r_reg_reg[21]_LDC_i_2\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \r_reg_reg[22]_LDC_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \r_reg_reg[22]_LDC_i_2\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \r_reg_reg[23]_LDC_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \r_reg_reg[23]_LDC_i_2\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \r_reg_reg[24]_LDC_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \r_reg_reg[24]_LDC_i_2\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \r_reg_reg[25]_LDC_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \r_reg_reg[25]_LDC_i_2\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \r_reg_reg[26]_LDC_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \r_reg_reg[26]_LDC_i_2\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \r_reg_reg[27]_LDC_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \r_reg_reg[27]_LDC_i_2\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \r_reg_reg[28]_LDC_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \r_reg_reg[28]_LDC_i_2\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \r_reg_reg[29]_LDC_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \r_reg_reg[29]_LDC_i_2\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \r_reg_reg[2]_LDC_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \r_reg_reg[2]_LDC_i_2\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \r_reg_reg[30]_LDC_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \r_reg_reg[30]_LDC_i_2\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \r_reg_reg[31]_LDC_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \r_reg_reg[31]_LDC_i_2\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \r_reg_reg[3]_LDC_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \r_reg_reg[3]_LDC_i_2\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \r_reg_reg[4]_LDC_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \r_reg_reg[4]_LDC_i_2\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \r_reg_reg[5]_LDC_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \r_reg_reg[5]_LDC_i_2\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \r_reg_reg[6]_LDC_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \r_reg_reg[6]_LDC_i_2\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \r_reg_reg[7]_LDC_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \r_reg_reg[7]_LDC_i_2\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \r_reg_reg[8]_LDC_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \r_reg_reg[8]_LDC_i_2\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \r_reg_reg[9]_LDC_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \r_reg_reg[9]_LDC_i_2\ : label is "soft_lutpair44";
begin
  b <= \^b\;
Q_reg: unisim.vcomponents.FDCE
     port map (
      C => clk0,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => a,
      Q => \^b\
    );
\r_reg[32]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => \load0__0\,
      I1 => \slv_reg0_reg[31]_0\(0),
      I2 => s00_axi_aresetn,
      O => \r_reg_reg[32]\
    );
\r_reg[32]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"60000000"
    )
        port map (
      I0 => \^b\,
      I1 => a,
      I2 => Q_reg_0,
      I3 => out_start_stop_int,
      I4 => s00_axis_tvalid,
      O => \load0__0\
    );
\r_reg_reg[0]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(0),
      O => \r_reg_reg[0]_P\
    );
\r_reg_reg[0]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(0),
      O => \r_reg_reg[1]_P_0\
    );
\r_reg_reg[10]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(10),
      O => \r_reg_reg[10]_P\
    );
\r_reg_reg[10]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(10),
      O => \r_reg_reg[10]_C\
    );
\r_reg_reg[11]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(11),
      O => \r_reg_reg[11]_P\
    );
\r_reg_reg[11]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(11),
      O => \r_reg_reg[11]_C\
    );
\r_reg_reg[12]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(12),
      O => \r_reg_reg[12]_P\
    );
\r_reg_reg[12]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(12),
      O => \r_reg_reg[12]_C\
    );
\r_reg_reg[13]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(13),
      O => \r_reg_reg[13]_P\
    );
\r_reg_reg[13]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(13),
      O => \r_reg_reg[13]_C\
    );
\r_reg_reg[14]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(14),
      O => \r_reg_reg[14]_P\
    );
\r_reg_reg[14]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(14),
      O => \r_reg_reg[14]_C\
    );
\r_reg_reg[15]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(15),
      O => \r_reg_reg[15]_P\
    );
\r_reg_reg[15]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(15),
      O => \r_reg_reg[15]_C\
    );
\r_reg_reg[16]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(16),
      O => \r_reg_reg[16]_P\
    );
\r_reg_reg[16]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(16),
      O => \r_reg_reg[16]_C\
    );
\r_reg_reg[17]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(17),
      O => \r_reg_reg[17]_P\
    );
\r_reg_reg[17]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(17),
      O => \r_reg_reg[17]_C\
    );
\r_reg_reg[18]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(18),
      O => \r_reg_reg[18]_P\
    );
\r_reg_reg[18]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(18),
      O => \r_reg_reg[18]_C\
    );
\r_reg_reg[19]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(19),
      O => \r_reg_reg[19]_P\
    );
\r_reg_reg[19]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(19),
      O => \r_reg_reg[19]_C\
    );
\r_reg_reg[1]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(1),
      O => \r_reg_reg[1]_P\
    );
\r_reg_reg[1]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(1),
      O => \r_reg_reg[1]_C\
    );
\r_reg_reg[20]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(20),
      O => \r_reg_reg[20]_P\
    );
\r_reg_reg[20]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(20),
      O => \r_reg_reg[20]_C\
    );
\r_reg_reg[21]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(21),
      O => \r_reg_reg[21]_P\
    );
\r_reg_reg[21]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(21),
      O => \r_reg_reg[21]_C\
    );
\r_reg_reg[22]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(22),
      O => \r_reg_reg[22]_P\
    );
\r_reg_reg[22]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(22),
      O => \r_reg_reg[22]_C\
    );
\r_reg_reg[23]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(23),
      O => \r_reg_reg[23]_P\
    );
\r_reg_reg[23]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(23),
      O => \r_reg_reg[23]_C\
    );
\r_reg_reg[24]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(24),
      O => \r_reg_reg[24]_P\
    );
\r_reg_reg[24]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(24),
      O => \r_reg_reg[24]_C\
    );
\r_reg_reg[25]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(25),
      O => \r_reg_reg[25]_P\
    );
\r_reg_reg[25]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(25),
      O => \r_reg_reg[25]_C\
    );
\r_reg_reg[26]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(26),
      O => \r_reg_reg[26]_P\
    );
\r_reg_reg[26]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(26),
      O => \r_reg_reg[26]_C\
    );
\r_reg_reg[27]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(27),
      O => \r_reg_reg[27]_P\
    );
\r_reg_reg[27]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(27),
      O => \r_reg_reg[27]_C\
    );
\r_reg_reg[28]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(28),
      O => \r_reg_reg[28]_P\
    );
\r_reg_reg[28]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(28),
      O => \r_reg_reg[28]_C\
    );
\r_reg_reg[29]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(29),
      O => \r_reg_reg[29]_P\
    );
\r_reg_reg[29]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(29),
      O => \r_reg_reg[29]_C\
    );
\r_reg_reg[2]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(2),
      O => \r_reg_reg[2]_P\
    );
\r_reg_reg[2]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(2),
      O => \r_reg_reg[2]_C\
    );
\r_reg_reg[30]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(30),
      O => \r_reg_reg[30]_P\
    );
\r_reg_reg[30]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(30),
      O => \r_reg_reg[30]_C\
    );
\r_reg_reg[31]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(31),
      O => \r_reg_reg[31]_P\
    );
\r_reg_reg[31]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(31),
      O => \r_reg_reg[31]_C\
    );
\r_reg_reg[3]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(3),
      O => \r_reg_reg[3]_P\
    );
\r_reg_reg[3]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(3),
      O => \r_reg_reg[3]_C\
    );
\r_reg_reg[4]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(4),
      O => \r_reg_reg[4]_P\
    );
\r_reg_reg[4]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(4),
      O => \r_reg_reg[4]_C\
    );
\r_reg_reg[5]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(5),
      O => \r_reg_reg[5]_P\
    );
\r_reg_reg[5]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(5),
      O => \r_reg_reg[5]_C\
    );
\r_reg_reg[6]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(6),
      O => \r_reg_reg[6]_P\
    );
\r_reg_reg[6]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(6),
      O => \r_reg_reg[6]_C\
    );
\r_reg_reg[7]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(7),
      O => \r_reg_reg[7]_P\
    );
\r_reg_reg[7]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(7),
      O => \r_reg_reg[7]_C\
    );
\r_reg_reg[8]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(8),
      O => \r_reg_reg[8]_P\
    );
\r_reg_reg[8]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(8),
      O => \r_reg_reg[8]_C\
    );
\r_reg_reg[9]_LDC_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(9),
      O => \r_reg_reg[9]_P\
    );
\r_reg_reg[9]_LDC_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\(0),
      I1 => s00_axi_aresetn,
      I2 => \load0__0\,
      I3 => Q(9),
      O => \r_reg_reg[9]_C\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_6 is
  port (
    in_start_stop_int : out STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    \slv_reg1_reg[4]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q_reg_0 : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC;
    a_0 : in STD_LOGIC;
    b_1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_6 : entity is "dff";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_6;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_6 is
  signal \^in_start_stop_int\ : STD_LOGIC;
begin
  in_start_stop_int <= \^in_start_stop_int\;
Q_reg: unisim.vcomponents.FDCE
     port map (
      C => Q_reg_0,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \slv_reg1_reg[4]\(0),
      Q => \^in_start_stop_int\
    );
m00_axis_tvalid_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0880"
    )
        port map (
      I0 => \^in_start_stop_int\,
      I1 => Q_reg_0,
      I2 => a_0,
      I3 => b_1,
      O => m00_axis_tvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_7 is
  port (
    out_start_stop_int : out STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    \slv_reg1_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q_reg_0 : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC;
    a : in STD_LOGIC;
    b : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_7 : entity is "dff";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_7;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_7 is
  signal \^out_start_stop_int\ : STD_LOGIC;
begin
  out_start_stop_int <= \^out_start_stop_int\;
Q_reg: unisim.vcomponents.FDCE
     port map (
      C => Q_reg_0,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \slv_reg1_reg[0]\(0),
      Q => \^out_start_stop_int\
    );
s00_axis_tready_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0880"
    )
        port map (
      I0 => \^out_start_stop_int\,
      I1 => Q_reg_0,
      I2 => a,
      I3 => b,
      O => s00_axis_tready
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_8 is
  port (
    CLK : out STD_LOGIC;
    in_shift_aux : in STD_LOGIC;
    Q_reg_0 : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_8 : entity is "dff";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_8;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_8 is
begin
Q_reg: unisim.vcomponents.FDCE
     port map (
      C => Q_reg_0,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => in_shift_aux,
      Q => CLK
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_9 is
  port (
    Q_reg_0 : out STD_LOGIC;
    out_next_int : out STD_LOGIC;
    in_next_int : out STD_LOGIC;
    last_aux : in STD_LOGIC;
    Q_reg_1 : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC;
    out_start_stop_int : in STD_LOGIC;
    in_start_stop_int : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_9 : entity is "dff";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_9;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_9 is
  signal \^q_reg_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of Q_i_1 : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \Q_i_1__0\ : label is "soft_lutpair19";
begin
  Q_reg_0 <= \^q_reg_0\;
Q_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q_reg_0\,
      I1 => out_start_stop_int,
      O => out_next_int
    );
\Q_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q_reg_0\,
      I1 => in_start_stop_int,
      O => in_next_int
    );
Q_reg: unisim.vcomponents.FDCE
     port map (
      C => Q_reg_1,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => last_aux,
      Q => \^q_reg_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_inputShiftRegister32Bits is
  port (
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLK : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_inputShiftRegister32Bits;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_inputShiftRegister32Bits is
  signal \^m00_axis_tdata\ : STD_LOGIC_VECTOR ( 31 downto 0 );
begin
  m00_axis_tdata(31 downto 0) <= \^m00_axis_tdata\(31 downto 0);
\r_reg_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => D(0),
      Q => \^m00_axis_tdata\(0)
    );
\r_reg_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(9),
      Q => \^m00_axis_tdata\(10)
    );
\r_reg_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(10),
      Q => \^m00_axis_tdata\(11)
    );
\r_reg_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(11),
      Q => \^m00_axis_tdata\(12)
    );
\r_reg_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(12),
      Q => \^m00_axis_tdata\(13)
    );
\r_reg_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(13),
      Q => \^m00_axis_tdata\(14)
    );
\r_reg_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(14),
      Q => \^m00_axis_tdata\(15)
    );
\r_reg_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(15),
      Q => \^m00_axis_tdata\(16)
    );
\r_reg_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(16),
      Q => \^m00_axis_tdata\(17)
    );
\r_reg_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(17),
      Q => \^m00_axis_tdata\(18)
    );
\r_reg_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(18),
      Q => \^m00_axis_tdata\(19)
    );
\r_reg_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(0),
      Q => \^m00_axis_tdata\(1)
    );
\r_reg_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(19),
      Q => \^m00_axis_tdata\(20)
    );
\r_reg_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(20),
      Q => \^m00_axis_tdata\(21)
    );
\r_reg_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(21),
      Q => \^m00_axis_tdata\(22)
    );
\r_reg_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(22),
      Q => \^m00_axis_tdata\(23)
    );
\r_reg_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(23),
      Q => \^m00_axis_tdata\(24)
    );
\r_reg_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(24),
      Q => \^m00_axis_tdata\(25)
    );
\r_reg_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(25),
      Q => \^m00_axis_tdata\(26)
    );
\r_reg_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(26),
      Q => \^m00_axis_tdata\(27)
    );
\r_reg_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(27),
      Q => \^m00_axis_tdata\(28)
    );
\r_reg_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(28),
      Q => \^m00_axis_tdata\(29)
    );
\r_reg_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(1),
      Q => \^m00_axis_tdata\(2)
    );
\r_reg_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(29),
      Q => \^m00_axis_tdata\(30)
    );
\r_reg_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(30),
      Q => \^m00_axis_tdata\(31)
    );
\r_reg_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(2),
      Q => \^m00_axis_tdata\(3)
    );
\r_reg_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(3),
      Q => \^m00_axis_tdata\(4)
    );
\r_reg_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(4),
      Q => \^m00_axis_tdata\(5)
    );
\r_reg_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(5),
      Q => \^m00_axis_tdata\(6)
    );
\r_reg_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(6),
      Q => \^m00_axis_tdata\(7)
    );
\r_reg_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(7),
      Q => \^m00_axis_tdata\(8)
    );
\r_reg_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \^m00_axis_tdata\(8),
      Q => \^m00_axis_tdata\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_outputShiftRegister32Bits is
  port (
    hs_data_out_int : out STD_LOGIC;
    outSR_shift : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC;
    \slv_reg0_reg[31]_0\ : in STD_LOGIC;
    \slv_reg0_reg[31]_1\ : in STD_LOGIC;
    \slv_reg0_reg[31]_2\ : in STD_LOGIC;
    \slv_reg0_reg[31]_3\ : in STD_LOGIC;
    \slv_reg0_reg[31]_4\ : in STD_LOGIC;
    \slv_reg0_reg[31]_5\ : in STD_LOGIC;
    \slv_reg0_reg[31]_6\ : in STD_LOGIC;
    \slv_reg0_reg[31]_7\ : in STD_LOGIC;
    \slv_reg0_reg[31]_8\ : in STD_LOGIC;
    \slv_reg0_reg[31]_9\ : in STD_LOGIC;
    \slv_reg0_reg[31]_10\ : in STD_LOGIC;
    \slv_reg0_reg[31]_11\ : in STD_LOGIC;
    \slv_reg0_reg[31]_12\ : in STD_LOGIC;
    \slv_reg0_reg[31]_13\ : in STD_LOGIC;
    \slv_reg0_reg[31]_14\ : in STD_LOGIC;
    \slv_reg0_reg[31]_15\ : in STD_LOGIC;
    \slv_reg0_reg[31]_16\ : in STD_LOGIC;
    \slv_reg0_reg[31]_17\ : in STD_LOGIC;
    \slv_reg0_reg[31]_18\ : in STD_LOGIC;
    \slv_reg0_reg[31]_19\ : in STD_LOGIC;
    \slv_reg0_reg[31]_20\ : in STD_LOGIC;
    \slv_reg0_reg[31]_21\ : in STD_LOGIC;
    \slv_reg0_reg[31]_22\ : in STD_LOGIC;
    \slv_reg0_reg[31]_23\ : in STD_LOGIC;
    \slv_reg0_reg[31]_24\ : in STD_LOGIC;
    \slv_reg0_reg[31]_25\ : in STD_LOGIC;
    \slv_reg0_reg[31]_26\ : in STD_LOGIC;
    \slv_reg0_reg[31]_27\ : in STD_LOGIC;
    \slv_reg0_reg[31]_28\ : in STD_LOGIC;
    \slv_reg0_reg[31]_29\ : in STD_LOGIC;
    \slv_reg0_reg[31]_30\ : in STD_LOGIC;
    \slv_reg0_reg[31]_31\ : in STD_LOGIC;
    \slv_reg0_reg[31]_32\ : in STD_LOGIC;
    \slv_reg0_reg[31]_33\ : in STD_LOGIC;
    \slv_reg0_reg[31]_34\ : in STD_LOGIC;
    \slv_reg0_reg[31]_35\ : in STD_LOGIC;
    \slv_reg0_reg[31]_36\ : in STD_LOGIC;
    \slv_reg0_reg[31]_37\ : in STD_LOGIC;
    \slv_reg0_reg[31]_38\ : in STD_LOGIC;
    \slv_reg0_reg[31]_39\ : in STD_LOGIC;
    \slv_reg0_reg[31]_40\ : in STD_LOGIC;
    \slv_reg0_reg[31]_41\ : in STD_LOGIC;
    \slv_reg0_reg[31]_42\ : in STD_LOGIC;
    \slv_reg0_reg[31]_43\ : in STD_LOGIC;
    \slv_reg0_reg[31]_44\ : in STD_LOGIC;
    \slv_reg0_reg[31]_45\ : in STD_LOGIC;
    \slv_reg0_reg[31]_46\ : in STD_LOGIC;
    \slv_reg0_reg[31]_47\ : in STD_LOGIC;
    \slv_reg0_reg[31]_48\ : in STD_LOGIC;
    \slv_reg0_reg[31]_49\ : in STD_LOGIC;
    \slv_reg0_reg[31]_50\ : in STD_LOGIC;
    \slv_reg0_reg[31]_51\ : in STD_LOGIC;
    \slv_reg0_reg[31]_52\ : in STD_LOGIC;
    \slv_reg0_reg[31]_53\ : in STD_LOGIC;
    \slv_reg0_reg[31]_54\ : in STD_LOGIC;
    \slv_reg0_reg[31]_55\ : in STD_LOGIC;
    \slv_reg0_reg[31]_56\ : in STD_LOGIC;
    \slv_reg0_reg[31]_57\ : in STD_LOGIC;
    \slv_reg0_reg[31]_58\ : in STD_LOGIC;
    \slv_reg0_reg[31]_59\ : in STD_LOGIC;
    \slv_reg0_reg[31]_60\ : in STD_LOGIC;
    \slv_reg0_reg[31]_61\ : in STD_LOGIC;
    \slv_reg0_reg[31]_62\ : in STD_LOGIC;
    \slv_reg0_reg[31]_63\ : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_outputShiftRegister32Bits;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_outputShiftRegister32Bits is
  signal r_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \r_reg_reg[0]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[0]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[10]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[10]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[10]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[11]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[11]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[11]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[12]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[12]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[12]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[13]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[13]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[13]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[14]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[14]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[14]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[15]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[15]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[15]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[16]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[16]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[16]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[17]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[17]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[17]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[18]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[18]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[18]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[19]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[19]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[19]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[1]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[1]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[1]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[20]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[20]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[20]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[21]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[21]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[21]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[22]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[22]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[22]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[23]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[23]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[23]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[24]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[24]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[24]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[25]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[25]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[25]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[26]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[26]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[26]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[27]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[27]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[27]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[28]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[28]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[28]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[29]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[29]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[29]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[2]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[2]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[2]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[30]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[30]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[30]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[31]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[31]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[31]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[3]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[3]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[3]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[4]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[4]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[4]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[5]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[5]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[5]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[6]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[6]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[6]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[7]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[7]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[7]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[8]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[8]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[8]_P_n_0\ : STD_LOGIC;
  signal \r_reg_reg[9]_C_n_0\ : STD_LOGIC;
  signal \r_reg_reg[9]_LDC_n_0\ : STD_LOGIC;
  signal \r_reg_reg[9]_P_n_0\ : STD_LOGIC;
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[0]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[10]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[11]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[12]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[13]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[14]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[15]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[16]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[17]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[18]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[19]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[1]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[20]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[21]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[22]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[23]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[24]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[25]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[26]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[27]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[28]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[29]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[2]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[30]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[31]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[3]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[4]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[5]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[6]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[7]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[8]_LDC\ : label is "LDC";
  attribute XILINX_LEGACY_PRIM of \r_reg_reg[9]_LDC\ : label is "LDC";
begin
\r_reg[10]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[9]_P_n_0\,
      I1 => \r_reg_reg[9]_LDC_n_0\,
      I2 => \r_reg_reg[9]_C_n_0\,
      O => r_reg(9)
    );
\r_reg[11]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[10]_P_n_0\,
      I1 => \r_reg_reg[10]_LDC_n_0\,
      I2 => \r_reg_reg[10]_C_n_0\,
      O => r_reg(10)
    );
\r_reg[12]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[11]_P_n_0\,
      I1 => \r_reg_reg[11]_LDC_n_0\,
      I2 => \r_reg_reg[11]_C_n_0\,
      O => r_reg(11)
    );
\r_reg[13]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[12]_P_n_0\,
      I1 => \r_reg_reg[12]_LDC_n_0\,
      I2 => \r_reg_reg[12]_C_n_0\,
      O => r_reg(12)
    );
\r_reg[14]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[13]_P_n_0\,
      I1 => \r_reg_reg[13]_LDC_n_0\,
      I2 => \r_reg_reg[13]_C_n_0\,
      O => r_reg(13)
    );
\r_reg[15]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[14]_P_n_0\,
      I1 => \r_reg_reg[14]_LDC_n_0\,
      I2 => \r_reg_reg[14]_C_n_0\,
      O => r_reg(14)
    );
\r_reg[16]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[15]_P_n_0\,
      I1 => \r_reg_reg[15]_LDC_n_0\,
      I2 => \r_reg_reg[15]_C_n_0\,
      O => r_reg(15)
    );
\r_reg[17]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[16]_P_n_0\,
      I1 => \r_reg_reg[16]_LDC_n_0\,
      I2 => \r_reg_reg[16]_C_n_0\,
      O => r_reg(16)
    );
\r_reg[18]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[17]_P_n_0\,
      I1 => \r_reg_reg[17]_LDC_n_0\,
      I2 => \r_reg_reg[17]_C_n_0\,
      O => r_reg(17)
    );
\r_reg[19]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[18]_P_n_0\,
      I1 => \r_reg_reg[18]_LDC_n_0\,
      I2 => \r_reg_reg[18]_C_n_0\,
      O => r_reg(18)
    );
\r_reg[1]_C_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \r_reg_reg[0]_LDC_n_0\,
      I1 => \r_reg_reg[0]_P_n_0\,
      O => r_reg(0)
    );
\r_reg[20]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[19]_P_n_0\,
      I1 => \r_reg_reg[19]_LDC_n_0\,
      I2 => \r_reg_reg[19]_C_n_0\,
      O => r_reg(19)
    );
\r_reg[21]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[20]_P_n_0\,
      I1 => \r_reg_reg[20]_LDC_n_0\,
      I2 => \r_reg_reg[20]_C_n_0\,
      O => r_reg(20)
    );
\r_reg[22]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[21]_P_n_0\,
      I1 => \r_reg_reg[21]_LDC_n_0\,
      I2 => \r_reg_reg[21]_C_n_0\,
      O => r_reg(21)
    );
\r_reg[23]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[22]_P_n_0\,
      I1 => \r_reg_reg[22]_LDC_n_0\,
      I2 => \r_reg_reg[22]_C_n_0\,
      O => r_reg(22)
    );
\r_reg[24]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[23]_P_n_0\,
      I1 => \r_reg_reg[23]_LDC_n_0\,
      I2 => \r_reg_reg[23]_C_n_0\,
      O => r_reg(23)
    );
\r_reg[25]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[24]_P_n_0\,
      I1 => \r_reg_reg[24]_LDC_n_0\,
      I2 => \r_reg_reg[24]_C_n_0\,
      O => r_reg(24)
    );
\r_reg[26]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[25]_P_n_0\,
      I1 => \r_reg_reg[25]_LDC_n_0\,
      I2 => \r_reg_reg[25]_C_n_0\,
      O => r_reg(25)
    );
\r_reg[27]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[26]_P_n_0\,
      I1 => \r_reg_reg[26]_LDC_n_0\,
      I2 => \r_reg_reg[26]_C_n_0\,
      O => r_reg(26)
    );
\r_reg[28]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[27]_P_n_0\,
      I1 => \r_reg_reg[27]_LDC_n_0\,
      I2 => \r_reg_reg[27]_C_n_0\,
      O => r_reg(27)
    );
\r_reg[29]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[28]_P_n_0\,
      I1 => \r_reg_reg[28]_LDC_n_0\,
      I2 => \r_reg_reg[28]_C_n_0\,
      O => r_reg(28)
    );
\r_reg[2]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[1]_P_n_0\,
      I1 => \r_reg_reg[1]_LDC_n_0\,
      I2 => \r_reg_reg[1]_C_n_0\,
      O => r_reg(1)
    );
\r_reg[30]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[29]_P_n_0\,
      I1 => \r_reg_reg[29]_LDC_n_0\,
      I2 => \r_reg_reg[29]_C_n_0\,
      O => r_reg(29)
    );
\r_reg[31]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[30]_P_n_0\,
      I1 => \r_reg_reg[30]_LDC_n_0\,
      I2 => \r_reg_reg[30]_C_n_0\,
      O => r_reg(30)
    );
\r_reg[32]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[31]_P_n_0\,
      I1 => \r_reg_reg[31]_LDC_n_0\,
      I2 => \r_reg_reg[31]_C_n_0\,
      O => r_reg(31)
    );
\r_reg[3]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[2]_P_n_0\,
      I1 => \r_reg_reg[2]_LDC_n_0\,
      I2 => \r_reg_reg[2]_C_n_0\,
      O => r_reg(2)
    );
\r_reg[4]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[3]_P_n_0\,
      I1 => \r_reg_reg[3]_LDC_n_0\,
      I2 => \r_reg_reg[3]_C_n_0\,
      O => r_reg(3)
    );
\r_reg[5]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[4]_P_n_0\,
      I1 => \r_reg_reg[4]_LDC_n_0\,
      I2 => \r_reg_reg[4]_C_n_0\,
      O => r_reg(4)
    );
\r_reg[6]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[5]_P_n_0\,
      I1 => \r_reg_reg[5]_LDC_n_0\,
      I2 => \r_reg_reg[5]_C_n_0\,
      O => r_reg(5)
    );
\r_reg[7]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[6]_P_n_0\,
      I1 => \r_reg_reg[6]_LDC_n_0\,
      I2 => \r_reg_reg[6]_C_n_0\,
      O => r_reg(6)
    );
\r_reg[8]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[7]_P_n_0\,
      I1 => \r_reg_reg[7]_LDC_n_0\,
      I2 => \r_reg_reg[7]_C_n_0\,
      O => r_reg(7)
    );
\r_reg[9]_C_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_reg_reg[8]_P_n_0\,
      I1 => \r_reg_reg[8]_LDC_n_0\,
      I2 => \r_reg_reg[8]_C_n_0\,
      O => r_reg(8)
    );
\r_reg_reg[0]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_63\,
      D => '1',
      G => \slv_reg0_reg[31]_62\,
      GE => '1',
      Q => \r_reg_reg[0]_LDC_n_0\
    );
\r_reg_reg[0]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => '0',
      PRE => \slv_reg0_reg[31]_62\,
      Q => \r_reg_reg[0]_P_n_0\
    );
\r_reg_reg[10]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_43\,
      D => r_reg(9),
      Q => \r_reg_reg[10]_C_n_0\
    );
\r_reg_reg[10]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_43\,
      D => '1',
      G => \slv_reg0_reg[31]_42\,
      GE => '1',
      Q => \r_reg_reg[10]_LDC_n_0\
    );
\r_reg_reg[10]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(9),
      PRE => \slv_reg0_reg[31]_42\,
      Q => \r_reg_reg[10]_P_n_0\
    );
\r_reg_reg[11]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_41\,
      D => r_reg(10),
      Q => \r_reg_reg[11]_C_n_0\
    );
\r_reg_reg[11]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_41\,
      D => '1',
      G => \slv_reg0_reg[31]_40\,
      GE => '1',
      Q => \r_reg_reg[11]_LDC_n_0\
    );
\r_reg_reg[11]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(10),
      PRE => \slv_reg0_reg[31]_40\,
      Q => \r_reg_reg[11]_P_n_0\
    );
\r_reg_reg[12]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_39\,
      D => r_reg(11),
      Q => \r_reg_reg[12]_C_n_0\
    );
\r_reg_reg[12]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_39\,
      D => '1',
      G => \slv_reg0_reg[31]_38\,
      GE => '1',
      Q => \r_reg_reg[12]_LDC_n_0\
    );
\r_reg_reg[12]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(11),
      PRE => \slv_reg0_reg[31]_38\,
      Q => \r_reg_reg[12]_P_n_0\
    );
\r_reg_reg[13]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_37\,
      D => r_reg(12),
      Q => \r_reg_reg[13]_C_n_0\
    );
\r_reg_reg[13]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_37\,
      D => '1',
      G => \slv_reg0_reg[31]_36\,
      GE => '1',
      Q => \r_reg_reg[13]_LDC_n_0\
    );
\r_reg_reg[13]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(12),
      PRE => \slv_reg0_reg[31]_36\,
      Q => \r_reg_reg[13]_P_n_0\
    );
\r_reg_reg[14]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_35\,
      D => r_reg(13),
      Q => \r_reg_reg[14]_C_n_0\
    );
\r_reg_reg[14]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_35\,
      D => '1',
      G => \slv_reg0_reg[31]_34\,
      GE => '1',
      Q => \r_reg_reg[14]_LDC_n_0\
    );
\r_reg_reg[14]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(13),
      PRE => \slv_reg0_reg[31]_34\,
      Q => \r_reg_reg[14]_P_n_0\
    );
\r_reg_reg[15]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_33\,
      D => r_reg(14),
      Q => \r_reg_reg[15]_C_n_0\
    );
\r_reg_reg[15]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_33\,
      D => '1',
      G => \slv_reg0_reg[31]_32\,
      GE => '1',
      Q => \r_reg_reg[15]_LDC_n_0\
    );
\r_reg_reg[15]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(14),
      PRE => \slv_reg0_reg[31]_32\,
      Q => \r_reg_reg[15]_P_n_0\
    );
\r_reg_reg[16]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_31\,
      D => r_reg(15),
      Q => \r_reg_reg[16]_C_n_0\
    );
\r_reg_reg[16]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_31\,
      D => '1',
      G => \slv_reg0_reg[31]_30\,
      GE => '1',
      Q => \r_reg_reg[16]_LDC_n_0\
    );
\r_reg_reg[16]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(15),
      PRE => \slv_reg0_reg[31]_30\,
      Q => \r_reg_reg[16]_P_n_0\
    );
\r_reg_reg[17]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_29\,
      D => r_reg(16),
      Q => \r_reg_reg[17]_C_n_0\
    );
\r_reg_reg[17]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_29\,
      D => '1',
      G => \slv_reg0_reg[31]_28\,
      GE => '1',
      Q => \r_reg_reg[17]_LDC_n_0\
    );
\r_reg_reg[17]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(16),
      PRE => \slv_reg0_reg[31]_28\,
      Q => \r_reg_reg[17]_P_n_0\
    );
\r_reg_reg[18]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_27\,
      D => r_reg(17),
      Q => \r_reg_reg[18]_C_n_0\
    );
\r_reg_reg[18]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_27\,
      D => '1',
      G => \slv_reg0_reg[31]_26\,
      GE => '1',
      Q => \r_reg_reg[18]_LDC_n_0\
    );
\r_reg_reg[18]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(17),
      PRE => \slv_reg0_reg[31]_26\,
      Q => \r_reg_reg[18]_P_n_0\
    );
\r_reg_reg[19]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_25\,
      D => r_reg(18),
      Q => \r_reg_reg[19]_C_n_0\
    );
\r_reg_reg[19]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_25\,
      D => '1',
      G => \slv_reg0_reg[31]_24\,
      GE => '1',
      Q => \r_reg_reg[19]_LDC_n_0\
    );
\r_reg_reg[19]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(18),
      PRE => \slv_reg0_reg[31]_24\,
      Q => \r_reg_reg[19]_P_n_0\
    );
\r_reg_reg[1]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_61\,
      D => r_reg(0),
      Q => \r_reg_reg[1]_C_n_0\
    );
\r_reg_reg[1]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_61\,
      D => '1',
      G => \slv_reg0_reg[31]_60\,
      GE => '1',
      Q => \r_reg_reg[1]_LDC_n_0\
    );
\r_reg_reg[1]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(0),
      PRE => \slv_reg0_reg[31]_60\,
      Q => \r_reg_reg[1]_P_n_0\
    );
\r_reg_reg[20]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_23\,
      D => r_reg(19),
      Q => \r_reg_reg[20]_C_n_0\
    );
\r_reg_reg[20]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_23\,
      D => '1',
      G => \slv_reg0_reg[31]_22\,
      GE => '1',
      Q => \r_reg_reg[20]_LDC_n_0\
    );
\r_reg_reg[20]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(19),
      PRE => \slv_reg0_reg[31]_22\,
      Q => \r_reg_reg[20]_P_n_0\
    );
\r_reg_reg[21]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_21\,
      D => r_reg(20),
      Q => \r_reg_reg[21]_C_n_0\
    );
\r_reg_reg[21]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_21\,
      D => '1',
      G => \slv_reg0_reg[31]_20\,
      GE => '1',
      Q => \r_reg_reg[21]_LDC_n_0\
    );
\r_reg_reg[21]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(20),
      PRE => \slv_reg0_reg[31]_20\,
      Q => \r_reg_reg[21]_P_n_0\
    );
\r_reg_reg[22]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_19\,
      D => r_reg(21),
      Q => \r_reg_reg[22]_C_n_0\
    );
\r_reg_reg[22]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_19\,
      D => '1',
      G => \slv_reg0_reg[31]_18\,
      GE => '1',
      Q => \r_reg_reg[22]_LDC_n_0\
    );
\r_reg_reg[22]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(21),
      PRE => \slv_reg0_reg[31]_18\,
      Q => \r_reg_reg[22]_P_n_0\
    );
\r_reg_reg[23]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_17\,
      D => r_reg(22),
      Q => \r_reg_reg[23]_C_n_0\
    );
\r_reg_reg[23]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_17\,
      D => '1',
      G => \slv_reg0_reg[31]_16\,
      GE => '1',
      Q => \r_reg_reg[23]_LDC_n_0\
    );
\r_reg_reg[23]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(22),
      PRE => \slv_reg0_reg[31]_16\,
      Q => \r_reg_reg[23]_P_n_0\
    );
\r_reg_reg[24]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_15\,
      D => r_reg(23),
      Q => \r_reg_reg[24]_C_n_0\
    );
\r_reg_reg[24]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_15\,
      D => '1',
      G => \slv_reg0_reg[31]_14\,
      GE => '1',
      Q => \r_reg_reg[24]_LDC_n_0\
    );
\r_reg_reg[24]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(23),
      PRE => \slv_reg0_reg[31]_14\,
      Q => \r_reg_reg[24]_P_n_0\
    );
\r_reg_reg[25]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_13\,
      D => r_reg(24),
      Q => \r_reg_reg[25]_C_n_0\
    );
\r_reg_reg[25]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_13\,
      D => '1',
      G => \slv_reg0_reg[31]_12\,
      GE => '1',
      Q => \r_reg_reg[25]_LDC_n_0\
    );
\r_reg_reg[25]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(24),
      PRE => \slv_reg0_reg[31]_12\,
      Q => \r_reg_reg[25]_P_n_0\
    );
\r_reg_reg[26]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_11\,
      D => r_reg(25),
      Q => \r_reg_reg[26]_C_n_0\
    );
\r_reg_reg[26]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_11\,
      D => '1',
      G => \slv_reg0_reg[31]_10\,
      GE => '1',
      Q => \r_reg_reg[26]_LDC_n_0\
    );
\r_reg_reg[26]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(25),
      PRE => \slv_reg0_reg[31]_10\,
      Q => \r_reg_reg[26]_P_n_0\
    );
\r_reg_reg[27]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_9\,
      D => r_reg(26),
      Q => \r_reg_reg[27]_C_n_0\
    );
\r_reg_reg[27]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_9\,
      D => '1',
      G => \slv_reg0_reg[31]_8\,
      GE => '1',
      Q => \r_reg_reg[27]_LDC_n_0\
    );
\r_reg_reg[27]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(26),
      PRE => \slv_reg0_reg[31]_8\,
      Q => \r_reg_reg[27]_P_n_0\
    );
\r_reg_reg[28]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_7\,
      D => r_reg(27),
      Q => \r_reg_reg[28]_C_n_0\
    );
\r_reg_reg[28]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_7\,
      D => '1',
      G => \slv_reg0_reg[31]_6\,
      GE => '1',
      Q => \r_reg_reg[28]_LDC_n_0\
    );
\r_reg_reg[28]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(27),
      PRE => \slv_reg0_reg[31]_6\,
      Q => \r_reg_reg[28]_P_n_0\
    );
\r_reg_reg[29]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_5\,
      D => r_reg(28),
      Q => \r_reg_reg[29]_C_n_0\
    );
\r_reg_reg[29]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_5\,
      D => '1',
      G => \slv_reg0_reg[31]_4\,
      GE => '1',
      Q => \r_reg_reg[29]_LDC_n_0\
    );
\r_reg_reg[29]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(28),
      PRE => \slv_reg0_reg[31]_4\,
      Q => \r_reg_reg[29]_P_n_0\
    );
\r_reg_reg[2]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_59\,
      D => r_reg(1),
      Q => \r_reg_reg[2]_C_n_0\
    );
\r_reg_reg[2]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_59\,
      D => '1',
      G => \slv_reg0_reg[31]_58\,
      GE => '1',
      Q => \r_reg_reg[2]_LDC_n_0\
    );
\r_reg_reg[2]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(1),
      PRE => \slv_reg0_reg[31]_58\,
      Q => \r_reg_reg[2]_P_n_0\
    );
\r_reg_reg[30]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_3\,
      D => r_reg(29),
      Q => \r_reg_reg[30]_C_n_0\
    );
\r_reg_reg[30]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_3\,
      D => '1',
      G => \slv_reg0_reg[31]_2\,
      GE => '1',
      Q => \r_reg_reg[30]_LDC_n_0\
    );
\r_reg_reg[30]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(29),
      PRE => \slv_reg0_reg[31]_2\,
      Q => \r_reg_reg[30]_P_n_0\
    );
\r_reg_reg[31]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_1\,
      D => r_reg(30),
      Q => \r_reg_reg[31]_C_n_0\
    );
\r_reg_reg[31]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_1\,
      D => '1',
      G => \slv_reg0_reg[31]_0\,
      GE => '1',
      Q => \r_reg_reg[31]_LDC_n_0\
    );
\r_reg_reg[31]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(30),
      PRE => \slv_reg0_reg[31]_0\,
      Q => \r_reg_reg[31]_P_n_0\
    );
\r_reg_reg[32]\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => r_reg(31),
      Q => hs_data_out_int
    );
\r_reg_reg[3]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_57\,
      D => r_reg(2),
      Q => \r_reg_reg[3]_C_n_0\
    );
\r_reg_reg[3]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_57\,
      D => '1',
      G => \slv_reg0_reg[31]_56\,
      GE => '1',
      Q => \r_reg_reg[3]_LDC_n_0\
    );
\r_reg_reg[3]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(2),
      PRE => \slv_reg0_reg[31]_56\,
      Q => \r_reg_reg[3]_P_n_0\
    );
\r_reg_reg[4]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_55\,
      D => r_reg(3),
      Q => \r_reg_reg[4]_C_n_0\
    );
\r_reg_reg[4]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_55\,
      D => '1',
      G => \slv_reg0_reg[31]_54\,
      GE => '1',
      Q => \r_reg_reg[4]_LDC_n_0\
    );
\r_reg_reg[4]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(3),
      PRE => \slv_reg0_reg[31]_54\,
      Q => \r_reg_reg[4]_P_n_0\
    );
\r_reg_reg[5]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_53\,
      D => r_reg(4),
      Q => \r_reg_reg[5]_C_n_0\
    );
\r_reg_reg[5]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_53\,
      D => '1',
      G => \slv_reg0_reg[31]_52\,
      GE => '1',
      Q => \r_reg_reg[5]_LDC_n_0\
    );
\r_reg_reg[5]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(4),
      PRE => \slv_reg0_reg[31]_52\,
      Q => \r_reg_reg[5]_P_n_0\
    );
\r_reg_reg[6]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_51\,
      D => r_reg(5),
      Q => \r_reg_reg[6]_C_n_0\
    );
\r_reg_reg[6]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_51\,
      D => '1',
      G => \slv_reg0_reg[31]_50\,
      GE => '1',
      Q => \r_reg_reg[6]_LDC_n_0\
    );
\r_reg_reg[6]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(5),
      PRE => \slv_reg0_reg[31]_50\,
      Q => \r_reg_reg[6]_P_n_0\
    );
\r_reg_reg[7]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_49\,
      D => r_reg(6),
      Q => \r_reg_reg[7]_C_n_0\
    );
\r_reg_reg[7]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_49\,
      D => '1',
      G => \slv_reg0_reg[31]_48\,
      GE => '1',
      Q => \r_reg_reg[7]_LDC_n_0\
    );
\r_reg_reg[7]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(6),
      PRE => \slv_reg0_reg[31]_48\,
      Q => \r_reg_reg[7]_P_n_0\
    );
\r_reg_reg[8]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_47\,
      D => r_reg(7),
      Q => \r_reg_reg[8]_C_n_0\
    );
\r_reg_reg[8]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_47\,
      D => '1',
      G => \slv_reg0_reg[31]_46\,
      GE => '1',
      Q => \r_reg_reg[8]_LDC_n_0\
    );
\r_reg_reg[8]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(7),
      PRE => \slv_reg0_reg[31]_46\,
      Q => \r_reg_reg[8]_P_n_0\
    );
\r_reg_reg[9]_C\: unisim.vcomponents.FDCE
     port map (
      C => outSR_shift,
      CE => '1',
      CLR => \slv_reg0_reg[31]_45\,
      D => r_reg(8),
      Q => \r_reg_reg[9]_C_n_0\
    );
\r_reg_reg[9]_LDC\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => \slv_reg0_reg[31]_45\,
      D => '1',
      G => \slv_reg0_reg[31]_44\,
      GE => '1',
      Q => \r_reg_reg[9]_LDC_n_0\
    );
\r_reg_reg[9]_P\: unisim.vcomponents.FDPE
     port map (
      C => outSR_shift,
      CE => '1',
      D => r_reg(8),
      PRE => \slv_reg0_reg[31]_44\,
      Q => \r_reg_reg[9]_P_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_register_32bits is
  port (
    Q : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_register_32bits;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_register_32bits is
begin
\data_out_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(0),
      Q => Q(0)
    );
\data_out_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(10),
      Q => Q(10)
    );
\data_out_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(11),
      Q => Q(11)
    );
\data_out_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(12),
      Q => Q(12)
    );
\data_out_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(13),
      Q => Q(13)
    );
\data_out_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(14),
      Q => Q(14)
    );
\data_out_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(15),
      Q => Q(15)
    );
\data_out_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(16),
      Q => Q(16)
    );
\data_out_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(17),
      Q => Q(17)
    );
\data_out_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(18),
      Q => Q(18)
    );
\data_out_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(19),
      Q => Q(19)
    );
\data_out_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(1),
      Q => Q(1)
    );
\data_out_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(20),
      Q => Q(20)
    );
\data_out_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(21),
      Q => Q(21)
    );
\data_out_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(22),
      Q => Q(22)
    );
\data_out_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(23),
      Q => Q(23)
    );
\data_out_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(24),
      Q => Q(24)
    );
\data_out_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(25),
      Q => Q(25)
    );
\data_out_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(26),
      Q => Q(26)
    );
\data_out_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(27),
      Q => Q(27)
    );
\data_out_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(28),
      Q => Q(28)
    );
\data_out_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(29),
      Q => Q(29)
    );
\data_out_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(2),
      Q => Q(2)
    );
\data_out_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(30),
      Q => Q(30)
    );
\data_out_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(31),
      Q => Q(31)
    );
\data_out_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(3),
      Q => Q(3)
    );
\data_out_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(4),
      Q => Q(4)
    );
\data_out_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(5),
      Q => Q(5)
    );
\data_out_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(6),
      Q => Q(6)
    );
\data_out_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(7),
      Q => Q(7)
    );
\data_out_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(8),
      Q => Q(8)
    );
\data_out_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => s00_axis_tdata(9),
      Q => Q(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter3Bits is
  port (
    clock_base : out STD_LOGIC;
    \slv_reg0_reg[17]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter3Bits;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter3Bits is
  signal clock_base_4 : STD_LOGIC;
  signal clock_base_8 : STD_LOGIC;
  signal \r_reg[0]_i_1__5_n_0\ : STD_LOGIC;
  signal \r_reg[1]_i_1__4_n_0\ : STD_LOGIC;
  signal \r_reg[2]_i_1__4_n_0\ : STD_LOGIC;
  signal \r_reg_reg_n_0_[0]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \r_reg[1]_i_1__4\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \r_reg[2]_i_1__4\ : label is "soft_lutpair2";
begin
Q_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => clock_base_8,
      I1 => clock_base_4,
      I2 => \slv_reg0_reg[17]\(1),
      I3 => \r_reg_reg_n_0_[0]\,
      I4 => \slv_reg0_reg[17]\(0),
      I5 => s00_axi_aclk,
      O => clock_base
    );
\r_reg[0]_i_1__5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \r_reg_reg_n_0_[0]\,
      O => \r_reg[0]_i_1__5_n_0\
    );
\r_reg[1]_i_1__4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \r_reg_reg_n_0_[0]\,
      I1 => clock_base_4,
      O => \r_reg[1]_i_1__4_n_0\
    );
\r_reg[2]_i_1__4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \r_reg_reg_n_0_[0]\,
      I1 => clock_base_4,
      I2 => clock_base_8,
      O => \r_reg[2]_i_1__4_n_0\
    );
\r_reg_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_reg[0]_i_1__5_n_0\,
      Q => \r_reg_reg_n_0_[0]\
    );
\r_reg_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_reg[1]_i_1__4_n_0\,
      Q => clock_base_4
    );
\r_reg_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_reg[2]_i_1__4_n_0\,
      Q => clock_base_8
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits is
  port (
    rx_fifo_last_int : out STD_LOGIC;
    Q_reg : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits is
  signal \Q_i_2__0_n_0\ : STD_LOGIC;
  signal last_count_int : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal r_next : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \r_reg[7]_i_2__3_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \Q_i_1__3\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \Q_i_2__0\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \r_reg[0]_i_1__4\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \r_reg[2]_i_1__3\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \r_reg[3]_i_1__3\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \r_reg[4]_i_1__3\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \r_reg[6]_i_1__3\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \r_reg[7]_i_1__3\ : label is "soft_lutpair18";
begin
\Q_i_1__3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => last_count_int(6),
      I1 => last_count_int(5),
      I2 => last_count_int(0),
      I3 => last_count_int(7),
      I4 => \Q_i_2__0_n_0\,
      O => rx_fifo_last_int
    );
\Q_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => last_count_int(3),
      I1 => last_count_int(4),
      I2 => last_count_int(1),
      I3 => last_count_int(2),
      O => \Q_i_2__0_n_0\
    );
\r_reg[0]_i_1__4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => last_count_int(0),
      O => r_next(0)
    );
\r_reg[1]_i_1__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => last_count_int(0),
      I1 => last_count_int(1),
      O => r_next(1)
    );
\r_reg[2]_i_1__3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => last_count_int(0),
      I1 => last_count_int(1),
      I2 => last_count_int(2),
      O => r_next(2)
    );
\r_reg[3]_i_1__3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => last_count_int(1),
      I1 => last_count_int(0),
      I2 => last_count_int(2),
      I3 => last_count_int(3),
      O => r_next(3)
    );
\r_reg[4]_i_1__3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => last_count_int(2),
      I1 => last_count_int(0),
      I2 => last_count_int(1),
      I3 => last_count_int(3),
      I4 => last_count_int(4),
      O => r_next(4)
    );
\r_reg[5]_i_1__3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => last_count_int(3),
      I1 => last_count_int(1),
      I2 => last_count_int(0),
      I3 => last_count_int(2),
      I4 => last_count_int(4),
      I5 => last_count_int(5),
      O => r_next(5)
    );
\r_reg[6]_i_1__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \r_reg[7]_i_2__3_n_0\,
      I1 => last_count_int(6),
      O => r_next(6)
    );
\r_reg[7]_i_1__3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \r_reg[7]_i_2__3_n_0\,
      I1 => last_count_int(6),
      I2 => last_count_int(7),
      O => r_next(7)
    );
\r_reg[7]_i_2__3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => last_count_int(5),
      I1 => last_count_int(3),
      I2 => last_count_int(1),
      I3 => last_count_int(0),
      I4 => last_count_int(2),
      I5 => last_count_int(4),
      O => \r_reg[7]_i_2__3_n_0\
    );
\r_reg_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => Q_reg,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => r_next(0),
      Q => last_count_int(0)
    );
\r_reg_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => Q_reg,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => r_next(1),
      Q => last_count_int(1)
    );
\r_reg_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => Q_reg,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => r_next(2),
      Q => last_count_int(2)
    );
\r_reg_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => Q_reg,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => r_next(3),
      Q => last_count_int(3)
    );
\r_reg_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => Q_reg,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => r_next(4),
      Q => last_count_int(4)
    );
\r_reg_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => Q_reg,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => r_next(5),
      Q => last_count_int(5)
    );
\r_reg_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => Q_reg,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => r_next(6),
      Q => last_count_int(6)
    );
\r_reg_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => Q_reg,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => r_next(7),
      Q => last_count_int(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_10 is
  port (
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    out_next_int : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_10 : entity is "upCounter8Bits";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_10;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_10 is
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \r_next__3\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \r_reg[7]_i_2__2_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \r_reg[1]_i_1__2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \r_reg[2]_i_1__2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \r_reg[3]_i_1__2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \r_reg[4]_i_1__2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \r_reg[6]_i_1__2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \r_reg[7]_i_1__2\ : label is "soft_lutpair4";
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
\r_reg[0]_i_1__3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \r_next__3\(0)
    );
\r_reg[1]_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \r_next__3\(1)
    );
\r_reg[2]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \r_next__3\(2)
    );
\r_reg[3]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \r_next__3\(3)
    );
\r_reg[4]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => \r_next__3\(4)
    );
\r_reg[5]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(4),
      I5 => \^q\(5),
      O => \r_next__3\(5)
    );
\r_reg[6]_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \r_reg[7]_i_2__2_n_0\,
      I1 => \^q\(6),
      O => \r_next__3\(6)
    );
\r_reg[7]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \r_reg[7]_i_2__2_n_0\,
      I1 => \^q\(6),
      I2 => \^q\(7),
      O => \r_next__3\(7)
    );
\r_reg[7]_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^q\(3),
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => \^q\(2),
      I5 => \^q\(4),
      O => \r_reg[7]_i_2__2_n_0\
    );
\r_reg_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => out_next_int,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__3\(0),
      Q => \^q\(0)
    );
\r_reg_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => out_next_int,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__3\(1),
      Q => \^q\(1)
    );
\r_reg_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => out_next_int,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__3\(2),
      Q => \^q\(2)
    );
\r_reg_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => out_next_int,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__3\(3),
      Q => \^q\(3)
    );
\r_reg_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => out_next_int,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__3\(4),
      Q => \^q\(4)
    );
\r_reg_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => out_next_int,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__3\(5),
      Q => \^q\(5)
    );
\r_reg_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => out_next_int,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__3\(6),
      Q => \^q\(6)
    );
\r_reg_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => out_next_int,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__3\(7),
      Q => \^q\(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_11 is
  port (
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    CLK : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_11 : entity is "upCounter8Bits";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_11;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_11 is
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \r_next__2\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \r_reg[7]_i_2__1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \r_reg[1]_i_1__1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \r_reg[2]_i_1__1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \r_reg[3]_i_1__1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \r_reg[4]_i_1__1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \r_reg[6]_i_1__1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \r_reg[7]_i_1__1\ : label is "soft_lutpair7";
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
\r_reg[0]_i_1__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \r_next__2\(0)
    );
\r_reg[1]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \r_next__2\(1)
    );
\r_reg[2]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \r_next__2\(2)
    );
\r_reg[3]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \r_next__2\(3)
    );
\r_reg[4]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => \r_next__2\(4)
    );
\r_reg[5]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(4),
      I5 => \^q\(5),
      O => \r_next__2\(5)
    );
\r_reg[6]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \r_reg[7]_i_2__1_n_0\,
      I1 => \^q\(6),
      O => \r_next__2\(6)
    );
\r_reg[7]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \r_reg[7]_i_2__1_n_0\,
      I1 => \^q\(6),
      I2 => \^q\(7),
      O => \r_next__2\(7)
    );
\r_reg[7]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^q\(3),
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => \^q\(2),
      I5 => \^q\(4),
      O => \r_reg[7]_i_2__1_n_0\
    );
\r_reg_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__2\(0),
      Q => \^q\(0)
    );
\r_reg_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__2\(1),
      Q => \^q\(1)
    );
\r_reg_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__2\(2),
      Q => \^q\(2)
    );
\r_reg_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__2\(3),
      Q => \^q\(3)
    );
\r_reg_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__2\(4),
      Q => \^q\(4)
    );
\r_reg_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__2\(5),
      Q => \^q\(5)
    );
\r_reg_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__2\(6),
      Q => \^q\(6)
    );
\r_reg_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__2\(7),
      Q => \^q\(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_12 is
  port (
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    in_next_int : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_12 : entity is "upCounter8Bits";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_12;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_12 is
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \r_next__1\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \r_reg[7]_i_2__0_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \r_reg[1]_i_1__0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \r_reg[2]_i_1__0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \r_reg[3]_i_1__0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \r_reg[4]_i_1__0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \r_reg[6]_i_1__0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \r_reg[7]_i_1__0\ : label is "soft_lutpair10";
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
\r_reg[0]_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \r_next__1\(0)
    );
\r_reg[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \r_next__1\(1)
    );
\r_reg[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \r_next__1\(2)
    );
\r_reg[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \r_next__1\(3)
    );
\r_reg[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => \r_next__1\(4)
    );
\r_reg[5]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(4),
      I5 => \^q\(5),
      O => \r_next__1\(5)
    );
\r_reg[6]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \r_reg[7]_i_2__0_n_0\,
      I1 => \^q\(6),
      O => \r_next__1\(6)
    );
\r_reg[7]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \r_reg[7]_i_2__0_n_0\,
      I1 => \^q\(6),
      I2 => \^q\(7),
      O => \r_next__1\(7)
    );
\r_reg[7]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^q\(3),
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => \^q\(2),
      I5 => \^q\(4),
      O => \r_reg[7]_i_2__0_n_0\
    );
\r_reg_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => in_next_int,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__1\(0),
      Q => \^q\(0)
    );
\r_reg_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => in_next_int,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__1\(1),
      Q => \^q\(1)
    );
\r_reg_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => in_next_int,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__1\(2),
      Q => \^q\(2)
    );
\r_reg_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => in_next_int,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__1\(3),
      Q => \^q\(3)
    );
\r_reg_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => in_next_int,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__1\(4),
      Q => \^q\(4)
    );
\r_reg_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => in_next_int,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__1\(5),
      Q => \^q\(5)
    );
\r_reg_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => in_next_int,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__1\(6),
      Q => \^q\(6)
    );
\r_reg_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => in_next_int,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__1\(7),
      Q => \^q\(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_13 is
  port (
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Q_reg : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_13 : entity is "upCounter8Bits";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_13;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_13 is
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \r_next__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \r_reg[7]_i_2_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \r_reg[1]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \r_reg[2]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \r_reg[3]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \r_reg[4]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \r_reg[6]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \r_reg[7]_i_1\ : label is "soft_lutpair13";
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
\r_reg[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \r_next__0\(0)
    );
\r_reg[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \r_next__0\(1)
    );
\r_reg[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \r_next__0\(2)
    );
\r_reg[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \r_next__0\(3)
    );
\r_reg[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => \r_next__0\(4)
    );
\r_reg[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(4),
      I5 => \^q\(5),
      O => \r_next__0\(5)
    );
\r_reg[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \r_reg[7]_i_2_n_0\,
      I1 => \^q\(6),
      O => \r_next__0\(6)
    );
\r_reg[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \r_reg[7]_i_2_n_0\,
      I1 => \^q\(6),
      I2 => \^q\(7),
      O => \r_next__0\(7)
    );
\r_reg[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^q\(3),
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => \^q\(2),
      I5 => \^q\(4),
      O => \r_reg[7]_i_2_n_0\
    );
\r_reg_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => Q_reg,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__0\(0),
      Q => \^q\(0)
    );
\r_reg_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => Q_reg,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__0\(1),
      Q => \^q\(1)
    );
\r_reg_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => Q_reg,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__0\(2),
      Q => \^q\(2)
    );
\r_reg_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => Q_reg,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__0\(3),
      Q => \^q\(3)
    );
\r_reg_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => Q_reg,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__0\(4),
      Q => \^q\(4)
    );
\r_reg_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => Q_reg,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__0\(5),
      Q => \^q\(5)
    );
\r_reg_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => Q_reg,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__0\(6),
      Q => \^q\(6)
    );
\r_reg_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => Q_reg,
      CE => '1',
      CLR => \slv_reg0_reg[31]\,
      D => \r_next__0\(7),
      Q => \^q\(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_GyroChannelDebugger is
  port (
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \r_reg_reg[7]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \r_reg_reg[7]_0\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \r_reg_reg[7]_1\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Q_reg : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC;
    in_next_int : in STD_LOGIC;
    CLK : in STD_LOGIC;
    out_next_int : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_GyroChannelDebugger;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_GyroChannelDebugger is
begin
CNTR0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_10
     port map (
      Q(7 downto 0) => \r_reg_reg[7]_1\(7 downto 0),
      out_next_int => out_next_int,
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\
    );
CNTR1: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_11
     port map (
      CLK => CLK,
      Q(7 downto 0) => \r_reg_reg[7]_0\(7 downto 0),
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\
    );
CNTR2: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_12
     port map (
      Q(7 downto 0) => \r_reg_reg[7]\(7 downto 0),
      in_next_int => in_next_int,
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\
    );
CNTR3: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_13
     port map (
      Q(7 downto 0) => Q(7 downto 0),
      Q_reg => Q_reg,
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clock_divider_by_2 is
  port (
    MCK : out STD_LOGIC;
    clock_base : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clock_divider_by_2;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clock_divider_by_2 is
begin
ff0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_15
     port map (
      MCK => MCK,
      clock_base => clock_base,
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clock_divider_by_2_0 is
  port (
    Q_reg : out STD_LOGIC;
    CLK : in STD_LOGIC;
    MCK : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clock_divider_by_2_0 : entity is "clock_divider_by_2";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clock_divider_by_2_0;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clock_divider_by_2_0 is
begin
ff0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_14
     port map (
      CLK => CLK,
      MCK => MCK,
      Q_reg_0 => Q_reg,
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_maskHSCK is
  port (
    Q_reg : out STD_LOGIC;
    in_start_stop_int : out STD_LOGIC;
    out_start_stop_int : out STD_LOGIC;
    CLK : out STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    out_next_int : out STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    in_next_int : out STD_LOGIC;
    last_aux : in STD_LOGIC;
    Q_reg_0 : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC;
    \slv_reg1_reg[4]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    in_shift_aux : in STD_LOGIC;
    a : in STD_LOGIC;
    b : in STD_LOGIC;
    a_0 : in STD_LOGIC;
    b_1 : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_maskHSCK;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_maskHSCK is
  signal \^q_reg\ : STD_LOGIC;
  signal \^in_start_stop_int\ : STD_LOGIC;
  signal \^out_start_stop_int\ : STD_LOGIC;
begin
  Q_reg <= \^q_reg\;
  in_start_stop_int <= \^in_start_stop_int\;
  out_start_stop_int <= \^out_start_stop_int\;
ff0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_6
     port map (
      Q_reg_0 => \^q_reg\,
      a_0 => a_0,
      b_1 => b_1,
      in_start_stop_int => \^in_start_stop_int\,
      m00_axis_tvalid => m00_axis_tvalid,
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\,
      \slv_reg1_reg[4]\(0) => \slv_reg1_reg[4]\(1)
    );
ff1: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_7
     port map (
      Q_reg_0 => \^q_reg\,
      a => a,
      b => b,
      out_start_stop_int => \^out_start_stop_int\,
      s00_axis_tready => s00_axis_tready,
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\,
      \slv_reg1_reg[0]\(0) => \slv_reg1_reg[4]\(0)
    );
ff2: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_8
     port map (
      CLK => CLK,
      Q_reg_0 => Q_reg_0,
      in_shift_aux => in_shift_aux,
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\
    );
ff3: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_9
     port map (
      Q_reg_0 => \^q_reg\,
      Q_reg_1 => Q_reg_0,
      in_next_int => in_next_int,
      in_start_stop_int => \^in_start_stop_int\,
      last_aux => last_aux,
      out_next_int => out_next_int,
      out_start_stop_int => \^out_start_stop_int\,
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_syncReady is
  port (
    a : out STD_LOGIC;
    b : out STD_LOGIC;
    \r_reg_reg[31]_P\ : out STD_LOGIC;
    \r_reg_reg[30]_P\ : out STD_LOGIC;
    \r_reg_reg[29]_P\ : out STD_LOGIC;
    \r_reg_reg[28]_P\ : out STD_LOGIC;
    \r_reg_reg[27]_P\ : out STD_LOGIC;
    \r_reg_reg[26]_P\ : out STD_LOGIC;
    \r_reg_reg[25]_P\ : out STD_LOGIC;
    \r_reg_reg[24]_P\ : out STD_LOGIC;
    \r_reg_reg[23]_P\ : out STD_LOGIC;
    \r_reg_reg[22]_P\ : out STD_LOGIC;
    \r_reg_reg[21]_P\ : out STD_LOGIC;
    \r_reg_reg[20]_P\ : out STD_LOGIC;
    \r_reg_reg[19]_P\ : out STD_LOGIC;
    \r_reg_reg[18]_P\ : out STD_LOGIC;
    \r_reg_reg[17]_P\ : out STD_LOGIC;
    \r_reg_reg[16]_P\ : out STD_LOGIC;
    \r_reg_reg[15]_P\ : out STD_LOGIC;
    \r_reg_reg[14]_P\ : out STD_LOGIC;
    \r_reg_reg[13]_P\ : out STD_LOGIC;
    \r_reg_reg[12]_P\ : out STD_LOGIC;
    \r_reg_reg[11]_P\ : out STD_LOGIC;
    \r_reg_reg[10]_P\ : out STD_LOGIC;
    \r_reg_reg[9]_P\ : out STD_LOGIC;
    \r_reg_reg[8]_P\ : out STD_LOGIC;
    \r_reg_reg[7]_P\ : out STD_LOGIC;
    \r_reg_reg[6]_P\ : out STD_LOGIC;
    \r_reg_reg[5]_P\ : out STD_LOGIC;
    \r_reg_reg[4]_P\ : out STD_LOGIC;
    \r_reg_reg[3]_P\ : out STD_LOGIC;
    \r_reg_reg[2]_P\ : out STD_LOGIC;
    \r_reg_reg[1]_P\ : out STD_LOGIC;
    \r_reg_reg[0]_P\ : out STD_LOGIC;
    \r_reg_reg[32]\ : out STD_LOGIC;
    \r_reg_reg[1]_P_0\ : out STD_LOGIC;
    \r_reg_reg[1]_C\ : out STD_LOGIC;
    \r_reg_reg[2]_C\ : out STD_LOGIC;
    \r_reg_reg[3]_C\ : out STD_LOGIC;
    \r_reg_reg[4]_C\ : out STD_LOGIC;
    \r_reg_reg[5]_C\ : out STD_LOGIC;
    \r_reg_reg[6]_C\ : out STD_LOGIC;
    \r_reg_reg[7]_C\ : out STD_LOGIC;
    \r_reg_reg[8]_C\ : out STD_LOGIC;
    \r_reg_reg[9]_C\ : out STD_LOGIC;
    \r_reg_reg[10]_C\ : out STD_LOGIC;
    \r_reg_reg[11]_C\ : out STD_LOGIC;
    \r_reg_reg[12]_C\ : out STD_LOGIC;
    \r_reg_reg[13]_C\ : out STD_LOGIC;
    \r_reg_reg[14]_C\ : out STD_LOGIC;
    \r_reg_reg[15]_C\ : out STD_LOGIC;
    \r_reg_reg[16]_C\ : out STD_LOGIC;
    \r_reg_reg[17]_C\ : out STD_LOGIC;
    \r_reg_reg[18]_C\ : out STD_LOGIC;
    \r_reg_reg[19]_C\ : out STD_LOGIC;
    \r_reg_reg[20]_C\ : out STD_LOGIC;
    \r_reg_reg[21]_C\ : out STD_LOGIC;
    \r_reg_reg[22]_C\ : out STD_LOGIC;
    \r_reg_reg[23]_C\ : out STD_LOGIC;
    \r_reg_reg[24]_C\ : out STD_LOGIC;
    \r_reg_reg[25]_C\ : out STD_LOGIC;
    \r_reg_reg[26]_C\ : out STD_LOGIC;
    \r_reg_reg[27]_C\ : out STD_LOGIC;
    \r_reg_reg[28]_C\ : out STD_LOGIC;
    \r_reg_reg[29]_C\ : out STD_LOGIC;
    \r_reg_reg[30]_C\ : out STD_LOGIC;
    \r_reg_reg[31]_C\ : out STD_LOGIC;
    out_next_int : in STD_LOGIC;
    clk0 : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC;
    Q_reg : in STD_LOGIC;
    out_start_stop_int : in STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC;
    \slv_reg0_reg[31]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_aresetn : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_syncReady;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_syncReady is
  signal \^a\ : STD_LOGIC;
begin
  a <= \^a\;
X0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_4
     port map (
      a => \^a\,
      clk0 => clk0,
      out_next_int => out_next_int,
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\
    );
X1: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_5
     port map (
      Q(31 downto 0) => Q(31 downto 0),
      Q_reg_0 => Q_reg,
      a => \^a\,
      b => b,
      clk0 => clk0,
      out_start_stop_int => out_start_stop_int,
      \r_reg_reg[0]_P\ => \r_reg_reg[0]_P\,
      \r_reg_reg[10]_C\ => \r_reg_reg[10]_C\,
      \r_reg_reg[10]_P\ => \r_reg_reg[10]_P\,
      \r_reg_reg[11]_C\ => \r_reg_reg[11]_C\,
      \r_reg_reg[11]_P\ => \r_reg_reg[11]_P\,
      \r_reg_reg[12]_C\ => \r_reg_reg[12]_C\,
      \r_reg_reg[12]_P\ => \r_reg_reg[12]_P\,
      \r_reg_reg[13]_C\ => \r_reg_reg[13]_C\,
      \r_reg_reg[13]_P\ => \r_reg_reg[13]_P\,
      \r_reg_reg[14]_C\ => \r_reg_reg[14]_C\,
      \r_reg_reg[14]_P\ => \r_reg_reg[14]_P\,
      \r_reg_reg[15]_C\ => \r_reg_reg[15]_C\,
      \r_reg_reg[15]_P\ => \r_reg_reg[15]_P\,
      \r_reg_reg[16]_C\ => \r_reg_reg[16]_C\,
      \r_reg_reg[16]_P\ => \r_reg_reg[16]_P\,
      \r_reg_reg[17]_C\ => \r_reg_reg[17]_C\,
      \r_reg_reg[17]_P\ => \r_reg_reg[17]_P\,
      \r_reg_reg[18]_C\ => \r_reg_reg[18]_C\,
      \r_reg_reg[18]_P\ => \r_reg_reg[18]_P\,
      \r_reg_reg[19]_C\ => \r_reg_reg[19]_C\,
      \r_reg_reg[19]_P\ => \r_reg_reg[19]_P\,
      \r_reg_reg[1]_C\ => \r_reg_reg[1]_C\,
      \r_reg_reg[1]_P\ => \r_reg_reg[1]_P\,
      \r_reg_reg[1]_P_0\ => \r_reg_reg[1]_P_0\,
      \r_reg_reg[20]_C\ => \r_reg_reg[20]_C\,
      \r_reg_reg[20]_P\ => \r_reg_reg[20]_P\,
      \r_reg_reg[21]_C\ => \r_reg_reg[21]_C\,
      \r_reg_reg[21]_P\ => \r_reg_reg[21]_P\,
      \r_reg_reg[22]_C\ => \r_reg_reg[22]_C\,
      \r_reg_reg[22]_P\ => \r_reg_reg[22]_P\,
      \r_reg_reg[23]_C\ => \r_reg_reg[23]_C\,
      \r_reg_reg[23]_P\ => \r_reg_reg[23]_P\,
      \r_reg_reg[24]_C\ => \r_reg_reg[24]_C\,
      \r_reg_reg[24]_P\ => \r_reg_reg[24]_P\,
      \r_reg_reg[25]_C\ => \r_reg_reg[25]_C\,
      \r_reg_reg[25]_P\ => \r_reg_reg[25]_P\,
      \r_reg_reg[26]_C\ => \r_reg_reg[26]_C\,
      \r_reg_reg[26]_P\ => \r_reg_reg[26]_P\,
      \r_reg_reg[27]_C\ => \r_reg_reg[27]_C\,
      \r_reg_reg[27]_P\ => \r_reg_reg[27]_P\,
      \r_reg_reg[28]_C\ => \r_reg_reg[28]_C\,
      \r_reg_reg[28]_P\ => \r_reg_reg[28]_P\,
      \r_reg_reg[29]_C\ => \r_reg_reg[29]_C\,
      \r_reg_reg[29]_P\ => \r_reg_reg[29]_P\,
      \r_reg_reg[2]_C\ => \r_reg_reg[2]_C\,
      \r_reg_reg[2]_P\ => \r_reg_reg[2]_P\,
      \r_reg_reg[30]_C\ => \r_reg_reg[30]_C\,
      \r_reg_reg[30]_P\ => \r_reg_reg[30]_P\,
      \r_reg_reg[31]_C\ => \r_reg_reg[31]_C\,
      \r_reg_reg[31]_P\ => \r_reg_reg[31]_P\,
      \r_reg_reg[32]\ => \r_reg_reg[32]\,
      \r_reg_reg[3]_C\ => \r_reg_reg[3]_C\,
      \r_reg_reg[3]_P\ => \r_reg_reg[3]_P\,
      \r_reg_reg[4]_C\ => \r_reg_reg[4]_C\,
      \r_reg_reg[4]_P\ => \r_reg_reg[4]_P\,
      \r_reg_reg[5]_C\ => \r_reg_reg[5]_C\,
      \r_reg_reg[5]_P\ => \r_reg_reg[5]_P\,
      \r_reg_reg[6]_C\ => \r_reg_reg[6]_C\,
      \r_reg_reg[6]_P\ => \r_reg_reg[6]_P\,
      \r_reg_reg[7]_C\ => \r_reg_reg[7]_C\,
      \r_reg_reg[7]_P\ => \r_reg_reg[7]_P\,
      \r_reg_reg[8]_C\ => \r_reg_reg[8]_C\,
      \r_reg_reg[8]_P\ => \r_reg_reg[8]_P\,
      \r_reg_reg[9]_C\ => \r_reg_reg[9]_C\,
      \r_reg_reg[9]_P\ => \r_reg_reg[9]_P\,
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axis_tvalid => s00_axis_tvalid,
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\,
      \slv_reg0_reg[31]_0\(0) => \slv_reg0_reg[31]_0\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_syncReady_1 is
  port (
    a : out STD_LOGIC;
    b : out STD_LOGIC;
    in_next_int : in STD_LOGIC;
    clk0 : in STD_LOGIC;
    \slv_reg0_reg[31]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_syncReady_1 : entity is "syncReady";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_syncReady_1;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_syncReady_1 is
  signal \^a\ : STD_LOGIC;
begin
  a <= \^a\;
X0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_2
     port map (
      a => \^a\,
      clk0 => clk0,
      in_next_int => in_next_int,
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\
    );
X1: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_3
     port map (
      a => \^a\,
      b => b,
      clk0 => clk0,
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_GyroInputOutputSerializer is
  port (
    MCK : out STD_LOGIC;
    Q_reg : out STD_LOGIC;
    m00_axis_tlast : out STD_LOGIC;
    hs_data_out_int : out STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    HS_Clock : out STD_LOGIC;
    \r_reg_reg[7]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \r_reg_reg[7]_0\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \r_reg_reg[7]_1\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \r_reg_reg[7]_2\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    \slv_reg0_reg[31]\ : in STD_LOGIC;
    CLK : in STD_LOGIC;
    \slv_reg1_reg[4]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    clk0 : in STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC;
    \slv_reg0_reg[31]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_aresetn : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_GyroInputOutputSerializer;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_GyroInputOutputSerializer is
  signal MASK_HSCK_n_0 : STD_LOGIC;
  signal \^mck\ : STD_LOGIC;
  signal Q : STD_LOGIC;
  signal \^q_reg\ : STD_LOGIC;
  signal X0_n_10 : STD_LOGIC;
  signal X0_n_11 : STD_LOGIC;
  signal X0_n_12 : STD_LOGIC;
  signal X0_n_13 : STD_LOGIC;
  signal X0_n_14 : STD_LOGIC;
  signal X0_n_15 : STD_LOGIC;
  signal X0_n_16 : STD_LOGIC;
  signal X0_n_17 : STD_LOGIC;
  signal X0_n_18 : STD_LOGIC;
  signal X0_n_19 : STD_LOGIC;
  signal X0_n_2 : STD_LOGIC;
  signal X0_n_20 : STD_LOGIC;
  signal X0_n_21 : STD_LOGIC;
  signal X0_n_22 : STD_LOGIC;
  signal X0_n_23 : STD_LOGIC;
  signal X0_n_24 : STD_LOGIC;
  signal X0_n_25 : STD_LOGIC;
  signal X0_n_26 : STD_LOGIC;
  signal X0_n_27 : STD_LOGIC;
  signal X0_n_28 : STD_LOGIC;
  signal X0_n_29 : STD_LOGIC;
  signal X0_n_3 : STD_LOGIC;
  signal X0_n_30 : STD_LOGIC;
  signal X0_n_31 : STD_LOGIC;
  signal X0_n_32 : STD_LOGIC;
  signal X0_n_33 : STD_LOGIC;
  signal X0_n_34 : STD_LOGIC;
  signal X0_n_35 : STD_LOGIC;
  signal X0_n_36 : STD_LOGIC;
  signal X0_n_37 : STD_LOGIC;
  signal X0_n_38 : STD_LOGIC;
  signal X0_n_39 : STD_LOGIC;
  signal X0_n_4 : STD_LOGIC;
  signal X0_n_40 : STD_LOGIC;
  signal X0_n_41 : STD_LOGIC;
  signal X0_n_42 : STD_LOGIC;
  signal X0_n_43 : STD_LOGIC;
  signal X0_n_44 : STD_LOGIC;
  signal X0_n_45 : STD_LOGIC;
  signal X0_n_46 : STD_LOGIC;
  signal X0_n_47 : STD_LOGIC;
  signal X0_n_48 : STD_LOGIC;
  signal X0_n_49 : STD_LOGIC;
  signal X0_n_5 : STD_LOGIC;
  signal X0_n_50 : STD_LOGIC;
  signal X0_n_51 : STD_LOGIC;
  signal X0_n_52 : STD_LOGIC;
  signal X0_n_53 : STD_LOGIC;
  signal X0_n_54 : STD_LOGIC;
  signal X0_n_55 : STD_LOGIC;
  signal X0_n_56 : STD_LOGIC;
  signal X0_n_57 : STD_LOGIC;
  signal X0_n_58 : STD_LOGIC;
  signal X0_n_59 : STD_LOGIC;
  signal X0_n_6 : STD_LOGIC;
  signal X0_n_60 : STD_LOGIC;
  signal X0_n_61 : STD_LOGIC;
  signal X0_n_62 : STD_LOGIC;
  signal X0_n_63 : STD_LOGIC;
  signal X0_n_64 : STD_LOGIC;
  signal X0_n_65 : STD_LOGIC;
  signal X0_n_66 : STD_LOGIC;
  signal X0_n_7 : STD_LOGIC;
  signal X0_n_8 : STD_LOGIC;
  signal X0_n_9 : STD_LOGIC;
  signal a : STD_LOGIC;
  signal a_1 : STD_LOGIC;
  signal b : STD_LOGIC;
  signal b_0 : STD_LOGIC;
  signal clock_base : STD_LOGIC;
  signal data_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal in_next_int : STD_LOGIC;
  signal in_shift_aux : STD_LOGIC;
  signal in_start_stop_int : STD_LOGIC;
  signal last_aux : STD_LOGIC;
  signal \^m00_axis_tvalid\ : STD_LOGIC;
  signal outSR_shift : STD_LOGIC;
  signal out_next_int : STD_LOGIC;
  signal out_start_stop_int : STD_LOGIC;
  signal rx_fifo_last_int : STD_LOGIC;
  signal \^s00_axis_tready\ : STD_LOGIC;
begin
  MCK <= \^mck\;
  Q_reg <= \^q_reg\;
  m00_axis_tvalid <= \^m00_axis_tvalid\;
  s00_axis_tready <= \^s00_axis_tready\;
CLK_DIV2: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clock_divider_by_2
     port map (
      MCK => \^mck\,
      clock_base => clock_base,
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\
    );
CLK_DIV4: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clock_divider_by_2_0
     port map (
      CLK => CLK,
      MCK => \^mck\,
      Q_reg => \^q_reg\,
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\
    );
CLk_DIV_CNTR: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter3Bits
     port map (
      clock_base => clock_base,
      s00_axi_aclk => s00_axi_aclk,
      \slv_reg0_reg[17]\(1 downto 0) => \slv_reg0_reg[31]_0\(1 downto 0),
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\
    );
DBG: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_GyroChannelDebugger
     port map (
      CLK => \^s00_axis_tready\,
      Q(7 downto 0) => \r_reg_reg[7]\(7 downto 0),
      Q_reg => \^m00_axis_tvalid\,
      in_next_int => in_next_int,
      out_next_int => out_next_int,
      \r_reg_reg[7]\(7 downto 0) => \r_reg_reg[7]_0\(7 downto 0),
      \r_reg_reg[7]_0\(7 downto 0) => \r_reg_reg[7]_1\(7 downto 0),
      \r_reg_reg[7]_1\(7 downto 0) => \r_reg_reg[7]_2\(7 downto 0),
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\
    );
IN_SHIFT_REG: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_inputShiftRegister32Bits
     port map (
      CLK => Q,
      D(0) => D(0),
      m00_axis_tdata(31 downto 0) => m00_axis_tdata(31 downto 0),
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\
    );
LAST_CNTR: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits
     port map (
      Q_reg => \^m00_axis_tvalid\,
      rx_fifo_last_int => rx_fifo_last_int,
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\
    );
MASK_HSCK: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_maskHSCK
     port map (
      CLK => Q,
      Q_reg => MASK_HSCK_n_0,
      Q_reg_0 => \^q_reg\,
      a => a,
      a_0 => a_1,
      b => b,
      b_1 => b_0,
      in_next_int => in_next_int,
      in_shift_aux => in_shift_aux,
      in_start_stop_int => in_start_stop_int,
      last_aux => last_aux,
      m00_axis_tvalid => \^m00_axis_tvalid\,
      out_next_int => out_next_int,
      out_start_stop_int => out_start_stop_int,
      s00_axis_tready => \^s00_axis_tready\,
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\,
      \slv_reg1_reg[4]\(1 downto 0) => \slv_reg1_reg[4]\(1 downto 0)
    );
OUT_SHIFT_REG: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_outputShiftRegister32Bits
     port map (
      hs_data_out_int => hs_data_out_int,
      outSR_shift => outSR_shift,
      \slv_reg0_reg[31]\ => X0_n_34,
      \slv_reg0_reg[31]_0\ => X0_n_2,
      \slv_reg0_reg[31]_1\ => X0_n_66,
      \slv_reg0_reg[31]_10\ => X0_n_7,
      \slv_reg0_reg[31]_11\ => X0_n_61,
      \slv_reg0_reg[31]_12\ => X0_n_8,
      \slv_reg0_reg[31]_13\ => X0_n_60,
      \slv_reg0_reg[31]_14\ => X0_n_9,
      \slv_reg0_reg[31]_15\ => X0_n_59,
      \slv_reg0_reg[31]_16\ => X0_n_10,
      \slv_reg0_reg[31]_17\ => X0_n_58,
      \slv_reg0_reg[31]_18\ => X0_n_11,
      \slv_reg0_reg[31]_19\ => X0_n_57,
      \slv_reg0_reg[31]_2\ => X0_n_3,
      \slv_reg0_reg[31]_20\ => X0_n_12,
      \slv_reg0_reg[31]_21\ => X0_n_56,
      \slv_reg0_reg[31]_22\ => X0_n_13,
      \slv_reg0_reg[31]_23\ => X0_n_55,
      \slv_reg0_reg[31]_24\ => X0_n_14,
      \slv_reg0_reg[31]_25\ => X0_n_54,
      \slv_reg0_reg[31]_26\ => X0_n_15,
      \slv_reg0_reg[31]_27\ => X0_n_53,
      \slv_reg0_reg[31]_28\ => X0_n_16,
      \slv_reg0_reg[31]_29\ => X0_n_52,
      \slv_reg0_reg[31]_3\ => X0_n_65,
      \slv_reg0_reg[31]_30\ => X0_n_17,
      \slv_reg0_reg[31]_31\ => X0_n_51,
      \slv_reg0_reg[31]_32\ => X0_n_18,
      \slv_reg0_reg[31]_33\ => X0_n_50,
      \slv_reg0_reg[31]_34\ => X0_n_19,
      \slv_reg0_reg[31]_35\ => X0_n_49,
      \slv_reg0_reg[31]_36\ => X0_n_20,
      \slv_reg0_reg[31]_37\ => X0_n_48,
      \slv_reg0_reg[31]_38\ => X0_n_21,
      \slv_reg0_reg[31]_39\ => X0_n_47,
      \slv_reg0_reg[31]_4\ => X0_n_4,
      \slv_reg0_reg[31]_40\ => X0_n_22,
      \slv_reg0_reg[31]_41\ => X0_n_46,
      \slv_reg0_reg[31]_42\ => X0_n_23,
      \slv_reg0_reg[31]_43\ => X0_n_45,
      \slv_reg0_reg[31]_44\ => X0_n_24,
      \slv_reg0_reg[31]_45\ => X0_n_44,
      \slv_reg0_reg[31]_46\ => X0_n_25,
      \slv_reg0_reg[31]_47\ => X0_n_43,
      \slv_reg0_reg[31]_48\ => X0_n_26,
      \slv_reg0_reg[31]_49\ => X0_n_42,
      \slv_reg0_reg[31]_5\ => X0_n_64,
      \slv_reg0_reg[31]_50\ => X0_n_27,
      \slv_reg0_reg[31]_51\ => X0_n_41,
      \slv_reg0_reg[31]_52\ => X0_n_28,
      \slv_reg0_reg[31]_53\ => X0_n_40,
      \slv_reg0_reg[31]_54\ => X0_n_29,
      \slv_reg0_reg[31]_55\ => X0_n_39,
      \slv_reg0_reg[31]_56\ => X0_n_30,
      \slv_reg0_reg[31]_57\ => X0_n_38,
      \slv_reg0_reg[31]_58\ => X0_n_31,
      \slv_reg0_reg[31]_59\ => X0_n_37,
      \slv_reg0_reg[31]_6\ => X0_n_5,
      \slv_reg0_reg[31]_60\ => X0_n_32,
      \slv_reg0_reg[31]_61\ => X0_n_36,
      \slv_reg0_reg[31]_62\ => X0_n_33,
      \slv_reg0_reg[31]_63\ => X0_n_35,
      \slv_reg0_reg[31]_7\ => X0_n_63,
      \slv_reg0_reg[31]_8\ => X0_n_6,
      \slv_reg0_reg[31]_9\ => X0_n_62
    );
PULSE_CNTR: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_counter48Cycles
     port map (
      CLK => CLK,
      HS_Clock => HS_Clock,
      Q_reg => \^q_reg\,
      in_shift_aux => in_shift_aux,
      in_start_stop_int => in_start_stop_int,
      last_aux => last_aux,
      outSR_shift => outSR_shift,
      out_start_stop_int => out_start_stop_int,
      \slv_reg0_reg[28]\(0) => \slv_reg0_reg[31]_0\(2),
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\
    );
TX_DELAY_REG: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_register_32bits
     port map (
      Q(31 downto 0) => data_out(31 downto 0),
      s00_axi_aclk => s00_axi_aclk,
      s00_axis_tdata(31 downto 0) => s00_axis_tdata(31 downto 0),
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\
    );
X0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_syncReady
     port map (
      Q(31 downto 0) => data_out(31 downto 0),
      Q_reg => MASK_HSCK_n_0,
      a => a,
      b => b,
      clk0 => clk0,
      out_next_int => out_next_int,
      out_start_stop_int => out_start_stop_int,
      \r_reg_reg[0]_P\ => X0_n_33,
      \r_reg_reg[10]_C\ => X0_n_45,
      \r_reg_reg[10]_P\ => X0_n_23,
      \r_reg_reg[11]_C\ => X0_n_46,
      \r_reg_reg[11]_P\ => X0_n_22,
      \r_reg_reg[12]_C\ => X0_n_47,
      \r_reg_reg[12]_P\ => X0_n_21,
      \r_reg_reg[13]_C\ => X0_n_48,
      \r_reg_reg[13]_P\ => X0_n_20,
      \r_reg_reg[14]_C\ => X0_n_49,
      \r_reg_reg[14]_P\ => X0_n_19,
      \r_reg_reg[15]_C\ => X0_n_50,
      \r_reg_reg[15]_P\ => X0_n_18,
      \r_reg_reg[16]_C\ => X0_n_51,
      \r_reg_reg[16]_P\ => X0_n_17,
      \r_reg_reg[17]_C\ => X0_n_52,
      \r_reg_reg[17]_P\ => X0_n_16,
      \r_reg_reg[18]_C\ => X0_n_53,
      \r_reg_reg[18]_P\ => X0_n_15,
      \r_reg_reg[19]_C\ => X0_n_54,
      \r_reg_reg[19]_P\ => X0_n_14,
      \r_reg_reg[1]_C\ => X0_n_36,
      \r_reg_reg[1]_P\ => X0_n_32,
      \r_reg_reg[1]_P_0\ => X0_n_35,
      \r_reg_reg[20]_C\ => X0_n_55,
      \r_reg_reg[20]_P\ => X0_n_13,
      \r_reg_reg[21]_C\ => X0_n_56,
      \r_reg_reg[21]_P\ => X0_n_12,
      \r_reg_reg[22]_C\ => X0_n_57,
      \r_reg_reg[22]_P\ => X0_n_11,
      \r_reg_reg[23]_C\ => X0_n_58,
      \r_reg_reg[23]_P\ => X0_n_10,
      \r_reg_reg[24]_C\ => X0_n_59,
      \r_reg_reg[24]_P\ => X0_n_9,
      \r_reg_reg[25]_C\ => X0_n_60,
      \r_reg_reg[25]_P\ => X0_n_8,
      \r_reg_reg[26]_C\ => X0_n_61,
      \r_reg_reg[26]_P\ => X0_n_7,
      \r_reg_reg[27]_C\ => X0_n_62,
      \r_reg_reg[27]_P\ => X0_n_6,
      \r_reg_reg[28]_C\ => X0_n_63,
      \r_reg_reg[28]_P\ => X0_n_5,
      \r_reg_reg[29]_C\ => X0_n_64,
      \r_reg_reg[29]_P\ => X0_n_4,
      \r_reg_reg[2]_C\ => X0_n_37,
      \r_reg_reg[2]_P\ => X0_n_31,
      \r_reg_reg[30]_C\ => X0_n_65,
      \r_reg_reg[30]_P\ => X0_n_3,
      \r_reg_reg[31]_C\ => X0_n_66,
      \r_reg_reg[31]_P\ => X0_n_2,
      \r_reg_reg[32]\ => X0_n_34,
      \r_reg_reg[3]_C\ => X0_n_38,
      \r_reg_reg[3]_P\ => X0_n_30,
      \r_reg_reg[4]_C\ => X0_n_39,
      \r_reg_reg[4]_P\ => X0_n_29,
      \r_reg_reg[5]_C\ => X0_n_40,
      \r_reg_reg[5]_P\ => X0_n_28,
      \r_reg_reg[6]_C\ => X0_n_41,
      \r_reg_reg[6]_P\ => X0_n_27,
      \r_reg_reg[7]_C\ => X0_n_42,
      \r_reg_reg[7]_P\ => X0_n_26,
      \r_reg_reg[8]_C\ => X0_n_43,
      \r_reg_reg[8]_P\ => X0_n_25,
      \r_reg_reg[9]_C\ => X0_n_44,
      \r_reg_reg[9]_P\ => X0_n_24,
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axis_tvalid => s00_axis_tvalid,
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\,
      \slv_reg0_reg[31]_0\(0) => \slv_reg0_reg[31]_0\(3)
    );
X1: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_syncReady_1
     port map (
      a => a_1,
      b => b_0,
      clk0 => clk0,
      in_next_int => in_next_int,
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\
    );
X10: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff
     port map (
      m00_axis_tlast => m00_axis_tlast,
      rx_fifo_last_int => rx_fifo_last_int,
      s00_axi_aclk => s00_axi_aclk,
      \slv_reg0_reg[31]\ => \slv_reg0_reg[31]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_BiDirChannels_v1_0 is
  port (
    MCK_P : out STD_LOGIC;
    MCK_N : out STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    clock_div_4 : out STD_LOGIC;
    m00_axis_tlast : out STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    HS_Clock : out STD_LOGIC;
    HS_DataOut : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    CLK : in STD_LOGIC;
    clk0 : in STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC;
    HS_DataIn : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_BiDirChannels_v1_0;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_BiDirChannels_v1_0 is
  signal BiDirChannels_v1_0_S00_AXI_inst_n_11 : STD_LOGIC;
  signal BiDirChannels_v1_0_S00_AXI_inst_n_13 : STD_LOGIC;
  signal D : STD_LOGIC;
  signal \DBG/CNTR0/r_reg_reg__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \DBG/CNTR1/r_reg_reg__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \DBG/CNTR2/r_reg_reg__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \DBG/CNTR3/r_reg_reg__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal MCK : STD_LOGIC;
  signal data_word_0 : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal hs_data_in_int : STD_LOGIC;
  signal hs_data_out_int : STD_LOGIC;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of OBUFDS_inst : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of OBUFDS_inst : label is "DONT_CARE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of OBUFDS_inst : label is "OBUFDS";
begin
BiDirChannels_v1_0_S00_AXI_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_BiDirChannels_v1_0_S00_AXI
     port map (
      D(0) => hs_data_in_int,
      HS_DataIn => HS_DataIn,
      HS_DataOut => HS_DataOut,
      Q(3) => data_word_0(31),
      Q(2) => data_word_0(28),
      Q(1 downto 0) => data_word_0(17 downto 16),
      Q_reg(1) => D,
      Q_reg(0) => BiDirChannels_v1_0_S00_AXI_inst_n_11,
      Q_reg_0 => BiDirChannels_v1_0_S00_AXI_inst_n_13,
      hs_data_out_int => hs_data_out_int,
      \r_reg_reg[7]\(7 downto 0) => \DBG/CNTR3/r_reg_reg__0\(7 downto 0),
      \r_reg_reg[7]_0\(7 downto 0) => \DBG/CNTR2/r_reg_reg__0\(7 downto 0),
      \r_reg_reg[7]_1\(7 downto 0) => \DBG/CNTR1/r_reg_reg__0\(7 downto 0),
      \r_reg_reg[7]_2\(7 downto 0) => \DBG/CNTR0/r_reg_reg__0\(7 downto 0),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(1 downto 0),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arready => s00_axi_arready,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(1 downto 0) => s00_axi_awaddr(1 downto 0),
      s00_axi_awready => s00_axi_awready,
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wready => s00_axi_wready,
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid
    );
OBUFDS_inst: unisim.vcomponents.OBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => MCK,
      O => MCK_P,
      OB => MCK_N
    );
X1: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_GyroInputOutputSerializer
     port map (
      CLK => CLK,
      D(0) => hs_data_in_int,
      HS_Clock => HS_Clock,
      MCK => MCK,
      Q_reg => clock_div_4,
      clk0 => clk0,
      hs_data_out_int => hs_data_out_int,
      m00_axis_tdata(31 downto 0) => m00_axis_tdata(31 downto 0),
      m00_axis_tlast => m00_axis_tlast,
      m00_axis_tvalid => m00_axis_tvalid,
      \r_reg_reg[7]\(7 downto 0) => \DBG/CNTR3/r_reg_reg__0\(7 downto 0),
      \r_reg_reg[7]_0\(7 downto 0) => \DBG/CNTR2/r_reg_reg__0\(7 downto 0),
      \r_reg_reg[7]_1\(7 downto 0) => \DBG/CNTR1/r_reg_reg__0\(7 downto 0),
      \r_reg_reg[7]_2\(7 downto 0) => \DBG/CNTR0/r_reg_reg__0\(7 downto 0),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axis_tdata(31 downto 0) => s00_axis_tdata(31 downto 0),
      s00_axis_tready => s00_axis_tready,
      s00_axis_tvalid => s00_axis_tvalid,
      \slv_reg0_reg[31]\ => BiDirChannels_v1_0_S00_AXI_inst_n_13,
      \slv_reg0_reg[31]_0\(3) => data_word_0(31),
      \slv_reg0_reg[31]_0\(2) => data_word_0(28),
      \slv_reg0_reg[31]_0\(1 downto 0) => data_word_0(17 downto 16),
      \slv_reg1_reg[4]\(1) => D,
      \slv_reg1_reg[4]\(0) => BiDirChannels_v1_0_S00_AXI_inst_n_11
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    HS_DataIn : in STD_LOGIC;
    HS_DataOut : out STD_LOGIC;
    HS_Clock : out STD_LOGIC;
    MCK_P : out STD_LOGIC;
    MCK_N : out STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC;
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axis_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axis_tlast : in STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_2_BiDirChannels_0_0,BiDirChannels_v1_0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "BiDirChannels_v1_0,Vivado 2018.2";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal Q_reg_i_1_n_0 : STD_LOGIC;
  signal \X1/clock_div_4\ : STD_LOGIC;
  signal clk0 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of m00_axis_aclk : signal is "xilinx.com:signal:clock:1.0 M00_AXIS_CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of m00_axis_aclk : signal is "XIL_INTERFACENAME M00_AXIS_CLK, ASSOCIATED_BUSIF M00_AXIS, ASSOCIATED_RESET m00_axis_aresetn, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN design_2_processing_system7_0_0_FCLK_CLK0";
  attribute X_INTERFACE_INFO of m00_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 M00_AXIS_RST RST";
  attribute X_INTERFACE_PARAMETER of m00_axis_aresetn : signal is "XIL_INTERFACENAME M00_AXIS_RST, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of m00_axis_tlast : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TLAST";
  attribute X_INTERFACE_INFO of m00_axis_tready : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TREADY";
  attribute X_INTERFACE_PARAMETER of m00_axis_tready : signal is "XIL_INTERFACENAME M00_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN design_2_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of m00_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TVALID";
  attribute X_INTERFACE_INFO of s00_axi_aclk : signal is "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK";
  attribute X_INTERFACE_PARAMETER of s00_axi_aclk : signal is "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN design_2_processing_system7_0_0_FCLK_CLK0";
  attribute X_INTERFACE_INFO of s00_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 S00_AXI_RST RST";
  attribute X_INTERFACE_PARAMETER of s00_axi_aresetn : signal is "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of s00_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY";
  attribute X_INTERFACE_INFO of s00_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID";
  attribute X_INTERFACE_INFO of s00_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY";
  attribute X_INTERFACE_INFO of s00_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID";
  attribute X_INTERFACE_INFO of s00_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BREADY";
  attribute X_INTERFACE_INFO of s00_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BVALID";
  attribute X_INTERFACE_INFO of s00_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RREADY";
  attribute X_INTERFACE_PARAMETER of s00_axi_rready : signal is "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 1e+08, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN design_2_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0";
  attribute X_INTERFACE_INFO of s00_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RVALID";
  attribute X_INTERFACE_INFO of s00_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WREADY";
  attribute X_INTERFACE_INFO of s00_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WVALID";
  attribute X_INTERFACE_INFO of s00_axis_aclk : signal is "xilinx.com:signal:clock:1.0 S00_AXIS_CLK CLK";
  attribute X_INTERFACE_PARAMETER of s00_axis_aclk : signal is "XIL_INTERFACENAME S00_AXIS_CLK, ASSOCIATED_BUSIF S00_AXIS, ASSOCIATED_RESET s00_axis_aresetn, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN design_2_processing_system7_0_0_FCLK_CLK0";
  attribute X_INTERFACE_INFO of s00_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 S00_AXIS_RST RST";
  attribute X_INTERFACE_PARAMETER of s00_axis_aresetn : signal is "XIL_INTERFACENAME S00_AXIS_RST, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of s00_axis_tlast : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TLAST";
  attribute X_INTERFACE_INFO of s00_axis_tready : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TREADY";
  attribute X_INTERFACE_PARAMETER of s00_axis_tready : signal is "XIL_INTERFACENAME S00_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN design_2_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of s00_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TVALID";
  attribute X_INTERFACE_INFO of m00_axis_tdata : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TDATA";
  attribute X_INTERFACE_INFO of m00_axis_tstrb : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TSTRB";
  attribute X_INTERFACE_INFO of s00_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR";
  attribute X_INTERFACE_INFO of s00_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT";
  attribute X_INTERFACE_INFO of s00_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR";
  attribute X_INTERFACE_INFO of s00_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT";
  attribute X_INTERFACE_INFO of s00_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BRESP";
  attribute X_INTERFACE_INFO of s00_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RDATA";
  attribute X_INTERFACE_INFO of s00_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RRESP";
  attribute X_INTERFACE_INFO of s00_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WDATA";
  attribute X_INTERFACE_INFO of s00_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB";
  attribute X_INTERFACE_INFO of s00_axis_tdata : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TDATA";
  attribute X_INTERFACE_INFO of s00_axis_tstrb : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TSTRB";
begin
  m00_axis_tstrb(3) <= \<const1>\;
  m00_axis_tstrb(2) <= \<const1>\;
  m00_axis_tstrb(1) <= \<const1>\;
  m00_axis_tstrb(0) <= \<const1>\;
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
Q_reg_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \X1/clock_div_4\,
      O => Q_reg_i_1_n_0
    );
Q_reg_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_aclk,
      O => clk0
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_BiDirChannels_v1_0
     port map (
      CLK => Q_reg_i_1_n_0,
      HS_Clock => HS_Clock,
      HS_DataIn => HS_DataIn,
      HS_DataOut => HS_DataOut,
      MCK_N => MCK_N,
      MCK_P => MCK_P,
      clk0 => clk0,
      clock_div_4 => \X1/clock_div_4\,
      m00_axis_tdata(31 downto 0) => m00_axis_tdata(31 downto 0),
      m00_axis_tlast => m00_axis_tlast,
      m00_axis_tvalid => m00_axis_tvalid,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(3 downto 2),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arready => s00_axi_arready,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(1 downto 0) => s00_axi_awaddr(3 downto 2),
      s00_axi_awready => s00_axi_awready,
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wready => s00_axi_wready,
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid,
      s00_axis_tdata(31 downto 0) => s00_axis_tdata(31 downto 0),
      s00_axis_tready => s00_axis_tready,
      s00_axis_tvalid => s00_axis_tvalid
    );
end STRUCTURE;
