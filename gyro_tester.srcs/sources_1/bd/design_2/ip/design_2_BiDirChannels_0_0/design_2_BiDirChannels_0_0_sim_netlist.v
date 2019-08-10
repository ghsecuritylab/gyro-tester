// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Fri Aug  9 00:58:58 2019
// Host        : LAPTOP-FM91H59Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top design_2_BiDirChannels_0_0 -prefix
//               design_2_BiDirChannels_0_0_ design_2_BiDirChannels_0_0_sim_netlist.v
// Design      : design_2_BiDirChannels_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_2_BiDirChannels_0_0_BiDirChannels_v1_0
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
    SYNCK,
    s00_axis_tready,
    HS_Clock,
    HSI_DAM,
    HSI_DBM,
    HSI_DBP,
    HSI_DAP,
    HSI_DC,
    s00_axi_rdata,
    m00_axis_tdata,
    s00_axi_aclk,
    CLK,
    clk0,
    s00_axis_tvalid,
    HSI_A0,
    HSI_A1,
    s00_axi_aresetn,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_bready,
    s00_axi_arvalid,
    s00_axi_rready,
    s00_axis_tdata,
    s00_axi_awaddr,
    s00_axi_wdata,
    s00_axi_araddr,
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
  output SYNCK;
  output s00_axis_tready;
  output HS_Clock;
  output HSI_DAM;
  output HSI_DBM;
  output HSI_DBP;
  output HSI_DAP;
  output HSI_DC;
  output [31:0]s00_axi_rdata;
  output [31:0]m00_axis_tdata;
  input s00_axi_aclk;
  input CLK;
  input clk0;
  input s00_axis_tvalid;
  input HSI_A0;
  input HSI_A1;
  input s00_axi_aresetn;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input s00_axi_bready;
  input s00_axi_arvalid;
  input s00_axi_rready;
  input [31:0]s00_axis_tdata;
  input [1:0]s00_axi_awaddr;
  input [31:0]s00_axi_wdata;
  input [1:0]s00_axi_araddr;
  input [3:0]s00_axi_wstrb;

  wire BiDirChannels_v1_0_S00_AXI_inst_n_11;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_12;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_13;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_22;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_23;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_24;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_25;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_26;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_27;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_28;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_29;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_30;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_31;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_32;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_33;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_34;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_35;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_36;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_37;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_38;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_39;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_40;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_41;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_42;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_43;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_44;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_45;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_46;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_47;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_48;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_49;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_50;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_51;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_52;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_53;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_54;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_55;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_56;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_57;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_58;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_59;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_60;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_61;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_62;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_63;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_64;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_65;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_66;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_67;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_68;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_69;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_70;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_71;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_72;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_73;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_74;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_75;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_76;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_77;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_78;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_79;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_80;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_81;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_82;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_83;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_84;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_85;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_86;
  wire BiDirChannels_v1_0_S00_AXI_inst_n_87;
  wire CLK;
  wire D;
  wire HSI_A0;
  wire HSI_A1;
  wire HSI_DAM;
  wire HSI_DAP;
  wire HSI_DBM;
  wire HSI_DBP;
  wire HSI_DC;
  wire HS_Clock;
  wire MCK;
  wire MCK_N;
  wire MCK_P;
  wire SYNCK;
  wire X1_n_5;
  wire clk0;
  wire clock_div_2;
  wire clock_div_4;
  wire [31:28]data_word_0;
  wire data_word_2;
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
  wire [2:0]sel0;

  design_2_BiDirChannels_0_0_BiDirChannels_v1_0_S00_AXI BiDirChannels_v1_0_S00_AXI_inst
       (.D(hs_data_in_int),
        .HSI_A0(HSI_A0),
        .HSI_A1(HSI_A1),
        .HSI_DAM(HSI_DAM),
        .HSI_DAP(HSI_DAP),
        .HSI_DBM(HSI_DBM),
        .HSI_DBP(HSI_DBP),
        .HSI_DC(HSI_DC),
        .MCK(MCK),
        .Q(hs_data_out_int),
        .Q_reg({data_word_0[31],data_word_0[28],sel0,BiDirChannels_v1_0_S00_AXI_inst_n_11,BiDirChannels_v1_0_S00_AXI_inst_n_12,BiDirChannels_v1_0_S00_AXI_inst_n_13}),
        .Q_reg_0(D),
        .Q_reg_1(BiDirChannels_v1_0_S00_AXI_inst_n_22),
        .Q_reg_2(BiDirChannels_v1_0_S00_AXI_inst_n_23),
        .Q_reg_3(X1_n_5),
        .\axi_rdata_reg[0]_0 (data_word_2),
        .clock_div_2(clock_div_2),
        .\r_reg_reg[0]_P (BiDirChannels_v1_0_S00_AXI_inst_n_56),
        .\r_reg_reg[10]_C (BiDirChannels_v1_0_S00_AXI_inst_n_45),
        .\r_reg_reg[10]_P (BiDirChannels_v1_0_S00_AXI_inst_n_66),
        .\r_reg_reg[11]_C (BiDirChannels_v1_0_S00_AXI_inst_n_44),
        .\r_reg_reg[11]_P (BiDirChannels_v1_0_S00_AXI_inst_n_67),
        .\r_reg_reg[12]_C (BiDirChannels_v1_0_S00_AXI_inst_n_43),
        .\r_reg_reg[12]_P (BiDirChannels_v1_0_S00_AXI_inst_n_68),
        .\r_reg_reg[13]_C (BiDirChannels_v1_0_S00_AXI_inst_n_42),
        .\r_reg_reg[13]_P (BiDirChannels_v1_0_S00_AXI_inst_n_69),
        .\r_reg_reg[14]_C (BiDirChannels_v1_0_S00_AXI_inst_n_41),
        .\r_reg_reg[14]_P (BiDirChannels_v1_0_S00_AXI_inst_n_70),
        .\r_reg_reg[15]_C (BiDirChannels_v1_0_S00_AXI_inst_n_40),
        .\r_reg_reg[15]_P (BiDirChannels_v1_0_S00_AXI_inst_n_71),
        .\r_reg_reg[16]_C (BiDirChannels_v1_0_S00_AXI_inst_n_39),
        .\r_reg_reg[16]_P (BiDirChannels_v1_0_S00_AXI_inst_n_72),
        .\r_reg_reg[17]_C (BiDirChannels_v1_0_S00_AXI_inst_n_38),
        .\r_reg_reg[17]_P (BiDirChannels_v1_0_S00_AXI_inst_n_73),
        .\r_reg_reg[18]_C (BiDirChannels_v1_0_S00_AXI_inst_n_37),
        .\r_reg_reg[18]_P (BiDirChannels_v1_0_S00_AXI_inst_n_74),
        .\r_reg_reg[19]_C (BiDirChannels_v1_0_S00_AXI_inst_n_36),
        .\r_reg_reg[19]_P (BiDirChannels_v1_0_S00_AXI_inst_n_75),
        .\r_reg_reg[1]_C (BiDirChannels_v1_0_S00_AXI_inst_n_54),
        .\r_reg_reg[1]_P (BiDirChannels_v1_0_S00_AXI_inst_n_55),
        .\r_reg_reg[1]_P_0 (BiDirChannels_v1_0_S00_AXI_inst_n_57),
        .\r_reg_reg[20]_C (BiDirChannels_v1_0_S00_AXI_inst_n_35),
        .\r_reg_reg[20]_P (BiDirChannels_v1_0_S00_AXI_inst_n_76),
        .\r_reg_reg[21]_C (BiDirChannels_v1_0_S00_AXI_inst_n_34),
        .\r_reg_reg[21]_P (BiDirChannels_v1_0_S00_AXI_inst_n_77),
        .\r_reg_reg[22]_C (BiDirChannels_v1_0_S00_AXI_inst_n_33),
        .\r_reg_reg[22]_P (BiDirChannels_v1_0_S00_AXI_inst_n_78),
        .\r_reg_reg[23]_C (BiDirChannels_v1_0_S00_AXI_inst_n_32),
        .\r_reg_reg[23]_P (BiDirChannels_v1_0_S00_AXI_inst_n_79),
        .\r_reg_reg[24]_C (BiDirChannels_v1_0_S00_AXI_inst_n_31),
        .\r_reg_reg[24]_P (BiDirChannels_v1_0_S00_AXI_inst_n_80),
        .\r_reg_reg[25]_C (BiDirChannels_v1_0_S00_AXI_inst_n_30),
        .\r_reg_reg[25]_P (BiDirChannels_v1_0_S00_AXI_inst_n_81),
        .\r_reg_reg[26]_C (BiDirChannels_v1_0_S00_AXI_inst_n_29),
        .\r_reg_reg[26]_P (BiDirChannels_v1_0_S00_AXI_inst_n_82),
        .\r_reg_reg[27]_C (BiDirChannels_v1_0_S00_AXI_inst_n_28),
        .\r_reg_reg[27]_P (BiDirChannels_v1_0_S00_AXI_inst_n_83),
        .\r_reg_reg[28]_C (BiDirChannels_v1_0_S00_AXI_inst_n_27),
        .\r_reg_reg[28]_P (BiDirChannels_v1_0_S00_AXI_inst_n_84),
        .\r_reg_reg[29]_C (BiDirChannels_v1_0_S00_AXI_inst_n_26),
        .\r_reg_reg[29]_P (BiDirChannels_v1_0_S00_AXI_inst_n_85),
        .\r_reg_reg[2]_C (BiDirChannels_v1_0_S00_AXI_inst_n_53),
        .\r_reg_reg[2]_P (BiDirChannels_v1_0_S00_AXI_inst_n_58),
        .\r_reg_reg[30]_C (BiDirChannels_v1_0_S00_AXI_inst_n_25),
        .\r_reg_reg[30]_P (BiDirChannels_v1_0_S00_AXI_inst_n_86),
        .\r_reg_reg[31]_C (BiDirChannels_v1_0_S00_AXI_inst_n_24),
        .\r_reg_reg[31]_P (BiDirChannels_v1_0_S00_AXI_inst_n_87),
        .\r_reg_reg[3]_C (BiDirChannels_v1_0_S00_AXI_inst_n_52),
        .\r_reg_reg[3]_P (BiDirChannels_v1_0_S00_AXI_inst_n_59),
        .\r_reg_reg[4]_C (BiDirChannels_v1_0_S00_AXI_inst_n_51),
        .\r_reg_reg[4]_P (BiDirChannels_v1_0_S00_AXI_inst_n_60),
        .\r_reg_reg[5]_C (BiDirChannels_v1_0_S00_AXI_inst_n_50),
        .\r_reg_reg[5]_P (BiDirChannels_v1_0_S00_AXI_inst_n_61),
        .\r_reg_reg[6]_C (BiDirChannels_v1_0_S00_AXI_inst_n_49),
        .\r_reg_reg[6]_P (BiDirChannels_v1_0_S00_AXI_inst_n_62),
        .\r_reg_reg[7]_C (BiDirChannels_v1_0_S00_AXI_inst_n_48),
        .\r_reg_reg[7]_P (BiDirChannels_v1_0_S00_AXI_inst_n_63),
        .\r_reg_reg[8]_C (BiDirChannels_v1_0_S00_AXI_inst_n_47),
        .\r_reg_reg[8]_P (BiDirChannels_v1_0_S00_AXI_inst_n_64),
        .\r_reg_reg[9]_C (BiDirChannels_v1_0_S00_AXI_inst_n_46),
        .\r_reg_reg[9]_P (BiDirChannels_v1_0_S00_AXI_inst_n_65),
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
        .s00_axi_wvalid(s00_axi_wvalid),
        .s00_axis_tdata(s00_axis_tdata));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* XILINX_LEGACY_PRIM = "OBUFDS" *) 
  OBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    OBUFDS_inst
       (.I(MCK),
        .O(MCK_P),
        .OB(MCK_N));
  design_2_BiDirChannels_0_0_GyroInputOutputSerializer X1
       (.CLK(CLK),
        .D(hs_data_in_int),
        .HS_Clock(HS_Clock),
        .Q_reg(clock_div_4),
        .SYNCK(SYNCK),
        .clk0(clk0),
        .clock_div_2(clock_div_2),
        .m00_axis_tdata(m00_axis_tdata),
        .m00_axis_tlast(m00_axis_tlast),
        .m00_axis_tvalid(m00_axis_tvalid),
        .\r_reg_reg[0] (hs_data_out_int),
        .\r_reg_reg[32] (X1_n_5),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axis_tready(s00_axis_tready),
        .s00_axis_tvalid(s00_axis_tvalid),
        .\slv_reg0_reg[12] (BiDirChannels_v1_0_S00_AXI_inst_n_22),
        .\slv_reg0_reg[31] (BiDirChannels_v1_0_S00_AXI_inst_n_23),
        .\slv_reg0_reg[31]_0 (BiDirChannels_v1_0_S00_AXI_inst_n_87),
        .\slv_reg0_reg[31]_1 (BiDirChannels_v1_0_S00_AXI_inst_n_24),
        .\slv_reg0_reg[31]_10 (BiDirChannels_v1_0_S00_AXI_inst_n_82),
        .\slv_reg0_reg[31]_11 (BiDirChannels_v1_0_S00_AXI_inst_n_29),
        .\slv_reg0_reg[31]_12 (BiDirChannels_v1_0_S00_AXI_inst_n_81),
        .\slv_reg0_reg[31]_13 (BiDirChannels_v1_0_S00_AXI_inst_n_30),
        .\slv_reg0_reg[31]_14 (BiDirChannels_v1_0_S00_AXI_inst_n_80),
        .\slv_reg0_reg[31]_15 (BiDirChannels_v1_0_S00_AXI_inst_n_31),
        .\slv_reg0_reg[31]_16 (BiDirChannels_v1_0_S00_AXI_inst_n_79),
        .\slv_reg0_reg[31]_17 (BiDirChannels_v1_0_S00_AXI_inst_n_32),
        .\slv_reg0_reg[31]_18 (BiDirChannels_v1_0_S00_AXI_inst_n_78),
        .\slv_reg0_reg[31]_19 (BiDirChannels_v1_0_S00_AXI_inst_n_33),
        .\slv_reg0_reg[31]_2 (BiDirChannels_v1_0_S00_AXI_inst_n_86),
        .\slv_reg0_reg[31]_20 (BiDirChannels_v1_0_S00_AXI_inst_n_77),
        .\slv_reg0_reg[31]_21 (BiDirChannels_v1_0_S00_AXI_inst_n_34),
        .\slv_reg0_reg[31]_22 (BiDirChannels_v1_0_S00_AXI_inst_n_76),
        .\slv_reg0_reg[31]_23 (BiDirChannels_v1_0_S00_AXI_inst_n_35),
        .\slv_reg0_reg[31]_24 (BiDirChannels_v1_0_S00_AXI_inst_n_75),
        .\slv_reg0_reg[31]_25 (BiDirChannels_v1_0_S00_AXI_inst_n_36),
        .\slv_reg0_reg[31]_26 (BiDirChannels_v1_0_S00_AXI_inst_n_74),
        .\slv_reg0_reg[31]_27 (BiDirChannels_v1_0_S00_AXI_inst_n_37),
        .\slv_reg0_reg[31]_28 (BiDirChannels_v1_0_S00_AXI_inst_n_73),
        .\slv_reg0_reg[31]_29 (BiDirChannels_v1_0_S00_AXI_inst_n_38),
        .\slv_reg0_reg[31]_3 (BiDirChannels_v1_0_S00_AXI_inst_n_25),
        .\slv_reg0_reg[31]_30 (BiDirChannels_v1_0_S00_AXI_inst_n_72),
        .\slv_reg0_reg[31]_31 (BiDirChannels_v1_0_S00_AXI_inst_n_39),
        .\slv_reg0_reg[31]_32 (BiDirChannels_v1_0_S00_AXI_inst_n_71),
        .\slv_reg0_reg[31]_33 (BiDirChannels_v1_0_S00_AXI_inst_n_40),
        .\slv_reg0_reg[31]_34 (BiDirChannels_v1_0_S00_AXI_inst_n_70),
        .\slv_reg0_reg[31]_35 (BiDirChannels_v1_0_S00_AXI_inst_n_41),
        .\slv_reg0_reg[31]_36 (BiDirChannels_v1_0_S00_AXI_inst_n_69),
        .\slv_reg0_reg[31]_37 (BiDirChannels_v1_0_S00_AXI_inst_n_42),
        .\slv_reg0_reg[31]_38 (BiDirChannels_v1_0_S00_AXI_inst_n_68),
        .\slv_reg0_reg[31]_39 (BiDirChannels_v1_0_S00_AXI_inst_n_43),
        .\slv_reg0_reg[31]_4 (BiDirChannels_v1_0_S00_AXI_inst_n_85),
        .\slv_reg0_reg[31]_40 (BiDirChannels_v1_0_S00_AXI_inst_n_67),
        .\slv_reg0_reg[31]_41 (BiDirChannels_v1_0_S00_AXI_inst_n_44),
        .\slv_reg0_reg[31]_42 (BiDirChannels_v1_0_S00_AXI_inst_n_66),
        .\slv_reg0_reg[31]_43 (BiDirChannels_v1_0_S00_AXI_inst_n_45),
        .\slv_reg0_reg[31]_44 (BiDirChannels_v1_0_S00_AXI_inst_n_65),
        .\slv_reg0_reg[31]_45 (BiDirChannels_v1_0_S00_AXI_inst_n_46),
        .\slv_reg0_reg[31]_46 (BiDirChannels_v1_0_S00_AXI_inst_n_64),
        .\slv_reg0_reg[31]_47 (BiDirChannels_v1_0_S00_AXI_inst_n_47),
        .\slv_reg0_reg[31]_48 (BiDirChannels_v1_0_S00_AXI_inst_n_63),
        .\slv_reg0_reg[31]_49 (BiDirChannels_v1_0_S00_AXI_inst_n_48),
        .\slv_reg0_reg[31]_5 (BiDirChannels_v1_0_S00_AXI_inst_n_26),
        .\slv_reg0_reg[31]_50 (BiDirChannels_v1_0_S00_AXI_inst_n_62),
        .\slv_reg0_reg[31]_51 (BiDirChannels_v1_0_S00_AXI_inst_n_49),
        .\slv_reg0_reg[31]_52 (BiDirChannels_v1_0_S00_AXI_inst_n_61),
        .\slv_reg0_reg[31]_53 (BiDirChannels_v1_0_S00_AXI_inst_n_50),
        .\slv_reg0_reg[31]_54 (BiDirChannels_v1_0_S00_AXI_inst_n_60),
        .\slv_reg0_reg[31]_55 (BiDirChannels_v1_0_S00_AXI_inst_n_51),
        .\slv_reg0_reg[31]_56 (BiDirChannels_v1_0_S00_AXI_inst_n_59),
        .\slv_reg0_reg[31]_57 (BiDirChannels_v1_0_S00_AXI_inst_n_52),
        .\slv_reg0_reg[31]_58 (BiDirChannels_v1_0_S00_AXI_inst_n_58),
        .\slv_reg0_reg[31]_59 (BiDirChannels_v1_0_S00_AXI_inst_n_53),
        .\slv_reg0_reg[31]_6 (BiDirChannels_v1_0_S00_AXI_inst_n_84),
        .\slv_reg0_reg[31]_60 (BiDirChannels_v1_0_S00_AXI_inst_n_57),
        .\slv_reg0_reg[31]_61 (BiDirChannels_v1_0_S00_AXI_inst_n_54),
        .\slv_reg0_reg[31]_62 (BiDirChannels_v1_0_S00_AXI_inst_n_56),
        .\slv_reg0_reg[31]_63 (BiDirChannels_v1_0_S00_AXI_inst_n_55),
        .\slv_reg0_reg[31]_64 ({data_word_0[31],data_word_0[28],sel0,BiDirChannels_v1_0_S00_AXI_inst_n_11,BiDirChannels_v1_0_S00_AXI_inst_n_12,BiDirChannels_v1_0_S00_AXI_inst_n_13}),
        .\slv_reg0_reg[31]_7 (BiDirChannels_v1_0_S00_AXI_inst_n_27),
        .\slv_reg0_reg[31]_8 (BiDirChannels_v1_0_S00_AXI_inst_n_83),
        .\slv_reg0_reg[31]_9 (BiDirChannels_v1_0_S00_AXI_inst_n_28),
        .\slv_reg1_reg[4] (D),
        .\slv_reg2_reg[0] (data_word_2));
endmodule

module design_2_BiDirChannels_0_0_BiDirChannels_v1_0_S00_AXI
   (s00_axi_awready,
    s00_axi_wready,
    s00_axi_arready,
    s00_axi_bvalid,
    s00_axi_rvalid,
    D,
    Q_reg,
    HSI_DAM,
    \axi_rdata_reg[0]_0 ,
    HSI_DBM,
    HSI_DBP,
    HSI_DAP,
    HSI_DC,
    MCK,
    Q_reg_0,
    Q_reg_1,
    Q_reg_2,
    \r_reg_reg[31]_C ,
    \r_reg_reg[30]_C ,
    \r_reg_reg[29]_C ,
    \r_reg_reg[28]_C ,
    \r_reg_reg[27]_C ,
    \r_reg_reg[26]_C ,
    \r_reg_reg[25]_C ,
    \r_reg_reg[24]_C ,
    \r_reg_reg[23]_C ,
    \r_reg_reg[22]_C ,
    \r_reg_reg[21]_C ,
    \r_reg_reg[20]_C ,
    \r_reg_reg[19]_C ,
    \r_reg_reg[18]_C ,
    \r_reg_reg[17]_C ,
    \r_reg_reg[16]_C ,
    \r_reg_reg[15]_C ,
    \r_reg_reg[14]_C ,
    \r_reg_reg[13]_C ,
    \r_reg_reg[12]_C ,
    \r_reg_reg[11]_C ,
    \r_reg_reg[10]_C ,
    \r_reg_reg[9]_C ,
    \r_reg_reg[8]_C ,
    \r_reg_reg[7]_C ,
    \r_reg_reg[6]_C ,
    \r_reg_reg[5]_C ,
    \r_reg_reg[4]_C ,
    \r_reg_reg[3]_C ,
    \r_reg_reg[2]_C ,
    \r_reg_reg[1]_C ,
    \r_reg_reg[1]_P ,
    \r_reg_reg[0]_P ,
    \r_reg_reg[1]_P_0 ,
    \r_reg_reg[2]_P ,
    \r_reg_reg[3]_P ,
    \r_reg_reg[4]_P ,
    \r_reg_reg[5]_P ,
    \r_reg_reg[6]_P ,
    \r_reg_reg[7]_P ,
    \r_reg_reg[8]_P ,
    \r_reg_reg[9]_P ,
    \r_reg_reg[10]_P ,
    \r_reg_reg[11]_P ,
    \r_reg_reg[12]_P ,
    \r_reg_reg[13]_P ,
    \r_reg_reg[14]_P ,
    \r_reg_reg[15]_P ,
    \r_reg_reg[16]_P ,
    \r_reg_reg[17]_P ,
    \r_reg_reg[18]_P ,
    \r_reg_reg[19]_P ,
    \r_reg_reg[20]_P ,
    \r_reg_reg[21]_P ,
    \r_reg_reg[22]_P ,
    \r_reg_reg[23]_P ,
    \r_reg_reg[24]_P ,
    \r_reg_reg[25]_P ,
    \r_reg_reg[26]_P ,
    \r_reg_reg[27]_P ,
    \r_reg_reg[28]_P ,
    \r_reg_reg[29]_P ,
    \r_reg_reg[30]_P ,
    \r_reg_reg[31]_P ,
    s00_axi_rdata,
    s00_axi_aclk,
    Q,
    HSI_A0,
    HSI_A1,
    clock_div_2,
    s00_axi_aresetn,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_bready,
    s00_axi_arvalid,
    s00_axi_rready,
    s00_axis_tdata,
    Q_reg_3,
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
  output [7:0]Q_reg;
  output HSI_DAM;
  output [0:0]\axi_rdata_reg[0]_0 ;
  output HSI_DBM;
  output HSI_DBP;
  output HSI_DAP;
  output HSI_DC;
  output MCK;
  output [0:0]Q_reg_0;
  output Q_reg_1;
  output Q_reg_2;
  output \r_reg_reg[31]_C ;
  output \r_reg_reg[30]_C ;
  output \r_reg_reg[29]_C ;
  output \r_reg_reg[28]_C ;
  output \r_reg_reg[27]_C ;
  output \r_reg_reg[26]_C ;
  output \r_reg_reg[25]_C ;
  output \r_reg_reg[24]_C ;
  output \r_reg_reg[23]_C ;
  output \r_reg_reg[22]_C ;
  output \r_reg_reg[21]_C ;
  output \r_reg_reg[20]_C ;
  output \r_reg_reg[19]_C ;
  output \r_reg_reg[18]_C ;
  output \r_reg_reg[17]_C ;
  output \r_reg_reg[16]_C ;
  output \r_reg_reg[15]_C ;
  output \r_reg_reg[14]_C ;
  output \r_reg_reg[13]_C ;
  output \r_reg_reg[12]_C ;
  output \r_reg_reg[11]_C ;
  output \r_reg_reg[10]_C ;
  output \r_reg_reg[9]_C ;
  output \r_reg_reg[8]_C ;
  output \r_reg_reg[7]_C ;
  output \r_reg_reg[6]_C ;
  output \r_reg_reg[5]_C ;
  output \r_reg_reg[4]_C ;
  output \r_reg_reg[3]_C ;
  output \r_reg_reg[2]_C ;
  output \r_reg_reg[1]_C ;
  output \r_reg_reg[1]_P ;
  output \r_reg_reg[0]_P ;
  output \r_reg_reg[1]_P_0 ;
  output \r_reg_reg[2]_P ;
  output \r_reg_reg[3]_P ;
  output \r_reg_reg[4]_P ;
  output \r_reg_reg[5]_P ;
  output \r_reg_reg[6]_P ;
  output \r_reg_reg[7]_P ;
  output \r_reg_reg[8]_P ;
  output \r_reg_reg[9]_P ;
  output \r_reg_reg[10]_P ;
  output \r_reg_reg[11]_P ;
  output \r_reg_reg[12]_P ;
  output \r_reg_reg[13]_P ;
  output \r_reg_reg[14]_P ;
  output \r_reg_reg[15]_P ;
  output \r_reg_reg[16]_P ;
  output \r_reg_reg[17]_P ;
  output \r_reg_reg[18]_P ;
  output \r_reg_reg[19]_P ;
  output \r_reg_reg[20]_P ;
  output \r_reg_reg[21]_P ;
  output \r_reg_reg[22]_P ;
  output \r_reg_reg[23]_P ;
  output \r_reg_reg[24]_P ;
  output \r_reg_reg[25]_P ;
  output \r_reg_reg[26]_P ;
  output \r_reg_reg[27]_P ;
  output \r_reg_reg[28]_P ;
  output \r_reg_reg[29]_P ;
  output \r_reg_reg[30]_P ;
  output \r_reg_reg[31]_P ;
  output [31:0]s00_axi_rdata;
  input s00_axi_aclk;
  input [0:0]Q;
  input HSI_A0;
  input HSI_A1;
  input clock_div_2;
  input s00_axi_aresetn;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input s00_axi_bready;
  input s00_axi_arvalid;
  input s00_axi_rready;
  input [31:0]s00_axis_tdata;
  input Q_reg_3;
  input [1:0]s00_axi_awaddr;
  input [31:0]s00_axi_wdata;
  input [1:0]s00_axi_araddr;
  input [3:0]s00_axi_wstrb;

  wire [0:0]D;
  wire HSI_A0;
  wire HSI_A1;
  wire HSI_DAM;
  wire HSI_DAP;
  wire HSI_DBM;
  wire HSI_DBP;
  wire HSI_DC;
  wire MCK;
  wire [0:0]Q;
  wire [7:0]Q_reg;
  wire [0:0]Q_reg_0;
  wire Q_reg_1;
  wire Q_reg_2;
  wire Q_reg_3;
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
  wire [0:0]\axi_rdata_reg[0]_0 ;
  wire axi_rvalid_i_1_n_0;
  wire axi_wready0;
  wire clock_div_2;
  wire [24:0]data_word_0;
  wire [1:0]p_0_in;
  wire [28:0]p_1_in;
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
  wire [31:0]s00_axis_tdata;
  wire \slv_reg0_reg_n_0_[10] ;
  wire \slv_reg0_reg_n_0_[11] ;
  wire \slv_reg0_reg_n_0_[15] ;
  wire \slv_reg0_reg_n_0_[19] ;
  wire \slv_reg0_reg_n_0_[20] ;
  wire \slv_reg0_reg_n_0_[21] ;
  wire \slv_reg0_reg_n_0_[22] ;
  wire \slv_reg0_reg_n_0_[23] ;
  wire \slv_reg0_reg_n_0_[25] ;
  wire \slv_reg0_reg_n_0_[26] ;
  wire \slv_reg0_reg_n_0_[27] ;
  wire \slv_reg0_reg_n_0_[29] ;
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
  wire \slv_reg1_reg_n_0_[0] ;
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
  wire \slv_reg2[15]_i_1_n_0 ;
  wire \slv_reg2[23]_i_1_n_0 ;
  wire \slv_reg2[31]_i_1_n_0 ;
  wire \slv_reg2[7]_i_1_n_0 ;
  wire \slv_reg2_reg_n_0_[10] ;
  wire \slv_reg2_reg_n_0_[11] ;
  wire \slv_reg2_reg_n_0_[12] ;
  wire \slv_reg2_reg_n_0_[13] ;
  wire \slv_reg2_reg_n_0_[14] ;
  wire \slv_reg2_reg_n_0_[15] ;
  wire \slv_reg2_reg_n_0_[16] ;
  wire \slv_reg2_reg_n_0_[17] ;
  wire \slv_reg2_reg_n_0_[18] ;
  wire \slv_reg2_reg_n_0_[19] ;
  wire \slv_reg2_reg_n_0_[1] ;
  wire \slv_reg2_reg_n_0_[20] ;
  wire \slv_reg2_reg_n_0_[21] ;
  wire \slv_reg2_reg_n_0_[22] ;
  wire \slv_reg2_reg_n_0_[23] ;
  wire \slv_reg2_reg_n_0_[24] ;
  wire \slv_reg2_reg_n_0_[25] ;
  wire \slv_reg2_reg_n_0_[26] ;
  wire \slv_reg2_reg_n_0_[27] ;
  wire \slv_reg2_reg_n_0_[28] ;
  wire \slv_reg2_reg_n_0_[29] ;
  wire \slv_reg2_reg_n_0_[2] ;
  wire \slv_reg2_reg_n_0_[30] ;
  wire \slv_reg2_reg_n_0_[31] ;
  wire \slv_reg2_reg_n_0_[3] ;
  wire \slv_reg2_reg_n_0_[4] ;
  wire \slv_reg2_reg_n_0_[5] ;
  wire \slv_reg2_reg_n_0_[6] ;
  wire \slv_reg2_reg_n_0_[7] ;
  wire \slv_reg2_reg_n_0_[8] ;
  wire \slv_reg2_reg_n_0_[9] ;
  wire slv_reg_rden__0;
  wire slv_reg_wren__0;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00004000)) 
    HSI_DAM_INST_0
       (.I0(data_word_0[2]),
        .I1(Q),
        .I2(data_word_0[0]),
        .I3(\axi_rdata_reg[0]_0 ),
        .I4(data_word_0[1]),
        .O(HSI_DAM));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00000400)) 
    HSI_DAP_INST_0
       (.I0(data_word_0[2]),
        .I1(Q),
        .I2(data_word_0[0]),
        .I3(\axi_rdata_reg[0]_0 ),
        .I4(data_word_0[1]),
        .O(HSI_DAP));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h08000000)) 
    HSI_DBM_INST_0
       (.I0(data_word_0[1]),
        .I1(Q),
        .I2(data_word_0[2]),
        .I3(\axi_rdata_reg[0]_0 ),
        .I4(data_word_0[0]),
        .O(HSI_DBM));
  LUT5 #(
    .INIT(32'h00000800)) 
    HSI_DBP_INST_0
       (.I0(data_word_0[1]),
        .I1(Q),
        .I2(data_word_0[2]),
        .I3(\axi_rdata_reg[0]_0 ),
        .I4(data_word_0[0]),
        .O(HSI_DBP));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h04000000)) 
    HSI_DC_INST_0
       (.I0(data_word_0[0]),
        .I1(\axi_rdata_reg[0]_0 ),
        .I2(data_word_0[1]),
        .I3(Q),
        .I4(data_word_0[2]),
        .O(HSI_DC));
  LUT2 #(
    .INIT(4'h8)) 
    OBUFDS_inst_i_1
       (.I0(\axi_rdata_reg[0]_0 ),
        .I1(clock_div_2),
        .O(MCK));
  LUT2 #(
    .INIT(4'h8)) 
    Q_i_6
       (.I0(Q_reg[0]),
        .I1(Q_reg[1]),
        .O(Q_reg_1));
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
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
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
       (.I0(\slv_reg1_reg_n_0_[0] ),
        .I1(axi_araddr[2]),
        .I2(\axi_rdata_reg[0]_0 ),
        .I3(axi_araddr[3]),
        .I4(data_word_0[0]),
        .O(reg_data_out[0]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[10]_i_1 
       (.I0(\slv_reg1_reg_n_0_[10] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[10] ),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[10] ),
        .O(reg_data_out[10]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[11]_i_1 
       (.I0(\slv_reg1_reg_n_0_[11] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[11] ),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[11] ),
        .O(reg_data_out[11]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[12]_i_1 
       (.I0(\slv_reg1_reg_n_0_[12] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[12] ),
        .I3(axi_araddr[3]),
        .I4(Q_reg[0]),
        .O(reg_data_out[12]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[13]_i_1 
       (.I0(\slv_reg1_reg_n_0_[13] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[13] ),
        .I3(axi_araddr[3]),
        .I4(Q_reg[1]),
        .O(reg_data_out[13]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[14]_i_1 
       (.I0(\slv_reg1_reg_n_0_[14] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[14] ),
        .I3(axi_araddr[3]),
        .I4(Q_reg[2]),
        .O(reg_data_out[14]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[15]_i_1 
       (.I0(\slv_reg1_reg_n_0_[15] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[15] ),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[15] ),
        .O(reg_data_out[15]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[16]_i_1 
       (.I0(\slv_reg1_reg_n_0_[16] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[16] ),
        .I3(axi_araddr[3]),
        .I4(Q_reg[3]),
        .O(reg_data_out[16]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[17]_i_1 
       (.I0(\slv_reg1_reg_n_0_[17] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[17] ),
        .I3(axi_araddr[3]),
        .I4(Q_reg[4]),
        .O(reg_data_out[17]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[18]_i_1 
       (.I0(\slv_reg1_reg_n_0_[18] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[18] ),
        .I3(axi_araddr[3]),
        .I4(Q_reg[5]),
        .O(reg_data_out[18]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[19]_i_1 
       (.I0(\slv_reg1_reg_n_0_[19] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[19] ),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[19] ),
        .O(reg_data_out[19]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[1]_i_1 
       (.I0(\slv_reg1_reg_n_0_[1] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[1] ),
        .I3(axi_araddr[3]),
        .I4(data_word_0[1]),
        .O(reg_data_out[1]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[20]_i_1 
       (.I0(\slv_reg1_reg_n_0_[20] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[20] ),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[20] ),
        .O(reg_data_out[20]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[21]_i_1 
       (.I0(\slv_reg1_reg_n_0_[21] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[21] ),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[21] ),
        .O(reg_data_out[21]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[22]_i_1 
       (.I0(\slv_reg1_reg_n_0_[22] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[22] ),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[22] ),
        .O(reg_data_out[22]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[23]_i_1 
       (.I0(\slv_reg1_reg_n_0_[23] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[23] ),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[23] ),
        .O(reg_data_out[23]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[24]_i_1 
       (.I0(\slv_reg1_reg_n_0_[24] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[24] ),
        .I3(axi_araddr[3]),
        .I4(data_word_0[24]),
        .O(reg_data_out[24]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[25]_i_1 
       (.I0(\slv_reg1_reg_n_0_[25] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[25] ),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[25] ),
        .O(reg_data_out[25]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[26]_i_1 
       (.I0(\slv_reg1_reg_n_0_[26] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[26] ),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[26] ),
        .O(reg_data_out[26]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[27]_i_1 
       (.I0(\slv_reg1_reg_n_0_[27] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[27] ),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[27] ),
        .O(reg_data_out[27]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[28]_i_1 
       (.I0(\slv_reg1_reg_n_0_[28] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[28] ),
        .I3(axi_araddr[3]),
        .I4(Q_reg[6]),
        .O(reg_data_out[28]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[29]_i_1 
       (.I0(\slv_reg1_reg_n_0_[29] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[29] ),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[29] ),
        .O(reg_data_out[29]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[2]_i_1 
       (.I0(\slv_reg1_reg_n_0_[2] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[2] ),
        .I3(axi_araddr[3]),
        .I4(data_word_0[2]),
        .O(reg_data_out[2]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[30]_i_1 
       (.I0(\slv_reg1_reg_n_0_[30] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[30] ),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[30] ),
        .O(reg_data_out[30]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[31]_i_1 
       (.I0(\slv_reg1_reg_n_0_[31] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[31] ),
        .I3(axi_araddr[3]),
        .I4(Q_reg[7]),
        .O(reg_data_out[31]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[3]_i_1 
       (.I0(\slv_reg1_reg_n_0_[3] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[3] ),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[3] ),
        .O(reg_data_out[3]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[4]_i_1 
       (.I0(Q_reg_0),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[4] ),
        .I3(axi_araddr[3]),
        .I4(data_word_0[4]),
        .O(reg_data_out[4]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[5]_i_1 
       (.I0(\slv_reg1_reg_n_0_[5] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[5] ),
        .I3(axi_araddr[3]),
        .I4(data_word_0[5]),
        .O(reg_data_out[5]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[6]_i_1 
       (.I0(\slv_reg1_reg_n_0_[6] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[6] ),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[6] ),
        .O(reg_data_out[6]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[7]_i_1 
       (.I0(\slv_reg1_reg_n_0_[7] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[7] ),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[7] ),
        .O(reg_data_out[7]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[8]_i_1 
       (.I0(\slv_reg1_reg_n_0_[8] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[8] ),
        .I3(axi_araddr[3]),
        .I4(\slv_reg0_reg_n_0_[8] ),
        .O(reg_data_out[8]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \axi_rdata[9]_i_1 
       (.I0(\slv_reg1_reg_n_0_[9] ),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[9] ),
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
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
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
  LUT2 #(
    .INIT(4'hB)) 
    out_clock_int_i_2
       (.I0(Q_reg[7]),
        .I1(s00_axi_aresetn),
        .O(Q_reg_2));
  LUT6 #(
    .INIT(64'h88888888BBB888B8)) 
    \r_reg[0]_i_1 
       (.I0(Q),
        .I1(data_word_0[24]),
        .I2(HSI_A0),
        .I3(data_word_0[4]),
        .I4(HSI_A1),
        .I5(data_word_0[5]),
        .O(D));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[0]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[0]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[0]_P ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[0]_LDC_i_2 
       (.I0(s00_axis_tdata[0]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[1]_P ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[10]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[10]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[10]_P ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[10]_LDC_i_2 
       (.I0(s00_axis_tdata[10]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[10]_C ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[11]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[11]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[11]_P ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[11]_LDC_i_2 
       (.I0(s00_axis_tdata[11]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[11]_C ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[12]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[12]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[12]_P ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[12]_LDC_i_2 
       (.I0(s00_axis_tdata[12]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[12]_C ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[13]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[13]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[13]_P ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[13]_LDC_i_2 
       (.I0(s00_axis_tdata[13]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[13]_C ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[14]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[14]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[14]_P ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[14]_LDC_i_2 
       (.I0(s00_axis_tdata[14]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[14]_C ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[15]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[15]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[15]_P ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[15]_LDC_i_2 
       (.I0(s00_axis_tdata[15]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[15]_C ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[16]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[16]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[16]_P ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[16]_LDC_i_2 
       (.I0(s00_axis_tdata[16]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[16]_C ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[17]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[17]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[17]_P ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[17]_LDC_i_2 
       (.I0(s00_axis_tdata[17]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[17]_C ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[18]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[18]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[18]_P ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[18]_LDC_i_2 
       (.I0(s00_axis_tdata[18]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[18]_C ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[19]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[19]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[19]_P ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[19]_LDC_i_2 
       (.I0(s00_axis_tdata[19]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[19]_C ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[1]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[1]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[1]_P_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[1]_LDC_i_2 
       (.I0(s00_axis_tdata[1]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[1]_C ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[20]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[20]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[20]_P ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[20]_LDC_i_2 
       (.I0(s00_axis_tdata[20]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[20]_C ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[21]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[21]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[21]_P ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[21]_LDC_i_2 
       (.I0(s00_axis_tdata[21]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[21]_C ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[22]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[22]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[22]_P ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[22]_LDC_i_2 
       (.I0(s00_axis_tdata[22]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[22]_C ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[23]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[23]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[23]_P ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[23]_LDC_i_2 
       (.I0(s00_axis_tdata[23]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[23]_C ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[24]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[24]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[24]_P ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[24]_LDC_i_2 
       (.I0(s00_axis_tdata[24]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[24]_C ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[25]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[25]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[25]_P ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[25]_LDC_i_2 
       (.I0(s00_axis_tdata[25]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[25]_C ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[26]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[26]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[26]_P ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[26]_LDC_i_2 
       (.I0(s00_axis_tdata[26]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[26]_C ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[27]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[27]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[27]_P ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[27]_LDC_i_2 
       (.I0(s00_axis_tdata[27]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[27]_C ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[28]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[28]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[28]_P ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[28]_LDC_i_2 
       (.I0(s00_axis_tdata[28]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[28]_C ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[29]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[29]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[29]_P ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[29]_LDC_i_2 
       (.I0(s00_axis_tdata[29]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[29]_C ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[2]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[2]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[2]_P ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[2]_LDC_i_2 
       (.I0(s00_axis_tdata[2]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[2]_C ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[30]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[30]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[30]_P ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[30]_LDC_i_2 
       (.I0(s00_axis_tdata[30]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[30]_C ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[31]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[31]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[31]_P ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[31]_LDC_i_2 
       (.I0(s00_axis_tdata[31]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[31]_C ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[3]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[3]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[3]_P ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[3]_LDC_i_2 
       (.I0(s00_axis_tdata[3]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[3]_C ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[4]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[4]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[4]_P ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[4]_LDC_i_2 
       (.I0(s00_axis_tdata[4]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[4]_C ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[5]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[5]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[5]_P ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[5]_LDC_i_2 
       (.I0(s00_axis_tdata[5]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[5]_C ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[6]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[6]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[6]_P ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[6]_LDC_i_2 
       (.I0(s00_axis_tdata[6]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[6]_C ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[7]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[7]_P ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[7]_LDC_i_2 
       (.I0(s00_axis_tdata[7]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[7]_C ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[8]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[8]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[8]_P ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[8]_LDC_i_2 
       (.I0(s00_axis_tdata[8]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[8]_C ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_reg_reg[9]_LDC_i_1 
       (.I0(s00_axi_aresetn),
        .I1(Q_reg[7]),
        .I2(s00_axis_tdata[9]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[9]_P ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'hF3F7)) 
    \r_reg_reg[9]_LDC_i_2 
       (.I0(s00_axis_tdata[9]),
        .I1(s00_axi_aresetn),
        .I2(Q_reg[7]),
        .I3(Q_reg_3),
        .O(\r_reg_reg[9]_C ));
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
        .Q(Q_reg[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[13] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[13]),
        .Q(Q_reg[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[14] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[14]),
        .Q(Q_reg[2]),
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
        .Q(Q_reg[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[17] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[17]),
        .Q(Q_reg[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[18] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[18]),
        .Q(Q_reg[5]),
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
        .Q(Q_reg[6]),
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
        .Q(data_word_0[2]),
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
        .Q(Q_reg[7]),
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
        .Q(\slv_reg1_reg_n_0_[0] ),
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
        .Q(Q_reg_0),
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
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[1]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[2]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[3]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[0]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[7]_i_1_n_0 ));
  FDRE \slv_reg2_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\axi_rdata_reg[0]_0 ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\slv_reg2_reg_n_0_[10] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\slv_reg2_reg_n_0_[11] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\slv_reg2_reg_n_0_[12] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\slv_reg2_reg_n_0_[13] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\slv_reg2_reg_n_0_[14] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\slv_reg2_reg_n_0_[15] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\slv_reg2_reg_n_0_[16] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\slv_reg2_reg_n_0_[17] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\slv_reg2_reg_n_0_[18] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\slv_reg2_reg_n_0_[19] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\slv_reg2_reg_n_0_[1] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\slv_reg2_reg_n_0_[20] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\slv_reg2_reg_n_0_[21] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\slv_reg2_reg_n_0_[22] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\slv_reg2_reg_n_0_[23] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\slv_reg2_reg_n_0_[24] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\slv_reg2_reg_n_0_[25] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\slv_reg2_reg_n_0_[26] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\slv_reg2_reg_n_0_[27] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\slv_reg2_reg_n_0_[28] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\slv_reg2_reg_n_0_[29] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\slv_reg2_reg_n_0_[2] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\slv_reg2_reg_n_0_[30] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\slv_reg2_reg_n_0_[31] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\slv_reg2_reg_n_0_[3] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\slv_reg2_reg_n_0_[4] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\slv_reg2_reg_n_0_[5] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\slv_reg2_reg_n_0_[6] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\slv_reg2_reg_n_0_[7] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\slv_reg2_reg_n_0_[8] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\slv_reg2_reg_n_0_[9] ),
        .R(axi_awready_i_1_n_0));
  LUT3 #(
    .INIT(8'h20)) 
    slv_reg_rden
       (.I0(s00_axi_arvalid),
        .I1(s00_axi_rvalid),
        .I2(s00_axi_arready),
        .O(slv_reg_rden__0));
endmodule

module design_2_BiDirChannels_0_0_GyroInputOutputSerializer
   (clock_div_2,
    Q_reg,
    m00_axis_tlast,
    m00_axis_tvalid,
    SYNCK,
    \r_reg_reg[32] ,
    s00_axis_tready,
    HS_Clock,
    m00_axis_tdata,
    \r_reg_reg[0] ,
    \slv_reg1_reg[4] ,
    \slv_reg0_reg[31] ,
    CLK,
    s00_axi_aclk,
    clk0,
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
    \slv_reg0_reg[31]_63 ,
    s00_axis_tvalid,
    \slv_reg2_reg[0] ,
    \slv_reg0_reg[31]_64 ,
    \slv_reg0_reg[12] ,
    D,
    s00_axi_aresetn);
  output clock_div_2;
  output Q_reg;
  output m00_axis_tlast;
  output m00_axis_tvalid;
  output SYNCK;
  output \r_reg_reg[32] ;
  output s00_axis_tready;
  output HS_Clock;
  output [31:0]m00_axis_tdata;
  output [0:0]\r_reg_reg[0] ;
  input [0:0]\slv_reg1_reg[4] ;
  input \slv_reg0_reg[31] ;
  input CLK;
  input s00_axi_aclk;
  input clk0;
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
  input s00_axis_tvalid;
  input [0:0]\slv_reg2_reg[0] ;
  input [7:0]\slv_reg0_reg[31]_64 ;
  input \slv_reg0_reg[12] ;
  input [0:0]D;
  input s00_axi_aresetn;

  wire CLK;
  wire [0:0]D;
  wire HS_Clock;
  wire \PACKET_LOGIC/packet_size_mux/mux_out ;
  wire PULSE_CNTR_n_0;
  wire Q;
  wire Q_reg;
  wire SYNCK;
  wire \baseClockMux/mux_out ;
  wire clk0;
  wire clock_div_2;
  wire inSR_shift;
  wire in_next_int;
  wire in_start_stop_int;
  wire [31:0]m00_axis_tdata;
  wire m00_axis_tlast;
  wire m00_axis_tvalid;
  wire outSR_shift;
  wire out_next_int;
  wire out_start_stop_int;
  wire [0:0]\r_reg_reg[0] ;
  wire \r_reg_reg[32] ;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;
  wire s00_axis_tready;
  wire s00_axis_tvalid;
  wire \slv_reg0_reg[12] ;
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
  wire [7:0]\slv_reg0_reg[31]_64 ;
  wire \slv_reg0_reg[31]_7 ;
  wire \slv_reg0_reg[31]_8 ;
  wire \slv_reg0_reg[31]_9 ;
  wire [0:0]\slv_reg1_reg[4] ;
  wire [0:0]\slv_reg2_reg[0] ;

  design_2_BiDirChannels_0_0_clock_divider_by_2 CLK_DIV2
       (.Q_reg(clock_div_2),
        .mux_out(\baseClockMux/mux_out ),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  design_2_BiDirChannels_0_0_clock_divider_by_2_0 CLK_DIV4
       (.CLK(CLK),
        .Q_reg(Q_reg),
        .clock_div_2(clock_div_2),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  design_2_BiDirChannels_0_0_upCounter8Bits CLK_DIV_CNTR
       (.mux_out(\baseClockMux/mux_out ),
        .s00_axi_aclk(s00_axi_aclk),
        .\slv_reg0_reg[18] (\slv_reg0_reg[31]_64 [5:3]),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  design_2_BiDirChannels_0_0_inputShiftRegister32Bits IN_SHIFT_REG
       (.CLK(Q),
        .D(D),
        .m00_axis_tdata(m00_axis_tdata),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  design_2_BiDirChannels_0_0_upCounter12Bits LAST_CNTR
       (.Q_reg(m00_axis_tvalid),
        .mux_out(\PACKET_LOGIC/packet_size_mux/mux_out ),
        .\slv_reg0_reg[12] (\slv_reg0_reg[12] ),
        .\slv_reg0_reg[14] (\slv_reg0_reg[31]_64 [2:0]),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  design_2_BiDirChannels_0_0_maskHSCK MASK_HSCK
       (.in_next_int(in_next_int),
        .in_start_stop_int(in_start_stop_int),
        .out_next_int(out_next_int),
        .out_start_stop_int(out_start_stop_int),
        .\r_reg_reg[3] (PULSE_CNTR_n_0),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ),
        .\slv_reg1_reg[4] (\slv_reg1_reg[4] ));
  design_2_BiDirChannels_0_0_outputShiftRegister32Bits OUT_SHIFT_REG_0
       (.Q_reg(\r_reg_reg[32] ),
        .outSR_shift(outSR_shift),
        .\r_reg_reg[0] (\r_reg_reg[0] ),
        .s00_axi_aresetn(s00_axi_aresetn),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31]_0 ),
        .\slv_reg0_reg[31]_0 (\slv_reg0_reg[31]_1 ),
        .\slv_reg0_reg[31]_1 (\slv_reg0_reg[31]_2 ),
        .\slv_reg0_reg[31]_10 (\slv_reg0_reg[31]_11 ),
        .\slv_reg0_reg[31]_11 (\slv_reg0_reg[31]_12 ),
        .\slv_reg0_reg[31]_12 (\slv_reg0_reg[31]_13 ),
        .\slv_reg0_reg[31]_13 (\slv_reg0_reg[31]_14 ),
        .\slv_reg0_reg[31]_14 (\slv_reg0_reg[31]_15 ),
        .\slv_reg0_reg[31]_15 (\slv_reg0_reg[31]_16 ),
        .\slv_reg0_reg[31]_16 (\slv_reg0_reg[31]_17 ),
        .\slv_reg0_reg[31]_17 (\slv_reg0_reg[31]_18 ),
        .\slv_reg0_reg[31]_18 (\slv_reg0_reg[31]_19 ),
        .\slv_reg0_reg[31]_19 (\slv_reg0_reg[31]_20 ),
        .\slv_reg0_reg[31]_2 (\slv_reg0_reg[31]_3 ),
        .\slv_reg0_reg[31]_20 (\slv_reg0_reg[31]_21 ),
        .\slv_reg0_reg[31]_21 (\slv_reg0_reg[31]_22 ),
        .\slv_reg0_reg[31]_22 (\slv_reg0_reg[31]_23 ),
        .\slv_reg0_reg[31]_23 (\slv_reg0_reg[31]_24 ),
        .\slv_reg0_reg[31]_24 (\slv_reg0_reg[31]_25 ),
        .\slv_reg0_reg[31]_25 (\slv_reg0_reg[31]_26 ),
        .\slv_reg0_reg[31]_26 (\slv_reg0_reg[31]_27 ),
        .\slv_reg0_reg[31]_27 (\slv_reg0_reg[31]_28 ),
        .\slv_reg0_reg[31]_28 (\slv_reg0_reg[31]_29 ),
        .\slv_reg0_reg[31]_29 (\slv_reg0_reg[31]_30 ),
        .\slv_reg0_reg[31]_3 (\slv_reg0_reg[31]_4 ),
        .\slv_reg0_reg[31]_30 (\slv_reg0_reg[31]_31 ),
        .\slv_reg0_reg[31]_31 (\slv_reg0_reg[31]_32 ),
        .\slv_reg0_reg[31]_32 (\slv_reg0_reg[31]_33 ),
        .\slv_reg0_reg[31]_33 (\slv_reg0_reg[31]_34 ),
        .\slv_reg0_reg[31]_34 (\slv_reg0_reg[31]_35 ),
        .\slv_reg0_reg[31]_35 (\slv_reg0_reg[31]_36 ),
        .\slv_reg0_reg[31]_36 (\slv_reg0_reg[31]_37 ),
        .\slv_reg0_reg[31]_37 (\slv_reg0_reg[31]_38 ),
        .\slv_reg0_reg[31]_38 (\slv_reg0_reg[31]_39 ),
        .\slv_reg0_reg[31]_39 (\slv_reg0_reg[31]_40 ),
        .\slv_reg0_reg[31]_4 (\slv_reg0_reg[31]_5 ),
        .\slv_reg0_reg[31]_40 (\slv_reg0_reg[31]_41 ),
        .\slv_reg0_reg[31]_41 (\slv_reg0_reg[31]_42 ),
        .\slv_reg0_reg[31]_42 (\slv_reg0_reg[31]_43 ),
        .\slv_reg0_reg[31]_43 (\slv_reg0_reg[31]_44 ),
        .\slv_reg0_reg[31]_44 (\slv_reg0_reg[31]_45 ),
        .\slv_reg0_reg[31]_45 (\slv_reg0_reg[31]_46 ),
        .\slv_reg0_reg[31]_46 (\slv_reg0_reg[31]_47 ),
        .\slv_reg0_reg[31]_47 (\slv_reg0_reg[31]_48 ),
        .\slv_reg0_reg[31]_48 (\slv_reg0_reg[31]_49 ),
        .\slv_reg0_reg[31]_49 (\slv_reg0_reg[31]_50 ),
        .\slv_reg0_reg[31]_5 (\slv_reg0_reg[31]_6 ),
        .\slv_reg0_reg[31]_50 (\slv_reg0_reg[31]_51 ),
        .\slv_reg0_reg[31]_51 (\slv_reg0_reg[31]_52 ),
        .\slv_reg0_reg[31]_52 (\slv_reg0_reg[31]_53 ),
        .\slv_reg0_reg[31]_53 (\slv_reg0_reg[31]_54 ),
        .\slv_reg0_reg[31]_54 (\slv_reg0_reg[31]_55 ),
        .\slv_reg0_reg[31]_55 (\slv_reg0_reg[31]_56 ),
        .\slv_reg0_reg[31]_56 (\slv_reg0_reg[31]_57 ),
        .\slv_reg0_reg[31]_57 (\slv_reg0_reg[31]_58 ),
        .\slv_reg0_reg[31]_58 (\slv_reg0_reg[31]_59 ),
        .\slv_reg0_reg[31]_59 (\slv_reg0_reg[31]_60 ),
        .\slv_reg0_reg[31]_6 (\slv_reg0_reg[31]_7 ),
        .\slv_reg0_reg[31]_60 (\slv_reg0_reg[31]_61 ),
        .\slv_reg0_reg[31]_61 (\slv_reg0_reg[31]_62 ),
        .\slv_reg0_reg[31]_62 (\slv_reg0_reg[31]_63 ),
        .\slv_reg0_reg[31]_63 (\slv_reg0_reg[31]_64 [7]),
        .\slv_reg0_reg[31]_7 (\slv_reg0_reg[31]_8 ),
        .\slv_reg0_reg[31]_8 (\slv_reg0_reg[31]_9 ),
        .\slv_reg0_reg[31]_9 (\slv_reg0_reg[31]_10 ));
  design_2_BiDirChannels_0_0_counter48Cycles PULSE_CNTR
       (.CLK(CLK),
        .HS_Clock(HS_Clock),
        .Q_reg(PULSE_CNTR_n_0),
        .Q_reg_0(Q_reg),
        .inSR_shift(inSR_shift),
        .in_start_stop_int(in_start_stop_int),
        .outSR_shift(outSR_shift),
        .out_start_stop_int(out_start_stop_int),
        .\slv_reg0_reg[28] (\slv_reg0_reg[31]_64 [6]),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ),
        .\slv_reg2_reg[0] (\slv_reg2_reg[0] ));
  design_2_BiDirChannels_0_0_clock_divider_by_10 SYNC_CLK_DIV
       (.SYNCK(SYNCK),
        .s00_axi_aclk(s00_axi_aclk),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  design_2_BiDirChannels_0_0_syncReady X0
       (.clk0(clk0),
        .out_next_int(out_next_int),
        .out_start_stop_int(out_start_stop_int),
        .\r_reg_reg[32] (\r_reg_reg[32] ),
        .\r_reg_reg[3] (PULSE_CNTR_n_0),
        .s00_axis_tready(s00_axis_tready),
        .s00_axis_tvalid(s00_axis_tvalid),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  design_2_BiDirChannels_0_0_syncReady_1 X1
       (.clk0(clk0),
        .in_next_int(in_next_int),
        .in_start_stop_int(in_start_stop_int),
        .m00_axis_tvalid(m00_axis_tvalid),
        .\r_reg_reg[3] (PULSE_CNTR_n_0),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  design_2_BiDirChannels_0_0_dff X10
       (.m00_axis_tlast(m00_axis_tlast),
        .mux_out(\PACKET_LOGIC/packet_size_mux/mux_out ),
        .s00_axi_aclk(s00_axi_aclk),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  design_2_BiDirChannels_0_0_dff_2 X20
       (.CLK(Q),
        .clock_div_2(clock_div_2),
        .inSR_shift(inSR_shift),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
endmodule

module design_2_BiDirChannels_0_0_clock_divider_by_10
   (SYNCK,
    s00_axi_aclk,
    \slv_reg0_reg[31] );
  output SYNCK;
  input s00_axi_aclk;
  input \slv_reg0_reg[31] ;

  wire SYNCK;
  wire out_clock_int_i_1_n_0;
  wire [3:0]r_reg;
  wire \r_reg[0]_i_1__2_n_0 ;
  wire \r_reg[1]_i_1_n_0 ;
  wire \r_reg[2]_i_1_n_0 ;
  wire \r_reg[3]_i_1_n_0 ;
  wire s00_axi_aclk;
  wire \slv_reg0_reg[31] ;

  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT5 #(
    .INIT(32'hFFFB0004)) 
    out_clock_int_i_1
       (.I0(r_reg[1]),
        .I1(r_reg[2]),
        .I2(r_reg[0]),
        .I3(r_reg[3]),
        .I4(SYNCK),
        .O(out_clock_int_i_1_n_0));
  FDCE out_clock_int_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(out_clock_int_i_1_n_0),
        .Q(SYNCK));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'h00EF)) 
    \r_reg[0]_i_1__2 
       (.I0(r_reg[1]),
        .I1(r_reg[3]),
        .I2(r_reg[2]),
        .I3(r_reg[0]),
        .O(\r_reg[0]_i_1__2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \r_reg[1]_i_1 
       (.I0(r_reg[1]),
        .I1(r_reg[0]),
        .O(\r_reg[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'h7688)) 
    \r_reg[2]_i_1 
       (.I0(r_reg[1]),
        .I1(r_reg[0]),
        .I2(r_reg[3]),
        .I3(r_reg[2]),
        .O(\r_reg[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'h78F0)) 
    \r_reg[3]_i_1 
       (.I0(r_reg[1]),
        .I1(r_reg[0]),
        .I2(r_reg[3]),
        .I3(r_reg[2]),
        .O(\r_reg[3]_i_1_n_0 ));
  FDCE \r_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg[0]_i_1__2_n_0 ),
        .Q(r_reg[0]));
  FDCE \r_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg[1]_i_1_n_0 ),
        .Q(r_reg[1]));
  FDCE \r_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg[2]_i_1_n_0 ),
        .Q(r_reg[2]));
  FDCE \r_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg[3]_i_1_n_0 ),
        .Q(r_reg[3]));
endmodule

module design_2_BiDirChannels_0_0_clock_divider_by_2
   (Q_reg,
    mux_out,
    \slv_reg0_reg[31] );
  output Q_reg;
  input mux_out;
  input \slv_reg0_reg[31] ;

  wire Q_reg;
  wire mux_out;
  wire \slv_reg0_reg[31] ;

  design_2_BiDirChannels_0_0_dff_10 ff0
       (.Q_reg_0(Q_reg),
        .mux_out(mux_out),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
endmodule

(* ORIG_REF_NAME = "clock_divider_by_2" *) 
module design_2_BiDirChannels_0_0_clock_divider_by_2_0
   (Q_reg,
    CLK,
    clock_div_2,
    \slv_reg0_reg[31] );
  output Q_reg;
  input CLK;
  input clock_div_2;
  input \slv_reg0_reg[31] ;

  wire CLK;
  wire Q_reg;
  wire clock_div_2;
  wire \slv_reg0_reg[31] ;

  design_2_BiDirChannels_0_0_dff_9 ff0
       (.CLK(CLK),
        .Q_reg_0(Q_reg),
        .clock_div_2(clock_div_2),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
endmodule

module design_2_BiDirChannels_0_0_counter48Cycles
   (Q_reg,
    HS_Clock,
    inSR_shift,
    outSR_shift,
    \slv_reg2_reg[0] ,
    Q_reg_0,
    \slv_reg0_reg[28] ,
    in_start_stop_int,
    out_start_stop_int,
    CLK,
    \slv_reg0_reg[31] );
  output Q_reg;
  output HS_Clock;
  output inSR_shift;
  output outSR_shift;
  input [0:0]\slv_reg2_reg[0] ;
  input Q_reg_0;
  input [0:0]\slv_reg0_reg[28] ;
  input in_start_stop_int;
  input out_start_stop_int;
  input CLK;
  input \slv_reg0_reg[31] ;

  wire CLK;
  wire HS_Clock;
  wire Q_reg;
  wire Q_reg_0;
  wire [5:0]count_pulses;
  wire inSR_shift;
  wire in_start_stop_int;
  wire outSR_shift;
  wire out_start_stop_int;
  wire [5:0]r_reg;
  wire \r_reg[1]_i_1__0_n_0 ;
  wire [0:0]\slv_reg0_reg[28] ;
  wire \slv_reg0_reg[31] ;
  wire [0:0]\slv_reg2_reg[0] ;

  LUT6 #(
    .INIT(64'hAA22A22A00880880)) 
    HS_Clock_INST_0
       (.I0(\slv_reg2_reg[0] ),
        .I1(Q_reg_0),
        .I2(count_pulses[3]),
        .I3(count_pulses[4]),
        .I4(count_pulses[5]),
        .I5(\slv_reg0_reg[28] ),
        .O(HS_Clock));
  LUT5 #(
    .INIT(32'h0A280000)) 
    Q_i_1__1
       (.I0(in_start_stop_int),
        .I1(count_pulses[5]),
        .I2(count_pulses[4]),
        .I3(count_pulses[3]),
        .I4(Q_reg_0),
        .O(inSR_shift));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    m00_axis_tvalid_INST_0_i_1
       (.I0(count_pulses[3]),
        .I1(count_pulses[2]),
        .I2(count_pulses[1]),
        .I3(count_pulses[0]),
        .I4(count_pulses[5]),
        .I5(count_pulses[4]),
        .O(Q_reg));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \r_reg[0]_i_1__1 
       (.I0(count_pulses[0]),
        .O(r_reg[0]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \r_reg[1]_i_1__0 
       (.I0(count_pulses[1]),
        .I1(count_pulses[0]),
        .O(\r_reg[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hE1)) 
    \r_reg[2]_i_1 
       (.I0(count_pulses[1]),
        .I1(count_pulses[0]),
        .I2(count_pulses[2]),
        .O(r_reg[2]));
  LUT5 #(
    .INIT(32'h0A280000)) 
    \r_reg[32]_i_2 
       (.I0(out_start_stop_int),
        .I1(count_pulses[5]),
        .I2(count_pulses[4]),
        .I3(count_pulses[3]),
        .I4(Q_reg_0),
        .O(outSR_shift));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'hFE01)) 
    \r_reg[3]_i_1 
       (.I0(count_pulses[2]),
        .I1(count_pulses[0]),
        .I2(count_pulses[1]),
        .I3(count_pulses[3]),
        .O(r_reg[3]));
  LUT6 #(
    .INIT(64'hFFFFFFFC00000002)) 
    \r_reg[4]_i_1 
       (.I0(count_pulses[5]),
        .I1(count_pulses[0]),
        .I2(count_pulses[1]),
        .I3(count_pulses[2]),
        .I4(count_pulses[3]),
        .I5(count_pulses[4]),
        .O(r_reg[4]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA9)) 
    \r_reg[5]_i_1 
       (.I0(count_pulses[5]),
        .I1(count_pulses[4]),
        .I2(count_pulses[0]),
        .I3(count_pulses[1]),
        .I4(count_pulses[2]),
        .I5(count_pulses[3]),
        .O(r_reg[5]));
  FDCE \r_reg_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_reg[0]),
        .Q(count_pulses[0]));
  FDCE \r_reg_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg[1]_i_1__0_n_0 ),
        .Q(count_pulses[1]));
  FDCE \r_reg_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_reg[2]),
        .Q(count_pulses[2]));
  FDCE \r_reg_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_reg[3]),
        .Q(count_pulses[3]));
  FDCE \r_reg_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_reg[4]),
        .Q(count_pulses[4]));
  FDCE \r_reg_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_reg[5]),
        .Q(count_pulses[5]));
endmodule

(* CHECK_LICENSE_TYPE = "design_2_BiDirChannels_0_0,BiDirChannels_v1_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "BiDirChannels_v1_0,Vivado 2018.2" *) 
(* NotValidForBitStream *)
module design_2_BiDirChannels_0_0
   (HSI_A0,
    HSI_A1,
    HSI_DBM,
    HSI_DBP,
    HSI_DAM,
    HSI_DAP,
    HSI_DC,
    HS_Clock,
    MCK_P,
    MCK_N,
    SYNCK,
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
  input HSI_A0;
  input HSI_A1;
  output HSI_DBM;
  output HSI_DBP;
  output HSI_DAM;
  output HSI_DAP;
  output HSI_DC;
  output HS_Clock;
  output MCK_P;
  output MCK_N;
  output SYNCK;
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
  wire HSI_A0;
  wire HSI_A1;
  wire HSI_DAM;
  wire HSI_DAP;
  wire HSI_DBM;
  wire HSI_DBP;
  wire HSI_DC;
  wire HS_Clock;
  (* SLEW = "SLOW" *) wire MCK_N;
  (* SLEW = "SLOW" *) wire MCK_P;
  wire Q_reg_i_1_n_0;
  wire SYNCK;
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
    Q_reg_i_2__0
       (.I0(s00_axi_aclk),
        .O(clk0));
  VCC VCC
       (.P(\<const1> ));
  design_2_BiDirChannels_0_0_BiDirChannels_v1_0 inst
       (.CLK(Q_reg_i_1_n_0),
        .HSI_A0(HSI_A0),
        .HSI_A1(HSI_A1),
        .HSI_DAM(HSI_DAM),
        .HSI_DAP(HSI_DAP),
        .HSI_DBM(HSI_DBM),
        .HSI_DBP(HSI_DBP),
        .HSI_DC(HSI_DC),
        .HS_Clock(HS_Clock),
        .MCK_N(MCK_N),
        .MCK_P(MCK_P),
        .SYNCK(SYNCK),
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

module design_2_BiDirChannels_0_0_dff
   (m00_axis_tlast,
    mux_out,
    s00_axi_aclk,
    \slv_reg0_reg[31] );
  output m00_axis_tlast;
  input mux_out;
  input s00_axi_aclk;
  input \slv_reg0_reg[31] ;

  wire m00_axis_tlast;
  wire mux_out;
  wire s00_axi_aclk;
  wire \slv_reg0_reg[31] ;

  FDCE Q_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(mux_out),
        .Q(m00_axis_tlast));
endmodule

(* ORIG_REF_NAME = "dff" *) 
module design_2_BiDirChannels_0_0_dff_10
   (Q_reg_0,
    mux_out,
    \slv_reg0_reg[31] );
  output Q_reg_0;
  input mux_out;
  input \slv_reg0_reg[31] ;

  wire D0;
  wire Q_reg_0;
  wire mux_out;
  wire \slv_reg0_reg[31] ;

  LUT1 #(
    .INIT(2'h1)) 
    Q_i_1__2
       (.I0(Q_reg_0),
        .O(D0));
  FDCE Q_reg
       (.C(mux_out),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(D0),
        .Q(Q_reg_0));
endmodule

(* ORIG_REF_NAME = "dff" *) 
module design_2_BiDirChannels_0_0_dff_2
   (CLK,
    inSR_shift,
    clock_div_2,
    \slv_reg0_reg[31] );
  output CLK;
  input inSR_shift;
  input clock_div_2;
  input \slv_reg0_reg[31] ;

  wire CLK;
  wire clock_div_2;
  wire inSR_shift;
  wire \slv_reg0_reg[31] ;

  FDCE Q_reg
       (.C(clock_div_2),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(inSR_shift),
        .Q(CLK));
endmodule

(* ORIG_REF_NAME = "dff" *) 
module design_2_BiDirChannels_0_0_dff_3
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
module design_2_BiDirChannels_0_0_dff_4
   (m00_axis_tvalid,
    a,
    clk0,
    \slv_reg0_reg[31] ,
    \r_reg_reg[3] ,
    in_start_stop_int);
  output m00_axis_tvalid;
  input a;
  input clk0;
  input \slv_reg0_reg[31] ;
  input \r_reg_reg[3] ;
  input in_start_stop_int;

  wire a;
  wire b;
  wire clk0;
  wire in_start_stop_int;
  wire m00_axis_tvalid;
  wire \r_reg_reg[3] ;
  wire \slv_reg0_reg[31] ;

  FDCE Q_reg
       (.C(clk0),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(a),
        .Q(b));
  LUT4 #(
    .INIT(16'h0880)) 
    m00_axis_tvalid_INST_0
       (.I0(\r_reg_reg[3] ),
        .I1(in_start_stop_int),
        .I2(b),
        .I3(a),
        .O(m00_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "dff" *) 
module design_2_BiDirChannels_0_0_dff_5
   (a,
    \r_reg_reg[32] ,
    out_next_int,
    clk0,
    \slv_reg0_reg[31] ,
    s00_axis_tvalid,
    b,
    out_start_stop_int,
    \r_reg_reg[3] );
  output a;
  output \r_reg_reg[32] ;
  input out_next_int;
  input clk0;
  input \slv_reg0_reg[31] ;
  input s00_axis_tvalid;
  input b;
  input out_start_stop_int;
  input \r_reg_reg[3] ;

  wire a;
  wire b;
  wire clk0;
  wire out_next_int;
  wire out_start_stop_int;
  wire \r_reg_reg[32] ;
  wire \r_reg_reg[3] ;
  wire s00_axis_tvalid;
  wire \slv_reg0_reg[31] ;

  FDCE Q_reg
       (.C(clk0),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(out_next_int),
        .Q(a));
  LUT5 #(
    .INIT(32'hD7FFFFFF)) 
    \r_reg[32]_i_4 
       (.I0(s00_axis_tvalid),
        .I1(a),
        .I2(b),
        .I3(out_start_stop_int),
        .I4(\r_reg_reg[3] ),
        .O(\r_reg_reg[32] ));
endmodule

(* ORIG_REF_NAME = "dff" *) 
module design_2_BiDirChannels_0_0_dff_6
   (b,
    s00_axis_tready,
    a,
    clk0,
    \slv_reg0_reg[31] ,
    \r_reg_reg[3] ,
    out_start_stop_int);
  output b;
  output s00_axis_tready;
  input a;
  input clk0;
  input \slv_reg0_reg[31] ;
  input \r_reg_reg[3] ;
  input out_start_stop_int;

  wire a;
  wire b;
  wire clk0;
  wire out_start_stop_int;
  wire \r_reg_reg[3] ;
  wire s00_axis_tready;
  wire \slv_reg0_reg[31] ;

  FDCE Q_reg
       (.C(clk0),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(a),
        .Q(b));
  LUT4 #(
    .INIT(16'h0880)) 
    s00_axis_tready_INST_0
       (.I0(\r_reg_reg[3] ),
        .I1(out_start_stop_int),
        .I2(b),
        .I3(a),
        .O(s00_axis_tready));
endmodule

(* ORIG_REF_NAME = "dff" *) 
module design_2_BiDirChannels_0_0_dff_7
   (in_start_stop_int,
    in_next_int,
    \slv_reg1_reg[4] ,
    \r_reg_reg[3] ,
    \slv_reg0_reg[31] );
  output in_start_stop_int;
  output in_next_int;
  input [0:0]\slv_reg1_reg[4] ;
  input \r_reg_reg[3] ;
  input \slv_reg0_reg[31] ;

  wire in_next_int;
  wire in_start_stop_int;
  wire \r_reg_reg[3] ;
  wire \slv_reg0_reg[31] ;
  wire [0:0]\slv_reg1_reg[4] ;

  LUT2 #(
    .INIT(4'h8)) 
    Q_i_1__0
       (.I0(in_start_stop_int),
        .I1(\r_reg_reg[3] ),
        .O(in_next_int));
  FDCE Q_reg
       (.C(\r_reg_reg[3] ),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\slv_reg1_reg[4] ),
        .Q(in_start_stop_int));
endmodule

(* ORIG_REF_NAME = "dff" *) 
module design_2_BiDirChannels_0_0_dff_8
   (out_start_stop_int,
    out_next_int,
    \r_reg_reg[3] ,
    \slv_reg0_reg[31] );
  output out_start_stop_int;
  output out_next_int;
  input \r_reg_reg[3] ;
  input \slv_reg0_reg[31] ;

  wire out_next_int;
  wire out_start_stop_int;
  wire \r_reg_reg[3] ;
  wire \slv_reg0_reg[31] ;

  LUT2 #(
    .INIT(4'h8)) 
    Q_i_1
       (.I0(out_start_stop_int),
        .I1(\r_reg_reg[3] ),
        .O(out_next_int));
  FDCE Q_reg
       (.C(\r_reg_reg[3] ),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(1'b1),
        .Q(out_start_stop_int));
endmodule

(* ORIG_REF_NAME = "dff" *) 
module design_2_BiDirChannels_0_0_dff_9
   (Q_reg_0,
    CLK,
    clock_div_2,
    \slv_reg0_reg[31] );
  output Q_reg_0;
  input CLK;
  input clock_div_2;
  input \slv_reg0_reg[31] ;

  wire CLK;
  wire Q_reg_0;
  wire clock_div_2;
  wire \slv_reg0_reg[31] ;

  FDCE Q_reg
       (.C(clock_div_2),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(CLK),
        .Q(Q_reg_0));
endmodule

module design_2_BiDirChannels_0_0_inputShiftRegister32Bits
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

module design_2_BiDirChannels_0_0_maskHSCK
   (in_start_stop_int,
    out_start_stop_int,
    out_next_int,
    in_next_int,
    \slv_reg1_reg[4] ,
    \r_reg_reg[3] ,
    \slv_reg0_reg[31] );
  output in_start_stop_int;
  output out_start_stop_int;
  output out_next_int;
  output in_next_int;
  input [0:0]\slv_reg1_reg[4] ;
  input \r_reg_reg[3] ;
  input \slv_reg0_reg[31] ;

  wire in_next_int;
  wire in_start_stop_int;
  wire out_next_int;
  wire out_start_stop_int;
  wire \r_reg_reg[3] ;
  wire \slv_reg0_reg[31] ;
  wire [0:0]\slv_reg1_reg[4] ;

  design_2_BiDirChannels_0_0_dff_7 ff0
       (.in_next_int(in_next_int),
        .in_start_stop_int(in_start_stop_int),
        .\r_reg_reg[3] (\r_reg_reg[3] ),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ),
        .\slv_reg1_reg[4] (\slv_reg1_reg[4] ));
  design_2_BiDirChannels_0_0_dff_8 ff1
       (.out_next_int(out_next_int),
        .out_start_stop_int(out_start_stop_int),
        .\r_reg_reg[3] (\r_reg_reg[3] ),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
endmodule

module design_2_BiDirChannels_0_0_outputShiftRegister32Bits
   (\r_reg_reg[0] ,
    \slv_reg0_reg[31] ,
    \slv_reg0_reg[31]_0 ,
    outSR_shift,
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
    s00_axi_aresetn,
    \slv_reg0_reg[31]_63 ,
    Q_reg);
  output [0:0]\r_reg_reg[0] ;
  input \slv_reg0_reg[31] ;
  input \slv_reg0_reg[31]_0 ;
  input outSR_shift;
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
  input s00_axi_aresetn;
  input [0:0]\slv_reg0_reg[31]_63 ;
  input Q_reg;

  wire Q_reg;
  wire outSR_shift;
  wire \r_reg[10]_C_i_1_n_0 ;
  wire \r_reg[11]_C_i_1_n_0 ;
  wire \r_reg[12]_C_i_1_n_0 ;
  wire \r_reg[13]_C_i_1_n_0 ;
  wire \r_reg[14]_C_i_1_n_0 ;
  wire \r_reg[15]_C_i_1_n_0 ;
  wire \r_reg[16]_C_i_1_n_0 ;
  wire \r_reg[17]_C_i_1_n_0 ;
  wire \r_reg[18]_C_i_1_n_0 ;
  wire \r_reg[19]_C_i_1_n_0 ;
  wire \r_reg[1]_C_i_1_n_0 ;
  wire \r_reg[20]_C_i_1_n_0 ;
  wire \r_reg[21]_C_i_1_n_0 ;
  wire \r_reg[22]_C_i_1_n_0 ;
  wire \r_reg[23]_C_i_1_n_0 ;
  wire \r_reg[24]_C_i_1_n_0 ;
  wire \r_reg[25]_C_i_1_n_0 ;
  wire \r_reg[26]_C_i_1_n_0 ;
  wire \r_reg[27]_C_i_1_n_0 ;
  wire \r_reg[28]_C_i_1_n_0 ;
  wire \r_reg[29]_C_i_1_n_0 ;
  wire \r_reg[2]_C_i_1_n_0 ;
  wire \r_reg[30]_C_i_1_n_0 ;
  wire \r_reg[31]_C_i_1_n_0 ;
  wire \r_reg[32]_i_1_n_0 ;
  wire \r_reg[32]_i_3_n_0 ;
  wire \r_reg[3]_C_i_1_n_0 ;
  wire \r_reg[4]_C_i_1_n_0 ;
  wire \r_reg[5]_C_i_1_n_0 ;
  wire \r_reg[6]_C_i_1_n_0 ;
  wire \r_reg[7]_C_i_1_n_0 ;
  wire \r_reg[8]_C_i_1_n_0 ;
  wire \r_reg[9]_C_i_1_n_0 ;
  wire [0:0]\r_reg_reg[0] ;
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
  wire s00_axi_aresetn;
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
  wire [0:0]\slv_reg0_reg[31]_63 ;
  wire \slv_reg0_reg[31]_7 ;
  wire \slv_reg0_reg[31]_8 ;
  wire \slv_reg0_reg[31]_9 ;

  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[10]_C_i_1 
       (.I0(\r_reg_reg[9]_P_n_0 ),
        .I1(\r_reg_reg[9]_LDC_n_0 ),
        .I2(\r_reg_reg[9]_C_n_0 ),
        .O(\r_reg[10]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[11]_C_i_1 
       (.I0(\r_reg_reg[10]_P_n_0 ),
        .I1(\r_reg_reg[10]_LDC_n_0 ),
        .I2(\r_reg_reg[10]_C_n_0 ),
        .O(\r_reg[11]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[12]_C_i_1 
       (.I0(\r_reg_reg[11]_P_n_0 ),
        .I1(\r_reg_reg[11]_LDC_n_0 ),
        .I2(\r_reg_reg[11]_C_n_0 ),
        .O(\r_reg[12]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[13]_C_i_1 
       (.I0(\r_reg_reg[12]_P_n_0 ),
        .I1(\r_reg_reg[12]_LDC_n_0 ),
        .I2(\r_reg_reg[12]_C_n_0 ),
        .O(\r_reg[13]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[14]_C_i_1 
       (.I0(\r_reg_reg[13]_P_n_0 ),
        .I1(\r_reg_reg[13]_LDC_n_0 ),
        .I2(\r_reg_reg[13]_C_n_0 ),
        .O(\r_reg[14]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[15]_C_i_1 
       (.I0(\r_reg_reg[14]_P_n_0 ),
        .I1(\r_reg_reg[14]_LDC_n_0 ),
        .I2(\r_reg_reg[14]_C_n_0 ),
        .O(\r_reg[15]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[16]_C_i_1 
       (.I0(\r_reg_reg[15]_P_n_0 ),
        .I1(\r_reg_reg[15]_LDC_n_0 ),
        .I2(\r_reg_reg[15]_C_n_0 ),
        .O(\r_reg[16]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[17]_C_i_1 
       (.I0(\r_reg_reg[16]_P_n_0 ),
        .I1(\r_reg_reg[16]_LDC_n_0 ),
        .I2(\r_reg_reg[16]_C_n_0 ),
        .O(\r_reg[17]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[18]_C_i_1 
       (.I0(\r_reg_reg[17]_P_n_0 ),
        .I1(\r_reg_reg[17]_LDC_n_0 ),
        .I2(\r_reg_reg[17]_C_n_0 ),
        .O(\r_reg[18]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[19]_C_i_1 
       (.I0(\r_reg_reg[18]_P_n_0 ),
        .I1(\r_reg_reg[18]_LDC_n_0 ),
        .I2(\r_reg_reg[18]_C_n_0 ),
        .O(\r_reg[19]_C_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \r_reg[1]_C_i_1 
       (.I0(\r_reg_reg[0]_LDC_n_0 ),
        .I1(\r_reg_reg[0]_P_n_0 ),
        .O(\r_reg[1]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[20]_C_i_1 
       (.I0(\r_reg_reg[19]_P_n_0 ),
        .I1(\r_reg_reg[19]_LDC_n_0 ),
        .I2(\r_reg_reg[19]_C_n_0 ),
        .O(\r_reg[20]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[21]_C_i_1 
       (.I0(\r_reg_reg[20]_P_n_0 ),
        .I1(\r_reg_reg[20]_LDC_n_0 ),
        .I2(\r_reg_reg[20]_C_n_0 ),
        .O(\r_reg[21]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[22]_C_i_1 
       (.I0(\r_reg_reg[21]_P_n_0 ),
        .I1(\r_reg_reg[21]_LDC_n_0 ),
        .I2(\r_reg_reg[21]_C_n_0 ),
        .O(\r_reg[22]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[23]_C_i_1 
       (.I0(\r_reg_reg[22]_P_n_0 ),
        .I1(\r_reg_reg[22]_LDC_n_0 ),
        .I2(\r_reg_reg[22]_C_n_0 ),
        .O(\r_reg[23]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[24]_C_i_1 
       (.I0(\r_reg_reg[23]_P_n_0 ),
        .I1(\r_reg_reg[23]_LDC_n_0 ),
        .I2(\r_reg_reg[23]_C_n_0 ),
        .O(\r_reg[24]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[25]_C_i_1 
       (.I0(\r_reg_reg[24]_P_n_0 ),
        .I1(\r_reg_reg[24]_LDC_n_0 ),
        .I2(\r_reg_reg[24]_C_n_0 ),
        .O(\r_reg[25]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[26]_C_i_1 
       (.I0(\r_reg_reg[25]_P_n_0 ),
        .I1(\r_reg_reg[25]_LDC_n_0 ),
        .I2(\r_reg_reg[25]_C_n_0 ),
        .O(\r_reg[26]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[27]_C_i_1 
       (.I0(\r_reg_reg[26]_P_n_0 ),
        .I1(\r_reg_reg[26]_LDC_n_0 ),
        .I2(\r_reg_reg[26]_C_n_0 ),
        .O(\r_reg[27]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[28]_C_i_1 
       (.I0(\r_reg_reg[27]_P_n_0 ),
        .I1(\r_reg_reg[27]_LDC_n_0 ),
        .I2(\r_reg_reg[27]_C_n_0 ),
        .O(\r_reg[28]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[29]_C_i_1 
       (.I0(\r_reg_reg[28]_P_n_0 ),
        .I1(\r_reg_reg[28]_LDC_n_0 ),
        .I2(\r_reg_reg[28]_C_n_0 ),
        .O(\r_reg[29]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[2]_C_i_1 
       (.I0(\r_reg_reg[1]_P_n_0 ),
        .I1(\r_reg_reg[1]_LDC_n_0 ),
        .I2(\r_reg_reg[1]_C_n_0 ),
        .O(\r_reg[2]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[30]_C_i_1 
       (.I0(\r_reg_reg[29]_P_n_0 ),
        .I1(\r_reg_reg[29]_LDC_n_0 ),
        .I2(\r_reg_reg[29]_C_n_0 ),
        .O(\r_reg[30]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[31]_C_i_1 
       (.I0(\r_reg_reg[30]_P_n_0 ),
        .I1(\r_reg_reg[30]_LDC_n_0 ),
        .I2(\r_reg_reg[30]_C_n_0 ),
        .O(\r_reg[31]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[32]_i_1 
       (.I0(\r_reg_reg[31]_P_n_0 ),
        .I1(\r_reg_reg[31]_LDC_n_0 ),
        .I2(\r_reg_reg[31]_C_n_0 ),
        .O(\r_reg[32]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hDF)) 
    \r_reg[32]_i_3 
       (.I0(s00_axi_aresetn),
        .I1(\slv_reg0_reg[31]_63 ),
        .I2(Q_reg),
        .O(\r_reg[32]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[3]_C_i_1 
       (.I0(\r_reg_reg[2]_P_n_0 ),
        .I1(\r_reg_reg[2]_LDC_n_0 ),
        .I2(\r_reg_reg[2]_C_n_0 ),
        .O(\r_reg[3]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[4]_C_i_1 
       (.I0(\r_reg_reg[3]_P_n_0 ),
        .I1(\r_reg_reg[3]_LDC_n_0 ),
        .I2(\r_reg_reg[3]_C_n_0 ),
        .O(\r_reg[4]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[5]_C_i_1 
       (.I0(\r_reg_reg[4]_P_n_0 ),
        .I1(\r_reg_reg[4]_LDC_n_0 ),
        .I2(\r_reg_reg[4]_C_n_0 ),
        .O(\r_reg[5]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[6]_C_i_1 
       (.I0(\r_reg_reg[5]_P_n_0 ),
        .I1(\r_reg_reg[5]_LDC_n_0 ),
        .I2(\r_reg_reg[5]_C_n_0 ),
        .O(\r_reg[6]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[7]_C_i_1 
       (.I0(\r_reg_reg[6]_P_n_0 ),
        .I1(\r_reg_reg[6]_LDC_n_0 ),
        .I2(\r_reg_reg[6]_C_n_0 ),
        .O(\r_reg[7]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[8]_C_i_1 
       (.I0(\r_reg_reg[7]_P_n_0 ),
        .I1(\r_reg_reg[7]_LDC_n_0 ),
        .I2(\r_reg_reg[7]_C_n_0 ),
        .O(\r_reg[8]_C_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r_reg[9]_C_i_1 
       (.I0(\r_reg_reg[8]_P_n_0 ),
        .I1(\r_reg_reg[8]_LDC_n_0 ),
        .I2(\r_reg_reg[8]_C_n_0 ),
        .O(\r_reg[9]_C_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[0]_LDC 
       (.CLR(\slv_reg0_reg[31]_62 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_61 ),
        .GE(1'b1),
        .Q(\r_reg_reg[0]_LDC_n_0 ));
  FDPE \r_reg_reg[0]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(1'b0),
        .PRE(\slv_reg0_reg[31]_61 ),
        .Q(\r_reg_reg[0]_P_n_0 ));
  FDCE \r_reg_reg[10]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_42 ),
        .D(\r_reg[10]_C_i_1_n_0 ),
        .Q(\r_reg_reg[10]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[10]_LDC 
       (.CLR(\slv_reg0_reg[31]_42 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_41 ),
        .GE(1'b1),
        .Q(\r_reg_reg[10]_LDC_n_0 ));
  FDPE \r_reg_reg[10]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[10]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_41 ),
        .Q(\r_reg_reg[10]_P_n_0 ));
  FDCE \r_reg_reg[11]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_40 ),
        .D(\r_reg[11]_C_i_1_n_0 ),
        .Q(\r_reg_reg[11]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[11]_LDC 
       (.CLR(\slv_reg0_reg[31]_40 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_39 ),
        .GE(1'b1),
        .Q(\r_reg_reg[11]_LDC_n_0 ));
  FDPE \r_reg_reg[11]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[11]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_39 ),
        .Q(\r_reg_reg[11]_P_n_0 ));
  FDCE \r_reg_reg[12]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_38 ),
        .D(\r_reg[12]_C_i_1_n_0 ),
        .Q(\r_reg_reg[12]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[12]_LDC 
       (.CLR(\slv_reg0_reg[31]_38 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_37 ),
        .GE(1'b1),
        .Q(\r_reg_reg[12]_LDC_n_0 ));
  FDPE \r_reg_reg[12]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[12]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_37 ),
        .Q(\r_reg_reg[12]_P_n_0 ));
  FDCE \r_reg_reg[13]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_36 ),
        .D(\r_reg[13]_C_i_1_n_0 ),
        .Q(\r_reg_reg[13]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[13]_LDC 
       (.CLR(\slv_reg0_reg[31]_36 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_35 ),
        .GE(1'b1),
        .Q(\r_reg_reg[13]_LDC_n_0 ));
  FDPE \r_reg_reg[13]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[13]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_35 ),
        .Q(\r_reg_reg[13]_P_n_0 ));
  FDCE \r_reg_reg[14]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_34 ),
        .D(\r_reg[14]_C_i_1_n_0 ),
        .Q(\r_reg_reg[14]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[14]_LDC 
       (.CLR(\slv_reg0_reg[31]_34 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_33 ),
        .GE(1'b1),
        .Q(\r_reg_reg[14]_LDC_n_0 ));
  FDPE \r_reg_reg[14]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[14]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_33 ),
        .Q(\r_reg_reg[14]_P_n_0 ));
  FDCE \r_reg_reg[15]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_32 ),
        .D(\r_reg[15]_C_i_1_n_0 ),
        .Q(\r_reg_reg[15]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[15]_LDC 
       (.CLR(\slv_reg0_reg[31]_32 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_31 ),
        .GE(1'b1),
        .Q(\r_reg_reg[15]_LDC_n_0 ));
  FDPE \r_reg_reg[15]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[15]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_31 ),
        .Q(\r_reg_reg[15]_P_n_0 ));
  FDCE \r_reg_reg[16]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_30 ),
        .D(\r_reg[16]_C_i_1_n_0 ),
        .Q(\r_reg_reg[16]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[16]_LDC 
       (.CLR(\slv_reg0_reg[31]_30 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_29 ),
        .GE(1'b1),
        .Q(\r_reg_reg[16]_LDC_n_0 ));
  FDPE \r_reg_reg[16]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[16]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_29 ),
        .Q(\r_reg_reg[16]_P_n_0 ));
  FDCE \r_reg_reg[17]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_28 ),
        .D(\r_reg[17]_C_i_1_n_0 ),
        .Q(\r_reg_reg[17]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[17]_LDC 
       (.CLR(\slv_reg0_reg[31]_28 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_27 ),
        .GE(1'b1),
        .Q(\r_reg_reg[17]_LDC_n_0 ));
  FDPE \r_reg_reg[17]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[17]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_27 ),
        .Q(\r_reg_reg[17]_P_n_0 ));
  FDCE \r_reg_reg[18]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_26 ),
        .D(\r_reg[18]_C_i_1_n_0 ),
        .Q(\r_reg_reg[18]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[18]_LDC 
       (.CLR(\slv_reg0_reg[31]_26 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_25 ),
        .GE(1'b1),
        .Q(\r_reg_reg[18]_LDC_n_0 ));
  FDPE \r_reg_reg[18]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[18]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_25 ),
        .Q(\r_reg_reg[18]_P_n_0 ));
  FDCE \r_reg_reg[19]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_24 ),
        .D(\r_reg[19]_C_i_1_n_0 ),
        .Q(\r_reg_reg[19]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[19]_LDC 
       (.CLR(\slv_reg0_reg[31]_24 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_23 ),
        .GE(1'b1),
        .Q(\r_reg_reg[19]_LDC_n_0 ));
  FDPE \r_reg_reg[19]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[19]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_23 ),
        .Q(\r_reg_reg[19]_P_n_0 ));
  FDCE \r_reg_reg[1]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_60 ),
        .D(\r_reg[1]_C_i_1_n_0 ),
        .Q(\r_reg_reg[1]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[1]_LDC 
       (.CLR(\slv_reg0_reg[31]_60 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_59 ),
        .GE(1'b1),
        .Q(\r_reg_reg[1]_LDC_n_0 ));
  FDPE \r_reg_reg[1]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[1]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_59 ),
        .Q(\r_reg_reg[1]_P_n_0 ));
  FDCE \r_reg_reg[20]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_22 ),
        .D(\r_reg[20]_C_i_1_n_0 ),
        .Q(\r_reg_reg[20]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[20]_LDC 
       (.CLR(\slv_reg0_reg[31]_22 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_21 ),
        .GE(1'b1),
        .Q(\r_reg_reg[20]_LDC_n_0 ));
  FDPE \r_reg_reg[20]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[20]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_21 ),
        .Q(\r_reg_reg[20]_P_n_0 ));
  FDCE \r_reg_reg[21]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_20 ),
        .D(\r_reg[21]_C_i_1_n_0 ),
        .Q(\r_reg_reg[21]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[21]_LDC 
       (.CLR(\slv_reg0_reg[31]_20 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_19 ),
        .GE(1'b1),
        .Q(\r_reg_reg[21]_LDC_n_0 ));
  FDPE \r_reg_reg[21]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[21]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_19 ),
        .Q(\r_reg_reg[21]_P_n_0 ));
  FDCE \r_reg_reg[22]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_18 ),
        .D(\r_reg[22]_C_i_1_n_0 ),
        .Q(\r_reg_reg[22]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[22]_LDC 
       (.CLR(\slv_reg0_reg[31]_18 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_17 ),
        .GE(1'b1),
        .Q(\r_reg_reg[22]_LDC_n_0 ));
  FDPE \r_reg_reg[22]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[22]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_17 ),
        .Q(\r_reg_reg[22]_P_n_0 ));
  FDCE \r_reg_reg[23]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_16 ),
        .D(\r_reg[23]_C_i_1_n_0 ),
        .Q(\r_reg_reg[23]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[23]_LDC 
       (.CLR(\slv_reg0_reg[31]_16 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_15 ),
        .GE(1'b1),
        .Q(\r_reg_reg[23]_LDC_n_0 ));
  FDPE \r_reg_reg[23]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[23]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_15 ),
        .Q(\r_reg_reg[23]_P_n_0 ));
  FDCE \r_reg_reg[24]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_14 ),
        .D(\r_reg[24]_C_i_1_n_0 ),
        .Q(\r_reg_reg[24]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[24]_LDC 
       (.CLR(\slv_reg0_reg[31]_14 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_13 ),
        .GE(1'b1),
        .Q(\r_reg_reg[24]_LDC_n_0 ));
  FDPE \r_reg_reg[24]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[24]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_13 ),
        .Q(\r_reg_reg[24]_P_n_0 ));
  FDCE \r_reg_reg[25]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_12 ),
        .D(\r_reg[25]_C_i_1_n_0 ),
        .Q(\r_reg_reg[25]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[25]_LDC 
       (.CLR(\slv_reg0_reg[31]_12 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_11 ),
        .GE(1'b1),
        .Q(\r_reg_reg[25]_LDC_n_0 ));
  FDPE \r_reg_reg[25]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[25]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_11 ),
        .Q(\r_reg_reg[25]_P_n_0 ));
  FDCE \r_reg_reg[26]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_10 ),
        .D(\r_reg[26]_C_i_1_n_0 ),
        .Q(\r_reg_reg[26]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[26]_LDC 
       (.CLR(\slv_reg0_reg[31]_10 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_9 ),
        .GE(1'b1),
        .Q(\r_reg_reg[26]_LDC_n_0 ));
  FDPE \r_reg_reg[26]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[26]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_9 ),
        .Q(\r_reg_reg[26]_P_n_0 ));
  FDCE \r_reg_reg[27]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_8 ),
        .D(\r_reg[27]_C_i_1_n_0 ),
        .Q(\r_reg_reg[27]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[27]_LDC 
       (.CLR(\slv_reg0_reg[31]_8 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_7 ),
        .GE(1'b1),
        .Q(\r_reg_reg[27]_LDC_n_0 ));
  FDPE \r_reg_reg[27]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[27]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_7 ),
        .Q(\r_reg_reg[27]_P_n_0 ));
  FDCE \r_reg_reg[28]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_6 ),
        .D(\r_reg[28]_C_i_1_n_0 ),
        .Q(\r_reg_reg[28]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[28]_LDC 
       (.CLR(\slv_reg0_reg[31]_6 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_5 ),
        .GE(1'b1),
        .Q(\r_reg_reg[28]_LDC_n_0 ));
  FDPE \r_reg_reg[28]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[28]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_5 ),
        .Q(\r_reg_reg[28]_P_n_0 ));
  FDCE \r_reg_reg[29]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_4 ),
        .D(\r_reg[29]_C_i_1_n_0 ),
        .Q(\r_reg_reg[29]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[29]_LDC 
       (.CLR(\slv_reg0_reg[31]_4 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_3 ),
        .GE(1'b1),
        .Q(\r_reg_reg[29]_LDC_n_0 ));
  FDPE \r_reg_reg[29]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[29]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_3 ),
        .Q(\r_reg_reg[29]_P_n_0 ));
  FDCE \r_reg_reg[2]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_58 ),
        .D(\r_reg[2]_C_i_1_n_0 ),
        .Q(\r_reg_reg[2]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[2]_LDC 
       (.CLR(\slv_reg0_reg[31]_58 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_57 ),
        .GE(1'b1),
        .Q(\r_reg_reg[2]_LDC_n_0 ));
  FDPE \r_reg_reg[2]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[2]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_57 ),
        .Q(\r_reg_reg[2]_P_n_0 ));
  FDCE \r_reg_reg[30]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_2 ),
        .D(\r_reg[30]_C_i_1_n_0 ),
        .Q(\r_reg_reg[30]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[30]_LDC 
       (.CLR(\slv_reg0_reg[31]_2 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_1 ),
        .GE(1'b1),
        .Q(\r_reg_reg[30]_LDC_n_0 ));
  FDPE \r_reg_reg[30]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[30]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_1 ),
        .Q(\r_reg_reg[30]_P_n_0 ));
  FDCE \r_reg_reg[31]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_0 ),
        .D(\r_reg[31]_C_i_1_n_0 ),
        .Q(\r_reg_reg[31]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[31]_LDC 
       (.CLR(\slv_reg0_reg[31]_0 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31] ),
        .GE(1'b1),
        .Q(\r_reg_reg[31]_LDC_n_0 ));
  FDPE \r_reg_reg[31]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[31]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31] ),
        .Q(\r_reg_reg[31]_P_n_0 ));
  FDCE \r_reg_reg[32] 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\r_reg[32]_i_3_n_0 ),
        .D(\r_reg[32]_i_1_n_0 ),
        .Q(\r_reg_reg[0] ));
  FDCE \r_reg_reg[3]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_56 ),
        .D(\r_reg[3]_C_i_1_n_0 ),
        .Q(\r_reg_reg[3]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[3]_LDC 
       (.CLR(\slv_reg0_reg[31]_56 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_55 ),
        .GE(1'b1),
        .Q(\r_reg_reg[3]_LDC_n_0 ));
  FDPE \r_reg_reg[3]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[3]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_55 ),
        .Q(\r_reg_reg[3]_P_n_0 ));
  FDCE \r_reg_reg[4]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_54 ),
        .D(\r_reg[4]_C_i_1_n_0 ),
        .Q(\r_reg_reg[4]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[4]_LDC 
       (.CLR(\slv_reg0_reg[31]_54 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_53 ),
        .GE(1'b1),
        .Q(\r_reg_reg[4]_LDC_n_0 ));
  FDPE \r_reg_reg[4]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[4]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_53 ),
        .Q(\r_reg_reg[4]_P_n_0 ));
  FDCE \r_reg_reg[5]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_52 ),
        .D(\r_reg[5]_C_i_1_n_0 ),
        .Q(\r_reg_reg[5]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[5]_LDC 
       (.CLR(\slv_reg0_reg[31]_52 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_51 ),
        .GE(1'b1),
        .Q(\r_reg_reg[5]_LDC_n_0 ));
  FDPE \r_reg_reg[5]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[5]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_51 ),
        .Q(\r_reg_reg[5]_P_n_0 ));
  FDCE \r_reg_reg[6]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_50 ),
        .D(\r_reg[6]_C_i_1_n_0 ),
        .Q(\r_reg_reg[6]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[6]_LDC 
       (.CLR(\slv_reg0_reg[31]_50 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_49 ),
        .GE(1'b1),
        .Q(\r_reg_reg[6]_LDC_n_0 ));
  FDPE \r_reg_reg[6]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[6]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_49 ),
        .Q(\r_reg_reg[6]_P_n_0 ));
  FDCE \r_reg_reg[7]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_48 ),
        .D(\r_reg[7]_C_i_1_n_0 ),
        .Q(\r_reg_reg[7]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[7]_LDC 
       (.CLR(\slv_reg0_reg[31]_48 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_47 ),
        .GE(1'b1),
        .Q(\r_reg_reg[7]_LDC_n_0 ));
  FDPE \r_reg_reg[7]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[7]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_47 ),
        .Q(\r_reg_reg[7]_P_n_0 ));
  FDCE \r_reg_reg[8]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_46 ),
        .D(\r_reg[8]_C_i_1_n_0 ),
        .Q(\r_reg_reg[8]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[8]_LDC 
       (.CLR(\slv_reg0_reg[31]_46 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_45 ),
        .GE(1'b1),
        .Q(\r_reg_reg[8]_LDC_n_0 ));
  FDPE \r_reg_reg[8]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[8]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_45 ),
        .Q(\r_reg_reg[8]_P_n_0 ));
  FDCE \r_reg_reg[9]_C 
       (.C(outSR_shift),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31]_44 ),
        .D(\r_reg[9]_C_i_1_n_0 ),
        .Q(\r_reg_reg[9]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[9]_LDC 
       (.CLR(\slv_reg0_reg[31]_44 ),
        .D(1'b1),
        .G(\slv_reg0_reg[31]_43 ),
        .GE(1'b1),
        .Q(\r_reg_reg[9]_LDC_n_0 ));
  FDPE \r_reg_reg[9]_P 
       (.C(outSR_shift),
        .CE(1'b1),
        .D(\r_reg[9]_C_i_1_n_0 ),
        .PRE(\slv_reg0_reg[31]_43 ),
        .Q(\r_reg_reg[9]_P_n_0 ));
endmodule

module design_2_BiDirChannels_0_0_syncReady
   (\r_reg_reg[32] ,
    s00_axis_tready,
    out_next_int,
    clk0,
    \slv_reg0_reg[31] ,
    s00_axis_tvalid,
    out_start_stop_int,
    \r_reg_reg[3] );
  output \r_reg_reg[32] ;
  output s00_axis_tready;
  input out_next_int;
  input clk0;
  input \slv_reg0_reg[31] ;
  input s00_axis_tvalid;
  input out_start_stop_int;
  input \r_reg_reg[3] ;

  wire a;
  wire b;
  wire clk0;
  wire out_next_int;
  wire out_start_stop_int;
  wire \r_reg_reg[32] ;
  wire \r_reg_reg[3] ;
  wire s00_axis_tready;
  wire s00_axis_tvalid;
  wire \slv_reg0_reg[31] ;

  design_2_BiDirChannels_0_0_dff_5 X0
       (.a(a),
        .b(b),
        .clk0(clk0),
        .out_next_int(out_next_int),
        .out_start_stop_int(out_start_stop_int),
        .\r_reg_reg[32] (\r_reg_reg[32] ),
        .\r_reg_reg[3] (\r_reg_reg[3] ),
        .s00_axis_tvalid(s00_axis_tvalid),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  design_2_BiDirChannels_0_0_dff_6 X1
       (.a(a),
        .b(b),
        .clk0(clk0),
        .out_start_stop_int(out_start_stop_int),
        .\r_reg_reg[3] (\r_reg_reg[3] ),
        .s00_axis_tready(s00_axis_tready),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
endmodule

(* ORIG_REF_NAME = "syncReady" *) 
module design_2_BiDirChannels_0_0_syncReady_1
   (m00_axis_tvalid,
    in_next_int,
    clk0,
    \slv_reg0_reg[31] ,
    \r_reg_reg[3] ,
    in_start_stop_int);
  output m00_axis_tvalid;
  input in_next_int;
  input clk0;
  input \slv_reg0_reg[31] ;
  input \r_reg_reg[3] ;
  input in_start_stop_int;

  wire a;
  wire clk0;
  wire in_next_int;
  wire in_start_stop_int;
  wire m00_axis_tvalid;
  wire \r_reg_reg[3] ;
  wire \slv_reg0_reg[31] ;

  design_2_BiDirChannels_0_0_dff_3 X0
       (.a(a),
        .clk0(clk0),
        .in_next_int(in_next_int),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
  design_2_BiDirChannels_0_0_dff_4 X1
       (.a(a),
        .clk0(clk0),
        .in_start_stop_int(in_start_stop_int),
        .m00_axis_tvalid(m00_axis_tvalid),
        .\r_reg_reg[3] (\r_reg_reg[3] ),
        .\slv_reg0_reg[31] (\slv_reg0_reg[31] ));
endmodule

module design_2_BiDirChannels_0_0_upCounter12Bits
   (mux_out,
    Q_reg,
    \slv_reg0_reg[31] ,
    \slv_reg0_reg[14] ,
    \slv_reg0_reg[12] );
  output mux_out;
  input Q_reg;
  input \slv_reg0_reg[31] ;
  input [2:0]\slv_reg0_reg[14] ;
  input \slv_reg0_reg[12] ;

  wire Q_i_2_n_0;
  wire Q_i_3__0_n_0;
  wire Q_i_4__0_n_0;
  wire Q_i_5_n_0;
  wire Q_i_7_n_0;
  wire Q_i_8_n_0;
  wire Q_reg;
  wire [11:0]last_count_int;
  wire mux_out;
  wire \r_reg[0]_i_2_n_0 ;
  wire \r_reg_reg[0]_i_1_n_0 ;
  wire \r_reg_reg[0]_i_1_n_1 ;
  wire \r_reg_reg[0]_i_1_n_2 ;
  wire \r_reg_reg[0]_i_1_n_3 ;
  wire \r_reg_reg[0]_i_1_n_4 ;
  wire \r_reg_reg[0]_i_1_n_5 ;
  wire \r_reg_reg[0]_i_1_n_6 ;
  wire \r_reg_reg[0]_i_1_n_7 ;
  wire \r_reg_reg[4]_i_1_n_0 ;
  wire \r_reg_reg[4]_i_1_n_1 ;
  wire \r_reg_reg[4]_i_1_n_2 ;
  wire \r_reg_reg[4]_i_1_n_3 ;
  wire \r_reg_reg[4]_i_1_n_4 ;
  wire \r_reg_reg[4]_i_1_n_5 ;
  wire \r_reg_reg[4]_i_1_n_6 ;
  wire \r_reg_reg[4]_i_1_n_7 ;
  wire \r_reg_reg[8]_i_1_n_1 ;
  wire \r_reg_reg[8]_i_1_n_2 ;
  wire \r_reg_reg[8]_i_1_n_3 ;
  wire \r_reg_reg[8]_i_1_n_4 ;
  wire \r_reg_reg[8]_i_1_n_5 ;
  wire \r_reg_reg[8]_i_1_n_6 ;
  wire \r_reg_reg[8]_i_1_n_7 ;
  wire \slv_reg0_reg[12] ;
  wire [2:0]\slv_reg0_reg[14] ;
  wire \slv_reg0_reg[31] ;
  wire [3:3]\NLW_r_reg_reg[8]_i_1_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h0F4F0F4F004F0044)) 
    Q_i_1__3
       (.I0(\slv_reg0_reg[14] [2]),
        .I1(Q_i_2_n_0),
        .I2(Q_i_3__0_n_0),
        .I3(Q_i_4__0_n_0),
        .I4(Q_i_5_n_0),
        .I5(\slv_reg0_reg[12] ),
        .O(mux_out));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT5 #(
    .INIT(32'hBF030F03)) 
    Q_i_2
       (.I0(last_count_int[7]),
        .I1(\slv_reg0_reg[14] [0]),
        .I2(\slv_reg0_reg[14] [1]),
        .I3(last_count_int[5]),
        .I4(last_count_int[6]),
        .O(Q_i_2_n_0));
  LUT5 #(
    .INIT(32'hDCCCFFFC)) 
    Q_i_3__0
       (.I0(Q_i_7_n_0),
        .I1(Q_i_8_n_0),
        .I2(\slv_reg0_reg[14] [1]),
        .I3(\slv_reg0_reg[14] [0]),
        .I4(last_count_int[9]),
        .O(Q_i_3__0_n_0));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    Q_i_4__0
       (.I0(last_count_int[2]),
        .I1(last_count_int[4]),
        .I2(last_count_int[0]),
        .I3(last_count_int[3]),
        .I4(last_count_int[1]),
        .O(Q_i_4__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h8)) 
    Q_i_5
       (.I0(last_count_int[5]),
        .I1(last_count_int[6]),
        .O(Q_i_5_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    Q_i_7
       (.I0(last_count_int[2]),
        .I1(last_count_int[4]),
        .I2(last_count_int[3]),
        .I3(last_count_int[11]),
        .I4(last_count_int[5]),
        .I5(last_count_int[6]),
        .O(Q_i_7_n_0));
  LUT5 #(
    .INIT(32'h4FFFFFFF)) 
    Q_i_8
       (.I0(last_count_int[10]),
        .I1(\slv_reg0_reg[14] [1]),
        .I2(last_count_int[8]),
        .I3(\slv_reg0_reg[14] [2]),
        .I4(last_count_int[7]),
        .O(Q_i_8_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \r_reg[0]_i_2 
       (.I0(last_count_int[0]),
        .O(\r_reg[0]_i_2_n_0 ));
  FDCE \r_reg_reg[0] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg_reg[0]_i_1_n_7 ),
        .Q(last_count_int[0]));
  CARRY4 \r_reg_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\r_reg_reg[0]_i_1_n_0 ,\r_reg_reg[0]_i_1_n_1 ,\r_reg_reg[0]_i_1_n_2 ,\r_reg_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\r_reg_reg[0]_i_1_n_4 ,\r_reg_reg[0]_i_1_n_5 ,\r_reg_reg[0]_i_1_n_6 ,\r_reg_reg[0]_i_1_n_7 }),
        .S({last_count_int[3:1],\r_reg[0]_i_2_n_0 }));
  FDCE \r_reg_reg[10] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg_reg[8]_i_1_n_5 ),
        .Q(last_count_int[10]));
  FDCE \r_reg_reg[11] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg_reg[8]_i_1_n_4 ),
        .Q(last_count_int[11]));
  FDCE \r_reg_reg[1] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg_reg[0]_i_1_n_6 ),
        .Q(last_count_int[1]));
  FDCE \r_reg_reg[2] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg_reg[0]_i_1_n_5 ),
        .Q(last_count_int[2]));
  FDCE \r_reg_reg[3] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg_reg[0]_i_1_n_4 ),
        .Q(last_count_int[3]));
  FDCE \r_reg_reg[4] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg_reg[4]_i_1_n_7 ),
        .Q(last_count_int[4]));
  CARRY4 \r_reg_reg[4]_i_1 
       (.CI(\r_reg_reg[0]_i_1_n_0 ),
        .CO({\r_reg_reg[4]_i_1_n_0 ,\r_reg_reg[4]_i_1_n_1 ,\r_reg_reg[4]_i_1_n_2 ,\r_reg_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\r_reg_reg[4]_i_1_n_4 ,\r_reg_reg[4]_i_1_n_5 ,\r_reg_reg[4]_i_1_n_6 ,\r_reg_reg[4]_i_1_n_7 }),
        .S(last_count_int[7:4]));
  FDCE \r_reg_reg[5] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg_reg[4]_i_1_n_6 ),
        .Q(last_count_int[5]));
  FDCE \r_reg_reg[6] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg_reg[4]_i_1_n_5 ),
        .Q(last_count_int[6]));
  FDCE \r_reg_reg[7] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg_reg[4]_i_1_n_4 ),
        .Q(last_count_int[7]));
  FDCE \r_reg_reg[8] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg_reg[8]_i_1_n_7 ),
        .Q(last_count_int[8]));
  CARRY4 \r_reg_reg[8]_i_1 
       (.CI(\r_reg_reg[4]_i_1_n_0 ),
        .CO({\NLW_r_reg_reg[8]_i_1_CO_UNCONNECTED [3],\r_reg_reg[8]_i_1_n_1 ,\r_reg_reg[8]_i_1_n_2 ,\r_reg_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\r_reg_reg[8]_i_1_n_4 ,\r_reg_reg[8]_i_1_n_5 ,\r_reg_reg[8]_i_1_n_6 ,\r_reg_reg[8]_i_1_n_7 }),
        .S(last_count_int[11:8]));
  FDCE \r_reg_reg[9] 
       (.C(Q_reg),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(\r_reg_reg[8]_i_1_n_6 ),
        .Q(last_count_int[9]));
endmodule

module design_2_BiDirChannels_0_0_upCounter8Bits
   (mux_out,
    \slv_reg0_reg[18] ,
    s00_axi_aclk,
    \slv_reg0_reg[31] );
  output mux_out;
  input [2:0]\slv_reg0_reg[18] ;
  input s00_axi_aclk;
  input \slv_reg0_reg[31] ;

  wire Q_i_3_n_0;
  wire Q_i_4_n_0;
  wire data2;
  wire data3;
  wire data4;
  wire data5;
  wire data6;
  wire data7;
  wire mux_out;
  wire [6:0]r_next;
  wire \r_reg[6]_i_2_n_0 ;
  wire \r_reg_reg_n_0_[0] ;
  wire s00_axi_aclk;
  wire [2:0]\slv_reg0_reg[18] ;
  wire \slv_reg0_reg[31] ;

  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    Q_i_3
       (.I0(data3),
        .I1(data2),
        .I2(\slv_reg0_reg[18] [1]),
        .I3(\r_reg_reg_n_0_[0] ),
        .I4(\slv_reg0_reg[18] [0]),
        .I5(s00_axi_aclk),
        .O(Q_i_3_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    Q_i_4
       (.I0(data7),
        .I1(data6),
        .I2(\slv_reg0_reg[18] [1]),
        .I3(data5),
        .I4(\slv_reg0_reg[18] [0]),
        .I5(data4),
        .O(Q_i_4_n_0));
  MUXF7 Q_reg_i_2
       (.I0(Q_i_3_n_0),
        .I1(Q_i_4_n_0),
        .O(mux_out),
        .S(\slv_reg0_reg[18] [2]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \r_reg[0]_i_1__0 
       (.I0(\r_reg_reg_n_0_[0] ),
        .O(r_next[0]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_reg[1]_i_1 
       (.I0(\r_reg_reg_n_0_[0] ),
        .I1(data2),
        .O(r_next[1]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \r_reg[2]_i_1__0 
       (.I0(data3),
        .I1(\r_reg_reg_n_0_[0] ),
        .I2(data2),
        .O(r_next[2]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_reg[3]_i_1__0 
       (.I0(data2),
        .I1(\r_reg_reg_n_0_[0] ),
        .I2(data3),
        .I3(data4),
        .O(r_next[3]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \r_reg[4]_i_1__0 
       (.I0(data5),
        .I1(data2),
        .I2(\r_reg_reg_n_0_[0] ),
        .I3(data3),
        .I4(data4),
        .O(r_next[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \r_reg[5]_i_1__0 
       (.I0(data6),
        .I1(data4),
        .I2(data3),
        .I3(\r_reg_reg_n_0_[0] ),
        .I4(data2),
        .I5(data5),
        .O(r_next[5]));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \r_reg[6]_i_1 
       (.I0(data7),
        .I1(data5),
        .I2(\r_reg[6]_i_2_n_0 ),
        .I3(data6),
        .O(r_next[6]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \r_reg[6]_i_2 
       (.I0(data4),
        .I1(data3),
        .I2(\r_reg_reg_n_0_[0] ),
        .I3(data2),
        .O(\r_reg[6]_i_2_n_0 ));
  FDCE \r_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next[0]),
        .Q(\r_reg_reg_n_0_[0] ));
  FDCE \r_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next[1]),
        .Q(data2));
  FDCE \r_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next[2]),
        .Q(data3));
  FDCE \r_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next[3]),
        .Q(data4));
  FDCE \r_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next[4]),
        .Q(data5));
  FDCE \r_reg_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next[5]),
        .Q(data6));
  FDCE \r_reg_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\slv_reg0_reg[31] ),
        .D(r_next[6]),
        .Q(data7));
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
