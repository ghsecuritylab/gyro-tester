// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Mon Jun  3 16:48:52 2019
// Host        : LAPTOP-FM91H59Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_2_BiDirChannels_0_0_sim_netlist.v
// Design      : design_2_BiDirChannels_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_BiDirChannels_v1_0
   (MCK_P,
    MCK_N,
    s00_axi_awready,
    s00_axi_wready,
    s00_axi_arready,
    clock_div_4,
    m00_axis_tlast,
    m00_axis_tvalid,
    s00_axi_bvalid,
    s00_axi_rvalid,
    s00_axis_tready,
    HS_Clock,
    HS_DataOut,
    s00_axi_rdata,
    m00_axis_tdata,
    s00_axi_aclk,
    CLK,
    clk0,
    s00_axis_tvalid,
    HS_DataIn,
    s00_axi_aresetn,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_bready,
    s00_axi_arvalid,
    s00_axi_rready,
    s00_axi_awaddr,
    s00_axi_wdata,
    s00_axi_araddr,
    s00_axis_tdata,
    s00_axi_wstrb);
  output MCK_P;
  output MCK_N;
  output s00_axi_awready;
  output s00_axi_wready;
  output s00_axi_arready;
  output clock_div_4;
  output m00_axis_tlast;
  output m00_axis_tvalid;
  output s00_axi_bvalid;
  output s00_axi_rvalid;
  output s00_axis_tready;
  output HS_Clock;
  output HS_DataOut;
  output [31:0]s00_axi_rdata;
  output [31:0]m00_axis_tdata;
  input s00_axi_aclk;
  input CLK;
  input clk0;
  input s00_axis_tvalid;
  input HS_DataIn;
  input s00_axi_aresetn;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input s00_axi_bready;
  input s00_axi_arvalid;
  input s00_axi_rready;
  input [1:0]s00_axi_awaddr;
  input [31:0]s00_axi_wdata;
  input [1:0]s00_axi_araddr;
  input [31:0]s00_axis_tdata;
  input [3:0]s00_axi_wstrb;

  wire BiDirChannels_v1_0_S00_AXI_inst_n_11;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_13;
  wire CLK;
  wire D;
  wire [7:0]\DBG/CNTR0/r_reg_reg__0 ;
  wire [7:0]\DBG/CNTR1/r_reg_reg__0 ;
  wire [7:0]\DBG/CNTR2/r_reg_reg__0 ;
  wire [7:0]\DBG/CNTR3/r_reg_reg__0 ;
  wire HS_Clock;
  wire HS_DataIn;
  wire HS_DataOut;
  wire MCK;
  wire MCK_N;
  wire MCK_P;
  wire clk0;
  wire clock_div_4;
  wire [31:16]data_word_0;
  wire hs_data_in_int;
  wire hs_data_out_int;
  wire [31:0]m00_axis_tdata;
  wire m00_axis_tlast;
  wire m00_axis_tvalid;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [1:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire [31:0]s00_axis_tdata;
  wire s00_axis_tready;
  wire s00_axis_tvalid;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_BiDirChannels_v1_0_S00_AXI BiDirChannels_v1_0_S00_AXI_inst
       (.D(hs_data_in_int),
        .HS_DataIn(HS_DataIn),
        .HS_DataOut(HS_DataOut),
        .Q({data_word_0[31],data_word_0[28],data_word_0[17:16]}),
        .Q_reg({D,BiDirChannels_v1_0_S00_AXI_inst_n_11}),
        .Q_reg_0(BiDirChannels_v1_0_S00_AXI_inst_n_13),
        .hs_data_out_int(hs_data_out_int),
        .\r_reg_reg[7] (\DBG/CNTR3/r_reg_reg__0 ),
        .\r_reg_reg[7]_0 (\DBG/CNTR2/r_reg_reg__0 ),
        .\r_reg_reg[7]_1 (\DBG/CNTR1/r_reg_reg__0 ),
        .\r_reg_reg[7]_2 (\DBG/CNTR0/r_reg_reg__0 ),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arready(s00_axi_arready),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr),
        .s00_axi_awready(s00_axi_awready),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* XILINX_LEGACY_PRIM = "OBUFDS" *) 
  OBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    OBUFDS_inst
       (.I(MCK),
        .O(MCK_P),
        .OB(MCK_N));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_GyroInputOutputSerializer X1
       (.CLK(CLK),
        .D(hs_data_in_int),
        .HS_Clock(HS_Clock),
        .MCK(MCK),
        .Q_reg(clock_div_4),
        .clk0(clk0),
        .hs_data_out_int(hs_data_out_int),
        .m00_axis_tdata(m00_axis_tdata),
        .m00_axis_tlast(m00_axis_tlast),
        .m00_axis_tvalid(m00_axis_tvalid),
        .\r_reg_reg[7] (\DBG/CNTR3/r_reg_reg__0 ),
        .\r_reg_reg[7]_0 (\DBG/CNTR2/r_reg_reg__0 ),
        .\r_reg_reg[7]_1 (\DBG/CNTR1/r_reg_reg__0 ),
        .\r_reg_reg[7]_2 (\DBG/CNTR0/r_reg_reg__0 ),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axis_tdata(s00_axis_tdata),
        .s00_axis_tready(s00_axis_tready),
        .s00_axis_tvalid(s00_axis_tvalid),
        .\slv_reg0_reg[31] (BiDirChannels_v1_0_S00_AXI_inst_n_13),
        .\slv_reg0_reg[31]_0 ({data_word_0[31],data_word_0[28],data_word_0[17:16]}),
        .\slv_reg1_reg[4] ({D,BiDirChannels_v1_0_S00_AXI_inst_n_11}));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_BiDirChannels_v1_0_S00_AXI
   (s00_axi_awready,
    s00_axi_wready,
    s00_axi_arready,
    s00_axi_bvalid,
    s00_axi_rvalid,
    D,
    Q,
    Q_reg,
    HS_DataOut,
    Q_reg_0,
    s00_axi_rdata,
    s00_axi_aclk,
    hs_data_out_int,
    HS_DataIn,
    s00_axi_aresetn,
    \r_reg_reg[7] ,
    \r_reg_reg[7]_0 ,
    \r_reg_reg[7]_1 ,
    \r_reg_reg[7]_2 ,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_bready,
    s00_axi_arvalid,
    s00_axi_rready,
    s00_axi_awaddr,
    s00_axi_wdata,
    s00_axi_araddr,
    s00_axi_wstrb);
  output s00_axi_awready;
  output s00_axi_wready;
  output s00_axi_arready;
  output s00_axi_bvalid;
  output s00_axi_rvalid;
  output [0:0]D;
  output [3:0]Q;
  output [1:0]Q_reg;
  output HS_DataOut;
  output Q_reg_0;
  output [31:0]s00_axi_rdata;
  input s00_axi_aclk;
  input hs_data_out_int;
  input HS_DataIn;
  input s00_axi_aresetn;
  input [7:0]\r_reg_reg[7] ;
  input [7:0]\r_reg_reg[7]_0 ;
  input [7:0]\r_reg_reg[7]_1 ;
  input [7:0]\r_reg_reg[7]_2 ;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input s00_axi_bready;
  input s00_axi_arvalid;
  input s00_axi_rready;
  input [1:0]s00_axi_awaddr;
  input [31:0]s00_axi_wdata;
  input [1:0]s00_axi_araddr;
  input [3:0]s00_axi_wstrb;

  wire [0:0]D;
  wire HS_DataIn;
  wire HS_DataOut;
  wire [3:0]Q;
  wire [1:0]Q_reg;
  wire Q_reg_0;
  wire aw_en_i_1_n_0;
  wire aw_en_reg_n_0;
  wire [3:2]axi_araddr;
  wire \axi_araddr[2]_i_1_n_0 ;
  wire \axi_araddr[3]_i_1_n_0 ;
  wire axi_arready0;
  wire \axi_awaddr[2]_i_1_n_0 ;
  wire \axi_awaddr[3]_i_1_n_0 ;
  wire axi_awready0;
  wire axi_awready_i_1_n_0;
  wire axi_bvalid_i_1_n_0;
  wire axi_rvalid_i_1_n_0;
  wire axi_wready0;
  wire [24:0]data_word_0;
  wire hs_data_out_int;
  wire [1:0]p_0_in;
  wire [28:0]p_1_in;
  wire [7:0]\r_reg_reg[7] ;
  wire [7:0]\r_reg_reg[7]_0 ;
  wire [7:0]\r_reg_reg[7]_1 ;
  wire [7:0]\r_reg_reg[7]_2 ;
  wire [31:0]reg_data_out;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [1:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire \slv_reg0_reg_n_0_[10] ;
  wire \slv_reg0_reg_n_0_[11] ;
  wire \slv_reg0_reg_n_0_[14] ;
  wire \slv_reg0_reg_n_0_[15] ;
  wire \slv_reg0_reg_n_0_[18] ;
  wire \slv_reg0_reg_n_0_[19] ;
  wire \slv_reg0_reg_n_0_[20] ;
  wire \slv_reg0_reg_n_0_[21] ;
  wire \slv_reg0_reg_n_0_[22] ;
  wire \slv_reg0_reg_n_0_[23] ;
  wire \slv_reg0_reg_n_0_[25] ;
  wire \slv_reg0_reg_n_0_[26] ;
  wire \slv_reg0_reg_n_0_[27] ;
  wire \slv_reg0_reg_n_0_[29] ;
  wire \slv_reg0_reg_n_0_[2] ;
  wire \slv_reg0_reg_n_0_[30] ;
  wire \slv_reg0_reg_n_0_[3] ;
  wire \slv_reg0_reg_n_0_[6] ;
  wire \slv_reg0_reg_n_0_[7] ;
  wire \slv_reg0_reg_n_0_[8] ;
  wire \slv_reg0_reg_n_0_[9] ;
  wire \slv_reg1[15]_i_1_n_0 ;
  wire \slv_reg1[23]_i_1_n_0 ;
  wire \slv_reg1[31]_i_1_n_0 ;
  wire \slv_reg1[7]_i_1_n_0 ;
  wire \slv_reg1_reg_n_0_[10] ;
  wire \slv_reg1_reg_n_0_[11] ;
  wire \slv_reg1_reg_n_0_[12] ;
  wire \slv_reg1_reg_n_0_[13] ;
  wire \slv_reg1_reg_n_0_[14] ;
  wire \slv_reg1_reg_n_0_[15] ;
  wire \slv_reg1_reg_n_0_[16] ;
  wire \slv_reg1_reg_n_0_[17] ;
  wire \slv_reg1_reg_n_0_[18] ;
  wire \slv_reg1_reg_n_0_[19] ;
  wire \slv_reg1_reg_n_0_[1] ;
  wire \slv_reg1_reg_n_0_[20] ;
  wire \slv_reg1_reg_n_0_[21] ;
  wire \slv_reg1_reg_n_0_[22] ;
  wire \slv_reg1_reg_n_0_[23] ;
  wire \slv_reg1_reg_n_0_[24] ;
  wire \slv_reg1_reg_n_0_[25] ;
  wire \slv_reg1_reg_n_0_[26] ;
  wire \slv_reg1_reg_n_0_[27] ;
  wire \slv_reg1_reg_n_0_[28] ;
  wire \slv_reg1_reg_n_0_[29] ;
  wire \slv_reg1_reg_n_0_[2] ;
  wire \slv_reg1_reg_n_0_[30] ;
  wire \slv_reg1_reg_n_0_[31] ;
  wire \slv_reg1_reg_n_0_[3] ;
  wire \slv_reg1_reg_n_0_[5] ;
  wire \slv_reg1_reg_n_0_[6] ;
  wire \slv_reg1_reg_n_0_[7] ;
  wire \slv_reg1_reg_n_0_[8] ;
  wire \slv_reg1_reg_n_0_[9] ;
  wire slv_reg_rden__0;
  wire slv_reg_wren__0;

  LUT3 #(
    .INIT(8'h04)) 
    HS_DataOut_INST_0
       (.I0(data_word_0[1]),
        .I1(hs_data_out_int),
        .I2(data_word_0[0]),
        .O(HS_DataOut));
  LUT6 #(
    .INIT(64'hF7FFC4CCC4CCC4CC)) 
    aw_en_i_1
       (.I0(s00_axi_awvalid),
        .I1(aw_en_reg_n_0),
        .I2(s00_axi_awready),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(aw_en_i_1_n_0));
  FDSE aw_en_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(aw_en_i_1_n_0),
        .Q(aw_en_reg_n_0),
        .S(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[2]_i_1 
       (.I0(s00_axi_araddr[0]),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_arready),
        .I3(axi_araddr[2]),
        .O(\axi_araddr[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[3]_i_1 
       (.I0(s00_axi_araddr[1]),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_arready),
        .I3(axi_araddr[3]),
        .O(\axi_araddr[3]_i_1_n_0 ));
  FDRE \axi_araddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[2]_i_1_n_0 ),
        .Q(axi_araddr[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_araddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[3]_i_1_n_0 ),
        .Q(axi_araddr[3]),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1
       (.I0(s00_axi_arvalid),
        .I1(s00_axi_arready),
        .O(axi_arready0));
  FDRE axi_arready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_arready0),
        .Q(s00_axi_arready),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \axi_awaddr[2]_i_1 
       (.I0(s00_axi_awaddr[0]),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_awready),
        .I3(aw_en_reg_n_0),
        .I4(s00_axi_awvalid),
        .I5(p_0_in[0]),
        .O(\axi_awaddr[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \axi_awaddr[3]_i_1 
       (.I0(s00_axi_awaddr[1]),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_awready),
        .I3(aw_en_reg_n_0),
        .I4(s00_axi_awvalid),
        .I5(p_0_in[1]),
        .O(\axi_awaddr[3]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[2]_i_1_n_0 ),
        .Q(p_0_in[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_awaddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[3]_i_1_n_0 ),
        .Q(p_0_in[1]),
        .R(axi_awready_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(s00_axi_aresetn),
        .O(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    axi_awready_i_2
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_awready),
        .I2(aw_en_reg_n_0),
        .I3(s00_axi_awvalid),
        .O(axi_awready0));
  FDRE axi_awready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awready0),
        .Q(s00_axi_awready),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000FFFF80008000)) 
    axi_bvalid_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_awready),
        .I3(s00_axi_wready),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(axi_bvalid_i_1_n_0));
  FDRE axi_bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(s00_axi_bvalid),
        .R(axi_awready_i_1_n_0));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[0]_i_1 
       (.I0(Q_reg[0]),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7] [0]),
        .I3(axi_araddr[3]),
        .I4(data_word_0[0]),
        .O(reg_data_out[0]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[10]_i_1 
       (.I0(\slv_reg1_reg_n_0_[10] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_0 [2]),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[10] ),
        .O(reg_data_out[10]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[11]_i_1 
       (.I0(\slv_reg1_reg_n_0_[11] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_0 [3]),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[11] ),
        .O(reg_data_out[11]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[12]_i_1 
       (.I0(\slv_reg1_reg_n_0_[12] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_0 [4]),
        .I3(axi_araddr[3]),
        .I4(data_word_0[12]),
        .O(reg_data_out[12]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[13]_i_1 
       (.I0(\slv_reg1_reg_n_0_[13] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_0 [5]),
        .I3(axi_araddr[3]),
        .I4(data_word_0[13]),
        .O(reg_data_out[13]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[14]_i_1 
       (.I0(\slv_reg1_reg_n_0_[14] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_0 [6]),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[14] ),
        .O(reg_data_out[14]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[15]_i_1 
       (.I0(\slv_reg1_reg_n_0_[15] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_0 [7]),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[15] ),
        .O(reg_data_out[15]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[16]_i_1 
       (.I0(\slv_reg1_reg_n_0_[16] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_1 [0]),
        .I3(axi_araddr[3]),
        .I4(Q[0]),
        .O(reg_data_out[16]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[17]_i_1 
       (.I0(\slv_reg1_reg_n_0_[17] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_1 [1]),
        .I3(axi_araddr[3]),
        .I4(Q[1]),
        .O(reg_data_out[17]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[18]_i_1 
       (.I0(\slv_reg1_reg_n_0_[18] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_1 [2]),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[18] ),
        .O(reg_data_out[18]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[19]_i_1 
       (.I0(\slv_reg1_reg_n_0_[19] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_1 [3]),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[19] ),
        .O(reg_data_out[19]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[1]_i_1 
       (.I0(\slv_reg1_reg_n_0_[1] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7] [1]),
        .I3(axi_araddr[3]),
        .I4(data_word_0[1]),
        .O(reg_data_out[1]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[20]_i_1 
       (.I0(\slv_reg1_reg_n_0_[20] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_1 [4]),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[20] ),
        .O(reg_data_out[20]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[21]_i_1 
       (.I0(\slv_reg1_reg_n_0_[21] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_1 [5]),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[21] ),
        .O(reg_data_out[21]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[22]_i_1 
       (.I0(\slv_reg1_reg_n_0_[22] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_1 [6]),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[22] ),
        .O(reg_data_out[22]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[23]_i_1 
       (.I0(\slv_reg1_reg_n_0_[23] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_1 [7]),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[23] ),
        .O(reg_data_out[23]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[24]_i_1 
       (.I0(\slv_reg1_reg_n_0_[24] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_2 [0]),
        .I3(axi_araddr[3]),
        .I4(data_word_0[24]),
        .O(reg_data_out[24]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[25]_i_1 
       (.I0(\slv_reg1_reg_n_0_[25] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_2 [1]),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[25] ),
        .O(reg_data_out[25]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[26]_i_1 
       (.I0(\slv_reg1_reg_n_0_[26] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_2 [2]),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[26] ),
        .O(reg_data_out[26]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[27]_i_1 
       (.I0(\slv_reg1_reg_n_0_[27] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_2 [3]),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[27] ),
        .O(reg_data_out[27]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[28]_i_1 
       (.I0(\slv_reg1_reg_n_0_[28] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_2 [4]),
        .I3(axi_araddr[3]),
        .I4(Q[2]),
        .O(reg_data_out[28]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[29]_i_1 
       (.I0(\slv_reg1_reg_n_0_[29] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_2 [5]),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[29] ),
        .O(reg_data_out[29]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[2]_i_1 
       (.I0(\slv_reg1_reg_n_0_[2] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7] [2]),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[2] ),
        .O(reg_data_out[2]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[30]_i_1 
       (.I0(\slv_reg1_reg_n_0_[30] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_2 [6]),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[30] ),
        .O(reg_data_out[30]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[31]_i_1 
       (.I0(\slv_reg1_reg_n_0_[31] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_2 [7]),
        .I3(axi_araddr[3]),
        .I4(Q[3]),
        .O(reg_data_out[31]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[3]_i_1 
       (.I0(\slv_reg1_reg_n_0_[3] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7] [3]),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[3] ),
        .O(reg_data_out[3]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[4]_i_1 
       (.I0(Q_reg[1]),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7] [4]),
        .I3(axi_araddr[3]),
        .I4(data_word_0[4]),
        .O(reg_data_out[4]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[5]_i_1 
       (.I0(\slv_reg1_reg_n_0_[5] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7] [5]),
        .I3(axi_araddr[3]),
        .I4(data_word_0[5]),
        .O(reg_data_out[5]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[6]_i_1 
       (.I0(\slv_reg1_reg_n_0_[6] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7] [6]),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[6] ),
        .O(reg_data_out[6]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[7]_i_1 
       (.I0(\slv_reg1_reg_n_0_[7] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7] [7]),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[7] ),
        .O(reg_data_out[7]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[8]_i_1 
       (.I0(\slv_reg1_reg_n_0_[8] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_0 [0]),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[8] ),
        .O(reg_data_out[8]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[9]_i_1 
       (.I0(\slv_reg1_reg_n_0_[9] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_0 [1]),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[9] ),
        .O(reg_data_out[9]));
  FDRE \axi_rdata_reg[0] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[0]),
        .Q(s00_axi_rdata[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[10] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[10]),
        .Q(s00_axi_rdata[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[11] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[11]),
        .Q(s00_axi_rdata[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[12] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[12]),
        .Q(s00_axi_rdata[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[13] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[13]),
        .Q(s00_axi_rdata[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[14] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[14]),
        .Q(s00_axi_rdata[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[15] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[15]),
        .Q(s00_axi_rdata[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[16] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[16]),
        .Q(s00_axi_rdata[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[17] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[17]),
        .Q(s00_axi_rdata[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[18] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[18]),
        .Q(s00_axi_rdata[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[19] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[19]),
        .Q(s00_axi_rdata[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[1] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[1]),
        .Q(s00_axi_rdata[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[20] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[20]),
        .Q(s00_axi_rdata[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[21] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[21]),
        .Q(s00_axi_rdata[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[22] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[22]),
        .Q(s00_axi_rdata[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[23] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[23]),
        .Q(s00_axi_rdata[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[24] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[24]),
        .Q(s00_axi_rdata[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[25] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[25]),
        .Q(s00_axi_rdata[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[26] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[26]),
        .Q(s00_axi_rdata[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[27] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[27]),
        .Q(s00_axi_rdata[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[28] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[28]),
        .Q(s00_axi_rdata[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[29] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[29]),
        .Q(s00_axi_rdata[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[2] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[2]),
        .Q(s00_axi_rdata[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[30] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[30]),
        .Q(s00_axi_rdata[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[31] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[31]),
        .Q(s00_axi_rdata[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[3] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[3]),
        .Q(s00_axi_rdata[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[4] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[4]),
        .Q(s00_axi_rdata[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[5] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[5]),
        .Q(s00_axi_rdata[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[6] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[6]),
        .Q(s00_axi_rdata[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[7] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[7]),
        .Q(s00_axi_rdata[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[8] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[8]),
        .Q(s00_axi_rdata[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[9] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[9]),
        .Q(s00_axi_rdata[9]),
        .R(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h08F8)) 
    axi_rvalid_i_1
       (.I0(s00_axi_arready),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_rvalid),
        .I3(s00_axi_rready),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(s00_axi_rvalid),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    axi_wready_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_wready),
        .I3(aw_en_reg_n_0),
        .O(axi_wready0));
  FDRE axi_wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_wready0),
        .Q(s00_axi_wready),
        .R(axi_awready_i_1_n_0));
  LUT5 #(
    .INIT(32'h88888B88)) 
    \r_reg[0]_i_1 
       (.I0(hs_data_out_int),
        .I1(data_word_0[24]),
        .I2(data_word_0[4]),
        .I3(HS_DataIn),
        .I4(data_word_0[5]),
        .O(D));
  LUT2 #(
    .INIT(4'hB)) 
    \r_reg[31]_i_1 
       (.I0(Q[3]),
        .I1(s00_axi_aresetn),
        .O(Q_reg_0));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[1]),
        .O(p_1_in[15]));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[2]),
        .O(p_1_in[23]));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[3]),
        .O(p_1_in[28]));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg0[31]_i_2 
       (.I0(s00_axi_wready),
        .I1(s00_axi_awready),
        .I2(s00_axi_awvalid),
        .I3(s00_axi_wvalid),
        .O(slv_reg_wren__0));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[0]),
        .O(p_1_in[0]));
  FDRE \slv_reg0_reg[0] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[0]),
        .D(s00_axi_wdata[0]),
        .Q(data_word_0[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[10] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[10]),
        .Q(\slv_reg0_reg_n_0_[10] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[11] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[11]),
        .Q(\slv_reg0_reg_n_0_[11] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[12] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[12]),
        .Q(data_word_0[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[13] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[13]),
        .Q(data_word_0[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[14] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[14]),
        .Q(\slv_reg0_reg_n_0_[14] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[15] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[15]),
        .Q(\slv_reg0_reg_n_0_[15] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[16] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[16]),
        .Q(Q[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[17] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[17]),
        .Q(Q[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[18] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[18]),
        .Q(\slv_reg0_reg_n_0_[18] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[19] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[19]),
        .Q(\slv_reg0_reg_n_0_[19] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[1] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[0]),
        .D(s00_axi_wdata[1]),
        .Q(data_word_0[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[20] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[20]),
        .Q(\slv_reg0_reg_n_0_[20] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[21] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[21]),
        .Q(\slv_reg0_reg_n_0_[21] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[22] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[22]),
        .Q(\slv_reg0_reg_n_0_[22] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[23] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[23]),
        .Q(\slv_reg0_reg_n_0_[23] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[24] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[28]),
        .D(s00_axi_wdata[24]),
        .Q(data_word_0[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[25] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[28]),
        .D(s00_axi_wdata[25]),
        .Q(\slv_reg0_reg_n_0_[25] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[26] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[28]),
        .D(s00_axi_wdata[26]),
        .Q(\slv_reg0_reg_n_0_[26] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[27] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[28]),
        .D(s00_axi_wdata[27]),
        .Q(\slv_reg0_reg_n_0_[27] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[28] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[28]),
        .D(s00_axi_wdata[28]),
        .Q(Q[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[29] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[28]),
        .D(s00_axi_wdata[29]),
        .Q(\slv_reg0_reg_n_0_[29] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[2] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[0]),
        .D(s00_axi_wdata[2]),
        .Q(\slv_reg0_reg_n_0_[2] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[30] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[28]),
        .D(s00_axi_wdata[30]),
        .Q(\slv_reg0_reg_n_0_[30] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[31] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[28]),
        .D(s00_axi_wdata[31]),
        .Q(Q[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[3] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[0]),
        .D(s00_axi_wdata[3]),
        .Q(\slv_reg0_reg_n_0_[3] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[4] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[0]),
        .D(s00_axi_wdata[4]),
        .Q(data_word_0[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[5] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[0]),
        .D(s00_axi_wdata[5]),
        .Q(data_word_0[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[6] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[0]),
        .D(s00_axi_wdata[6]),
        .Q(\slv_reg0_reg_n_0_[6] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[7] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[0]),
        .D(s00_axi_wdata[7]),
        .Q(\slv_reg0_reg_n_0_[7] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[8] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[8]),
        .Q(\slv_reg0_reg_n_0_[8] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[9] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[9]),
        .Q(\slv_reg0_reg_n_0_[9] ),
        .R(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg1[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[1]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(\slv_reg1[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg1[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[2]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(\slv_reg1[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg1[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[3]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(\slv_reg1[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg1[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[0]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(\slv_reg1[7]_i_1_n_0 ));
  FDRE \slv_reg1_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(Q_reg[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\slv_reg1_reg_n_0_[10] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\slv_reg1_reg_n_0_[11] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\slv_reg1_reg_n_0_[12] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\slv_reg1_reg_n_0_[13] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\slv_reg1_reg_n_0_[14] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\slv_reg1_reg_n_0_[15] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\slv_reg1_reg_n_0_[16] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\slv_reg1_reg_n_0_[17] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\slv_reg1_reg_n_0_[18] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\slv_reg1_reg_n_0_[19] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\slv_reg1_reg_n_0_[1] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\slv_reg1_reg_n_0_[20] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\slv_reg1_reg_n_0_[21] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\slv_reg1_reg_n_0_[22] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\slv_reg1_reg_n_0_[23] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\slv_reg1_reg_n_0_[24] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\slv_reg1_reg_n_0_[25] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\slv_reg1_reg_n_0_[26] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\slv_reg1_reg_n_0_[27] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\slv_reg1_reg_n_0_[28] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\slv_reg1_reg_n_0_[29] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\slv_reg1_reg_n_0_[2] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\slv_reg1_reg_n_0_[30] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\slv_reg1_reg_n_0_[31] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\slv_reg1_reg_n_0_[3] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(Q_reg[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\slv_reg1_reg_n_0_[5] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\slv_reg1_reg_n_0_[6] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\slv_reg1_reg_n_0_[7] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\slv_reg1_reg_n_0_[8] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\slv_reg1_reg_n_0_[9] ),
        .R(axi_awready_i_1_n_0));
  LUT3 #(
    .INIT(8'h20)) 
    slv_reg_rden
       (.I0(s00_axi_arvalid),
        .I1(s00_axi_rvalid),
        .I2(s00_axi_arready),
        .O(slv_reg_rden__0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_GyroChannelDebugger
   (Q,
    \r_reg_reg[7] ,
    \r_reg_reg[7]_0 ,
    \r_reg_reg[7]_1 ,
    Q_reg,
    \slv_reg0_reg[31] ,
    in_next_int,
    CLK,
    out_next_int);
  output [7:0]Q;
  output [7:0]\r_reg_reg[7] ;
  output [7:0]\r_reg_reg[7]_0 ;
  output [7:0]\r_reg_reg[7]_1 ;
  input Q_reg;
  input \slv_reg0_reg[31] ;
  input in_next_int;
  input CLK;
  input out_next_int;

  wire CLK;
  wire [7:0]Q;
  wire Q_reg;
  wire in_next_int;
  wire out_next_int;
  wire [7:0]\r_reg_reg[7] ;
  wire [7:0]\r_reg_reg[7]_0 ;
  wire [7:0]\r_reg_reg[7]_1 ;
  wire \slv_reg0_reg[31] ;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_10 CNTR0
       (.Q(\r_reg_reg[7]_1 ),
        .out_next_int(out_next_int),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_11 CNTR1
       (.CLK(CLK),
        .Q(\r_reg_reg[7]_0 ),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_12 CNTR2
       (.Q(\r_reg_reg[7] ),
        .in_next_int(in_next_int),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_13 CNTR3
       (.Q(Q),
        .Q_reg(Q_reg),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_GyroInputOutputSerializer
   (MCK,
    Q_reg,
    m00_axis_tlast,
    hs_data_out_int,
    m00_axis_tvalid,
    s00_axis_tready,
    HS_Clock,
    \r_reg_reg[7] ,
    \r_reg_reg[7]_0 ,
    \r_reg_reg[7]_1 ,
    \r_reg_reg[7]_2 ,
    m00_axis_tdata,
    \slv_reg0_reg[31] ,
    CLK,
    \slv_reg1_reg[4] ,
    s00_axi_aclk,
    clk0,
    s00_axis_tvalid,
    \slv_reg0_reg[31]_0 ,
    s00_axi_aresetn,
    D,
    s00_axis_tdata);
  output MCK;
  output Q_reg;
  output m00_axis_tlast;
  output hs_data_out_int;
  output m00_axis_tvalid;
  output s00_axis_tready;
  output HS_Clock;
  output [7:0]\r_reg_reg[7] ;
  output [7:0]\r_reg_reg[7]_0 ;
  output [7:0]\r_reg_reg[7]_1 ;
  output [7:0]\r_reg_reg[7]_2 ;
  output [31:0]m00_axis_tdata;
  input \slv_reg0_reg[31] ;
  input CLK;
  input [1:0]\slv_reg1_reg[4] ;
  input s00_axi_aclk;
  input clk0;
  input s00_axis_tvalid;
  input [3:0]\slv_reg0_reg[31]_0 ;
  input s00_axi_aresetn;
  input [0:0]D;
  input [31:0]s00_axis_tdata;

  wire CLK;
  wire [0:0]D;
  wire HS_Clock;
  wire MASK_HSCK_n_0;
  wire MCK;
  wire Q;
  wire Q_reg;
  wire X0_n_10;
  wire X0_n_11;
  wire X0_n_12;
  wire X0_n_13;
  wire X0_n_14;
  wire X0_n_15;
  wire X0_n_16;
  wire X0_n_17;
  wire X0_n_18;
  wire X0_n_19;
  wire X0_n_2;
  wire X0_n_20;
  wire X0_n_21;
  wire X0_n_22;
  wire X0_n_23;
  wire X0_n_24;
  wire X0_n_25;
  wire X0_n_26;
  wire X0_n_27;
  wire X0_n_28;
  wire X0_n_29;
  wire X0_n_3;
  wire X0_n_30;
  wire X0_n_31;
  wire X0_n_32;
  wire X0_n_33;
  wire X0_n_34;
  wire X0_n_35;
  wire X0_n_36;
  wire X0_n_37;
  wire X0_n_38;
  wire X0_n_39;
  wire X0_n_4;
  wire X0_n_40;
  wire X0_n_41;
  wire X0_n_42;
  wire X0_n_43;
  wire X0_n_44;
  wire X0_n_45;
  wire X0_n_46;
  wire X0_n_47;
  wire X0_n_48;
  wire X0_n_49;
  wire X0_n_5;
  wire X0_n_50;
  wire X0_n_51;
  wire X0_n_52;
  wire X0_n_53;
  wire X0_n_54;
  wire X0_n_55;
  wire X0_n_56;
  wire X0_n_57;
  wire X0_n_58;
  wire X0_n_59;
  wire X0_n_6;
  wire X0_n_60;
  wire X0_n_61;
  wire X0_n_62;
  wire X0_n_63;
  wire X0_n_64;
  wire X0_n_65;
  wire X0_n_66;
  wire X0_n_7;
  wire X0_n_8;
  wire X0_n_9;
  wire a;
  wire a_1;
  wire b;
  wire b_0;
  wire clk0;
  wire clock_base;
  wire [31:0]data_out;
  wire hs_data_out_int;
  wire in_next_int;
  wire in_shift_aux;
  wire in_start_stop_int;
  wire last_aux;
  wire [31:0]m00_axis_tdata;
  wire m00_axis_tlast;
  wire m00_axis_tvalid;
  wire outSR_shift;
  wire out_next_int;
  wire out_start_stop_int;
  wire [7:0]\r_reg_reg[7] ;
  wire [7:0]\r_reg_reg[7]_0 ;
  wire [7:0]\r_reg_reg[7]_1 ;
  wire [7:0]\r_reg_reg[7]_2 ;
  wire rx_fifo_last_int;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;
  wire [31:0]s00_axis_tdata;
  wire s00_axis_tready;
  wire s00_axis_tvalid;
  wire \slv_reg0_reg[31] ;
  wire [3:0]\slv_reg0_reg[31]_0 ;
  wire [1:0]\slv_reg1_reg[4] ;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clock_divider_by_2 CLK_DIV2
       (.MCK(MCK),
        .clock_base(clock_base),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clock_divider_by_2_0 CLK_DIV4
       (.CLK(CLK),
        .MCK(MCK),
        .Q_reg(Q_reg),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter3Bits CLk_DIV_CNTR
       (.clock_base(clock_base),
        .s00_axi_aclk(s00_axi_aclk),
        .\slv_reg0_reg[17] (\slv_reg0_reg[31]_0 [1:0]),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_GyroChannelDebugger DBG
       (.CLK(s00_axis_tready),
        .Q(\r_reg_reg[7] ),
        .Q_reg(m00_axis_tvalid),
        .in_next_int(in_next_int),
        .out_next_int(out_next_int),
        .\r_reg_reg[7] (\r_reg_reg[7]_0 ),
        .\r_reg_reg[7]_0 (\r_reg_reg[7]_1 ),
        .\r_reg_reg[7]_1 (\r_reg_reg[7]_2 ),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_inputShiftRegister32Bits IN_SHIFT_REG
       (.CLK(Q),
        .D(D),
        .m00_axis_tdata(m00_axis_tdata),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits LAST_CNTR
       (.Q_reg(m00_axis_tvalid),
        .rx_fifo_last_int(rx_fifo_last_int),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_maskHSCK MASK_HSCK
       (.CLK(Q),
        .Q_reg(MASK_HSCK_n_0),
        .Q_reg_0(Q_reg),
        .a(a),
        .a_0(a_1),
        .b(b),
        .b_1(b_0),
        .in_next_int(in_next_int),
        .in_shift_aux(in_shift_aux),
        .in_start_stop_int(in_start_stop_int),
        .last_aux(last_aux),
        .m00_axis_tvalid(m00_axis_tvalid),
        .out_next_int(out_next_int),
        .out_start_stop_int(out_start_stop_int),
        .s00_axis_tready(s00_axis_tready),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ),
        .\slv_reg1_reg[4] (\slv_reg1_reg[4] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_outputShiftRegister32Bits OUT_SHIFT_REG
       (.hs_data_out_int(hs_data_out_int),
        .outSR_shift(outSR_shift),
        .\slv_reg0_reg[31] (X0_n_34),
        .\slv_reg0_reg[31]_0 (X0_n_2),
        .\slv_reg0_reg[31]_1 (X0_n_66),
        .\slv_reg0_reg[31]_10 (X0_n_7),
        .\slv_reg0_reg[31]_11 (X0_n_61),
        .\slv_reg0_reg[31]_12 (X0_n_8),
        .\slv_reg0_reg[31]_13 (X0_n_60),
        .\slv_reg0_reg[31]_14 (X0_n_9),
        .\slv_reg0_reg[31]_15 (X0_n_59),
        .\slv_reg0_reg[31]_16 (X0_n_10),
        .\slv_reg0_reg[31]_17 (X0_n_58),
        .\slv_reg0_reg[31]_18 (X0_n_11),
        .\slv_reg0_reg[31]_19 (X0_n_57),
        .\slv_reg0_reg[31]_2 (X0_n_3),
        .\slv_reg0_reg[31]_20 (X0_n_12),
        .\slv_reg0_reg[31]_21 (X0_n_56),
        .\slv_reg0_reg[31]_22 (X0_n_13),
        .\slv_reg0_reg[31]_23 (X0_n_55),
        .\slv_reg0_reg[31]_24 (X0_n_14),
        .\slv_reg0_reg[31]_25 (X0_n_54),
        .\slv_reg0_reg[31]_26 (X0_n_15),
        .\slv_reg0_reg[31]_27 (X0_n_53),
        .\slv_reg0_reg[31]_28 (X0_n_16),
        .\slv_reg0_reg[31]_29 (X0_n_52),
        .\slv_reg0_reg[31]_3 (X0_n_65),
        .\slv_reg0_reg[31]_30 (X0_n_17),
        .\slv_reg0_reg[31]_31 (X0_n_51),
        .\slv_reg0_reg[31]_32 (X0_n_18),
        .\slv_reg0_reg[31]_33 (X0_n_50),
        .\slv_reg0_reg[31]_34 (X0_n_19),
        .\slv_reg0_reg[31]_35 (X0_n_49),
        .\slv_reg0_reg[31]_36 (X0_n_20),
        .\slv_reg0_reg[31]_37 (X0_n_48),
        .\slv_reg0_reg[31]_38 (X0_n_21),
        .\slv_reg0_reg[31]_39 (X0_n_47),
        .\slv_reg0_reg[31]_4 (X0_n_4),
        .\slv_reg0_reg[31]_40 (X0_n_22),
        .\slv_reg0_reg[31]_41 (X0_n_46),
        .\slv_reg0_reg[31]_42 (X0_n_23),
        .\slv_reg0_reg[31]_43 (X0_n_45),
        .\slv_reg0_reg[31]_44 (X0_n_24),
        .\slv_reg0_reg[31]_45 (X0_n_44),
        .\slv_reg0_reg[31]_46 (X0_n_25),
        .\slv_reg0_reg[31]_47 (X0_n_43),
        .\slv_reg0_reg[31]_48 (X0_n_26),
        .\slv_reg0_reg[31]_49 (X0_n_42),
        .\slv_reg0_reg[31]_5 (X0_n_64),
        .\slv_reg0_reg[31]_50 (X0_n_27),
        .\slv_reg0_reg[31]_51 (X0_n_41),
        .\slv_reg0_reg[31]_52 (X0_n_28),
        .\slv_reg0_reg[31]_53 (X0_n_40),
        .\slv_reg0_reg[31]_54 (X0_n_29),
        .\slv_reg0_reg[31]_55 (X0_n_39),
        .\slv_reg0_reg[31]_56 (X0_n_30),
        .\slv_reg0_reg[31]_57 (X0_n_38),
        .\slv_reg0_reg[31]_58 (X0_n_31),
        .\slv_reg0_reg[31]_59 (X0_n_37),
        .\slv_reg0_reg[31]_6 (X0_n_5),
        .\slv_reg0_reg[31]_60 (X0_n_32),
        .\slv_reg0_reg[31]_61 (X0_n_36),
        .\slv_reg0_reg[31]_62 (X0_n_33),
        .\slv_reg0_reg[31]_63 (X0_n_35),
        .\slv_reg0_reg[31]_7 (X0_n_63),
        .\slv_reg0_reg[31]_8 (X0_n_6),
        .\slv_reg0_reg[31]_9 (X0_n_62));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_counter48Cycles PULSE_CNTR
       (.CLK(CLK),
        .HS_Clock(HS_Clock),
        .Q_reg(Q_reg),
        .in_shift_aux(in_shift_aux),
        .in_start_stop_int(in_start_stop_int),
        .last_aux(last_aux),
        .outSR_shift(outSR_shift),
        .out_start_stop_int(out_start_stop_int),
        .\slv_reg0_reg[28] (\slv_reg0_reg[31]_0 [2]),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_register_32bits TX_DELAY_REG
       (.Q(data_out),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axis_tdata(s00_axis_tdata),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_syncReady X0
       (.Q(data_out),
        .Q_reg(MASK_HSCK_n_0),
        .a(a),
        .b(b),
        .clk0(clk0),
        .out_next_int(out_next_int),
        .out_start_stop_int(out_start_stop_int),
        .\r_reg_reg[0]_P (X0_n_33),
        .\r_reg_reg[10]_C (X0_n_45),
        .\r_reg_reg[10]_P (X0_n_23),
        .\r_reg_reg[11]_C (X0_n_46),
        .\r_reg_reg[11]_P (X0_n_22),
        .\r_reg_reg[12]_C (X0_n_47),
        .\r_reg_reg[12]_P (X0_n_21),
        .\r_reg_reg[13]_C (X0_n_48),
        .\r_reg_reg[13]_P (X0_n_20),
        .\r_reg_reg[14]_C (X0_n_49),
        .\r_reg_reg[14]_P (X0_n_19),
        .\r_reg_reg[15]_C (X0_n_50),
        .\r_reg_reg[15]_P (X0_n_18),
        .\r_reg_reg[16]_C (X0_n_51),
        .\r_reg_reg[16]_P (X0_n_17),
        .\r_reg_reg[17]_C (X0_n_52),
        .\r_reg_reg[17]_P (X0_n_16),
        .\r_reg_reg[18]_C (X0_n_53),
        .\r_reg_reg[18]_P (X0_n_15),
        .\r_reg_reg[19]_C (X0_n_54),
        .\r_reg_reg[19]_P (X0_n_14),
        .\r_reg_reg[1]_C (X0_n_36),
        .\r_reg_reg[1]_P (X0_n_32),
        .\r_reg_reg[1]_P_0 (X0_n_35),
        .\r_reg_reg[20]_C (X0_n_55),
        .\r_reg_reg[20]_P (X0_n_13),
        .\r_reg_reg[21]_C (X0_n_56),
        .\r_reg_reg[21]_P (X0_n_12),
        .\r_reg_reg[22]_C (X0_n_57),
        .\r_reg_reg[22]_P (X0_n_11),
        .\r_reg_reg[23]_C (X0_n_58),
        .\r_reg_reg[23]_P (X0_n_10),
        .\r_reg_reg[24]_C (X0_n_59),
        .\r_reg_reg[24]_P (X0_n_9),
        .\r_reg_reg[25]_C (X0_n_60),
        .\r_reg_reg[25]_P (X0_n_8),
        .\r_reg_reg[26]_C (X0_n_61),
        .\r_reg_reg[26]_P (X0_n_7),
        .\r_reg_reg[27]_C (X0_n_62),
        .\r_reg_reg[27]_P (X0_n_6),
        .\r_reg_reg[28]_C (X0_n_63),
        .\r_reg_reg[28]_P (X0_n_5),
        .\r_reg_reg[29]_C (X0_n_64),
        .\r_reg_reg[29]_P (X0_n_4),
        .\r_reg_reg[2]_C (X0_n_37),
        .\r_reg_reg[2]_P (X0_n_31),
        .\r_reg_reg[30]_C (X0_n_65),
        .\r_reg_reg[30]_P (X0_n_3),
        .\r_reg_reg[31]_C (X0_n_66),
        .\r_reg_reg[31]_P (X0_n_2),
        .\r_reg_reg[32] (X0_n_34),
        .\r_reg_reg[3]_C (X0_n_38),
        .\r_reg_reg[3]_P (X0_n_30),
        .\r_reg_reg[4]_C (X0_n_39),
        .\r_reg_reg[4]_P (X0_n_29),
        .\r_reg_reg[5]_C (X0_n_40),
        .\r_reg_reg[5]_P (X0_n_28),
        .\r_reg_reg[6]_C (X0_n_41),
        .\r_reg_reg[6]_P (X0_n_27),
        .\r_reg_reg[7]_C (X0_n_42),
        .\r_reg_reg[7]_P (X0_n_26),
        .\r_reg_reg[8]_C (X0_n_43),
        .\r_reg_reg[8]_P (X0_n_25),
        .\r_reg_reg[9]_C (X0_n_44),
        .\r_reg_reg[9]_P (X0_n_24),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axis_tvalid(s00_axis_tvalid),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ),
        .\slv_reg0_reg[31]_0 (\slv_reg0_reg[31]_0 [3]));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_syncReady_1 X1
       (.a(a_1),
        .b(b_0),
        .clk0(clk0),
        .in_next_int(in_next_int),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff X10
       (.m00_axis_tlast(m00_axis_tlast),
        .rx_fifo_last_int(rx_fifo_last_int),
        .s00_axi_aclk(s00_axi_aclk),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clock_divider_by_2
   (MCK,
    clock_base,
    \slv_reg0_reg[31] );
  output MCK;
  input clock_base;
  input \slv_reg0_reg[31] ;

  wire MCK;
  wire clock_base;
  wire \slv_reg0_reg[31] ;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_15 ff0
       (.MCK(MCK),
        .clock_base(clock_base),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
endmodule

(* ORIG_REF_NAME = "clock_divider_by_2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clock_divider_by_2_0
   (Q_reg,
    CLK,
    MCK,
    \slv_reg0_reg[31] );
  output Q_reg;
  input CLK;
  input MCK;
  input \slv_reg0_reg[31] ;

  wire CLK;
  wire MCK;
  wire Q_reg;
  wire \slv_reg0_reg[31] ;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_14 ff0
       (.CLK(CLK),
        .MCK(MCK),
        .Q_reg_0(Q_reg),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_counter48Cycles
   (outSR_shift,
    in_shift_aux,
    HS_Clock,
    last_aux,
    out_start_stop_int,
    Q_reg,
    in_start_stop_int,
    \slv_reg0_reg[28] ,
    CLK,
    \slv_reg0_reg[31] );
  output outSR_shift;
  output in_shift_aux;
  output HS_Clock;
  output last_aux;
  input out_start_stop_int;
  input Q_reg;
  input in_start_stop_int;
  input [0:0]\slv_reg0_reg[28] ;
  input CLK;
  input \slv_reg0_reg[31] ;

  wire CLK;
  wire HS_Clock;
  wire Q_reg;
  wire [5:0]count_pulses;
  wire in_shift_aux;
  wire in_start_stop_int;
  wire last_aux;
  wire outSR_shift;
  wire out_start_stop_int;
  wire \r_reg[0]_i_1__6_n_0 ;
  wire \r_reg[1]_i_1__5_n_0 ;
  wire \r_reg[2]_i_1__5_n_0 ;
  wire \r_reg[3]_i_1__4_n_0 ;
  wire \r_reg[4]_i_1__4_n_0 ;
  wire \r_reg[5]_i_1__4_n_0 ;
  wire [0:0]\slv_reg0_reg[28] ;
  wire \slv_reg0_reg[31] ;

  LUT5 #(
    .INIT(32'hA956AAAA)) 
    HS_Clock_INST_0
       (.I0(\slv_reg0_reg[28] ),
        .I1(count_pulses[5]),
        .I2(count_pulses[3]),
        .I3(count_pulses[4]),
        .I4(Q_reg),
        .O(HS_Clock));
  LUT5 #(
    .INIT(32'h02A80000)) 
    Q_i_1__1
       (.I0(in_start_stop_int),
        .I1(count_pulses[5]),
        .I2(count_pulses[3]),
        .I3(count_pulses[4]),
        .I4(Q_reg),
        .O(in_shift_aux));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    Q_i_1__2
       (.I0(count_pulses[0]),
        .I1(count_pulses[5]),
        .I2(count_pulses[3]),
        .I3(count_pulses[4]),
        .I4(count_pulses[1]),
        .I5(count_pulses[2]),
        .O(last_aux));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \r_reg[0]_i_1__6 
       (.I0(count_pulses[0]),
        .O(\r_reg[0]_i_1__6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \r_reg[1]_i_1__5 
       (.I0(count_pulses[0]),
        .I1(count_pulses[1]),
        .O(\r_reg[1]_i_1__5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hA9)) 
    \r_reg[2]_i_1__5 
       (.I0(count_pulses[2]),
        .I1(count_pulses[0]),
        .I2(count_pulses[1]),
        .O(\r_reg[2]_i_1__5_n_0 ));
  LUT5 #(
    .INIT(32'h02A80000)) 
    \r_reg[32]_i_2 
       (.I0(out_start_stop_int),
        .I1(count_pulses[5]),
        .I2(count_pulses[3]),
        .I3(count_pulses[4]),
        .I4(Q_reg),
        .O(outSR_shift));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hCCC9)) 
    \r_reg[3]_i_1__4 
       (.I0(count_pulses[2]),
        .I1(count_pulses[3]),
        .I2(count_pulses[0]),
        .I3(count_pulses[1]),
        .O(\r_reg[3]_i_1__4_n_0 ));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCCCCC2)) 
    \r_reg[4]_i_1__4 
       (.I0(count_pulses[5]),
        .I1(count_pulses[4]),
        .I2(count_pulses[2]),
        .I3(count_pulses[0]),
        .I4(count_pulses[1]),
        .I5(count_pulses[3]),
        .O(\r_reg[4]_i_1__4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000001)) 
    \r_reg[5]_i_1__4 
       (.I0(count_pulses[2]),
        .I1(count_pulses[3]),
        .I2(count_pulses[0]),
        .I3(count_pulses[1]),
        .I4(count_pulses[4]),
        .I5(count_pulses[5]),
        .O(\r_reg[5]_i_1__4_n_0 ));
  FDCE \r_reg_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg[0]_i_1__6_n_0 ),
        .Q(count_pulses[0]));
  FDCE \r_reg_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg[1]_i_1__5_n_0 ),
        .Q(count_pulses[1]));
  FDCE \r_reg_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg[2]_i_1__5_n_0 ),
        .Q(count_pulses[2]));
  FDCE \r_reg_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg[3]_i_1__4_n_0 ),
        .Q(count_pulses[3]));
  FDCE \r_reg_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg[4]_i_1__4_n_0 ),
        .Q(count_pulses[4]));
  FDCE \r_reg_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg[5]_i_1__4_n_0 ),
        .Q(count_pulses[5]));
endmodule

(* CHECK_LICENSE_TYPE = "design_2_BiDirChannels_0_0,BiDirChannels_v1_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "BiDirChannels_v1_0,Vivado 2018.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (HS_DataIn,
    HS_DataOut,
    HS_Clock,
    MCK_P,
    MCK_N,
    s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready,
    s00_axi_aclk,
    s00_axi_aresetn,
    m00_axis_tdata,
    m00_axis_tstrb,
    m00_axis_tlast,
    m00_axis_tvalid,
    m00_axis_tready,
    m00_axis_aclk,
    m00_axis_aresetn,
    s00_axis_tdata,
    s00_axis_tstrb,
    s00_axis_tlast,
    s00_axis_tvalid,
    s00_axis_tready,
    s00_axis_aclk,
    s00_axis_aresetn);
  input HS_DataIn;
  output HS_DataOut;
  output HS_Clock;
  output MCK_P;
  output MCK_N;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *) input [3:0]s00_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *) input [2:0]s00_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *) input s00_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *) output s00_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *) input [31:0]s00_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *) input [3:0]s00_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *) input s00_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *) output s00_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *) output [1:0]s00_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *) output s00_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *) input s00_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *) input [3:0]s00_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *) input [2:0]s00_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *) input s00_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *) output s00_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *) output [31:0]s00_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *) output [1:0]s00_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *) output s00_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 1e+08, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN design_2_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *) input s00_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN design_2_processing_system7_0_0_FCLK_CLK0" *) input s00_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S00_AXI_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW" *) input s00_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TDATA" *) output [31:0]m00_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TSTRB" *) output [3:0]m00_axis_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TLAST" *) output m00_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TVALID" *) output m00_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN design_2_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef" *) input m00_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 M00_AXIS_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXIS_CLK, ASSOCIATED_BUSIF M00_AXIS, ASSOCIATED_RESET m00_axis_aresetn, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN design_2_processing_system7_0_0_FCLK_CLK0" *) input m00_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 M00_AXIS_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXIS_RST, POLARITY ACTIVE_LOW" *) input m00_axis_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TDATA" *) input [31:0]s00_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TSTRB" *) input [3:0]s00_axis_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TLAST" *) input s00_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TVALID" *) input s00_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN design_2_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef" *) output s00_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S00_AXIS_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXIS_CLK, ASSOCIATED_BUSIF S00_AXIS, ASSOCIATED_RESET s00_axis_aresetn, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN design_2_processing_system7_0_0_FCLK_CLK0" *) input s00_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S00_AXIS_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXIS_RST, POLARITY ACTIVE_LOW" *) input s00_axis_aresetn;

  wire \<const0> ;
  wire \<const1> ;
  wire HS_Clock;
  wire HS_DataIn;
  wire HS_DataOut;
  (* SLEW = "SLOW" *) wire MCK_N;
  (* SLEW = "SLOW" *) wire MCK_P;
  wire Q_reg_i_1_n_0;
  wire \X1/clock_div_4 ;
  wire clk0;
  wire [31:0]m00_axis_tdata;
  wire m00_axis_tlast;
  wire m00_axis_tvalid;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire [31:0]s00_axis_tdata;
  wire s00_axis_tready;
  wire s00_axis_tvalid;

  assign m00_axis_tstrb[3] = \<const1> ;
  assign m00_axis_tstrb[2] = \<const1> ;
  assign m00_axis_tstrb[1] = \<const1> ;
  assign m00_axis_tstrb[0] = \<const1> ;
  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  LUT1 #(
    .INIT(2'h1)) 
    Q_reg_i_1
       (.I0(\X1/clock_div_4 ),
        .O(Q_reg_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    Q_reg_i_2
       (.I0(s00_axi_aclk),
        .O(clk0));
  VCC VCC
       (.P(\<const1> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_BiDirChannels_v1_0 inst
       (.CLK(Q_reg_i_1_n_0),
        .HS_Clock(HS_Clock),
        .HS_DataIn(HS_DataIn),
        .HS_DataOut(HS_DataOut),
        .MCK_N(MCK_N),
        .MCK_P(MCK_P),
        .clk0(clk0),
        .clock_div_4(\X1/clock_div_4 ),
        .m00_axis_tdata(m00_axis_tdata),
        .m00_axis_tlast(m00_axis_tlast),
        .m00_axis_tvalid(m00_axis_tvalid),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr[3:2]),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arready(s00_axi_arready),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr[3:2]),
        .s00_axi_awready(s00_axi_awready),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid),
        .s00_axis_tdata(s00_axis_tdata),
        .s00_axis_tready(s00_axis_tready),
        .s00_axis_tvalid(s00_axis_tvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff
   (m00_axis_tlast,
    rx_fifo_last_int,
    s00_axi_aclk,
    \slv_reg0_reg[31] );
  output m00_axis_tlast;
  input rx_fifo_last_int;
  input s00_axi_aclk;
  input \slv_reg0_reg[31] ;

  wire m00_axis_tlast;
  wire rx_fifo_last_int;
  wire s00_axi_aclk;
  wire \slv_reg0_reg[31] ;

  FDCE Q_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(rx_fifo_last_int),
        .Q(m00_axis_tlast));
endmodule

(* ORIG_REF_NAME = "dff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_14
   (Q_reg_0,
    CLK,
    MCK,
    \slv_reg0_reg[31] );
  output Q_reg_0;
  input CLK;
  input MCK;
  input \slv_reg0_reg[31] ;

  wire CLK;
  wire MCK;
  wire Q_reg_0;
  wire \slv_reg0_reg[31] ;

  FDCE Q_reg
       (.C(MCK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(CLK),
        .Q(Q_reg_0));
endmodule

(* ORIG_REF_NAME = "dff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_15
   (MCK,
    clock_base,
    \slv_reg0_reg[31] );
  output MCK;
  input clock_base;
  input \slv_reg0_reg[31] ;

  wire D0;
  wire MCK;
  wire clock_base;
  wire \slv_reg0_reg[31] ;

  LUT1 #(
    .INIT(2'h1)) 
    Q_i_1__4
       (.I0(MCK),
        .O(D0));
  FDCE Q_reg
       (.C(clock_base),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(D0),
        .Q(MCK));
endmodule

(* ORIG_REF_NAME = "dff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_2
   (a,
    in_next_int,
    clk0,
    \slv_reg0_reg[31] );
  output a;
  input in_next_int;
  input clk0;
  input \slv_reg0_reg[31] ;

  wire a;
  wire clk0;
  wire in_next_int;
  wire \slv_reg0_reg[31] ;

  FDCE Q_reg
       (.C(clk0),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(in_next_int),
        .Q(a));
endmodule

(* ORIG_REF_NAME = "dff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_3
   (b,
    a,
    clk0,
    \slv_reg0_reg[31] );
  output b;
  input a;
  input clk0;
  input \slv_reg0_reg[31] ;

  wire a;
  wire b;
  wire clk0;
  wire \slv_reg0_reg[31] ;

  FDCE Q_reg
       (.C(clk0),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(a),
        .Q(b));
endmodule

(* ORIG_REF_NAME = "dff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_4
   (a,
    out_next_int,
    clk0,
    \slv_reg0_reg[31] );
  output a;
  input out_next_int;
  input clk0;
  input \slv_reg0_reg[31] ;

  wire a;
  wire clk0;
  wire out_next_int;
  wire \slv_reg0_reg[31] ;

  FDCE Q_reg
       (.C(clk0),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(out_next_int),
        .Q(a));
endmodule

(* ORIG_REF_NAME = "dff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_5
   (b,
    \r_reg_reg[31]_P ,
    \r_reg_reg[30]_P ,
    \r_reg_reg[29]_P ,
    \r_reg_reg[28]_P ,
    \r_reg_reg[27]_P ,
    \r_reg_reg[26]_P ,
    \r_reg_reg[25]_P ,
    \r_reg_reg[24]_P ,
    \r_reg_reg[23]_P ,
    \r_reg_reg[22]_P ,
    \r_reg_reg[21]_P ,
    \r_reg_reg[20]_P ,
    \r_reg_reg[19]_P ,
    \r_reg_reg[18]_P ,
    \r_reg_reg[17]_P ,
    \r_reg_reg[16]_P ,
    \r_reg_reg[15]_P ,
    \r_reg_reg[14]_P ,
    \r_reg_reg[13]_P ,
    \r_reg_reg[12]_P ,
    \r_reg_reg[11]_P ,
    \r_reg_reg[10]_P ,
    \r_reg_reg[9]_P ,
    \r_reg_reg[8]_P ,
    \r_reg_reg[7]_P ,
    \r_reg_reg[6]_P ,
    \r_reg_reg[5]_P ,
    \r_reg_reg[4]_P ,
    \r_reg_reg[3]_P ,
    \r_reg_reg[2]_P ,
    \r_reg_reg[1]_P ,
    \r_reg_reg[0]_P ,
    \r_reg_reg[32] ,
    \r_reg_reg[1]_P_0 ,
    \r_reg_reg[1]_C ,
    \r_reg_reg[2]_C ,
    \r_reg_reg[3]_C ,
    \r_reg_reg[4]_C ,
    \r_reg_reg[5]_C ,
    \r_reg_reg[6]_C ,
    \r_reg_reg[7]_C ,
    \r_reg_reg[8]_C ,
    \r_reg_reg[9]_C ,
    \r_reg_reg[10]_C ,
    \r_reg_reg[11]_C ,
    \r_reg_reg[12]_C ,
    \r_reg_reg[13]_C ,
    \r_reg_reg[14]_C ,
    \r_reg_reg[15]_C ,
    \r_reg_reg[16]_C ,
    \r_reg_reg[17]_C ,
    \r_reg_reg[18]_C ,
    \r_reg_reg[19]_C ,
    \r_reg_reg[20]_C ,
    \r_reg_reg[21]_C ,
    \r_reg_reg[22]_C ,
    \r_reg_reg[23]_C ,
    \r_reg_reg[24]_C ,
    \r_reg_reg[25]_C ,
    \r_reg_reg[26]_C ,
    \r_reg_reg[27]_C ,
    \r_reg_reg[28]_C ,
    \r_reg_reg[29]_C ,
    \r_reg_reg[30]_C ,
    \r_reg_reg[31]_C ,
    a,
    clk0,
    \slv_reg0_reg[31] ,
    Q_reg_0,
    out_start_stop_int,
    s00_axis_tvalid,
    \slv_reg0_reg[31]_0 ,
    s00_axi_aresetn,
    Q);
  output b;
  output \r_reg_reg[31]_P ;
  output \r_reg_reg[30]_P ;
  output \r_reg_reg[29]_P ;
  output \r_reg_reg[28]_P ;
  output \r_reg_reg[27]_P ;
  output \r_reg_reg[26]_P ;
  output \r_reg_reg[25]_P ;
  output \r_reg_reg[24]_P ;
  output \r_reg_reg[23]_P ;
  output \r_reg_reg[22]_P ;
  output \r_reg_reg[21]_P ;
  output \r_reg_reg[20]_P ;
  output \r_reg_reg[19]_P ;
  output \r_reg_reg[18]_P ;
  output \r_reg_reg[17]_P ;
  output \r_reg_reg[16]_P ;
  output \r_reg_reg[15]_P ;
  output \r_reg_reg[14]_P ;
  output \r_reg_reg[13]_P ;
  output \r_reg_reg[12]_P ;
  output \r_reg_reg[11]_P ;
  output \r_reg_reg[10]_P ;
  output \r_reg_reg[9]_P ;
  output \r_reg_reg[8]_P ;
  output \r_reg_reg[7]_P ;
  output \r_reg_reg[6]_P ;
  output \r_reg_reg[5]_P ;
  output \r_reg_reg[4]_P ;
  output \r_reg_reg[3]_P ;
  output \r_reg_reg[2]_P ;
  output \r_reg_reg[1]_P ;
  output \r_reg_reg[0]_P ;
  output \r_reg_reg[32] ;
  output \r_reg_reg[1]_P_0 ;
  output \r_reg_reg[1]_C ;
  output \r_reg_reg[2]_C ;
  output \r_reg_reg[3]_C ;
  output \r_reg_reg[4]_C ;
  output \r_reg_reg[5]_C ;
  output \r_reg_reg[6]_C ;
  output \r_reg_reg[7]_C ;
  output \r_reg_reg[8]_C ;
  output \r_reg_reg[9]_C ;
  output \r_reg_reg[10]_C ;
  output \r_reg_reg[11]_C ;
  output \r_reg_reg[12]_C ;
  output \r_reg_reg[13]_C ;
  output \r_reg_reg[14]_C ;
  output \r_reg_reg[15]_C ;
  output \r_reg_reg[16]_C ;
  output \r_reg_reg[17]_C ;
  output \r_reg_reg[18]_C ;
  output \r_reg_reg[19]_C ;
  output \r_reg_reg[20]_C ;
  output \r_reg_reg[21]_C ;
  output \r_reg_reg[22]_C ;
  output \r_reg_reg[23]_C ;
  output \r_reg_reg[24]_C ;
  output \r_reg_reg[25]_C ;
  output \r_reg_reg[26]_C ;
  output \r_reg_reg[27]_C ;
  output \r_reg_reg[28]_C ;
  output \r_reg_reg[29]_C ;
  output \r_reg_reg[30]_C ;
  output \r_reg_reg[31]_C ;
  input a;
  input clk0;
  input \slv_reg0_reg[31] ;
  input Q_reg_0;
  input out_start_stop_int;
  input s00_axis_tvalid;
  input [0:0]\slv_reg0_reg[31]_0 ;
  input s00_axi_aresetn;
  input [31:0]Q;

  wire [31:0]Q;
  wire Q_reg_0;
  wire a;
  wire b;
  wire clk0;
  wire load0__0;
  wire out_start_stop_int;
  wire \r_reg_reg[0]_P ;
  wire \r_reg_reg[10]_C ;
  wire \r_reg_reg[10]_P ;
  wire \r_reg_reg[11]_C ;
  wire \r_reg_reg[11]_P ;
  wire \r_reg_reg[12]_C ;
  wire \r_reg_reg[12]_P ;
  wire \r_reg_reg[13]_C ;
  wire \r_reg_reg[13]_P ;
  wire \r_reg_reg[14]_C ;
  wire \r_reg_reg[14]_P ;
  wire \r_reg_reg[15]_C ;
  wire \r_reg_reg[15]_P ;
  wire \r_reg_reg[16]_C ;
  wire \r_reg_reg[16]_P ;
  wire \r_reg_reg[17]_C ;
  wire \r_reg_reg[17]_P ;
  wire \r_reg_reg[18]_C ;
  wire \r_reg_reg[18]_P ;
  wire \r_reg_reg[19]_C ;
  wire \r_reg_reg[19]_P ;
  wire \r_reg_reg[1]_C ;
  wire \r_reg_reg[1]_P ;
  wire \r_reg_reg[1]_P_0 ;
  wire \r_reg_reg[20]_C ;
  wire \r_reg_reg[20]_P ;
  wire \r_reg_reg[21]_C ;
  wire \r_reg_reg[21]_P ;
  wire \r_reg_reg[22]_C ;
  wire \r_reg_reg[22]_P ;
  wire \r_reg_reg[23]_C ;
  wire \r_reg_reg[23]_P ;
  wire \r_reg_reg[24]_C ;
  wire \r_reg_reg[24]_P ;
  wire \r_reg_reg[25]_C ;
  wire \r_reg_reg[25]_P ;
  wire \r_reg_reg[26]_C ;
  wire \r_reg_reg[26]_P ;
  wire \r_reg_reg[27]_C ;
  wire \r_reg_reg[27]_P ;
  wire \r_reg_reg[28]_C ;
  wire \r_reg_reg[28]_P ;
  wire \r_reg_reg[29]_C ;
  wire \r_reg_reg[29]_P ;
  wire \r_reg_reg[2]_C ;
  wire \r_reg_reg[2]_P ;
  wire \r_reg_reg[30]_C ;
  wire \r_reg_reg[30]_P ;
  wire \r_reg_reg[31]_C ;
  wire \r_reg_reg[31]_P ;
  wire \r_reg_reg[32] ;
  wire \r_reg_reg[3]_C ;
  wire \r_reg_reg[3]_P ;
  wire \r_reg_reg[4]_C ;
  wire \r_reg_reg[4]_P ;
  wire \r_reg_reg[5]_C ;
  wire \r_reg_reg[5]_P ;
  wire \r_reg_reg[6]_C ;
  wire \r_reg_reg[6]_P ;
  wire \r_reg_reg[7]_C ;
  wire \r_reg_reg[7]_P ;
  wire \r_reg_reg[8]_C ;
  wire \r_reg_reg[8]_P ;
  wire \r_reg_reg[9]_C ;
  wire \r_reg_reg[9]_P ;
  wire s00_axi_aresetn;
  wire s00_axis_tvalid;
  wire \slv_reg0_reg[31] ;
  wire [0:0]\slv_reg0_reg[31]_0 ;

  FDCE Q_reg
       (.C(clk0),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(a),
        .Q(b));
  LUT3 #(
    .INIT(8'hEF)) 
    \r_reg[32]_i_3 
       (.I0(load0__0),
        .I1(\slv_reg0_reg[31]_0 ),
        .I2(s00_axi_aresetn),
        .O(\r_reg_reg[32] ));
  LUT5 #(
    .INIT(32'h60000000)) 
    \r_reg[32]_i_4 
       (.I0(b),
        .I1(a),
        .I2(Q_reg_0),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .O(load0__0));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[0]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[0]),
        .O(\r_reg_reg[0]_P ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[0]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[0]),
        .O(\r_reg_reg[1]_P_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[10]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[10]),
        .O(\r_reg_reg[10]_P ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[10]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[10]),
        .O(\r_reg_reg[10]_C ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[11]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[11]),
        .O(\r_reg_reg[11]_P ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[11]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[11]),
        .O(\r_reg_reg[11]_C ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[12]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[12]),
        .O(\r_reg_reg[12]_P ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[12]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[12]),
        .O(\r_reg_reg[12]_C ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[13]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[13]),
        .O(\r_reg_reg[13]_P ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[13]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[13]),
        .O(\r_reg_reg[13]_C ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[14]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[14]),
        .O(\r_reg_reg[14]_P ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[14]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[14]),
        .O(\r_reg_reg[14]_C ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[15]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[15]),
        .O(\r_reg_reg[15]_P ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[15]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[15]),
        .O(\r_reg_reg[15]_C ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[16]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[16]),
        .O(\r_reg_reg[16]_P ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[16]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[16]),
        .O(\r_reg_reg[16]_C ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[17]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[17]),
        .O(\r_reg_reg[17]_P ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[17]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[17]),
        .O(\r_reg_reg[17]_C ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[18]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[18]),
        .O(\r_reg_reg[18]_P ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[18]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[18]),
        .O(\r_reg_reg[18]_C ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[19]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[19]),
        .O(\r_reg_reg[19]_P ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[19]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[19]),
        .O(\r_reg_reg[19]_C ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[1]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[1]),
        .O(\r_reg_reg[1]_P ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[1]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[1]),
        .O(\r_reg_reg[1]_C ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[20]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[20]),
        .O(\r_reg_reg[20]_P ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[20]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[20]),
        .O(\r_reg_reg[20]_C ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[21]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[21]),
        .O(\r_reg_reg[21]_P ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[21]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[21]),
        .O(\r_reg_reg[21]_C ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[22]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[22]),
        .O(\r_reg_reg[22]_P ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[22]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[22]),
        .O(\r_reg_reg[22]_C ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[23]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[23]),
        .O(\r_reg_reg[23]_P ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[23]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[23]),
        .O(\r_reg_reg[23]_C ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[24]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[24]),
        .O(\r_reg_reg[24]_P ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[24]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[24]),
        .O(\r_reg_reg[24]_C ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[25]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[25]),
        .O(\r_reg_reg[25]_P ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[25]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[25]),
        .O(\r_reg_reg[25]_C ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[26]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[26]),
        .O(\r_reg_reg[26]_P ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[26]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[26]),
        .O(\r_reg_reg[26]_C ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[27]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[27]),
        .O(\r_reg_reg[27]_P ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[27]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[27]),
        .O(\r_reg_reg[27]_C ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[28]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[28]),
        .O(\r_reg_reg[28]_P ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[28]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[28]),
        .O(\r_reg_reg[28]_C ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[29]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[29]),
        .O(\r_reg_reg[29]_P ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[29]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[29]),
        .O(\r_reg_reg[29]_C ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[2]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[2]),
        .O(\r_reg_reg[2]_P ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[2]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[2]),
        .O(\r_reg_reg[2]_C ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[30]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[30]),
        .O(\r_reg_reg[30]_P ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[30]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[30]),
        .O(\r_reg_reg[30]_C ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[31]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[31]),
        .O(\r_reg_reg[31]_P ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[31]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[31]),
        .O(\r_reg_reg[31]_C ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[3]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[3]),
        .O(\r_reg_reg[3]_P ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[3]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[3]),
        .O(\r_reg_reg[3]_C ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[4]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[4]),
        .O(\r_reg_reg[4]_P ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[4]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[4]),
        .O(\r_reg_reg[4]_C ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[5]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[5]),
        .O(\r_reg_reg[5]_P ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[5]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[5]),
        .O(\r_reg_reg[5]_C ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[6]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[6]),
        .O(\r_reg_reg[6]_P ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[6]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[6]),
        .O(\r_reg_reg[6]_C ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[7]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[7]),
        .O(\r_reg_reg[7]_P ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[7]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[7]),
        .O(\r_reg_reg[7]_C ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[8]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[8]),
        .O(\r_reg_reg[8]_P ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[8]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[8]),
        .O(\r_reg_reg[8]_C ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r_reg_reg[9]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[9]),
        .O(\r_reg_reg[9]_P ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \r_reg_reg[9]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(s00_axi_aresetn),
        .I2(load0__0),
        .I3(Q[9]),
        .O(\r_reg_reg[9]_C ));
endmodule

(* ORIG_REF_NAME = "dff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_6
   (in_start_stop_int,
    m00_axis_tvalid,
    \slv_reg1_reg[4] ,
    Q_reg_0,
    \slv_reg0_reg[31] ,
    a_0,
    b_1);
  output in_start_stop_int;
  output m00_axis_tvalid;
  input [0:0]\slv_reg1_reg[4] ;
  input Q_reg_0;
  input \slv_reg0_reg[31] ;
  input a_0;
  input b_1;

  wire Q_reg_0;
  wire a_0;
  wire b_1;
  wire in_start_stop_int;
  wire m00_axis_tvalid;
  wire \slv_reg0_reg[31] ;
  wire [0:0]\slv_reg1_reg[4] ;

  FDCE Q_reg
       (.C(Q_reg_0),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\slv_reg1_reg[4] ),
        .Q(in_start_stop_int));
  LUT4 #(
    .INIT(16'h0880)) 
    m00_axis_tvalid_INST_0
       (.I0(in_start_stop_int),
        .I1(Q_reg_0),
        .I2(a_0),
        .I3(b_1),
        .O(m00_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "dff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_7
   (out_start_stop_int,
    s00_axis_tready,
    \slv_reg1_reg[0] ,
    Q_reg_0,
    \slv_reg0_reg[31] ,
    a,
    b);
  output out_start_stop_int;
  output s00_axis_tready;
  input [0:0]\slv_reg1_reg[0] ;
  input Q_reg_0;
  input \slv_reg0_reg[31] ;
  input a;
  input b;

  wire Q_reg_0;
  wire a;
  wire b;
  wire out_start_stop_int;
  wire s00_axis_tready;
  wire \slv_reg0_reg[31] ;
  wire [0:0]\slv_reg1_reg[0] ;

  FDCE Q_reg
       (.C(Q_reg_0),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\slv_reg1_reg[0] ),
        .Q(out_start_stop_int));
  LUT4 #(
    .INIT(16'h0880)) 
    s00_axis_tready_INST_0
       (.I0(out_start_stop_int),
        .I1(Q_reg_0),
        .I2(a),
        .I3(b),
        .O(s00_axis_tready));
endmodule

(* ORIG_REF_NAME = "dff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_8
   (CLK,
    in_shift_aux,
    Q_reg_0,
    \slv_reg0_reg[31] );
  output CLK;
  input in_shift_aux;
  input Q_reg_0;
  input \slv_reg0_reg[31] ;

  wire CLK;
  wire Q_reg_0;
  wire in_shift_aux;
  wire \slv_reg0_reg[31] ;

  FDCE Q_reg
       (.C(Q_reg_0),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(in_shift_aux),
        .Q(CLK));
endmodule

(* ORIG_REF_NAME = "dff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_9
   (Q_reg_0,
    out_next_int,
    in_next_int,
    last_aux,
    Q_reg_1,
    \slv_reg0_reg[31] ,
    out_start_stop_int,
    in_start_stop_int);
  output Q_reg_0;
  output out_next_int;
  output in_next_int;
  input last_aux;
  input Q_reg_1;
  input \slv_reg0_reg[31] ;
  input out_start_stop_int;
  input in_start_stop_int;

  wire Q_reg_0;
  wire Q_reg_1;
  wire in_next_int;
  wire in_start_stop_int;
  wire last_aux;
  wire out_next_int;
  wire out_start_stop_int;
  wire \slv_reg0_reg[31] ;

  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    Q_i_1
       (.I0(Q_reg_0),
        .I1(out_start_stop_int),
        .O(out_next_int));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    Q_i_1__0
       (.I0(Q_reg_0),
        .I1(in_start_stop_int),
        .O(in_next_int));
  FDCE Q_reg
       (.C(Q_reg_1),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(last_aux),
        .Q(Q_reg_0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_inputShiftRegister32Bits
   (m00_axis_tdata,
    CLK,
    \slv_reg0_reg[31] ,
    D);
  output [31:0]m00_axis_tdata;
  input CLK;
  input \slv_reg0_reg[31] ;
  input [0:0]D;

  wire CLK;
  wire [0:0]D;
  wire [31:0]m00_axis_tdata;
  wire \slv_reg0_reg[31] ;

  FDCE \r_reg_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(D),
        .Q(m00_axis_tdata[0]));
  FDCE \r_reg_reg[10] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[9]),
        .Q(m00_axis_tdata[10]));
  FDCE \r_reg_reg[11] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[10]),
        .Q(m00_axis_tdata[11]));
  FDCE \r_reg_reg[12] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[11]),
        .Q(m00_axis_tdata[12]));
  FDCE \r_reg_reg[13] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[12]),
        .Q(m00_axis_tdata[13]));
  FDCE \r_reg_reg[14] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[13]),
        .Q(m00_axis_tdata[14]));
  FDCE \r_reg_reg[15] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[14]),
        .Q(m00_axis_tdata[15]));
  FDCE \r_reg_reg[16] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[15]),
        .Q(m00_axis_tdata[16]));
  FDCE \r_reg_reg[17] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[16]),
        .Q(m00_axis_tdata[17]));
  FDCE \r_reg_reg[18] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[17]),
        .Q(m00_axis_tdata[18]));
  FDCE \r_reg_reg[19] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[18]),
        .Q(m00_axis_tdata[19]));
  FDCE \r_reg_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[0]),
        .Q(m00_axis_tdata[1]));
  FDCE \r_reg_reg[20] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[19]),
        .Q(m00_axis_tdata[20]));
  FDCE \r_reg_reg[21] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[20]),
        .Q(m00_axis_tdata[21]));
  FDCE \r_reg_reg[22] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[21]),
        .Q(m00_axis_tdata[22]));
  FDCE \r_reg_reg[23] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[22]),
        .Q(m00_axis_tdata[23]));
  FDCE \r_reg_reg[24] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[23]),
        .Q(m00_axis_tdata[24]));
  FDCE \r_reg_reg[25] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[24]),
        .Q(m00_axis_tdata[25]));
  FDCE \r_reg_reg[26] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[25]),
        .Q(m00_axis_tdata[26]));
  FDCE \r_reg_reg[27] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[26]),
        .Q(m00_axis_tdata[27]));
  FDCE \r_reg_reg[28] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[27]),
        .Q(m00_axis_tdata[28]));
  FDCE \r_reg_reg[29] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[28]),
        .Q(m00_axis_tdata[29]));
  FDCE \r_reg_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[1]),
        .Q(m00_axis_tdata[2]));
  FDCE \r_reg_reg[30] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[29]),
        .Q(m00_axis_tdata[30]));
  FDCE \r_reg_reg[31] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[30]),
        .Q(m00_axis_tdata[31]));
  FDCE \r_reg_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[2]),
        .Q(m00_axis_tdata[3]));
  FDCE \r_reg_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[3]),
        .Q(m00_axis_tdata[4]));
  FDCE \r_reg_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[4]),
        .Q(m00_axis_tdata[5]));
  FDCE \r_reg_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[5]),
        .Q(m00_axis_tdata[6]));
  FDCE \r_reg_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[6]),
        .Q(m00_axis_tdata[7]));
  FDCE \r_reg_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[7]),
        .Q(m00_axis_tdata[8]));
  FDCE \r_reg_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[8]),
        .Q(m00_axis_tdata[9]));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_maskHSCK
   (Q_reg,
    in_start_stop_int,
    out_start_stop_int,
    CLK,
    s00_axis_tready,
    out_next_int,
    m00_axis_tvalid,
    in_next_int,
    last_aux,
    Q_reg_0,
    \slv_reg0_reg[31] ,
    \slv_reg1_reg[4] ,
    in_shift_aux,
    a,
    b,
    a_0,
    b_1);
  output Q_reg;
  output in_start_stop_int;
  output out_start_stop_int;
  output CLK;
  output s00_axis_tready;
  output out_next_int;
  output m00_axis_tvalid;
  output in_next_int;
  input last_aux;
  input Q_reg_0;
  input \slv_reg0_reg[31] ;
  input [1:0]\slv_reg1_reg[4] ;
  input in_shift_aux;
  input a;
  input b;
  input a_0;
  input b_1;

  wire CLK;
  wire Q_reg;
  wire Q_reg_0;
  wire a;
  wire a_0;
  wire b;
  wire b_1;
  wire in_next_int;
  wire in_shift_aux;
  wire in_start_stop_int;
  wire last_aux;
  wire m00_axis_tvalid;
  wire out_next_int;
  wire out_start_stop_int;
  wire s00_axis_tready;
  wire \slv_reg0_reg[31] ;
  wire [1:0]\slv_reg1_reg[4] ;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_6 ff0
       (.Q_reg_0(Q_reg),
        .a_0(a_0),
        .b_1(b_1),
        .in_start_stop_int(in_start_stop_int),
        .m00_axis_tvalid(m00_axis_tvalid),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ),
        .\slv_reg1_reg[4] (\slv_reg1_reg[4] [1]));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_7 ff1
       (.Q_reg_0(Q_reg),
        .a(a),
        .b(b),
        .out_start_stop_int(out_start_stop_int),
        .s00_axis_tready(s00_axis_tready),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ),
        .\slv_reg1_reg[0] (\slv_reg1_reg[4] [0]));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_8 ff2
       (.CLK(CLK),
        .Q_reg_0(Q_reg_0),
        .in_shift_aux(in_shift_aux),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_9 ff3
       (.Q_reg_0(Q_reg),
        .Q_reg_1(Q_reg_0),
        .in_next_int(in_next_int),
        .in_start_stop_int(in_start_stop_int),
        .last_aux(last_aux),
        .out_next_int(out_next_int),
        .out_start_stop_int(out_start_stop_int),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_outputShiftRegister32Bits
   (hs_data_out_int,
    outSR_shift,
    \slv_reg0_reg[31] ,
    \slv_reg0_reg[31]_0 ,
    \slv_reg0_reg[31]_1 ,
    \slv_reg0_reg[31]_2 ,
    \slv_reg0_reg[31]_3 ,
    \slv_reg0_reg[31]_4 ,
    \slv_reg0_reg[31]_5 ,
    \slv_reg0_reg[31]_6 ,
    \slv_reg0_reg[31]_7 ,
    \slv_reg0_reg[31]_8 ,
    \slv_reg0_reg[31]_9 ,
    \slv_reg0_reg[31]_10 ,
    \slv_reg0_reg[31]_11 ,
    \slv_reg0_reg[31]_12 ,
    \slv_reg0_reg[31]_13 ,
    \slv_reg0_reg[31]_14 ,
    \slv_reg0_reg[31]_15 ,
    \slv_reg0_reg[31]_16 ,
    \slv_reg0_reg[31]_17 ,
    \slv_reg0_reg[31]_18 ,
    \slv_reg0_reg[31]_19 ,
    \slv_reg0_reg[31]_20 ,
    \slv_reg0_reg[31]_21 ,
    \slv_reg0_reg[31]_22 ,
    \slv_reg0_reg[31]_23 ,
    \slv_reg0_reg[31]_24 ,
    \slv_reg0_reg[31]_25 ,
    \slv_reg0_reg[31]_26 ,
    \slv_reg0_reg[31]_27 ,
    \slv_reg0_reg[31]_28 ,
    \slv_reg0_reg[31]_29 ,
    \slv_reg0_reg[31]_30 ,
    \slv_reg0_reg[31]_31 ,
    \slv_reg0_reg[31]_32 ,
    \slv_reg0_reg[31]_33 ,
    \slv_reg0_reg[31]_34 ,
    \slv_reg0_reg[31]_35 ,
    \slv_reg0_reg[31]_36 ,
    \slv_reg0_reg[31]_37 ,
    \slv_reg0_reg[31]_38 ,
    \slv_reg0_reg[31]_39 ,
    \slv_reg0_reg[31]_40 ,
    \slv_reg0_reg[31]_41 ,
    \slv_reg0_reg[31]_42 ,
    \slv_reg0_reg[31]_43 ,
    \slv_reg0_reg[31]_44 ,
    \slv_reg0_reg[31]_45 ,
    \slv_reg0_reg[31]_46 ,
    \slv_reg0_reg[31]_47 ,
    \slv_reg0_reg[31]_48 ,
    \slv_reg0_reg[31]_49 ,
    \slv_reg0_reg[31]_50 ,
    \slv_reg0_reg[31]_51 ,
    \slv_reg0_reg[31]_52 ,
    \slv_reg0_reg[31]_53 ,
    \slv_reg0_reg[31]_54 ,
    \slv_reg0_reg[31]_55 ,
    \slv_reg0_reg[31]_56 ,
    \slv_reg0_reg[31]_57 ,
    \slv_reg0_reg[31]_58 ,
    \slv_reg0_reg[31]_59 ,
    \slv_reg0_reg[31]_60 ,
    \slv_reg0_reg[31]_61 ,
    \slv_reg0_reg[31]_62 ,
    \slv_reg0_reg[31]_63 );
  output hs_data_out_int;
  input outSR_shift;
  input \slv_reg0_reg[31] ;
  input \slv_reg0_reg[31]_0 ;
  input \slv_reg0_reg[31]_1 ;
  input \slv_reg0_reg[31]_2 ;
  input \slv_reg0_reg[31]_3 ;
  input \slv_reg0_reg[31]_4 ;
  input \slv_reg0_reg[31]_5 ;
  input \slv_reg0_reg[31]_6 ;
  input \slv_reg0_reg[31]_7 ;
  input \slv_reg0_reg[31]_8 ;
  input \slv_reg0_reg[31]_9 ;
  input \slv_reg0_reg[31]_10 ;
  input \slv_reg0_reg[31]_11 ;
  input \slv_reg0_reg[31]_12 ;
  input \slv_reg0_reg[31]_13 ;
  input \slv_reg0_reg[31]_14 ;
  input \slv_reg0_reg[31]_15 ;
  input \slv_reg0_reg[31]_16 ;
  input \slv_reg0_reg[31]_17 ;
  input \slv_reg0_reg[31]_18 ;
  input \slv_reg0_reg[31]_19 ;
  input \slv_reg0_reg[31]_20 ;
  input \slv_reg0_reg[31]_21 ;
  input \slv_reg0_reg[31]_22 ;
  input \slv_reg0_reg[31]_23 ;
  input \slv_reg0_reg[31]_24 ;
  input \slv_reg0_reg[31]_25 ;
  input \slv_reg0_reg[31]_26 ;
  input \slv_reg0_reg[31]_27 ;
  input \slv_reg0_reg[31]_28 ;
  input \slv_reg0_reg[31]_29 ;
  input \slv_reg0_reg[31]_30 ;
  input \slv_reg0_reg[31]_31 ;
  input \slv_reg0_reg[31]_32 ;
  input \slv_reg0_reg[31]_33 ;
  input \slv_reg0_reg[31]_34 ;
  input \slv_reg0_reg[31]_35 ;
  input \slv_reg0_reg[31]_36 ;
  input \slv_reg0_reg[31]_37 ;
  input \slv_reg0_reg[31]_38 ;
  input \slv_reg0_reg[31]_39 ;
  input \slv_reg0_reg[31]_40 ;
  input \slv_reg0_reg[31]_41 ;
  input \slv_reg0_reg[31]_42 ;
  input \slv_reg0_reg[31]_43 ;
  input \slv_reg0_reg[31]_44 ;
  input \slv_reg0_reg[31]_45 ;
  input \slv_reg0_reg[31]_46 ;
  input \slv_reg0_reg[31]_47 ;
  input \slv_reg0_reg[31]_48 ;
  input \slv_reg0_reg[31]_49 ;
  input \slv_reg0_reg[31]_50 ;
  input \slv_reg0_reg[31]_51 ;
  input \slv_reg0_reg[31]_52 ;
  input \slv_reg0_reg[31]_53 ;
  input \slv_reg0_reg[31]_54 ;
  input \slv_reg0_reg[31]_55 ;
  input \slv_reg0_reg[31]_56 ;
  input \slv_reg0_reg[31]_57 ;
  input \slv_reg0_reg[31]_58 ;
  input \slv_reg0_reg[31]_59 ;
  input \slv_reg0_reg[31]_60 ;
  input \slv_reg0_reg[31]_61 ;
  input \slv_reg0_reg[31]_62 ;
  input \slv_reg0_reg[31]_63 ;

  wire hs_data_out_int;
  wire outSR_shift;
  wire [31:0]r_reg;
  wire \r_reg_reg[0]_LDC_n_0 ;
  wire \r_reg_reg[0]_P_n_0 ;
  wire \r_reg_reg[10]_C_n_0 ;
  wire \r_reg_reg[10]_LDC_n_0 ;
  wire \r_reg_reg[10]_P_n_0 ;
  wire \r_reg_reg[11]_C_n_0 ;
  wire \r_reg_reg[11]_LDC_n_0 ;
  wire \r_reg_reg[11]_P_n_0 ;
  wire \r_reg_reg[12]_C_n_0 ;
  wire \r_reg_reg[12]_LDC_n_0 ;
  wire \r_reg_reg[12]_P_n_0 ;
  wire \r_reg_reg[13]_C_n_0 ;
  wire \r_reg_reg[13]_LDC_n_0 ;
  wire \r_reg_reg[13]_P_n_0 ;
  wire \r_reg_reg[14]_C_n_0 ;
  wire \r_reg_reg[14]_LDC_n_0 ;
  wire \r_reg_reg[14]_P_n_0 ;
  wire \r_reg_reg[15]_C_n_0 ;
  wire \r_reg_reg[15]_LDC_n_0 ;
  wire \r_reg_reg[15]_P_n_0 ;
  wire \r_reg_reg[16]_C_n_0 ;
  wire \r_reg_reg[16]_LDC_n_0 ;
  wire \r_reg_reg[16]_P_n_0 ;
  wire \r_reg_reg[17]_C_n_0 ;
  wire \r_reg_reg[17]_LDC_n_0 ;
  wire \r_reg_reg[17]_P_n_0 ;
  wire \r_reg_reg[18]_C_n_0 ;
  wire \r_reg_reg[18]_LDC_n_0 ;
  wire \r_reg_reg[18]_P_n_0 ;
  wire \r_reg_reg[19]_C_n_0 ;
  wire \r_reg_reg[19]_LDC_n_0 ;
  wire \r_reg_reg[19]_P_n_0 ;
  wire \r_reg_reg[1]_C_n_0 ;
  wire \r_reg_reg[1]_LDC_n_0 ;
  wire \r_reg_reg[1]_P_n_0 ;
  wire \r_reg_reg[20]_C_n_0 ;
  wire \r_reg_reg[20]_LDC_n_0 ;
  wire \r_reg_reg[20]_P_n_0 ;
  wire \r_reg_reg[21]_C_n_0 ;
  wire \r_reg_reg[21]_LDC_n_0 ;
  wire \r_reg_reg[21]_P_n_0 ;
  wire \r_reg_reg[22]_C_n_0 ;
  wire \r_reg_reg[22]_LDC_n_0 ;
  wire \r_reg_reg[22]_P_n_0 ;
  wire \r_reg_reg[23]_C_n_0 ;
  wire \r_reg_reg[23]_LDC_n_0 ;
  wire \r_reg_reg[23]_P_n_0 ;
  wire \r_reg_reg[24]_C_n_0 ;
  wire \r_reg_reg[24]_LDC_n_0 ;
  wire \r_reg_reg[24]_P_n_0 ;
  wire \r_reg_reg[25]_C_n_0 ;
  wire \r_reg_reg[25]_LDC_n_0 ;
  wire \r_reg_reg[25]_P_n_0 ;
  wire \r_reg_reg[26]_C_n_0 ;
  wire \r_reg_reg[26]_LDC_n_0 ;
  wire \r_reg_reg[26]_P_n_0 ;
  wire \r_reg_reg[27]_C_n_0 ;
  wire \r_reg_reg[27]_LDC_n_0 ;
  wire \r_reg_reg[27]_P_n_0 ;
  wire \r_reg_reg[28]_C_n_0 ;
  wire \r_reg_reg[28]_LDC_n_0 ;
  wire \r_reg_reg[28]_P_n_0 ;
  wire \r_reg_reg[29]_C_n_0 ;
  wire \r_reg_reg[29]_LDC_n_0 ;
  wire \r_reg_reg[29]_P_n_0 ;
  wire \r_reg_reg[2]_C_n_0 ;
  wire \r_reg_reg[2]_LDC_n_0 ;
  wire \r_reg_reg[2]_P_n_0 ;
  wire \r_reg_reg[30]_C_n_0 ;
  wire \r_reg_reg[30]_LDC_n_0 ;
  wire \r_reg_reg[30]_P_n_0 ;
  wire \r_reg_reg[31]_C_n_0 ;
  wire \r_reg_reg[31]_LDC_n_0 ;
  wire \r_reg_reg[31]_P_n_0 ;
  wire \r_reg_reg[3]_C_n_0 ;
  wire \r_reg_reg[3]_LDC_n_0 ;
  wire \r_reg_reg[3]_P_n_0 ;
  wire \r_reg_reg[4]_C_n_0 ;
  wire \r_reg_reg[4]_LDC_n_0 ;
  wire \r_reg_reg[4]_P_n_0 ;
  wire \r_reg_reg[5]_C_n_0 ;
  wire \r_reg_reg[5]_LDC_n_0 ;
  wire \r_reg_reg[5]_P_n_0 ;
  wire \r_reg_reg[6]_C_n_0 ;
  wire \r_reg_reg[6]_LDC_n_0 ;
  wire \r_reg_reg[6]_P_n_0 ;
  wire \r_reg_reg[7]_C_n_0 ;
  wire \r_reg_reg[7]_LDC_n_0 ;
  wire \r_reg_reg[7]_P_n_0 ;
  wire \r_reg_reg[8]_C_n_0 ;
  wire \r_reg_reg[8]_LDC_n_0 ;
  wire \r_reg_reg[8]_P_n_0 ;
  wire \r_reg_reg[9]_C_n_0 ;
  wire \r_reg_reg[9]_LDC_n_0 ;
  wire \r_reg_reg[9]_P_n_0 ;
  wire \slv_reg0_reg[31] ;
  wire \slv_reg0_reg[31]_0 ;
  wire \slv_reg0_reg[31]_1 ;
  wire \slv_reg0_reg[31]_10 ;
  wire \slv_reg0_reg[31]_11 ;
  wire \slv_reg0_reg[31]_12 ;
  wire \slv_reg0_reg[31]_13 ;
  wire \slv_reg0_reg[31]_14 ;
  wire \slv_reg0_reg[31]_15 ;
  wire \slv_reg0_reg[31]_16 ;
  wire \slv_reg0_reg[31]_17 ;
  wire \slv_reg0_reg[31]_18 ;
  wire \slv_reg0_reg[31]_19 ;
  wire \slv_reg0_reg[31]_2 ;
  wire \slv_reg0_reg[31]_20 ;
  wire \slv_reg0_reg[31]_21 ;
  wire \slv_reg0_reg[31]_22 ;
  wire \slv_reg0_reg[31]_23 ;
  wire \slv_reg0_reg[31]_24 ;
  wire \slv_reg0_reg[31]_25 ;
  wire \slv_reg0_reg[31]_26 ;
  wire \slv_reg0_reg[31]_27 ;
  wire \slv_reg0_reg[31]_28 ;
  wire \slv_reg0_reg[31]_29 ;
  wire \slv_reg0_reg[31]_3 ;
  wire \slv_reg0_reg[31]_30 ;
  wire \slv_reg0_reg[31]_31 ;
  wire \slv_reg0_reg[31]_32 ;
  wire \slv_reg0_reg[31]_33 ;
  wire \slv_reg0_reg[31]_34 ;
  wire \slv_reg0_reg[31]_35 ;
  wire \slv_reg0_reg[31]_36 ;
  wire \slv_reg0_reg[31]_37 ;
  wire \slv_reg0_reg[31]_38 ;
  wire \slv_reg0_reg[31]_39 ;
  wire \slv_reg0_reg[31]_4 ;
  wire \slv_reg0_reg[31]_40 ;
  wire \slv_reg0_reg[31]_41 ;
  wire \slv_reg0_reg[31]_42 ;
  wire \slv_reg0_reg[31]_43 ;
  wire \slv_reg0_reg[31]_44 ;
  wire \slv_reg0_reg[31]_45 ;
  wire \slv_reg0_reg[31]_46 ;
  wire \slv_reg0_reg[31]_47 ;
  wire \slv_reg0_reg[31]_48 ;
  wire \slv_reg0_reg[31]_49 ;
  wire \slv_reg0_reg[31]_5 ;
  wire \slv_reg0_reg[31]_50 ;
  wire \slv_reg0_reg[31]_51 ;
  wire \slv_reg0_reg[31]_52 ;
  wire \slv_reg0_reg[31]_53 ;
  wire \slv_reg0_reg[31]_54 ;
  wire \slv_reg0_reg[31]_55 ;
  wire \slv_reg0_reg[31]_56 ;
  wire \slv_reg0_reg[31]_57 ;
  wire \slv_reg0_reg[31]_58 ;
  wire \slv_reg0_reg[31]_59 ;
  wire \slv_reg0_reg[31]_6 ;
  wire \slv_reg0_reg[31]_60 ;
  wire \slv_reg0_reg[31]_61 ;
  wire \slv_reg0_reg[31]_62 ;
  wire \slv_reg0_reg[31]_63 ;
  wire \slv_reg0_reg[31]_7 ;
  wire \slv_reg0_reg[31]_8 ;
  wire \slv_reg0_reg[31]_9 ;

  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[10]_C_i_1 
       (.I0(\r_reg_reg[9]_P_n_0 ),
        .I1(\r_reg_reg[9]_LDC_n_0 ),
        .I2(\r_reg_reg[9]_C_n_0 ),
        .O(r_reg[9]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[11]_C_i_1 
       (.I0(\r_reg_reg[10]_P_n_0 ),
        .I1(\r_reg_reg[10]_LDC_n_0 ),
        .I2(\r_reg_reg[10]_C_n_0 ),
        .O(r_reg[10]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[12]_C_i_1 
       (.I0(\r_reg_reg[11]_P_n_0 ),
        .I1(\r_reg_reg[11]_LDC_n_0 ),
        .I2(\r_reg_reg[11]_C_n_0 ),
        .O(r_reg[11]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[13]_C_i_1 
       (.I0(\r_reg_reg[12]_P_n_0 ),
        .I1(\r_reg_reg[12]_LDC_n_0 ),
        .I2(\r_reg_reg[12]_C_n_0 ),
        .O(r_reg[12]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[14]_C_i_1 
       (.I0(\r_reg_reg[13]_P_n_0 ),
        .I1(\r_reg_reg[13]_LDC_n_0 ),
        .I2(\r_reg_reg[13]_C_n_0 ),
        .O(r_reg[13]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[15]_C_i_1 
       (.I0(\r_reg_reg[14]_P_n_0 ),
        .I1(\r_reg_reg[14]_LDC_n_0 ),
        .I2(\r_reg_reg[14]_C_n_0 ),
        .O(r_reg[14]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[16]_C_i_1 
       (.I0(\r_reg_reg[15]_P_n_0 ),
        .I1(\r_reg_reg[15]_LDC_n_0 ),
        .I2(\r_reg_reg[15]_C_n_0 ),
        .O(r_reg[15]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[17]_C_i_1 
       (.I0(\r_reg_reg[16]_P_n_0 ),
        .I1(\r_reg_reg[16]_LDC_n_0 ),
        .I2(\r_reg_reg[16]_C_n_0 ),
        .O(r_reg[16]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[18]_C_i_1 
       (.I0(\r_reg_reg[17]_P_n_0 ),
        .I1(\r_reg_reg[17]_LDC_n_0 ),
        .I2(\r_reg_reg[17]_C_n_0 ),
        .O(r_reg[17]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[19]_C_i_1 
       (.I0(\r_reg_reg[18]_P_n_0 ),
        .I1(\r_reg_reg[18]_LDC_n_0 ),
        .I2(\r_reg_reg[18]_C_n_0 ),
        .O(r_reg[18]));
  LUT2 #(
    .INIT(4'h8)) 
    \r_reg[1]_C_i_1 
       (.I0(\r_reg_reg[0]_LDC_n_0 ),
        .I1(\r_reg_reg[0]_P_n_0 ),
        .O(r_reg[0]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[20]_C_i_1 
       (.I0(\r_reg_reg[19]_P_n_0 ),
        .I1(\r_reg_reg[19]_LDC_n_0 ),
        .I2(\r_reg_reg[19]_C_n_0 ),
        .O(r_reg[19]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[21]_C_i_1 
       (.I0(\r_reg_reg[20]_P_n_0 ),
        .I1(\r_reg_reg[20]_LDC_n_0 ),
        .I2(\r_reg_reg[20]_C_n_0 ),
        .O(r_reg[20]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[22]_C_i_1 
       (.I0(\r_reg_reg[21]_P_n_0 ),
        .I1(\r_reg_reg[21]_LDC_n_0 ),
        .I2(\r_reg_reg[21]_C_n_0 ),
        .O(r_reg[21]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[23]_C_i_1 
       (.I0(\r_reg_reg[22]_P_n_0 ),
        .I1(\r_reg_reg[22]_LDC_n_0 ),
        .I2(\r_reg_reg[22]_C_n_0 ),
        .O(r_reg[22]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[24]_C_i_1 
       (.I0(\r_reg_reg[23]_P_n_0 ),
        .I1(\r_reg_reg[23]_LDC_n_0 ),
        .I2(\r_reg_reg[23]_C_n_0 ),
        .O(r_reg[23]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[25]_C_i_1 
       (.I0(\r_reg_reg[24]_P_n_0 ),
        .I1(\r_reg_reg[24]_LDC_n_0 ),
        .I2(\r_reg_reg[24]_C_n_0 ),
        .O(r_reg[24]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[26]_C_i_1 
       (.I0(\r_reg_reg[25]_P_n_0 ),
        .I1(\r_reg_reg[25]_LDC_n_0 ),
        .I2(\r_reg_reg[25]_C_n_0 ),
        .O(r_reg[25]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[27]_C_i_1 
       (.I0(\r_reg_reg[26]_P_n_0 ),
        .I1(\r_reg_reg[26]_LDC_n_0 ),
        .I2(\r_reg_reg[26]_C_n_0 ),
        .O(r_reg[26]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[28]_C_i_1 
       (.I0(\r_reg_reg[27]_P_n_0 ),
        .I1(\r_reg_reg[27]_LDC_n_0 ),
        .I2(\r_reg_reg[27]_C_n_0 ),
        .O(r_reg[27]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[29]_C_i_1 
       (.I0(\r_reg_reg[28]_P_n_0 ),
        .I1(\r_reg_reg[28]_LDC_n_0 ),
        .I2(\r_reg_reg[28]_C_n_0 ),
        .O(r_reg[28]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[2]_C_i_1 
       (.I0(\r_reg_reg[1]_P_n_0 ),
        .I1(\r_reg_reg[1]_LDC_n_0 ),
        .I2(\r_reg_reg[1]_C_n_0 ),
        .O(r_reg[1]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[30]_C_i_1 
       (.I0(\r_reg_reg[29]_P_n_0 ),
        .I1(\r_reg_reg[29]_LDC_n_0 ),
        .I2(\r_reg_reg[29]_C_n_0 ),
        .O(r_reg[29]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[31]_C_i_1 
       (.I0(\r_reg_reg[30]_P_n_0 ),
        .I1(\r_reg_reg[30]_LDC_n_0 ),
        .I2(\r_reg_reg[30]_C_n_0 ),
        .O(r_reg[30]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[32]_i_1 
       (.I0(\r_reg_reg[31]_P_n_0 ),
        .I1(\r_reg_reg[31]_LDC_n_0 ),
        .I2(\r_reg_reg[31]_C_n_0 ),
        .O(r_reg[31]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[3]_C_i_1 
       (.I0(\r_reg_reg[2]_P_n_0 ),
        .I1(\r_reg_reg[2]_LDC_n_0 ),
        .I2(\r_reg_reg[2]_C_n_0 ),
        .O(r_reg[2]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[4]_C_i_1 
       (.I0(\r_reg_reg[3]_P_n_0 ),
        .I1(\r_reg_reg[3]_LDC_n_0 ),
        .I2(\r_reg_reg[3]_C_n_0 ),
        .O(r_reg[3]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[5]_C_i_1 
       (.I0(\r_reg_reg[4]_P_n_0 ),
        .I1(\r_reg_reg[4]_LDC_n_0 ),
        .I2(\r_reg_reg[4]_C_n_0 ),
        .O(r_reg[4]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[6]_C_i_1 
       (.I0(\r_reg_reg[5]_P_n_0 ),
        .I1(\r_reg_reg[5]_LDC_n_0 ),
        .I2(\r_reg_reg[5]_C_n_0 ),
        .O(r_reg[5]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[7]_C_i_1 
       (.I0(\r_reg_reg[6]_P_n_0 ),
        .I1(\r_reg_reg[6]_LDC_n_0 ),
        .I2(\r_reg_reg[6]_C_n_0 ),
        .O(r_reg[6]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[8]_C_i_1 
       (.I0(\r_reg_reg[7]_P_n_0 ),
        .I1(\r_reg_reg[7]_LDC_n_0 ),
        .I2(\r_reg_reg[7]_C_n_0 ),
        .O(r_reg[7]));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[9]_C_i_1 
       (.I0(\r_reg_reg[8]_P_n_0 ),
        .I1(\r_reg_reg[8]_LDC_n_0 ),
        .I2(\r_reg_reg[8]_C_n_0 ),
        .O(r_reg[8]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[0]_LDC 
       (.CLR(\slv_reg0_reg[31]_63 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_62 ),
        .GE(1'b1),
        .Q(\r_reg_reg[0]_LDC_n_0 ));
  FDPE \r_reg_reg[0]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(1'b0),
        .PRE(\slv_reg0_reg[31]_62 ),
        .Q(\r_reg_reg[0]_P_n_0 ));
  FDCE \r_reg_reg[10]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_43 ),
        .D(r_reg[9]),
        .Q(\r_reg_reg[10]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[10]_LDC 
       (.CLR(\slv_reg0_reg[31]_43 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_42 ),
        .GE(1'b1),
        .Q(\r_reg_reg[10]_LDC_n_0 ));
  FDPE \r_reg_reg[10]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[9]),
        .PRE(\slv_reg0_reg[31]_42 ),
        .Q(\r_reg_reg[10]_P_n_0 ));
  FDCE \r_reg_reg[11]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_41 ),
        .D(r_reg[10]),
        .Q(\r_reg_reg[11]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[11]_LDC 
       (.CLR(\slv_reg0_reg[31]_41 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_40 ),
        .GE(1'b1),
        .Q(\r_reg_reg[11]_LDC_n_0 ));
  FDPE \r_reg_reg[11]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[10]),
        .PRE(\slv_reg0_reg[31]_40 ),
        .Q(\r_reg_reg[11]_P_n_0 ));
  FDCE \r_reg_reg[12]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_39 ),
        .D(r_reg[11]),
        .Q(\r_reg_reg[12]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[12]_LDC 
       (.CLR(\slv_reg0_reg[31]_39 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_38 ),
        .GE(1'b1),
        .Q(\r_reg_reg[12]_LDC_n_0 ));
  FDPE \r_reg_reg[12]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[11]),
        .PRE(\slv_reg0_reg[31]_38 ),
        .Q(\r_reg_reg[12]_P_n_0 ));
  FDCE \r_reg_reg[13]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_37 ),
        .D(r_reg[12]),
        .Q(\r_reg_reg[13]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[13]_LDC 
       (.CLR(\slv_reg0_reg[31]_37 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_36 ),
        .GE(1'b1),
        .Q(\r_reg_reg[13]_LDC_n_0 ));
  FDPE \r_reg_reg[13]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[12]),
        .PRE(\slv_reg0_reg[31]_36 ),
        .Q(\r_reg_reg[13]_P_n_0 ));
  FDCE \r_reg_reg[14]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_35 ),
        .D(r_reg[13]),
        .Q(\r_reg_reg[14]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[14]_LDC 
       (.CLR(\slv_reg0_reg[31]_35 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_34 ),
        .GE(1'b1),
        .Q(\r_reg_reg[14]_LDC_n_0 ));
  FDPE \r_reg_reg[14]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[13]),
        .PRE(\slv_reg0_reg[31]_34 ),
        .Q(\r_reg_reg[14]_P_n_0 ));
  FDCE \r_reg_reg[15]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_33 ),
        .D(r_reg[14]),
        .Q(\r_reg_reg[15]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[15]_LDC 
       (.CLR(\slv_reg0_reg[31]_33 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_32 ),
        .GE(1'b1),
        .Q(\r_reg_reg[15]_LDC_n_0 ));
  FDPE \r_reg_reg[15]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[14]),
        .PRE(\slv_reg0_reg[31]_32 ),
        .Q(\r_reg_reg[15]_P_n_0 ));
  FDCE \r_reg_reg[16]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_31 ),
        .D(r_reg[15]),
        .Q(\r_reg_reg[16]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[16]_LDC 
       (.CLR(\slv_reg0_reg[31]_31 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_30 ),
        .GE(1'b1),
        .Q(\r_reg_reg[16]_LDC_n_0 ));
  FDPE \r_reg_reg[16]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[15]),
        .PRE(\slv_reg0_reg[31]_30 ),
        .Q(\r_reg_reg[16]_P_n_0 ));
  FDCE \r_reg_reg[17]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_29 ),
        .D(r_reg[16]),
        .Q(\r_reg_reg[17]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[17]_LDC 
       (.CLR(\slv_reg0_reg[31]_29 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_28 ),
        .GE(1'b1),
        .Q(\r_reg_reg[17]_LDC_n_0 ));
  FDPE \r_reg_reg[17]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[16]),
        .PRE(\slv_reg0_reg[31]_28 ),
        .Q(\r_reg_reg[17]_P_n_0 ));
  FDCE \r_reg_reg[18]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_27 ),
        .D(r_reg[17]),
        .Q(\r_reg_reg[18]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[18]_LDC 
       (.CLR(\slv_reg0_reg[31]_27 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_26 ),
        .GE(1'b1),
        .Q(\r_reg_reg[18]_LDC_n_0 ));
  FDPE \r_reg_reg[18]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[17]),
        .PRE(\slv_reg0_reg[31]_26 ),
        .Q(\r_reg_reg[18]_P_n_0 ));
  FDCE \r_reg_reg[19]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_25 ),
        .D(r_reg[18]),
        .Q(\r_reg_reg[19]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[19]_LDC 
       (.CLR(\slv_reg0_reg[31]_25 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_24 ),
        .GE(1'b1),
        .Q(\r_reg_reg[19]_LDC_n_0 ));
  FDPE \r_reg_reg[19]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[18]),
        .PRE(\slv_reg0_reg[31]_24 ),
        .Q(\r_reg_reg[19]_P_n_0 ));
  FDCE \r_reg_reg[1]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_61 ),
        .D(r_reg[0]),
        .Q(\r_reg_reg[1]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[1]_LDC 
       (.CLR(\slv_reg0_reg[31]_61 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_60 ),
        .GE(1'b1),
        .Q(\r_reg_reg[1]_LDC_n_0 ));
  FDPE \r_reg_reg[1]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[0]),
        .PRE(\slv_reg0_reg[31]_60 ),
        .Q(\r_reg_reg[1]_P_n_0 ));
  FDCE \r_reg_reg[20]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_23 ),
        .D(r_reg[19]),
        .Q(\r_reg_reg[20]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[20]_LDC 
       (.CLR(\slv_reg0_reg[31]_23 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_22 ),
        .GE(1'b1),
        .Q(\r_reg_reg[20]_LDC_n_0 ));
  FDPE \r_reg_reg[20]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[19]),
        .PRE(\slv_reg0_reg[31]_22 ),
        .Q(\r_reg_reg[20]_P_n_0 ));
  FDCE \r_reg_reg[21]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_21 ),
        .D(r_reg[20]),
        .Q(\r_reg_reg[21]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[21]_LDC 
       (.CLR(\slv_reg0_reg[31]_21 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_20 ),
        .GE(1'b1),
        .Q(\r_reg_reg[21]_LDC_n_0 ));
  FDPE \r_reg_reg[21]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[20]),
        .PRE(\slv_reg0_reg[31]_20 ),
        .Q(\r_reg_reg[21]_P_n_0 ));
  FDCE \r_reg_reg[22]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_19 ),
        .D(r_reg[21]),
        .Q(\r_reg_reg[22]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[22]_LDC 
       (.CLR(\slv_reg0_reg[31]_19 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_18 ),
        .GE(1'b1),
        .Q(\r_reg_reg[22]_LDC_n_0 ));
  FDPE \r_reg_reg[22]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[21]),
        .PRE(\slv_reg0_reg[31]_18 ),
        .Q(\r_reg_reg[22]_P_n_0 ));
  FDCE \r_reg_reg[23]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_17 ),
        .D(r_reg[22]),
        .Q(\r_reg_reg[23]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[23]_LDC 
       (.CLR(\slv_reg0_reg[31]_17 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_16 ),
        .GE(1'b1),
        .Q(\r_reg_reg[23]_LDC_n_0 ));
  FDPE \r_reg_reg[23]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[22]),
        .PRE(\slv_reg0_reg[31]_16 ),
        .Q(\r_reg_reg[23]_P_n_0 ));
  FDCE \r_reg_reg[24]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_15 ),
        .D(r_reg[23]),
        .Q(\r_reg_reg[24]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[24]_LDC 
       (.CLR(\slv_reg0_reg[31]_15 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_14 ),
        .GE(1'b1),
        .Q(\r_reg_reg[24]_LDC_n_0 ));
  FDPE \r_reg_reg[24]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[23]),
        .PRE(\slv_reg0_reg[31]_14 ),
        .Q(\r_reg_reg[24]_P_n_0 ));
  FDCE \r_reg_reg[25]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_13 ),
        .D(r_reg[24]),
        .Q(\r_reg_reg[25]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[25]_LDC 
       (.CLR(\slv_reg0_reg[31]_13 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_12 ),
        .GE(1'b1),
        .Q(\r_reg_reg[25]_LDC_n_0 ));
  FDPE \r_reg_reg[25]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[24]),
        .PRE(\slv_reg0_reg[31]_12 ),
        .Q(\r_reg_reg[25]_P_n_0 ));
  FDCE \r_reg_reg[26]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_11 ),
        .D(r_reg[25]),
        .Q(\r_reg_reg[26]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[26]_LDC 
       (.CLR(\slv_reg0_reg[31]_11 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_10 ),
        .GE(1'b1),
        .Q(\r_reg_reg[26]_LDC_n_0 ));
  FDPE \r_reg_reg[26]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[25]),
        .PRE(\slv_reg0_reg[31]_10 ),
        .Q(\r_reg_reg[26]_P_n_0 ));
  FDCE \r_reg_reg[27]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_9 ),
        .D(r_reg[26]),
        .Q(\r_reg_reg[27]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[27]_LDC 
       (.CLR(\slv_reg0_reg[31]_9 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_8 ),
        .GE(1'b1),
        .Q(\r_reg_reg[27]_LDC_n_0 ));
  FDPE \r_reg_reg[27]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[26]),
        .PRE(\slv_reg0_reg[31]_8 ),
        .Q(\r_reg_reg[27]_P_n_0 ));
  FDCE \r_reg_reg[28]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_7 ),
        .D(r_reg[27]),
        .Q(\r_reg_reg[28]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[28]_LDC 
       (.CLR(\slv_reg0_reg[31]_7 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_6 ),
        .GE(1'b1),
        .Q(\r_reg_reg[28]_LDC_n_0 ));
  FDPE \r_reg_reg[28]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[27]),
        .PRE(\slv_reg0_reg[31]_6 ),
        .Q(\r_reg_reg[28]_P_n_0 ));
  FDCE \r_reg_reg[29]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_5 ),
        .D(r_reg[28]),
        .Q(\r_reg_reg[29]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[29]_LDC 
       (.CLR(\slv_reg0_reg[31]_5 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_4 ),
        .GE(1'b1),
        .Q(\r_reg_reg[29]_LDC_n_0 ));
  FDPE \r_reg_reg[29]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[28]),
        .PRE(\slv_reg0_reg[31]_4 ),
        .Q(\r_reg_reg[29]_P_n_0 ));
  FDCE \r_reg_reg[2]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_59 ),
        .D(r_reg[1]),
        .Q(\r_reg_reg[2]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[2]_LDC 
       (.CLR(\slv_reg0_reg[31]_59 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_58 ),
        .GE(1'b1),
        .Q(\r_reg_reg[2]_LDC_n_0 ));
  FDPE \r_reg_reg[2]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[1]),
        .PRE(\slv_reg0_reg[31]_58 ),
        .Q(\r_reg_reg[2]_P_n_0 ));
  FDCE \r_reg_reg[30]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_3 ),
        .D(r_reg[29]),
        .Q(\r_reg_reg[30]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[30]_LDC 
       (.CLR(\slv_reg0_reg[31]_3 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_2 ),
        .GE(1'b1),
        .Q(\r_reg_reg[30]_LDC_n_0 ));
  FDPE \r_reg_reg[30]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[29]),
        .PRE(\slv_reg0_reg[31]_2 ),
        .Q(\r_reg_reg[30]_P_n_0 ));
  FDCE \r_reg_reg[31]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_1 ),
        .D(r_reg[30]),
        .Q(\r_reg_reg[31]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[31]_LDC 
       (.CLR(\slv_reg0_reg[31]_1 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_0 ),
        .GE(1'b1),
        .Q(\r_reg_reg[31]_LDC_n_0 ));
  FDPE \r_reg_reg[31]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[30]),
        .PRE(\slv_reg0_reg[31]_0 ),
        .Q(\r_reg_reg[31]_P_n_0 ));
  FDCE \r_reg_reg[32] 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_reg[31]),
        .Q(hs_data_out_int));
  FDCE \r_reg_reg[3]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_57 ),
        .D(r_reg[2]),
        .Q(\r_reg_reg[3]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[3]_LDC 
       (.CLR(\slv_reg0_reg[31]_57 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_56 ),
        .GE(1'b1),
        .Q(\r_reg_reg[3]_LDC_n_0 ));
  FDPE \r_reg_reg[3]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[2]),
        .PRE(\slv_reg0_reg[31]_56 ),
        .Q(\r_reg_reg[3]_P_n_0 ));
  FDCE \r_reg_reg[4]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_55 ),
        .D(r_reg[3]),
        .Q(\r_reg_reg[4]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[4]_LDC 
       (.CLR(\slv_reg0_reg[31]_55 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_54 ),
        .GE(1'b1),
        .Q(\r_reg_reg[4]_LDC_n_0 ));
  FDPE \r_reg_reg[4]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[3]),
        .PRE(\slv_reg0_reg[31]_54 ),
        .Q(\r_reg_reg[4]_P_n_0 ));
  FDCE \r_reg_reg[5]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_53 ),
        .D(r_reg[4]),
        .Q(\r_reg_reg[5]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[5]_LDC 
       (.CLR(\slv_reg0_reg[31]_53 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_52 ),
        .GE(1'b1),
        .Q(\r_reg_reg[5]_LDC_n_0 ));
  FDPE \r_reg_reg[5]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[4]),
        .PRE(\slv_reg0_reg[31]_52 ),
        .Q(\r_reg_reg[5]_P_n_0 ));
  FDCE \r_reg_reg[6]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_51 ),
        .D(r_reg[5]),
        .Q(\r_reg_reg[6]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[6]_LDC 
       (.CLR(\slv_reg0_reg[31]_51 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_50 ),
        .GE(1'b1),
        .Q(\r_reg_reg[6]_LDC_n_0 ));
  FDPE \r_reg_reg[6]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[5]),
        .PRE(\slv_reg0_reg[31]_50 ),
        .Q(\r_reg_reg[6]_P_n_0 ));
  FDCE \r_reg_reg[7]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_49 ),
        .D(r_reg[6]),
        .Q(\r_reg_reg[7]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[7]_LDC 
       (.CLR(\slv_reg0_reg[31]_49 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_48 ),
        .GE(1'b1),
        .Q(\r_reg_reg[7]_LDC_n_0 ));
  FDPE \r_reg_reg[7]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[6]),
        .PRE(\slv_reg0_reg[31]_48 ),
        .Q(\r_reg_reg[7]_P_n_0 ));
  FDCE \r_reg_reg[8]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_47 ),
        .D(r_reg[7]),
        .Q(\r_reg_reg[8]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[8]_LDC 
       (.CLR(\slv_reg0_reg[31]_47 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_46 ),
        .GE(1'b1),
        .Q(\r_reg_reg[8]_LDC_n_0 ));
  FDPE \r_reg_reg[8]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[7]),
        .PRE(\slv_reg0_reg[31]_46 ),
        .Q(\r_reg_reg[8]_P_n_0 ));
  FDCE \r_reg_reg[9]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_45 ),
        .D(r_reg[8]),
        .Q(\r_reg_reg[9]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[9]_LDC 
       (.CLR(\slv_reg0_reg[31]_45 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_44 ),
        .GE(1'b1),
        .Q(\r_reg_reg[9]_LDC_n_0 ));
  FDPE \r_reg_reg[9]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[8]),
        .PRE(\slv_reg0_reg[31]_44 ),
        .Q(\r_reg_reg[9]_P_n_0 ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_register_32bits
   (Q,
    s00_axis_tdata,
    s00_axi_aclk,
    \slv_reg0_reg[31] );
  output [31:0]Q;
  input [31:0]s00_axis_tdata;
  input s00_axi_aclk;
  input \slv_reg0_reg[31] ;

  wire [31:0]Q;
  wire s00_axi_aclk;
  wire [31:0]s00_axis_tdata;
  wire \slv_reg0_reg[31] ;

  FDCE \data_out_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[0]),
        .Q(Q[0]));
  FDCE \data_out_reg[10] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[10]),
        .Q(Q[10]));
  FDCE \data_out_reg[11] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[11]),
        .Q(Q[11]));
  FDCE \data_out_reg[12] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[12]),
        .Q(Q[12]));
  FDCE \data_out_reg[13] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[13]),
        .Q(Q[13]));
  FDCE \data_out_reg[14] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[14]),
        .Q(Q[14]));
  FDCE \data_out_reg[15] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[15]),
        .Q(Q[15]));
  FDCE \data_out_reg[16] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[16]),
        .Q(Q[16]));
  FDCE \data_out_reg[17] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[17]),
        .Q(Q[17]));
  FDCE \data_out_reg[18] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[18]),
        .Q(Q[18]));
  FDCE \data_out_reg[19] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[19]),
        .Q(Q[19]));
  FDCE \data_out_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[1]),
        .Q(Q[1]));
  FDCE \data_out_reg[20] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[20]),
        .Q(Q[20]));
  FDCE \data_out_reg[21] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[21]),
        .Q(Q[21]));
  FDCE \data_out_reg[22] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[22]),
        .Q(Q[22]));
  FDCE \data_out_reg[23] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[23]),
        .Q(Q[23]));
  FDCE \data_out_reg[24] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[24]),
        .Q(Q[24]));
  FDCE \data_out_reg[25] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[25]),
        .Q(Q[25]));
  FDCE \data_out_reg[26] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[26]),
        .Q(Q[26]));
  FDCE \data_out_reg[27] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[27]),
        .Q(Q[27]));
  FDCE \data_out_reg[28] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[28]),
        .Q(Q[28]));
  FDCE \data_out_reg[29] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[29]),
        .Q(Q[29]));
  FDCE \data_out_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[2]),
        .Q(Q[2]));
  FDCE \data_out_reg[30] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[30]),
        .Q(Q[30]));
  FDCE \data_out_reg[31] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[31]),
        .Q(Q[31]));
  FDCE \data_out_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[3]),
        .Q(Q[3]));
  FDCE \data_out_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[4]),
        .Q(Q[4]));
  FDCE \data_out_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[5]),
        .Q(Q[5]));
  FDCE \data_out_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[6]),
        .Q(Q[6]));
  FDCE \data_out_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[7]),
        .Q(Q[7]));
  FDCE \data_out_reg[8] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[8]),
        .Q(Q[8]));
  FDCE \data_out_reg[9] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(s00_axis_tdata[9]),
        .Q(Q[9]));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_syncReady
   (a,
    b,
    \r_reg_reg[31]_P ,
    \r_reg_reg[30]_P ,
    \r_reg_reg[29]_P ,
    \r_reg_reg[28]_P ,
    \r_reg_reg[27]_P ,
    \r_reg_reg[26]_P ,
    \r_reg_reg[25]_P ,
    \r_reg_reg[24]_P ,
    \r_reg_reg[23]_P ,
    \r_reg_reg[22]_P ,
    \r_reg_reg[21]_P ,
    \r_reg_reg[20]_P ,
    \r_reg_reg[19]_P ,
    \r_reg_reg[18]_P ,
    \r_reg_reg[17]_P ,
    \r_reg_reg[16]_P ,
    \r_reg_reg[15]_P ,
    \r_reg_reg[14]_P ,
    \r_reg_reg[13]_P ,
    \r_reg_reg[12]_P ,
    \r_reg_reg[11]_P ,
    \r_reg_reg[10]_P ,
    \r_reg_reg[9]_P ,
    \r_reg_reg[8]_P ,
    \r_reg_reg[7]_P ,
    \r_reg_reg[6]_P ,
    \r_reg_reg[5]_P ,
    \r_reg_reg[4]_P ,
    \r_reg_reg[3]_P ,
    \r_reg_reg[2]_P ,
    \r_reg_reg[1]_P ,
    \r_reg_reg[0]_P ,
    \r_reg_reg[32] ,
    \r_reg_reg[1]_P_0 ,
    \r_reg_reg[1]_C ,
    \r_reg_reg[2]_C ,
    \r_reg_reg[3]_C ,
    \r_reg_reg[4]_C ,
    \r_reg_reg[5]_C ,
    \r_reg_reg[6]_C ,
    \r_reg_reg[7]_C ,
    \r_reg_reg[8]_C ,
    \r_reg_reg[9]_C ,
    \r_reg_reg[10]_C ,
    \r_reg_reg[11]_C ,
    \r_reg_reg[12]_C ,
    \r_reg_reg[13]_C ,
    \r_reg_reg[14]_C ,
    \r_reg_reg[15]_C ,
    \r_reg_reg[16]_C ,
    \r_reg_reg[17]_C ,
    \r_reg_reg[18]_C ,
    \r_reg_reg[19]_C ,
    \r_reg_reg[20]_C ,
    \r_reg_reg[21]_C ,
    \r_reg_reg[22]_C ,
    \r_reg_reg[23]_C ,
    \r_reg_reg[24]_C ,
    \r_reg_reg[25]_C ,
    \r_reg_reg[26]_C ,
    \r_reg_reg[27]_C ,
    \r_reg_reg[28]_C ,
    \r_reg_reg[29]_C ,
    \r_reg_reg[30]_C ,
    \r_reg_reg[31]_C ,
    out_next_int,
    clk0,
    \slv_reg0_reg[31] ,
    Q_reg,
    out_start_stop_int,
    s00_axis_tvalid,
    \slv_reg0_reg[31]_0 ,
    s00_axi_aresetn,
    Q);
  output a;
  output b;
  output \r_reg_reg[31]_P ;
  output \r_reg_reg[30]_P ;
  output \r_reg_reg[29]_P ;
  output \r_reg_reg[28]_P ;
  output \r_reg_reg[27]_P ;
  output \r_reg_reg[26]_P ;
  output \r_reg_reg[25]_P ;
  output \r_reg_reg[24]_P ;
  output \r_reg_reg[23]_P ;
  output \r_reg_reg[22]_P ;
  output \r_reg_reg[21]_P ;
  output \r_reg_reg[20]_P ;
  output \r_reg_reg[19]_P ;
  output \r_reg_reg[18]_P ;
  output \r_reg_reg[17]_P ;
  output \r_reg_reg[16]_P ;
  output \r_reg_reg[15]_P ;
  output \r_reg_reg[14]_P ;
  output \r_reg_reg[13]_P ;
  output \r_reg_reg[12]_P ;
  output \r_reg_reg[11]_P ;
  output \r_reg_reg[10]_P ;
  output \r_reg_reg[9]_P ;
  output \r_reg_reg[8]_P ;
  output \r_reg_reg[7]_P ;
  output \r_reg_reg[6]_P ;
  output \r_reg_reg[5]_P ;
  output \r_reg_reg[4]_P ;
  output \r_reg_reg[3]_P ;
  output \r_reg_reg[2]_P ;
  output \r_reg_reg[1]_P ;
  output \r_reg_reg[0]_P ;
  output \r_reg_reg[32] ;
  output \r_reg_reg[1]_P_0 ;
  output \r_reg_reg[1]_C ;
  output \r_reg_reg[2]_C ;
  output \r_reg_reg[3]_C ;
  output \r_reg_reg[4]_C ;
  output \r_reg_reg[5]_C ;
  output \r_reg_reg[6]_C ;
  output \r_reg_reg[7]_C ;
  output \r_reg_reg[8]_C ;
  output \r_reg_reg[9]_C ;
  output \r_reg_reg[10]_C ;
  output \r_reg_reg[11]_C ;
  output \r_reg_reg[12]_C ;
  output \r_reg_reg[13]_C ;
  output \r_reg_reg[14]_C ;
  output \r_reg_reg[15]_C ;
  output \r_reg_reg[16]_C ;
  output \r_reg_reg[17]_C ;
  output \r_reg_reg[18]_C ;
  output \r_reg_reg[19]_C ;
  output \r_reg_reg[20]_C ;
  output \r_reg_reg[21]_C ;
  output \r_reg_reg[22]_C ;
  output \r_reg_reg[23]_C ;
  output \r_reg_reg[24]_C ;
  output \r_reg_reg[25]_C ;
  output \r_reg_reg[26]_C ;
  output \r_reg_reg[27]_C ;
  output \r_reg_reg[28]_C ;
  output \r_reg_reg[29]_C ;
  output \r_reg_reg[30]_C ;
  output \r_reg_reg[31]_C ;
  input out_next_int;
  input clk0;
  input \slv_reg0_reg[31] ;
  input Q_reg;
  input out_start_stop_int;
  input s00_axis_tvalid;
  input [0:0]\slv_reg0_reg[31]_0 ;
  input s00_axi_aresetn;
  input [31:0]Q;

  wire [31:0]Q;
  wire Q_reg;
  wire a;
  wire b;
  wire clk0;
  wire out_next_int;
  wire out_start_stop_int;
  wire \r_reg_reg[0]_P ;
  wire \r_reg_reg[10]_C ;
  wire \r_reg_reg[10]_P ;
  wire \r_reg_reg[11]_C ;
  wire \r_reg_reg[11]_P ;
  wire \r_reg_reg[12]_C ;
  wire \r_reg_reg[12]_P ;
  wire \r_reg_reg[13]_C ;
  wire \r_reg_reg[13]_P ;
  wire \r_reg_reg[14]_C ;
  wire \r_reg_reg[14]_P ;
  wire \r_reg_reg[15]_C ;
  wire \r_reg_reg[15]_P ;
  wire \r_reg_reg[16]_C ;
  wire \r_reg_reg[16]_P ;
  wire \r_reg_reg[17]_C ;
  wire \r_reg_reg[17]_P ;
  wire \r_reg_reg[18]_C ;
  wire \r_reg_reg[18]_P ;
  wire \r_reg_reg[19]_C ;
  wire \r_reg_reg[19]_P ;
  wire \r_reg_reg[1]_C ;
  wire \r_reg_reg[1]_P ;
  wire \r_reg_reg[1]_P_0 ;
  wire \r_reg_reg[20]_C ;
  wire \r_reg_reg[20]_P ;
  wire \r_reg_reg[21]_C ;
  wire \r_reg_reg[21]_P ;
  wire \r_reg_reg[22]_C ;
  wire \r_reg_reg[22]_P ;
  wire \r_reg_reg[23]_C ;
  wire \r_reg_reg[23]_P ;
  wire \r_reg_reg[24]_C ;
  wire \r_reg_reg[24]_P ;
  wire \r_reg_reg[25]_C ;
  wire \r_reg_reg[25]_P ;
  wire \r_reg_reg[26]_C ;
  wire \r_reg_reg[26]_P ;
  wire \r_reg_reg[27]_C ;
  wire \r_reg_reg[27]_P ;
  wire \r_reg_reg[28]_C ;
  wire \r_reg_reg[28]_P ;
  wire \r_reg_reg[29]_C ;
  wire \r_reg_reg[29]_P ;
  wire \r_reg_reg[2]_C ;
  wire \r_reg_reg[2]_P ;
  wire \r_reg_reg[30]_C ;
  wire \r_reg_reg[30]_P ;
  wire \r_reg_reg[31]_C ;
  wire \r_reg_reg[31]_P ;
  wire \r_reg_reg[32] ;
  wire \r_reg_reg[3]_C ;
  wire \r_reg_reg[3]_P ;
  wire \r_reg_reg[4]_C ;
  wire \r_reg_reg[4]_P ;
  wire \r_reg_reg[5]_C ;
  wire \r_reg_reg[5]_P ;
  wire \r_reg_reg[6]_C ;
  wire \r_reg_reg[6]_P ;
  wire \r_reg_reg[7]_C ;
  wire \r_reg_reg[7]_P ;
  wire \r_reg_reg[8]_C ;
  wire \r_reg_reg[8]_P ;
  wire \r_reg_reg[9]_C ;
  wire \r_reg_reg[9]_P ;
  wire s00_axi_aresetn;
  wire s00_axis_tvalid;
  wire \slv_reg0_reg[31] ;
  wire [0:0]\slv_reg0_reg[31]_0 ;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_4 X0
       (.a(a),
        .clk0(clk0),
        .out_next_int(out_next_int),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_5 X1
       (.Q(Q),
        .Q_reg_0(Q_reg),
        .a(a),
        .b(b),
        .clk0(clk0),
        .out_start_stop_int(out_start_stop_int),
        .\r_reg_reg[0]_P (\r_reg_reg[0]_P ),
        .\r_reg_reg[10]_C (\r_reg_reg[10]_C ),
        .\r_reg_reg[10]_P (\r_reg_reg[10]_P ),
        .\r_reg_reg[11]_C (\r_reg_reg[11]_C ),
        .\r_reg_reg[11]_P (\r_reg_reg[11]_P ),
        .\r_reg_reg[12]_C (\r_reg_reg[12]_C ),
        .\r_reg_reg[12]_P (\r_reg_reg[12]_P ),
        .\r_reg_reg[13]_C (\r_reg_reg[13]_C ),
        .\r_reg_reg[13]_P (\r_reg_reg[13]_P ),
        .\r_reg_reg[14]_C (\r_reg_reg[14]_C ),
        .\r_reg_reg[14]_P (\r_reg_reg[14]_P ),
        .\r_reg_reg[15]_C (\r_reg_reg[15]_C ),
        .\r_reg_reg[15]_P (\r_reg_reg[15]_P ),
        .\r_reg_reg[16]_C (\r_reg_reg[16]_C ),
        .\r_reg_reg[16]_P (\r_reg_reg[16]_P ),
        .\r_reg_reg[17]_C (\r_reg_reg[17]_C ),
        .\r_reg_reg[17]_P (\r_reg_reg[17]_P ),
        .\r_reg_reg[18]_C (\r_reg_reg[18]_C ),
        .\r_reg_reg[18]_P (\r_reg_reg[18]_P ),
        .\r_reg_reg[19]_C (\r_reg_reg[19]_C ),
        .\r_reg_reg[19]_P (\r_reg_reg[19]_P ),
        .\r_reg_reg[1]_C (\r_reg_reg[1]_C ),
        .\r_reg_reg[1]_P (\r_reg_reg[1]_P ),
        .\r_reg_reg[1]_P_0 (\r_reg_reg[1]_P_0 ),
        .\r_reg_reg[20]_C (\r_reg_reg[20]_C ),
        .\r_reg_reg[20]_P (\r_reg_reg[20]_P ),
        .\r_reg_reg[21]_C (\r_reg_reg[21]_C ),
        .\r_reg_reg[21]_P (\r_reg_reg[21]_P ),
        .\r_reg_reg[22]_C (\r_reg_reg[22]_C ),
        .\r_reg_reg[22]_P (\r_reg_reg[22]_P ),
        .\r_reg_reg[23]_C (\r_reg_reg[23]_C ),
        .\r_reg_reg[23]_P (\r_reg_reg[23]_P ),
        .\r_reg_reg[24]_C (\r_reg_reg[24]_C ),
        .\r_reg_reg[24]_P (\r_reg_reg[24]_P ),
        .\r_reg_reg[25]_C (\r_reg_reg[25]_C ),
        .\r_reg_reg[25]_P (\r_reg_reg[25]_P ),
        .\r_reg_reg[26]_C (\r_reg_reg[26]_C ),
        .\r_reg_reg[26]_P (\r_reg_reg[26]_P ),
        .\r_reg_reg[27]_C (\r_reg_reg[27]_C ),
        .\r_reg_reg[27]_P (\r_reg_reg[27]_P ),
        .\r_reg_reg[28]_C (\r_reg_reg[28]_C ),
        .\r_reg_reg[28]_P (\r_reg_reg[28]_P ),
        .\r_reg_reg[29]_C (\r_reg_reg[29]_C ),
        .\r_reg_reg[29]_P (\r_reg_reg[29]_P ),
        .\r_reg_reg[2]_C (\r_reg_reg[2]_C ),
        .\r_reg_reg[2]_P (\r_reg_reg[2]_P ),
        .\r_reg_reg[30]_C (\r_reg_reg[30]_C ),
        .\r_reg_reg[30]_P (\r_reg_reg[30]_P ),
        .\r_reg_reg[31]_C (\r_reg_reg[31]_C ),
        .\r_reg_reg[31]_P (\r_reg_reg[31]_P ),
        .\r_reg_reg[32] (\r_reg_reg[32] ),
        .\r_reg_reg[3]_C (\r_reg_reg[3]_C ),
        .\r_reg_reg[3]_P (\r_reg_reg[3]_P ),
        .\r_reg_reg[4]_C (\r_reg_reg[4]_C ),
        .\r_reg_reg[4]_P (\r_reg_reg[4]_P ),
        .\r_reg_reg[5]_C (\r_reg_reg[5]_C ),
        .\r_reg_reg[5]_P (\r_reg_reg[5]_P ),
        .\r_reg_reg[6]_C (\r_reg_reg[6]_C ),
        .\r_reg_reg[6]_P (\r_reg_reg[6]_P ),
        .\r_reg_reg[7]_C (\r_reg_reg[7]_C ),
        .\r_reg_reg[7]_P (\r_reg_reg[7]_P ),
        .\r_reg_reg[8]_C (\r_reg_reg[8]_C ),
        .\r_reg_reg[8]_P (\r_reg_reg[8]_P ),
        .\r_reg_reg[9]_C (\r_reg_reg[9]_C ),
        .\r_reg_reg[9]_P (\r_reg_reg[9]_P ),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axis_tvalid(s00_axis_tvalid),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ),
        .\slv_reg0_reg[31]_0 (\slv_reg0_reg[31]_0 ));
endmodule

(* ORIG_REF_NAME = "syncReady" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_syncReady_1
   (a,
    b,
    in_next_int,
    clk0,
    \slv_reg0_reg[31] );
  output a;
  output b;
  input in_next_int;
  input clk0;
  input \slv_reg0_reg[31] ;

  wire a;
  wire b;
  wire clk0;
  wire in_next_int;
  wire \slv_reg0_reg[31] ;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_2 X0
       (.a(a),
        .clk0(clk0),
        .in_next_int(in_next_int),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_3 X1
       (.a(a),
        .b(b),
        .clk0(clk0),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter3Bits
   (clock_base,
    \slv_reg0_reg[17] ,
    s00_axi_aclk,
    \slv_reg0_reg[31] );
  output clock_base;
  input [1:0]\slv_reg0_reg[17] ;
  input s00_axi_aclk;
  input \slv_reg0_reg[31] ;

  wire clock_base;
  wire clock_base_4;
  wire clock_base_8;
  wire \r_reg[0]_i_1__5_n_0 ;
  wire \r_reg[1]_i_1__4_n_0 ;
  wire \r_reg[2]_i_1__4_n_0 ;
  wire \r_reg_reg_n_0_[0] ;
  wire s00_axi_aclk;
  wire [1:0]\slv_reg0_reg[17] ;
  wire \slv_reg0_reg[31] ;

  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    Q_i_2
       (.I0(clock_base_8),
        .I1(clock_base_4),
        .I2(\slv_reg0_reg[17] [1]),
        .I3(\r_reg_reg_n_0_[0] ),
        .I4(\slv_reg0_reg[17] [0]),
        .I5(s00_axi_aclk),
        .O(clock_base));
  LUT1 #(
    .INIT(2'h1)) 
    \r_reg[0]_i_1__5 
       (.I0(\r_reg_reg_n_0_[0] ),
        .O(\r_reg[0]_i_1__5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_reg[1]_i_1__4 
       (.I0(\r_reg_reg_n_0_[0] ),
        .I1(clock_base_4),
        .O(\r_reg[1]_i_1__4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \r_reg[2]_i_1__4 
       (.I0(\r_reg_reg_n_0_[0] ),
        .I1(clock_base_4),
        .I2(clock_base_8),
        .O(\r_reg[2]_i_1__4_n_0 ));
  FDCE \r_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg[0]_i_1__5_n_0 ),
        .Q(\r_reg_reg_n_0_[0] ));
  FDCE \r_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg[1]_i_1__4_n_0 ),
        .Q(clock_base_4));
  FDCE \r_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg[2]_i_1__4_n_0 ),
        .Q(clock_base_8));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits
   (rx_fifo_last_int,
    Q_reg,
    \slv_reg0_reg[31] );
  output rx_fifo_last_int;
  input Q_reg;
  input \slv_reg0_reg[31] ;

  wire Q_i_2__0_n_0;
  wire Q_reg;
  wire [7:0]last_count_int;
  wire [7:0]r_next;
  wire \r_reg[7]_i_2__3_n_0 ;
  wire rx_fifo_last_int;
  wire \slv_reg0_reg[31] ;

  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h00008000)) 
    Q_i_1__3
       (.I0(last_count_int[6]),
        .I1(last_count_int[5]),
        .I2(last_count_int[0]),
        .I3(last_count_int[7]),
        .I4(Q_i_2__0_n_0),
        .O(rx_fifo_last_int));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    Q_i_2__0
       (.I0(last_count_int[3]),
        .I1(last_count_int[4]),
        .I2(last_count_int[1]),
        .I3(last_count_int[2]),
        .O(Q_i_2__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \r_reg[0]_i_1__4 
       (.I0(last_count_int[0]),
        .O(r_next[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \r_reg[1]_i_1__3 
       (.I0(last_count_int[0]),
        .I1(last_count_int[1]),
        .O(r_next[1]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \r_reg[2]_i_1__3 
       (.I0(last_count_int[0]),
        .I1(last_count_int[1]),
        .I2(last_count_int[2]),
        .O(r_next[2]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_reg[3]_i_1__3 
       (.I0(last_count_int[1]),
        .I1(last_count_int[0]),
        .I2(last_count_int[2]),
        .I3(last_count_int[3]),
        .O(r_next[3]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \r_reg[4]_i_1__3 
       (.I0(last_count_int[2]),
        .I1(last_count_int[0]),
        .I2(last_count_int[1]),
        .I3(last_count_int[3]),
        .I4(last_count_int[4]),
        .O(r_next[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \r_reg[5]_i_1__3 
       (.I0(last_count_int[3]),
        .I1(last_count_int[1]),
        .I2(last_count_int[0]),
        .I3(last_count_int[2]),
        .I4(last_count_int[4]),
        .I5(last_count_int[5]),
        .O(r_next[5]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_reg[6]_i_1__3 
       (.I0(\r_reg[7]_i_2__3_n_0 ),
        .I1(last_count_int[6]),
        .O(r_next[6]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \r_reg[7]_i_1__3 
       (.I0(\r_reg[7]_i_2__3_n_0 ),
        .I1(last_count_int[6]),
        .I2(last_count_int[7]),
        .O(r_next[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg[7]_i_2__3 
       (.I0(last_count_int[5]),
        .I1(last_count_int[3]),
        .I2(last_count_int[1]),
        .I3(last_count_int[0]),
        .I4(last_count_int[2]),
        .I5(last_count_int[4]),
        .O(\r_reg[7]_i_2__3_n_0 ));
  FDCE \r_reg_reg[0] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next[0]),
        .Q(last_count_int[0]));
  FDCE \r_reg_reg[1] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next[1]),
        .Q(last_count_int[1]));
  FDCE \r_reg_reg[2] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next[2]),
        .Q(last_count_int[2]));
  FDCE \r_reg_reg[3] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next[3]),
        .Q(last_count_int[3]));
  FDCE \r_reg_reg[4] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next[4]),
        .Q(last_count_int[4]));
  FDCE \r_reg_reg[5] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next[5]),
        .Q(last_count_int[5]));
  FDCE \r_reg_reg[6] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next[6]),
        .Q(last_count_int[6]));
  FDCE \r_reg_reg[7] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next[7]),
        .Q(last_count_int[7]));
endmodule

(* ORIG_REF_NAME = "upCounter8Bits" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_10
   (Q,
    out_next_int,
    \slv_reg0_reg[31] );
  output [7:0]Q;
  input out_next_int;
  input \slv_reg0_reg[31] ;

  wire [7:0]Q;
  wire out_next_int;
  wire [7:0]r_next__3;
  wire \r_reg[7]_i_2__2_n_0 ;
  wire \slv_reg0_reg[31] ;

  LUT1 #(
    .INIT(2'h1)) 
    \r_reg[0]_i_1__3 
       (.I0(Q[0]),
        .O(r_next__3[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_reg[1]_i_1__2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(r_next__3[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \r_reg[2]_i_1__2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(r_next__3[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_reg[3]_i_1__2 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(r_next__3[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \r_reg[4]_i_1__2 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(r_next__3[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \r_reg[5]_i_1__2 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[4]),
        .I5(Q[5]),
        .O(r_next__3[5]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_reg[6]_i_1__2 
       (.I0(\r_reg[7]_i_2__2_n_0 ),
        .I1(Q[6]),
        .O(r_next__3[6]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \r_reg[7]_i_1__2 
       (.I0(\r_reg[7]_i_2__2_n_0 ),
        .I1(Q[6]),
        .I2(Q[7]),
        .O(r_next__3[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg[7]_i_2__2 
       (.I0(Q[5]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[2]),
        .I5(Q[4]),
        .O(\r_reg[7]_i_2__2_n_0 ));
  FDCE \r_reg_reg[0] 
       (.C(out_next_int),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__3[0]),
        .Q(Q[0]));
  FDCE \r_reg_reg[1] 
       (.C(out_next_int),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__3[1]),
        .Q(Q[1]));
  FDCE \r_reg_reg[2] 
       (.C(out_next_int),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__3[2]),
        .Q(Q[2]));
  FDCE \r_reg_reg[3] 
       (.C(out_next_int),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__3[3]),
        .Q(Q[3]));
  FDCE \r_reg_reg[4] 
       (.C(out_next_int),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__3[4]),
        .Q(Q[4]));
  FDCE \r_reg_reg[5] 
       (.C(out_next_int),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__3[5]),
        .Q(Q[5]));
  FDCE \r_reg_reg[6] 
       (.C(out_next_int),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__3[6]),
        .Q(Q[6]));
  FDCE \r_reg_reg[7] 
       (.C(out_next_int),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__3[7]),
        .Q(Q[7]));
endmodule

(* ORIG_REF_NAME = "upCounter8Bits" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_11
   (Q,
    CLK,
    \slv_reg0_reg[31] );
  output [7:0]Q;
  input CLK;
  input \slv_reg0_reg[31] ;

  wire CLK;
  wire [7:0]Q;
  wire [7:0]r_next__2;
  wire \r_reg[7]_i_2__1_n_0 ;
  wire \slv_reg0_reg[31] ;

  LUT1 #(
    .INIT(2'h1)) 
    \r_reg[0]_i_1__2 
       (.I0(Q[0]),
        .O(r_next__2[0]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_reg[1]_i_1__1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(r_next__2[1]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \r_reg[2]_i_1__1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(r_next__2[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_reg[3]_i_1__1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(r_next__2[3]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \r_reg[4]_i_1__1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(r_next__2[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \r_reg[5]_i_1__1 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[4]),
        .I5(Q[5]),
        .O(r_next__2[5]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_reg[6]_i_1__1 
       (.I0(\r_reg[7]_i_2__1_n_0 ),
        .I1(Q[6]),
        .O(r_next__2[6]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \r_reg[7]_i_1__1 
       (.I0(\r_reg[7]_i_2__1_n_0 ),
        .I1(Q[6]),
        .I2(Q[7]),
        .O(r_next__2[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg[7]_i_2__1 
       (.I0(Q[5]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[2]),
        .I5(Q[4]),
        .O(\r_reg[7]_i_2__1_n_0 ));
  FDCE \r_reg_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__2[0]),
        .Q(Q[0]));
  FDCE \r_reg_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__2[1]),
        .Q(Q[1]));
  FDCE \r_reg_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__2[2]),
        .Q(Q[2]));
  FDCE \r_reg_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__2[3]),
        .Q(Q[3]));
  FDCE \r_reg_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__2[4]),
        .Q(Q[4]));
  FDCE \r_reg_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__2[5]),
        .Q(Q[5]));
  FDCE \r_reg_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__2[6]),
        .Q(Q[6]));
  FDCE \r_reg_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__2[7]),
        .Q(Q[7]));
endmodule

(* ORIG_REF_NAME = "upCounter8Bits" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_12
   (Q,
    in_next_int,
    \slv_reg0_reg[31] );
  output [7:0]Q;
  input in_next_int;
  input \slv_reg0_reg[31] ;

  wire [7:0]Q;
  wire in_next_int;
  wire [7:0]r_next__1;
  wire \r_reg[7]_i_2__0_n_0 ;
  wire \slv_reg0_reg[31] ;

  LUT1 #(
    .INIT(2'h1)) 
    \r_reg[0]_i_1__1 
       (.I0(Q[0]),
        .O(r_next__1[0]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_reg[1]_i_1__0 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(r_next__1[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \r_reg[2]_i_1__0 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(r_next__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_reg[3]_i_1__0 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(r_next__1[3]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \r_reg[4]_i_1__0 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(r_next__1[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \r_reg[5]_i_1__0 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[4]),
        .I5(Q[5]),
        .O(r_next__1[5]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_reg[6]_i_1__0 
       (.I0(\r_reg[7]_i_2__0_n_0 ),
        .I1(Q[6]),
        .O(r_next__1[6]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \r_reg[7]_i_1__0 
       (.I0(\r_reg[7]_i_2__0_n_0 ),
        .I1(Q[6]),
        .I2(Q[7]),
        .O(r_next__1[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg[7]_i_2__0 
       (.I0(Q[5]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[2]),
        .I5(Q[4]),
        .O(\r_reg[7]_i_2__0_n_0 ));
  FDCE \r_reg_reg[0] 
       (.C(in_next_int),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__1[0]),
        .Q(Q[0]));
  FDCE \r_reg_reg[1] 
       (.C(in_next_int),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__1[1]),
        .Q(Q[1]));
  FDCE \r_reg_reg[2] 
       (.C(in_next_int),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__1[2]),
        .Q(Q[2]));
  FDCE \r_reg_reg[3] 
       (.C(in_next_int),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__1[3]),
        .Q(Q[3]));
  FDCE \r_reg_reg[4] 
       (.C(in_next_int),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__1[4]),
        .Q(Q[4]));
  FDCE \r_reg_reg[5] 
       (.C(in_next_int),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__1[5]),
        .Q(Q[5]));
  FDCE \r_reg_reg[6] 
       (.C(in_next_int),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__1[6]),
        .Q(Q[6]));
  FDCE \r_reg_reg[7] 
       (.C(in_next_int),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__1[7]),
        .Q(Q[7]));
endmodule

(* ORIG_REF_NAME = "upCounter8Bits" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_13
   (Q,
    Q_reg,
    \slv_reg0_reg[31] );
  output [7:0]Q;
  input Q_reg;
  input \slv_reg0_reg[31] ;

  wire [7:0]Q;
  wire Q_reg;
  wire [7:0]r_next__0;
  wire \r_reg[7]_i_2_n_0 ;
  wire \slv_reg0_reg[31] ;

  LUT1 #(
    .INIT(2'h1)) 
    \r_reg[0]_i_1__0 
       (.I0(Q[0]),
        .O(r_next__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_reg[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(r_next__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \r_reg[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(r_next__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_reg[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(r_next__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \r_reg[4]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(r_next__0[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \r_reg[5]_i_1 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[4]),
        .I5(Q[5]),
        .O(r_next__0[5]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_reg[6]_i_1 
       (.I0(\r_reg[7]_i_2_n_0 ),
        .I1(Q[6]),
        .O(r_next__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \r_reg[7]_i_1 
       (.I0(\r_reg[7]_i_2_n_0 ),
        .I1(Q[6]),
        .I2(Q[7]),
        .O(r_next__0[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg[7]_i_2 
       (.I0(Q[5]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[2]),
        .I5(Q[4]),
        .O(\r_reg[7]_i_2_n_0 ));
  FDCE \r_reg_reg[0] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__0[0]),
        .Q(Q[0]));
  FDCE \r_reg_reg[1] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__0[1]),
        .Q(Q[1]));
  FDCE \r_reg_reg[2] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__0[2]),
        .Q(Q[2]));
  FDCE \r_reg_reg[3] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__0[3]),
        .Q(Q[3]));
  FDCE \r_reg_reg[4] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__0[4]),
        .Q(Q[4]));
  FDCE \r_reg_reg[5] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__0[5]),
        .Q(Q[5]));
  FDCE \r_reg_reg[6] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__0[6]),
        .Q(Q[6]));
  FDCE \r_reg_reg[7] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next__0[7]),
        .Q(Q[7]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
