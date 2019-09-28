//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
//Date        : Fri Sep 27 21:00:28 2019
//Host        : LAPTOP-FM91H59Q running 64-bit major release  (build 9200)
//Command     : generate_target design_2_wrapper.bd
//Design      : design_2_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_2_wrapper
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    DIO_PORTA_tri_io,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    HSICK,
    HSI_A0,
    HSI_A1,
    HSI_DAM,
    HSI_DAP,
    HSI_DBM,
    HSI_DBP,
    HSI_DC,
    LED0,
    LED1,
    LED2,
    LED7,
    MCK_N,
    MCK_P,
    SPI_CS,
    SPI_MISO,
    SPI_MOSI,
    SPI_SCK,
    SW6,
    SW7,
    SYNC_CK);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout [7:0]DIO_PORTA_tri_io;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output HSICK;
  input HSI_A0;
  input HSI_A1;
  output HSI_DAM;
  output HSI_DAP;
  output HSI_DBM;
  output HSI_DBP;
  output HSI_DC;
  output LED0;
  output LED1;
  output LED2;
  output LED7;
  output MCK_N;
  output MCK_P;
  output SPI_CS;
  input SPI_MISO;
  output SPI_MOSI;
  output SPI_SCK;
  input SW6;
  input SW7;
  output SYNC_CK;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire [0:0]DIO_PORTA_tri_i_0;
  wire [1:1]DIO_PORTA_tri_i_1;
  wire [2:2]DIO_PORTA_tri_i_2;
  wire [3:3]DIO_PORTA_tri_i_3;
  wire [4:4]DIO_PORTA_tri_i_4;
  wire [5:5]DIO_PORTA_tri_i_5;
  wire [6:6]DIO_PORTA_tri_i_6;
  wire [7:7]DIO_PORTA_tri_i_7;
  wire [0:0]DIO_PORTA_tri_io_0;
  wire [1:1]DIO_PORTA_tri_io_1;
  wire [2:2]DIO_PORTA_tri_io_2;
  wire [3:3]DIO_PORTA_tri_io_3;
  wire [4:4]DIO_PORTA_tri_io_4;
  wire [5:5]DIO_PORTA_tri_io_5;
  wire [6:6]DIO_PORTA_tri_io_6;
  wire [7:7]DIO_PORTA_tri_io_7;
  wire [0:0]DIO_PORTA_tri_o_0;
  wire [1:1]DIO_PORTA_tri_o_1;
  wire [2:2]DIO_PORTA_tri_o_2;
  wire [3:3]DIO_PORTA_tri_o_3;
  wire [4:4]DIO_PORTA_tri_o_4;
  wire [5:5]DIO_PORTA_tri_o_5;
  wire [6:6]DIO_PORTA_tri_o_6;
  wire [7:7]DIO_PORTA_tri_o_7;
  wire [0:0]DIO_PORTA_tri_t_0;
  wire [1:1]DIO_PORTA_tri_t_1;
  wire [2:2]DIO_PORTA_tri_t_2;
  wire [3:3]DIO_PORTA_tri_t_3;
  wire [4:4]DIO_PORTA_tri_t_4;
  wire [5:5]DIO_PORTA_tri_t_5;
  wire [6:6]DIO_PORTA_tri_t_6;
  wire [7:7]DIO_PORTA_tri_t_7;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire HSICK;
  wire HSI_A0;
  wire HSI_A1;
  wire HSI_DAM;
  wire HSI_DAP;
  wire HSI_DBM;
  wire HSI_DBP;
  wire HSI_DC;
  wire LED0;
  wire LED1;
  wire LED2;
  wire LED7;
  wire MCK_N;
  wire MCK_P;
  wire SPI_CS;
  wire SPI_MISO;
  wire SPI_MOSI;
  wire SPI_SCK;
  wire SW6;
  wire SW7;
  wire SYNC_CK;

  IOBUF DIO_PORTA_tri_iobuf_0
       (.I(DIO_PORTA_tri_o_0),
        .IO(DIO_PORTA_tri_io[0]),
        .O(DIO_PORTA_tri_i_0),
        .T(DIO_PORTA_tri_t_0));
  IOBUF DIO_PORTA_tri_iobuf_1
       (.I(DIO_PORTA_tri_o_1),
        .IO(DIO_PORTA_tri_io[1]),
        .O(DIO_PORTA_tri_i_1),
        .T(DIO_PORTA_tri_t_1));
  IOBUF DIO_PORTA_tri_iobuf_2
       (.I(DIO_PORTA_tri_o_2),
        .IO(DIO_PORTA_tri_io[2]),
        .O(DIO_PORTA_tri_i_2),
        .T(DIO_PORTA_tri_t_2));
  IOBUF DIO_PORTA_tri_iobuf_3
       (.I(DIO_PORTA_tri_o_3),
        .IO(DIO_PORTA_tri_io[3]),
        .O(DIO_PORTA_tri_i_3),
        .T(DIO_PORTA_tri_t_3));
  IOBUF DIO_PORTA_tri_iobuf_4
       (.I(DIO_PORTA_tri_o_4),
        .IO(DIO_PORTA_tri_io[4]),
        .O(DIO_PORTA_tri_i_4),
        .T(DIO_PORTA_tri_t_4));
  IOBUF DIO_PORTA_tri_iobuf_5
       (.I(DIO_PORTA_tri_o_5),
        .IO(DIO_PORTA_tri_io[5]),
        .O(DIO_PORTA_tri_i_5),
        .T(DIO_PORTA_tri_t_5));
  IOBUF DIO_PORTA_tri_iobuf_6
       (.I(DIO_PORTA_tri_o_6),
        .IO(DIO_PORTA_tri_io[6]),
        .O(DIO_PORTA_tri_i_6),
        .T(DIO_PORTA_tri_t_6));
  IOBUF DIO_PORTA_tri_iobuf_7
       (.I(DIO_PORTA_tri_o_7),
        .IO(DIO_PORTA_tri_io[7]),
        .O(DIO_PORTA_tri_i_7),
        .T(DIO_PORTA_tri_t_7));
  design_2 design_2_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .DIO_PORTA_tri_i({DIO_PORTA_tri_i_7,DIO_PORTA_tri_i_6,DIO_PORTA_tri_i_5,DIO_PORTA_tri_i_4,DIO_PORTA_tri_i_3,DIO_PORTA_tri_i_2,DIO_PORTA_tri_i_1,DIO_PORTA_tri_i_0}),
        .DIO_PORTA_tri_o({DIO_PORTA_tri_o_7,DIO_PORTA_tri_o_6,DIO_PORTA_tri_o_5,DIO_PORTA_tri_o_4,DIO_PORTA_tri_o_3,DIO_PORTA_tri_o_2,DIO_PORTA_tri_o_1,DIO_PORTA_tri_o_0}),
        .DIO_PORTA_tri_t({DIO_PORTA_tri_t_7,DIO_PORTA_tri_t_6,DIO_PORTA_tri_t_5,DIO_PORTA_tri_t_4,DIO_PORTA_tri_t_3,DIO_PORTA_tri_t_2,DIO_PORTA_tri_t_1,DIO_PORTA_tri_t_0}),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .HSICK(HSICK),
        .HSI_A0(HSI_A0),
        .HSI_A1(HSI_A1),
        .HSI_DAM(HSI_DAM),
        .HSI_DAP(HSI_DAP),
        .HSI_DBM(HSI_DBM),
        .HSI_DBP(HSI_DBP),
        .HSI_DC(HSI_DC),
        .LED0(LED0),
        .LED1(LED1),
        .LED2(LED2),
        .LED7(LED7),
        .MCK_N(MCK_N),
        .MCK_P(MCK_P),
        .SPI_CS(SPI_CS),
        .SPI_MISO(SPI_MISO),
        .SPI_MOSI(SPI_MOSI),
        .SPI_SCK(SPI_SCK),
        .SW6(SW6),
        .SW7(SW7),
        .SYNC_CK(SYNC_CK));
endmodule
