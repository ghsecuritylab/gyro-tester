// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Wed Oct  9 10:53:07 2019
// Host        : LAPTOP-FM91H59Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_2_RxFIFO_0_sim_netlist.v
// Design      : design_2_RxFIFO_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_stream_fifo_v1_0
   (m00_axis_tvalid,
    s00_axi_awready,
    s00_axi_wready,
    s00_axi_arready,
    s00_axi_rdata,
    Q,
    s00_axi_rvalid,
    s00_axis_tready,
    s00_axi_bvalid,
    m00_axis_tready,
    s00_axis_aclk,
    m00_axis_aclk,
    s00_axis_tvalid,
    mem_write_data,
    s00_axi_aclk,
    s00_axi_araddr,
    s00_axi_arvalid,
    s00_axi_awaddr,
    s00_axi_wvalid,
    s00_axi_awvalid,
    m00_axis_aresetn,
    s00_axis_aresetn,
    s00_axi_aresetn,
    s00_axi_bready,
    s00_axi_rready,
    s00_axi_wdata,
    s00_axi_wstrb);
  output m00_axis_tvalid;
  output s00_axi_awready;
  output s00_axi_wready;
  output s00_axi_arready;
  output [28:0]s00_axi_rdata;
  output [32:0]Q;
  output s00_axi_rvalid;
  output s00_axis_tready;
  output s00_axi_bvalid;
  input m00_axis_tready;
  input s00_axis_aclk;
  input m00_axis_aclk;
  input s00_axis_tvalid;
  input [32:0]mem_write_data;
  input s00_axi_aclk;
  input [1:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input [1:0]s00_axi_awaddr;
  input s00_axi_wvalid;
  input s00_axi_awvalid;
  input m00_axis_aresetn;
  input s00_axis_aresetn;
  input s00_axi_aresetn;
  input s00_axi_bready;
  input s00_axi_rready;
  input [0:0]s00_axi_wdata;
  input [0:0]s00_axi_wstrb;

  wire [32:0]Q;
  wire axis_stream_fifo_v1_0_S00_AXI_inst_n_31;
  wire axis_stream_fifo_v1_0_S00_AXI_inst_n_32;
  wire axis_stream_fifo_v1_0_S00_AXI_inst_n_33;
  wire axis_stream_fifo_v1_0_S00_AXI_inst_n_34;
  wire axis_stream_fifo_v1_0_S00_AXI_inst_n_35;
  wire axis_stream_fifo_v1_0_S00_AXI_inst_n_36;
  wire axis_stream_fifo_v1_0_S00_AXI_inst_n_37;
  wire axis_stream_fifo_v1_0_S00_AXI_inst_n_38;
  wire axis_stream_fifo_v1_0_S00_AXI_inst_n_5;
  wire [28:0]dbg_word1_int;
  wire [30:16]dbg_word2_int;
  wire [12:0]dbg_word3_int;
  wire full0;
  wire full0_carry_n_1;
  wire full0_carry_n_2;
  wire full0_carry_n_3;
  wire m00_axis_aclk;
  wire m00_axis_aresetn;
  wire m00_axis_tready;
  wire m00_axis_tvalid;
  wire m00_axis_tvalid_reg_i_1_n_0;
  wire \m00_data_reg[31]_i_1_n_0 ;
  wire m00_rst_sync1_reg;
  wire m00_rst_sync1_reg0;
  wire m00_rst_sync2_reg;
  wire m00_rst_sync3_reg;
  wire [32:0]mem_read_data_reg;
  wire mem_read_data_valid_reg;
  wire mem_reg_3_n_61;
  wire [32:0]mem_write_data;
  wire p_0_in;
  wire p_0_in0_in;
  wire p_1_in;
  wire p_1_in1_in;
  wire \rd_addr_reg[0]_i_1_n_0 ;
  wire [12:0]rd_ptr_gray_reg;
  wire [12:0]rd_ptr_gray_sync1_reg;
  wire \rd_ptr_gray_sync2_reg_reg_n_0_[0] ;
  wire \rd_ptr_gray_sync2_reg_reg_n_0_[10] ;
  wire \rd_ptr_gray_sync2_reg_reg_n_0_[1] ;
  wire \rd_ptr_gray_sync2_reg_reg_n_0_[2] ;
  wire \rd_ptr_gray_sync2_reg_reg_n_0_[3] ;
  wire \rd_ptr_gray_sync2_reg_reg_n_0_[4] ;
  wire \rd_ptr_gray_sync2_reg_reg_n_0_[5] ;
  wire \rd_ptr_gray_sync2_reg_reg_n_0_[6] ;
  wire \rd_ptr_gray_sync2_reg_reg_n_0_[7] ;
  wire \rd_ptr_gray_sync2_reg_reg_n_0_[8] ;
  wire \rd_ptr_gray_sync2_reg_reg_n_0_[9] ;
  wire [12:12]rd_ptr_next;
  wire [12:1]rd_ptr_next0;
  wire rd_ptr_next0_carry__0_n_0;
  wire rd_ptr_next0_carry__0_n_1;
  wire rd_ptr_next0_carry__0_n_2;
  wire rd_ptr_next0_carry__0_n_3;
  wire rd_ptr_next0_carry__1_n_1;
  wire rd_ptr_next0_carry__1_n_2;
  wire rd_ptr_next0_carry__1_n_3;
  wire rd_ptr_next0_carry_n_0;
  wire rd_ptr_next0_carry_n_1;
  wire rd_ptr_next0_carry_n_2;
  wire rd_ptr_next0_carry_n_3;
  wire [11:1]rd_ptr_next_0;
  wire \rd_ptr_reg[0]_i_2_n_0 ;
  wire [12:0]rd_ptr_reg_reg;
  wire \rd_ptr_reg_reg[0]_i_1_n_0 ;
  wire \rd_ptr_reg_reg[0]_i_1_n_1 ;
  wire \rd_ptr_reg_reg[0]_i_1_n_2 ;
  wire \rd_ptr_reg_reg[0]_i_1_n_3 ;
  wire \rd_ptr_reg_reg[0]_i_1_n_4 ;
  wire \rd_ptr_reg_reg[0]_i_1_n_5 ;
  wire \rd_ptr_reg_reg[0]_i_1_n_6 ;
  wire \rd_ptr_reg_reg[0]_i_1_n_7 ;
  wire \rd_ptr_reg_reg[12]_i_1_n_7 ;
  wire \rd_ptr_reg_reg[4]_i_1_n_0 ;
  wire \rd_ptr_reg_reg[4]_i_1_n_1 ;
  wire \rd_ptr_reg_reg[4]_i_1_n_2 ;
  wire \rd_ptr_reg_reg[4]_i_1_n_3 ;
  wire \rd_ptr_reg_reg[4]_i_1_n_4 ;
  wire \rd_ptr_reg_reg[4]_i_1_n_5 ;
  wire \rd_ptr_reg_reg[4]_i_1_n_6 ;
  wire \rd_ptr_reg_reg[4]_i_1_n_7 ;
  wire \rd_ptr_reg_reg[8]_i_1_n_0 ;
  wire \rd_ptr_reg_reg[8]_i_1_n_1 ;
  wire \rd_ptr_reg_reg[8]_i_1_n_2 ;
  wire \rd_ptr_reg_reg[8]_i_1_n_3 ;
  wire \rd_ptr_reg_reg[8]_i_1_n_4 ;
  wire \rd_ptr_reg_reg[8]_i_1_n_5 ;
  wire \rd_ptr_reg_reg[8]_i_1_n_6 ;
  wire \rd_ptr_reg_reg[8]_i_1_n_7 ;
  wire read;
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
  wire [28:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [0:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [0:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire s00_axis_aclk;
  wire s00_axis_aresetn;
  wire s00_axis_tready;
  wire s00_axis_tready01_in;
  wire s00_axis_tvalid;
  wire s00_rst_sync1_reg;
  wire s00_rst_sync1_reg0;
  wire s00_rst_sync3_reg;
  wire [12:0]wr_addr_reg;
  wire \wr_addr_reg[0]_i_1_n_0 ;
  wire \wr_addr_reg[10]_i_1_n_0 ;
  wire \wr_addr_reg[11]_i_1_n_0 ;
  wire \wr_addr_reg[12]_i_1_n_0 ;
  wire \wr_addr_reg[12]_i_2_n_0 ;
  wire \wr_addr_reg[12]_i_3_n_0 ;
  wire \wr_addr_reg[1]_i_1_n_0 ;
  wire \wr_addr_reg[2]_i_1_n_0 ;
  wire \wr_addr_reg[3]_i_1_n_0 ;
  wire \wr_addr_reg[4]_i_1_n_0 ;
  wire \wr_addr_reg[5]_i_1_n_0 ;
  wire \wr_addr_reg[6]_i_1_n_0 ;
  wire \wr_addr_reg[7]_i_1_n_0 ;
  wire \wr_addr_reg[8]_i_1_n_0 ;
  wire \wr_addr_reg[9]_i_1_n_0 ;
  wire \wr_ptr_gray_reg_reg_n_0_[0] ;
  wire \wr_ptr_gray_reg_reg_n_0_[10] ;
  wire \wr_ptr_gray_reg_reg_n_0_[1] ;
  wire \wr_ptr_gray_reg_reg_n_0_[2] ;
  wire \wr_ptr_gray_reg_reg_n_0_[3] ;
  wire \wr_ptr_gray_reg_reg_n_0_[4] ;
  wire \wr_ptr_gray_reg_reg_n_0_[5] ;
  wire \wr_ptr_gray_reg_reg_n_0_[6] ;
  wire \wr_ptr_gray_reg_reg_n_0_[7] ;
  wire \wr_ptr_gray_reg_reg_n_0_[8] ;
  wire \wr_ptr_gray_reg_reg_n_0_[9] ;
  wire [12:1]wr_ptr_next0;
  wire wr_ptr_next0_carry__0_n_0;
  wire wr_ptr_next0_carry__0_n_1;
  wire wr_ptr_next0_carry__0_n_2;
  wire wr_ptr_next0_carry__0_n_3;
  wire wr_ptr_next0_carry__1_n_1;
  wire wr_ptr_next0_carry__1_n_2;
  wire wr_ptr_next0_carry__1_n_3;
  wire wr_ptr_next0_carry_n_0;
  wire wr_ptr_next0_carry_n_1;
  wire wr_ptr_next0_carry_n_2;
  wire wr_ptr_next0_carry_n_3;
  wire [3:0]NLW_full0_carry_O_UNCONNECTED;
  wire NLW_mem_reg_0_CASCADEOUTA_UNCONNECTED;
  wire NLW_mem_reg_0_CASCADEOUTB_UNCONNECTED;
  wire NLW_mem_reg_0_DBITERR_UNCONNECTED;
  wire NLW_mem_reg_0_INJECTDBITERR_UNCONNECTED;
  wire NLW_mem_reg_0_INJECTSBITERR_UNCONNECTED;
  wire NLW_mem_reg_0_SBITERR_UNCONNECTED;
  wire [31:0]NLW_mem_reg_0_DOADO_UNCONNECTED;
  wire [31:8]NLW_mem_reg_0_DOBDO_UNCONNECTED;
  wire [3:0]NLW_mem_reg_0_DOPADOP_UNCONNECTED;
  wire [3:1]NLW_mem_reg_0_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_mem_reg_0_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_mem_reg_0_RDADDRECC_UNCONNECTED;
  wire NLW_mem_reg_1_CASCADEOUTA_UNCONNECTED;
  wire NLW_mem_reg_1_CASCADEOUTB_UNCONNECTED;
  wire NLW_mem_reg_1_DBITERR_UNCONNECTED;
  wire NLW_mem_reg_1_INJECTDBITERR_UNCONNECTED;
  wire NLW_mem_reg_1_INJECTSBITERR_UNCONNECTED;
  wire NLW_mem_reg_1_SBITERR_UNCONNECTED;
  wire [31:0]NLW_mem_reg_1_DOADO_UNCONNECTED;
  wire [31:8]NLW_mem_reg_1_DOBDO_UNCONNECTED;
  wire [3:0]NLW_mem_reg_1_DOPADOP_UNCONNECTED;
  wire [3:1]NLW_mem_reg_1_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_mem_reg_1_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_mem_reg_1_RDADDRECC_UNCONNECTED;
  wire NLW_mem_reg_2_CASCADEOUTA_UNCONNECTED;
  wire NLW_mem_reg_2_CASCADEOUTB_UNCONNECTED;
  wire NLW_mem_reg_2_DBITERR_UNCONNECTED;
  wire NLW_mem_reg_2_INJECTDBITERR_UNCONNECTED;
  wire NLW_mem_reg_2_INJECTSBITERR_UNCONNECTED;
  wire NLW_mem_reg_2_SBITERR_UNCONNECTED;
  wire [31:0]NLW_mem_reg_2_DOADO_UNCONNECTED;
  wire [31:8]NLW_mem_reg_2_DOBDO_UNCONNECTED;
  wire [3:0]NLW_mem_reg_2_DOPADOP_UNCONNECTED;
  wire [3:1]NLW_mem_reg_2_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_mem_reg_2_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_mem_reg_2_RDADDRECC_UNCONNECTED;
  wire NLW_mem_reg_3_CASCADEOUTA_UNCONNECTED;
  wire NLW_mem_reg_3_CASCADEOUTB_UNCONNECTED;
  wire NLW_mem_reg_3_DBITERR_UNCONNECTED;
  wire NLW_mem_reg_3_INJECTDBITERR_UNCONNECTED;
  wire NLW_mem_reg_3_INJECTSBITERR_UNCONNECTED;
  wire NLW_mem_reg_3_SBITERR_UNCONNECTED;
  wire [31:0]NLW_mem_reg_3_DOADO_UNCONNECTED;
  wire [31:7]NLW_mem_reg_3_DOBDO_UNCONNECTED;
  wire [3:0]NLW_mem_reg_3_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_mem_reg_3_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_mem_reg_3_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_mem_reg_3_RDADDRECC_UNCONNECTED;
  wire [3:3]NLW_rd_ptr_next0_carry__1_CO_UNCONNECTED;
  wire [3:0]\NLW_rd_ptr_reg_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_rd_ptr_reg_reg[12]_i_1_O_UNCONNECTED ;
  wire [3:3]NLW_wr_ptr_next0_carry__1_CO_UNCONNECTED;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_stream_fifo_v1_0_S00_AXI axis_stream_fifo_v1_0_S00_AXI_inst
       (.CO(full0),
        .D(dbg_word1_int[12:0]),
        .Q({p_1_in1_in,p_1_in,\wr_ptr_gray_reg_reg_n_0_[10] ,\wr_ptr_gray_reg_reg_n_0_[9] ,\wr_ptr_gray_reg_reg_n_0_[8] ,\wr_ptr_gray_reg_reg_n_0_[7] ,\wr_ptr_gray_reg_reg_n_0_[6] ,\wr_ptr_gray_reg_reg_n_0_[5] ,\wr_ptr_gray_reg_reg_n_0_[4] ,\wr_ptr_gray_reg_reg_n_0_[3] ,\wr_ptr_gray_reg_reg_n_0_[2] ,\wr_ptr_gray_reg_reg_n_0_[1] ,\wr_ptr_gray_reg_reg_n_0_[0] }),
        .S({axis_stream_fifo_v1_0_S00_AXI_inst_n_31,axis_stream_fifo_v1_0_S00_AXI_inst_n_32,axis_stream_fifo_v1_0_S00_AXI_inst_n_33,axis_stream_fifo_v1_0_S00_AXI_inst_n_34}),
        .SR(s00_rst_sync3_reg),
        .dbg_word1_int(dbg_word1_int[28:16]),
        .dbg_word2_int({dbg_word2_int[30],dbg_word2_int[28:16]}),
        .m00_axis_aresetn(m00_axis_aresetn),
        .m00_axis_tready(m00_axis_tready),
        .m00_axis_tvalid_reg_reg(m00_axis_tvalid),
        .m00_rst_sync1_reg(m00_rst_sync1_reg),
        .m00_rst_sync1_reg0(m00_rst_sync1_reg0),
        .m00_rst_sync2_reg(m00_rst_sync2_reg),
        .m00_rst_sync2_reg_reg(axis_stream_fifo_v1_0_S00_AXI_inst_n_38),
        .m00_rst_sync3_reg(m00_rst_sync3_reg),
        .m00_rst_sync3_reg_reg(axis_stream_fifo_v1_0_S00_AXI_inst_n_37),
        .mem_read_data_valid_reg(mem_read_data_valid_reg),
        .out(rd_ptr_reg_reg),
        .\rd_ptr_gray_reg_reg[12] (rd_ptr_gray_reg),
        .\rd_ptr_gray_sync2_reg_reg[12] ({p_0_in0_in,p_0_in,\rd_ptr_gray_sync2_reg_reg_n_0_[10] ,\rd_ptr_gray_sync2_reg_reg_n_0_[9] ,\rd_ptr_gray_sync2_reg_reg_n_0_[8] ,\rd_ptr_gray_sync2_reg_reg_n_0_[7] ,\rd_ptr_gray_sync2_reg_reg_n_0_[6] ,\rd_ptr_gray_sync2_reg_reg_n_0_[5] ,\rd_ptr_gray_sync2_reg_reg_n_0_[4] ,\rd_ptr_gray_sync2_reg_reg_n_0_[3] ,\rd_ptr_gray_sync2_reg_reg_n_0_[2] ,\rd_ptr_gray_sync2_reg_reg_n_0_[1] ,\rd_ptr_gray_sync2_reg_reg_n_0_[0] }),
        .rd_ptr_next(rd_ptr_next),
        .rd_ptr_next0(rd_ptr_next0),
        .rd_ptr_next_0(rd_ptr_next_0),
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
        .s00_axis_aresetn(s00_axis_aresetn),
        .s00_axis_tvalid(s00_axis_tvalid),
        .s00_rst_sync1_reg(s00_rst_sync1_reg),
        .s00_rst_sync1_reg0(s00_rst_sync1_reg0),
        .s00_rst_sync2_reg_reg(axis_stream_fifo_v1_0_S00_AXI_inst_n_36),
        .s00_rst_sync3_reg_reg(axis_stream_fifo_v1_0_S00_AXI_inst_n_35),
        .\wr_addr_reg_reg[12] (wr_addr_reg),
        .\wr_ptr_gray_reg_reg[11] (axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .wr_ptr_next0(wr_ptr_next0));
  CARRY4 full0_carry
       (.CI(1'b0),
        .CO({full0,full0_carry_n_1,full0_carry_n_2,full0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_full0_carry_O_UNCONNECTED[3:0]),
        .S({axis_stream_fifo_v1_0_S00_AXI_inst_n_31,axis_stream_fifo_v1_0_S00_AXI_inst_n_32,axis_stream_fifo_v1_0_S00_AXI_inst_n_33,axis_stream_fifo_v1_0_S00_AXI_inst_n_34}));
  LUT3 #(
    .INIT(8'hBA)) 
    m00_axis_tvalid_reg_i_1
       (.I0(mem_read_data_valid_reg),
        .I1(m00_axis_tready),
        .I2(m00_axis_tvalid),
        .O(m00_axis_tvalid_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    m00_axis_tvalid_reg_reg
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(m00_axis_tvalid_reg_i_1_n_0),
        .Q(m00_axis_tvalid),
        .R(m00_rst_sync3_reg));
  LUT1 #(
    .INIT(2'h1)) 
    \m00_data_reg[31]_i_1 
       (.I0(m00_axis_aresetn),
        .O(\m00_data_reg[31]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[0] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[10] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[10]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[11] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[11]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[12] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[12]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[13] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[13]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[14] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[14]),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[15] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[15]),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[16] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[16]),
        .Q(Q[16]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[17] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[17]),
        .Q(Q[17]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[18] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[18]),
        .Q(Q[18]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[19] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[19]),
        .Q(Q[19]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[1] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[20] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[20]),
        .Q(Q[20]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[21] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[21]),
        .Q(Q[21]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[22] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[22]),
        .Q(Q[22]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[23] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[23]),
        .Q(Q[23]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[24] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[24]),
        .Q(Q[24]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[25] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[25]),
        .Q(Q[25]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[26] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[26]),
        .Q(Q[26]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[27] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[27]),
        .Q(Q[27]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[28] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[28]),
        .Q(Q[28]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[29] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[29]),
        .Q(Q[29]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[2] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[30] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[30]),
        .Q(Q[30]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[31] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[31]),
        .Q(Q[31]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[32] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[32]),
        .Q(Q[32]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[3] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[4] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[5] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[6] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[7] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[8] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[8]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[9] 
       (.C(m00_axis_aclk),
        .CE(m00_axis_tready),
        .CLR(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[9]),
        .Q(Q[9]));
  FDRE #(
    .INIT(1'b1)) 
    m00_rst_sync1_reg_reg
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(m00_rst_sync1_reg0),
        .Q(m00_rst_sync1_reg),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    m00_rst_sync2_reg_reg
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(axis_stream_fifo_v1_0_S00_AXI_inst_n_38),
        .Q(m00_rst_sync2_reg),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    m00_rst_sync3_reg_reg
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(axis_stream_fifo_v1_0_S00_AXI_inst_n_37),
        .Q(m00_rst_sync3_reg),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    mem_read_data_valid_reg_reg
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(1'b1),
        .Q(mem_read_data_valid_reg),
        .R(m00_rst_sync3_reg));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p1_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p1_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "139264" *) 
  (* RTL_RAM_NAME = "mem" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "4095" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "8" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("NO_CHANGE"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    mem_reg_0
       (.ADDRARDADDR({1'b1,wr_addr_reg[11:0],1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,dbg_word1_int[27:16],1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b1),
        .CASCADEOUTA(NLW_mem_reg_0_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_mem_reg_0_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(s00_axis_aclk),
        .CLKBWRCLK(m00_axis_aclk),
        .DBITERR(NLW_mem_reg_0_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,mem_write_data[7:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,mem_write_data[8]}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b1}),
        .DOADO(NLW_mem_reg_0_DOADO_UNCONNECTED[31:0]),
        .DOBDO({NLW_mem_reg_0_DOBDO_UNCONNECTED[31:8],mem_read_data_reg[7:0]}),
        .DOPADOP(NLW_mem_reg_0_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP({NLW_mem_reg_0_DOPBDOP_UNCONNECTED[3:1],mem_read_data_reg[8]}),
        .ECCPARITY(NLW_mem_reg_0_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(s00_axis_tvalid),
        .ENBWREN(read),
        .INJECTDBITERR(NLW_mem_reg_0_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_mem_reg_0_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_mem_reg_0_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_mem_reg_0_SBITERR_UNCONNECTED),
        .WEA({s00_axis_tready01_in,s00_axis_tready01_in,s00_axis_tready01_in,s00_axis_tready01_in}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT3 #(
    .INIT(8'hBF)) 
    mem_reg_0_i_1
       (.I0(m00_axis_tready),
        .I1(m00_axis_tvalid),
        .I2(mem_read_data_valid_reg),
        .O(read));
  LUT5 #(
    .INIT(32'hFFD7D7FF)) 
    mem_reg_0_i_2
       (.I0(full0),
        .I1(p_0_in),
        .I2(p_1_in),
        .I3(p_1_in1_in),
        .I4(p_0_in0_in),
        .O(s00_axis_tready01_in));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p1_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p1_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "139264" *) 
  (* RTL_RAM_NAME = "mem" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "4095" *) 
  (* bram_slice_begin = "9" *) 
  (* bram_slice_end = "17" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("NO_CHANGE"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    mem_reg_1
       (.ADDRARDADDR({1'b1,wr_addr_reg[11:0],1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,dbg_word1_int[27:16],1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b1),
        .CASCADEOUTA(NLW_mem_reg_1_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_mem_reg_1_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(s00_axis_aclk),
        .CLKBWRCLK(m00_axis_aclk),
        .DBITERR(NLW_mem_reg_1_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,mem_write_data[16:9]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,mem_write_data[17]}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b1}),
        .DOADO(NLW_mem_reg_1_DOADO_UNCONNECTED[31:0]),
        .DOBDO({NLW_mem_reg_1_DOBDO_UNCONNECTED[31:8],mem_read_data_reg[16:9]}),
        .DOPADOP(NLW_mem_reg_1_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP({NLW_mem_reg_1_DOPBDOP_UNCONNECTED[3:1],mem_read_data_reg[17]}),
        .ECCPARITY(NLW_mem_reg_1_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(s00_axis_tvalid),
        .ENBWREN(read),
        .INJECTDBITERR(NLW_mem_reg_1_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_mem_reg_1_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_mem_reg_1_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_mem_reg_1_SBITERR_UNCONNECTED),
        .WEA({s00_axis_tready01_in,s00_axis_tready01_in,s00_axis_tready01_in,s00_axis_tready01_in}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p1_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p1_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "139264" *) 
  (* RTL_RAM_NAME = "mem" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "4095" *) 
  (* bram_slice_begin = "18" *) 
  (* bram_slice_end = "26" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("NO_CHANGE"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    mem_reg_2
       (.ADDRARDADDR({1'b1,wr_addr_reg[11:0],1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,dbg_word1_int[27:16],1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b1),
        .CASCADEOUTA(NLW_mem_reg_2_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_mem_reg_2_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(s00_axis_aclk),
        .CLKBWRCLK(m00_axis_aclk),
        .DBITERR(NLW_mem_reg_2_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,mem_write_data[25:18]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,mem_write_data[26]}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b1}),
        .DOADO(NLW_mem_reg_2_DOADO_UNCONNECTED[31:0]),
        .DOBDO({NLW_mem_reg_2_DOBDO_UNCONNECTED[31:8],mem_read_data_reg[25:18]}),
        .DOPADOP(NLW_mem_reg_2_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP({NLW_mem_reg_2_DOPBDOP_UNCONNECTED[3:1],mem_read_data_reg[26]}),
        .ECCPARITY(NLW_mem_reg_2_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(s00_axis_tvalid),
        .ENBWREN(read),
        .INJECTDBITERR(NLW_mem_reg_2_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_mem_reg_2_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_mem_reg_2_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_mem_reg_2_SBITERR_UNCONNECTED),
        .WEA({s00_axis_tready01_in,s00_axis_tready01_in,s00_axis_tready01_in,s00_axis_tready01_in}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d7" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d7" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "139264" *) 
  (* RTL_RAM_NAME = "mem" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "4095" *) 
  (* bram_slice_begin = "27" *) 
  (* bram_slice_end = "33" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("NO_CHANGE"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    mem_reg_3
       (.ADDRARDADDR({1'b1,wr_addr_reg[11:0],1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,dbg_word1_int[27:16],1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b1),
        .CASCADEOUTA(NLW_mem_reg_3_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_mem_reg_3_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(s00_axis_aclk),
        .CLKBWRCLK(m00_axis_aclk),
        .DBITERR(NLW_mem_reg_3_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,mem_write_data[32:27]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(NLW_mem_reg_3_DOADO_UNCONNECTED[31:0]),
        .DOBDO({NLW_mem_reg_3_DOBDO_UNCONNECTED[31:7],mem_reg_3_n_61,mem_read_data_reg[32:27]}),
        .DOPADOP(NLW_mem_reg_3_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_mem_reg_3_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_mem_reg_3_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(s00_axis_tvalid),
        .ENBWREN(read),
        .INJECTDBITERR(NLW_mem_reg_3_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_mem_reg_3_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_mem_reg_3_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_mem_reg_3_SBITERR_UNCONNECTED),
        .WEA({s00_axis_tready01_in,s00_axis_tready01_in,s00_axis_tready01_in,s00_axis_tready01_in}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'h6555)) 
    \rd_addr_reg[0]_i_1 
       (.I0(rd_ptr_reg_reg[0]),
        .I1(m00_axis_tready),
        .I2(m00_axis_tvalid),
        .I3(mem_read_data_valid_reg),
        .O(\rd_addr_reg[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg_reg[0] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(\rd_addr_reg[0]_i_1_n_0 ),
        .Q(dbg_word1_int[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg_reg[10] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_next_0[10]),
        .Q(dbg_word1_int[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg_reg[11] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_next_0[11]),
        .Q(dbg_word1_int[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg_reg[12] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_next),
        .Q(dbg_word1_int[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg_reg[1] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_next_0[1]),
        .Q(dbg_word1_int[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg_reg[2] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_next_0[2]),
        .Q(dbg_word1_int[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg_reg[3] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_next_0[3]),
        .Q(dbg_word1_int[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg_reg[4] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_next_0[4]),
        .Q(dbg_word1_int[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg_reg[5] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_next_0[5]),
        .Q(dbg_word1_int[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg_reg[6] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_next_0[6]),
        .Q(dbg_word1_int[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg_reg[7] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_next_0[7]),
        .Q(dbg_word1_int[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg_reg[8] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_next_0[8]),
        .Q(dbg_word1_int[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg_reg[9] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_next_0[9]),
        .Q(dbg_word1_int[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_reg_reg[0] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word1_int[0]),
        .Q(rd_ptr_gray_reg[0]),
        .R(m00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_reg_reg[10] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word1_int[10]),
        .Q(rd_ptr_gray_reg[10]),
        .R(m00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_reg_reg[11] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word1_int[11]),
        .Q(rd_ptr_gray_reg[11]),
        .R(m00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_reg_reg[12] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word1_int[12]),
        .Q(rd_ptr_gray_reg[12]),
        .R(m00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_reg_reg[1] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word1_int[1]),
        .Q(rd_ptr_gray_reg[1]),
        .R(m00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_reg_reg[2] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word1_int[2]),
        .Q(rd_ptr_gray_reg[2]),
        .R(m00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_reg_reg[3] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word1_int[3]),
        .Q(rd_ptr_gray_reg[3]),
        .R(m00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_reg_reg[4] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word1_int[4]),
        .Q(rd_ptr_gray_reg[4]),
        .R(m00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_reg_reg[5] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word1_int[5]),
        .Q(rd_ptr_gray_reg[5]),
        .R(m00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_reg_reg[6] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word1_int[6]),
        .Q(rd_ptr_gray_reg[6]),
        .R(m00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_reg_reg[7] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word1_int[7]),
        .Q(rd_ptr_gray_reg[7]),
        .R(m00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_reg_reg[8] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word1_int[8]),
        .Q(rd_ptr_gray_reg[8]),
        .R(m00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_reg_reg[9] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word1_int[9]),
        .Q(rd_ptr_gray_reg[9]),
        .R(m00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync1_reg_reg[0] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_reg[0]),
        .Q(rd_ptr_gray_sync1_reg[0]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync1_reg_reg[10] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_reg[10]),
        .Q(rd_ptr_gray_sync1_reg[10]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync1_reg_reg[11] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_reg[11]),
        .Q(rd_ptr_gray_sync1_reg[11]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync1_reg_reg[12] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_reg[12]),
        .Q(rd_ptr_gray_sync1_reg[12]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync1_reg_reg[1] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_reg[1]),
        .Q(rd_ptr_gray_sync1_reg[1]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync1_reg_reg[2] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_reg[2]),
        .Q(rd_ptr_gray_sync1_reg[2]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync1_reg_reg[3] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_reg[3]),
        .Q(rd_ptr_gray_sync1_reg[3]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync1_reg_reg[4] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_reg[4]),
        .Q(rd_ptr_gray_sync1_reg[4]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync1_reg_reg[5] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_reg[5]),
        .Q(rd_ptr_gray_sync1_reg[5]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync1_reg_reg[6] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_reg[6]),
        .Q(rd_ptr_gray_sync1_reg[6]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync1_reg_reg[7] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_reg[7]),
        .Q(rd_ptr_gray_sync1_reg[7]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync1_reg_reg[8] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_reg[8]),
        .Q(rd_ptr_gray_sync1_reg[8]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync1_reg_reg[9] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_reg[9]),
        .Q(rd_ptr_gray_sync1_reg[9]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync2_reg_reg[0] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_sync1_reg[0]),
        .Q(\rd_ptr_gray_sync2_reg_reg_n_0_[0] ),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync2_reg_reg[10] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_sync1_reg[10]),
        .Q(\rd_ptr_gray_sync2_reg_reg_n_0_[10] ),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync2_reg_reg[11] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_sync1_reg[11]),
        .Q(p_0_in),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync2_reg_reg[12] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_sync1_reg[12]),
        .Q(p_0_in0_in),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync2_reg_reg[1] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_sync1_reg[1]),
        .Q(\rd_ptr_gray_sync2_reg_reg_n_0_[1] ),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync2_reg_reg[2] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_sync1_reg[2]),
        .Q(\rd_ptr_gray_sync2_reg_reg_n_0_[2] ),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync2_reg_reg[3] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_sync1_reg[3]),
        .Q(\rd_ptr_gray_sync2_reg_reg_n_0_[3] ),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync2_reg_reg[4] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_sync1_reg[4]),
        .Q(\rd_ptr_gray_sync2_reg_reg_n_0_[4] ),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync2_reg_reg[5] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_sync1_reg[5]),
        .Q(\rd_ptr_gray_sync2_reg_reg_n_0_[5] ),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync2_reg_reg[6] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_sync1_reg[6]),
        .Q(\rd_ptr_gray_sync2_reg_reg_n_0_[6] ),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync2_reg_reg[7] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_sync1_reg[7]),
        .Q(\rd_ptr_gray_sync2_reg_reg_n_0_[7] ),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync2_reg_reg[8] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_sync1_reg[8]),
        .Q(\rd_ptr_gray_sync2_reg_reg_n_0_[8] ),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_gray_sync2_reg_reg[9] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(rd_ptr_gray_sync1_reg[9]),
        .Q(\rd_ptr_gray_sync2_reg_reg_n_0_[9] ),
        .R(s00_rst_sync3_reg));
  CARRY4 rd_ptr_next0_carry
       (.CI(1'b0),
        .CO({rd_ptr_next0_carry_n_0,rd_ptr_next0_carry_n_1,rd_ptr_next0_carry_n_2,rd_ptr_next0_carry_n_3}),
        .CYINIT(rd_ptr_reg_reg[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rd_ptr_next0[4:1]),
        .S(rd_ptr_reg_reg[4:1]));
  CARRY4 rd_ptr_next0_carry__0
       (.CI(rd_ptr_next0_carry_n_0),
        .CO({rd_ptr_next0_carry__0_n_0,rd_ptr_next0_carry__0_n_1,rd_ptr_next0_carry__0_n_2,rd_ptr_next0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rd_ptr_next0[8:5]),
        .S(rd_ptr_reg_reg[8:5]));
  CARRY4 rd_ptr_next0_carry__1
       (.CI(rd_ptr_next0_carry__0_n_0),
        .CO({NLW_rd_ptr_next0_carry__1_CO_UNCONNECTED[3],rd_ptr_next0_carry__1_n_1,rd_ptr_next0_carry__1_n_2,rd_ptr_next0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rd_ptr_next0[12:9]),
        .S(rd_ptr_reg_reg[12:9]));
  LUT4 #(
    .INIT(16'h6555)) 
    \rd_ptr_reg[0]_i_2 
       (.I0(rd_ptr_reg_reg[0]),
        .I1(m00_axis_tready),
        .I2(m00_axis_tvalid),
        .I3(mem_read_data_valid_reg),
        .O(\rd_ptr_reg[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_reg[0] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(\rd_ptr_reg_reg[0]_i_1_n_7 ),
        .Q(rd_ptr_reg_reg[0]),
        .R(m00_rst_sync3_reg));
  CARRY4 \rd_ptr_reg_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\rd_ptr_reg_reg[0]_i_1_n_0 ,\rd_ptr_reg_reg[0]_i_1_n_1 ,\rd_ptr_reg_reg[0]_i_1_n_2 ,\rd_ptr_reg_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,rd_ptr_reg_reg[0]}),
        .O({\rd_ptr_reg_reg[0]_i_1_n_4 ,\rd_ptr_reg_reg[0]_i_1_n_5 ,\rd_ptr_reg_reg[0]_i_1_n_6 ,\rd_ptr_reg_reg[0]_i_1_n_7 }),
        .S({rd_ptr_reg_reg[3:1],\rd_ptr_reg[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_reg[10] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(\rd_ptr_reg_reg[8]_i_1_n_5 ),
        .Q(rd_ptr_reg_reg[10]),
        .R(m00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_reg[11] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(\rd_ptr_reg_reg[8]_i_1_n_4 ),
        .Q(rd_ptr_reg_reg[11]),
        .R(m00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_reg[12] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(\rd_ptr_reg_reg[12]_i_1_n_7 ),
        .Q(rd_ptr_reg_reg[12]),
        .R(m00_rst_sync3_reg));
  CARRY4 \rd_ptr_reg_reg[12]_i_1 
       (.CI(\rd_ptr_reg_reg[8]_i_1_n_0 ),
        .CO(\NLW_rd_ptr_reg_reg[12]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_rd_ptr_reg_reg[12]_i_1_O_UNCONNECTED [3:1],\rd_ptr_reg_reg[12]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,rd_ptr_reg_reg[12]}));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_reg[1] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(\rd_ptr_reg_reg[0]_i_1_n_6 ),
        .Q(rd_ptr_reg_reg[1]),
        .R(m00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_reg[2] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(\rd_ptr_reg_reg[0]_i_1_n_5 ),
        .Q(rd_ptr_reg_reg[2]),
        .R(m00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_reg[3] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(\rd_ptr_reg_reg[0]_i_1_n_4 ),
        .Q(rd_ptr_reg_reg[3]),
        .R(m00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_reg[4] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(\rd_ptr_reg_reg[4]_i_1_n_7 ),
        .Q(rd_ptr_reg_reg[4]),
        .R(m00_rst_sync3_reg));
  CARRY4 \rd_ptr_reg_reg[4]_i_1 
       (.CI(\rd_ptr_reg_reg[0]_i_1_n_0 ),
        .CO({\rd_ptr_reg_reg[4]_i_1_n_0 ,\rd_ptr_reg_reg[4]_i_1_n_1 ,\rd_ptr_reg_reg[4]_i_1_n_2 ,\rd_ptr_reg_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\rd_ptr_reg_reg[4]_i_1_n_4 ,\rd_ptr_reg_reg[4]_i_1_n_5 ,\rd_ptr_reg_reg[4]_i_1_n_6 ,\rd_ptr_reg_reg[4]_i_1_n_7 }),
        .S(rd_ptr_reg_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_reg[5] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(\rd_ptr_reg_reg[4]_i_1_n_6 ),
        .Q(rd_ptr_reg_reg[5]),
        .R(m00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_reg[6] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(\rd_ptr_reg_reg[4]_i_1_n_5 ),
        .Q(rd_ptr_reg_reg[6]),
        .R(m00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_reg[7] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(\rd_ptr_reg_reg[4]_i_1_n_4 ),
        .Q(rd_ptr_reg_reg[7]),
        .R(m00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_reg[8] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(\rd_ptr_reg_reg[8]_i_1_n_7 ),
        .Q(rd_ptr_reg_reg[8]),
        .R(m00_rst_sync3_reg));
  CARRY4 \rd_ptr_reg_reg[8]_i_1 
       (.CI(\rd_ptr_reg_reg[4]_i_1_n_0 ),
        .CO({\rd_ptr_reg_reg[8]_i_1_n_0 ,\rd_ptr_reg_reg[8]_i_1_n_1 ,\rd_ptr_reg_reg[8]_i_1_n_2 ,\rd_ptr_reg_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\rd_ptr_reg_reg[8]_i_1_n_4 ,\rd_ptr_reg_reg[8]_i_1_n_5 ,\rd_ptr_reg_reg[8]_i_1_n_6 ,\rd_ptr_reg_reg[8]_i_1_n_7 }),
        .S(rd_ptr_reg_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_reg[9] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(\rd_ptr_reg_reg[8]_i_1_n_6 ),
        .Q(rd_ptr_reg_reg[9]),
        .R(m00_rst_sync3_reg));
  LUT6 #(
    .INIT(64'h5555511551155555)) 
    s00_axis_tready_INST_0
       (.I0(s00_rst_sync3_reg),
        .I1(full0),
        .I2(p_0_in),
        .I3(p_1_in),
        .I4(p_1_in1_in),
        .I5(p_0_in0_in),
        .O(s00_axis_tready));
  FDRE #(
    .INIT(1'b1)) 
    s00_rst_sync1_reg_reg
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(s00_rst_sync1_reg0),
        .Q(s00_rst_sync1_reg),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    s00_rst_sync2_reg_reg
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(axis_stream_fifo_v1_0_S00_AXI_inst_n_36),
        .Q(dbg_word2_int[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    s00_rst_sync3_reg_reg
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(axis_stream_fifo_v1_0_S00_AXI_inst_n_35),
        .Q(s00_rst_sync3_reg),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \wr_addr_reg[0]_i_1 
       (.I0(dbg_word2_int[16]),
        .I1(axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .O(\wr_addr_reg[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wr_addr_reg[10]_i_1 
       (.I0(dbg_word2_int[26]),
        .I1(axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .I2(wr_ptr_next0[10]),
        .O(\wr_addr_reg[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wr_addr_reg[11]_i_1 
       (.I0(dbg_word2_int[27]),
        .I1(axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .I2(wr_ptr_next0[11]),
        .O(\wr_addr_reg[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFAAAA8000AAAA)) 
    \wr_addr_reg[12]_i_1 
       (.I0(dbg_word2_int[28]),
        .I1(full0),
        .I2(\wr_addr_reg[12]_i_2_n_0 ),
        .I3(\wr_addr_reg[12]_i_3_n_0 ),
        .I4(s00_axis_tvalid),
        .I5(wr_ptr_next0[12]),
        .O(\wr_addr_reg[12]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \wr_addr_reg[12]_i_2 
       (.I0(p_1_in),
        .I1(p_0_in),
        .O(\wr_addr_reg[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \wr_addr_reg[12]_i_3 
       (.I0(p_1_in1_in),
        .I1(p_0_in0_in),
        .O(\wr_addr_reg[12]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wr_addr_reg[1]_i_1 
       (.I0(dbg_word2_int[17]),
        .I1(axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .I2(wr_ptr_next0[1]),
        .O(\wr_addr_reg[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wr_addr_reg[2]_i_1 
       (.I0(dbg_word2_int[18]),
        .I1(axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .I2(wr_ptr_next0[2]),
        .O(\wr_addr_reg[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wr_addr_reg[3]_i_1 
       (.I0(dbg_word2_int[19]),
        .I1(axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .I2(wr_ptr_next0[3]),
        .O(\wr_addr_reg[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wr_addr_reg[4]_i_1 
       (.I0(dbg_word2_int[20]),
        .I1(axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .I2(wr_ptr_next0[4]),
        .O(\wr_addr_reg[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wr_addr_reg[5]_i_1 
       (.I0(dbg_word2_int[21]),
        .I1(axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .I2(wr_ptr_next0[5]),
        .O(\wr_addr_reg[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wr_addr_reg[6]_i_1 
       (.I0(dbg_word2_int[22]),
        .I1(axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .I2(wr_ptr_next0[6]),
        .O(\wr_addr_reg[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wr_addr_reg[7]_i_1 
       (.I0(dbg_word2_int[23]),
        .I1(axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .I2(wr_ptr_next0[7]),
        .O(\wr_addr_reg[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wr_addr_reg[8]_i_1 
       (.I0(dbg_word2_int[24]),
        .I1(axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .I2(wr_ptr_next0[8]),
        .O(\wr_addr_reg[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wr_addr_reg[9]_i_1 
       (.I0(dbg_word2_int[25]),
        .I1(axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .I2(wr_ptr_next0[9]),
        .O(\wr_addr_reg[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg_reg[0] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[0]_i_1_n_0 ),
        .Q(wr_addr_reg[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg_reg[10] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[10]_i_1_n_0 ),
        .Q(wr_addr_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg_reg[11] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[11]_i_1_n_0 ),
        .Q(wr_addr_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg_reg[12] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[12]_i_1_n_0 ),
        .Q(wr_addr_reg[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg_reg[1] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[1]_i_1_n_0 ),
        .Q(wr_addr_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg_reg[2] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[2]_i_1_n_0 ),
        .Q(wr_addr_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg_reg[3] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[3]_i_1_n_0 ),
        .Q(wr_addr_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg_reg[4] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[4]_i_1_n_0 ),
        .Q(wr_addr_reg[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg_reg[5] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[5]_i_1_n_0 ),
        .Q(wr_addr_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg_reg[6] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[6]_i_1_n_0 ),
        .Q(wr_addr_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg_reg[7] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[7]_i_1_n_0 ),
        .Q(wr_addr_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg_reg[8] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[8]_i_1_n_0 ),
        .Q(wr_addr_reg[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg_reg[9] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[9]_i_1_n_0 ),
        .Q(wr_addr_reg[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hB88B)) 
    \wr_ptr_gray_reg[0]_i_1 
       (.I0(\wr_ptr_gray_reg_reg_n_0_[0] ),
        .I1(axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .I2(dbg_word2_int[16]),
        .I3(wr_ptr_next0[1]),
        .O(dbg_word3_int[0]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h8BB8)) 
    \wr_ptr_gray_reg[10]_i_1 
       (.I0(\wr_ptr_gray_reg_reg_n_0_[10] ),
        .I1(axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .I2(wr_ptr_next0[10]),
        .I3(wr_ptr_next0[11]),
        .O(dbg_word3_int[10]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h8BB8)) 
    \wr_ptr_gray_reg[11]_i_1 
       (.I0(p_1_in),
        .I1(axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .I2(wr_ptr_next0[11]),
        .I3(wr_ptr_next0[12]),
        .O(dbg_word3_int[11]));
  LUT6 #(
    .INIT(64'hF7FFF0F00080F0F0)) 
    \wr_ptr_gray_reg[12]_i_1 
       (.I0(full0),
        .I1(\wr_addr_reg[12]_i_2_n_0 ),
        .I2(p_1_in1_in),
        .I3(p_0_in0_in),
        .I4(s00_axis_tvalid),
        .I5(wr_ptr_next0[12]),
        .O(dbg_word3_int[12]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h8BB8)) 
    \wr_ptr_gray_reg[1]_i_1 
       (.I0(\wr_ptr_gray_reg_reg_n_0_[1] ),
        .I1(axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .I2(wr_ptr_next0[1]),
        .I3(wr_ptr_next0[2]),
        .O(dbg_word3_int[1]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h8BB8)) 
    \wr_ptr_gray_reg[2]_i_1 
       (.I0(\wr_ptr_gray_reg_reg_n_0_[2] ),
        .I1(axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .I2(wr_ptr_next0[2]),
        .I3(wr_ptr_next0[3]),
        .O(dbg_word3_int[2]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h8BB8)) 
    \wr_ptr_gray_reg[3]_i_1 
       (.I0(\wr_ptr_gray_reg_reg_n_0_[3] ),
        .I1(axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .I2(wr_ptr_next0[3]),
        .I3(wr_ptr_next0[4]),
        .O(dbg_word3_int[3]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h8BB8)) 
    \wr_ptr_gray_reg[4]_i_1 
       (.I0(\wr_ptr_gray_reg_reg_n_0_[4] ),
        .I1(axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .I2(wr_ptr_next0[4]),
        .I3(wr_ptr_next0[5]),
        .O(dbg_word3_int[4]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h8BB8)) 
    \wr_ptr_gray_reg[5]_i_1 
       (.I0(\wr_ptr_gray_reg_reg_n_0_[5] ),
        .I1(axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .I2(wr_ptr_next0[5]),
        .I3(wr_ptr_next0[6]),
        .O(dbg_word3_int[5]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h8BB8)) 
    \wr_ptr_gray_reg[6]_i_1 
       (.I0(\wr_ptr_gray_reg_reg_n_0_[6] ),
        .I1(axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .I2(wr_ptr_next0[6]),
        .I3(wr_ptr_next0[7]),
        .O(dbg_word3_int[6]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h8BB8)) 
    \wr_ptr_gray_reg[7]_i_1 
       (.I0(\wr_ptr_gray_reg_reg_n_0_[7] ),
        .I1(axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .I2(wr_ptr_next0[7]),
        .I3(wr_ptr_next0[8]),
        .O(dbg_word3_int[7]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h8BB8)) 
    \wr_ptr_gray_reg[8]_i_1 
       (.I0(\wr_ptr_gray_reg_reg_n_0_[8] ),
        .I1(axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .I2(wr_ptr_next0[8]),
        .I3(wr_ptr_next0[9]),
        .O(dbg_word3_int[8]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h8BB8)) 
    \wr_ptr_gray_reg[9]_i_1 
       (.I0(\wr_ptr_gray_reg_reg_n_0_[9] ),
        .I1(axis_stream_fifo_v1_0_S00_AXI_inst_n_5),
        .I2(wr_ptr_next0[9]),
        .I3(wr_ptr_next0[10]),
        .O(dbg_word3_int[9]));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_gray_reg_reg[0] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word3_int[0]),
        .Q(\wr_ptr_gray_reg_reg_n_0_[0] ),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_gray_reg_reg[10] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word3_int[10]),
        .Q(\wr_ptr_gray_reg_reg_n_0_[10] ),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_gray_reg_reg[11] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word3_int[11]),
        .Q(p_1_in),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_gray_reg_reg[12] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word3_int[12]),
        .Q(p_1_in1_in),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_gray_reg_reg[1] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word3_int[1]),
        .Q(\wr_ptr_gray_reg_reg_n_0_[1] ),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_gray_reg_reg[2] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word3_int[2]),
        .Q(\wr_ptr_gray_reg_reg_n_0_[2] ),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_gray_reg_reg[3] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word3_int[3]),
        .Q(\wr_ptr_gray_reg_reg_n_0_[3] ),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_gray_reg_reg[4] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word3_int[4]),
        .Q(\wr_ptr_gray_reg_reg_n_0_[4] ),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_gray_reg_reg[5] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word3_int[5]),
        .Q(\wr_ptr_gray_reg_reg_n_0_[5] ),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_gray_reg_reg[6] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word3_int[6]),
        .Q(\wr_ptr_gray_reg_reg_n_0_[6] ),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_gray_reg_reg[7] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word3_int[7]),
        .Q(\wr_ptr_gray_reg_reg_n_0_[7] ),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_gray_reg_reg[8] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word3_int[8]),
        .Q(\wr_ptr_gray_reg_reg_n_0_[8] ),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_gray_reg_reg[9] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(dbg_word3_int[9]),
        .Q(\wr_ptr_gray_reg_reg_n_0_[9] ),
        .R(s00_rst_sync3_reg));
  CARRY4 wr_ptr_next0_carry
       (.CI(1'b0),
        .CO({wr_ptr_next0_carry_n_0,wr_ptr_next0_carry_n_1,wr_ptr_next0_carry_n_2,wr_ptr_next0_carry_n_3}),
        .CYINIT(dbg_word2_int[16]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(wr_ptr_next0[4:1]),
        .S(dbg_word2_int[20:17]));
  CARRY4 wr_ptr_next0_carry__0
       (.CI(wr_ptr_next0_carry_n_0),
        .CO({wr_ptr_next0_carry__0_n_0,wr_ptr_next0_carry__0_n_1,wr_ptr_next0_carry__0_n_2,wr_ptr_next0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(wr_ptr_next0[8:5]),
        .S(dbg_word2_int[24:21]));
  CARRY4 wr_ptr_next0_carry__1
       (.CI(wr_ptr_next0_carry__0_n_0),
        .CO({NLW_wr_ptr_next0_carry__1_CO_UNCONNECTED[3],wr_ptr_next0_carry__1_n_1,wr_ptr_next0_carry__1_n_2,wr_ptr_next0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(wr_ptr_next0[12:9]),
        .S(dbg_word2_int[28:25]));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg_reg[0] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[0]_i_1_n_0 ),
        .Q(dbg_word2_int[16]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg_reg[10] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[10]_i_1_n_0 ),
        .Q(dbg_word2_int[26]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg_reg[11] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[11]_i_1_n_0 ),
        .Q(dbg_word2_int[27]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg_reg[12] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[12]_i_1_n_0 ),
        .Q(dbg_word2_int[28]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg_reg[1] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[1]_i_1_n_0 ),
        .Q(dbg_word2_int[17]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg_reg[2] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[2]_i_1_n_0 ),
        .Q(dbg_word2_int[18]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg_reg[3] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[3]_i_1_n_0 ),
        .Q(dbg_word2_int[19]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg_reg[4] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[4]_i_1_n_0 ),
        .Q(dbg_word2_int[20]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg_reg[5] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[5]_i_1_n_0 ),
        .Q(dbg_word2_int[21]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg_reg[6] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[6]_i_1_n_0 ),
        .Q(dbg_word2_int[22]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg_reg[7] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[7]_i_1_n_0 ),
        .Q(dbg_word2_int[23]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg_reg[8] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[8]_i_1_n_0 ),
        .Q(dbg_word2_int[24]),
        .R(s00_rst_sync3_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg_reg[9] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\wr_addr_reg[9]_i_1_n_0 ),
        .Q(dbg_word2_int[25]),
        .R(s00_rst_sync3_reg));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_stream_fifo_v1_0_S00_AXI
   (s00_axi_awready,
    s00_axi_wready,
    s00_axi_arready,
    s00_axi_bvalid,
    s00_axi_rvalid,
    \wr_ptr_gray_reg_reg[11] ,
    D,
    rd_ptr_next_0,
    rd_ptr_next,
    S,
    s00_rst_sync3_reg_reg,
    s00_rst_sync2_reg_reg,
    m00_rst_sync3_reg_reg,
    m00_rst_sync2_reg_reg,
    s00_axi_rdata,
    s00_rst_sync1_reg0,
    m00_rst_sync1_reg0,
    s00_axi_aclk,
    dbg_word2_int,
    out,
    Q,
    wr_ptr_next0,
    \rd_ptr_gray_reg_reg[12] ,
    mem_read_data_valid_reg,
    m00_axis_tvalid_reg_reg,
    m00_axis_tready,
    rd_ptr_next0,
    CO,
    \rd_ptr_gray_sync2_reg_reg[12] ,
    s00_axis_tvalid,
    m00_rst_sync1_reg,
    s00_rst_sync1_reg,
    m00_rst_sync2_reg,
    m00_rst_sync3_reg,
    SR,
    \wr_addr_reg_reg[12] ,
    dbg_word1_int,
    s00_axi_aresetn,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_bready,
    s00_axi_arvalid,
    s00_axi_rready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axis_aresetn,
    m00_axis_aresetn,
    s00_axi_araddr,
    s00_axi_awaddr);
  output s00_axi_awready;
  output s00_axi_wready;
  output s00_axi_arready;
  output s00_axi_bvalid;
  output s00_axi_rvalid;
  output \wr_ptr_gray_reg_reg[11] ;
  output [12:0]D;
  output [10:0]rd_ptr_next_0;
  output [0:0]rd_ptr_next;
  output [3:0]S;
  output s00_rst_sync3_reg_reg;
  output s00_rst_sync2_reg_reg;
  output m00_rst_sync3_reg_reg;
  output m00_rst_sync2_reg_reg;
  output [28:0]s00_axi_rdata;
  output s00_rst_sync1_reg0;
  output m00_rst_sync1_reg0;
  input s00_axi_aclk;
  input [13:0]dbg_word2_int;
  input [12:0]out;
  input [12:0]Q;
  input [11:0]wr_ptr_next0;
  input [12:0]\rd_ptr_gray_reg_reg[12] ;
  input mem_read_data_valid_reg;
  input m00_axis_tvalid_reg_reg;
  input m00_axis_tready;
  input [11:0]rd_ptr_next0;
  input [0:0]CO;
  input [12:0]\rd_ptr_gray_sync2_reg_reg[12] ;
  input s00_axis_tvalid;
  input m00_rst_sync1_reg;
  input s00_rst_sync1_reg;
  input m00_rst_sync2_reg;
  input m00_rst_sync3_reg;
  input [0:0]SR;
  input [12:0]\wr_addr_reg_reg[12] ;
  input [12:0]dbg_word1_int;
  input s00_axi_aresetn;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input s00_axi_bready;
  input s00_axi_arvalid;
  input s00_axi_rready;
  input [0:0]s00_axi_wdata;
  input [0:0]s00_axi_wstrb;
  input s00_axis_aresetn;
  input m00_axis_aresetn;
  input [1:0]s00_axi_araddr;
  input [1:0]s00_axi_awaddr;

  wire [0:0]CO;
  wire [12:0]D;
  wire [12:0]Q;
  wire [3:0]S;
  wire [0:0]SR;
  wire aw_en_i_1_n_0;
  wire aw_en_reg_n_0;
  wire [3:2]axi_araddr;
  wire \axi_araddr[2]_i_1_n_0 ;
  wire \axi_araddr[3]_i_1_n_0 ;
  wire axi_arready0;
  wire [3:2]axi_awaddr;
  wire \axi_awaddr[2]_i_1_n_0 ;
  wire \axi_awaddr[3]_i_1_n_0 ;
  wire axi_awready0;
  wire axi_awready_i_1_n_0;
  wire axi_bvalid_i_1_n_0;
  wire \axi_rdata[0]_i_2_n_0 ;
  wire \axi_rdata[0]_i_3_n_0 ;
  wire \axi_rdata[0]_i_4_n_0 ;
  wire \axi_rdata[10]_i_2_n_0 ;
  wire \axi_rdata[10]_i_3_n_0 ;
  wire \axi_rdata[11]_i_2_n_0 ;
  wire \axi_rdata[11]_i_3_n_0 ;
  wire \axi_rdata[12]_i_2_n_0 ;
  wire \axi_rdata[12]_i_3_n_0 ;
  wire \axi_rdata[1]_i_2_n_0 ;
  wire \axi_rdata[1]_i_3_n_0 ;
  wire \axi_rdata[2]_i_2_n_0 ;
  wire \axi_rdata[2]_i_3_n_0 ;
  wire \axi_rdata[3]_i_2_n_0 ;
  wire \axi_rdata[3]_i_3_n_0 ;
  wire \axi_rdata[4]_i_2_n_0 ;
  wire \axi_rdata[4]_i_3_n_0 ;
  wire \axi_rdata[5]_i_2_n_0 ;
  wire \axi_rdata[5]_i_3_n_0 ;
  wire \axi_rdata[6]_i_2_n_0 ;
  wire \axi_rdata[6]_i_3_n_0 ;
  wire \axi_rdata[7]_i_2_n_0 ;
  wire \axi_rdata[7]_i_3_n_0 ;
  wire \axi_rdata[8]_i_2_n_0 ;
  wire \axi_rdata[8]_i_3_n_0 ;
  wire \axi_rdata[9]_i_2_n_0 ;
  wire \axi_rdata[9]_i_3_n_0 ;
  wire axi_rvalid_i_1_n_0;
  wire axi_wready0;
  wire [12:0]dbg_word1_int;
  wire [13:0]dbg_word2_int;
  wire m00_axis_aresetn;
  wire m00_axis_tready;
  wire m00_axis_tvalid_reg_reg;
  wire m00_rst_sync1_reg;
  wire m00_rst_sync1_reg0;
  wire m00_rst_sync2_reg;
  wire m00_rst_sync2_reg_reg;
  wire m00_rst_sync3_reg;
  wire m00_rst_sync3_reg_reg;
  wire mem_read_data_valid_reg;
  wire [12:0]out;
  wire [12:0]\rd_ptr_gray_reg_reg[12] ;
  wire [12:0]\rd_ptr_gray_sync2_reg_reg[12] ;
  wire [0:0]rd_ptr_next;
  wire [11:0]rd_ptr_next0;
  wire [10:0]rd_ptr_next_0;
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
  wire [28:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [0:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [0:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire s00_axis_aresetn;
  wire s00_axis_tvalid;
  wire s00_rst_sync1_reg;
  wire s00_rst_sync1_reg0;
  wire s00_rst_sync1_reg1;
  wire s00_rst_sync2_reg_reg;
  wire s00_rst_sync3_reg_reg;
  wire \slv_reg0[0]_i_1_n_0 ;
  wire slv_reg_rden__0;
  wire slv_reg_wren__0;
  wire [12:0]\wr_addr_reg_reg[12] ;
  wire \wr_ptr_gray_reg_reg[11] ;
  wire [11:0]wr_ptr_next0;

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
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
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
        .I5(axi_awaddr[2]),
        .O(\axi_awaddr[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \axi_awaddr[3]_i_1 
       (.I0(s00_axi_awaddr[1]),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_awready),
        .I3(aw_en_reg_n_0),
        .I4(s00_axi_awvalid),
        .I5(axi_awaddr[3]),
        .O(\axi_awaddr[3]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[2]_i_1_n_0 ),
        .Q(axi_awaddr[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_awaddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[3]_i_1_n_0 ),
        .Q(axi_awaddr[3]),
        .R(axi_awready_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(s00_axi_aresetn),
        .O(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
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
    .INIT(32'h9F90909F)) 
    \axi_rdata[0]_i_2 
       (.I0(dbg_word2_int[0]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(axi_araddr[3]),
        .I3(out[0]),
        .I4(\axi_rdata[0]_i_4_n_0 ),
        .O(\axi_rdata[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB88BFFFFB88B0000)) 
    \axi_rdata[0]_i_3 
       (.I0(Q[0]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(dbg_word2_int[0]),
        .I3(wr_ptr_next0[0]),
        .I4(axi_araddr[3]),
        .I5(D[0]),
        .O(\axi_rdata[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \axi_rdata[0]_i_4 
       (.I0(mem_read_data_valid_reg),
        .I1(m00_axis_tvalid_reg_reg),
        .I2(m00_axis_tready),
        .O(\axi_rdata[0]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \axi_rdata[10]_i_2 
       (.I0(dbg_word2_int[10]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(wr_ptr_next0[9]),
        .I3(axi_araddr[3]),
        .I4(rd_ptr_next_0[9]),
        .O(\axi_rdata[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8FFFF8BB80000)) 
    \axi_rdata[10]_i_3 
       (.I0(Q[10]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(wr_ptr_next0[9]),
        .I3(wr_ptr_next0[10]),
        .I4(axi_araddr[3]),
        .I5(D[10]),
        .O(\axi_rdata[10]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \axi_rdata[11]_i_2 
       (.I0(dbg_word2_int[11]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(wr_ptr_next0[10]),
        .I3(axi_araddr[3]),
        .I4(rd_ptr_next_0[10]),
        .O(\axi_rdata[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8FFFF8BB80000)) 
    \axi_rdata[11]_i_3 
       (.I0(Q[11]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(wr_ptr_next0[10]),
        .I3(wr_ptr_next0[11]),
        .I4(axi_araddr[3]),
        .I5(D[11]),
        .O(\axi_rdata[11]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \axi_rdata[12]_i_2 
       (.I0(dbg_word2_int[12]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(wr_ptr_next0[11]),
        .I3(axi_araddr[3]),
        .I4(rd_ptr_next),
        .O(\axi_rdata[12]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \axi_rdata[12]_i_3 
       (.I0(Q[12]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(wr_ptr_next0[11]),
        .I3(axi_araddr[3]),
        .I4(D[12]),
        .O(\axi_rdata[12]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[16]_i_1 
       (.I0(\wr_addr_reg_reg[12] [0]),
        .I1(dbg_word1_int[0]),
        .I2(axi_araddr[2]),
        .I3(dbg_word2_int[0]),
        .I4(axi_araddr[3]),
        .I5(out[0]),
        .O(reg_data_out[16]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[17]_i_1 
       (.I0(\wr_addr_reg_reg[12] [1]),
        .I1(dbg_word1_int[1]),
        .I2(axi_araddr[2]),
        .I3(dbg_word2_int[1]),
        .I4(axi_araddr[3]),
        .I5(out[1]),
        .O(reg_data_out[17]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[18]_i_1 
       (.I0(\wr_addr_reg_reg[12] [2]),
        .I1(dbg_word1_int[2]),
        .I2(axi_araddr[2]),
        .I3(dbg_word2_int[2]),
        .I4(axi_araddr[3]),
        .I5(out[2]),
        .O(reg_data_out[18]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[19]_i_1 
       (.I0(\wr_addr_reg_reg[12] [3]),
        .I1(dbg_word1_int[3]),
        .I2(axi_araddr[2]),
        .I3(dbg_word2_int[3]),
        .I4(axi_araddr[3]),
        .I5(out[3]),
        .O(reg_data_out[19]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \axi_rdata[1]_i_2 
       (.I0(dbg_word2_int[1]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(wr_ptr_next0[0]),
        .I3(axi_araddr[3]),
        .I4(rd_ptr_next_0[0]),
        .O(\axi_rdata[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8FFFF8BB80000)) 
    \axi_rdata[1]_i_3 
       (.I0(Q[1]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(wr_ptr_next0[0]),
        .I3(wr_ptr_next0[1]),
        .I4(axi_araddr[3]),
        .I5(D[1]),
        .O(\axi_rdata[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[20]_i_1 
       (.I0(\wr_addr_reg_reg[12] [4]),
        .I1(dbg_word1_int[4]),
        .I2(axi_araddr[2]),
        .I3(dbg_word2_int[4]),
        .I4(axi_araddr[3]),
        .I5(out[4]),
        .O(reg_data_out[20]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[21]_i_1 
       (.I0(\wr_addr_reg_reg[12] [5]),
        .I1(dbg_word1_int[5]),
        .I2(axi_araddr[2]),
        .I3(dbg_word2_int[5]),
        .I4(axi_araddr[3]),
        .I5(out[5]),
        .O(reg_data_out[21]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[22]_i_1 
       (.I0(\wr_addr_reg_reg[12] [6]),
        .I1(dbg_word1_int[6]),
        .I2(axi_araddr[2]),
        .I3(dbg_word2_int[6]),
        .I4(axi_araddr[3]),
        .I5(out[6]),
        .O(reg_data_out[22]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[23]_i_1 
       (.I0(\wr_addr_reg_reg[12] [7]),
        .I1(dbg_word1_int[7]),
        .I2(axi_araddr[2]),
        .I3(dbg_word2_int[7]),
        .I4(axi_araddr[3]),
        .I5(out[7]),
        .O(reg_data_out[23]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[24]_i_1 
       (.I0(\wr_addr_reg_reg[12] [8]),
        .I1(dbg_word1_int[8]),
        .I2(axi_araddr[2]),
        .I3(dbg_word2_int[8]),
        .I4(axi_araddr[3]),
        .I5(out[8]),
        .O(reg_data_out[24]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[25]_i_1 
       (.I0(\wr_addr_reg_reg[12] [9]),
        .I1(dbg_word1_int[9]),
        .I2(axi_araddr[2]),
        .I3(dbg_word2_int[9]),
        .I4(axi_araddr[3]),
        .I5(out[9]),
        .O(reg_data_out[25]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[26]_i_1 
       (.I0(\wr_addr_reg_reg[12] [10]),
        .I1(dbg_word1_int[10]),
        .I2(axi_araddr[2]),
        .I3(dbg_word2_int[10]),
        .I4(axi_araddr[3]),
        .I5(out[10]),
        .O(reg_data_out[26]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[27]_i_1 
       (.I0(\wr_addr_reg_reg[12] [11]),
        .I1(dbg_word1_int[11]),
        .I2(axi_araddr[2]),
        .I3(dbg_word2_int[11]),
        .I4(axi_araddr[3]),
        .I5(out[11]),
        .O(reg_data_out[27]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[28]_i_1 
       (.I0(\wr_addr_reg_reg[12] [12]),
        .I1(dbg_word1_int[12]),
        .I2(axi_araddr[2]),
        .I3(dbg_word2_int[12]),
        .I4(axi_araddr[3]),
        .I5(out[12]),
        .O(reg_data_out[28]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[29]_i_1 
       (.I0(m00_rst_sync3_reg),
        .I1(axi_araddr[3]),
        .I2(SR),
        .I3(axi_araddr[2]),
        .O(reg_data_out[29]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \axi_rdata[2]_i_2 
       (.I0(dbg_word2_int[2]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(wr_ptr_next0[1]),
        .I3(axi_araddr[3]),
        .I4(rd_ptr_next_0[1]),
        .O(\axi_rdata[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8FFFF8BB80000)) 
    \axi_rdata[2]_i_3 
       (.I0(Q[2]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(wr_ptr_next0[1]),
        .I3(wr_ptr_next0[2]),
        .I4(axi_araddr[3]),
        .I5(D[2]),
        .O(\axi_rdata[2]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[30]_i_1 
       (.I0(m00_rst_sync2_reg),
        .I1(axi_araddr[3]),
        .I2(dbg_word2_int[13]),
        .I3(axi_araddr[2]),
        .O(reg_data_out[30]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[31]_i_1 
       (.I0(m00_rst_sync1_reg),
        .I1(axi_araddr[3]),
        .I2(s00_rst_sync1_reg),
        .I3(axi_araddr[2]),
        .O(reg_data_out[31]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \axi_rdata[3]_i_2 
       (.I0(dbg_word2_int[3]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(wr_ptr_next0[2]),
        .I3(axi_araddr[3]),
        .I4(rd_ptr_next_0[2]),
        .O(\axi_rdata[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8FFFF8BB80000)) 
    \axi_rdata[3]_i_3 
       (.I0(Q[3]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(wr_ptr_next0[2]),
        .I3(wr_ptr_next0[3]),
        .I4(axi_araddr[3]),
        .I5(D[3]),
        .O(\axi_rdata[3]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \axi_rdata[4]_i_2 
       (.I0(dbg_word2_int[4]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(wr_ptr_next0[3]),
        .I3(axi_araddr[3]),
        .I4(rd_ptr_next_0[3]),
        .O(\axi_rdata[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8FFFF8BB80000)) 
    \axi_rdata[4]_i_3 
       (.I0(Q[4]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(wr_ptr_next0[3]),
        .I3(wr_ptr_next0[4]),
        .I4(axi_araddr[3]),
        .I5(D[4]),
        .O(\axi_rdata[4]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \axi_rdata[5]_i_2 
       (.I0(dbg_word2_int[5]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(wr_ptr_next0[4]),
        .I3(axi_araddr[3]),
        .I4(rd_ptr_next_0[4]),
        .O(\axi_rdata[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8FFFF8BB80000)) 
    \axi_rdata[5]_i_3 
       (.I0(Q[5]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(wr_ptr_next0[4]),
        .I3(wr_ptr_next0[5]),
        .I4(axi_araddr[3]),
        .I5(D[5]),
        .O(\axi_rdata[5]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \axi_rdata[6]_i_2 
       (.I0(dbg_word2_int[6]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(wr_ptr_next0[5]),
        .I3(axi_araddr[3]),
        .I4(rd_ptr_next_0[5]),
        .O(\axi_rdata[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8FFFF8BB80000)) 
    \axi_rdata[6]_i_3 
       (.I0(Q[6]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(wr_ptr_next0[5]),
        .I3(wr_ptr_next0[6]),
        .I4(axi_araddr[3]),
        .I5(D[6]),
        .O(\axi_rdata[6]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \axi_rdata[7]_i_2 
       (.I0(dbg_word2_int[7]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(wr_ptr_next0[6]),
        .I3(axi_araddr[3]),
        .I4(rd_ptr_next_0[6]),
        .O(\axi_rdata[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8FFFF8BB80000)) 
    \axi_rdata[7]_i_3 
       (.I0(Q[7]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(wr_ptr_next0[6]),
        .I3(wr_ptr_next0[7]),
        .I4(axi_araddr[3]),
        .I5(D[7]),
        .O(\axi_rdata[7]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \axi_rdata[8]_i_2 
       (.I0(dbg_word2_int[8]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(wr_ptr_next0[7]),
        .I3(axi_araddr[3]),
        .I4(rd_ptr_next_0[7]),
        .O(\axi_rdata[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8FFFF8BB80000)) 
    \axi_rdata[8]_i_3 
       (.I0(Q[8]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(wr_ptr_next0[7]),
        .I3(wr_ptr_next0[8]),
        .I4(axi_araddr[3]),
        .I5(D[8]),
        .O(\axi_rdata[8]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \axi_rdata[9]_i_2 
       (.I0(dbg_word2_int[9]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(wr_ptr_next0[8]),
        .I3(axi_araddr[3]),
        .I4(rd_ptr_next_0[8]),
        .O(\axi_rdata[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8FFFF8BB80000)) 
    \axi_rdata[9]_i_3 
       (.I0(Q[9]),
        .I1(\wr_ptr_gray_reg_reg[11] ),
        .I2(wr_ptr_next0[8]),
        .I3(wr_ptr_next0[9]),
        .I4(axi_araddr[3]),
        .I5(D[9]),
        .O(\axi_rdata[9]_i_3_n_0 ));
  FDRE \axi_rdata_reg[0] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[0]),
        .Q(s00_axi_rdata[0]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[0]_i_1 
       (.I0(\axi_rdata[0]_i_2_n_0 ),
        .I1(\axi_rdata[0]_i_3_n_0 ),
        .O(reg_data_out[0]),
        .S(axi_araddr[2]));
  FDRE \axi_rdata_reg[10] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[10]),
        .Q(s00_axi_rdata[10]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[10]_i_1 
       (.I0(\axi_rdata[10]_i_2_n_0 ),
        .I1(\axi_rdata[10]_i_3_n_0 ),
        .O(reg_data_out[10]),
        .S(axi_araddr[2]));
  FDRE \axi_rdata_reg[11] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[11]),
        .Q(s00_axi_rdata[11]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[11]_i_1 
       (.I0(\axi_rdata[11]_i_2_n_0 ),
        .I1(\axi_rdata[11]_i_3_n_0 ),
        .O(reg_data_out[11]),
        .S(axi_araddr[2]));
  FDRE \axi_rdata_reg[12] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[12]),
        .Q(s00_axi_rdata[12]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[12]_i_1 
       (.I0(\axi_rdata[12]_i_2_n_0 ),
        .I1(\axi_rdata[12]_i_3_n_0 ),
        .O(reg_data_out[12]),
        .S(axi_araddr[2]));
  FDRE \axi_rdata_reg[16] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[16]),
        .Q(s00_axi_rdata[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[17] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[17]),
        .Q(s00_axi_rdata[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[18] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[18]),
        .Q(s00_axi_rdata[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[19] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[19]),
        .Q(s00_axi_rdata[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[1] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[1]),
        .Q(s00_axi_rdata[1]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[1]_i_1 
       (.I0(\axi_rdata[1]_i_2_n_0 ),
        .I1(\axi_rdata[1]_i_3_n_0 ),
        .O(reg_data_out[1]),
        .S(axi_araddr[2]));
  FDRE \axi_rdata_reg[20] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[20]),
        .Q(s00_axi_rdata[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[21] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[21]),
        .Q(s00_axi_rdata[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[22] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[22]),
        .Q(s00_axi_rdata[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[23] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[23]),
        .Q(s00_axi_rdata[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[24] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[24]),
        .Q(s00_axi_rdata[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[25] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[25]),
        .Q(s00_axi_rdata[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[26] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[26]),
        .Q(s00_axi_rdata[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[27] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[27]),
        .Q(s00_axi_rdata[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[28] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[28]),
        .Q(s00_axi_rdata[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[29] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[29]),
        .Q(s00_axi_rdata[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[2] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[2]),
        .Q(s00_axi_rdata[2]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[2]_i_1 
       (.I0(\axi_rdata[2]_i_2_n_0 ),
        .I1(\axi_rdata[2]_i_3_n_0 ),
        .O(reg_data_out[2]),
        .S(axi_araddr[2]));
  FDRE \axi_rdata_reg[30] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[30]),
        .Q(s00_axi_rdata[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[31] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[31]),
        .Q(s00_axi_rdata[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[3] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[3]),
        .Q(s00_axi_rdata[3]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[3]_i_1 
       (.I0(\axi_rdata[3]_i_2_n_0 ),
        .I1(\axi_rdata[3]_i_3_n_0 ),
        .O(reg_data_out[3]),
        .S(axi_araddr[2]));
  FDRE \axi_rdata_reg[4] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[4]),
        .Q(s00_axi_rdata[4]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[4]_i_1 
       (.I0(\axi_rdata[4]_i_2_n_0 ),
        .I1(\axi_rdata[4]_i_3_n_0 ),
        .O(reg_data_out[4]),
        .S(axi_araddr[2]));
  FDRE \axi_rdata_reg[5] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[5]),
        .Q(s00_axi_rdata[5]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[5]_i_1 
       (.I0(\axi_rdata[5]_i_2_n_0 ),
        .I1(\axi_rdata[5]_i_3_n_0 ),
        .O(reg_data_out[5]),
        .S(axi_araddr[2]));
  FDRE \axi_rdata_reg[6] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[6]),
        .Q(s00_axi_rdata[6]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[6]_i_1 
       (.I0(\axi_rdata[6]_i_2_n_0 ),
        .I1(\axi_rdata[6]_i_3_n_0 ),
        .O(reg_data_out[6]),
        .S(axi_araddr[2]));
  FDRE \axi_rdata_reg[7] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[7]),
        .Q(s00_axi_rdata[7]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[7]_i_1 
       (.I0(\axi_rdata[7]_i_2_n_0 ),
        .I1(\axi_rdata[7]_i_3_n_0 ),
        .O(reg_data_out[7]),
        .S(axi_araddr[2]));
  FDRE \axi_rdata_reg[8] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[8]),
        .Q(s00_axi_rdata[8]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[8]_i_1 
       (.I0(\axi_rdata[8]_i_2_n_0 ),
        .I1(\axi_rdata[8]_i_3_n_0 ),
        .O(reg_data_out[8]),
        .S(axi_araddr[2]));
  FDRE \axi_rdata_reg[9] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[9]),
        .Q(s00_axi_rdata[9]),
        .R(axi_awready_i_1_n_0));
  MUXF7 \axi_rdata_reg[9]_i_1 
       (.I0(\axi_rdata[9]_i_2_n_0 ),
        .I1(\axi_rdata[9]_i_3_n_0 ),
        .O(reg_data_out[9]),
        .S(axi_araddr[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
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
  LUT4 #(
    .INIT(16'h9009)) 
    full0_carry_i_1
       (.I0(\rd_ptr_gray_sync2_reg_reg[12] [10]),
        .I1(Q[10]),
        .I2(\rd_ptr_gray_sync2_reg_reg[12] [9]),
        .I3(Q[9]),
        .O(S[3]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    full0_carry_i_2
       (.I0(Q[6]),
        .I1(\rd_ptr_gray_sync2_reg_reg[12] [6]),
        .I2(Q[7]),
        .I3(\rd_ptr_gray_sync2_reg_reg[12] [7]),
        .I4(\rd_ptr_gray_sync2_reg_reg[12] [8]),
        .I5(Q[8]),
        .O(S[2]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    full0_carry_i_3
       (.I0(Q[3]),
        .I1(\rd_ptr_gray_sync2_reg_reg[12] [3]),
        .I2(Q[4]),
        .I3(\rd_ptr_gray_sync2_reg_reg[12] [4]),
        .I4(\rd_ptr_gray_sync2_reg_reg[12] [5]),
        .I5(Q[5]),
        .O(S[1]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    full0_carry_i_4
       (.I0(Q[0]),
        .I1(\rd_ptr_gray_sync2_reg_reg[12] [0]),
        .I2(Q[1]),
        .I3(\rd_ptr_gray_sync2_reg_reg[12] [1]),
        .I4(\rd_ptr_gray_sync2_reg_reg[12] [2]),
        .I5(Q[2]),
        .O(S[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'hB)) 
    m00_rst_sync1_reg_i_1
       (.I0(s00_rst_sync1_reg1),
        .I1(m00_axis_aresetn),
        .O(m00_rst_sync1_reg0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFFEF)) 
    m00_rst_sync2_reg_i_1
       (.I0(s00_rst_sync1_reg),
        .I1(m00_rst_sync1_reg),
        .I2(m00_axis_aresetn),
        .I3(s00_rst_sync1_reg1),
        .O(m00_rst_sync2_reg_reg));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    m00_rst_sync3_reg_i_1
       (.I0(m00_rst_sync2_reg),
        .I1(m00_axis_aresetn),
        .I2(s00_rst_sync1_reg1),
        .O(m00_rst_sync3_reg_reg));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \rd_addr_reg[10]_i_1 
       (.I0(out[10]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(rd_ptr_next0[9]),
        .O(rd_ptr_next_0[9]));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \rd_addr_reg[11]_i_1 
       (.I0(out[11]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(rd_ptr_next0[10]),
        .O(rd_ptr_next_0[10]));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \rd_addr_reg[12]_i_1 
       (.I0(out[12]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(rd_ptr_next0[11]),
        .O(rd_ptr_next));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \rd_addr_reg[1]_i_1 
       (.I0(out[1]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(rd_ptr_next0[0]),
        .O(rd_ptr_next_0[0]));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \rd_addr_reg[2]_i_1 
       (.I0(out[2]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(rd_ptr_next0[1]),
        .O(rd_ptr_next_0[1]));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \rd_addr_reg[3]_i_1 
       (.I0(out[3]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(rd_ptr_next0[2]),
        .O(rd_ptr_next_0[2]));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \rd_addr_reg[4]_i_1 
       (.I0(out[4]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(rd_ptr_next0[3]),
        .O(rd_ptr_next_0[3]));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \rd_addr_reg[5]_i_1 
       (.I0(out[5]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(rd_ptr_next0[4]),
        .O(rd_ptr_next_0[4]));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \rd_addr_reg[6]_i_1 
       (.I0(out[6]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(rd_ptr_next0[5]),
        .O(rd_ptr_next_0[5]));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \rd_addr_reg[7]_i_1 
       (.I0(out[7]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(rd_ptr_next0[6]),
        .O(rd_ptr_next_0[6]));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \rd_addr_reg[8]_i_1 
       (.I0(out[8]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(rd_ptr_next0[7]),
        .O(rd_ptr_next_0[7]));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \rd_addr_reg[9]_i_1 
       (.I0(out[9]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(rd_ptr_next0[8]),
        .O(rd_ptr_next_0[8]));
  LUT6 #(
    .INIT(64'hFFBF00800080FFBF)) 
    \rd_ptr_gray_reg[0]_i_1 
       (.I0(\rd_ptr_gray_reg_reg[12] [0]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(out[0]),
        .I5(rd_ptr_next0[0]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h0080FFBFFFBF0080)) 
    \rd_ptr_gray_reg[10]_i_1 
       (.I0(\rd_ptr_gray_reg_reg[12] [10]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(rd_ptr_next0[9]),
        .I5(rd_ptr_next0[10]),
        .O(D[10]));
  LUT6 #(
    .INIT(64'h0080FFBFFFBF0080)) 
    \rd_ptr_gray_reg[11]_i_1 
       (.I0(\rd_ptr_gray_reg_reg[12] [11]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(rd_ptr_next0[10]),
        .I5(rd_ptr_next0[11]),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \rd_ptr_gray_reg[12]_i_1 
       (.I0(\rd_ptr_gray_reg_reg[12] [12]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(rd_ptr_next0[11]),
        .O(D[12]));
  LUT6 #(
    .INIT(64'h0080FFBFFFBF0080)) 
    \rd_ptr_gray_reg[1]_i_1 
       (.I0(\rd_ptr_gray_reg_reg[12] [1]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(rd_ptr_next0[0]),
        .I5(rd_ptr_next0[1]),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h0080FFBFFFBF0080)) 
    \rd_ptr_gray_reg[2]_i_1 
       (.I0(\rd_ptr_gray_reg_reg[12] [2]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(rd_ptr_next0[1]),
        .I5(rd_ptr_next0[2]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'h0080FFBFFFBF0080)) 
    \rd_ptr_gray_reg[3]_i_1 
       (.I0(\rd_ptr_gray_reg_reg[12] [3]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(rd_ptr_next0[2]),
        .I5(rd_ptr_next0[3]),
        .O(D[3]));
  LUT6 #(
    .INIT(64'h0080FFBFFFBF0080)) 
    \rd_ptr_gray_reg[4]_i_1 
       (.I0(\rd_ptr_gray_reg_reg[12] [4]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(rd_ptr_next0[3]),
        .I5(rd_ptr_next0[4]),
        .O(D[4]));
  LUT6 #(
    .INIT(64'h0080FFBFFFBF0080)) 
    \rd_ptr_gray_reg[5]_i_1 
       (.I0(\rd_ptr_gray_reg_reg[12] [5]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(rd_ptr_next0[4]),
        .I5(rd_ptr_next0[5]),
        .O(D[5]));
  LUT6 #(
    .INIT(64'h0080FFBFFFBF0080)) 
    \rd_ptr_gray_reg[6]_i_1 
       (.I0(\rd_ptr_gray_reg_reg[12] [6]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(rd_ptr_next0[5]),
        .I5(rd_ptr_next0[6]),
        .O(D[6]));
  LUT6 #(
    .INIT(64'h0080FFBFFFBF0080)) 
    \rd_ptr_gray_reg[7]_i_1 
       (.I0(\rd_ptr_gray_reg_reg[12] [7]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(rd_ptr_next0[6]),
        .I5(rd_ptr_next0[7]),
        .O(D[7]));
  LUT6 #(
    .INIT(64'h0080FFBFFFBF0080)) 
    \rd_ptr_gray_reg[8]_i_1 
       (.I0(\rd_ptr_gray_reg_reg[12] [8]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(rd_ptr_next0[7]),
        .I5(rd_ptr_next0[8]),
        .O(D[8]));
  LUT6 #(
    .INIT(64'h0080FFBFFFBF0080)) 
    \rd_ptr_gray_reg[9]_i_1 
       (.I0(\rd_ptr_gray_reg_reg[12] [9]),
        .I1(mem_read_data_valid_reg),
        .I2(m00_axis_tvalid_reg_reg),
        .I3(m00_axis_tready),
        .I4(rd_ptr_next0[8]),
        .I5(rd_ptr_next0[9]),
        .O(D[9]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'hB)) 
    s00_rst_sync1_reg_i_1
       (.I0(s00_rst_sync1_reg1),
        .I1(s00_axis_aresetn),
        .O(s00_rst_sync1_reg0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFFEF)) 
    s00_rst_sync2_reg_i_1
       (.I0(s00_rst_sync1_reg),
        .I1(m00_rst_sync1_reg),
        .I2(s00_axis_aresetn),
        .I3(s00_rst_sync1_reg1),
        .O(s00_rst_sync2_reg_reg));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    s00_rst_sync3_reg_i_1
       (.I0(dbg_word2_int[13]),
        .I1(s00_axis_aresetn),
        .I2(s00_rst_sync1_reg1),
        .O(s00_rst_sync3_reg_reg));
  LUT6 #(
    .INIT(64'hFFFBFFFF00080000)) 
    \slv_reg0[0]_i_1 
       (.I0(s00_axi_wdata),
        .I1(slv_reg_wren__0),
        .I2(axi_awaddr[3]),
        .I3(axi_awaddr[2]),
        .I4(s00_axi_wstrb),
        .I5(s00_rst_sync1_reg1),
        .O(\slv_reg0[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg0[0]_i_2 
       (.I0(s00_axi_wready),
        .I1(s00_axi_awready),
        .I2(s00_axi_awvalid),
        .I3(s00_axi_wvalid),
        .O(slv_reg_wren__0));
  FDRE \slv_reg0_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\slv_reg0[0]_i_1_n_0 ),
        .Q(s00_rst_sync1_reg1),
        .R(axi_awready_i_1_n_0));
  LUT3 #(
    .INIT(8'h20)) 
    slv_reg_rden
       (.I0(s00_axi_arvalid),
        .I1(s00_axi_rvalid),
        .I2(s00_axi_arready),
        .O(slv_reg_rden__0));
  LUT6 #(
    .INIT(64'h00282800FFFFFFFF)) 
    \wr_addr_reg[11]_i_2 
       (.I0(CO),
        .I1(\rd_ptr_gray_sync2_reg_reg[12] [11]),
        .I2(Q[11]),
        .I3(Q[12]),
        .I4(\rd_ptr_gray_sync2_reg_reg[12] [12]),
        .I5(s00_axis_tvalid),
        .O(\wr_ptr_gray_reg_reg[11] ));
endmodule

(* CHECK_LICENSE_TYPE = "design_2_RxFIFO_0,axis_stream_fifo_v1_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "axis_stream_fifo_v1_0,Vivado 2018.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (s00_axi_awaddr,
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
  wire m00_axis_aclk;
  wire m00_axis_aresetn;
  wire [31:0]m00_axis_tdata;
  wire m00_axis_tlast;
  wire m00_axis_tready;
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
  wire [31:0]\^s00_axi_rdata ;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire s00_axis_aclk;
  wire s00_axis_aresetn;
  wire [31:0]s00_axis_tdata;
  wire s00_axis_tlast;
  wire s00_axis_tready;
  wire s00_axis_tvalid;

  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rdata[31:16] = \^s00_axi_rdata [31:16];
  assign s00_axi_rdata[15] = \<const0> ;
  assign s00_axi_rdata[14] = \<const0> ;
  assign s00_axi_rdata[13] = \<const0> ;
  assign s00_axi_rdata[12:0] = \^s00_axi_rdata [12:0];
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_stream_fifo_v1_0 inst
       (.Q({m00_axis_tlast,m00_axis_tdata}),
        .m00_axis_aclk(m00_axis_aclk),
        .m00_axis_aresetn(m00_axis_aresetn),
        .m00_axis_tready(m00_axis_tready),
        .m00_axis_tvalid(m00_axis_tvalid),
        .mem_write_data({s00_axis_tlast,s00_axis_tdata}),
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
        .s00_axi_rdata({\^s00_axi_rdata [31:16],\^s00_axi_rdata [12:0]}),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata[0]),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wstrb(s00_axi_wstrb[0]),
        .s00_axi_wvalid(s00_axi_wvalid),
        .s00_axis_aclk(s00_axis_aclk),
        .s00_axis_aresetn(s00_axis_aresetn),
        .s00_axis_tready(s00_axis_tready),
        .s00_axis_tvalid(s00_axis_tvalid));
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
