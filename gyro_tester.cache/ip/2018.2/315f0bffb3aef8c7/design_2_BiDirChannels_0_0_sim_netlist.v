// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Wed May 29 22:15:36 2019
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
    HS_DataIn,
    s00_axi_aresetn,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_bready,
    s00_axi_arvalid,
    s00_axi_rready,
    s00_axis_tvalid,
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
  input HS_DataIn;
  input s00_axi_aresetn;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input s00_axi_bready;
  input s00_axi_arvalid;
  input s00_axi_rready;
  input s00_axis_tvalid;
  input [1:0]s00_axi_awaddr;
  input [31:0]s00_axi_wdata;
  input [1:0]s00_axi_araddr;
  input [31:0]s00_axis_tdata;
  input [3:0]s00_axi_wstrb;

  wire BiDirChannels_v1_0_S00_AXI_inst_n_11;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_13;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_9;
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
  wire [28:16]data_word_0;
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
        .Q({data_word_0[28],data_word_0[17:16]}),
        .Q_reg({D,BiDirChannels_v1_0_S00_AXI_inst_n_11}),
        .Q_reg_0(BiDirChannels_v1_0_S00_AXI_inst_n_13),
        .hs_data_out_int(hs_data_out_int),
        .\r_reg_reg[31]_P (BiDirChannels_v1_0_S00_AXI_inst_n_9),
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
        .Q({data_word_0[28],data_word_0[17:16]}),
        .clk0(clk0),
        .hs_data_out_int(hs_data_out_int),
        .m00_axis_tdata(m00_axis_tdata),
        .m00_axis_tlast(m00_axis_tlast),
        .m00_axis_tvalid(m00_axis_tvalid),
        .\r_reg_reg[32] (clock_div_4),
        .\r_reg_reg[7] (\DBG/CNTR3/r_reg_reg__0 ),
        .\r_reg_reg[7]_0 (\DBG/CNTR2/r_reg_reg__0 ),
        .\r_reg_reg[7]_1 (\DBG/CNTR1/r_reg_reg__0 ),
        .\r_reg_reg[7]_2 (\DBG/CNTR0/r_reg_reg__0 ),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axis_tdata(s00_axis_tdata),
        .s00_axis_tready(s00_axis_tready),
        .s00_axis_tvalid(s00_axis_tvalid),
        .\slv_reg0_reg[31] (BiDirChannels_v1_0_S00_AXI_inst_n_13),
        .\slv_reg0_reg[31]_0 (BiDirChannels_v1_0_S00_AXI_inst_n_9),
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
    \r_reg_reg[31]_P ,
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
  output [2:0]Q;
  output \r_reg_reg[31]_P ;
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
  wire [2:0]Q;
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
  wire [31:0]data_word_0;
  wire hs_data_out_int;
  wire [1:0]p_0_in;
  wire [28:0]p_1_in;
  wire \r_reg_reg[31]_P ;
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
  wire \slv_reg0_reg_n_0_[12] ;
  wire \slv_reg0_reg_n_0_[13] ;
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
        .I4(\slv_reg0_reg_n_0_[12] ),
        .O(reg_data_out[12]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[13]_i_1 
       (.I0(\slv_reg1_reg_n_0_[13] ),
        .I1(axi_araddr[2]),
        .I2(\r_reg_reg[7]_0 [5]),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[13] ),
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
        .I4(data_word_0[31]),
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
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \r_reg[31]_i_2 
       (.I0(data_word_0[31]),
        .I1(s00_axi_aresetn),
        .O(Q_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \r_reg[32]_i_4 
       (.I0(s00_axi_aresetn),
        .I1(data_word_0[31]),
        .O(\r_reg_reg[31]_P ));
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
        .Q(\slv_reg0_reg_n_0_[12] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[13] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[13]),
        .Q(\slv_reg0_reg_n_0_[13] ),
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
        .Q(data_word_0[31]),
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

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_8 CNTR0
       (.Q(\r_reg_reg[7]_1 ),
        .out_next_int(out_next_int),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_9 CNTR1
       (.CLK(CLK),
        .Q(\r_reg_reg[7]_0 ),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_10 CNTR2
       (.Q(\r_reg_reg[7] ),
        .in_next_int(in_next_int),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_11 CNTR3
       (.Q(Q),
        .Q_reg(Q_reg),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_GyroInputOutputSerializer
   (MCK,
    \r_reg_reg[32] ,
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
    \slv_reg1_reg[4] ,
    \slv_reg0_reg[31] ,
    CLK,
    s00_axi_aclk,
    clk0,
    Q,
    \slv_reg0_reg[31]_0 ,
    s00_axis_tvalid,
    D,
    s00_axis_tdata);
  output MCK;
  output \r_reg_reg[32] ;
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
  input [1:0]\slv_reg1_reg[4] ;
  input \slv_reg0_reg[31] ;
  input CLK;
  input s00_axi_aclk;
  input clk0;
  input [2:0]Q;
  input \slv_reg0_reg[31]_0 ;
  input s00_axis_tvalid;
  input [0:0]D;
  input [31:0]s00_axis_tdata;

  wire CLK;
  wire [0:0]D;
  wire HS_Clock;
  wire MCK;
  wire PULSE_CNTR_n_1;
  wire [2:0]Q;
  wire X0_n_1;
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
  wire X0_n_7;
  wire X0_n_8;
  wire X0_n_9;
  wire clk0;
  wire clock_base;
  wire [31:0]data_out;
  wire hs_data_out_int;
  wire inSR_shift;
  wire in_next_int;
  wire in_start_stop_int;
  wire [31:0]m00_axis_tdata;
  wire m00_axis_tlast;
  wire m00_axis_tvalid;
  wire outSR_shift;
  wire out_next_int;
  wire out_start_stop_int;
  wire \r_reg_reg[32] ;
  wire [7:0]\r_reg_reg[7] ;
  wire [7:0]\r_reg_reg[7]_0 ;
  wire [7:0]\r_reg_reg[7]_1 ;
  wire [7:0]\r_reg_reg[7]_2 ;
  wire rx_fifo_last_int;
  wire s00_axi_aclk;
  wire [31:0]s00_axis_tdata;
  wire s00_axis_tready;
  wire s00_axis_tvalid;
  wire \slv_reg0_reg[31] ;
  wire \slv_reg0_reg[31]_0 ;
  wire [1:0]\slv_reg1_reg[4] ;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clock_divider_by_2 CLK_DIV2
       (.MCK(MCK),
        .clock_base(clock_base),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clock_divider_by_2_0 CLK_DIV4
       (.CLK(CLK),
        .MCK(MCK),
        .\r_reg_reg[32] (\r_reg_reg[32] ),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter3Bits CLk_DIV_CNTR
       (.Q(Q[1:0]),
        .clock_base(clock_base),
        .s00_axi_aclk(s00_axi_aclk),
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
       (.CLK(inSR_shift),
        .D(D),
        .m00_axis_tdata(m00_axis_tdata),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits LAST_CNTR
       (.Q_reg(m00_axis_tvalid),
        .rx_fifo_last_int(rx_fifo_last_int),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_maskHSCK MASK_HSCK
       (.in_start_stop_int(in_start_stop_int),
        .out_start_stop_int(out_start_stop_int),
        .\r_reg_reg[0] (PULSE_CNTR_n_1),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ),
        .\slv_reg1_reg[4] (\slv_reg1_reg[4] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_outputShiftRegister32Bits OUT_SHIFT_REG
       (.Q_reg(X0_n_33),
        .Q_reg_0(X0_n_1),
        .Q_reg_1(X0_n_65),
        .Q_reg_10(X0_n_6),
        .Q_reg_11(X0_n_60),
        .Q_reg_12(X0_n_7),
        .Q_reg_13(X0_n_59),
        .Q_reg_14(X0_n_8),
        .Q_reg_15(X0_n_58),
        .Q_reg_16(X0_n_9),
        .Q_reg_17(X0_n_57),
        .Q_reg_18(X0_n_10),
        .Q_reg_19(X0_n_56),
        .Q_reg_2(X0_n_2),
        .Q_reg_20(X0_n_11),
        .Q_reg_21(X0_n_55),
        .Q_reg_22(X0_n_12),
        .Q_reg_23(X0_n_54),
        .Q_reg_24(X0_n_13),
        .Q_reg_25(X0_n_53),
        .Q_reg_26(X0_n_14),
        .Q_reg_27(X0_n_52),
        .Q_reg_28(X0_n_15),
        .Q_reg_29(X0_n_51),
        .Q_reg_3(X0_n_64),
        .Q_reg_30(X0_n_16),
        .Q_reg_31(X0_n_50),
        .Q_reg_32(X0_n_17),
        .Q_reg_33(X0_n_49),
        .Q_reg_34(X0_n_18),
        .Q_reg_35(X0_n_48),
        .Q_reg_36(X0_n_19),
        .Q_reg_37(X0_n_47),
        .Q_reg_38(X0_n_20),
        .Q_reg_39(X0_n_46),
        .Q_reg_4(X0_n_3),
        .Q_reg_40(X0_n_21),
        .Q_reg_41(X0_n_45),
        .Q_reg_42(X0_n_22),
        .Q_reg_43(X0_n_44),
        .Q_reg_44(X0_n_23),
        .Q_reg_45(X0_n_43),
        .Q_reg_46(X0_n_24),
        .Q_reg_47(X0_n_42),
        .Q_reg_48(X0_n_25),
        .Q_reg_49(X0_n_41),
        .Q_reg_5(X0_n_63),
        .Q_reg_50(X0_n_26),
        .Q_reg_51(X0_n_40),
        .Q_reg_52(X0_n_27),
        .Q_reg_53(X0_n_39),
        .Q_reg_54(X0_n_28),
        .Q_reg_55(X0_n_38),
        .Q_reg_56(X0_n_29),
        .Q_reg_57(X0_n_37),
        .Q_reg_58(X0_n_30),
        .Q_reg_59(X0_n_36),
        .Q_reg_6(X0_n_4),
        .Q_reg_60(X0_n_31),
        .Q_reg_61(X0_n_35),
        .Q_reg_62(X0_n_32),
        .Q_reg_63(X0_n_34),
        .Q_reg_7(X0_n_62),
        .Q_reg_8(X0_n_5),
        .Q_reg_9(X0_n_61),
        .hs_data_out_int(hs_data_out_int),
        .outSR_shift(outSR_shift));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_counter48Cycles PULSE_CNTR
       (.CLK(inSR_shift),
        .HS_Clock(HS_Clock),
        .Q(Q[2]),
        .Q_reg(PULSE_CNTR_n_1),
        .Q_reg_0(\r_reg_reg[32] ),
        .Q_reg_1(CLK),
        .in_next_int(in_next_int),
        .in_start_stop_int(in_start_stop_int),
        .outSR_shift(outSR_shift),
        .out_next_int(out_next_int),
        .out_start_stop_int(out_start_stop_int),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_register_32bits TX_DELAY_REG
       (.Q(data_out),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axis_tdata(s00_axis_tdata),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_syncReady X0
       (.Q(data_out),
        .clk0(clk0),
        .out_next_int(out_next_int),
        .out_start_stop_int(out_start_stop_int),
        .\r_reg_reg[0] (PULSE_CNTR_n_1),
        .\r_reg_reg[0]_P (X0_n_32),
        .\r_reg_reg[10]_C (X0_n_44),
        .\r_reg_reg[10]_P (X0_n_22),
        .\r_reg_reg[11]_C (X0_n_45),
        .\r_reg_reg[11]_P (X0_n_21),
        .\r_reg_reg[12]_C (X0_n_46),
        .\r_reg_reg[12]_P (X0_n_20),
        .\r_reg_reg[13]_C (X0_n_47),
        .\r_reg_reg[13]_P (X0_n_19),
        .\r_reg_reg[14]_C (X0_n_48),
        .\r_reg_reg[14]_P (X0_n_18),
        .\r_reg_reg[15]_C (X0_n_49),
        .\r_reg_reg[15]_P (X0_n_17),
        .\r_reg_reg[16]_C (X0_n_50),
        .\r_reg_reg[16]_P (X0_n_16),
        .\r_reg_reg[17]_C (X0_n_51),
        .\r_reg_reg[17]_P (X0_n_15),
        .\r_reg_reg[18]_C (X0_n_52),
        .\r_reg_reg[18]_P (X0_n_14),
        .\r_reg_reg[19]_C (X0_n_53),
        .\r_reg_reg[19]_P (X0_n_13),
        .\r_reg_reg[1]_C (X0_n_35),
        .\r_reg_reg[1]_P (X0_n_31),
        .\r_reg_reg[1]_P_0 (X0_n_34),
        .\r_reg_reg[20]_C (X0_n_54),
        .\r_reg_reg[20]_P (X0_n_12),
        .\r_reg_reg[21]_C (X0_n_55),
        .\r_reg_reg[21]_P (X0_n_11),
        .\r_reg_reg[22]_C (X0_n_56),
        .\r_reg_reg[22]_P (X0_n_10),
        .\r_reg_reg[23]_C (X0_n_57),
        .\r_reg_reg[23]_P (X0_n_9),
        .\r_reg_reg[24]_C (X0_n_58),
        .\r_reg_reg[24]_P (X0_n_8),
        .\r_reg_reg[25]_C (X0_n_59),
        .\r_reg_reg[25]_P (X0_n_7),
        .\r_reg_reg[26]_C (X0_n_60),
        .\r_reg_reg[26]_P (X0_n_6),
        .\r_reg_reg[27]_C (X0_n_61),
        .\r_reg_reg[27]_P (X0_n_5),
        .\r_reg_reg[28]_C (X0_n_62),
        .\r_reg_reg[28]_P (X0_n_4),
        .\r_reg_reg[29]_C (X0_n_63),
        .\r_reg_reg[29]_P (X0_n_3),
        .\r_reg_reg[2]_C (X0_n_36),
        .\r_reg_reg[2]_P (X0_n_30),
        .\r_reg_reg[30]_C (X0_n_64),
        .\r_reg_reg[30]_P (X0_n_2),
        .\r_reg_reg[31]_C (X0_n_65),
        .\r_reg_reg[31]_P (X0_n_1),
        .\r_reg_reg[32] (X0_n_33),
        .\r_reg_reg[3]_C (X0_n_37),
        .\r_reg_reg[3]_P (X0_n_29),
        .\r_reg_reg[4]_C (X0_n_38),
        .\r_reg_reg[4]_P (X0_n_28),
        .\r_reg_reg[5]_C (X0_n_39),
        .\r_reg_reg[5]_P (X0_n_27),
        .\r_reg_reg[6]_C (X0_n_40),
        .\r_reg_reg[6]_P (X0_n_26),
        .\r_reg_reg[7]_C (X0_n_41),
        .\r_reg_reg[7]_P (X0_n_25),
        .\r_reg_reg[8]_C (X0_n_42),
        .\r_reg_reg[8]_P (X0_n_24),
        .\r_reg_reg[9]_C (X0_n_43),
        .\r_reg_reg[9]_P (X0_n_23),
        .s00_axis_tready(s00_axis_tready),
        .s00_axis_tvalid(s00_axis_tvalid),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ),
        .\slv_reg0_reg[31]_0 (\slv_reg0_reg[31]_0 ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_syncReady_1 X1
       (.clk0(clk0),
        .in_next_int(in_next_int),
        .in_start_stop_int(in_start_stop_int),
        .m00_axis_tvalid(m00_axis_tvalid),
        .\r_reg_reg[0] (PULSE_CNTR_n_1),
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

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_13 ff0
       (.MCK(MCK),
        .clock_base(clock_base),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
endmodule

(* ORIG_REF_NAME = "clock_divider_by_2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_clock_divider_by_2_0
   (\r_reg_reg[32] ,
    CLK,
    MCK,
    \slv_reg0_reg[31] );
  output \r_reg_reg[32] ;
  input CLK;
  input MCK;
  input \slv_reg0_reg[31] ;

  wire CLK;
  wire MCK;
  wire \r_reg_reg[32] ;
  wire \slv_reg0_reg[31] ;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_12 ff0
       (.CLK(CLK),
        .MCK(MCK),
        .\r_reg_reg[32] (\r_reg_reg[32] ),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_counter48Cycles
   (out_next_int,
    Q_reg,
    in_next_int,
    outSR_shift,
    CLK,
    HS_Clock,
    out_start_stop_int,
    in_start_stop_int,
    Q_reg_0,
    Q,
    Q_reg_1,
    \slv_reg0_reg[31] );
  output out_next_int;
  output Q_reg;
  output in_next_int;
  output outSR_shift;
  output CLK;
  output HS_Clock;
  input out_start_stop_int;
  input in_start_stop_int;
  input Q_reg_0;
  input [0:0]Q;
  input Q_reg_1;
  input \slv_reg0_reg[31] ;

  wire CLK;
  wire HS_Clock;
  wire [0:0]Q;
  wire Q_reg;
  wire Q_reg_0;
  wire Q_reg_1;
  wire [5:0]count_pulses;
  wire in_next_int;
  wire in_start_stop_int;
  wire outSR_shift;
  wire out_next_int;
  wire out_start_stop_int;
  wire \r_reg[0]_i_1__6_n_0 ;
  wire \r_reg[1]_i_1__5_n_0 ;
  wire \r_reg[2]_i_1__5_n_0 ;
  wire \r_reg[3]_i_1__4_n_0 ;
  wire \r_reg[4]_i_1__4_n_0 ;
  wire \r_reg[5]_i_1__4_n_0 ;
  wire \slv_reg0_reg[31] ;

  LUT5 #(
    .INIT(32'hA956AAAA)) 
    HS_Clock_INST_0
       (.I0(Q),
        .I1(count_pulses[5]),
        .I2(count_pulses[3]),
        .I3(count_pulses[4]),
        .I4(Q_reg_0),
        .O(HS_Clock));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    Q_i_1
       (.I0(Q_reg),
        .I1(out_start_stop_int),
        .O(out_next_int));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    Q_i_1__0
       (.I0(Q_reg),
        .I1(in_start_stop_int),
        .O(in_next_int));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    m00_axis_tvalid_INST_0_i_1
       (.I0(count_pulses[0]),
        .I1(count_pulses[5]),
        .I2(count_pulses[3]),
        .I3(count_pulses[4]),
        .I4(count_pulses[1]),
        .I5(count_pulses[2]),
        .O(Q_reg));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \r_reg[0]_i_1__6 
       (.I0(count_pulses[0]),
        .O(\r_reg[0]_i_1__6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \r_reg[1]_i_1__5 
       (.I0(count_pulses[0]),
        .I1(count_pulses[1]),
        .O(\r_reg[1]_i_1__5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hA9)) 
    \r_reg[2]_i_1__5 
       (.I0(count_pulses[2]),
        .I1(count_pulses[0]),
        .I2(count_pulses[1]),
        .O(\r_reg[2]_i_1__5_n_0 ));
  LUT5 #(
    .INIT(32'h02A80000)) 
    \r_reg[31]_i_1 
       (.I0(in_start_stop_int),
        .I1(count_pulses[5]),
        .I2(count_pulses[3]),
        .I3(count_pulses[4]),
        .I4(Q_reg_0),
        .O(CLK));
  LUT5 #(
    .INIT(32'h02A80000)) 
    \r_reg[32]_i_2 
       (.I0(out_start_stop_int),
        .I1(count_pulses[5]),
        .I2(count_pulses[3]),
        .I3(count_pulses[4]),
        .I4(Q_reg_0),
        .O(outSR_shift));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
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
       (.C(Q_reg_1),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg[0]_i_1__6_n_0 ),
        .Q(count_pulses[0]));
  FDCE \r_reg_reg[1] 
       (.C(Q_reg_1),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg[1]_i_1__5_n_0 ),
        .Q(count_pulses[1]));
  FDCE \r_reg_reg[2] 
       (.C(Q_reg_1),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg[2]_i_1__5_n_0 ),
        .Q(count_pulses[2]));
  FDCE \r_reg_reg[3] 
       (.C(Q_reg_1),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg[3]_i_1__4_n_0 ),
        .Q(count_pulses[3]));
  FDCE \r_reg_reg[4] 
       (.C(Q_reg_1),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg[4]_i_1__4_n_0 ),
        .Q(count_pulses[4]));
  FDCE \r_reg_reg[5] 
       (.C(Q_reg_1),
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
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_12
   (\r_reg_reg[32] ,
    CLK,
    MCK,
    \slv_reg0_reg[31] );
  output \r_reg_reg[32] ;
  input CLK;
  input MCK;
  input \slv_reg0_reg[31] ;

  wire CLK;
  wire MCK;
  wire \r_reg_reg[32] ;
  wire \slv_reg0_reg[31] ;

  FDCE Q_reg
       (.C(MCK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(CLK),
        .Q(\r_reg_reg[32] ));
endmodule

(* ORIG_REF_NAME = "dff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_13
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
    Q_i_1__2
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
    m00_axis_tvalid,
    in_next_int,
    clk0,
    \slv_reg0_reg[31] ,
    in_start_stop_int,
    \r_reg_reg[0] ,
    b);
  output a;
  output m00_axis_tvalid;
  input in_next_int;
  input clk0;
  input \slv_reg0_reg[31] ;
  input in_start_stop_int;
  input \r_reg_reg[0] ;
  input b;

  wire a;
  wire b;
  wire clk0;
  wire in_next_int;
  wire in_start_stop_int;
  wire m00_axis_tvalid;
  wire \r_reg_reg[0] ;
  wire \slv_reg0_reg[31] ;

  FDCE Q_reg
       (.C(clk0),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(in_next_int),
        .Q(a));
  LUT4 #(
    .INIT(16'h0880)) 
    m00_axis_tvalid_INST_0
       (.I0(in_start_stop_int),
        .I1(\r_reg_reg[0] ),
        .I2(a),
        .I3(b),
        .O(m00_axis_tvalid));
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
    s00_axis_tready,
    \r_reg_reg[32] ,
    out_next_int,
    clk0,
    \slv_reg0_reg[31] ,
    out_start_stop_int,
    \r_reg_reg[0] ,
    b,
    s00_axis_tvalid,
    \slv_reg0_reg[31]_0 );
  output a;
  output s00_axis_tready;
  output \r_reg_reg[32] ;
  input out_next_int;
  input clk0;
  input \slv_reg0_reg[31] ;
  input out_start_stop_int;
  input \r_reg_reg[0] ;
  input b;
  input s00_axis_tvalid;
  input \slv_reg0_reg[31]_0 ;

  wire a;
  wire b;
  wire clk0;
  wire out_next_int;
  wire out_start_stop_int;
  wire \r_reg_reg[0] ;
  wire \r_reg_reg[32] ;
  wire s00_axis_tready;
  wire s00_axis_tvalid;
  wire \slv_reg0_reg[31] ;
  wire \slv_reg0_reg[31]_0 ;

  FDCE Q_reg
       (.C(clk0),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(out_next_int),
        .Q(a));
  LUT6 #(
    .INIT(64'h00808000FFFFFFFF)) 
    \r_reg[32]_i_3 
       (.I0(s00_axis_tvalid),
        .I1(out_start_stop_int),
        .I2(\r_reg_reg[0] ),
        .I3(a),
        .I4(b),
        .I5(\slv_reg0_reg[31]_0 ),
        .O(\r_reg_reg[32] ));
  LUT4 #(
    .INIT(16'h0880)) 
    s00_axis_tready_INST_0
       (.I0(out_start_stop_int),
        .I1(\r_reg_reg[0] ),
        .I2(a),
        .I3(b),
        .O(s00_axis_tready));
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
    \slv_reg0_reg[31]_0 ,
    \r_reg_reg[0] ,
    out_start_stop_int,
    s00_axis_tvalid,
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
  input \slv_reg0_reg[31]_0 ;
  input \r_reg_reg[0] ;
  input out_start_stop_int;
  input s00_axis_tvalid;
  input [31:0]Q;

  wire [31:0]Q;
  wire a;
  wire b;
  wire clk0;
  wire out_start_stop_int;
  wire \r_reg_reg[0] ;
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
  wire \r_reg_reg[31]_LDC_i_3_n_0 ;
  wire \r_reg_reg[31]_P ;
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
  wire s00_axis_tvalid;
  wire \slv_reg0_reg[31] ;
  wire \slv_reg0_reg[31]_0 ;

  FDCE Q_reg
       (.C(clk0),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(a),
        .Q(b));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[0]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[0]),
        .O(\r_reg_reg[0]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[0]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[0]),
        .O(\r_reg_reg[1]_P_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[10]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[10]),
        .O(\r_reg_reg[10]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[10]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[10]),
        .O(\r_reg_reg[10]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[11]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[11]),
        .O(\r_reg_reg[11]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[11]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[11]),
        .O(\r_reg_reg[11]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[12]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[12]),
        .O(\r_reg_reg[12]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[12]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[12]),
        .O(\r_reg_reg[12]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[13]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[13]),
        .O(\r_reg_reg[13]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[13]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[13]),
        .O(\r_reg_reg[13]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[14]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[14]),
        .O(\r_reg_reg[14]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[14]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[14]),
        .O(\r_reg_reg[14]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[15]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[15]),
        .O(\r_reg_reg[15]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[15]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[15]),
        .O(\r_reg_reg[15]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[16]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[16]),
        .O(\r_reg_reg[16]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[16]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[16]),
        .O(\r_reg_reg[16]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[17]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[17]),
        .O(\r_reg_reg[17]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[17]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[17]),
        .O(\r_reg_reg[17]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[18]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[18]),
        .O(\r_reg_reg[18]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[18]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[18]),
        .O(\r_reg_reg[18]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[19]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[19]),
        .O(\r_reg_reg[19]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[19]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[19]),
        .O(\r_reg_reg[19]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[1]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[1]),
        .O(\r_reg_reg[1]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[1]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[1]),
        .O(\r_reg_reg[1]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[20]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[20]),
        .O(\r_reg_reg[20]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[20]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[20]),
        .O(\r_reg_reg[20]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[21]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[21]),
        .O(\r_reg_reg[21]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[21]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[21]),
        .O(\r_reg_reg[21]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[22]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[22]),
        .O(\r_reg_reg[22]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[22]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[22]),
        .O(\r_reg_reg[22]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[23]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[23]),
        .O(\r_reg_reg[23]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[23]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[23]),
        .O(\r_reg_reg[23]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[24]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[24]),
        .O(\r_reg_reg[24]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[24]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[24]),
        .O(\r_reg_reg[24]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[25]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[25]),
        .O(\r_reg_reg[25]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[25]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[25]),
        .O(\r_reg_reg[25]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[26]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[26]),
        .O(\r_reg_reg[26]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[26]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[26]),
        .O(\r_reg_reg[26]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[27]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[27]),
        .O(\r_reg_reg[27]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[27]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[27]),
        .O(\r_reg_reg[27]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[28]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[28]),
        .O(\r_reg_reg[28]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[28]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[28]),
        .O(\r_reg_reg[28]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[29]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[29]),
        .O(\r_reg_reg[29]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[29]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[29]),
        .O(\r_reg_reg[29]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[2]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[2]),
        .O(\r_reg_reg[2]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[2]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[2]),
        .O(\r_reg_reg[2]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[30]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[30]),
        .O(\r_reg_reg[30]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[30]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[30]),
        .O(\r_reg_reg[30]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[31]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[31]),
        .O(\r_reg_reg[31]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[31]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[31]),
        .O(\r_reg_reg[31]_C ));
  LUT2 #(
    .INIT(4'h6)) 
    \r_reg_reg[31]_LDC_i_3 
       (.I0(b),
        .I1(a),
        .O(\r_reg_reg[31]_LDC_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[3]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[3]),
        .O(\r_reg_reg[3]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[3]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[3]),
        .O(\r_reg_reg[3]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[4]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[4]),
        .O(\r_reg_reg[4]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[4]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[4]),
        .O(\r_reg_reg[4]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[5]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[5]),
        .O(\r_reg_reg[5]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[5]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[5]),
        .O(\r_reg_reg[5]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[6]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[6]),
        .O(\r_reg_reg[6]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[6]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[6]),
        .O(\r_reg_reg[6]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[7]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[7]),
        .O(\r_reg_reg[7]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[7]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[7]),
        .O(\r_reg_reg[7]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[8]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[8]),
        .O(\r_reg_reg[8]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[8]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[8]),
        .O(\r_reg_reg[8]_C ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_reg_reg[9]_LDC_i_1 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[9]),
        .O(\r_reg_reg[9]_P ));
  LUT6 #(
    .INIT(64'h55555555D5555555)) 
    \r_reg_reg[9]_LDC_i_2 
       (.I0(\slv_reg0_reg[31]_0 ),
        .I1(\r_reg_reg[31]_LDC_i_3_n_0 ),
        .I2(\r_reg_reg[0] ),
        .I3(out_start_stop_int),
        .I4(s00_axis_tvalid),
        .I5(Q[9]),
        .O(\r_reg_reg[9]_C ));
endmodule

(* ORIG_REF_NAME = "dff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_6
   (in_start_stop_int,
    \slv_reg1_reg[4] ,
    \r_reg_reg[0] ,
    \slv_reg0_reg[31] );
  output in_start_stop_int;
  input [0:0]\slv_reg1_reg[4] ;
  input \r_reg_reg[0] ;
  input \slv_reg0_reg[31] ;

  wire in_start_stop_int;
  wire \r_reg_reg[0] ;
  wire \slv_reg0_reg[31] ;
  wire [0:0]\slv_reg1_reg[4] ;

  FDCE Q_reg
       (.C(\r_reg_reg[0] ),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\slv_reg1_reg[4] ),
        .Q(in_start_stop_int));
endmodule

(* ORIG_REF_NAME = "dff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_7
   (out_start_stop_int,
    \slv_reg1_reg[0] ,
    \r_reg_reg[0] ,
    \slv_reg0_reg[31] );
  output out_start_stop_int;
  input [0:0]\slv_reg1_reg[0] ;
  input \r_reg_reg[0] ;
  input \slv_reg0_reg[31] ;

  wire out_start_stop_int;
  wire \r_reg_reg[0] ;
  wire \slv_reg0_reg[31] ;
  wire [0:0]\slv_reg1_reg[0] ;

  FDCE Q_reg
       (.C(\r_reg_reg[0] ),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\slv_reg1_reg[0] ),
        .Q(out_start_stop_int));
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

  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(D),
        .Q(m00_axis_tdata[0]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[10] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[9]),
        .Q(m00_axis_tdata[10]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[11] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[10]),
        .Q(m00_axis_tdata[11]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[12] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[11]),
        .Q(m00_axis_tdata[12]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[13] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[12]),
        .Q(m00_axis_tdata[13]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[14] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[13]),
        .Q(m00_axis_tdata[14]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[15] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[14]),
        .Q(m00_axis_tdata[15]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[16] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[15]),
        .Q(m00_axis_tdata[16]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[17] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[16]),
        .Q(m00_axis_tdata[17]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[18] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[17]),
        .Q(m00_axis_tdata[18]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[19] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[18]),
        .Q(m00_axis_tdata[19]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[0]),
        .Q(m00_axis_tdata[1]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[20] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[19]),
        .Q(m00_axis_tdata[20]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[21] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[20]),
        .Q(m00_axis_tdata[21]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[22] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[21]),
        .Q(m00_axis_tdata[22]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[23] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[22]),
        .Q(m00_axis_tdata[23]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[24] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[23]),
        .Q(m00_axis_tdata[24]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[25] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[24]),
        .Q(m00_axis_tdata[25]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[26] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[25]),
        .Q(m00_axis_tdata[26]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[27] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[26]),
        .Q(m00_axis_tdata[27]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[28] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[27]),
        .Q(m00_axis_tdata[28]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[29] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[28]),
        .Q(m00_axis_tdata[29]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[1]),
        .Q(m00_axis_tdata[2]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[30] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[29]),
        .Q(m00_axis_tdata[30]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[31] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[30]),
        .Q(m00_axis_tdata[31]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[2]),
        .Q(m00_axis_tdata[3]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[3]),
        .Q(m00_axis_tdata[4]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[4]),
        .Q(m00_axis_tdata[5]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[5]),
        .Q(m00_axis_tdata[6]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[6]),
        .Q(m00_axis_tdata[7]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[7]),
        .Q(m00_axis_tdata[8]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \r_reg_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(m00_axis_tdata[8]),
        .Q(m00_axis_tdata[9]));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_maskHSCK
   (in_start_stop_int,
    out_start_stop_int,
    \slv_reg1_reg[4] ,
    \r_reg_reg[0] ,
    \slv_reg0_reg[31] );
  output in_start_stop_int;
  output out_start_stop_int;
  input [1:0]\slv_reg1_reg[4] ;
  input \r_reg_reg[0] ;
  input \slv_reg0_reg[31] ;

  wire in_start_stop_int;
  wire out_start_stop_int;
  wire \r_reg_reg[0] ;
  wire \slv_reg0_reg[31] ;
  wire [1:0]\slv_reg1_reg[4] ;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_6 ff0
       (.in_start_stop_int(in_start_stop_int),
        .\r_reg_reg[0] (\r_reg_reg[0] ),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ),
        .\slv_reg1_reg[4] (\slv_reg1_reg[4] [1]));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_7 ff1
       (.out_start_stop_int(out_start_stop_int),
        .\r_reg_reg[0] (\r_reg_reg[0] ),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ),
        .\slv_reg1_reg[0] (\slv_reg1_reg[4] [0]));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_outputShiftRegister32Bits
   (hs_data_out_int,
    outSR_shift,
    Q_reg,
    Q_reg_0,
    Q_reg_1,
    Q_reg_2,
    Q_reg_3,
    Q_reg_4,
    Q_reg_5,
    Q_reg_6,
    Q_reg_7,
    Q_reg_8,
    Q_reg_9,
    Q_reg_10,
    Q_reg_11,
    Q_reg_12,
    Q_reg_13,
    Q_reg_14,
    Q_reg_15,
    Q_reg_16,
    Q_reg_17,
    Q_reg_18,
    Q_reg_19,
    Q_reg_20,
    Q_reg_21,
    Q_reg_22,
    Q_reg_23,
    Q_reg_24,
    Q_reg_25,
    Q_reg_26,
    Q_reg_27,
    Q_reg_28,
    Q_reg_29,
    Q_reg_30,
    Q_reg_31,
    Q_reg_32,
    Q_reg_33,
    Q_reg_34,
    Q_reg_35,
    Q_reg_36,
    Q_reg_37,
    Q_reg_38,
    Q_reg_39,
    Q_reg_40,
    Q_reg_41,
    Q_reg_42,
    Q_reg_43,
    Q_reg_44,
    Q_reg_45,
    Q_reg_46,
    Q_reg_47,
    Q_reg_48,
    Q_reg_49,
    Q_reg_50,
    Q_reg_51,
    Q_reg_52,
    Q_reg_53,
    Q_reg_54,
    Q_reg_55,
    Q_reg_56,
    Q_reg_57,
    Q_reg_58,
    Q_reg_59,
    Q_reg_60,
    Q_reg_61,
    Q_reg_62,
    Q_reg_63);
  output hs_data_out_int;
  input outSR_shift;
  input Q_reg;
  input Q_reg_0;
  input Q_reg_1;
  input Q_reg_2;
  input Q_reg_3;
  input Q_reg_4;
  input Q_reg_5;
  input Q_reg_6;
  input Q_reg_7;
  input Q_reg_8;
  input Q_reg_9;
  input Q_reg_10;
  input Q_reg_11;
  input Q_reg_12;
  input Q_reg_13;
  input Q_reg_14;
  input Q_reg_15;
  input Q_reg_16;
  input Q_reg_17;
  input Q_reg_18;
  input Q_reg_19;
  input Q_reg_20;
  input Q_reg_21;
  input Q_reg_22;
  input Q_reg_23;
  input Q_reg_24;
  input Q_reg_25;
  input Q_reg_26;
  input Q_reg_27;
  input Q_reg_28;
  input Q_reg_29;
  input Q_reg_30;
  input Q_reg_31;
  input Q_reg_32;
  input Q_reg_33;
  input Q_reg_34;
  input Q_reg_35;
  input Q_reg_36;
  input Q_reg_37;
  input Q_reg_38;
  input Q_reg_39;
  input Q_reg_40;
  input Q_reg_41;
  input Q_reg_42;
  input Q_reg_43;
  input Q_reg_44;
  input Q_reg_45;
  input Q_reg_46;
  input Q_reg_47;
  input Q_reg_48;
  input Q_reg_49;
  input Q_reg_50;
  input Q_reg_51;
  input Q_reg_52;
  input Q_reg_53;
  input Q_reg_54;
  input Q_reg_55;
  input Q_reg_56;
  input Q_reg_57;
  input Q_reg_58;
  input Q_reg_59;
  input Q_reg_60;
  input Q_reg_61;
  input Q_reg_62;
  input Q_reg_63;

  wire Q_reg;
  wire Q_reg_0;
  wire Q_reg_1;
  wire Q_reg_10;
  wire Q_reg_11;
  wire Q_reg_12;
  wire Q_reg_13;
  wire Q_reg_14;
  wire Q_reg_15;
  wire Q_reg_16;
  wire Q_reg_17;
  wire Q_reg_18;
  wire Q_reg_19;
  wire Q_reg_2;
  wire Q_reg_20;
  wire Q_reg_21;
  wire Q_reg_22;
  wire Q_reg_23;
  wire Q_reg_24;
  wire Q_reg_25;
  wire Q_reg_26;
  wire Q_reg_27;
  wire Q_reg_28;
  wire Q_reg_29;
  wire Q_reg_3;
  wire Q_reg_30;
  wire Q_reg_31;
  wire Q_reg_32;
  wire Q_reg_33;
  wire Q_reg_34;
  wire Q_reg_35;
  wire Q_reg_36;
  wire Q_reg_37;
  wire Q_reg_38;
  wire Q_reg_39;
  wire Q_reg_4;
  wire Q_reg_40;
  wire Q_reg_41;
  wire Q_reg_42;
  wire Q_reg_43;
  wire Q_reg_44;
  wire Q_reg_45;
  wire Q_reg_46;
  wire Q_reg_47;
  wire Q_reg_48;
  wire Q_reg_49;
  wire Q_reg_5;
  wire Q_reg_50;
  wire Q_reg_51;
  wire Q_reg_52;
  wire Q_reg_53;
  wire Q_reg_54;
  wire Q_reg_55;
  wire Q_reg_56;
  wire Q_reg_57;
  wire Q_reg_58;
  wire Q_reg_59;
  wire Q_reg_6;
  wire Q_reg_60;
  wire Q_reg_61;
  wire Q_reg_62;
  wire Q_reg_63;
  wire Q_reg_7;
  wire Q_reg_8;
  wire Q_reg_9;
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
       (.CLR(Q_reg_63),
        .D(1'b1),
        .G(Q_reg_62),
        .GE(1'b1),
        .Q(\r_reg_reg[0]_LDC_n_0 ));
  FDPE \r_reg_reg[0]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(1'b0),
        .PRE(Q_reg_62),
        .Q(\r_reg_reg[0]_P_n_0 ));
  FDCE \r_reg_reg[10]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_43),
        .D(r_reg[9]),
        .Q(\r_reg_reg[10]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[10]_LDC 
       (.CLR(Q_reg_43),
        .D(1'b1),
        .G(Q_reg_42),
        .GE(1'b1),
        .Q(\r_reg_reg[10]_LDC_n_0 ));
  FDPE \r_reg_reg[10]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[9]),
        .PRE(Q_reg_42),
        .Q(\r_reg_reg[10]_P_n_0 ));
  FDCE \r_reg_reg[11]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_41),
        .D(r_reg[10]),
        .Q(\r_reg_reg[11]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[11]_LDC 
       (.CLR(Q_reg_41),
        .D(1'b1),
        .G(Q_reg_40),
        .GE(1'b1),
        .Q(\r_reg_reg[11]_LDC_n_0 ));
  FDPE \r_reg_reg[11]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[10]),
        .PRE(Q_reg_40),
        .Q(\r_reg_reg[11]_P_n_0 ));
  FDCE \r_reg_reg[12]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_39),
        .D(r_reg[11]),
        .Q(\r_reg_reg[12]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[12]_LDC 
       (.CLR(Q_reg_39),
        .D(1'b1),
        .G(Q_reg_38),
        .GE(1'b1),
        .Q(\r_reg_reg[12]_LDC_n_0 ));
  FDPE \r_reg_reg[12]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[11]),
        .PRE(Q_reg_38),
        .Q(\r_reg_reg[12]_P_n_0 ));
  FDCE \r_reg_reg[13]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_37),
        .D(r_reg[12]),
        .Q(\r_reg_reg[13]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[13]_LDC 
       (.CLR(Q_reg_37),
        .D(1'b1),
        .G(Q_reg_36),
        .GE(1'b1),
        .Q(\r_reg_reg[13]_LDC_n_0 ));
  FDPE \r_reg_reg[13]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[12]),
        .PRE(Q_reg_36),
        .Q(\r_reg_reg[13]_P_n_0 ));
  FDCE \r_reg_reg[14]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_35),
        .D(r_reg[13]),
        .Q(\r_reg_reg[14]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[14]_LDC 
       (.CLR(Q_reg_35),
        .D(1'b1),
        .G(Q_reg_34),
        .GE(1'b1),
        .Q(\r_reg_reg[14]_LDC_n_0 ));
  FDPE \r_reg_reg[14]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[13]),
        .PRE(Q_reg_34),
        .Q(\r_reg_reg[14]_P_n_0 ));
  FDCE \r_reg_reg[15]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_33),
        .D(r_reg[14]),
        .Q(\r_reg_reg[15]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[15]_LDC 
       (.CLR(Q_reg_33),
        .D(1'b1),
        .G(Q_reg_32),
        .GE(1'b1),
        .Q(\r_reg_reg[15]_LDC_n_0 ));
  FDPE \r_reg_reg[15]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[14]),
        .PRE(Q_reg_32),
        .Q(\r_reg_reg[15]_P_n_0 ));
  FDCE \r_reg_reg[16]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_31),
        .D(r_reg[15]),
        .Q(\r_reg_reg[16]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[16]_LDC 
       (.CLR(Q_reg_31),
        .D(1'b1),
        .G(Q_reg_30),
        .GE(1'b1),
        .Q(\r_reg_reg[16]_LDC_n_0 ));
  FDPE \r_reg_reg[16]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[15]),
        .PRE(Q_reg_30),
        .Q(\r_reg_reg[16]_P_n_0 ));
  FDCE \r_reg_reg[17]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_29),
        .D(r_reg[16]),
        .Q(\r_reg_reg[17]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[17]_LDC 
       (.CLR(Q_reg_29),
        .D(1'b1),
        .G(Q_reg_28),
        .GE(1'b1),
        .Q(\r_reg_reg[17]_LDC_n_0 ));
  FDPE \r_reg_reg[17]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[16]),
        .PRE(Q_reg_28),
        .Q(\r_reg_reg[17]_P_n_0 ));
  FDCE \r_reg_reg[18]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_27),
        .D(r_reg[17]),
        .Q(\r_reg_reg[18]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[18]_LDC 
       (.CLR(Q_reg_27),
        .D(1'b1),
        .G(Q_reg_26),
        .GE(1'b1),
        .Q(\r_reg_reg[18]_LDC_n_0 ));
  FDPE \r_reg_reg[18]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[17]),
        .PRE(Q_reg_26),
        .Q(\r_reg_reg[18]_P_n_0 ));
  FDCE \r_reg_reg[19]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_25),
        .D(r_reg[18]),
        .Q(\r_reg_reg[19]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[19]_LDC 
       (.CLR(Q_reg_25),
        .D(1'b1),
        .G(Q_reg_24),
        .GE(1'b1),
        .Q(\r_reg_reg[19]_LDC_n_0 ));
  FDPE \r_reg_reg[19]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[18]),
        .PRE(Q_reg_24),
        .Q(\r_reg_reg[19]_P_n_0 ));
  FDCE \r_reg_reg[1]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_61),
        .D(r_reg[0]),
        .Q(\r_reg_reg[1]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[1]_LDC 
       (.CLR(Q_reg_61),
        .D(1'b1),
        .G(Q_reg_60),
        .GE(1'b1),
        .Q(\r_reg_reg[1]_LDC_n_0 ));
  FDPE \r_reg_reg[1]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[0]),
        .PRE(Q_reg_60),
        .Q(\r_reg_reg[1]_P_n_0 ));
  FDCE \r_reg_reg[20]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_23),
        .D(r_reg[19]),
        .Q(\r_reg_reg[20]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[20]_LDC 
       (.CLR(Q_reg_23),
        .D(1'b1),
        .G(Q_reg_22),
        .GE(1'b1),
        .Q(\r_reg_reg[20]_LDC_n_0 ));
  FDPE \r_reg_reg[20]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[19]),
        .PRE(Q_reg_22),
        .Q(\r_reg_reg[20]_P_n_0 ));
  FDCE \r_reg_reg[21]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_21),
        .D(r_reg[20]),
        .Q(\r_reg_reg[21]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[21]_LDC 
       (.CLR(Q_reg_21),
        .D(1'b1),
        .G(Q_reg_20),
        .GE(1'b1),
        .Q(\r_reg_reg[21]_LDC_n_0 ));
  FDPE \r_reg_reg[21]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[20]),
        .PRE(Q_reg_20),
        .Q(\r_reg_reg[21]_P_n_0 ));
  FDCE \r_reg_reg[22]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_19),
        .D(r_reg[21]),
        .Q(\r_reg_reg[22]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[22]_LDC 
       (.CLR(Q_reg_19),
        .D(1'b1),
        .G(Q_reg_18),
        .GE(1'b1),
        .Q(\r_reg_reg[22]_LDC_n_0 ));
  FDPE \r_reg_reg[22]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[21]),
        .PRE(Q_reg_18),
        .Q(\r_reg_reg[22]_P_n_0 ));
  FDCE \r_reg_reg[23]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_17),
        .D(r_reg[22]),
        .Q(\r_reg_reg[23]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[23]_LDC 
       (.CLR(Q_reg_17),
        .D(1'b1),
        .G(Q_reg_16),
        .GE(1'b1),
        .Q(\r_reg_reg[23]_LDC_n_0 ));
  FDPE \r_reg_reg[23]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[22]),
        .PRE(Q_reg_16),
        .Q(\r_reg_reg[23]_P_n_0 ));
  FDCE \r_reg_reg[24]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_15),
        .D(r_reg[23]),
        .Q(\r_reg_reg[24]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[24]_LDC 
       (.CLR(Q_reg_15),
        .D(1'b1),
        .G(Q_reg_14),
        .GE(1'b1),
        .Q(\r_reg_reg[24]_LDC_n_0 ));
  FDPE \r_reg_reg[24]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[23]),
        .PRE(Q_reg_14),
        .Q(\r_reg_reg[24]_P_n_0 ));
  FDCE \r_reg_reg[25]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_13),
        .D(r_reg[24]),
        .Q(\r_reg_reg[25]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[25]_LDC 
       (.CLR(Q_reg_13),
        .D(1'b1),
        .G(Q_reg_12),
        .GE(1'b1),
        .Q(\r_reg_reg[25]_LDC_n_0 ));
  FDPE \r_reg_reg[25]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[24]),
        .PRE(Q_reg_12),
        .Q(\r_reg_reg[25]_P_n_0 ));
  FDCE \r_reg_reg[26]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_11),
        .D(r_reg[25]),
        .Q(\r_reg_reg[26]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[26]_LDC 
       (.CLR(Q_reg_11),
        .D(1'b1),
        .G(Q_reg_10),
        .GE(1'b1),
        .Q(\r_reg_reg[26]_LDC_n_0 ));
  FDPE \r_reg_reg[26]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[25]),
        .PRE(Q_reg_10),
        .Q(\r_reg_reg[26]_P_n_0 ));
  FDCE \r_reg_reg[27]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_9),
        .D(r_reg[26]),
        .Q(\r_reg_reg[27]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[27]_LDC 
       (.CLR(Q_reg_9),
        .D(1'b1),
        .G(Q_reg_8),
        .GE(1'b1),
        .Q(\r_reg_reg[27]_LDC_n_0 ));
  FDPE \r_reg_reg[27]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[26]),
        .PRE(Q_reg_8),
        .Q(\r_reg_reg[27]_P_n_0 ));
  FDCE \r_reg_reg[28]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_7),
        .D(r_reg[27]),
        .Q(\r_reg_reg[28]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[28]_LDC 
       (.CLR(Q_reg_7),
        .D(1'b1),
        .G(Q_reg_6),
        .GE(1'b1),
        .Q(\r_reg_reg[28]_LDC_n_0 ));
  FDPE \r_reg_reg[28]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[27]),
        .PRE(Q_reg_6),
        .Q(\r_reg_reg[28]_P_n_0 ));
  FDCE \r_reg_reg[29]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_5),
        .D(r_reg[28]),
        .Q(\r_reg_reg[29]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[29]_LDC 
       (.CLR(Q_reg_5),
        .D(1'b1),
        .G(Q_reg_4),
        .GE(1'b1),
        .Q(\r_reg_reg[29]_LDC_n_0 ));
  FDPE \r_reg_reg[29]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[28]),
        .PRE(Q_reg_4),
        .Q(\r_reg_reg[29]_P_n_0 ));
  FDCE \r_reg_reg[2]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_59),
        .D(r_reg[1]),
        .Q(\r_reg_reg[2]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[2]_LDC 
       (.CLR(Q_reg_59),
        .D(1'b1),
        .G(Q_reg_58),
        .GE(1'b1),
        .Q(\r_reg_reg[2]_LDC_n_0 ));
  FDPE \r_reg_reg[2]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[1]),
        .PRE(Q_reg_58),
        .Q(\r_reg_reg[2]_P_n_0 ));
  FDCE \r_reg_reg[30]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_3),
        .D(r_reg[29]),
        .Q(\r_reg_reg[30]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[30]_LDC 
       (.CLR(Q_reg_3),
        .D(1'b1),
        .G(Q_reg_2),
        .GE(1'b1),
        .Q(\r_reg_reg[30]_LDC_n_0 ));
  FDPE \r_reg_reg[30]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[29]),
        .PRE(Q_reg_2),
        .Q(\r_reg_reg[30]_P_n_0 ));
  FDCE \r_reg_reg[31]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_1),
        .D(r_reg[30]),
        .Q(\r_reg_reg[31]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[31]_LDC 
       (.CLR(Q_reg_1),
        .D(1'b1),
        .G(Q_reg_0),
        .GE(1'b1),
        .Q(\r_reg_reg[31]_LDC_n_0 ));
  FDPE \r_reg_reg[31]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[30]),
        .PRE(Q_reg_0),
        .Q(\r_reg_reg[31]_P_n_0 ));
  FDCE \r_reg_reg[32] 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg),
        .D(r_reg[31]),
        .Q(hs_data_out_int));
  FDCE \r_reg_reg[3]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_57),
        .D(r_reg[2]),
        .Q(\r_reg_reg[3]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[3]_LDC 
       (.CLR(Q_reg_57),
        .D(1'b1),
        .G(Q_reg_56),
        .GE(1'b1),
        .Q(\r_reg_reg[3]_LDC_n_0 ));
  FDPE \r_reg_reg[3]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[2]),
        .PRE(Q_reg_56),
        .Q(\r_reg_reg[3]_P_n_0 ));
  FDCE \r_reg_reg[4]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_55),
        .D(r_reg[3]),
        .Q(\r_reg_reg[4]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[4]_LDC 
       (.CLR(Q_reg_55),
        .D(1'b1),
        .G(Q_reg_54),
        .GE(1'b1),
        .Q(\r_reg_reg[4]_LDC_n_0 ));
  FDPE \r_reg_reg[4]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[3]),
        .PRE(Q_reg_54),
        .Q(\r_reg_reg[4]_P_n_0 ));
  FDCE \r_reg_reg[5]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_53),
        .D(r_reg[4]),
        .Q(\r_reg_reg[5]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[5]_LDC 
       (.CLR(Q_reg_53),
        .D(1'b1),
        .G(Q_reg_52),
        .GE(1'b1),
        .Q(\r_reg_reg[5]_LDC_n_0 ));
  FDPE \r_reg_reg[5]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[4]),
        .PRE(Q_reg_52),
        .Q(\r_reg_reg[5]_P_n_0 ));
  FDCE \r_reg_reg[6]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_51),
        .D(r_reg[5]),
        .Q(\r_reg_reg[6]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[6]_LDC 
       (.CLR(Q_reg_51),
        .D(1'b1),
        .G(Q_reg_50),
        .GE(1'b1),
        .Q(\r_reg_reg[6]_LDC_n_0 ));
  FDPE \r_reg_reg[6]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[5]),
        .PRE(Q_reg_50),
        .Q(\r_reg_reg[6]_P_n_0 ));
  FDCE \r_reg_reg[7]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_49),
        .D(r_reg[6]),
        .Q(\r_reg_reg[7]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[7]_LDC 
       (.CLR(Q_reg_49),
        .D(1'b1),
        .G(Q_reg_48),
        .GE(1'b1),
        .Q(\r_reg_reg[7]_LDC_n_0 ));
  FDPE \r_reg_reg[7]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[6]),
        .PRE(Q_reg_48),
        .Q(\r_reg_reg[7]_P_n_0 ));
  FDCE \r_reg_reg[8]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_47),
        .D(r_reg[7]),
        .Q(\r_reg_reg[8]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[8]_LDC 
       (.CLR(Q_reg_47),
        .D(1'b1),
        .G(Q_reg_46),
        .GE(1'b1),
        .Q(\r_reg_reg[8]_LDC_n_0 ));
  FDPE \r_reg_reg[8]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[7]),
        .PRE(Q_reg_46),
        .Q(\r_reg_reg[8]_P_n_0 ));
  FDCE \r_reg_reg[9]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(Q_reg_45),
        .D(r_reg[8]),
        .Q(\r_reg_reg[9]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[9]_LDC 
       (.CLR(Q_reg_45),
        .D(1'b1),
        .G(Q_reg_44),
        .GE(1'b1),
        .Q(\r_reg_reg[9]_LDC_n_0 ));
  FDPE \r_reg_reg[9]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(r_reg[8]),
        .PRE(Q_reg_44),
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
   (s00_axis_tready,
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
    out_start_stop_int,
    \r_reg_reg[0] ,
    \slv_reg0_reg[31]_0 ,
    s00_axis_tvalid,
    Q);
  output s00_axis_tready;
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
  input out_start_stop_int;
  input \r_reg_reg[0] ;
  input \slv_reg0_reg[31]_0 ;
  input s00_axis_tvalid;
  input [31:0]Q;

  wire [31:0]Q;
  wire a;
  wire b;
  wire clk0;
  wire out_next_int;
  wire out_start_stop_int;
  wire \r_reg_reg[0] ;
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
  wire s00_axis_tready;
  wire s00_axis_tvalid;
  wire \slv_reg0_reg[31] ;
  wire \slv_reg0_reg[31]_0 ;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_4 X0
       (.a(a),
        .b(b),
        .clk0(clk0),
        .out_next_int(out_next_int),
        .out_start_stop_int(out_start_stop_int),
        .\r_reg_reg[0] (\r_reg_reg[0] ),
        .\r_reg_reg[32] (\r_reg_reg[32] ),
        .s00_axis_tready(s00_axis_tready),
        .s00_axis_tvalid(s00_axis_tvalid),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ),
        .\slv_reg0_reg[31]_0 (\slv_reg0_reg[31]_0 ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_5 X1
       (.Q(Q),
        .a(a),
        .b(b),
        .clk0(clk0),
        .out_start_stop_int(out_start_stop_int),
        .\r_reg_reg[0] (\r_reg_reg[0] ),
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
        .s00_axis_tvalid(s00_axis_tvalid),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ),
        .\slv_reg0_reg[31]_0 (\slv_reg0_reg[31]_0 ));
endmodule

(* ORIG_REF_NAME = "syncReady" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_syncReady_1
   (m00_axis_tvalid,
    in_next_int,
    clk0,
    \slv_reg0_reg[31] ,
    in_start_stop_int,
    \r_reg_reg[0] );
  output m00_axis_tvalid;
  input in_next_int;
  input clk0;
  input \slv_reg0_reg[31] ;
  input in_start_stop_int;
  input \r_reg_reg[0] ;

  wire a;
  wire b;
  wire clk0;
  wire in_next_int;
  wire in_start_stop_int;
  wire m00_axis_tvalid;
  wire \r_reg_reg[0] ;
  wire \slv_reg0_reg[31] ;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_2 X0
       (.a(a),
        .b(b),
        .clk0(clk0),
        .in_next_int(in_next_int),
        .in_start_stop_int(in_start_stop_int),
        .m00_axis_tvalid(m00_axis_tvalid),
        .\r_reg_reg[0] (\r_reg_reg[0] ),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dff_3 X1
       (.a(a),
        .b(b),
        .clk0(clk0),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter3Bits
   (clock_base,
    Q,
    s00_axi_aclk,
    \slv_reg0_reg[31] );
  output clock_base;
  input [1:0]Q;
  input s00_axi_aclk;
  input \slv_reg0_reg[31] ;

  wire [1:0]Q;
  wire clock_base;
  wire clock_base_4;
  wire clock_base_8;
  wire \r_reg[0]_i_1__5_n_0 ;
  wire \r_reg[1]_i_1__4_n_0 ;
  wire \r_reg[2]_i_1__4_n_0 ;
  wire \r_reg_reg_n_0_[0] ;
  wire s00_axi_aclk;
  wire \slv_reg0_reg[31] ;

  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    Q_i_2
       (.I0(clock_base_8),
        .I1(clock_base_4),
        .I2(Q[1]),
        .I3(\r_reg_reg_n_0_[0] ),
        .I4(Q[0]),
        .I5(s00_axi_aclk),
        .O(clock_base));
  LUT1 #(
    .INIT(2'h1)) 
    \r_reg[0]_i_1__5 
       (.I0(\r_reg_reg_n_0_[0] ),
        .O(\r_reg[0]_i_1__5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_reg[1]_i_1__4 
       (.I0(\r_reg_reg_n_0_[0] ),
        .I1(clock_base_4),
        .O(\r_reg[1]_i_1__4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
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

  wire Q_reg;
  wire [5:0]last_count_int;
  wire [5:0]r_next;
  wire rx_fifo_last_int;
  wire \slv_reg0_reg[31] ;

  LUT6 #(
    .INIT(64'h8000000000000000)) 
    Q_i_1__1
       (.I0(last_count_int[5]),
        .I1(last_count_int[0]),
        .I2(last_count_int[2]),
        .I3(last_count_int[1]),
        .I4(last_count_int[4]),
        .I5(last_count_int[3]),
        .O(rx_fifo_last_int));
  LUT1 #(
    .INIT(2'h1)) 
    \r_reg[0]_i_1__4 
       (.I0(last_count_int[0]),
        .O(r_next[0]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
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
endmodule

(* ORIG_REF_NAME = "upCounter8Bits" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_10
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
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_reg[1]_i_1__0 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(r_next__1[1]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \r_reg[2]_i_1__0 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(r_next__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_reg[3]_i_1__0 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(r_next__1[3]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_reg[6]_i_1__0 
       (.I0(\r_reg[7]_i_2__0_n_0 ),
        .I1(Q[6]),
        .O(r_next__1[6]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
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
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_11
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
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_reg[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(r_next__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \r_reg[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(r_next__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_reg[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(r_next__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_reg[6]_i_1 
       (.I0(\r_reg[7]_i_2_n_0 ),
        .I1(Q[6]),
        .O(r_next__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
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

(* ORIG_REF_NAME = "upCounter8Bits" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_8
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
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_reg[1]_i_1__2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(r_next__3[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \r_reg[2]_i_1__2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(r_next__3[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_reg[3]_i_1__2 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(r_next__3[3]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_reg[6]_i_1__2 
       (.I0(\r_reg[7]_i_2__2_n_0 ),
        .I1(Q[6]),
        .O(r_next__3[6]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
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
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upCounter8Bits_9
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
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_reg[1]_i_1__1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(r_next__2[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \r_reg[2]_i_1__1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(r_next__2[2]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_reg[3]_i_1__1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(r_next__2[3]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_reg[6]_i_1__1 
       (.I0(\r_reg[7]_i_2__1_n_0 ),
        .I1(Q[6]),
        .O(r_next__2[6]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
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
