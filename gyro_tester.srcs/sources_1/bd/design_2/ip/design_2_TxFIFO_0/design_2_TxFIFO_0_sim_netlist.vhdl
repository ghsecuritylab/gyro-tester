-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Wed Aug  7 21:20:07 2019
-- Host        : LAPTOP-FM91H59Q running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               C:/Docs/gyro_tester_zedboard_code/gyro_tester.srcs/sources_1/bd/design_2/ip/design_2_TxFIFO_0/design_2_TxFIFO_0_sim_netlist.vhdl
-- Design      : design_2_TxFIFO_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_2_TxFIFO_0_axis_stream_fifo_v1_0_S00_AXI is
  port (
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 10 downto 0 );
    mem_reg : out STD_LOGIC;
    \rd_ptr_reg_reg[10]\ : out STD_LOGIC_VECTOR ( 8 downto 0 );
    \rd_ptr_reg_reg[9]\ : out STD_LOGIC;
    \wr_ptr_reg_reg[10]\ : out STD_LOGIC_VECTOR ( 8 downto 0 );
    \wr_addr_reg_reg[7]\ : out STD_LOGIC;
    \wr_ptr_gray_reg_reg[10]\ : out STD_LOGIC_VECTOR ( 9 downto 0 );
    \wr_ptr_gray_reg_reg[10]_0\ : out STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_rst_sync3_reg_reg : out STD_LOGIC;
    s00_rst_sync2_reg_reg : out STD_LOGIC;
    m00_rst_sync3_reg_reg : out STD_LOGIC;
    m00_rst_sync2_reg_reg : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 24 downto 0 );
    s00_rst_sync1_reg0 : out STD_LOGIC;
    m00_rst_sync1_reg0 : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 10 downto 0 );
    \rd_ptr_reg_reg[10]_0\ : in STD_LOGIC_VECTOR ( 10 downto 0 );
    mem_read_data_valid_reg : in STD_LOGIC;
    dbg_word2_int : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \wr_ptr_gray_reg_reg[10]_1\ : in STD_LOGIC_VECTOR ( 10 downto 0 );
    m00_axis_tvalid_reg_reg : in STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC;
    CO : in STD_LOGIC_VECTOR ( 0 to 0 );
    \rd_ptr_gray_sync2_reg_reg[10]\ : in STD_LOGIC_VECTOR ( 10 downto 0 );
    m00_rst_sync1_reg : in STD_LOGIC;
    s00_rst_sync1_reg : in STD_LOGIC;
    m00_rst_sync2_reg : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    s00_rst_sync3_reg_reg_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    \wr_addr_reg_reg[10]\ : in STD_LOGIC_VECTOR ( 10 downto 0 );
    dbg_word1_int : in STD_LOGIC_VECTOR ( 10 downto 0 );
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axis_aresetn : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_2_TxFIFO_0_axis_stream_fifo_v1_0_S00_AXI : entity is "axis_stream_fifo_v1_0_S00_AXI";
end design_2_TxFIFO_0_axis_stream_fifo_v1_0_S00_AXI;

architecture STRUCTURE of design_2_TxFIFO_0_axis_stream_fifo_v1_0_S00_AXI is
  signal \^d\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal aw_en_i_1_n_0 : STD_LOGIC;
  signal aw_en_reg_n_0 : STD_LOGIC;
  signal axi_araddr : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \axi_araddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_araddr[3]_i_1_n_0\ : STD_LOGIC;
  signal axi_arready0 : STD_LOGIC;
  signal axi_awaddr : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \axi_awaddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_awaddr[3]_i_1_n_0\ : STD_LOGIC;
  signal axi_awready0 : STD_LOGIC;
  signal axi_awready_i_1_n_0 : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal \axi_rdata[0]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_3_n_0\ : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal axi_wready0 : STD_LOGIC;
  signal \^mem_reg\ : STD_LOGIC;
  signal \rd_addr_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \rd_addr_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \rd_ptr_gray_reg[10]_i_2_n_0\ : STD_LOGIC;
  signal \rd_ptr_gray_reg[10]_i_3_n_0\ : STD_LOGIC;
  signal \rd_ptr_gray_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \rd_ptr_gray_reg[5]_i_2_n_0\ : STD_LOGIC;
  signal \rd_ptr_gray_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \^rd_ptr_reg_reg[10]\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \^rd_ptr_reg_reg[9]\ : STD_LOGIC;
  signal reg_data_out : STD_LOGIC_VECTOR ( 27 downto 0 );
  signal \^s00_axi_arready\ : STD_LOGIC;
  signal \^s00_axi_awready\ : STD_LOGIC;
  signal \^s00_axi_bvalid\ : STD_LOGIC;
  signal \^s00_axi_rvalid\ : STD_LOGIC;
  signal \^s00_axi_wready\ : STD_LOGIC;
  signal s00_rst_sync1_reg1 : STD_LOGIC;
  signal \slv_reg0[0]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg_rden__0\ : STD_LOGIC;
  signal \slv_reg_wren__0\ : STD_LOGIC;
  signal \wr_addr_reg[5]_i_2_n_0\ : STD_LOGIC;
  signal \wr_addr_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \^wr_addr_reg_reg[7]\ : STD_LOGIC;
  signal \wr_ptr_gray_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \wr_ptr_gray_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \^wr_ptr_gray_reg_reg[10]\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \^wr_ptr_gray_reg_reg[10]_0\ : STD_LOGIC;
  signal \^wr_ptr_reg_reg[10]\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of axi_arready_i_1 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of axi_awready_i_2 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \axi_rdata[9]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of axi_rvalid_i_1 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of axi_wready_i_1 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of m00_rst_sync1_reg_i_1 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of m00_rst_sync2_reg_i_1 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of m00_rst_sync3_reg_i_1 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \rd_ptr_gray_reg[0]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \rd_ptr_gray_reg[10]_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \rd_ptr_gray_reg[4]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \rd_ptr_gray_reg[5]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of s00_rst_sync1_reg_i_1 : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of s00_rst_sync2_reg_i_1 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of s00_rst_sync3_reg_i_1 : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \wr_addr_reg[10]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \wr_addr_reg[1]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \wr_addr_reg[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \wr_addr_reg[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \wr_addr_reg[5]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \wr_addr_reg[5]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \wr_addr_reg[6]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \wr_addr_reg[7]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \wr_addr_reg[8]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \wr_ptr_gray_reg[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \wr_ptr_gray_reg[3]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \wr_ptr_gray_reg[4]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \wr_ptr_gray_reg[5]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \wr_ptr_gray_reg[6]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \wr_ptr_gray_reg[8]_i_1\ : label is "soft_lutpair3";
begin
  D(10 downto 0) <= \^d\(10 downto 0);
  mem_reg <= \^mem_reg\;
  \rd_ptr_reg_reg[10]\(8 downto 0) <= \^rd_ptr_reg_reg[10]\(8 downto 0);
  \rd_ptr_reg_reg[9]\ <= \^rd_ptr_reg_reg[9]\;
  s00_axi_arready <= \^s00_axi_arready\;
  s00_axi_awready <= \^s00_axi_awready\;
  s00_axi_bvalid <= \^s00_axi_bvalid\;
  s00_axi_rvalid <= \^s00_axi_rvalid\;
  s00_axi_wready <= \^s00_axi_wready\;
  \wr_addr_reg_reg[7]\ <= \^wr_addr_reg_reg[7]\;
  \wr_ptr_gray_reg_reg[10]\(9 downto 0) <= \^wr_ptr_gray_reg_reg[10]\(9 downto 0);
  \wr_ptr_gray_reg_reg[10]_0\ <= \^wr_ptr_gray_reg_reg[10]_0\;
  \wr_ptr_reg_reg[10]\(8 downto 0) <= \^wr_ptr_reg_reg[10]\(8 downto 0);
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
      I5 => axi_awaddr(2),
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
      I5 => axi_awaddr(3),
      O => \axi_awaddr[3]_i_1_n_0\
    );
\axi_awaddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[2]_i_1_n_0\,
      Q => axi_awaddr(2),
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[3]_i_1_n_0\,
      Q => axi_awaddr(3),
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
\axi_rdata[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"606F6F60606F606F"
    )
        port map (
      I0 => dbg_word2_int(0),
      I1 => \^wr_addr_reg_reg[7]\,
      I2 => axi_araddr(3),
      I3 => \rd_ptr_reg_reg[10]_0\(0),
      I4 => \^mem_reg\,
      I5 => mem_read_data_valid_reg,
      O => \axi_rdata[0]_i_2_n_0\
    );
\axi_rdata[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"74FF7400"
    )
        port map (
      I0 => dbg_word2_int(1),
      I1 => \^wr_addr_reg_reg[7]\,
      I2 => \wr_ptr_gray_reg_reg[10]_1\(0),
      I3 => axi_araddr(3),
      I4 => \^d\(0),
      O => \axi_rdata[0]_i_3_n_0\
    );
\axi_rdata[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^wr_ptr_gray_reg_reg[10]\(9),
      I1 => \^d\(10),
      I2 => axi_araddr(2),
      I3 => \^wr_ptr_reg_reg[10]\(8),
      I4 => axi_araddr(3),
      I5 => \^rd_ptr_reg_reg[10]\(8),
      O => reg_data_out(10)
    );
\axi_rdata[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \wr_addr_reg_reg[10]\(0),
      I1 => dbg_word1_int(0),
      I2 => axi_araddr(2),
      I3 => dbg_word2_int(0),
      I4 => axi_araddr(3),
      I5 => \rd_ptr_reg_reg[10]_0\(0),
      O => reg_data_out(14)
    );
\axi_rdata[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \wr_addr_reg_reg[10]\(1),
      I1 => dbg_word1_int(1),
      I2 => axi_araddr(2),
      I3 => dbg_word2_int(1),
      I4 => axi_araddr(3),
      I5 => \rd_ptr_reg_reg[10]_0\(1),
      O => reg_data_out(15)
    );
\axi_rdata[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \wr_addr_reg_reg[10]\(2),
      I1 => dbg_word1_int(2),
      I2 => axi_araddr(2),
      I3 => dbg_word2_int(2),
      I4 => axi_araddr(3),
      I5 => \rd_ptr_reg_reg[10]_0\(2),
      O => reg_data_out(16)
    );
\axi_rdata[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \wr_addr_reg_reg[10]\(3),
      I1 => dbg_word1_int(3),
      I2 => axi_araddr(2),
      I3 => dbg_word2_int(3),
      I4 => axi_araddr(3),
      I5 => \rd_ptr_reg_reg[10]_0\(3),
      O => reg_data_out(17)
    );
\axi_rdata[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \wr_addr_reg_reg[10]\(4),
      I1 => dbg_word1_int(4),
      I2 => axi_araddr(2),
      I3 => dbg_word2_int(4),
      I4 => axi_araddr(3),
      I5 => \rd_ptr_reg_reg[10]_0\(4),
      O => reg_data_out(18)
    );
\axi_rdata[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \wr_addr_reg_reg[10]\(5),
      I1 => dbg_word1_int(5),
      I2 => axi_araddr(2),
      I3 => dbg_word2_int(5),
      I4 => axi_araddr(3),
      I5 => \rd_ptr_reg_reg[10]_0\(5),
      O => reg_data_out(19)
    );
\axi_rdata[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^wr_ptr_gray_reg_reg[10]\(0),
      I1 => \^d\(1),
      I2 => axi_araddr(2),
      I3 => \^wr_ptr_reg_reg[10]\(0),
      I4 => axi_araddr(3),
      I5 => \^rd_ptr_reg_reg[10]\(0),
      O => reg_data_out(1)
    );
\axi_rdata[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \wr_addr_reg_reg[10]\(6),
      I1 => dbg_word1_int(6),
      I2 => axi_araddr(2),
      I3 => dbg_word2_int(6),
      I4 => axi_araddr(3),
      I5 => \rd_ptr_reg_reg[10]_0\(6),
      O => reg_data_out(20)
    );
\axi_rdata[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \wr_addr_reg_reg[10]\(7),
      I1 => dbg_word1_int(7),
      I2 => axi_araddr(2),
      I3 => dbg_word2_int(7),
      I4 => axi_araddr(3),
      I5 => \rd_ptr_reg_reg[10]_0\(7),
      O => reg_data_out(21)
    );
\axi_rdata[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \wr_addr_reg_reg[10]\(8),
      I1 => dbg_word1_int(8),
      I2 => axi_araddr(2),
      I3 => dbg_word2_int(8),
      I4 => axi_araddr(3),
      I5 => \rd_ptr_reg_reg[10]_0\(8),
      O => reg_data_out(22)
    );
\axi_rdata[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \wr_addr_reg_reg[10]\(9),
      I1 => dbg_word1_int(9),
      I2 => axi_araddr(2),
      I3 => dbg_word2_int(9),
      I4 => axi_araddr(3),
      I5 => \rd_ptr_reg_reg[10]_0\(9),
      O => reg_data_out(23)
    );
\axi_rdata[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \wr_addr_reg_reg[10]\(10),
      I1 => dbg_word1_int(10),
      I2 => axi_araddr(2),
      I3 => dbg_word2_int(10),
      I4 => axi_araddr(3),
      I5 => \rd_ptr_reg_reg[10]_0\(10),
      O => reg_data_out(24)
    );
\axi_rdata[25]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => SR(0),
      I1 => axi_araddr(3),
      I2 => s00_rst_sync3_reg_reg_0(0),
      I3 => axi_araddr(2),
      O => reg_data_out(25)
    );
\axi_rdata[26]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => m00_rst_sync2_reg,
      I1 => axi_araddr(3),
      I2 => dbg_word2_int(11),
      I3 => axi_araddr(2),
      O => reg_data_out(26)
    );
\axi_rdata[27]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => m00_rst_sync1_reg,
      I1 => axi_araddr(3),
      I2 => s00_rst_sync1_reg,
      I3 => axi_araddr(2),
      O => reg_data_out(27)
    );
\axi_rdata[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^wr_ptr_gray_reg_reg[10]\(1),
      I1 => \^d\(2),
      I2 => axi_araddr(2),
      I3 => \^wr_ptr_reg_reg[10]\(1),
      I4 => axi_araddr(3),
      I5 => \^rd_ptr_reg_reg[10]\(1),
      O => reg_data_out(2)
    );
\axi_rdata[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^wr_ptr_gray_reg_reg[10]\(2),
      I1 => \^d\(3),
      I2 => axi_araddr(2),
      I3 => \^wr_ptr_reg_reg[10]\(2),
      I4 => axi_araddr(3),
      I5 => \^rd_ptr_reg_reg[10]\(2),
      O => reg_data_out(3)
    );
\axi_rdata[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^wr_ptr_gray_reg_reg[10]\(3),
      I1 => \^d\(4),
      I2 => axi_araddr(2),
      I3 => \^wr_ptr_reg_reg[10]\(3),
      I4 => axi_araddr(3),
      I5 => \^rd_ptr_reg_reg[10]\(3),
      O => reg_data_out(4)
    );
\axi_rdata[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^wr_ptr_gray_reg_reg[10]\(4),
      I1 => \^d\(5),
      I2 => axi_araddr(2),
      I3 => \^wr_ptr_reg_reg[10]\(4),
      I4 => axi_araddr(3),
      I5 => \^rd_ptr_reg_reg[10]\(4),
      O => reg_data_out(5)
    );
\axi_rdata[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^wr_ptr_gray_reg_reg[10]\(5),
      I1 => \^d\(6),
      I2 => axi_araddr(2),
      I3 => \^wr_ptr_reg_reg[10]\(5),
      I4 => axi_araddr(3),
      I5 => \^rd_ptr_reg_reg[10]\(5),
      O => reg_data_out(6)
    );
\axi_rdata[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^wr_ptr_gray_reg_reg[10]\(6),
      I1 => \^d\(7),
      I2 => axi_araddr(2),
      I3 => \^wr_ptr_reg_reg[10]\(6),
      I4 => axi_araddr(3),
      I5 => \^rd_ptr_reg_reg[10]\(6),
      O => reg_data_out(7)
    );
\axi_rdata[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^wr_ptr_gray_reg_reg[10]\(7),
      I1 => \^d\(8),
      I2 => axi_araddr(2),
      I3 => \^wr_ptr_reg_reg[10]\(7),
      I4 => axi_araddr(3),
      I5 => \^rd_ptr_reg_reg[10]\(7),
      O => reg_data_out(8)
    );
\axi_rdata[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C0CFA0A0C0CFAFAF"
    )
        port map (
      I0 => \^d\(9),
      I1 => \^wr_ptr_gray_reg_reg[10]\(8),
      I2 => axi_araddr(2),
      I3 => \axi_rdata[9]_i_2_n_0\,
      I4 => axi_araddr(3),
      I5 => \axi_rdata[9]_i_3_n_0\,
      O => reg_data_out(9)
    );
\axi_rdata[9]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5595"
    )
        port map (
      I0 => dbg_word2_int(9),
      I1 => \^wr_addr_reg_reg[7]\,
      I2 => dbg_word2_int(8),
      I3 => \^wr_ptr_gray_reg_reg[10]_0\,
      O => \axi_rdata[9]_i_2_n_0\
    );
\axi_rdata[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5595555555555555"
    )
        port map (
      I0 => \rd_ptr_reg_reg[10]_0\(9),
      I1 => \rd_ptr_reg_reg[10]_0\(7),
      I2 => \rd_ptr_reg_reg[10]_0\(6),
      I3 => \^rd_ptr_reg_reg[9]\,
      I4 => \rd_ptr_reg_reg[10]_0\(5),
      I5 => \rd_ptr_reg_reg[10]_0\(8),
      O => \axi_rdata[9]_i_3_n_0\
    );
\axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(0),
      Q => s00_axi_rdata(0),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[0]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[0]_i_2_n_0\,
      I1 => \axi_rdata[0]_i_3_n_0\,
      O => reg_data_out(0),
      S => axi_araddr(2)
    );
\axi_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(10),
      Q => s00_axi_rdata(10),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(14),
      Q => s00_axi_rdata(11),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(15),
      Q => s00_axi_rdata(12),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(16),
      Q => s00_axi_rdata(13),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(17),
      Q => s00_axi_rdata(14),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(18),
      Q => s00_axi_rdata(15),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(19),
      Q => s00_axi_rdata(16),
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
      Q => s00_axi_rdata(17),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(21),
      Q => s00_axi_rdata(18),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(22),
      Q => s00_axi_rdata(19),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(23),
      Q => s00_axi_rdata(20),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(24),
      Q => s00_axi_rdata(21),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(25),
      Q => s00_axi_rdata(22),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(26),
      Q => s00_axi_rdata(23),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(27),
      Q => s00_axi_rdata(24),
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
full0_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \rd_ptr_gray_sync2_reg_reg[10]\(8),
      I1 => \wr_ptr_gray_reg_reg[10]_1\(8),
      I2 => \wr_ptr_gray_reg_reg[10]_1\(6),
      I3 => \rd_ptr_gray_sync2_reg_reg[10]\(6),
      I4 => \wr_ptr_gray_reg_reg[10]_1\(7),
      I5 => \rd_ptr_gray_sync2_reg_reg[10]\(7),
      O => S(2)
    );
full0_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \rd_ptr_gray_sync2_reg_reg[10]\(5),
      I1 => \wr_ptr_gray_reg_reg[10]_1\(5),
      I2 => \wr_ptr_gray_reg_reg[10]_1\(3),
      I3 => \rd_ptr_gray_sync2_reg_reg[10]\(3),
      I4 => \wr_ptr_gray_reg_reg[10]_1\(4),
      I5 => \rd_ptr_gray_sync2_reg_reg[10]\(4),
      O => S(1)
    );
full0_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \wr_ptr_gray_reg_reg[10]_1\(2),
      I1 => \rd_ptr_gray_sync2_reg_reg[10]\(2),
      I2 => \wr_ptr_gray_reg_reg[10]_1\(0),
      I3 => \rd_ptr_gray_sync2_reg_reg[10]\(0),
      I4 => \rd_ptr_gray_sync2_reg_reg[10]\(1),
      I5 => \wr_ptr_gray_reg_reg[10]_1\(1),
      O => S(0)
    );
m00_rst_sync1_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => s00_rst_sync1_reg1,
      I1 => m00_axis_aresetn,
      O => m00_rst_sync1_reg0
    );
m00_rst_sync2_reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => s00_rst_sync1_reg,
      I1 => m00_rst_sync1_reg,
      I2 => m00_axis_aresetn,
      I3 => s00_rst_sync1_reg1,
      O => m00_rst_sync2_reg_reg
    );
m00_rst_sync3_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => m00_rst_sync2_reg,
      I1 => m00_axis_aresetn,
      I2 => s00_rst_sync1_reg1,
      O => m00_rst_sync3_reg_reg
    );
mem_reg_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => m00_axis_tready,
      I1 => m00_axis_tvalid_reg_reg,
      O => \^mem_reg\
    );
\rd_addr_reg[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFDFFFDF20200020"
    )
        port map (
      I0 => \rd_ptr_reg_reg[10]_0\(8),
      I1 => \rd_ptr_gray_reg[10]_i_2_n_0\,
      I2 => \rd_ptr_reg_reg[10]_0\(9),
      I3 => mem_read_data_valid_reg,
      I4 => \^mem_reg\,
      I5 => \rd_ptr_reg_reg[10]_0\(10),
      O => \^rd_ptr_reg_reg[10]\(8)
    );
\rd_addr_reg[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08F7FF00"
    )
        port map (
      I0 => mem_read_data_valid_reg,
      I1 => m00_axis_tvalid_reg_reg,
      I2 => m00_axis_tready,
      I3 => \rd_ptr_reg_reg[10]_0\(1),
      I4 => \rd_ptr_reg_reg[10]_0\(0),
      O => \^rd_ptr_reg_reg[10]\(0)
    );
\rd_addr_reg[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"08F7FF00FF00FF00"
    )
        port map (
      I0 => mem_read_data_valid_reg,
      I1 => m00_axis_tvalid_reg_reg,
      I2 => m00_axis_tready,
      I3 => \rd_ptr_reg_reg[10]_0\(2),
      I4 => \rd_ptr_reg_reg[10]_0\(0),
      I5 => \rd_ptr_reg_reg[10]_0\(1),
      O => \^rd_ptr_reg_reg[10]\(1)
    );
\rd_addr_reg[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAA6AAAAAAA6AAA"
    )
        port map (
      I0 => \rd_ptr_reg_reg[10]_0\(3),
      I1 => \rd_ptr_reg_reg[10]_0\(0),
      I2 => \rd_ptr_reg_reg[10]_0\(1),
      I3 => \rd_ptr_reg_reg[10]_0\(2),
      I4 => mem_read_data_valid_reg,
      I5 => \^mem_reg\,
      O => \^rd_ptr_reg_reg[10]\(2)
    );
\rd_addr_reg[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A6AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \rd_ptr_reg_reg[10]_0\(4),
      I1 => \rd_ptr_reg_reg[10]_0\(3),
      I2 => \rd_ptr_gray_reg[10]_i_3_n_0\,
      I3 => \rd_ptr_reg_reg[10]_0\(2),
      I4 => \rd_ptr_reg_reg[10]_0\(1),
      I5 => \rd_ptr_reg_reg[10]_0\(0),
      O => \^rd_ptr_reg_reg[10]\(3)
    );
\rd_addr_reg[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A6A6AAA6AAAAAAAA"
    )
        port map (
      I0 => \rd_ptr_reg_reg[10]_0\(5),
      I1 => \rd_ptr_reg_reg[10]_0\(4),
      I2 => \rd_ptr_gray_reg[4]_i_2_n_0\,
      I3 => mem_read_data_valid_reg,
      I4 => \^mem_reg\,
      I5 => \rd_ptr_reg_reg[10]_0\(3),
      O => \^rd_ptr_reg_reg[10]\(4)
    );
\rd_addr_reg[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAA6AAAAAAAAA"
    )
        port map (
      I0 => \rd_ptr_reg_reg[10]_0\(6),
      I1 => \rd_ptr_reg_reg[10]_0\(5),
      I2 => \rd_ptr_reg_reg[10]_0\(3),
      I3 => \rd_ptr_gray_reg[10]_i_3_n_0\,
      I4 => \rd_ptr_gray_reg[4]_i_2_n_0\,
      I5 => \rd_ptr_reg_reg[10]_0\(4),
      O => \^rd_ptr_reg_reg[10]\(5)
    );
\rd_addr_reg[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA6AAAAAAAAAAAAA"
    )
        port map (
      I0 => \rd_ptr_reg_reg[10]_0\(7),
      I1 => \rd_ptr_reg_reg[10]_0\(6),
      I2 => \rd_ptr_reg_reg[10]_0\(4),
      I3 => \rd_addr_reg[7]_i_2_n_0\,
      I4 => \rd_ptr_reg_reg[10]_0\(3),
      I5 => \rd_ptr_reg_reg[10]_0\(5),
      O => \^rd_ptr_reg_reg[10]\(6)
    );
\rd_addr_reg[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"40FFFFFFFFFFFFFF"
    )
        port map (
      I0 => m00_axis_tready,
      I1 => m00_axis_tvalid_reg_reg,
      I2 => mem_read_data_valid_reg,
      I3 => \rd_ptr_reg_reg[10]_0\(2),
      I4 => \rd_ptr_reg_reg[10]_0\(1),
      I5 => \rd_ptr_reg_reg[10]_0\(0),
      O => \rd_addr_reg[7]_i_2_n_0\
    );
\rd_addr_reg[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A6AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \rd_ptr_reg_reg[10]_0\(8),
      I1 => \rd_ptr_reg_reg[10]_0\(5),
      I2 => \rd_addr_reg[8]_i_2_n_0\,
      I3 => \rd_ptr_reg_reg[10]_0\(4),
      I4 => \rd_ptr_reg_reg[10]_0\(6),
      I5 => \rd_ptr_reg_reg[10]_0\(7),
      O => \^rd_ptr_reg_reg[10]\(7)
    );
\rd_addr_reg[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F7FFF7FFFFFFFFF"
    )
        port map (
      I0 => \rd_ptr_reg_reg[10]_0\(0),
      I1 => \rd_ptr_reg_reg[10]_0\(1),
      I2 => \rd_ptr_reg_reg[10]_0\(2),
      I3 => mem_read_data_valid_reg,
      I4 => \^mem_reg\,
      I5 => \rd_ptr_reg_reg[10]_0\(3),
      O => \rd_addr_reg[8]_i_2_n_0\
    );
\rd_addr_reg[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \rd_ptr_reg_reg[10]_0\(3),
      I1 => \rd_ptr_gray_reg[10]_i_3_n_0\,
      I2 => \rd_ptr_reg_reg[10]_0\(2),
      I3 => \rd_ptr_reg_reg[10]_0\(1),
      I4 => \rd_ptr_reg_reg[10]_0\(0),
      I5 => \rd_ptr_reg_reg[10]_0\(4),
      O => \^rd_ptr_reg_reg[9]\
    );
\rd_ptr_gray_reg[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5555C555"
    )
        port map (
      I0 => \rd_ptr_reg_reg[10]_0\(1),
      I1 => Q(0),
      I2 => mem_read_data_valid_reg,
      I3 => m00_axis_tvalid_reg_reg,
      I4 => m00_axis_tready,
      O => \^d\(0)
    );
\rd_ptr_gray_reg[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFA6AA0000A6AA"
    )
        port map (
      I0 => \rd_ptr_reg_reg[10]_0\(10),
      I1 => \rd_ptr_reg_reg[10]_0\(8),
      I2 => \rd_ptr_gray_reg[10]_i_2_n_0\,
      I3 => \rd_ptr_reg_reg[10]_0\(9),
      I4 => \rd_ptr_gray_reg[10]_i_3_n_0\,
      I5 => Q(10),
      O => \^d\(10)
    );
\rd_ptr_gray_reg[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FFFFFFFFFFFFFF"
    )
        port map (
      I0 => \rd_ptr_reg_reg[10]_0\(6),
      I1 => \rd_ptr_reg_reg[10]_0\(4),
      I2 => \rd_ptr_gray_reg[4]_i_2_n_0\,
      I3 => \rd_ptr_reg_reg[10]_0\(3),
      I4 => \rd_ptr_reg_reg[10]_0\(5),
      I5 => \rd_ptr_reg_reg[10]_0\(7),
      O => \rd_ptr_gray_reg[10]_i_2_n_0\
    );
\rd_ptr_gray_reg[10]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => mem_read_data_valid_reg,
      I1 => m00_axis_tvalid_reg_reg,
      I2 => m00_axis_tready,
      O => \rd_ptr_gray_reg[10]_i_3_n_0\
    );
\rd_ptr_gray_reg[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"08FB08FB08FBFB08"
    )
        port map (
      I0 => Q(1),
      I1 => mem_read_data_valid_reg,
      I2 => \^mem_reg\,
      I3 => \rd_ptr_reg_reg[10]_0\(2),
      I4 => \rd_ptr_reg_reg[10]_0\(0),
      I5 => \rd_ptr_reg_reg[10]_0\(1),
      O => \^d\(1)
    );
\rd_ptr_gray_reg[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8B8B8BB88BB88BB8"
    )
        port map (
      I0 => Q(2),
      I1 => \rd_ptr_gray_reg[10]_i_3_n_0\,
      I2 => \rd_ptr_reg_reg[10]_0\(3),
      I3 => \rd_ptr_reg_reg[10]_0\(2),
      I4 => \rd_ptr_reg_reg[10]_0\(1),
      I5 => \rd_ptr_reg_reg[10]_0\(0),
      O => \^d\(2)
    );
\rd_ptr_gray_reg[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"08FBFB0808FB08FB"
    )
        port map (
      I0 => Q(3),
      I1 => mem_read_data_valid_reg,
      I2 => \^mem_reg\,
      I3 => \rd_ptr_reg_reg[10]_0\(4),
      I4 => \rd_ptr_reg_reg[10]_0\(3),
      I5 => \rd_ptr_gray_reg[4]_i_2_n_0\,
      O => \^d\(3)
    );
\rd_ptr_gray_reg[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8BB88B8B8BB88BB8"
    )
        port map (
      I0 => Q(4),
      I1 => \rd_ptr_gray_reg[10]_i_3_n_0\,
      I2 => \rd_ptr_reg_reg[10]_0\(5),
      I3 => \rd_ptr_reg_reg[10]_0\(4),
      I4 => \rd_ptr_gray_reg[4]_i_2_n_0\,
      I5 => \rd_ptr_reg_reg[10]_0\(3),
      O => \^d\(4)
    );
\rd_ptr_gray_reg[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \rd_ptr_reg_reg[10]_0\(0),
      I1 => \rd_ptr_reg_reg[10]_0\(1),
      I2 => \rd_ptr_reg_reg[10]_0\(2),
      O => \rd_ptr_gray_reg[4]_i_2_n_0\
    );
\rd_ptr_gray_reg[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"08FBFB0808FB08FB"
    )
        port map (
      I0 => Q(5),
      I1 => mem_read_data_valid_reg,
      I2 => \^mem_reg\,
      I3 => \rd_ptr_reg_reg[10]_0\(6),
      I4 => \rd_ptr_reg_reg[10]_0\(5),
      I5 => \rd_ptr_gray_reg[5]_i_2_n_0\,
      O => \^d\(5)
    );
\rd_ptr_gray_reg[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => \rd_ptr_reg_reg[10]_0\(3),
      I1 => \rd_ptr_reg_reg[10]_0\(0),
      I2 => \rd_ptr_reg_reg[10]_0\(1),
      I3 => \rd_ptr_reg_reg[10]_0\(2),
      I4 => \rd_ptr_reg_reg[10]_0\(4),
      O => \rd_ptr_gray_reg[5]_i_2_n_0\
    );
\rd_ptr_gray_reg[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3C333C33AAAA3C33"
    )
        port map (
      I0 => Q(6),
      I1 => \rd_ptr_reg_reg[10]_0\(7),
      I2 => \rd_ptr_reg_reg[10]_0\(6),
      I3 => \rd_ptr_gray_reg[7]_i_2_n_0\,
      I4 => mem_read_data_valid_reg,
      I5 => \^mem_reg\,
      O => \^d\(6)
    );
\rd_ptr_gray_reg[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA3C333C3C"
    )
        port map (
      I0 => Q(7),
      I1 => \rd_ptr_reg_reg[10]_0\(8),
      I2 => \rd_ptr_reg_reg[10]_0\(7),
      I3 => \rd_ptr_gray_reg[7]_i_2_n_0\,
      I4 => \rd_ptr_reg_reg[10]_0\(6),
      I5 => \rd_ptr_gray_reg[10]_i_3_n_0\,
      O => \^d\(7)
    );
\rd_ptr_gray_reg[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \rd_ptr_reg_reg[10]_0\(4),
      I1 => \rd_ptr_reg_reg[10]_0\(2),
      I2 => \rd_ptr_reg_reg[10]_0\(1),
      I3 => \rd_ptr_reg_reg[10]_0\(0),
      I4 => \rd_ptr_reg_reg[10]_0\(3),
      I5 => \rd_ptr_reg_reg[10]_0\(5),
      O => \rd_ptr_gray_reg[7]_i_2_n_0\
    );
\rd_ptr_gray_reg[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"08FBFB0808FB08FB"
    )
        port map (
      I0 => Q(8),
      I1 => mem_read_data_valid_reg,
      I2 => \^mem_reg\,
      I3 => \rd_ptr_reg_reg[10]_0\(9),
      I4 => \rd_ptr_reg_reg[10]_0\(8),
      I5 => \rd_ptr_gray_reg[10]_i_2_n_0\,
      O => \^d\(8)
    );
\rd_ptr_gray_reg[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA3333CC3C"
    )
        port map (
      I0 => Q(9),
      I1 => \rd_ptr_reg_reg[10]_0\(10),
      I2 => \rd_ptr_reg_reg[10]_0\(8),
      I3 => \rd_ptr_gray_reg[10]_i_2_n_0\,
      I4 => \rd_ptr_reg_reg[10]_0\(9),
      I5 => \rd_ptr_gray_reg[10]_i_3_n_0\,
      O => \^d\(9)
    );
s00_rst_sync1_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => s00_rst_sync1_reg1,
      I1 => s00_axis_aresetn,
      O => s00_rst_sync1_reg0
    );
s00_rst_sync2_reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => s00_rst_sync1_reg,
      I1 => m00_rst_sync1_reg,
      I2 => s00_axis_aresetn,
      I3 => s00_rst_sync1_reg1,
      O => s00_rst_sync2_reg_reg
    );
s00_rst_sync3_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => dbg_word2_int(11),
      I1 => s00_axis_aresetn,
      I2 => s00_rst_sync1_reg1,
      O => s00_rst_sync3_reg_reg
    );
\slv_reg0[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFBFFFF00080000"
    )
        port map (
      I0 => s00_axi_wdata(0),
      I1 => \slv_reg_wren__0\,
      I2 => axi_awaddr(3),
      I3 => axi_awaddr(2),
      I4 => s00_axi_wstrb(0),
      I5 => s00_rst_sync1_reg1,
      O => \slv_reg0[0]_i_1_n_0\
    );
\slv_reg0[0]_i_2\: unisim.vcomponents.LUT4
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
\slv_reg0_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \slv_reg0[0]_i_1_n_0\,
      Q => s00_rst_sync1_reg1,
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
\wr_addr_reg[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F7FF0800"
    )
        port map (
      I0 => dbg_word2_int(9),
      I1 => dbg_word2_int(8),
      I2 => \^wr_ptr_gray_reg_reg[10]_0\,
      I3 => \^wr_addr_reg_reg[7]\,
      I4 => dbg_word2_int(10),
      O => \^wr_ptr_reg_reg[10]\(8)
    );
\wr_addr_reg[10]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => dbg_word2_int(6),
      I1 => \wr_addr_reg[7]_i_2_n_0\,
      I2 => dbg_word2_int(7),
      O => \^wr_ptr_gray_reg_reg[10]_0\
    );
\wr_addr_reg[10]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAA22AA22AAAAA"
    )
        port map (
      I0 => s00_axis_tvalid,
      I1 => CO(0),
      I2 => \rd_ptr_gray_sync2_reg_reg[10]\(9),
      I3 => \wr_ptr_gray_reg_reg[10]_1\(9),
      I4 => \wr_ptr_gray_reg_reg[10]_1\(10),
      I5 => \rd_ptr_gray_sync2_reg_reg[10]\(10),
      O => \^wr_addr_reg_reg[7]\
    );
\wr_addr_reg[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => dbg_word2_int(1),
      I1 => \^wr_addr_reg_reg[7]\,
      I2 => dbg_word2_int(0),
      O => \^wr_ptr_reg_reg[10]\(0)
    );
\wr_addr_reg[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => dbg_word2_int(1),
      I1 => dbg_word2_int(0),
      I2 => \^wr_addr_reg_reg[7]\,
      I3 => dbg_word2_int(2),
      O => \^wr_ptr_reg_reg[10]\(1)
    );
\wr_addr_reg[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => dbg_word2_int(3),
      I1 => \^wr_addr_reg_reg[7]\,
      I2 => dbg_word2_int(1),
      I3 => dbg_word2_int(0),
      I4 => dbg_word2_int(2),
      O => \^wr_ptr_reg_reg[10]\(2)
    );
\wr_addr_reg[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => dbg_word2_int(4),
      I1 => \^wr_addr_reg_reg[7]\,
      I2 => dbg_word2_int(2),
      I3 => dbg_word2_int(0),
      I4 => dbg_word2_int(1),
      I5 => dbg_word2_int(3),
      O => \^wr_ptr_reg_reg[10]\(3)
    );
\wr_addr_reg[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => dbg_word2_int(5),
      I1 => \wr_addr_reg[5]_i_2_n_0\,
      I2 => \^wr_addr_reg_reg[7]\,
      O => \^wr_ptr_reg_reg[10]\(4)
    );
\wr_addr_reg[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => dbg_word2_int(3),
      I1 => dbg_word2_int(1),
      I2 => dbg_word2_int(0),
      I3 => dbg_word2_int(2),
      I4 => dbg_word2_int(4),
      O => \wr_addr_reg[5]_i_2_n_0\
    );
\wr_addr_reg[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => dbg_word2_int(6),
      I1 => \wr_addr_reg[7]_i_2_n_0\,
      I2 => \^wr_addr_reg_reg[7]\,
      O => \^wr_ptr_reg_reg[10]\(5)
    );
\wr_addr_reg[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B4F0"
    )
        port map (
      I0 => \wr_addr_reg[7]_i_2_n_0\,
      I1 => dbg_word2_int(6),
      I2 => dbg_word2_int(7),
      I3 => \^wr_addr_reg_reg[7]\,
      O => \^wr_ptr_reg_reg[10]\(6)
    );
\wr_addr_reg[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => dbg_word2_int(4),
      I1 => dbg_word2_int(2),
      I2 => dbg_word2_int(0),
      I3 => dbg_word2_int(1),
      I4 => dbg_word2_int(3),
      I5 => dbg_word2_int(5),
      O => \wr_addr_reg[7]_i_2_n_0\
    );
\wr_addr_reg[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => dbg_word2_int(8),
      I1 => \^wr_ptr_gray_reg_reg[10]_0\,
      I2 => \^wr_addr_reg_reg[7]\,
      O => \^wr_ptr_reg_reg[10]\(7)
    );
\wr_ptr_gray_reg[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E2EEEEEE2E222222"
    )
        port map (
      I0 => \wr_ptr_gray_reg_reg[10]_1\(10),
      I1 => \^wr_addr_reg_reg[7]\,
      I2 => \^wr_ptr_gray_reg_reg[10]_0\,
      I3 => dbg_word2_int(8),
      I4 => dbg_word2_int(9),
      I5 => dbg_word2_int(10),
      O => \^wr_ptr_gray_reg_reg[10]\(9)
    );
\wr_ptr_gray_reg[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"333CAAAA"
    )
        port map (
      I0 => \wr_ptr_gray_reg_reg[10]_1\(1),
      I1 => dbg_word2_int(2),
      I2 => dbg_word2_int(1),
      I3 => dbg_word2_int(0),
      I4 => \^wr_addr_reg_reg[7]\,
      O => \^wr_ptr_gray_reg_reg[10]\(0)
    );
\wr_ptr_gray_reg[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"556AFFFF556A0000"
    )
        port map (
      I0 => dbg_word2_int(3),
      I1 => dbg_word2_int(0),
      I2 => dbg_word2_int(1),
      I3 => dbg_word2_int(2),
      I4 => \^wr_addr_reg_reg[7]\,
      I5 => \wr_ptr_gray_reg_reg[10]_1\(2),
      O => \^wr_ptr_gray_reg_reg[10]\(1)
    );
\wr_ptr_gray_reg[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"59FF5900"
    )
        port map (
      I0 => dbg_word2_int(4),
      I1 => \wr_ptr_gray_reg[3]_i_2_n_0\,
      I2 => dbg_word2_int(3),
      I3 => \^wr_addr_reg_reg[7]\,
      I4 => \wr_ptr_gray_reg_reg[10]_1\(3),
      O => \^wr_ptr_gray_reg_reg[10]\(2)
    );
\wr_ptr_gray_reg[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => dbg_word2_int(1),
      I1 => dbg_word2_int(0),
      I2 => dbg_word2_int(2),
      O => \wr_ptr_gray_reg[3]_i_2_n_0\
    );
\wr_ptr_gray_reg[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"65FF6500"
    )
        port map (
      I0 => dbg_word2_int(5),
      I1 => dbg_word2_int(4),
      I2 => \wr_ptr_gray_reg[4]_i_2_n_0\,
      I3 => \^wr_addr_reg_reg[7]\,
      I4 => \wr_ptr_gray_reg_reg[10]_1\(4),
      O => \^wr_ptr_gray_reg_reg[10]\(3)
    );
\wr_ptr_gray_reg[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => dbg_word2_int(2),
      I1 => dbg_word2_int(0),
      I2 => dbg_word2_int(1),
      I3 => dbg_word2_int(3),
      O => \wr_ptr_gray_reg[4]_i_2_n_0\
    );
\wr_ptr_gray_reg[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"65FF6500"
    )
        port map (
      I0 => dbg_word2_int(6),
      I1 => dbg_word2_int(5),
      I2 => \wr_addr_reg[5]_i_2_n_0\,
      I3 => \^wr_addr_reg_reg[7]\,
      I4 => \wr_ptr_gray_reg_reg[10]_1\(5),
      O => \^wr_ptr_gray_reg_reg[10]\(4)
    );
\wr_ptr_gray_reg[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3C33AAAA"
    )
        port map (
      I0 => \wr_ptr_gray_reg_reg[10]_1\(6),
      I1 => dbg_word2_int(7),
      I2 => dbg_word2_int(6),
      I3 => \wr_addr_reg[7]_i_2_n_0\,
      I4 => \^wr_addr_reg_reg[7]\,
      O => \^wr_ptr_gray_reg_reg[10]\(5)
    );
\wr_ptr_gray_reg[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3033CFCCAAAAAAAA"
    )
        port map (
      I0 => \wr_ptr_gray_reg_reg[10]_1\(7),
      I1 => dbg_word2_int(7),
      I2 => \wr_addr_reg[7]_i_2_n_0\,
      I3 => dbg_word2_int(6),
      I4 => dbg_word2_int(8),
      I5 => \^wr_addr_reg_reg[7]\,
      O => \^wr_ptr_gray_reg_reg[10]\(6)
    );
\wr_ptr_gray_reg[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"22E2EE2E"
    )
        port map (
      I0 => \wr_ptr_gray_reg_reg[10]_1\(8),
      I1 => \^wr_addr_reg_reg[7]\,
      I2 => \^wr_ptr_gray_reg_reg[10]_0\,
      I3 => dbg_word2_int(8),
      I4 => dbg_word2_int(9),
      O => \^wr_ptr_gray_reg_reg[10]\(7)
    );
\wr_ptr_gray_reg[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3033CFCCAAAAAAAA"
    )
        port map (
      I0 => \wr_ptr_gray_reg_reg[10]_1\(9),
      I1 => dbg_word2_int(9),
      I2 => \^wr_ptr_gray_reg_reg[10]_0\,
      I3 => dbg_word2_int(8),
      I4 => dbg_word2_int(10),
      I5 => \^wr_addr_reg_reg[7]\,
      O => \^wr_ptr_gray_reg_reg[10]\(8)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_2_TxFIFO_0_axis_stream_fifo_v1_0 is
  port (
    m00_axis_tvalid : out STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 24 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC;
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axis_tlast : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_2_TxFIFO_0_axis_stream_fifo_v1_0 : entity is "axis_stream_fifo_v1_0";
end design_2_TxFIFO_0_axis_stream_fifo_v1_0;

architecture STRUCTURE of design_2_TxFIFO_0_axis_stream_fifo_v1_0 is
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_16 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_19 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_20 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_21 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_22 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_23 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_26 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_27 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_28 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_29 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_30 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_31 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_32 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_33 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_34 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_35 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_36 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_40 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_41 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_46 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_47 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_48 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_49 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_5 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_50 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_51 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_52 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_53 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_54 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_7 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_8 : STD_LOGIC;
  signal axis_stream_fifo_v1_0_S00_AXI_inst_n_9 : STD_LOGIC;
  signal dbg_word1_int : STD_LOGIC_VECTOR ( 24 downto 0 );
  signal dbg_word2_int : STD_LOGIC_VECTOR ( 26 downto 14 );
  signal dbg_word3_int : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal full0 : STD_LOGIC;
  signal full0_carry_n_2 : STD_LOGIC;
  signal full0_carry_n_3 : STD_LOGIC;
  signal \^m00_axis_tvalid\ : STD_LOGIC;
  signal m00_axis_tvalid_reg_i_1_n_0 : STD_LOGIC;
  signal m00_rst_sync1_reg : STD_LOGIC;
  signal m00_rst_sync1_reg0 : STD_LOGIC;
  signal m00_rst_sync2_reg : STD_LOGIC;
  signal m00_rst_sync3_reg : STD_LOGIC;
  signal mem_read_data_valid_reg : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_0_in0_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal p_1_in1_in : STD_LOGIC;
  signal \rd_addr_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal rd_ptr_gray_reg : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal rd_ptr_gray_sync1_reg : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \rd_ptr_gray_sync2_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal \rd_ptr_gray_sync2_reg_reg_n_0_[1]\ : STD_LOGIC;
  signal \rd_ptr_gray_sync2_reg_reg_n_0_[2]\ : STD_LOGIC;
  signal \rd_ptr_gray_sync2_reg_reg_n_0_[3]\ : STD_LOGIC;
  signal \rd_ptr_gray_sync2_reg_reg_n_0_[4]\ : STD_LOGIC;
  signal \rd_ptr_gray_sync2_reg_reg_n_0_[5]\ : STD_LOGIC;
  signal \rd_ptr_gray_sync2_reg_reg_n_0_[6]\ : STD_LOGIC;
  signal \rd_ptr_gray_sync2_reg_reg_n_0_[7]\ : STD_LOGIC;
  signal \rd_ptr_gray_sync2_reg_reg_n_0_[8]\ : STD_LOGIC;
  signal rd_ptr_next : STD_LOGIC_VECTOR ( 10 to 10 );
  signal rd_ptr_next_0 : STD_LOGIC_VECTOR ( 9 downto 1 );
  signal \rd_ptr_reg_reg__0\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal read : STD_LOGIC;
  signal s00_axis_tready01_in : STD_LOGIC;
  signal s00_rst_sync1_reg : STD_LOGIC;
  signal s00_rst_sync1_reg0 : STD_LOGIC;
  signal s00_rst_sync3_reg : STD_LOGIC;
  signal wr_addr_reg : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \wr_addr_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \wr_addr_reg[9]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr_gray_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal \wr_ptr_gray_reg_reg_n_0_[1]\ : STD_LOGIC;
  signal \wr_ptr_gray_reg_reg_n_0_[2]\ : STD_LOGIC;
  signal \wr_ptr_gray_reg_reg_n_0_[3]\ : STD_LOGIC;
  signal \wr_ptr_gray_reg_reg_n_0_[4]\ : STD_LOGIC;
  signal \wr_ptr_gray_reg_reg_n_0_[5]\ : STD_LOGIC;
  signal \wr_ptr_gray_reg_reg_n_0_[6]\ : STD_LOGIC;
  signal \wr_ptr_gray_reg_reg_n_0_[7]\ : STD_LOGIC;
  signal \wr_ptr_gray_reg_reg_n_0_[8]\ : STD_LOGIC;
  signal NLW_full0_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_full0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_mem_reg_CASCADEOUTA_UNCONNECTED : STD_LOGIC;
  signal NLW_mem_reg_CASCADEOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_mem_reg_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_mem_reg_INJECTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_mem_reg_INJECTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_mem_reg_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_mem_reg_DOADO_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_mem_reg_DOPADOP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_mem_reg_DOPBDOP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_mem_reg_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_mem_reg_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of m00_axis_tvalid_reg_i_1 : label is "soft_lutpair15";
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of mem_reg : label is "p1_d32";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of mem_reg : label is "p1_d32";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of mem_reg : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of mem_reg : label is 34816;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of mem_reg : label is "mem";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of mem_reg : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of mem_reg : label is 1023;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of mem_reg : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of mem_reg : label is 32;
  attribute SOFT_HLUTNM of \rd_addr_reg[0]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \wr_addr_reg[0]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \wr_addr_reg[9]_i_1\ : label is "soft_lutpair16";
begin
  m00_axis_tvalid <= \^m00_axis_tvalid\;
axis_stream_fifo_v1_0_S00_AXI_inst: entity work.design_2_TxFIFO_0_axis_stream_fifo_v1_0_S00_AXI
     port map (
      CO(0) => full0,
      D(10) => axis_stream_fifo_v1_0_S00_AXI_inst_n_5,
      D(9) => dbg_word1_int(9),
      D(8) => axis_stream_fifo_v1_0_S00_AXI_inst_n_7,
      D(7) => axis_stream_fifo_v1_0_S00_AXI_inst_n_8,
      D(6) => axis_stream_fifo_v1_0_S00_AXI_inst_n_9,
      D(5 downto 0) => dbg_word1_int(5 downto 0),
      Q(10 downto 0) => rd_ptr_gray_reg(10 downto 0),
      S(2) => axis_stream_fifo_v1_0_S00_AXI_inst_n_48,
      S(1) => axis_stream_fifo_v1_0_S00_AXI_inst_n_49,
      S(0) => axis_stream_fifo_v1_0_S00_AXI_inst_n_50,
      SR(0) => m00_rst_sync3_reg,
      dbg_word1_int(10 downto 0) => dbg_word1_int(24 downto 14),
      dbg_word2_int(11) => dbg_word2_int(26),
      dbg_word2_int(10 downto 0) => dbg_word2_int(24 downto 14),
      m00_axis_aresetn => m00_axis_aresetn,
      m00_axis_tready => m00_axis_tready,
      m00_axis_tvalid_reg_reg => \^m00_axis_tvalid\,
      m00_rst_sync1_reg => m00_rst_sync1_reg,
      m00_rst_sync1_reg0 => m00_rst_sync1_reg0,
      m00_rst_sync2_reg => m00_rst_sync2_reg,
      m00_rst_sync2_reg_reg => axis_stream_fifo_v1_0_S00_AXI_inst_n_54,
      m00_rst_sync3_reg_reg => axis_stream_fifo_v1_0_S00_AXI_inst_n_53,
      mem_read_data_valid_reg => mem_read_data_valid_reg,
      mem_reg => axis_stream_fifo_v1_0_S00_AXI_inst_n_16,
      \rd_ptr_gray_sync2_reg_reg[10]\(10) => p_0_in0_in,
      \rd_ptr_gray_sync2_reg_reg[10]\(9) => p_0_in,
      \rd_ptr_gray_sync2_reg_reg[10]\(8) => \rd_ptr_gray_sync2_reg_reg_n_0_[8]\,
      \rd_ptr_gray_sync2_reg_reg[10]\(7) => \rd_ptr_gray_sync2_reg_reg_n_0_[7]\,
      \rd_ptr_gray_sync2_reg_reg[10]\(6) => \rd_ptr_gray_sync2_reg_reg_n_0_[6]\,
      \rd_ptr_gray_sync2_reg_reg[10]\(5) => \rd_ptr_gray_sync2_reg_reg_n_0_[5]\,
      \rd_ptr_gray_sync2_reg_reg[10]\(4) => \rd_ptr_gray_sync2_reg_reg_n_0_[4]\,
      \rd_ptr_gray_sync2_reg_reg[10]\(3) => \rd_ptr_gray_sync2_reg_reg_n_0_[3]\,
      \rd_ptr_gray_sync2_reg_reg[10]\(2) => \rd_ptr_gray_sync2_reg_reg_n_0_[2]\,
      \rd_ptr_gray_sync2_reg_reg[10]\(1) => \rd_ptr_gray_sync2_reg_reg_n_0_[1]\,
      \rd_ptr_gray_sync2_reg_reg[10]\(0) => \rd_ptr_gray_sync2_reg_reg_n_0_[0]\,
      \rd_ptr_reg_reg[10]\(8) => rd_ptr_next(10),
      \rd_ptr_reg_reg[10]\(7) => rd_ptr_next_0(8),
      \rd_ptr_reg_reg[10]\(6) => axis_stream_fifo_v1_0_S00_AXI_inst_n_19,
      \rd_ptr_reg_reg[10]\(5) => axis_stream_fifo_v1_0_S00_AXI_inst_n_20,
      \rd_ptr_reg_reg[10]\(4) => axis_stream_fifo_v1_0_S00_AXI_inst_n_21,
      \rd_ptr_reg_reg[10]\(3) => axis_stream_fifo_v1_0_S00_AXI_inst_n_22,
      \rd_ptr_reg_reg[10]\(2) => axis_stream_fifo_v1_0_S00_AXI_inst_n_23,
      \rd_ptr_reg_reg[10]\(1 downto 0) => rd_ptr_next_0(2 downto 1),
      \rd_ptr_reg_reg[10]_0\(10 downto 0) => \rd_ptr_reg_reg__0\(10 downto 0),
      \rd_ptr_reg_reg[9]\ => axis_stream_fifo_v1_0_S00_AXI_inst_n_26,
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
      s00_axi_rdata(24 downto 0) => s00_axi_rdata(24 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(0) => s00_axi_wdata(0),
      s00_axi_wready => s00_axi_wready,
      s00_axi_wstrb(0) => s00_axi_wstrb(0),
      s00_axi_wvalid => s00_axi_wvalid,
      s00_axis_aresetn => s00_axis_aresetn,
      s00_axis_tvalid => s00_axis_tvalid,
      s00_rst_sync1_reg => s00_rst_sync1_reg,
      s00_rst_sync1_reg0 => s00_rst_sync1_reg0,
      s00_rst_sync2_reg_reg => axis_stream_fifo_v1_0_S00_AXI_inst_n_52,
      s00_rst_sync3_reg_reg => axis_stream_fifo_v1_0_S00_AXI_inst_n_51,
      s00_rst_sync3_reg_reg_0(0) => s00_rst_sync3_reg,
      \wr_addr_reg_reg[10]\(10 downto 0) => wr_addr_reg(10 downto 0),
      \wr_addr_reg_reg[7]\ => axis_stream_fifo_v1_0_S00_AXI_inst_n_36,
      \wr_ptr_gray_reg_reg[10]\(9 downto 7) => dbg_word3_int(10 downto 8),
      \wr_ptr_gray_reg_reg[10]\(6) => axis_stream_fifo_v1_0_S00_AXI_inst_n_40,
      \wr_ptr_gray_reg_reg[10]\(5) => axis_stream_fifo_v1_0_S00_AXI_inst_n_41,
      \wr_ptr_gray_reg_reg[10]\(4 downto 1) => dbg_word3_int(5 downto 2),
      \wr_ptr_gray_reg_reg[10]\(0) => axis_stream_fifo_v1_0_S00_AXI_inst_n_46,
      \wr_ptr_gray_reg_reg[10]_0\ => axis_stream_fifo_v1_0_S00_AXI_inst_n_47,
      \wr_ptr_gray_reg_reg[10]_1\(10) => p_1_in1_in,
      \wr_ptr_gray_reg_reg[10]_1\(9) => p_1_in,
      \wr_ptr_gray_reg_reg[10]_1\(8) => \wr_ptr_gray_reg_reg_n_0_[8]\,
      \wr_ptr_gray_reg_reg[10]_1\(7) => \wr_ptr_gray_reg_reg_n_0_[7]\,
      \wr_ptr_gray_reg_reg[10]_1\(6) => \wr_ptr_gray_reg_reg_n_0_[6]\,
      \wr_ptr_gray_reg_reg[10]_1\(5) => \wr_ptr_gray_reg_reg_n_0_[5]\,
      \wr_ptr_gray_reg_reg[10]_1\(4) => \wr_ptr_gray_reg_reg_n_0_[4]\,
      \wr_ptr_gray_reg_reg[10]_1\(3) => \wr_ptr_gray_reg_reg_n_0_[3]\,
      \wr_ptr_gray_reg_reg[10]_1\(2) => \wr_ptr_gray_reg_reg_n_0_[2]\,
      \wr_ptr_gray_reg_reg[10]_1\(1) => \wr_ptr_gray_reg_reg_n_0_[1]\,
      \wr_ptr_gray_reg_reg[10]_1\(0) => \wr_ptr_gray_reg_reg_n_0_[0]\,
      \wr_ptr_reg_reg[10]\(8) => axis_stream_fifo_v1_0_S00_AXI_inst_n_27,
      \wr_ptr_reg_reg[10]\(7) => axis_stream_fifo_v1_0_S00_AXI_inst_n_28,
      \wr_ptr_reg_reg[10]\(6) => axis_stream_fifo_v1_0_S00_AXI_inst_n_29,
      \wr_ptr_reg_reg[10]\(5) => axis_stream_fifo_v1_0_S00_AXI_inst_n_30,
      \wr_ptr_reg_reg[10]\(4) => axis_stream_fifo_v1_0_S00_AXI_inst_n_31,
      \wr_ptr_reg_reg[10]\(3) => axis_stream_fifo_v1_0_S00_AXI_inst_n_32,
      \wr_ptr_reg_reg[10]\(2) => axis_stream_fifo_v1_0_S00_AXI_inst_n_33,
      \wr_ptr_reg_reg[10]\(1) => axis_stream_fifo_v1_0_S00_AXI_inst_n_34,
      \wr_ptr_reg_reg[10]\(0) => axis_stream_fifo_v1_0_S00_AXI_inst_n_35
    );
full0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => NLW_full0_carry_CO_UNCONNECTED(3),
      CO(2) => full0,
      CO(1) => full0_carry_n_2,
      CO(0) => full0_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_full0_carry_O_UNCONNECTED(3 downto 0),
      S(3) => '0',
      S(2) => axis_stream_fifo_v1_0_S00_AXI_inst_n_48,
      S(1) => axis_stream_fifo_v1_0_S00_AXI_inst_n_49,
      S(0) => axis_stream_fifo_v1_0_S00_AXI_inst_n_50
    );
m00_axis_tvalid_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => mem_read_data_valid_reg,
      I1 => m00_axis_tready,
      I2 => \^m00_axis_tvalid\,
      O => m00_axis_tvalid_reg_i_1_n_0
    );
m00_axis_tvalid_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => m00_axis_tvalid_reg_i_1_n_0,
      Q => \^m00_axis_tvalid\,
      R => m00_rst_sync3_reg
    );
m00_rst_sync1_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => m00_rst_sync1_reg0,
      Q => m00_rst_sync1_reg,
      R => '0'
    );
m00_rst_sync2_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_54,
      Q => m00_rst_sync2_reg,
      R => '0'
    );
m00_rst_sync3_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_53,
      Q => m00_rst_sync3_reg,
      R => '0'
    );
mem_read_data_valid_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => '1',
      Q => mem_read_data_valid_reg,
      R => m00_rst_sync3_reg
    );
mem_reg: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "NO_CHANGE",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 5) => wr_addr_reg(9 downto 0),
      ADDRARDADDR(4 downto 0) => B"11111",
      ADDRBWRADDR(15) => '1',
      ADDRBWRADDR(14 downto 5) => dbg_word1_int(23 downto 14),
      ADDRBWRADDR(4 downto 0) => B"11111",
      CASCADEINA => '1',
      CASCADEINB => '1',
      CASCADEOUTA => NLW_mem_reg_CASCADEOUTA_UNCONNECTED,
      CASCADEOUTB => NLW_mem_reg_CASCADEOUTB_UNCONNECTED,
      CLKARDCLK => s00_axis_aclk,
      CLKBWRCLK => m00_axis_aclk,
      DBITERR => NLW_mem_reg_DBITERR_UNCONNECTED,
      DIADI(31 downto 0) => s00_axis_tdata(31 downto 0),
      DIBDI(31 downto 0) => B"11111111111111111111111111111111",
      DIPADIP(3 downto 1) => B"000",
      DIPADIP(0) => s00_axis_tlast,
      DIPBDIP(3 downto 0) => B"0001",
      DOADO(31 downto 0) => NLW_mem_reg_DOADO_UNCONNECTED(31 downto 0),
      DOBDO(31 downto 0) => m00_axis_tdata(31 downto 0),
      DOPADOP(3 downto 0) => NLW_mem_reg_DOPADOP_UNCONNECTED(3 downto 0),
      DOPBDOP(3 downto 1) => NLW_mem_reg_DOPBDOP_UNCONNECTED(3 downto 1),
      DOPBDOP(0) => m00_axis_tlast,
      ECCPARITY(7 downto 0) => NLW_mem_reg_ECCPARITY_UNCONNECTED(7 downto 0),
      ENARDEN => s00_axis_tvalid,
      ENBWREN => read,
      INJECTDBITERR => NLW_mem_reg_INJECTDBITERR_UNCONNECTED,
      INJECTSBITERR => NLW_mem_reg_INJECTSBITERR_UNCONNECTED,
      RDADDRECC(8 downto 0) => NLW_mem_reg_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => axis_stream_fifo_v1_0_S00_AXI_inst_n_16,
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_mem_reg_SBITERR_UNCONNECTED,
      WEA(3) => s00_axis_tready01_in,
      WEA(2) => s00_axis_tready01_in,
      WEA(1) => s00_axis_tready01_in,
      WEA(0) => s00_axis_tready01_in,
      WEBWE(7 downto 0) => B"00000000"
    );
mem_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => m00_axis_tready,
      I1 => \^m00_axis_tvalid\,
      I2 => mem_read_data_valid_reg,
      O => read
    );
mem_reg_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFD7D7FF"
    )
        port map (
      I0 => full0,
      I1 => p_0_in,
      I2 => p_1_in,
      I3 => p_1_in1_in,
      I4 => p_0_in0_in,
      O => s00_axis_tready01_in
    );
\rd_addr_reg[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6555"
    )
        port map (
      I0 => \rd_ptr_reg_reg__0\(0),
      I1 => m00_axis_tready,
      I2 => \^m00_axis_tvalid\,
      I3 => mem_read_data_valid_reg,
      O => \rd_addr_reg[0]_i_1_n_0\
    );
\rd_addr_reg[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FFFFFF08000000"
    )
        port map (
      I0 => \rd_ptr_reg_reg__0\(8),
      I1 => \rd_ptr_reg_reg__0\(5),
      I2 => axis_stream_fifo_v1_0_S00_AXI_inst_n_26,
      I3 => \rd_ptr_reg_reg__0\(6),
      I4 => \rd_ptr_reg_reg__0\(7),
      I5 => \rd_ptr_reg_reg__0\(9),
      O => rd_ptr_next_0(9)
    );
\rd_addr_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[0]_i_1_n_0\,
      Q => dbg_word1_int(14),
      R => '0'
    );
\rd_addr_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => rd_ptr_next(10),
      Q => dbg_word1_int(24),
      R => '0'
    );
\rd_addr_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => rd_ptr_next_0(1),
      Q => dbg_word1_int(15),
      R => '0'
    );
\rd_addr_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => rd_ptr_next_0(2),
      Q => dbg_word1_int(16),
      R => '0'
    );
\rd_addr_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_23,
      Q => dbg_word1_int(17),
      R => '0'
    );
\rd_addr_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_22,
      Q => dbg_word1_int(18),
      R => '0'
    );
\rd_addr_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_21,
      Q => dbg_word1_int(19),
      R => '0'
    );
\rd_addr_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_20,
      Q => dbg_word1_int(20),
      R => '0'
    );
\rd_addr_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_19,
      Q => dbg_word1_int(21),
      R => '0'
    );
\rd_addr_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => rd_ptr_next_0(8),
      Q => dbg_word1_int(22),
      R => '0'
    );
\rd_addr_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => rd_ptr_next_0(9),
      Q => dbg_word1_int(23),
      R => '0'
    );
\rd_ptr_gray_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => dbg_word1_int(0),
      Q => rd_ptr_gray_reg(0),
      R => m00_rst_sync3_reg
    );
\rd_ptr_gray_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_5,
      Q => rd_ptr_gray_reg(10),
      R => m00_rst_sync3_reg
    );
\rd_ptr_gray_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => dbg_word1_int(1),
      Q => rd_ptr_gray_reg(1),
      R => m00_rst_sync3_reg
    );
\rd_ptr_gray_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => dbg_word1_int(2),
      Q => rd_ptr_gray_reg(2),
      R => m00_rst_sync3_reg
    );
\rd_ptr_gray_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => dbg_word1_int(3),
      Q => rd_ptr_gray_reg(3),
      R => m00_rst_sync3_reg
    );
\rd_ptr_gray_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => dbg_word1_int(4),
      Q => rd_ptr_gray_reg(4),
      R => m00_rst_sync3_reg
    );
\rd_ptr_gray_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => dbg_word1_int(5),
      Q => rd_ptr_gray_reg(5),
      R => m00_rst_sync3_reg
    );
\rd_ptr_gray_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_9,
      Q => rd_ptr_gray_reg(6),
      R => m00_rst_sync3_reg
    );
\rd_ptr_gray_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_8,
      Q => rd_ptr_gray_reg(7),
      R => m00_rst_sync3_reg
    );
\rd_ptr_gray_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_7,
      Q => rd_ptr_gray_reg(8),
      R => m00_rst_sync3_reg
    );
\rd_ptr_gray_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => dbg_word1_int(9),
      Q => rd_ptr_gray_reg(9),
      R => m00_rst_sync3_reg
    );
\rd_ptr_gray_sync1_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => rd_ptr_gray_reg(0),
      Q => rd_ptr_gray_sync1_reg(0),
      R => s00_rst_sync3_reg
    );
\rd_ptr_gray_sync1_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => rd_ptr_gray_reg(10),
      Q => rd_ptr_gray_sync1_reg(10),
      R => s00_rst_sync3_reg
    );
\rd_ptr_gray_sync1_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => rd_ptr_gray_reg(1),
      Q => rd_ptr_gray_sync1_reg(1),
      R => s00_rst_sync3_reg
    );
\rd_ptr_gray_sync1_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => rd_ptr_gray_reg(2),
      Q => rd_ptr_gray_sync1_reg(2),
      R => s00_rst_sync3_reg
    );
\rd_ptr_gray_sync1_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => rd_ptr_gray_reg(3),
      Q => rd_ptr_gray_sync1_reg(3),
      R => s00_rst_sync3_reg
    );
\rd_ptr_gray_sync1_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => rd_ptr_gray_reg(4),
      Q => rd_ptr_gray_sync1_reg(4),
      R => s00_rst_sync3_reg
    );
\rd_ptr_gray_sync1_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => rd_ptr_gray_reg(5),
      Q => rd_ptr_gray_sync1_reg(5),
      R => s00_rst_sync3_reg
    );
\rd_ptr_gray_sync1_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => rd_ptr_gray_reg(6),
      Q => rd_ptr_gray_sync1_reg(6),
      R => s00_rst_sync3_reg
    );
\rd_ptr_gray_sync1_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => rd_ptr_gray_reg(7),
      Q => rd_ptr_gray_sync1_reg(7),
      R => s00_rst_sync3_reg
    );
\rd_ptr_gray_sync1_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => rd_ptr_gray_reg(8),
      Q => rd_ptr_gray_sync1_reg(8),
      R => s00_rst_sync3_reg
    );
\rd_ptr_gray_sync1_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => rd_ptr_gray_reg(9),
      Q => rd_ptr_gray_sync1_reg(9),
      R => s00_rst_sync3_reg
    );
\rd_ptr_gray_sync2_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => rd_ptr_gray_sync1_reg(0),
      Q => \rd_ptr_gray_sync2_reg_reg_n_0_[0]\,
      R => s00_rst_sync3_reg
    );
\rd_ptr_gray_sync2_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => rd_ptr_gray_sync1_reg(10),
      Q => p_0_in0_in,
      R => s00_rst_sync3_reg
    );
\rd_ptr_gray_sync2_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => rd_ptr_gray_sync1_reg(1),
      Q => \rd_ptr_gray_sync2_reg_reg_n_0_[1]\,
      R => s00_rst_sync3_reg
    );
\rd_ptr_gray_sync2_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => rd_ptr_gray_sync1_reg(2),
      Q => \rd_ptr_gray_sync2_reg_reg_n_0_[2]\,
      R => s00_rst_sync3_reg
    );
\rd_ptr_gray_sync2_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => rd_ptr_gray_sync1_reg(3),
      Q => \rd_ptr_gray_sync2_reg_reg_n_0_[3]\,
      R => s00_rst_sync3_reg
    );
\rd_ptr_gray_sync2_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => rd_ptr_gray_sync1_reg(4),
      Q => \rd_ptr_gray_sync2_reg_reg_n_0_[4]\,
      R => s00_rst_sync3_reg
    );
\rd_ptr_gray_sync2_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => rd_ptr_gray_sync1_reg(5),
      Q => \rd_ptr_gray_sync2_reg_reg_n_0_[5]\,
      R => s00_rst_sync3_reg
    );
\rd_ptr_gray_sync2_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => rd_ptr_gray_sync1_reg(6),
      Q => \rd_ptr_gray_sync2_reg_reg_n_0_[6]\,
      R => s00_rst_sync3_reg
    );
\rd_ptr_gray_sync2_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => rd_ptr_gray_sync1_reg(7),
      Q => \rd_ptr_gray_sync2_reg_reg_n_0_[7]\,
      R => s00_rst_sync3_reg
    );
\rd_ptr_gray_sync2_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => rd_ptr_gray_sync1_reg(8),
      Q => \rd_ptr_gray_sync2_reg_reg_n_0_[8]\,
      R => s00_rst_sync3_reg
    );
\rd_ptr_gray_sync2_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => rd_ptr_gray_sync1_reg(9),
      Q => p_0_in,
      R => s00_rst_sync3_reg
    );
\rd_ptr_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[0]_i_1_n_0\,
      Q => \rd_ptr_reg_reg__0\(0),
      R => m00_rst_sync3_reg
    );
\rd_ptr_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => rd_ptr_next(10),
      Q => \rd_ptr_reg_reg__0\(10),
      R => m00_rst_sync3_reg
    );
\rd_ptr_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => rd_ptr_next_0(1),
      Q => \rd_ptr_reg_reg__0\(1),
      R => m00_rst_sync3_reg
    );
\rd_ptr_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => rd_ptr_next_0(2),
      Q => \rd_ptr_reg_reg__0\(2),
      R => m00_rst_sync3_reg
    );
\rd_ptr_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_23,
      Q => \rd_ptr_reg_reg__0\(3),
      R => m00_rst_sync3_reg
    );
\rd_ptr_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_22,
      Q => \rd_ptr_reg_reg__0\(4),
      R => m00_rst_sync3_reg
    );
\rd_ptr_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_21,
      Q => \rd_ptr_reg_reg__0\(5),
      R => m00_rst_sync3_reg
    );
\rd_ptr_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_20,
      Q => \rd_ptr_reg_reg__0\(6),
      R => m00_rst_sync3_reg
    );
\rd_ptr_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_19,
      Q => \rd_ptr_reg_reg__0\(7),
      R => m00_rst_sync3_reg
    );
\rd_ptr_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => rd_ptr_next_0(8),
      Q => \rd_ptr_reg_reg__0\(8),
      R => m00_rst_sync3_reg
    );
\rd_ptr_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => rd_ptr_next_0(9),
      Q => \rd_ptr_reg_reg__0\(9),
      R => m00_rst_sync3_reg
    );
s00_axis_tready_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555511551155555"
    )
        port map (
      I0 => s00_rst_sync3_reg,
      I1 => full0,
      I2 => p_0_in,
      I3 => p_1_in,
      I4 => p_1_in1_in,
      I5 => p_0_in0_in,
      O => s00_axis_tready
    );
s00_rst_sync1_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => s00_rst_sync1_reg0,
      Q => s00_rst_sync1_reg,
      R => '0'
    );
s00_rst_sync2_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_52,
      Q => dbg_word2_int(26),
      R => '0'
    );
s00_rst_sync3_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_51,
      Q => s00_rst_sync3_reg,
      R => '0'
    );
\wr_addr_reg[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => dbg_word2_int(14),
      I1 => axis_stream_fifo_v1_0_S00_AXI_inst_n_36,
      O => \wr_addr_reg[0]_i_1_n_0\
    );
\wr_addr_reg[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF40"
    )
        port map (
      I0 => axis_stream_fifo_v1_0_S00_AXI_inst_n_47,
      I1 => dbg_word2_int(22),
      I2 => axis_stream_fifo_v1_0_S00_AXI_inst_n_36,
      I3 => dbg_word2_int(23),
      O => \wr_addr_reg[9]_i_1_n_0\
    );
\wr_addr_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \wr_addr_reg[0]_i_1_n_0\,
      Q => wr_addr_reg(0),
      R => '0'
    );
\wr_addr_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_27,
      Q => wr_addr_reg(10),
      R => '0'
    );
\wr_addr_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_35,
      Q => wr_addr_reg(1),
      R => '0'
    );
\wr_addr_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_34,
      Q => wr_addr_reg(2),
      R => '0'
    );
\wr_addr_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_33,
      Q => wr_addr_reg(3),
      R => '0'
    );
\wr_addr_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_32,
      Q => wr_addr_reg(4),
      R => '0'
    );
\wr_addr_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_31,
      Q => wr_addr_reg(5),
      R => '0'
    );
\wr_addr_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_30,
      Q => wr_addr_reg(6),
      R => '0'
    );
\wr_addr_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_29,
      Q => wr_addr_reg(7),
      R => '0'
    );
\wr_addr_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_28,
      Q => wr_addr_reg(8),
      R => '0'
    );
\wr_addr_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \wr_addr_reg[9]_i_1_n_0\,
      Q => wr_addr_reg(9),
      R => '0'
    );
\wr_ptr_gray_reg[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => dbg_word2_int(15),
      I1 => axis_stream_fifo_v1_0_S00_AXI_inst_n_36,
      I2 => \wr_ptr_gray_reg_reg_n_0_[0]\,
      O => dbg_word3_int(0)
    );
\wr_ptr_gray_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => dbg_word3_int(0),
      Q => \wr_ptr_gray_reg_reg_n_0_[0]\,
      R => s00_rst_sync3_reg
    );
\wr_ptr_gray_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => dbg_word3_int(10),
      Q => p_1_in1_in,
      R => s00_rst_sync3_reg
    );
\wr_ptr_gray_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_46,
      Q => \wr_ptr_gray_reg_reg_n_0_[1]\,
      R => s00_rst_sync3_reg
    );
\wr_ptr_gray_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => dbg_word3_int(2),
      Q => \wr_ptr_gray_reg_reg_n_0_[2]\,
      R => s00_rst_sync3_reg
    );
\wr_ptr_gray_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => dbg_word3_int(3),
      Q => \wr_ptr_gray_reg_reg_n_0_[3]\,
      R => s00_rst_sync3_reg
    );
\wr_ptr_gray_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => dbg_word3_int(4),
      Q => \wr_ptr_gray_reg_reg_n_0_[4]\,
      R => s00_rst_sync3_reg
    );
\wr_ptr_gray_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => dbg_word3_int(5),
      Q => \wr_ptr_gray_reg_reg_n_0_[5]\,
      R => s00_rst_sync3_reg
    );
\wr_ptr_gray_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_41,
      Q => \wr_ptr_gray_reg_reg_n_0_[6]\,
      R => s00_rst_sync3_reg
    );
\wr_ptr_gray_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_40,
      Q => \wr_ptr_gray_reg_reg_n_0_[7]\,
      R => s00_rst_sync3_reg
    );
\wr_ptr_gray_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => dbg_word3_int(8),
      Q => \wr_ptr_gray_reg_reg_n_0_[8]\,
      R => s00_rst_sync3_reg
    );
\wr_ptr_gray_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => dbg_word3_int(9),
      Q => p_1_in,
      R => s00_rst_sync3_reg
    );
\wr_ptr_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \wr_addr_reg[0]_i_1_n_0\,
      Q => dbg_word2_int(14),
      R => s00_rst_sync3_reg
    );
\wr_ptr_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_27,
      Q => dbg_word2_int(24),
      R => s00_rst_sync3_reg
    );
\wr_ptr_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_35,
      Q => dbg_word2_int(15),
      R => s00_rst_sync3_reg
    );
\wr_ptr_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_34,
      Q => dbg_word2_int(16),
      R => s00_rst_sync3_reg
    );
\wr_ptr_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_33,
      Q => dbg_word2_int(17),
      R => s00_rst_sync3_reg
    );
\wr_ptr_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_32,
      Q => dbg_word2_int(18),
      R => s00_rst_sync3_reg
    );
\wr_ptr_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_31,
      Q => dbg_word2_int(19),
      R => s00_rst_sync3_reg
    );
\wr_ptr_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_30,
      Q => dbg_word2_int(20),
      R => s00_rst_sync3_reg
    );
\wr_ptr_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_29,
      Q => dbg_word2_int(21),
      R => s00_rst_sync3_reg
    );
\wr_ptr_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => axis_stream_fifo_v1_0_S00_AXI_inst_n_28,
      Q => dbg_word2_int(22),
      R => s00_rst_sync3_reg
    );
\wr_ptr_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \wr_addr_reg[9]_i_1_n_0\,
      Q => dbg_word2_int(23),
      R => s00_rst_sync3_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_2_TxFIFO_0 is
  port (
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
  attribute NotValidForBitStream of design_2_TxFIFO_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_2_TxFIFO_0 : entity is "design_2_TxFIFO_0,axis_stream_fifo_v1_0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_2_TxFIFO_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_2_TxFIFO_0 : entity is "axis_stream_fifo_v1_0,Vivado 2018.2";
end design_2_TxFIFO_0;

architecture STRUCTURE of design_2_TxFIFO_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^s00_axi_rdata\ : STD_LOGIC_VECTOR ( 27 downto 0 );
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
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rdata(31) <= \<const0>\;
  s00_axi_rdata(30) <= \<const0>\;
  s00_axi_rdata(29) <= \<const0>\;
  s00_axi_rdata(28) <= \<const0>\;
  s00_axi_rdata(27 downto 14) <= \^s00_axi_rdata\(27 downto 14);
  s00_axi_rdata(13) <= \<const0>\;
  s00_axi_rdata(12) <= \<const0>\;
  s00_axi_rdata(11) <= \<const0>\;
  s00_axi_rdata(10 downto 0) <= \^s00_axi_rdata\(10 downto 0);
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
  m00_axis_tstrb(0) <= 'Z';
  m00_axis_tstrb(1) <= 'Z';
  m00_axis_tstrb(2) <= 'Z';
  m00_axis_tstrb(3) <= 'Z';
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.design_2_TxFIFO_0_axis_stream_fifo_v1_0
     port map (
      m00_axis_aclk => m00_axis_aclk,
      m00_axis_aresetn => m00_axis_aresetn,
      m00_axis_tdata(31 downto 0) => m00_axis_tdata(31 downto 0),
      m00_axis_tlast => m00_axis_tlast,
      m00_axis_tready => m00_axis_tready,
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
      s00_axi_rdata(24 downto 11) => \^s00_axi_rdata\(27 downto 14),
      s00_axi_rdata(10 downto 0) => \^s00_axi_rdata\(10 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(0) => s00_axi_wdata(0),
      s00_axi_wready => s00_axi_wready,
      s00_axi_wstrb(0) => s00_axi_wstrb(0),
      s00_axi_wvalid => s00_axi_wvalid,
      s00_axis_aclk => s00_axis_aclk,
      s00_axis_aresetn => s00_axis_aresetn,
      s00_axis_tdata(31 downto 0) => s00_axis_tdata(31 downto 0),
      s00_axis_tlast => s00_axis_tlast,
      s00_axis_tready => s00_axis_tready,
      s00_axis_tvalid => s00_axis_tvalid
    );
end STRUCTURE;
