#include <stdio.h>
#include <math.h>
#include "platform.h"
#include "xparameters.h"
#include "xil_printf.h"
#include "xbasic_types.h"
#include "xscugic.h"
#include "xuartps.h"
#include "xuartps_hw.h"
#include "xil_exception.h"
#include "xttcps.h"


//#define FAKE_IC		//used to send data back when no IC present
#define FAKE_DATA	//used to create an array of data for COM test

/* ===== Code to deal with the DMA IP ===== */

#include "xaxidma.h"
#include "xdebug.h"

#ifdef __aarch64__
#include "xil_mmu.h"
#endif

#if defined(XPAR_UARTNS550_0_BASEADDR)
#include "xuartns550_l.h"       /* to use uartns550 */
#endif

#if (!defined(DEBUG))
extern void xil_printf(const char *format, ...);
#endif

/******************** Constant Definitions **********************************/
#define UARTPS_DEVICE_ID	XPAR_XUARTPS_0_DEVICE_ID
#define INTC_DEVICE_ID		XPAR_SCUGIC_SINGLE_DEVICE_ID
#define UART_INT_IRQ_ID		XPAR_XUARTPS_1_INTR
#define UART_BASEADDR		XPAR_XUARTPS_0_BASEADDR
#define RX_BUFFER_SIZE		30
#define TX_BUFFER_SIZE		1000
#define NUM_RXFIFO_READS_REQUIRED	9

// possible states for main while loop used to drive actions
#define SERVICE_UART		0x04

#define CMD_READ_DATA				0x61	// read data from tester - should be followed by
											// 4 bytes(unsigned int) for num words to be
											// sent (msbyte first)
#define CMD_LOAD_SAWTOOTH_UP_DATA	0x62	// load test data1(sawtooth up) into TxData array
#define CMD_LOAD_SAWTOOTH_DOWN_DATA	0x63	// load test data1(sawtooth down) into TxData array
#define CMD_READ_REGISTER			0x41	// read 16-bit contents of gyro ic register
#define CMD_WRITE_REGISTER			0x42	// write 16-bit value to gyro ic register
#define CMD_PROG_OTP_CHIP_ADDR		0x81	// program the chip address into OTP memory
#define CMD_PROG_OTP_VBG_TRIM		0x82	// program the bandgap trim value into OTP memory
#define CMD_READ_PACKETS			0x45	// read packet data
#define CMD_CAL_ADC0 				0x90	// perform calibration on ADC0
#define CMD_CAL_ADC1  				0x91	// perform calibration on ADC1
#define CMD_READ_ADC0_CAL 			0x92	// read/transmit calibration values for ADC0
#define CMD_READ_ADC1_CAL 			0x93	// read/transmit calibration values for ADC1
#define CMD_START_ADC_ACQUISITIONS	0xA1	// read values via HSI bus into RxFIFO until full
#define CMD_FILL_DAC_TXFIFO			0xA2	// fill the TxFIFO with values and send via HSI bus
#define CMD_FPGA_ALL_OUTPUTS_LOW	0xA7	// set all FPGA outputs low for safe power down
#define CMD_FPGA_ALL_OUTPUTS_ENABLED 0xA8	// enable all FPGA outputs after power supplies turned on
#define CMD_FPGA_GET_OUTPUTS_STATE  0xA9	// read the enabled/disabled state of FPGA outputs
#define CMD_RUN_TADC_CONVERSIONS	0xAC	// take measurements using the test ADC
#define CMD_ENABLE_HSI_SIGNALS		0xAD	// enable hsi signals on the FPGA
#define	CMD_DISABLE_HSI_SIGNALS		0xAE	// disable hsi signals on the FPGA
#define CMD_SET_MCLK_DIV			0xB0	// set the MCLK division setting
#define CMD_GET_MCLK_DIV			0xB1	// send MCLK division setting over uart
#define	CMD_SET_SPICLK_DIV			0xB2	// set the SPI clock division setting
#define CMD_GET_SPICLK_DIV			0xB3	// send the SPI clock division setting over uart
#define CMD_SET_PACKET_SIZE			0xB4	// set the FIFO packet size
#define CMD_GET_PACKET_SIZE			0xB5	// send the packet size over uart
#define CMD_GET_DAC_SELECTION		0xB6	// send the current DAC(TX channel) selected for HSI dout over UART
#define	CMD_SET_DAC_SELECTION		0xB7	// set the current DAC(TX channel) selected for HSI dout
#define CMD_GET_ADC_SELECTION		0xB8	// send the current ADC(RX channel) mux selection over UART
#define CMD_SET_ADC_SELECTION		0xB9	// set the current ADC(RX channel) mux selection
#define CMD_GET_CONFIG_SETTINGS		0xBA	// send all config settings over uart


#define RESPONSE_ADC_ACQUIRE_DONE	0x55	// indicates finished with ADC data acquisition

// test ADC mux settings
#define TADC_MUX_TEMPERATURE_SENSOR		0x000
#define	TADC_MUX_BANDGAP_VOLTAGE		0x200
#define TADC_MUX_REFERENCE_VOLTAGE		0x400
#define TADC_MUX_VEXT					0x600
#define TADC_MUX_CEXT					0x800
#define TADC_MUX_REXT					0xA00
#define TADC_MUX_VSSA					0xC00
#define TADC_MUX_VDDA					0xE00

#define TADC_ENABLE						0x1000
#define	TADC_TEMP_SENSOR_ENABLE			0x0080
#define TADC_VEXTSEL					0x0040
#define	TADC_RESET						0x0002
#define TADC_START						0x0001

//configuration constants
#define CONFIG_MCK_DIV_1				0x00000	// base frequency is 50MHz
#define CONFIG_MCK_DIV_2				0x10000	// div2 is 25MHz
#define CONFIG_MCK_DIV_4				0x20000	// div4 is 12.5MHz
#define CONFIG_MCK_DIV_8				0x30000	// div8 is 6.25MHz
#define CONFIG_MCK_DIV_16				0x40000
#define CONFIG_MCK_DIV_32				0x50000
#define CONFIG_MCK_DIV_64				0x60000
#define CONFIG_MCK_DIV_128				0x70000
u32 MCK_div_setting = CONFIG_MCK_DIV_1;
//
#define CONFIG_PACKET_SIZE_64_SAMPLES	0x0000
#define CONFIG_PACKET_SIZE_128_SAMPLES	0x1000
#define CONFIG_PACKET_SIZE_256_SAMPLES	0x2000
#define CONFIG_PACKET_SIZE_512_SAMPLES	0x3000
#define CONFIG_PACKET_SIZE_1024_SAMPLES	0x4000
#define CONFIG_PACKET_SIZE_2048_SAMPLES	0x5000
#define CONFIG_PACKET_SIZE_4096_SAMPLES	0x6000
#define CONFIG_PACKET_SIZE_8192_SAMPLES	0x7000
u32 packet_size_setting = CONFIG_PACKET_SIZE_4096_SAMPLES;
//
#define CONFIG_INPUT_CHANNEL_HSIA0		0x00
#define CONFIG_INPUT_CHANNEL_HSIA1		0x10
u32 HSI_input_channel_setting = CONFIG_INPUT_CHANNEL_HSIA0;
//
#define CONFIG_OUTPUT_CHANNEL_HSIDAP	0x0
#define CONFIG_OUTPUT_CHANNEL_HSIDAM	0x1
#define CONFIG_OUTPUT_CHANNEL_HSIDBP	0x2
#define CONFIG_OUTPUT_CHANNEL_HSIDBM	0x3
#define CONFIG_OUTPUT_CHANNEL_HSIDC		0x4
u32 HSI_output_channel_setting = CONFIG_OUTPUT_CHANNEL_HSIDAP;
//
#define CONFIG_SPI_CLK_DIV_1			0x0	// base frequency is 25MHz
#define CONFIG_SPI_CLK_DIV_2			0x1	// div2 is 12.5MHz
#define CONFIG_SPI_CLK_DIV_4			0x2	// div4 is 6.25MHz
#define CONFIG_SPI_CLK_DIV_8			0x3	// div8 is 3.125MHz
unsigned int SPI_clock_division_setting = CONFIG_SPI_CLK_DIV_4;

#define DIV_1	1
#define DIV_2	2
#define DIV_4	4
#define DIV_8	8
#define DIV_16	16
#define DIV_32	32
#define DIV_64	64
#define DIV_128	128

#ifdef FAKE_DATA
static void load_sawtooth_up_data(void);
static void load_sawtooth_down_data(void);
#define SAWTOOTH_MAX_VALUE 100
#define SAWTOOTH_STEP_VALUE 1
#endif
/*
 * Device hardware build related constants.
 */

#define DMA_DEV_ID		XPAR_AXIDMA_0_DEVICE_ID

#ifdef XPAR_AXI_7SDDR_0_S_AXI_BASEADDR
#define DDR_BASE_ADDR		XPAR_AXI_7SDDR_0_S_AXI_BASEADDR
#elif XPAR_MIG7SERIES_0_BASEADDR
#define DDR_BASE_ADDR	XPAR_MIG7SERIES_0_BASEADDR
#elif XPAR_MIG_0_BASEADDR
#define DDR_BASE_ADDR	XPAR_MIG_0_BASEADDR
#elif XPAR_PSU_DDR_0_S_AXI_BASEADDR
#define DDR_BASE_ADDR	XPAR_PSU_DDR_0_S_AXI_BASEADDR
#endif

#ifndef DDR_BASE_ADDR
#warning CHECK FOR THE VALID DDR ADDRESS IN XPARAMETERS.H, \
			DEFAULT SET TO 0x01000000
#define MEM_BASE_ADDR		0x01000000
#else
#define MEM_BASE_ADDR		(DDR_BASE_ADDR + 0x1000000)
#endif

#define TX_BD_SPACE_BASE	(MEM_BASE_ADDR)
#define TX_BD_SPACE_HIGH	(MEM_BASE_ADDR + 0x0000FFFF) // was FFFF
#define TX_BUFFER_BASE		(MEM_BASE_ADDR + 0x00010000)
#define TX_BUFFER_HIGH		(MEM_BASE_ADDR + 0x0001FFFF)

#define RX_BD_SPACE_BASE	(MEM_BASE_ADDR + 0x00020000) // was 1000
#define RX_BD_SPACE_HIGH	(MEM_BASE_ADDR + 0x0002FFFF) // was 1FFF
#define RX_BUFFER_BASE		(MEM_BASE_ADDR + 0x00030000)
#define RX_BUFFER_HIGH		(MEM_BASE_ADDR + 0x0003FFFF)

#define MAX_PKT_LEN				8192//16384	// this is Bytes
#define MARK_UNCACHEABLE        0x701

#define TEST_START_VALUE	0xC

#define DELAY_TIMER_DEVICE_ID	XPAR_XTTCPS_0_DEVICE_ID
#define DELAY_TIMER_INTERRUPT_ID	XPAR_XTTCPS_0_INTR
#define	TICK_TIMER_FREQ_HZ	100000  /* Tick timer counter's output frequency */
#define TICKS_PER_CHANGE_PERIOD	TICK_TIMER_FREQ_HZ /* Tick signals per update */

int numberDataSamples;
Xuint32 outputDataBuffer[MAX_PKT_LEN/4];

typedef struct {
	u32 OutputHz;	/* Output frequency */
	XInterval Interval;	/* Interval value */
	u8 Prescaler;	/* Prescaler value */
	u16 Options;	/* Option settings */
} TmrCntrSetup;

// ---------------

#define INTC_INTERRUPT_ID_0 63 // IRQ_F2P[2:2]
#define INTC_INTERRUPT_ID_1 64 // IRQ_F2P[3:3]
#define INTC_INTERRUPT_ID_2 65 // IRQ_F2P[4:4]

// instance of interrupt controller
static XScuGic intc;

// address of AXI PL interrupt generator
Xuint32* baseaddr_p           = (Xuint32*) XPAR_AXI4_PL_INTERRUPT_GE_0_S00_AXI_BASEADDR;
Xuint32* baseaddr_spi         = (Xuint32*) 0x43C10000;
Xuint32* baseaddr_channel     = (Xuint32*) 0x43C20000;
Xuint32* baseaddr_rx_fifo     = (Xuint32*) 0x43C30000;
Xuint32* baseaddr_tx_fifo     = (Xuint32*) 0x43C40000;

int flag;
int setup_interrupt_system();
int Status;
unsigned int state = 0;
static XScuGic interrupt_controller;	//instance of the interrupt controller
XUartPs UartPs;							// Instance of the UART Device

static u8 UartRxData[RX_BUFFER_SIZE];	// Buffer for Receiving Data
static u8 UartTxData[TX_BUFFER_SIZE];	// Buffer for Transmitting Data

u16 ADC_calData[8];			// store ADC cal data read from chip before transmit

u8	FPGA_outputs_state = 2; 	// 1=on, 2=0ff
u8  FPGA_hsi_state = 1;			// 1=disabled, 2=enabled
u8  FPGA_channel_state = 1;     //

#define MAX_TADC_RESULTS_SIZE 512
static u16 testADCresults[MAX_TADC_RESULTS_SIZE];


void isr0 (void *intc_inst_ptr);
void isr1 (void *intc_inst_ptr);
void isr2 (void *intc_inst_ptr);
void nops(unsigned int num);

static XTtcPs DelayTimer;		/* Timer counter instance */
static u8 TimerErrorCount;		/* Errors seen at interrupt time */
static volatile u8 timerRunning;


// --- DMA Device Global Variables.

int Status;
XAxiDma_Config *Config;


/**************************** Type Definitions *******************************/
/***************** Macros (Inline Functions) Definitions *********************/
/************************** Function Prototypes ******************************/

#if defined(XPAR_UARTNS550_0_BASEADDR)
static void Uart550_Setup(void);
#endif

static int  initSPI();
static void readSPIStatus();
static void setSPIControl(Xuint32 v);
static void disableSPI();
static void enableSPI();

void modify_register(unsigned int *data, unsigned int address,
					unsigned int newVal);

static int RxSetup(XAxiDma * AxiDmaInstPtr);
static int TxSetup(XAxiDma * AxiDmaInstPtr);

static int sendDMApacket(XAxiDma * AxiDmaInstPtr, int debug_mode);
static int receiveDMApacket(XAxiDma * AxiDmaInstPtr, int debug_mode);
static int sendDMApackets(int npackets);
static int receiveDMApackets(int npackets);

static int SaveData(int debug_mode);
static int CheckDmaResult(XAxiDma * AxiDmaInstPtr, int debug_mode, int skip);

static int openDMADevice();
static int closeDMADevice();

static int readGyroTxFIFODebugData();
static int readGyroRxFIFODebugData();

static int resetGyroTxFIFO();
static int resetGyroRxFIFO();

static int resetGyroTxFIFOLooping();
static int   setGyroTxFIFOLooping();

static int  initGyroChannel();
static void disableGyroChannel();
static void enableGyroChannel();
static void disableHSIGyroChannel();
static void enableHSIGyroChannel();
static void readGyroChannelStatus();
static int  readGyroChannelDebugData();
static int  setGyroChannelConfiguration(unsigned int v);
static int  setGyroChannelControl(unsigned int v);
static void fillTxPacketBuffer(int npoints, u8 *TxPacket);

static int 	SetupUartPs(XScuGic *IntcInstPtr, XUartPs *UartInstPtr,
					u16 DeviceId, u16 UartIntrId);
static void UartPsISR(void *CallBackRef, u32 Event, unsigned int EventData);
static int 	SetupUartInterruptSystem(XScuGic *IntcInstancePtr,
					XUartPs *UartInstancePtr,
					u16 UartIntrId);
static void read_uart_bytes(void);
static unsigned int get_num_data_points(u8 *RxData);
static void send_Tx_data_over_UART(unsigned int num_points_to_send);
static void send_data_over_UART(unsigned int num_points_to_send, u8 *dataArray);
static void send_byte_over_UART(Xuint8 byteToSend);
static int InitializeDelayTimer(void);
void SetTimerDuration(XInterval interval, u8 prescalar);
static void DelayTimerInterruptHandler(void *CallBackRef);
static Xuint8 ProgramOTP(u32 otp32BitValue);
static Xuint8 ProgramOTP_chipID(u32 id);
Xuint8 ProgramOTP_VbgTrim(u8 trimVal);
static u32 readOTP32bits(void);
static void run_ADC0_calibration(void);
static void run_ADC1_calibration(void);
static void read_ADC0_cal_data(void);
static void read_ADC1_cal_data(void);
static int initDMADevice(void);
static int sendPacketButton(void);
static int receivePacketButton(void);
static void fill_testADC_results_array(u16 signalToMeasure, u16 numReadings);
static void changeSPIclockDivision(u8 divSetting);
static void changeMCLKdivision(u8 divSetting);
static void changeHSI_ADC_selection(u8 selection);
static void sendConfigBytesOverUart(void);
/************************** Variable Definitions *****************************/
/*
 * Device instance definitions
 */
XAxiDma AxiDma;

/*
 * Buffer for transmit packet. Must be 32-bit aligned to be used by DMA.
 */
u32 *Packet = (u32 *) TX_BUFFER_BASE;

// -------------------------------------------------------------------
int initGyroChannel(){
  // --- clear GYRO stream channel registers
  *(baseaddr_channel+0) = 0x80000000; // reset
  *(baseaddr_channel+0) = 0x00000000;
  *(baseaddr_channel+1) = 0x00000000;
  *(baseaddr_channel+2) = 0x00000000;
  *(baseaddr_channel+3) = 0x00000000;
  return 0;
}

// -------------------------------------------------------------------
void readGyroChannelStatus(){
  xil_printf("Gyro Channel reg0: 0x%08x\n\r", *(baseaddr_channel+0));
  xil_printf("Gyro Channel reg1: 0x%08x\n\r", *(baseaddr_channel+1));
  xil_printf("Gyro Channel reg2: 0x%08x\n\r", *(baseaddr_channel+2));
  xil_printf("Gyro Channel reg3: 0x%08x\n\r", *(baseaddr_channel+3));
}

// -------------------------------------------------------------------
int setGyroChannelConfiguration(unsigned int v){
  // --- clear GYRO stream channel registers
	Xuint32 x;
    x = (Xuint32)(v);
  *(baseaddr_channel+0) = x;
  return 0;
}
// -------------------------------------------------------------------

 void disableGyroChannel(){
	  *(baseaddr_channel+2) = 0x00000000;
	  FPGA_hsi_state = 2;
	  FPGA_channel_state = 2;
 }
 // -------------------------------------------------------------------

 void enableGyroChannel(){
	  *(baseaddr_channel+2) = 0x00000011;
	  FPGA_hsi_state = 1;
	  FPGA_channel_state = 1;
 }
 // -------------------------------------------------------------------

 void disableHSIGyroChannel(){
	 if(FPGA_channel_state == 1){ // 1=enabled, 2=disabled
	  *(baseaddr_channel+2) = 0x000000001;
	  FPGA_hsi_state = 2;
	 }

 }
 // -------------------------------------------------------------------

 void enableHSIGyroChannel(){
	 if(FPGA_channel_state == 1){
	  *(baseaddr_channel+2) = 0x000000011;
	  FPGA_hsi_state = 1;
	 }
 }

// -------------------------------------------------------------------
int setGyroChannelControl(unsigned int v){
  // --- clear GYRO stream channel registers
	Xuint32 x;
    x = (Xuint32)(v);
  *(baseaddr_channel+1) = x;
  return 0;
}
// -------------------------------------------------------------------
int readGyroChannelDebugData(){
  // ---
  xil_printf("Gyro Channel Buffer Info: 0x%08x\n\r", *(baseaddr_channel+2));
  xil_printf("Gyro Channel ClkGen Info: 0x%08x\n\r", *(baseaddr_channel+3));
  return 0;
}
// -------------------------------------------------------------------
int readGyroRxFIFODebugData(){
  // ---
  xil_printf("Gyro RxFIFO Debug Word 0: 0x%08x\n\r", *(baseaddr_rx_fifo+0));
  xil_printf("Gyro RxFIFO Debug Word 1: 0x%08x\n\r", *(baseaddr_rx_fifo+1));
  xil_printf("Gyro RxFIFO Debug Word 2: 0x%08x\n\r", *(baseaddr_rx_fifo+2));
  xil_printf("Gyro RxFIFO Debug Word 3: 0x%08x\n\r", *(baseaddr_rx_fifo+3));
  return 0;
}
// -------------------------------------------------------------------
int readGyroTxFIFODebugData(){
  // ---
  xil_printf("Gyro TxFIFO Debug Word 0: 0x%08x\n\r", *(baseaddr_tx_fifo+0));
  xil_printf("Gyro TxFIFO Debug Word 1: 0x%08x\n\r", *(baseaddr_tx_fifo+1));
  xil_printf("Gyro TxFIFO Debug Word 2: 0x%08x\n\r", *(baseaddr_tx_fifo+2));
  xil_printf("Gyro TxFIFO Debug Word 3: 0x%08x\n\r", *(baseaddr_tx_fifo+3));
  return 0;
}

// -------------------------------------------------------------------
int resetGyroTxFIFO(){
	*(baseaddr_tx_fifo+0) = 0x00000001;
	*(baseaddr_tx_fifo+0) = 0x00000000;
	  return 0;
}

// -------------------------------------------------------------------
int resetGyroRxFIFO(){
	*(baseaddr_rx_fifo+0) = 0x00000001;
	*(baseaddr_rx_fifo+0) = 0x00000000;
	  return 0;
}

int resetGyroTxFIFOLooping(){
	*(baseaddr_tx_fifo+1) = 0x00000000;
	  return 0;
}

int setGyroTxFIFOLooping(){
	*(baseaddr_tx_fifo+1) = 0x00000001;
	  return 0;
}
// -------------------------------------------------------------------
//   SPI FUNCTIONS
// -------------------------------------------------------------------
int initSPI(){
    // clear SPI registers
    *(baseaddr_spi+0) = 0x00000000;
    *(baseaddr_spi+1) = 0x00000000;
    *(baseaddr_spi+2) = 0x00000000;
    *(baseaddr_spi+3) = 0x00000000;
    return 0;
}

// -------------------------------------------------------------------
void readSPIStatus(){
    xil_printf("baseaddr_spi+0: 0x%08x\n", *(baseaddr_spi+0));
    xil_printf("baseaddr_spi+1: 0x%08x\n", *(baseaddr_spi+1));
    xil_printf("baseaddr_spi+2: 0x%08x\n", *(baseaddr_spi+2));
    xil_printf("baseaddr_spi+3: 0x%08x\n\n", *(baseaddr_spi+3));
}

// -------------------------------------------------------------------
void setSPIControl(Xuint32 v){
	*(baseaddr_spi+3) = v;
}

// -------------------------------------------------------------------
 void setSPIClockDivision(unsigned int v){
   Xuint32 x;

   x = (Xuint32)(v & 0x00000007);
   *(baseaddr_spi+3) = x;
}

 // -------------------------------------------------------------------
  int readSPIClockDivision(){
     Xuint32 x;
     x = *(baseaddr_spi+3);
     return (((int)x) & 0x00000007);
}

// -------------------------------------------------------------------
int writeSPI_blocking(unsigned int address, unsigned int data){
	Xuint32 d, m;
	int x, y, v;

	x = (address & 0x0000007f) << 16;
	y = ((0x0000FFFF) & data);
	v = 0x80000000 | (x | y);
    m = (Xuint32)v;
//    xil_printf("== m  0x%08x \n",m);
	*(baseaddr_spi+0) = m;
	while(1){
	  d = *(baseaddr_spi+1);
//	  xil_printf("== read d  0x%08x \n",d);

	  v = (unsigned int)d;
	  if(v & 0x80000000){
		break;
	  }

    }
    *(baseaddr_spi+0) = 0x00000000;
    return 0;
}
// -------------------------------------------------------------------
 int writeSPI_non_blocking(unsigned int address, unsigned int data){
    Xuint32 d, m;
    int i, x, y, v;
    int clk_div, delay;

    clk_div = readSPIClockDivision(); // binary representation
    delay = 16000;

    x = (address & 0x0000007f) << 16;
    y = ((0x0000FFFF) & data);
    v = 0x80000000 | (x | y);
    m = (Xuint32)v;

   *(baseaddr_spi+0) = m;
   //*(baseaddr_spi+0) = 0x80800F57; // debug only...

   for(i = 0; i <= clk_div; i++){
     nops(delay << i);
     d = *(baseaddr_spi+1);
     v = (unsigned int)d;
     if(v & 0x80000000){
       *(baseaddr_spi+0) = 0x00000000;
       return 0;
     }
   }
   *(baseaddr_spi+0) = 0x00000000;
   return 1;
 }

 // -------------------------------------------------------------------
int writeSPI_non_blocking_orig(unsigned int address, unsigned int data){
	Xuint32 d, m;
	int i, x, y, v;
	int delay;

	delay = 2000;
	x = (address & 0x0000007f) << 16;
	y = ((0x0000FFFF) & data);
	v = 0x80000000 | (x | y);
    m = (Xuint32)v;
    //xil_printf("== m  0x%08x \n\r",m);
	*(baseaddr_spi+0) = m;
    //*(baseaddr_spi+0) = 0x80800F51; // debug only....
    for(i = 0; i < 5; i++){
    	nops(delay << i);
	  d = *(baseaddr_spi+1);
	   //xil_printf("== read d  0x%08x \n\r",d);
	  v = (unsigned int)d;
	  if(v & 0x80000000){
		*(baseaddr_spi+0) = 0x00000000;
		return 0;
	  }
    }
    *(baseaddr_spi+0) = 0x00000000;
    return 1;
}

// -------------------------------------------------------------------
int readSPI(unsigned int *data, unsigned int address){
  Xuint32 d, m;
  int i, x, v, r;
  int res, delay, clk_div;

  clk_div = readSPIClockDivision(); // binary representation
  delay = 16000;

  res = 1;
  *data = 0x00000000;           // clears result
  x = ((address & 0x0000007F) << 16) | 0x00800000;	// DEBUG: the 8F51 is a test pattern
  v = (0x80000000 | x);         // set the start bit
  m = (Xuint32)v;
  *(baseaddr_spi+0) = m;
  for(i = 0; i < clk_div; i++){
    nops(delay << i);
    d = *(baseaddr_spi+1);
    r = (unsigned int)d;
    if(r & 0x80000000){
      *data = (0x0000FFFF & r); // only lower 16 bits matter
      res = 0;
#ifdef FAKE_IC
      *data = (0x0000ABCD);
#endif
      break;
    }
  }
  v = (0x7FFFFFFF & x);
  m = (Xuint32)v;
  *(baseaddr_spi+0) = m;        // clear start
  return res;
}

void disableSPI(){
    *(baseaddr_spi+2) = 0x00000000;
}

void enableSPI(){
    *(baseaddr_spi+2) = 0x00000001;
}
// -------------------------------------------------------------------
void modify_register(unsigned int *data, unsigned int address, unsigned int newVal)
{
	readSPI(data,address);
	xil_printf("\n   reading reg %d: 0x%04x\n",address,*data);
	writeSPI_non_blocking_orig(address,newVal);
	xil_printf("   wrote a 0x%04x to reg%d\n",newVal,address);
	readSPI(data,address);
	xil_printf("   reading reg %d: 0x%04x\n",address,*data);
}

// -------------------------------------------------------------------

// -------------------------------------------------------------------
// NOTE: old code for the FEB_04 project where we had a sample generator
// inside the FPGA.
//
/*
void sendGyroPacket(int nsamples){

*(baseaddr_channel+3) = 0x23000010;
*(baseaddr_channel+2) = 0x80000000;
 nops(100000);
*(baseaddr_channel+2) = 0x00000000;

 }
*/

// -------------------------------------------------------------------
// interrupt service routine for IRQ_F2P[0:0]
void isr0 (void *intc_inst_ptr) {
    xil_printf("isr0 called\n\r");
    *(baseaddr_p+0) = 0x00000000;
}

// interrupt service routine for IRQ_F2P[1:1]
void isr1 (void *intc_inst_ptr) {
    xil_printf("isr1 called\n\r");
    *(baseaddr_p+1) = 0x00000000;
}

// interrupt service routine for IRQ_F2P[2:2]
void isr2 (void *intc_inst_ptr) {
    xil_printf("isr2 called\n\r");
    *(baseaddr_p+2) = 0x00000000;
    xil_printf("read inside isr2:    slv_reg3: 0x%08x\n\r", *(baseaddr_p+3));
    flag = 0;
}

// sets up the interrupt system and enables interrupts for IRQ_F2P[1:0]
int setup_interrupt_system() {

    int result;
    XScuGic *intc_instance_ptr = &intc;
    XScuGic_Config *intc_config;

    // get config for interrupt controller
    intc_config = XScuGic_LookupConfig(XPAR_PS7_SCUGIC_0_DEVICE_ID);
    if (NULL == intc_config) {
        return XST_FAILURE;
    }

    // initialize the interrupt controller driver
    result = XScuGic_CfgInitialize(intc_instance_ptr, intc_config, intc_config->CpuBaseAddress);

    if (result != XST_SUCCESS) {
        return result;
    }

    // set the priority of IRQ_F2P[0:0] to 0xA0 (highest 0xF8, lowest 0x00) and a trigger for a rising edge 0x3.
    XScuGic_SetPriorityTriggerType(intc_instance_ptr, INTC_INTERRUPT_ID_0, 0xA0, 0x3);
    xil_printf("slv_reg3: 0x%08x\n\r", *(baseaddr_p+3));
    // connect the interrupt service routine isr0 to the interrupt controller
    result = XScuGic_Connect(intc_instance_ptr, INTC_INTERRUPT_ID_0, (Xil_ExceptionHandler)isr0, (void *)&intc);

    if (result != XST_SUCCESS) {
        return result;
    }

    // enable interrupts for IRQ_F2P[0:0]
    XScuGic_Enable(intc_instance_ptr, INTC_INTERRUPT_ID_0);

    // set the priority of IRQ_F2P[1:1] to 0xA8 (highest 0xF8, lowest 0x00) and a trigger for a rising edge 0x3.
    XScuGic_SetPriorityTriggerType(intc_instance_ptr, INTC_INTERRUPT_ID_1, 0xA8, 0x3);

    // connect the interrupt service routine isr1 to the interrupt controller
    result = XScuGic_Connect(intc_instance_ptr, INTC_INTERRUPT_ID_1, (Xil_ExceptionHandler)isr1, (void *)&intc);

    if (result != XST_SUCCESS) {
        return result;
    }

    // enable interrupts for IRQ_F2P[1:1]
    XScuGic_Enable(intc_instance_ptr, INTC_INTERRUPT_ID_1);


    // set the priority of IRQ_F2P[1:1] to 0xA8 (highest 0xF8, lowest 0x00) and a trigger for a rising edge 0x3.
    XScuGic_SetPriorityTriggerType(intc_instance_ptr, INTC_INTERRUPT_ID_2, 0xA8, 0x3);
    // connect the interrupt service routine isr1 to the interrupt controller
    result = XScuGic_Connect(intc_instance_ptr, INTC_INTERRUPT_ID_2, (Xil_ExceptionHandler)isr2, (void *)&intc);

    if (result != XST_SUCCESS) {
        return result;
    }
    // enable interrupts for IRQ_F2P[2:2]
    XScuGic_Enable(intc_instance_ptr, INTC_INTERRUPT_ID_2);

    // initialize the exception table and register the interrupt controller handler with the exception table
    Xil_ExceptionInit();

    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler)XScuGic_InterruptHandler, intc_instance_ptr);

    // enable non-critical exceptions
    Xil_ExceptionEnable();

    return XST_SUCCESS;
}

// -----------------------------------------------------------------------
//   DMA FUNCTIONS
// ---------- functions from dma -----------------------------------------

#if defined(XPAR_UARTNS550_0_BASEADDR)
/*****************************************************************************/
/*
*
* Uart16550 setup routine, need to set baudrate to 9600, and data bits to 8
*
*/

static void Uart550_Setup(void){

	/* Set the baudrate to be predictable
	 */
	XUartNs550_SetBaud(XPAR_UARTNS550_0_BASEADDR,
			XPAR_XUARTNS550_CLOCK_HZ, 9600);

	XUartNs550_SetLineControlReg(XPAR_UARTNS550_0_BASEADDR,
			XUN_LCR_8_DATA_BITS);

}
#endif

static int closeDMADevice(){
  return XST_SUCCESS;
}

static int openDMADevice(){

//#if defined(XPAR_UARTNS550_0_BASEADDR)
//	Uart550_Setup();
//#endif

#ifdef __aarch64__
Xil_SetTlbAttributes(TX_BD_SPACE_BASE, MARK_UNCACHEABLE);
Xil_SetTlbAttributes(RX_BD_SPACE_BASE, MARK_UNCACHEABLE);
#endif

Config = XAxiDma_LookupConfig(DMA_DEV_ID);
if (!Config) {
	xil_printf(" *** Error: No config found for %d\r\n", DMA_DEV_ID);
	return XST_FAILURE;
} else {
	xil_printf(" >>> config found for %d\r\n", DMA_DEV_ID);
}

/* Initialize DMA engine */
Status = XAxiDma_CfgInitialize(&AxiDma, Config);
if (Status != XST_SUCCESS) {
   xil_printf(" *** Error: Initialization failed %d\r\n", Status);
   return XST_FAILURE;
} else {
	xil_printf(" >>> Initialization succeeded\r\n");
}

if(!XAxiDma_HasSg(&AxiDma)) {
   xil_printf("Could not configure device as Simple mode \r\n");
   return XST_FAILURE;
} else {
	 xil_printf("Device configured as Simple mode \r\n");
}
  return XST_SUCCESS;
}
/*****************************************************************************/
/**
*
* This function sets up RX channel of the DMA engine to be ready for packet
* reception
*
* @param	AxiDmaInstPtr is the pointer to the instance of the DMA engine.
*
* @return	XST_SUCCESS if the setup is successful, XST_FAILURE otherwise.
*
* @note		None.
*
******************************************************************************/
static int RxSetup(XAxiDma * AxiDmaInstPtr){
	XAxiDma_BdRing *RxRingPtr;
	int Delay = 0;
	int Coalesce = 1;
	int Status;
	XAxiDma_Bd BdTemplate;
	XAxiDma_Bd *BdPtr;
	XAxiDma_Bd *BdCurPtr;
	u32 BdCount;
	u32 FreeBdCount;
	UINTPTR RxBufferPtr;
	int Index;

	RxRingPtr = XAxiDma_GetRxRing(&AxiDma);

	/* Disable all RX interrupts before RxBD space setup */

	XAxiDma_BdRingIntDisable(RxRingPtr, XAXIDMA_IRQ_ALL_MASK);

	/* Set delay and coalescing */
	XAxiDma_BdRingSetCoalesce(RxRingPtr, Coalesce, Delay);

	/* Setup Rx BD space */
	BdCount = XAxiDma_BdRingCntCalc(XAXIDMA_BD_MINIMUM_ALIGNMENT,
				RX_BD_SPACE_HIGH - RX_BD_SPACE_BASE + 1);

	Status = XAxiDma_BdRingCreate(RxRingPtr, RX_BD_SPACE_BASE,
				RX_BD_SPACE_BASE,
				XAXIDMA_BD_MINIMUM_ALIGNMENT, BdCount);

	if (Status != XST_SUCCESS) {
		xil_printf(" *** Error: RX create BD ring failed %d\r\n", Status);
		return XST_FAILURE;
	}

	/*
	 * Setup an all-zero BD as the template for the Rx channel.
	 */
	XAxiDma_BdClear(&BdTemplate);

	Status = XAxiDma_BdRingClone(RxRingPtr, &BdTemplate);
	if (Status != XST_SUCCESS) {
		xil_printf(" *** Error: RX clone BD failed %d\r\n", Status);
		return XST_FAILURE;
	}

	/* Attach buffers to RxBD ring so we are ready to receive packets */

	FreeBdCount = XAxiDma_BdRingGetFreeCnt(RxRingPtr);

	Status = XAxiDma_BdRingAlloc(RxRingPtr, FreeBdCount, &BdPtr);
	if (Status != XST_SUCCESS) {
		xil_printf(" *** Error: RX alloc BD failed %d\r\n", Status);
		return XST_FAILURE;
	}

	BdCurPtr = BdPtr;
	RxBufferPtr = RX_BUFFER_BASE;
	for (Index = 0; Index < FreeBdCount; Index++) {
		Status = XAxiDma_BdSetBufAddr(BdCurPtr, RxBufferPtr);

		if (Status != XST_SUCCESS) {
		  xil_printf(" *** Error: Set buffer addr %x on BD %x failed %d\r\n",
			(unsigned int)RxBufferPtr,(UINTPTR)BdCurPtr, Status);
		  return XST_FAILURE;
		}

		Status = XAxiDma_BdSetLength(BdCurPtr, MAX_PKT_LEN,
				RxRingPtr->MaxTransferLen);
		if (Status != XST_SUCCESS) {
			xil_printf(" *** Error: Rx set length %d on BD %x failed %d\r\n",
			    MAX_PKT_LEN, (UINTPTR)BdCurPtr, Status);
			return XST_FAILURE;
		}

		/* Receive BDs do not need to set anything for the control
		 * The hardware will set the SOF/EOF bits per stream status
		 */
		XAxiDma_BdSetCtrl(BdCurPtr, 0);
		XAxiDma_BdSetId(BdCurPtr, RxBufferPtr);

		RxBufferPtr += MAX_PKT_LEN;
		BdCurPtr = (XAxiDma_Bd *)XAxiDma_BdRingNext(RxRingPtr, BdCurPtr);
	}

	/* Clear the receive buffer, so we can verify data
	 */
	memset((void *)RX_BUFFER_BASE, 0, MAX_PKT_LEN);

	Status = XAxiDma_BdRingToHw(RxRingPtr, FreeBdCount, BdPtr);
	if (Status != XST_SUCCESS) {
		xil_printf(" *** Error: RX submit hw failed %d\r\n", Status);
		return XST_FAILURE;
	}

	/* Start RX DMA channel */
	Status = XAxiDma_BdRingStart(RxRingPtr);
	if (Status != XST_SUCCESS) {
		xil_printf(" *** Error: RX start hw failed %d\r\n", Status);
		return XST_FAILURE;
	}
	return XST_SUCCESS;
}

/*****************************************************************************/
/**
*
* This function sets up the TX channel of a DMA engine to be ready for packet
* transmission
*
* @param	AxiDmaInstPtr is the instance pointer to the DMA engine.
*
* @return	XST_SUCCESS if the setup is successful, XST_FAILURE otherwise.
*
* @note		None.
*
******************************************************************************/
static int TxSetup(XAxiDma * AxiDmaInstPtr){
	XAxiDma_BdRing *TxRingPtr;
	XAxiDma_Bd BdTemplate;
	int Delay = 0;
	int Coalesce = 1;
	int Status;
	u32 BdCount;

	TxRingPtr = XAxiDma_GetTxRing(&AxiDma);

	/* Disable all TX interrupts before TxBD space setup */

	XAxiDma_BdRingIntDisable(TxRingPtr, XAXIDMA_IRQ_ALL_MASK);

	/* Set TX delay and coalesce */
	XAxiDma_BdRingSetCoalesce(TxRingPtr, Coalesce, Delay);

	/* Setup TxBD space  */
	BdCount = XAxiDma_BdRingCntCalc(XAXIDMA_BD_MINIMUM_ALIGNMENT,
				TX_BD_SPACE_HIGH - TX_BD_SPACE_BASE + 1);

	Status = XAxiDma_BdRingCreate(TxRingPtr, TX_BD_SPACE_BASE,
				TX_BD_SPACE_BASE,
				XAXIDMA_BD_MINIMUM_ALIGNMENT, BdCount);
	if (Status != XST_SUCCESS) {
		xil_printf(" *** Error: failed to create BD ring in TxSetup\r\n");
		return XST_FAILURE;
	}

	/*
	 * We create an all-zero BD as the template.
	 */
	XAxiDma_BdClear(&BdTemplate);

	Status = XAxiDma_BdRingClone(TxRingPtr, &BdTemplate);
	if (Status != XST_SUCCESS) {
		xil_printf(" ** Error: failed bdring clone in TxSetup %d\r\n", Status);
		return XST_FAILURE;
	}

	/* Start the TX channel */
	Status = XAxiDma_BdRingStart(TxRingPtr);
	if (Status != XST_SUCCESS) {
		xil_printf(" *** Error: failed to start bdring TxSetup %d\r\n", Status);
		return XST_FAILURE;
	}
	return XST_SUCCESS;
}


/*****************************************************************************/
static void fillTxPacketBufferSineWave(int npoints, u8 *TxPacket){
	int Index;
	u8 Value1,Value2;
	u8 Value;


}

// -------------------------------------------------------------
//
// -------------------------------------------------------------
// N is the number of samples and each sample is 1 micro secs
// Example:  generateSineWave(50.0*1E3, N);
// --------------------------------------------------------
void emitDataToBuffer(int idx, double value) {
  signed short int v;

  v = (signed short int)(value);
  v = v & 0x0FFF;
  v = v << 4;
  printf("TxPacket[%d] = 0x%02x;\n",((idx*2)^2),v&0x00FF);
  printf("TxPacket[%d] = 0x%02x;\n",((idx*2+1)^2),((v&0xFF00) >> 8) & 0xFF);
}

void generateSineWave(double freq, int num_samples, int AMP) {
  double f, x, y, base, mult;
  signed short int i, v, w;

  // printf(" size: %d\n",sizeof(v));
  // for N = 128 we get base = 7.8 KHz : 1.0/(128 * 1 micro secs)
  base = 1.0/(num_samples*1.0E-6);
  f = (3.151526/180.0);
  mult = freq / base;

  for(i = 0; i < num_samples; i++){
    //x = sin(mult*f*i*(360.0/(num_samples * 1.0)));
    emitDataToBuffer(i, x*((AMP)*1.0)+ (AMP*1.0));
  }
}





/*****************************************************************************/
static void fillTxPacketBuffer(int npoints, u8 *TxPacket){
	int Index;
/*
	  for(Index = 0; Index < (npoints/4); Index = Index+2) {
		TxPacket[Index] = Value1;
		TxPacket[Index+1] = Value2;
	  }
*/

/*
		Value = 0x00;
		for(Index = 0; Index < npoints/2; Index++){
			TxPacket[Index*2] = 0xf0;
			TxPacket[Index*2+1] =((2*Value) & 0xff);
			Value = (Value +1) & 0xFF;
		}
*/
/*
 		//============== ramp data ======================
		u16 rampValue = 0x00;
		u16 dataShifted;
		for(Index = 0; Index < npoints; Index++){
			dataShifted = rampValue << 4;

			if (Index < 2048)
			{	//first half of the buffer
				TxPacket[Index*2] = (u8)(dataShifted & 0xFF); //store the LSbyte
				TxPacket[Index*2+1] = (u8)(dataShifted >> 8); //store the MSbyte
				rampValue++;
			}
			else
			{	//second half of the buffer
				TxPacket[Index*2] = (u8)(dataShifted & 0xFF); //store the LSbyte
				TxPacket[Index*2+1] = (u8)(dataShifted >> 8); //store the MSbyte
				rampValue--;

			}
		}
		//===============================================

*/

/*     	//=========== static DC value ===================
		u16 dataShifted = 0xAA5 << 4;
		for(Index = 0; Index < npoints; Index++){
			TxPacket[Index*2] = (u8)(dataShifted & 0xFF);
			TxPacket[Index*2+1] = (u8)(dataShifted >> 8);
		}
*/		//===============================================
		u16 sine[4096];
		sine[0] = 0x800;
		sine[1] = 0x803;
		sine[2] = 0x806;
		sine[3] = 0x809;
		sine[4] = 0x80c;
		sine[5] = 0x80f;
		sine[6] = 0x812;
		sine[7] = 0x815;
		sine[8] = 0x819;
		sine[9] = 0x81c;
		sine[10] = 0x81f;
		sine[11] = 0x822;
		sine[12] = 0x825;
		sine[13] = 0x828;
		sine[14] = 0x82b;
		sine[15] = 0x82f;
		sine[16] = 0x832;
		sine[17] = 0x835;
		sine[18] = 0x838;
		sine[19] = 0x83b;
		sine[20] = 0x83e;
		sine[21] = 0x841;
		sine[22] = 0x845;
		sine[23] = 0x848;
		sine[24] = 0x84b;
		sine[25] = 0x84e;
		sine[26] = 0x851;
		sine[27] = 0x854;
		sine[28] = 0x857;
		sine[29] = 0x85b;
		sine[30] = 0x85e;
		sine[31] = 0x861;
		sine[32] = 0x864;
		sine[33] = 0x867;
		sine[34] = 0x86a;
		sine[35] = 0x86d;
		sine[36] = 0x871;
		sine[37] = 0x874;
		sine[38] = 0x877;
		sine[39] = 0x87a;
		sine[40] = 0x87d;
		sine[41] = 0x880;
		sine[42] = 0x883;
		sine[43] = 0x886;
		sine[44] = 0x88a;
		sine[45] = 0x88d;
		sine[46] = 0x890;
		sine[47] = 0x893;
		sine[48] = 0x896;
		sine[49] = 0x899;
		sine[50] = 0x89c;
		sine[51] = 0x8a0;
		sine[52] = 0x8a3;
		sine[53] = 0x8a6;
		sine[54] = 0x8a9;
		sine[55] = 0x8ac;
		sine[56] = 0x8af;
		sine[57] = 0x8b2;
		sine[58] = 0x8b5;
		sine[59] = 0x8b9;
		sine[60] = 0x8bc;
		sine[61] = 0x8bf;
		sine[62] = 0x8c2;
		sine[63] = 0x8c5;
		sine[64] = 0x8c8;
		sine[65] = 0x8cb;
		sine[66] = 0x8ce;
		sine[67] = 0x8d2;
		sine[68] = 0x8d5;
		sine[69] = 0x8d8;
		sine[70] = 0x8db;
		sine[71] = 0x8de;
		sine[72] = 0x8e1;
		sine[73] = 0x8e4;
		sine[74] = 0x8e7;
		sine[75] = 0x8eb;
		sine[76] = 0x8ee;
		sine[77] = 0x8f1;
		sine[78] = 0x8f4;
		sine[79] = 0x8f7;
		sine[80] = 0x8fa;
		sine[81] = 0x8fd;
		sine[82] = 0x900;
		sine[83] = 0x903;
		sine[84] = 0x907;
		sine[85] = 0x90a;
		sine[86] = 0x90d;
		sine[87] = 0x910;
		sine[88] = 0x913;
		sine[89] = 0x916;
		sine[90] = 0x919;
		sine[91] = 0x91c;
		sine[92] = 0x91f;
		sine[93] = 0x923;
		sine[94] = 0x926;
		sine[95] = 0x929;
		sine[96] = 0x92c;
		sine[97] = 0x92f;
		sine[98] = 0x932;
		sine[99] = 0x935;
		sine[100] = 0x938;
		sine[101] = 0x93b;
		sine[102] = 0x93f;
		sine[103] = 0x942;
		sine[104] = 0x945;
		sine[105] = 0x948;
		sine[106] = 0x94b;
		sine[107] = 0x94e;
		sine[108] = 0x951;
		sine[109] = 0x954;
		sine[110] = 0x957;
		sine[111] = 0x95a;
		sine[112] = 0x95e;
		sine[113] = 0x961;
		sine[114] = 0x964;
		sine[115] = 0x967;
		sine[116] = 0x96a;
		sine[117] = 0x96d;
		sine[118] = 0x970;
		sine[119] = 0x973;
		sine[120] = 0x976;
		sine[121] = 0x979;
		sine[122] = 0x97c;
		sine[123] = 0x980;
		sine[124] = 0x983;
		sine[125] = 0x986;
		sine[126] = 0x989;
		sine[127] = 0x98c;
		sine[128] = 0x98f;
		sine[129] = 0x992;
		sine[130] = 0x995;
		sine[131] = 0x998;
		sine[132] = 0x99b;
		sine[133] = 0x99e;
		sine[134] = 0x9a1;
		sine[135] = 0x9a4;
		sine[136] = 0x9a8;
		sine[137] = 0x9ab;
		sine[138] = 0x9ae;
		sine[139] = 0x9b1;
		sine[140] = 0x9b4;
		sine[141] = 0x9b7;
		sine[142] = 0x9ba;
		sine[143] = 0x9bd;
		sine[144] = 0x9c0;
		sine[145] = 0x9c3;
		sine[146] = 0x9c6;
		sine[147] = 0x9c9;
		sine[148] = 0x9cc;
		sine[149] = 0x9cf;
		sine[150] = 0x9d2;
		sine[151] = 0x9d6;
		sine[152] = 0x9d9;
		sine[153] = 0x9dc;
		sine[154] = 0x9df;
		sine[155] = 0x9e2;
		sine[156] = 0x9e5;
		sine[157] = 0x9e8;
		sine[158] = 0x9eb;
		sine[159] = 0x9ee;
		sine[160] = 0x9f1;
		sine[161] = 0x9f4;
		sine[162] = 0x9f7;
		sine[163] = 0x9fa;
		sine[164] = 0x9fd;
		sine[165] = 0xa00;
		sine[166] = 0xa03;
		sine[167] = 0xa06;
		sine[168] = 0xa09;
		sine[169] = 0xa0c;
		sine[170] = 0xa0f;
		sine[171] = 0xa12;
		sine[172] = 0xa15;
		sine[173] = 0xa19;
		sine[174] = 0xa1c;
		sine[175] = 0xa1f;
		sine[176] = 0xa22;
		sine[177] = 0xa25;
		sine[178] = 0xa28;
		sine[179] = 0xa2b;
		sine[180] = 0xa2e;
		sine[181] = 0xa31;
		sine[182] = 0xa34;
		sine[183] = 0xa37;
		sine[184] = 0xa3a;
		sine[185] = 0xa3d;
		sine[186] = 0xa40;
		sine[187] = 0xa43;
		sine[188] = 0xa46;
		sine[189] = 0xa49;
		sine[190] = 0xa4c;
		sine[191] = 0xa4f;
		sine[192] = 0xa52;
		sine[193] = 0xa55;
		sine[194] = 0xa58;
		sine[195] = 0xa5b;
		sine[196] = 0xa5e;
		sine[197] = 0xa61;
		sine[198] = 0xa64;
		sine[199] = 0xa67;
		sine[200] = 0xa6a;
		sine[201] = 0xa6d;
		sine[202] = 0xa70;
		sine[203] = 0xa73;
		sine[204] = 0xa76;
		sine[205] = 0xa79;
		sine[206] = 0xa7c;
		sine[207] = 0xa7f;
		sine[208] = 0xa82;
		sine[209] = 0xa85;
		sine[210] = 0xa88;
		sine[211] = 0xa8b;
		sine[212] = 0xa8e;
		sine[213] = 0xa91;
		sine[214] = 0xa94;
		sine[215] = 0xa97;
		sine[216] = 0xa9a;
		sine[217] = 0xa9d;
		sine[218] = 0xaa0;
		sine[219] = 0xaa2;
		sine[220] = 0xaa5;
		sine[221] = 0xaa8;
		sine[222] = 0xaab;
		sine[223] = 0xaae;
		sine[224] = 0xab1;
		sine[225] = 0xab4;
		sine[226] = 0xab7;
		sine[227] = 0xaba;
		sine[228] = 0xabd;
		sine[229] = 0xac0;
		sine[230] = 0xac3;
		sine[231] = 0xac6;
		sine[232] = 0xac9;
		sine[233] = 0xacc;
		sine[234] = 0xacf;
		sine[235] = 0xad2;
		sine[236] = 0xad5;
		sine[237] = 0xad8;
		sine[238] = 0xadb;
		sine[239] = 0xadd;
		sine[240] = 0xae0;
		sine[241] = 0xae3;
		sine[242] = 0xae6;
		sine[243] = 0xae9;
		sine[244] = 0xaec;
		sine[245] = 0xaef;
		sine[246] = 0xaf2;
		sine[247] = 0xaf5;
		sine[248] = 0xaf8;
		sine[249] = 0xafb;
		sine[250] = 0xafe;
		sine[251] = 0xb01;
		sine[252] = 0xb03;
		sine[253] = 0xb06;
		sine[254] = 0xb09;
		sine[255] = 0xb0c;
		sine[256] = 0xb0f;
		sine[257] = 0xb12;
		sine[258] = 0xb15;
		sine[259] = 0xb18;
		sine[260] = 0xb1b;
		sine[261] = 0xb1e;
		sine[262] = 0xb20;
		sine[263] = 0xb23;
		sine[264] = 0xb26;
		sine[265] = 0xb29;
		sine[266] = 0xb2c;
		sine[267] = 0xb2f;
		sine[268] = 0xb32;
		sine[269] = 0xb35;
		sine[270] = 0xb37;
		sine[271] = 0xb3a;
		sine[272] = 0xb3d;
		sine[273] = 0xb40;
		sine[274] = 0xb43;
		sine[275] = 0xb46;
		sine[276] = 0xb49;
		sine[277] = 0xb4c;
		sine[278] = 0xb4e;
		sine[279] = 0xb51;
		sine[280] = 0xb54;
		sine[281] = 0xb57;
		sine[282] = 0xb5a;
		sine[283] = 0xb5d;
		sine[284] = 0xb60;
		sine[285] = 0xb62;
		sine[286] = 0xb65;
		sine[287] = 0xb68;
		sine[288] = 0xb6b;
		sine[289] = 0xb6e;
		sine[290] = 0xb71;
		sine[291] = 0xb73;
		sine[292] = 0xb76;
		sine[293] = 0xb79;
		sine[294] = 0xb7c;
		sine[295] = 0xb7f;
		sine[296] = 0xb82;
		sine[297] = 0xb84;
		sine[298] = 0xb87;
		sine[299] = 0xb8a;
		sine[300] = 0xb8d;
		sine[301] = 0xb90;
		sine[302] = 0xb92;
		sine[303] = 0xb95;
		sine[304] = 0xb98;
		sine[305] = 0xb9b;
		sine[306] = 0xb9e;
		sine[307] = 0xba0;
		sine[308] = 0xba3;
		sine[309] = 0xba6;
		sine[310] = 0xba9;
		sine[311] = 0xbac;
		sine[312] = 0xbae;
		sine[313] = 0xbb1;
		sine[314] = 0xbb4;
		sine[315] = 0xbb7;
		sine[316] = 0xbba;
		sine[317] = 0xbbc;
		sine[318] = 0xbbf;
		sine[319] = 0xbc2;
		sine[320] = 0xbc5;
		sine[321] = 0xbc7;
		sine[322] = 0xbca;
		sine[323] = 0xbcd;
		sine[324] = 0xbd0;
		sine[325] = 0xbd3;
		sine[326] = 0xbd5;
		sine[327] = 0xbd8;
		sine[328] = 0xbdb;
		sine[329] = 0xbde;
		sine[330] = 0xbe0;
		sine[331] = 0xbe3;
		sine[332] = 0xbe6;
		sine[333] = 0xbe9;
		sine[334] = 0xbeb;
		sine[335] = 0xbee;
		sine[336] = 0xbf1;
		sine[337] = 0xbf3;
		sine[338] = 0xbf6;
		sine[339] = 0xbf9;
		sine[340] = 0xbfc;
		sine[341] = 0xbfe;
		sine[342] = 0xc01;
		sine[343] = 0xc04;
		sine[344] = 0xc06;
		sine[345] = 0xc09;
		sine[346] = 0xc0c;
		sine[347] = 0xc0f;
		sine[348] = 0xc11;
		sine[349] = 0xc14;
		sine[350] = 0xc17;
		sine[351] = 0xc19;
		sine[352] = 0xc1c;
		sine[353] = 0xc1f;
		sine[354] = 0xc22;
		sine[355] = 0xc24;
		sine[356] = 0xc27;
		sine[357] = 0xc2a;
		sine[358] = 0xc2c;
		sine[359] = 0xc2f;
		sine[360] = 0xc32;
		sine[361] = 0xc34;
		sine[362] = 0xc37;
		sine[363] = 0xc3a;
		sine[364] = 0xc3c;
		sine[365] = 0xc3f;
		sine[366] = 0xc42;
		sine[367] = 0xc44;
		sine[368] = 0xc47;
		sine[369] = 0xc4a;
		sine[370] = 0xc4c;
		sine[371] = 0xc4f;
		sine[372] = 0xc52;
		sine[373] = 0xc54;
		sine[374] = 0xc57;
		sine[375] = 0xc59;
		sine[376] = 0xc5c;
		sine[377] = 0xc5f;
		sine[378] = 0xc61;
		sine[379] = 0xc64;
		sine[380] = 0xc67;
		sine[381] = 0xc69;
		sine[382] = 0xc6c;
		sine[383] = 0xc6e;
		sine[384] = 0xc71;
		sine[385] = 0xc74;
		sine[386] = 0xc76;
		sine[387] = 0xc79;
		sine[388] = 0xc7b;
		sine[389] = 0xc7e;
		sine[390] = 0xc81;
		sine[391] = 0xc83;
		sine[392] = 0xc86;
		sine[393] = 0xc88;
		sine[394] = 0xc8b;
		sine[395] = 0xc8e;
		sine[396] = 0xc90;
		sine[397] = 0xc93;
		sine[398] = 0xc95;
		sine[399] = 0xc98;
		sine[400] = 0xc9a;
		sine[401] = 0xc9d;
		sine[402] = 0xca0;
		sine[403] = 0xca2;
		sine[404] = 0xca5;
		sine[405] = 0xca7;
		sine[406] = 0xcaa;
		sine[407] = 0xcac;
		sine[408] = 0xcaf;
		sine[409] = 0xcb1;
		sine[410] = 0xcb4;
		sine[411] = 0xcb7;
		sine[412] = 0xcb9;
		sine[413] = 0xcbc;
		sine[414] = 0xcbe;
		sine[415] = 0xcc1;
		sine[416] = 0xcc3;
		sine[417] = 0xcc6;
		sine[418] = 0xcc8;
		sine[419] = 0xccb;
		sine[420] = 0xccd;
		sine[421] = 0xcd0;
		sine[422] = 0xcd2;
		sine[423] = 0xcd5;
		sine[424] = 0xcd7;
		sine[425] = 0xcda;
		sine[426] = 0xcdc;
		sine[427] = 0xcdf;
		sine[428] = 0xce1;
		sine[429] = 0xce4;
		sine[430] = 0xce6;
		sine[431] = 0xce9;
		sine[432] = 0xceb;
		sine[433] = 0xcee;
		sine[434] = 0xcf0;
		sine[435] = 0xcf3;
		sine[436] = 0xcf5;
		sine[437] = 0xcf8;
		sine[438] = 0xcfa;
		sine[439] = 0xcfc;
		sine[440] = 0xcff;
		sine[441] = 0xd01;
		sine[442] = 0xd04;
		sine[443] = 0xd06;
		sine[444] = 0xd09;
		sine[445] = 0xd0b;
		sine[446] = 0xd0e;
		sine[447] = 0xd10;
		sine[448] = 0xd12;
		sine[449] = 0xd15;
		sine[450] = 0xd17;
		sine[451] = 0xd1a;
		sine[452] = 0xd1c;
		sine[453] = 0xd1f;
		sine[454] = 0xd21;
		sine[455] = 0xd23;
		sine[456] = 0xd26;
		sine[457] = 0xd28;
		sine[458] = 0xd2b;
		sine[459] = 0xd2d;
		sine[460] = 0xd2f;
		sine[461] = 0xd32;
		sine[462] = 0xd34;
		sine[463] = 0xd36;
		sine[464] = 0xd39;
		sine[465] = 0xd3b;
		sine[466] = 0xd3e;
		sine[467] = 0xd40;
		sine[468] = 0xd42;
		sine[469] = 0xd45;
		sine[470] = 0xd47;
		sine[471] = 0xd49;
		sine[472] = 0xd4c;
		sine[473] = 0xd4e;
		sine[474] = 0xd50;
		sine[475] = 0xd53;
		sine[476] = 0xd55;
		sine[477] = 0xd58;
		sine[478] = 0xd5a;
		sine[479] = 0xd5c;
		sine[480] = 0xd5f;
		sine[481] = 0xd61;
		sine[482] = 0xd63;
		sine[483] = 0xd65;
		sine[484] = 0xd68;
		sine[485] = 0xd6a;
		sine[486] = 0xd6c;
		sine[487] = 0xd6f;
		sine[488] = 0xd71;
		sine[489] = 0xd73;
		sine[490] = 0xd76;
		sine[491] = 0xd78;
		sine[492] = 0xd7a;
		sine[493] = 0xd7c;
		sine[494] = 0xd7f;
		sine[495] = 0xd81;
		sine[496] = 0xd83;
		sine[497] = 0xd86;
		sine[498] = 0xd88;
		sine[499] = 0xd8a;
		sine[500] = 0xd8c;
		sine[501] = 0xd8f;
		sine[502] = 0xd91;
		sine[503] = 0xd93;
		sine[504] = 0xd95;
		sine[505] = 0xd98;
		sine[506] = 0xd9a;
		sine[507] = 0xd9c;
		sine[508] = 0xd9e;
		sine[509] = 0xda1;
		sine[510] = 0xda3;
		sine[511] = 0xda5;
		sine[512] = 0xda7;
		sine[513] = 0xdaa;
		sine[514] = 0xdac;
		sine[515] = 0xdae;
		sine[516] = 0xdb0;
		sine[517] = 0xdb2;
		sine[518] = 0xdb5;
		sine[519] = 0xdb7;
		sine[520] = 0xdb9;
		sine[521] = 0xdbb;
		sine[522] = 0xdbd;
		sine[523] = 0xdc0;
		sine[524] = 0xdc2;
		sine[525] = 0xdc4;
		sine[526] = 0xdc6;
		sine[527] = 0xdc8;
		sine[528] = 0xdca;
		sine[529] = 0xdcd;
		sine[530] = 0xdcf;
		sine[531] = 0xdd1;
		sine[532] = 0xdd3;
		sine[533] = 0xdd5;
		sine[534] = 0xdd7;
		sine[535] = 0xdd9;
		sine[536] = 0xddc;
		sine[537] = 0xdde;
		sine[538] = 0xde0;
		sine[539] = 0xde2;
		sine[540] = 0xde4;
		sine[541] = 0xde6;
		sine[542] = 0xde8;
		sine[543] = 0xdea;
		sine[544] = 0xded;
		sine[545] = 0xdef;
		sine[546] = 0xdf1;
		sine[547] = 0xdf3;
		sine[548] = 0xdf5;
		sine[549] = 0xdf7;
		sine[550] = 0xdf9;
		sine[551] = 0xdfb;
		sine[552] = 0xdfd;
		sine[553] = 0xdff;
		sine[554] = 0xe02;
		sine[555] = 0xe04;
		sine[556] = 0xe06;
		sine[557] = 0xe08;
		sine[558] = 0xe0a;
		sine[559] = 0xe0c;
		sine[560] = 0xe0e;
		sine[561] = 0xe10;
		sine[562] = 0xe12;
		sine[563] = 0xe14;
		sine[564] = 0xe16;
		sine[565] = 0xe18;
		sine[566] = 0xe1a;
		sine[567] = 0xe1c;
		sine[568] = 0xe1e;
		sine[569] = 0xe20;
		sine[570] = 0xe22;
		sine[571] = 0xe24;
		sine[572] = 0xe26;
		sine[573] = 0xe28;
		sine[574] = 0xe2a;
		sine[575] = 0xe2c;
		sine[576] = 0xe2e;
		sine[577] = 0xe30;
		sine[578] = 0xe32;
		sine[579] = 0xe34;
		sine[580] = 0xe36;
		sine[581] = 0xe38;
		sine[582] = 0xe3a;
		sine[583] = 0xe3c;
		sine[584] = 0xe3e;
		sine[585] = 0xe40;
		sine[586] = 0xe42;
		sine[587] = 0xe44;
		sine[588] = 0xe46;
		sine[589] = 0xe48;
		sine[590] = 0xe4a;
		sine[591] = 0xe4c;
		sine[592] = 0xe4e;
		sine[593] = 0xe50;
		sine[594] = 0xe51;
		sine[595] = 0xe53;
		sine[596] = 0xe55;
		sine[597] = 0xe57;
		sine[598] = 0xe59;
		sine[599] = 0xe5b;
		sine[600] = 0xe5d;
		sine[601] = 0xe5f;
		sine[602] = 0xe61;
		sine[603] = 0xe63;
		sine[604] = 0xe65;
		sine[605] = 0xe66;
		sine[606] = 0xe68;
		sine[607] = 0xe6a;
		sine[608] = 0xe6c;
		sine[609] = 0xe6e;
		sine[610] = 0xe70;
		sine[611] = 0xe72;
		sine[612] = 0xe74;
		sine[613] = 0xe75;
		sine[614] = 0xe77;
		sine[615] = 0xe79;
		sine[616] = 0xe7b;
		sine[617] = 0xe7d;
		sine[618] = 0xe7f;
		sine[619] = 0xe80;
		sine[620] = 0xe82;
		sine[621] = 0xe84;
		sine[622] = 0xe86;
		sine[623] = 0xe88;
		sine[624] = 0xe8a;
		sine[625] = 0xe8b;
		sine[626] = 0xe8d;
		sine[627] = 0xe8f;
		sine[628] = 0xe91;
		sine[629] = 0xe92;
		sine[630] = 0xe94;
		sine[631] = 0xe96;
		sine[632] = 0xe98;
		sine[633] = 0xe9a;
		sine[634] = 0xe9b;
		sine[635] = 0xe9d;
		sine[636] = 0xe9f;
		sine[637] = 0xea1;
		sine[638] = 0xea2;
		sine[639] = 0xea4;
		sine[640] = 0xea6;
		sine[641] = 0xea8;
		sine[642] = 0xea9;
		sine[643] = 0xeab;
		sine[644] = 0xead;
		sine[645] = 0xeaf;
		sine[646] = 0xeb0;
		sine[647] = 0xeb2;
		sine[648] = 0xeb4;
		sine[649] = 0xeb5;
		sine[650] = 0xeb7;
		sine[651] = 0xeb9;
		sine[652] = 0xebb;
		sine[653] = 0xebc;
		sine[654] = 0xebe;
		sine[655] = 0xec0;
		sine[656] = 0xec1;
		sine[657] = 0xec3;
		sine[658] = 0xec5;
		sine[659] = 0xec6;
		sine[660] = 0xec8;
		sine[661] = 0xeca;
		sine[662] = 0xecb;
		sine[663] = 0xecd;
		sine[664] = 0xecf;
		sine[665] = 0xed0;
		sine[666] = 0xed2;
		sine[667] = 0xed4;
		sine[668] = 0xed5;
		sine[669] = 0xed7;
		sine[670] = 0xed8;
		sine[671] = 0xeda;
		sine[672] = 0xedc;
		sine[673] = 0xedd;
		sine[674] = 0xedf;
		sine[675] = 0xee1;
		sine[676] = 0xee2;
		sine[677] = 0xee4;
		sine[678] = 0xee5;
		sine[679] = 0xee7;
		sine[680] = 0xee8;
		sine[681] = 0xeea;
		sine[682] = 0xeec;
		sine[683] = 0xeed;
		sine[684] = 0xeef;
		sine[685] = 0xef0;
		sine[686] = 0xef2;
		sine[687] = 0xef3;
		sine[688] = 0xef5;
		sine[689] = 0xef7;
		sine[690] = 0xef8;
		sine[691] = 0xefa;
		sine[692] = 0xefb;
		sine[693] = 0xefd;
		sine[694] = 0xefe;
		sine[695] = 0xf00;
		sine[696] = 0xf01;
		sine[697] = 0xf03;
		sine[698] = 0xf04;
		sine[699] = 0xf06;
		sine[700] = 0xf07;
		sine[701] = 0xf09;
		sine[702] = 0xf0a;
		sine[703] = 0xf0c;
		sine[704] = 0xf0d;
		sine[705] = 0xf0f;
		sine[706] = 0xf10;
		sine[707] = 0xf12;
		sine[708] = 0xf13;
		sine[709] = 0xf15;
		sine[710] = 0xf16;
		sine[711] = 0xf17;
		sine[712] = 0xf19;
		sine[713] = 0xf1a;
		sine[714] = 0xf1c;
		sine[715] = 0xf1d;
		sine[716] = 0xf1f;
		sine[717] = 0xf20;
		sine[718] = 0xf22;
		sine[719] = 0xf23;
		sine[720] = 0xf24;
		sine[721] = 0xf26;
		sine[722] = 0xf27;
		sine[723] = 0xf29;
		sine[724] = 0xf2a;
		sine[725] = 0xf2b;
		sine[726] = 0xf2d;
		sine[727] = 0xf2e;
		sine[728] = 0xf30;
		sine[729] = 0xf31;
		sine[730] = 0xf32;
		sine[731] = 0xf34;
		sine[732] = 0xf35;
		sine[733] = 0xf36;
		sine[734] = 0xf38;
		sine[735] = 0xf39;
		sine[736] = 0xf3a;
		sine[737] = 0xf3c;
		sine[738] = 0xf3d;
		sine[739] = 0xf3e;
		sine[740] = 0xf40;
		sine[741] = 0xf41;
		sine[742] = 0xf42;
		sine[743] = 0xf44;
		sine[744] = 0xf45;
		sine[745] = 0xf46;
		sine[746] = 0xf48;
		sine[747] = 0xf49;
		sine[748] = 0xf4a;
		sine[749] = 0xf4c;
		sine[750] = 0xf4d;
		sine[751] = 0xf4e;
		sine[752] = 0xf4f;
		sine[753] = 0xf51;
		sine[754] = 0xf52;
		sine[755] = 0xf53;
		sine[756] = 0xf54;
		sine[757] = 0xf56;
		sine[758] = 0xf57;
		sine[759] = 0xf58;
		sine[760] = 0xf59;
		sine[761] = 0xf5b;
		sine[762] = 0xf5c;
		sine[763] = 0xf5d;
		sine[764] = 0xf5e;
		sine[765] = 0xf60;
		sine[766] = 0xf61;
		sine[767] = 0xf62;
		sine[768] = 0xf63;
		sine[769] = 0xf64;
		sine[770] = 0xf66;
		sine[771] = 0xf67;
		sine[772] = 0xf68;
		sine[773] = 0xf69;
		sine[774] = 0xf6a;
		sine[775] = 0xf6b;
		sine[776] = 0xf6d;
		sine[777] = 0xf6e;
		sine[778] = 0xf6f;
		sine[779] = 0xf70;
		sine[780] = 0xf71;
		sine[781] = 0xf72;
		sine[782] = 0xf74;
		sine[783] = 0xf75;
		sine[784] = 0xf76;
		sine[785] = 0xf77;
		sine[786] = 0xf78;
		sine[787] = 0xf79;
		sine[788] = 0xf7a;
		sine[789] = 0xf7b;
		sine[790] = 0xf7d;
		sine[791] = 0xf7e;
		sine[792] = 0xf7f;
		sine[793] = 0xf80;
		sine[794] = 0xf81;
		sine[795] = 0xf82;
		sine[796] = 0xf83;
		sine[797] = 0xf84;
		sine[798] = 0xf85;
		sine[799] = 0xf86;
		sine[800] = 0xf87;
		sine[801] = 0xf88;
		sine[802] = 0xf89;
		sine[803] = 0xf8a;
		sine[804] = 0xf8c;
		sine[805] = 0xf8d;
		sine[806] = 0xf8e;
		sine[807] = 0xf8f;
		sine[808] = 0xf90;
		sine[809] = 0xf91;
		sine[810] = 0xf92;
		sine[811] = 0xf93;
		sine[812] = 0xf94;
		sine[813] = 0xf95;
		sine[814] = 0xf96;
		sine[815] = 0xf97;
		sine[816] = 0xf98;
		sine[817] = 0xf99;
		sine[818] = 0xf9a;
		sine[819] = 0xf9b;
		sine[820] = 0xf9c;
		sine[821] = 0xf9d;
		sine[822] = 0xf9d;
		sine[823] = 0xf9e;
		sine[824] = 0xf9f;
		sine[825] = 0xfa0;
		sine[826] = 0xfa1;
		sine[827] = 0xfa2;
		sine[828] = 0xfa3;
		sine[829] = 0xfa4;
		sine[830] = 0xfa5;
		sine[831] = 0xfa6;
		sine[832] = 0xfa7;
		sine[833] = 0xfa8;
		sine[834] = 0xfa9;
		sine[835] = 0xfaa;
		sine[836] = 0xfaa;
		sine[837] = 0xfab;
		sine[838] = 0xfac;
		sine[839] = 0xfad;
		sine[840] = 0xfae;
		sine[841] = 0xfaf;
		sine[842] = 0xfb0;
		sine[843] = 0xfb1;
		sine[844] = 0xfb1;
		sine[845] = 0xfb2;
		sine[846] = 0xfb3;
		sine[847] = 0xfb4;
		sine[848] = 0xfb5;
		sine[849] = 0xfb6;
		sine[850] = 0xfb6;
		sine[851] = 0xfb7;
		sine[852] = 0xfb8;
		sine[853] = 0xfb9;
		sine[854] = 0xfba;
		sine[855] = 0xfbb;
		sine[856] = 0xfbb;
		sine[857] = 0xfbc;
		sine[858] = 0xfbd;
		sine[859] = 0xfbe;
		sine[860] = 0xfbf;
		sine[861] = 0xfbf;
		sine[862] = 0xfc0;
		sine[863] = 0xfc1;
		sine[864] = 0xfc2;
		sine[865] = 0xfc2;
		sine[866] = 0xfc3;
		sine[867] = 0xfc4;
		sine[868] = 0xfc5;
		sine[869] = 0xfc5;
		sine[870] = 0xfc6;
		sine[871] = 0xfc7;
		sine[872] = 0xfc8;
		sine[873] = 0xfc8;
		sine[874] = 0xfc9;
		sine[875] = 0xfca;
		sine[876] = 0xfca;
		sine[877] = 0xfcb;
		sine[878] = 0xfcc;
		sine[879] = 0xfcd;
		sine[880] = 0xfcd;
		sine[881] = 0xfce;
		sine[882] = 0xfcf;
		sine[883] = 0xfcf;
		sine[884] = 0xfd0;
		sine[885] = 0xfd1;
		sine[886] = 0xfd1;
		sine[887] = 0xfd2;
		sine[888] = 0xfd3;
		sine[889] = 0xfd3;
		sine[890] = 0xfd4;
		sine[891] = 0xfd5;
		sine[892] = 0xfd5;
		sine[893] = 0xfd6;
		sine[894] = 0xfd6;
		sine[895] = 0xfd7;
		sine[896] = 0xfd8;
		sine[897] = 0xfd8;
		sine[898] = 0xfd9;
		sine[899] = 0xfd9;
		sine[900] = 0xfda;
		sine[901] = 0xfdb;
		sine[902] = 0xfdb;
		sine[903] = 0xfdc;
		sine[904] = 0xfdc;
		sine[905] = 0xfdd;
		sine[906] = 0xfde;
		sine[907] = 0xfde;
		sine[908] = 0xfdf;
		sine[909] = 0xfdf;
		sine[910] = 0xfe0;
		sine[911] = 0xfe0;
		sine[912] = 0xfe1;
		sine[913] = 0xfe1;
		sine[914] = 0xfe2;
		sine[915] = 0xfe2;
		sine[916] = 0xfe3;
		sine[917] = 0xfe3;
		sine[918] = 0xfe4;
		sine[919] = 0xfe4;
		sine[920] = 0xfe5;
		sine[921] = 0xfe5;
		sine[922] = 0xfe6;
		sine[923] = 0xfe6;
		sine[924] = 0xfe7;
		sine[925] = 0xfe7;
		sine[926] = 0xfe8;
		sine[927] = 0xfe8;
		sine[928] = 0xfe9;
		sine[929] = 0xfe9;
		sine[930] = 0xfea;
		sine[931] = 0xfea;
		sine[932] = 0xfeb;
		sine[933] = 0xfeb;
		sine[934] = 0xfec;
		sine[935] = 0xfec;
		sine[936] = 0xfec;
		sine[937] = 0xfed;
		sine[938] = 0xfed;
		sine[939] = 0xfee;
		sine[940] = 0xfee;
		sine[941] = 0xfee;
		sine[942] = 0xfef;
		sine[943] = 0xfef;
		sine[944] = 0xff0;
		sine[945] = 0xff0;
		sine[946] = 0xff0;
		sine[947] = 0xff1;
		sine[948] = 0xff1;
		sine[949] = 0xff1;
		sine[950] = 0xff2;
		sine[951] = 0xff2;
		sine[952] = 0xff3;
		sine[953] = 0xff3;
		sine[954] = 0xff3;
		sine[955] = 0xff4;
		sine[956] = 0xff4;
		sine[957] = 0xff4;
		sine[958] = 0xff5;
		sine[959] = 0xff5;
		sine[960] = 0xff5;
		sine[961] = 0xff5;
		sine[962] = 0xff6;
		sine[963] = 0xff6;
		sine[964] = 0xff6;
		sine[965] = 0xff7;
		sine[966] = 0xff7;
		sine[967] = 0xff7;
		sine[968] = 0xff7;
		sine[969] = 0xff8;
		sine[970] = 0xff8;
		sine[971] = 0xff8;
		sine[972] = 0xff8;
		sine[973] = 0xff9;
		sine[974] = 0xff9;
		sine[975] = 0xff9;
		sine[976] = 0xff9;
		sine[977] = 0xffa;
		sine[978] = 0xffa;
		sine[979] = 0xffa;
		sine[980] = 0xffa;
		sine[981] = 0xffb;
		sine[982] = 0xffb;
		sine[983] = 0xffb;
		sine[984] = 0xffb;
		sine[985] = 0xffb;
		sine[986] = 0xffc;
		sine[987] = 0xffc;
		sine[988] = 0xffc;
		sine[989] = 0xffc;
		sine[990] = 0xffc;
		sine[991] = 0xffc;
		sine[992] = 0xffd;
		sine[993] = 0xffd;
		sine[994] = 0xffd;
		sine[995] = 0xffd;
		sine[996] = 0xffd;
		sine[997] = 0xffd;
		sine[998] = 0xffd;
		sine[999] = 0xffd;
		sine[1000] = 0xffe;
		sine[1001] = 0xffe;
		sine[1002] = 0xffe;
		sine[1003] = 0xffe;
		sine[1004] = 0xffe;
		sine[1005] = 0xffe;
		sine[1006] = 0xffe;
		sine[1007] = 0xffe;
		sine[1008] = 0xffe;
		sine[1009] = 0xffe;
		sine[1010] = 0xfff;
		sine[1011] = 0xfff;
		sine[1012] = 0xfff;
		sine[1013] = 0xfff;
		sine[1014] = 0xfff;
		sine[1015] = 0xfff;
		sine[1016] = 0xfff;
		sine[1017] = 0xfff;
		sine[1018] = 0xfff;
		sine[1019] = 0xfff;
		sine[1020] = 0xfff;
		sine[1021] = 0xfff;
		sine[1022] = 0xfff;
		sine[1023] = 0xfff;
		sine[1024] = 0xfff;
		sine[1025] = 0xfff;
		sine[1026] = 0xfff;
		sine[1027] = 0xfff;
		sine[1028] = 0xfff;
		sine[1029] = 0xfff;
		sine[1030] = 0xfff;
		sine[1031] = 0xfff;
		sine[1032] = 0xfff;
		sine[1033] = 0xfff;
		sine[1034] = 0xfff;
		sine[1035] = 0xfff;
		sine[1036] = 0xfff;
		sine[1037] = 0xfff;
		sine[1038] = 0xfff;
		sine[1039] = 0xffe;
		sine[1040] = 0xffe;
		sine[1041] = 0xffe;
		sine[1042] = 0xffe;
		sine[1043] = 0xffe;
		sine[1044] = 0xffe;
		sine[1045] = 0xffe;
		sine[1046] = 0xffe;
		sine[1047] = 0xffe;
		sine[1048] = 0xffe;
		sine[1049] = 0xffd;
		sine[1050] = 0xffd;
		sine[1051] = 0xffd;
		sine[1052] = 0xffd;
		sine[1053] = 0xffd;
		sine[1054] = 0xffd;
		sine[1055] = 0xffd;
		sine[1056] = 0xffd;
		sine[1057] = 0xffc;
		sine[1058] = 0xffc;
		sine[1059] = 0xffc;
		sine[1060] = 0xffc;
		sine[1061] = 0xffc;
		sine[1062] = 0xffc;
		sine[1063] = 0xffb;
		sine[1064] = 0xffb;
		sine[1065] = 0xffb;
		sine[1066] = 0xffb;
		sine[1067] = 0xffb;
		sine[1068] = 0xffa;
		sine[1069] = 0xffa;
		sine[1070] = 0xffa;
		sine[1071] = 0xffa;
		sine[1072] = 0xff9;
		sine[1073] = 0xff9;
		sine[1074] = 0xff9;
		sine[1075] = 0xff9;
		sine[1076] = 0xff8;
		sine[1077] = 0xff8;
		sine[1078] = 0xff8;
		sine[1079] = 0xff8;
		sine[1080] = 0xff7;
		sine[1081] = 0xff7;
		sine[1082] = 0xff7;
		sine[1083] = 0xff7;
		sine[1084] = 0xff6;
		sine[1085] = 0xff6;
		sine[1086] = 0xff6;
		sine[1087] = 0xff5;
		sine[1088] = 0xff5;
		sine[1089] = 0xff5;
		sine[1090] = 0xff5;
		sine[1091] = 0xff4;
		sine[1092] = 0xff4;
		sine[1093] = 0xff4;
		sine[1094] = 0xff3;
		sine[1095] = 0xff3;
		sine[1096] = 0xff3;
		sine[1097] = 0xff2;
		sine[1098] = 0xff2;
		sine[1099] = 0xff1;
		sine[1100] = 0xff1;
		sine[1101] = 0xff1;
		sine[1102] = 0xff0;
		sine[1103] = 0xff0;
		sine[1104] = 0xff0;
		sine[1105] = 0xfef;
		sine[1106] = 0xfef;
		sine[1107] = 0xfee;
		sine[1108] = 0xfee;
		sine[1109] = 0xfee;
		sine[1110] = 0xfed;
		sine[1111] = 0xfed;
		sine[1112] = 0xfec;
		sine[1113] = 0xfec;
		sine[1114] = 0xfec;
		sine[1115] = 0xfeb;
		sine[1116] = 0xfeb;
		sine[1117] = 0xfea;
		sine[1118] = 0xfea;
		sine[1119] = 0xfe9;
		sine[1120] = 0xfe9;
		sine[1121] = 0xfe8;
		sine[1122] = 0xfe8;
		sine[1123] = 0xfe7;
		sine[1124] = 0xfe7;
		sine[1125] = 0xfe6;
		sine[1126] = 0xfe6;
		sine[1127] = 0xfe5;
		sine[1128] = 0xfe5;
		sine[1129] = 0xfe4;
		sine[1130] = 0xfe4;
		sine[1131] = 0xfe3;
		sine[1132] = 0xfe3;
		sine[1133] = 0xfe2;
		sine[1134] = 0xfe2;
		sine[1135] = 0xfe1;
		sine[1136] = 0xfe1;
		sine[1137] = 0xfe0;
		sine[1138] = 0xfe0;
		sine[1139] = 0xfdf;
		sine[1140] = 0xfdf;
		sine[1141] = 0xfde;
		sine[1142] = 0xfde;
		sine[1143] = 0xfdd;
		sine[1144] = 0xfdc;
		sine[1145] = 0xfdc;
		sine[1146] = 0xfdb;
		sine[1147] = 0xfdb;
		sine[1148] = 0xfda;
		sine[1149] = 0xfd9;
		sine[1150] = 0xfd9;
		sine[1151] = 0xfd8;
		sine[1152] = 0xfd8;
		sine[1153] = 0xfd7;
		sine[1154] = 0xfd6;
		sine[1155] = 0xfd6;
		sine[1156] = 0xfd5;
		sine[1157] = 0xfd5;
		sine[1158] = 0xfd4;
		sine[1159] = 0xfd3;
		sine[1160] = 0xfd3;
		sine[1161] = 0xfd2;
		sine[1162] = 0xfd1;
		sine[1163] = 0xfd1;
		sine[1164] = 0xfd0;
		sine[1165] = 0xfcf;
		sine[1166] = 0xfcf;
		sine[1167] = 0xfce;
		sine[1168] = 0xfcd;
		sine[1169] = 0xfcd;
		sine[1170] = 0xfcc;
		sine[1171] = 0xfcb;
		sine[1172] = 0xfca;
		sine[1173] = 0xfca;
		sine[1174] = 0xfc9;
		sine[1175] = 0xfc8;
		sine[1176] = 0xfc8;
		sine[1177] = 0xfc7;
		sine[1178] = 0xfc6;
		sine[1179] = 0xfc5;
		sine[1180] = 0xfc5;
		sine[1181] = 0xfc4;
		sine[1182] = 0xfc3;
		sine[1183] = 0xfc2;
		sine[1184] = 0xfc2;
		sine[1185] = 0xfc1;
		sine[1186] = 0xfc0;
		sine[1187] = 0xfbf;
		sine[1188] = 0xfbf;
		sine[1189] = 0xfbe;
		sine[1190] = 0xfbd;
		sine[1191] = 0xfbc;
		sine[1192] = 0xfbb;
		sine[1193] = 0xfbb;
		sine[1194] = 0xfba;
		sine[1195] = 0xfb9;
		sine[1196] = 0xfb8;
		sine[1197] = 0xfb7;
		sine[1198] = 0xfb6;
		sine[1199] = 0xfb6;
		sine[1200] = 0xfb5;
		sine[1201] = 0xfb4;
		sine[1202] = 0xfb3;
		sine[1203] = 0xfb2;
		sine[1204] = 0xfb1;
		sine[1205] = 0xfb1;
		sine[1206] = 0xfb0;
		sine[1207] = 0xfaf;
		sine[1208] = 0xfae;
		sine[1209] = 0xfad;
		sine[1210] = 0xfac;
		sine[1211] = 0xfab;
		sine[1212] = 0xfaa;
		sine[1213] = 0xfaa;
		sine[1214] = 0xfa9;
		sine[1215] = 0xfa8;
		sine[1216] = 0xfa7;
		sine[1217] = 0xfa6;
		sine[1218] = 0xfa5;
		sine[1219] = 0xfa4;
		sine[1220] = 0xfa3;
		sine[1221] = 0xfa2;
		sine[1222] = 0xfa1;
		sine[1223] = 0xfa0;
		sine[1224] = 0xf9f;
		sine[1225] = 0xf9e;
		sine[1226] = 0xf9d;
		sine[1227] = 0xf9d;
		sine[1228] = 0xf9c;
		sine[1229] = 0xf9b;
		sine[1230] = 0xf9a;
		sine[1231] = 0xf99;
		sine[1232] = 0xf98;
		sine[1233] = 0xf97;
		sine[1234] = 0xf96;
		sine[1235] = 0xf95;
		sine[1236] = 0xf94;
		sine[1237] = 0xf93;
		sine[1238] = 0xf92;
		sine[1239] = 0xf91;
		sine[1240] = 0xf90;
		sine[1241] = 0xf8f;
		sine[1242] = 0xf8e;
		sine[1243] = 0xf8d;
		sine[1244] = 0xf8c;
		sine[1245] = 0xf8a;
		sine[1246] = 0xf89;
		sine[1247] = 0xf88;
		sine[1248] = 0xf87;
		sine[1249] = 0xf86;
		sine[1250] = 0xf85;
		sine[1251] = 0xf84;
		sine[1252] = 0xf83;
		sine[1253] = 0xf82;
		sine[1254] = 0xf81;
		sine[1255] = 0xf80;
		sine[1256] = 0xf7f;
		sine[1257] = 0xf7e;
		sine[1258] = 0xf7d;
		sine[1259] = 0xf7b;
		sine[1260] = 0xf7a;
		sine[1261] = 0xf79;
		sine[1262] = 0xf78;
		sine[1263] = 0xf77;
		sine[1264] = 0xf76;
		sine[1265] = 0xf75;
		sine[1266] = 0xf74;
		sine[1267] = 0xf72;
		sine[1268] = 0xf71;
		sine[1269] = 0xf70;
		sine[1270] = 0xf6f;
		sine[1271] = 0xf6e;
		sine[1272] = 0xf6d;
		sine[1273] = 0xf6b;
		sine[1274] = 0xf6a;
		sine[1275] = 0xf69;
		sine[1276] = 0xf68;
		sine[1277] = 0xf67;
		sine[1278] = 0xf66;
		sine[1279] = 0xf64;
		sine[1280] = 0xf63;
		sine[1281] = 0xf62;
		sine[1282] = 0xf61;
		sine[1283] = 0xf60;
		sine[1284] = 0xf5e;
		sine[1285] = 0xf5d;
		sine[1286] = 0xf5c;
		sine[1287] = 0xf5b;
		sine[1288] = 0xf59;
		sine[1289] = 0xf58;
		sine[1290] = 0xf57;
		sine[1291] = 0xf56;
		sine[1292] = 0xf54;
		sine[1293] = 0xf53;
		sine[1294] = 0xf52;
		sine[1295] = 0xf51;
		sine[1296] = 0xf4f;
		sine[1297] = 0xf4e;
		sine[1298] = 0xf4d;
		sine[1299] = 0xf4c;
		sine[1300] = 0xf4a;
		sine[1301] = 0xf49;
		sine[1302] = 0xf48;
		sine[1303] = 0xf46;
		sine[1304] = 0xf45;
		sine[1305] = 0xf44;
		sine[1306] = 0xf42;
		sine[1307] = 0xf41;
		sine[1308] = 0xf40;
		sine[1309] = 0xf3e;
		sine[1310] = 0xf3d;
		sine[1311] = 0xf3c;
		sine[1312] = 0xf3a;
		sine[1313] = 0xf39;
		sine[1314] = 0xf38;
		sine[1315] = 0xf36;
		sine[1316] = 0xf35;
		sine[1317] = 0xf34;
		sine[1318] = 0xf32;
		sine[1319] = 0xf31;
		sine[1320] = 0xf30;
		sine[1321] = 0xf2e;
		sine[1322] = 0xf2d;
		sine[1323] = 0xf2b;
		sine[1324] = 0xf2a;
		sine[1325] = 0xf29;
		sine[1326] = 0xf27;
		sine[1327] = 0xf26;
		sine[1328] = 0xf24;
		sine[1329] = 0xf23;
		sine[1330] = 0xf22;
		sine[1331] = 0xf20;
		sine[1332] = 0xf1f;
		sine[1333] = 0xf1d;
		sine[1334] = 0xf1c;
		sine[1335] = 0xf1a;
		sine[1336] = 0xf19;
		sine[1337] = 0xf17;
		sine[1338] = 0xf16;
		sine[1339] = 0xf15;
		sine[1340] = 0xf13;
		sine[1341] = 0xf12;
		sine[1342] = 0xf10;
		sine[1343] = 0xf0f;
		sine[1344] = 0xf0d;
		sine[1345] = 0xf0c;
		sine[1346] = 0xf0a;
		sine[1347] = 0xf09;
		sine[1348] = 0xf07;
		sine[1349] = 0xf06;
		sine[1350] = 0xf04;
		sine[1351] = 0xf03;
		sine[1352] = 0xf01;
		sine[1353] = 0xf00;
		sine[1354] = 0xefe;
		sine[1355] = 0xefd;
		sine[1356] = 0xefb;
		sine[1357] = 0xefa;
		sine[1358] = 0xef8;
		sine[1359] = 0xef7;
		sine[1360] = 0xef5;
		sine[1361] = 0xef3;
		sine[1362] = 0xef2;
		sine[1363] = 0xef0;
		sine[1364] = 0xeef;
		sine[1365] = 0xeed;
		sine[1366] = 0xeec;
		sine[1367] = 0xeea;
		sine[1368] = 0xee8;
		sine[1369] = 0xee7;
		sine[1370] = 0xee5;
		sine[1371] = 0xee4;
		sine[1372] = 0xee2;
		sine[1373] = 0xee1;
		sine[1374] = 0xedf;
		sine[1375] = 0xedd;
		sine[1376] = 0xedc;
		sine[1377] = 0xeda;
		sine[1378] = 0xed8;
		sine[1379] = 0xed7;
		sine[1380] = 0xed5;
		sine[1381] = 0xed4;
		sine[1382] = 0xed2;
		sine[1383] = 0xed0;
		sine[1384] = 0xecf;
		sine[1385] = 0xecd;
		sine[1386] = 0xecb;
		sine[1387] = 0xeca;
		sine[1388] = 0xec8;
		sine[1389] = 0xec6;
		sine[1390] = 0xec5;
		sine[1391] = 0xec3;
		sine[1392] = 0xec1;
		sine[1393] = 0xec0;
		sine[1394] = 0xebe;
		sine[1395] = 0xebc;
		sine[1396] = 0xebb;
		sine[1397] = 0xeb9;
		sine[1398] = 0xeb7;
		sine[1399] = 0xeb5;
		sine[1400] = 0xeb4;
		sine[1401] = 0xeb2;
		sine[1402] = 0xeb0;
		sine[1403] = 0xeaf;
		sine[1404] = 0xead;
		sine[1405] = 0xeab;
		sine[1406] = 0xea9;
		sine[1407] = 0xea8;
		sine[1408] = 0xea6;
		sine[1409] = 0xea4;
		sine[1410] = 0xea2;
		sine[1411] = 0xea1;
		sine[1412] = 0xe9f;
		sine[1413] = 0xe9d;
		sine[1414] = 0xe9b;
		sine[1415] = 0xe9a;
		sine[1416] = 0xe98;
		sine[1417] = 0xe96;
		sine[1418] = 0xe94;
		sine[1419] = 0xe92;
		sine[1420] = 0xe91;
		sine[1421] = 0xe8f;
		sine[1422] = 0xe8d;
		sine[1423] = 0xe8b;
		sine[1424] = 0xe8a;
		sine[1425] = 0xe88;
		sine[1426] = 0xe86;
		sine[1427] = 0xe84;
		sine[1428] = 0xe82;
		sine[1429] = 0xe80;
		sine[1430] = 0xe7f;
		sine[1431] = 0xe7d;
		sine[1432] = 0xe7b;
		sine[1433] = 0xe79;
		sine[1434] = 0xe77;
		sine[1435] = 0xe75;
		sine[1436] = 0xe74;
		sine[1437] = 0xe72;
		sine[1438] = 0xe70;
		sine[1439] = 0xe6e;
		sine[1440] = 0xe6c;
		sine[1441] = 0xe6a;
		sine[1442] = 0xe68;
		sine[1443] = 0xe66;
		sine[1444] = 0xe65;
		sine[1445] = 0xe63;
		sine[1446] = 0xe61;
		sine[1447] = 0xe5f;
		sine[1448] = 0xe5d;
		sine[1449] = 0xe5b;
		sine[1450] = 0xe59;
		sine[1451] = 0xe57;
		sine[1452] = 0xe55;
		sine[1453] = 0xe53;
		sine[1454] = 0xe51;
		sine[1455] = 0xe50;
		sine[1456] = 0xe4e;
		sine[1457] = 0xe4c;
		sine[1458] = 0xe4a;
		sine[1459] = 0xe48;
		sine[1460] = 0xe46;
		sine[1461] = 0xe44;
		sine[1462] = 0xe42;
		sine[1463] = 0xe40;
		sine[1464] = 0xe3e;
		sine[1465] = 0xe3c;
		sine[1466] = 0xe3a;
		sine[1467] = 0xe38;
		sine[1468] = 0xe36;
		sine[1469] = 0xe34;
		sine[1470] = 0xe32;
		sine[1471] = 0xe30;
		sine[1472] = 0xe2e;
		sine[1473] = 0xe2c;
		sine[1474] = 0xe2a;
		sine[1475] = 0xe28;
		sine[1476] = 0xe26;
		sine[1477] = 0xe24;
		sine[1478] = 0xe22;
		sine[1479] = 0xe20;
		sine[1480] = 0xe1e;
		sine[1481] = 0xe1c;
		sine[1482] = 0xe1a;
		sine[1483] = 0xe18;
		sine[1484] = 0xe16;
		sine[1485] = 0xe14;
		sine[1486] = 0xe12;
		sine[1487] = 0xe10;
		sine[1488] = 0xe0e;
		sine[1489] = 0xe0c;
		sine[1490] = 0xe0a;
		sine[1491] = 0xe08;
		sine[1492] = 0xe06;
		sine[1493] = 0xe04;
		sine[1494] = 0xe02;
		sine[1495] = 0xdff;
		sine[1496] = 0xdfd;
		sine[1497] = 0xdfb;
		sine[1498] = 0xdf9;
		sine[1499] = 0xdf7;
		sine[1500] = 0xdf5;
		sine[1501] = 0xdf3;
		sine[1502] = 0xdf1;
		sine[1503] = 0xdef;
		sine[1504] = 0xded;
		sine[1505] = 0xdea;
		sine[1506] = 0xde8;
		sine[1507] = 0xde6;
		sine[1508] = 0xde4;
		sine[1509] = 0xde2;
		sine[1510] = 0xde0;
		sine[1511] = 0xdde;
		sine[1512] = 0xddc;
		sine[1513] = 0xdd9;
		sine[1514] = 0xdd7;
		sine[1515] = 0xdd5;
		sine[1516] = 0xdd3;
		sine[1517] = 0xdd1;
		sine[1518] = 0xdcf;
		sine[1519] = 0xdcd;
		sine[1520] = 0xdca;
		sine[1521] = 0xdc8;
		sine[1522] = 0xdc6;
		sine[1523] = 0xdc4;
		sine[1524] = 0xdc2;
		sine[1525] = 0xdc0;
		sine[1526] = 0xdbd;
		sine[1527] = 0xdbb;
		sine[1528] = 0xdb9;
		sine[1529] = 0xdb7;
		sine[1530] = 0xdb5;
		sine[1531] = 0xdb2;
		sine[1532] = 0xdb0;
		sine[1533] = 0xdae;
		sine[1534] = 0xdac;
		sine[1535] = 0xdaa;
		sine[1536] = 0xda7;
		sine[1537] = 0xda5;
		sine[1538] = 0xda3;
		sine[1539] = 0xda1;
		sine[1540] = 0xd9e;
		sine[1541] = 0xd9c;
		sine[1542] = 0xd9a;
		sine[1543] = 0xd98;
		sine[1544] = 0xd95;
		sine[1545] = 0xd93;
		sine[1546] = 0xd91;
		sine[1547] = 0xd8f;
		sine[1548] = 0xd8c;
		sine[1549] = 0xd8a;
		sine[1550] = 0xd88;
		sine[1551] = 0xd86;
		sine[1552] = 0xd83;
		sine[1553] = 0xd81;
		sine[1554] = 0xd7f;
		sine[1555] = 0xd7c;
		sine[1556] = 0xd7a;
		sine[1557] = 0xd78;
		sine[1558] = 0xd76;
		sine[1559] = 0xd73;
		sine[1560] = 0xd71;
		sine[1561] = 0xd6f;
		sine[1562] = 0xd6c;
		sine[1563] = 0xd6a;
		sine[1564] = 0xd68;
		sine[1565] = 0xd65;
		sine[1566] = 0xd63;
		sine[1567] = 0xd61;
		sine[1568] = 0xd5f;
		sine[1569] = 0xd5c;
		sine[1570] = 0xd5a;
		sine[1571] = 0xd58;
		sine[1572] = 0xd55;
		sine[1573] = 0xd53;
		sine[1574] = 0xd50;
		sine[1575] = 0xd4e;
		sine[1576] = 0xd4c;
		sine[1577] = 0xd49;
		sine[1578] = 0xd47;
		sine[1579] = 0xd45;
		sine[1580] = 0xd42;
		sine[1581] = 0xd40;
		sine[1582] = 0xd3e;
		sine[1583] = 0xd3b;
		sine[1584] = 0xd39;
		sine[1585] = 0xd36;
		sine[1586] = 0xd34;
		sine[1587] = 0xd32;
		sine[1588] = 0xd2f;
		sine[1589] = 0xd2d;
		sine[1590] = 0xd2b;
		sine[1591] = 0xd28;
		sine[1592] = 0xd26;
		sine[1593] = 0xd23;
		sine[1594] = 0xd21;
		sine[1595] = 0xd1f;
		sine[1596] = 0xd1c;
		sine[1597] = 0xd1a;
		sine[1598] = 0xd17;
		sine[1599] = 0xd15;
		sine[1600] = 0xd12;
		sine[1601] = 0xd10;
		sine[1602] = 0xd0e;
		sine[1603] = 0xd0b;
		sine[1604] = 0xd09;
		sine[1605] = 0xd06;
		sine[1606] = 0xd04;
		sine[1607] = 0xd01;
		sine[1608] = 0xcff;
		sine[1609] = 0xcfc;
		sine[1610] = 0xcfa;
		sine[1611] = 0xcf8;
		sine[1612] = 0xcf5;
		sine[1613] = 0xcf3;
		sine[1614] = 0xcf0;
		sine[1615] = 0xcee;
		sine[1616] = 0xceb;
		sine[1617] = 0xce9;
		sine[1618] = 0xce6;
		sine[1619] = 0xce4;
		sine[1620] = 0xce1;
		sine[1621] = 0xcdf;
		sine[1622] = 0xcdc;
		sine[1623] = 0xcda;
		sine[1624] = 0xcd7;
		sine[1625] = 0xcd5;
		sine[1626] = 0xcd2;
		sine[1627] = 0xcd0;
		sine[1628] = 0xccd;
		sine[1629] = 0xccb;
		sine[1630] = 0xcc8;
		sine[1631] = 0xcc6;
		sine[1632] = 0xcc3;
		sine[1633] = 0xcc1;
		sine[1634] = 0xcbe;
		sine[1635] = 0xcbc;
		sine[1636] = 0xcb9;
		sine[1637] = 0xcb7;
		sine[1638] = 0xcb4;
		sine[1639] = 0xcb1;
		sine[1640] = 0xcaf;
		sine[1641] = 0xcac;
		sine[1642] = 0xcaa;
		sine[1643] = 0xca7;
		sine[1644] = 0xca5;
		sine[1645] = 0xca2;
		sine[1646] = 0xca0;
		sine[1647] = 0xc9d;
		sine[1648] = 0xc9a;
		sine[1649] = 0xc98;
		sine[1650] = 0xc95;
		sine[1651] = 0xc93;
		sine[1652] = 0xc90;
		sine[1653] = 0xc8e;
		sine[1654] = 0xc8b;
		sine[1655] = 0xc88;
		sine[1656] = 0xc86;
		sine[1657] = 0xc83;
		sine[1658] = 0xc81;
		sine[1659] = 0xc7e;
		sine[1660] = 0xc7b;
		sine[1661] = 0xc79;
		sine[1662] = 0xc76;
		sine[1663] = 0xc74;
		sine[1664] = 0xc71;
		sine[1665] = 0xc6e;
		sine[1666] = 0xc6c;
		sine[1667] = 0xc69;
		sine[1668] = 0xc67;
		sine[1669] = 0xc64;
		sine[1670] = 0xc61;
		sine[1671] = 0xc5f;
		sine[1672] = 0xc5c;
		sine[1673] = 0xc59;
		sine[1674] = 0xc57;
		sine[1675] = 0xc54;
		sine[1676] = 0xc52;
		sine[1677] = 0xc4f;
		sine[1678] = 0xc4c;
		sine[1679] = 0xc4a;
		sine[1680] = 0xc47;
		sine[1681] = 0xc44;
		sine[1682] = 0xc42;
		sine[1683] = 0xc3f;
		sine[1684] = 0xc3c;
		sine[1685] = 0xc3a;
		sine[1686] = 0xc37;
		sine[1687] = 0xc34;
		sine[1688] = 0xc32;
		sine[1689] = 0xc2f;
		sine[1690] = 0xc2c;
		sine[1691] = 0xc2a;
		sine[1692] = 0xc27;
		sine[1693] = 0xc24;
		sine[1694] = 0xc22;
		sine[1695] = 0xc1f;
		sine[1696] = 0xc1c;
		sine[1697] = 0xc19;
		sine[1698] = 0xc17;
		sine[1699] = 0xc14;
		sine[1700] = 0xc11;
		sine[1701] = 0xc0f;
		sine[1702] = 0xc0c;
		sine[1703] = 0xc09;
		sine[1704] = 0xc06;
		sine[1705] = 0xc04;
		sine[1706] = 0xc01;
		sine[1707] = 0xbfe;
		sine[1708] = 0xbfc;
		sine[1709] = 0xbf9;
		sine[1710] = 0xbf6;
		sine[1711] = 0xbf3;
		sine[1712] = 0xbf1;
		sine[1713] = 0xbee;
		sine[1714] = 0xbeb;
		sine[1715] = 0xbe9;
		sine[1716] = 0xbe6;
		sine[1717] = 0xbe3;
		sine[1718] = 0xbe0;
		sine[1719] = 0xbde;
		sine[1720] = 0xbdb;
		sine[1721] = 0xbd8;
		sine[1722] = 0xbd5;
		sine[1723] = 0xbd3;
		sine[1724] = 0xbd0;
		sine[1725] = 0xbcd;
		sine[1726] = 0xbca;
		sine[1727] = 0xbc7;
		sine[1728] = 0xbc5;
		sine[1729] = 0xbc2;
		sine[1730] = 0xbbf;
		sine[1731] = 0xbbc;
		sine[1732] = 0xbba;
		sine[1733] = 0xbb7;
		sine[1734] = 0xbb4;
		sine[1735] = 0xbb1;
		sine[1736] = 0xbae;
		sine[1737] = 0xbac;
		sine[1738] = 0xba9;
		sine[1739] = 0xba6;
		sine[1740] = 0xba3;
		sine[1741] = 0xba0;
		sine[1742] = 0xb9e;
		sine[1743] = 0xb9b;
		sine[1744] = 0xb98;
		sine[1745] = 0xb95;
		sine[1746] = 0xb92;
		sine[1747] = 0xb90;
		sine[1748] = 0xb8d;
		sine[1749] = 0xb8a;
		sine[1750] = 0xb87;
		sine[1751] = 0xb84;
		sine[1752] = 0xb82;
		sine[1753] = 0xb7f;
		sine[1754] = 0xb7c;
		sine[1755] = 0xb79;
		sine[1756] = 0xb76;
		sine[1757] = 0xb73;
		sine[1758] = 0xb71;
		sine[1759] = 0xb6e;
		sine[1760] = 0xb6b;
		sine[1761] = 0xb68;
		sine[1762] = 0xb65;
		sine[1763] = 0xb62;
		sine[1764] = 0xb60;
		sine[1765] = 0xb5d;
		sine[1766] = 0xb5a;
		sine[1767] = 0xb57;
		sine[1768] = 0xb54;
		sine[1769] = 0xb51;
		sine[1770] = 0xb4e;
		sine[1771] = 0xb4c;
		sine[1772] = 0xb49;
		sine[1773] = 0xb46;
		sine[1774] = 0xb43;
		sine[1775] = 0xb40;
		sine[1776] = 0xb3d;
		sine[1777] = 0xb3a;
		sine[1778] = 0xb37;
		sine[1779] = 0xb35;
		sine[1780] = 0xb32;
		sine[1781] = 0xb2f;
		sine[1782] = 0xb2c;
		sine[1783] = 0xb29;
		sine[1784] = 0xb26;
		sine[1785] = 0xb23;
		sine[1786] = 0xb20;
		sine[1787] = 0xb1e;
		sine[1788] = 0xb1b;
		sine[1789] = 0xb18;
		sine[1790] = 0xb15;
		sine[1791] = 0xb12;
		sine[1792] = 0xb0f;
		sine[1793] = 0xb0c;
		sine[1794] = 0xb09;
		sine[1795] = 0xb06;
		sine[1796] = 0xb03;
		sine[1797] = 0xb01;
		sine[1798] = 0xafe;
		sine[1799] = 0xafb;
		sine[1800] = 0xaf8;
		sine[1801] = 0xaf5;
		sine[1802] = 0xaf2;
		sine[1803] = 0xaef;
		sine[1804] = 0xaec;
		sine[1805] = 0xae9;
		sine[1806] = 0xae6;
		sine[1807] = 0xae3;
		sine[1808] = 0xae0;
		sine[1809] = 0xadd;
		sine[1810] = 0xadb;
		sine[1811] = 0xad8;
		sine[1812] = 0xad5;
		sine[1813] = 0xad2;
		sine[1814] = 0xacf;
		sine[1815] = 0xacc;
		sine[1816] = 0xac9;
		sine[1817] = 0xac6;
		sine[1818] = 0xac3;
		sine[1819] = 0xac0;
		sine[1820] = 0xabd;
		sine[1821] = 0xaba;
		sine[1822] = 0xab7;
		sine[1823] = 0xab4;
		sine[1824] = 0xab1;
		sine[1825] = 0xaae;
		sine[1826] = 0xaab;
		sine[1827] = 0xaa8;
		sine[1828] = 0xaa5;
		sine[1829] = 0xaa2;
		sine[1830] = 0xaa0;
		sine[1831] = 0xa9d;
		sine[1832] = 0xa9a;
		sine[1833] = 0xa97;
		sine[1834] = 0xa94;
		sine[1835] = 0xa91;
		sine[1836] = 0xa8e;
		sine[1837] = 0xa8b;
		sine[1838] = 0xa88;
		sine[1839] = 0xa85;
		sine[1840] = 0xa82;
		sine[1841] = 0xa7f;
		sine[1842] = 0xa7c;
		sine[1843] = 0xa79;
		sine[1844] = 0xa76;
		sine[1845] = 0xa73;
		sine[1846] = 0xa70;
		sine[1847] = 0xa6d;
		sine[1848] = 0xa6a;
		sine[1849] = 0xa67;
		sine[1850] = 0xa64;
		sine[1851] = 0xa61;
		sine[1852] = 0xa5e;
		sine[1853] = 0xa5b;
		sine[1854] = 0xa58;
		sine[1855] = 0xa55;
		sine[1856] = 0xa52;
		sine[1857] = 0xa4f;
		sine[1858] = 0xa4c;
		sine[1859] = 0xa49;
		sine[1860] = 0xa46;
		sine[1861] = 0xa43;
		sine[1862] = 0xa40;
		sine[1863] = 0xa3d;
		sine[1864] = 0xa3a;
		sine[1865] = 0xa37;
		sine[1866] = 0xa34;
		sine[1867] = 0xa31;
		sine[1868] = 0xa2e;
		sine[1869] = 0xa2b;
		sine[1870] = 0xa28;
		sine[1871] = 0xa25;
		sine[1872] = 0xa22;
		sine[1873] = 0xa1f;
		sine[1874] = 0xa1c;
		sine[1875] = 0xa19;
		sine[1876] = 0xa15;
		sine[1877] = 0xa12;
		sine[1878] = 0xa0f;
		sine[1879] = 0xa0c;
		sine[1880] = 0xa09;
		sine[1881] = 0xa06;
		sine[1882] = 0xa03;
		sine[1883] = 0xa00;
		sine[1884] = 0x9fd;
		sine[1885] = 0x9fa;
		sine[1886] = 0x9f7;
		sine[1887] = 0x9f4;
		sine[1888] = 0x9f1;
		sine[1889] = 0x9ee;
		sine[1890] = 0x9eb;
		sine[1891] = 0x9e8;
		sine[1892] = 0x9e5;
		sine[1893] = 0x9e2;
		sine[1894] = 0x9df;
		sine[1895] = 0x9dc;
		sine[1896] = 0x9d9;
		sine[1897] = 0x9d6;
		sine[1898] = 0x9d2;
		sine[1899] = 0x9cf;
		sine[1900] = 0x9cc;
		sine[1901] = 0x9c9;
		sine[1902] = 0x9c6;
		sine[1903] = 0x9c3;
		sine[1904] = 0x9c0;
		sine[1905] = 0x9bd;
		sine[1906] = 0x9ba;
		sine[1907] = 0x9b7;
		sine[1908] = 0x9b4;
		sine[1909] = 0x9b1;
		sine[1910] = 0x9ae;
		sine[1911] = 0x9ab;
		sine[1912] = 0x9a8;
		sine[1913] = 0x9a4;
		sine[1914] = 0x9a1;
		sine[1915] = 0x99e;
		sine[1916] = 0x99b;
		sine[1917] = 0x998;
		sine[1918] = 0x995;
		sine[1919] = 0x992;
		sine[1920] = 0x98f;
		sine[1921] = 0x98c;
		sine[1922] = 0x989;
		sine[1923] = 0x986;
		sine[1924] = 0x983;
		sine[1925] = 0x980;
		sine[1926] = 0x97c;
		sine[1927] = 0x979;
		sine[1928] = 0x976;
		sine[1929] = 0x973;
		sine[1930] = 0x970;
		sine[1931] = 0x96d;
		sine[1932] = 0x96a;
		sine[1933] = 0x967;
		sine[1934] = 0x964;
		sine[1935] = 0x961;
		sine[1936] = 0x95e;
		sine[1937] = 0x95a;
		sine[1938] = 0x957;
		sine[1939] = 0x954;
		sine[1940] = 0x951;
		sine[1941] = 0x94e;
		sine[1942] = 0x94b;
		sine[1943] = 0x948;
		sine[1944] = 0x945;
		sine[1945] = 0x942;
		sine[1946] = 0x93f;
		sine[1947] = 0x93b;
		sine[1948] = 0x938;
		sine[1949] = 0x935;
		sine[1950] = 0x932;
		sine[1951] = 0x92f;
		sine[1952] = 0x92c;
		sine[1953] = 0x929;
		sine[1954] = 0x926;
		sine[1955] = 0x923;
		sine[1956] = 0x91f;
		sine[1957] = 0x91c;
		sine[1958] = 0x919;
		sine[1959] = 0x916;
		sine[1960] = 0x913;
		sine[1961] = 0x910;
		sine[1962] = 0x90d;
		sine[1963] = 0x90a;
		sine[1964] = 0x907;
		sine[1965] = 0x903;
		sine[1966] = 0x900;
		sine[1967] = 0x8fd;
		sine[1968] = 0x8fa;
		sine[1969] = 0x8f7;
		sine[1970] = 0x8f4;
		sine[1971] = 0x8f1;
		sine[1972] = 0x8ee;
		sine[1973] = 0x8eb;
		sine[1974] = 0x8e7;
		sine[1975] = 0x8e4;
		sine[1976] = 0x8e1;
		sine[1977] = 0x8de;
		sine[1978] = 0x8db;
		sine[1979] = 0x8d8;
		sine[1980] = 0x8d5;
		sine[1981] = 0x8d2;
		sine[1982] = 0x8ce;
		sine[1983] = 0x8cb;
		sine[1984] = 0x8c8;
		sine[1985] = 0x8c5;
		sine[1986] = 0x8c2;
		sine[1987] = 0x8bf;
		sine[1988] = 0x8bc;
		sine[1989] = 0x8b9;
		sine[1990] = 0x8b5;
		sine[1991] = 0x8b2;
		sine[1992] = 0x8af;
		sine[1993] = 0x8ac;
		sine[1994] = 0x8a9;
		sine[1995] = 0x8a6;
		sine[1996] = 0x8a3;
		sine[1997] = 0x8a0;
		sine[1998] = 0x89c;
		sine[1999] = 0x899;
		sine[2000] = 0x896;
		sine[2001] = 0x893;
		sine[2002] = 0x890;
		sine[2003] = 0x88d;
		sine[2004] = 0x88a;
		sine[2005] = 0x886;
		sine[2006] = 0x883;
		sine[2007] = 0x880;
		sine[2008] = 0x87d;
		sine[2009] = 0x87a;
		sine[2010] = 0x877;
		sine[2011] = 0x874;
		sine[2012] = 0x871;
		sine[2013] = 0x86d;
		sine[2014] = 0x86a;
		sine[2015] = 0x867;
		sine[2016] = 0x864;
		sine[2017] = 0x861;
		sine[2018] = 0x85e;
		sine[2019] = 0x85b;
		sine[2020] = 0x857;
		sine[2021] = 0x854;
		sine[2022] = 0x851;
		sine[2023] = 0x84e;
		sine[2024] = 0x84b;
		sine[2025] = 0x848;
		sine[2026] = 0x845;
		sine[2027] = 0x841;
		sine[2028] = 0x83e;
		sine[2029] = 0x83b;
		sine[2030] = 0x838;
		sine[2031] = 0x835;
		sine[2032] = 0x832;
		sine[2033] = 0x82f;
		sine[2034] = 0x82b;
		sine[2035] = 0x828;
		sine[2036] = 0x825;
		sine[2037] = 0x822;
		sine[2038] = 0x81f;
		sine[2039] = 0x81c;
		sine[2040] = 0x819;
		sine[2041] = 0x815;
		sine[2042] = 0x812;
		sine[2043] = 0x80f;
		sine[2044] = 0x80c;
		sine[2045] = 0x809;
		sine[2046] = 0x806;
		sine[2047] = 0x803;
		sine[2048] = 0x800;
		sine[2049] = 0x7fc;
		sine[2050] = 0x7f9;
		sine[2051] = 0x7f6;
		sine[2052] = 0x7f3;
		sine[2053] = 0x7f0;
		sine[2054] = 0x7ed;
		sine[2055] = 0x7ea;
		sine[2056] = 0x7e6;
		sine[2057] = 0x7e3;
		sine[2058] = 0x7e0;
		sine[2059] = 0x7dd;
		sine[2060] = 0x7da;
		sine[2061] = 0x7d7;
		sine[2062] = 0x7d4;
		sine[2063] = 0x7d0;
		sine[2064] = 0x7cd;
		sine[2065] = 0x7ca;
		sine[2066] = 0x7c7;
		sine[2067] = 0x7c4;
		sine[2068] = 0x7c1;
		sine[2069] = 0x7be;
		sine[2070] = 0x7ba;
		sine[2071] = 0x7b7;
		sine[2072] = 0x7b4;
		sine[2073] = 0x7b1;
		sine[2074] = 0x7ae;
		sine[2075] = 0x7ab;
		sine[2076] = 0x7a8;
		sine[2077] = 0x7a4;
		sine[2078] = 0x7a1;
		sine[2079] = 0x79e;
		sine[2080] = 0x79b;
		sine[2081] = 0x798;
		sine[2082] = 0x795;
		sine[2083] = 0x792;
		sine[2084] = 0x78e;
		sine[2085] = 0x78b;
		sine[2086] = 0x788;
		sine[2087] = 0x785;
		sine[2088] = 0x782;
		sine[2089] = 0x77f;
		sine[2090] = 0x77c;
		sine[2091] = 0x779;
		sine[2092] = 0x775;
		sine[2093] = 0x772;
		sine[2094] = 0x76f;
		sine[2095] = 0x76c;
		sine[2096] = 0x769;
		sine[2097] = 0x766;
		sine[2098] = 0x763;
		sine[2099] = 0x75f;
		sine[2100] = 0x75c;
		sine[2101] = 0x759;
		sine[2102] = 0x756;
		sine[2103] = 0x753;
		sine[2104] = 0x750;
		sine[2105] = 0x74d;
		sine[2106] = 0x74a;
		sine[2107] = 0x746;
		sine[2108] = 0x743;
		sine[2109] = 0x740;
		sine[2110] = 0x73d;
		sine[2111] = 0x73a;
		sine[2112] = 0x737;
		sine[2113] = 0x734;
		sine[2114] = 0x731;
		sine[2115] = 0x72d;
		sine[2116] = 0x72a;
		sine[2117] = 0x727;
		sine[2118] = 0x724;
		sine[2119] = 0x721;
		sine[2120] = 0x71e;
		sine[2121] = 0x71b;
		sine[2122] = 0x718;
		sine[2123] = 0x714;
		sine[2124] = 0x711;
		sine[2125] = 0x70e;
		sine[2126] = 0x70b;
		sine[2127] = 0x708;
		sine[2128] = 0x705;
		sine[2129] = 0x702;
		sine[2130] = 0x6ff;
		sine[2131] = 0x6fc;
		sine[2132] = 0x6f8;
		sine[2133] = 0x6f5;
		sine[2134] = 0x6f2;
		sine[2135] = 0x6ef;
		sine[2136] = 0x6ec;
		sine[2137] = 0x6e9;
		sine[2138] = 0x6e6;
		sine[2139] = 0x6e3;
		sine[2140] = 0x6e0;
		sine[2141] = 0x6dc;
		sine[2142] = 0x6d9;
		sine[2143] = 0x6d6;
		sine[2144] = 0x6d3;
		sine[2145] = 0x6d0;
		sine[2146] = 0x6cd;
		sine[2147] = 0x6ca;
		sine[2148] = 0x6c7;
		sine[2149] = 0x6c4;
		sine[2150] = 0x6c0;
		sine[2151] = 0x6bd;
		sine[2152] = 0x6ba;
		sine[2153] = 0x6b7;
		sine[2154] = 0x6b4;
		sine[2155] = 0x6b1;
		sine[2156] = 0x6ae;
		sine[2157] = 0x6ab;
		sine[2158] = 0x6a8;
		sine[2159] = 0x6a5;
		sine[2160] = 0x6a1;
		sine[2161] = 0x69e;
		sine[2162] = 0x69b;
		sine[2163] = 0x698;
		sine[2164] = 0x695;
		sine[2165] = 0x692;
		sine[2166] = 0x68f;
		sine[2167] = 0x68c;
		sine[2168] = 0x689;
		sine[2169] = 0x686;
		sine[2170] = 0x683;
		sine[2171] = 0x67f;
		sine[2172] = 0x67c;
		sine[2173] = 0x679;
		sine[2174] = 0x676;
		sine[2175] = 0x673;
		sine[2176] = 0x670;
		sine[2177] = 0x66d;
		sine[2178] = 0x66a;
		sine[2179] = 0x667;
		sine[2180] = 0x664;
		sine[2181] = 0x661;
		sine[2182] = 0x65e;
		sine[2183] = 0x65b;
		sine[2184] = 0x657;
		sine[2185] = 0x654;
		sine[2186] = 0x651;
		sine[2187] = 0x64e;
		sine[2188] = 0x64b;
		sine[2189] = 0x648;
		sine[2190] = 0x645;
		sine[2191] = 0x642;
		sine[2192] = 0x63f;
		sine[2193] = 0x63c;
		sine[2194] = 0x639;
		sine[2195] = 0x636;
		sine[2196] = 0x633;
		sine[2197] = 0x630;
		sine[2198] = 0x62d;
		sine[2199] = 0x629;
		sine[2200] = 0x626;
		sine[2201] = 0x623;
		sine[2202] = 0x620;
		sine[2203] = 0x61d;
		sine[2204] = 0x61a;
		sine[2205] = 0x617;
		sine[2206] = 0x614;
		sine[2207] = 0x611;
		sine[2208] = 0x60e;
		sine[2209] = 0x60b;
		sine[2210] = 0x608;
		sine[2211] = 0x605;
		sine[2212] = 0x602;
		sine[2213] = 0x5ff;
		sine[2214] = 0x5fc;
		sine[2215] = 0x5f9;
		sine[2216] = 0x5f6;
		sine[2217] = 0x5f3;
		sine[2218] = 0x5f0;
		sine[2219] = 0x5ed;
		sine[2220] = 0x5ea;
		sine[2221] = 0x5e6;
		sine[2222] = 0x5e3;
		sine[2223] = 0x5e0;
		sine[2224] = 0x5dd;
		sine[2225] = 0x5da;
		sine[2226] = 0x5d7;
		sine[2227] = 0x5d4;
		sine[2228] = 0x5d1;
		sine[2229] = 0x5ce;
		sine[2230] = 0x5cb;
		sine[2231] = 0x5c8;
		sine[2232] = 0x5c5;
		sine[2233] = 0x5c2;
		sine[2234] = 0x5bf;
		sine[2235] = 0x5bc;
		sine[2236] = 0x5b9;
		sine[2237] = 0x5b6;
		sine[2238] = 0x5b3;
		sine[2239] = 0x5b0;
		sine[2240] = 0x5ad;
		sine[2241] = 0x5aa;
		sine[2242] = 0x5a7;
		sine[2243] = 0x5a4;
		sine[2244] = 0x5a1;
		sine[2245] = 0x59e;
		sine[2246] = 0x59b;
		sine[2247] = 0x598;
		sine[2248] = 0x595;
		sine[2249] = 0x592;
		sine[2250] = 0x58f;
		sine[2251] = 0x58c;
		sine[2252] = 0x589;
		sine[2253] = 0x586;
		sine[2254] = 0x583;
		sine[2255] = 0x580;
		sine[2256] = 0x57d;
		sine[2257] = 0x57a;
		sine[2258] = 0x577;
		sine[2259] = 0x574;
		sine[2260] = 0x571;
		sine[2261] = 0x56e;
		sine[2262] = 0x56b;
		sine[2263] = 0x568;
		sine[2264] = 0x565;
		sine[2265] = 0x562;
		sine[2266] = 0x55f;
		sine[2267] = 0x55d;
		sine[2268] = 0x55a;
		sine[2269] = 0x557;
		sine[2270] = 0x554;
		sine[2271] = 0x551;
		sine[2272] = 0x54e;
		sine[2273] = 0x54b;
		sine[2274] = 0x548;
		sine[2275] = 0x545;
		sine[2276] = 0x542;
		sine[2277] = 0x53f;
		sine[2278] = 0x53c;
		sine[2279] = 0x539;
		sine[2280] = 0x536;
		sine[2281] = 0x533;
		sine[2282] = 0x530;
		sine[2283] = 0x52d;
		sine[2284] = 0x52a;
		sine[2285] = 0x527;
		sine[2286] = 0x524;
		sine[2287] = 0x522;
		sine[2288] = 0x51f;
		sine[2289] = 0x51c;
		sine[2290] = 0x519;
		sine[2291] = 0x516;
		sine[2292] = 0x513;
		sine[2293] = 0x510;
		sine[2294] = 0x50d;
		sine[2295] = 0x50a;
		sine[2296] = 0x507;
		sine[2297] = 0x504;
		sine[2298] = 0x501;
		sine[2299] = 0x4fe;
		sine[2300] = 0x4fc;
		sine[2301] = 0x4f9;
		sine[2302] = 0x4f6;
		sine[2303] = 0x4f3;
		sine[2304] = 0x4f0;
		sine[2305] = 0x4ed;
		sine[2306] = 0x4ea;
		sine[2307] = 0x4e7;
		sine[2308] = 0x4e4;
		sine[2309] = 0x4e1;
		sine[2310] = 0x4df;
		sine[2311] = 0x4dc;
		sine[2312] = 0x4d9;
		sine[2313] = 0x4d6;
		sine[2314] = 0x4d3;
		sine[2315] = 0x4d0;
		sine[2316] = 0x4cd;
		sine[2317] = 0x4ca;
		sine[2318] = 0x4c8;
		sine[2319] = 0x4c5;
		sine[2320] = 0x4c2;
		sine[2321] = 0x4bf;
		sine[2322] = 0x4bc;
		sine[2323] = 0x4b9;
		sine[2324] = 0x4b6;
		sine[2325] = 0x4b3;
		sine[2326] = 0x4b1;
		sine[2327] = 0x4ae;
		sine[2328] = 0x4ab;
		sine[2329] = 0x4a8;
		sine[2330] = 0x4a5;
		sine[2331] = 0x4a2;
		sine[2332] = 0x49f;
		sine[2333] = 0x49d;
		sine[2334] = 0x49a;
		sine[2335] = 0x497;
		sine[2336] = 0x494;
		sine[2337] = 0x491;
		sine[2338] = 0x48e;
		sine[2339] = 0x48c;
		sine[2340] = 0x489;
		sine[2341] = 0x486;
		sine[2342] = 0x483;
		sine[2343] = 0x480;
		sine[2344] = 0x47d;
		sine[2345] = 0x47b;
		sine[2346] = 0x478;
		sine[2347] = 0x475;
		sine[2348] = 0x472;
		sine[2349] = 0x46f;
		sine[2350] = 0x46d;
		sine[2351] = 0x46a;
		sine[2352] = 0x467;
		sine[2353] = 0x464;
		sine[2354] = 0x461;
		sine[2355] = 0x45f;
		sine[2356] = 0x45c;
		sine[2357] = 0x459;
		sine[2358] = 0x456;
		sine[2359] = 0x453;
		sine[2360] = 0x451;
		sine[2361] = 0x44e;
		sine[2362] = 0x44b;
		sine[2363] = 0x448;
		sine[2364] = 0x445;
		sine[2365] = 0x443;
		sine[2366] = 0x440;
		sine[2367] = 0x43d;
		sine[2368] = 0x43a;
		sine[2369] = 0x438;
		sine[2370] = 0x435;
		sine[2371] = 0x432;
		sine[2372] = 0x42f;
		sine[2373] = 0x42c;
		sine[2374] = 0x42a;
		sine[2375] = 0x427;
		sine[2376] = 0x424;
		sine[2377] = 0x421;
		sine[2378] = 0x41f;
		sine[2379] = 0x41c;
		sine[2380] = 0x419;
		sine[2381] = 0x416;
		sine[2382] = 0x414;
		sine[2383] = 0x411;
		sine[2384] = 0x40e;
		sine[2385] = 0x40c;
		sine[2386] = 0x409;
		sine[2387] = 0x406;
		sine[2388] = 0x403;
		sine[2389] = 0x401;
		sine[2390] = 0x3fe;
		sine[2391] = 0x3fb;
		sine[2392] = 0x3f9;
		sine[2393] = 0x3f6;
		sine[2394] = 0x3f3;
		sine[2395] = 0x3f0;
		sine[2396] = 0x3ee;
		sine[2397] = 0x3eb;
		sine[2398] = 0x3e8;
		sine[2399] = 0x3e6;
		sine[2400] = 0x3e3;
		sine[2401] = 0x3e0;
		sine[2402] = 0x3dd;
		sine[2403] = 0x3db;
		sine[2404] = 0x3d8;
		sine[2405] = 0x3d5;
		sine[2406] = 0x3d3;
		sine[2407] = 0x3d0;
		sine[2408] = 0x3cd;
		sine[2409] = 0x3cb;
		sine[2410] = 0x3c8;
		sine[2411] = 0x3c5;
		sine[2412] = 0x3c3;
		sine[2413] = 0x3c0;
		sine[2414] = 0x3bd;
		sine[2415] = 0x3bb;
		sine[2416] = 0x3b8;
		sine[2417] = 0x3b5;
		sine[2418] = 0x3b3;
		sine[2419] = 0x3b0;
		sine[2420] = 0x3ad;
		sine[2421] = 0x3ab;
		sine[2422] = 0x3a8;
		sine[2423] = 0x3a6;
		sine[2424] = 0x3a3;
		sine[2425] = 0x3a0;
		sine[2426] = 0x39e;
		sine[2427] = 0x39b;
		sine[2428] = 0x398;
		sine[2429] = 0x396;
		sine[2430] = 0x393;
		sine[2431] = 0x391;
		sine[2432] = 0x38e;
		sine[2433] = 0x38b;
		sine[2434] = 0x389;
		sine[2435] = 0x386;
		sine[2436] = 0x384;
		sine[2437] = 0x381;
		sine[2438] = 0x37e;
		sine[2439] = 0x37c;
		sine[2440] = 0x379;
		sine[2441] = 0x377;
		sine[2442] = 0x374;
		sine[2443] = 0x371;
		sine[2444] = 0x36f;
		sine[2445] = 0x36c;
		sine[2446] = 0x36a;
		sine[2447] = 0x367;
		sine[2448] = 0x365;
		sine[2449] = 0x362;
		sine[2450] = 0x35f;
		sine[2451] = 0x35d;
		sine[2452] = 0x35a;
		sine[2453] = 0x358;
		sine[2454] = 0x355;
		sine[2455] = 0x353;
		sine[2456] = 0x350;
		sine[2457] = 0x34e;
		sine[2458] = 0x34b;
		sine[2459] = 0x348;
		sine[2460] = 0x346;
		sine[2461] = 0x343;
		sine[2462] = 0x341;
		sine[2463] = 0x33e;
		sine[2464] = 0x33c;
		sine[2465] = 0x339;
		sine[2466] = 0x337;
		sine[2467] = 0x334;
		sine[2468] = 0x332;
		sine[2469] = 0x32f;
		sine[2470] = 0x32d;
		sine[2471] = 0x32a;
		sine[2472] = 0x328;
		sine[2473] = 0x325;
		sine[2474] = 0x323;
		sine[2475] = 0x320;
		sine[2476] = 0x31e;
		sine[2477] = 0x31b;
		sine[2478] = 0x319;
		sine[2479] = 0x316;
		sine[2480] = 0x314;
		sine[2481] = 0x311;
		sine[2482] = 0x30f;
		sine[2483] = 0x30c;
		sine[2484] = 0x30a;
		sine[2485] = 0x307;
		sine[2486] = 0x305;
		sine[2487] = 0x303;
		sine[2488] = 0x300;
		sine[2489] = 0x2fe;
		sine[2490] = 0x2fb;
		sine[2491] = 0x2f9;
		sine[2492] = 0x2f6;
		sine[2493] = 0x2f4;
		sine[2494] = 0x2f1;
		sine[2495] = 0x2ef;
		sine[2496] = 0x2ed;
		sine[2497] = 0x2ea;
		sine[2498] = 0x2e8;
		sine[2499] = 0x2e5;
		sine[2500] = 0x2e3;
		sine[2501] = 0x2e0;
		sine[2502] = 0x2de;
		sine[2503] = 0x2dc;
		sine[2504] = 0x2d9;
		sine[2505] = 0x2d7;
		sine[2506] = 0x2d4;
		sine[2507] = 0x2d2;
		sine[2508] = 0x2d0;
		sine[2509] = 0x2cd;
		sine[2510] = 0x2cb;
		sine[2511] = 0x2c9;
		sine[2512] = 0x2c6;
		sine[2513] = 0x2c4;
		sine[2514] = 0x2c1;
		sine[2515] = 0x2bf;
		sine[2516] = 0x2bd;
		sine[2517] = 0x2ba;
		sine[2518] = 0x2b8;
		sine[2519] = 0x2b6;
		sine[2520] = 0x2b3;
		sine[2521] = 0x2b1;
		sine[2522] = 0x2af;
		sine[2523] = 0x2ac;
		sine[2524] = 0x2aa;
		sine[2525] = 0x2a7;
		sine[2526] = 0x2a5;
		sine[2527] = 0x2a3;
		sine[2528] = 0x2a0;
		sine[2529] = 0x29e;
		sine[2530] = 0x29c;
		sine[2531] = 0x29a;
		sine[2532] = 0x297;
		sine[2533] = 0x295;
		sine[2534] = 0x293;
		sine[2535] = 0x290;
		sine[2536] = 0x28e;
		sine[2537] = 0x28c;
		sine[2538] = 0x289;
		sine[2539] = 0x287;
		sine[2540] = 0x285;
		sine[2541] = 0x283;
		sine[2542] = 0x280;
		sine[2543] = 0x27e;
		sine[2544] = 0x27c;
		sine[2545] = 0x279;
		sine[2546] = 0x277;
		sine[2547] = 0x275;
		sine[2548] = 0x273;
		sine[2549] = 0x270;
		sine[2550] = 0x26e;
		sine[2551] = 0x26c;
		sine[2552] = 0x26a;
		sine[2553] = 0x267;
		sine[2554] = 0x265;
		sine[2555] = 0x263;
		sine[2556] = 0x261;
		sine[2557] = 0x25e;
		sine[2558] = 0x25c;
		sine[2559] = 0x25a;
		sine[2560] = 0x258;
		sine[2561] = 0x255;
		sine[2562] = 0x253;
		sine[2563] = 0x251;
		sine[2564] = 0x24f;
		sine[2565] = 0x24d;
		sine[2566] = 0x24a;
		sine[2567] = 0x248;
		sine[2568] = 0x246;
		sine[2569] = 0x244;
		sine[2570] = 0x242;
		sine[2571] = 0x23f;
		sine[2572] = 0x23d;
		sine[2573] = 0x23b;
		sine[2574] = 0x239;
		sine[2575] = 0x237;
		sine[2576] = 0x235;
		sine[2577] = 0x232;
		sine[2578] = 0x230;
		sine[2579] = 0x22e;
		sine[2580] = 0x22c;
		sine[2581] = 0x22a;
		sine[2582] = 0x228;
		sine[2583] = 0x226;
		sine[2584] = 0x223;
		sine[2585] = 0x221;
		sine[2586] = 0x21f;
		sine[2587] = 0x21d;
		sine[2588] = 0x21b;
		sine[2589] = 0x219;
		sine[2590] = 0x217;
		sine[2591] = 0x215;
		sine[2592] = 0x212;
		sine[2593] = 0x210;
		sine[2594] = 0x20e;
		sine[2595] = 0x20c;
		sine[2596] = 0x20a;
		sine[2597] = 0x208;
		sine[2598] = 0x206;
		sine[2599] = 0x204;
		sine[2600] = 0x202;
		sine[2601] = 0x200;
		sine[2602] = 0x1fd;
		sine[2603] = 0x1fb;
		sine[2604] = 0x1f9;
		sine[2605] = 0x1f7;
		sine[2606] = 0x1f5;
		sine[2607] = 0x1f3;
		sine[2608] = 0x1f1;
		sine[2609] = 0x1ef;
		sine[2610] = 0x1ed;
		sine[2611] = 0x1eb;
		sine[2612] = 0x1e9;
		sine[2613] = 0x1e7;
		sine[2614] = 0x1e5;
		sine[2615] = 0x1e3;
		sine[2616] = 0x1e1;
		sine[2617] = 0x1df;
		sine[2618] = 0x1dd;
		sine[2619] = 0x1db;
		sine[2620] = 0x1d9;
		sine[2621] = 0x1d7;
		sine[2622] = 0x1d5;
		sine[2623] = 0x1d3;
		sine[2624] = 0x1d1;
		sine[2625] = 0x1cf;
		sine[2626] = 0x1cd;
		sine[2627] = 0x1cb;
		sine[2628] = 0x1c9;
		sine[2629] = 0x1c7;
		sine[2630] = 0x1c5;
		sine[2631] = 0x1c3;
		sine[2632] = 0x1c1;
		sine[2633] = 0x1bf;
		sine[2634] = 0x1bd;
		sine[2635] = 0x1bb;
		sine[2636] = 0x1b9;
		sine[2637] = 0x1b7;
		sine[2638] = 0x1b5;
		sine[2639] = 0x1b3;
		sine[2640] = 0x1b1;
		sine[2641] = 0x1af;
		sine[2642] = 0x1ae;
		sine[2643] = 0x1ac;
		sine[2644] = 0x1aa;
		sine[2645] = 0x1a8;
		sine[2646] = 0x1a6;
		sine[2647] = 0x1a4;
		sine[2648] = 0x1a2;
		sine[2649] = 0x1a0;
		sine[2650] = 0x19e;
		sine[2651] = 0x19c;
		sine[2652] = 0x19a;
		sine[2653] = 0x199;
		sine[2654] = 0x197;
		sine[2655] = 0x195;
		sine[2656] = 0x193;
		sine[2657] = 0x191;
		sine[2658] = 0x18f;
		sine[2659] = 0x18d;
		sine[2660] = 0x18b;
		sine[2661] = 0x18a;
		sine[2662] = 0x188;
		sine[2663] = 0x186;
		sine[2664] = 0x184;
		sine[2665] = 0x182;
		sine[2666] = 0x180;
		sine[2667] = 0x17f;
		sine[2668] = 0x17d;
		sine[2669] = 0x17b;
		sine[2670] = 0x179;
		sine[2671] = 0x177;
		sine[2672] = 0x175;
		sine[2673] = 0x174;
		sine[2674] = 0x172;
		sine[2675] = 0x170;
		sine[2676] = 0x16e;
		sine[2677] = 0x16d;
		sine[2678] = 0x16b;
		sine[2679] = 0x169;
		sine[2680] = 0x167;
		sine[2681] = 0x165;
		sine[2682] = 0x164;
		sine[2683] = 0x162;
		sine[2684] = 0x160;
		sine[2685] = 0x15e;
		sine[2686] = 0x15d;
		sine[2687] = 0x15b;
		sine[2688] = 0x159;
		sine[2689] = 0x157;
		sine[2690] = 0x156;
		sine[2691] = 0x154;
		sine[2692] = 0x152;
		sine[2693] = 0x150;
		sine[2694] = 0x14f;
		sine[2695] = 0x14d;
		sine[2696] = 0x14b;
		sine[2697] = 0x14a;
		sine[2698] = 0x148;
		sine[2699] = 0x146;
		sine[2700] = 0x144;
		sine[2701] = 0x143;
		sine[2702] = 0x141;
		sine[2703] = 0x13f;
		sine[2704] = 0x13e;
		sine[2705] = 0x13c;
		sine[2706] = 0x13a;
		sine[2707] = 0x139;
		sine[2708] = 0x137;
		sine[2709] = 0x135;
		sine[2710] = 0x134;
		sine[2711] = 0x132;
		sine[2712] = 0x130;
		sine[2713] = 0x12f;
		sine[2714] = 0x12d;
		sine[2715] = 0x12b;
		sine[2716] = 0x12a;
		sine[2717] = 0x128;
		sine[2718] = 0x127;
		sine[2719] = 0x125;
		sine[2720] = 0x123;
		sine[2721] = 0x122;
		sine[2722] = 0x120;
		sine[2723] = 0x11e;
		sine[2724] = 0x11d;
		sine[2725] = 0x11b;
		sine[2726] = 0x11a;
		sine[2727] = 0x118;
		sine[2728] = 0x117;
		sine[2729] = 0x115;
		sine[2730] = 0x113;
		sine[2731] = 0x112;
		sine[2732] = 0x110;
		sine[2733] = 0x10f;
		sine[2734] = 0x10d;
		sine[2735] = 0x10c;
		sine[2736] = 0x10a;
		sine[2737] = 0x108;
		sine[2738] = 0x107;
		sine[2739] = 0x105;
		sine[2740] = 0x104;
		sine[2741] = 0x102;
		sine[2742] = 0x101;
		sine[2743] = 0xff;
		sine[2744] = 0xfe;
		sine[2745] = 0xfc;
		sine[2746] = 0xfb;
		sine[2747] = 0xf9;
		sine[2748] = 0xf8;
		sine[2749] = 0xf6;
		sine[2750] = 0xf5;
		sine[2751] = 0xf3;
		sine[2752] = 0xf2;
		sine[2753] = 0xf0;
		sine[2754] = 0xef;
		sine[2755] = 0xed;
		sine[2756] = 0xec;
		sine[2757] = 0xea;
		sine[2758] = 0xe9;
		sine[2759] = 0xe8;
		sine[2760] = 0xe6;
		sine[2761] = 0xe5;
		sine[2762] = 0xe3;
		sine[2763] = 0xe2;
		sine[2764] = 0xe0;
		sine[2765] = 0xdf;
		sine[2766] = 0xdd;
		sine[2767] = 0xdc;
		sine[2768] = 0xdb;
		sine[2769] = 0xd9;
		sine[2770] = 0xd8;
		sine[2771] = 0xd6;
		sine[2772] = 0xd5;
		sine[2773] = 0xd4;
		sine[2774] = 0xd2;
		sine[2775] = 0xd1;
		sine[2776] = 0xcf;
		sine[2777] = 0xce;
		sine[2778] = 0xcd;
		sine[2779] = 0xcb;
		sine[2780] = 0xca;
		sine[2781] = 0xc9;
		sine[2782] = 0xc7;
		sine[2783] = 0xc6;
		sine[2784] = 0xc5;
		sine[2785] = 0xc3;
		sine[2786] = 0xc2;
		sine[2787] = 0xc1;
		sine[2788] = 0xbf;
		sine[2789] = 0xbe;
		sine[2790] = 0xbd;
		sine[2791] = 0xbb;
		sine[2792] = 0xba;
		sine[2793] = 0xb9;
		sine[2794] = 0xb7;
		sine[2795] = 0xb6;
		sine[2796] = 0xb5;
		sine[2797] = 0xb3;
		sine[2798] = 0xb2;
		sine[2799] = 0xb1;
		sine[2800] = 0xb0;
		sine[2801] = 0xae;
		sine[2802] = 0xad;
		sine[2803] = 0xac;
		sine[2804] = 0xab;
		sine[2805] = 0xa9;
		sine[2806] = 0xa8;
		sine[2807] = 0xa7;
		sine[2808] = 0xa6;
		sine[2809] = 0xa4;
		sine[2810] = 0xa3;
		sine[2811] = 0xa2;
		sine[2812] = 0xa1;
		sine[2813] = 0x9f;
		sine[2814] = 0x9e;
		sine[2815] = 0x9d;
		sine[2816] = 0x9c;
		sine[2817] = 0x9b;
		sine[2818] = 0x99;
		sine[2819] = 0x98;
		sine[2820] = 0x97;
		sine[2821] = 0x96;
		sine[2822] = 0x95;
		sine[2823] = 0x94;
		sine[2824] = 0x92;
		sine[2825] = 0x91;
		sine[2826] = 0x90;
		sine[2827] = 0x8f;
		sine[2828] = 0x8e;
		sine[2829] = 0x8d;
		sine[2830] = 0x8b;
		sine[2831] = 0x8a;
		sine[2832] = 0x89;
		sine[2833] = 0x88;
		sine[2834] = 0x87;
		sine[2835] = 0x86;
		sine[2836] = 0x85;
		sine[2837] = 0x84;
		sine[2838] = 0x82;
		sine[2839] = 0x81;
		sine[2840] = 0x80;
		sine[2841] = 0x7f;
		sine[2842] = 0x7e;
		sine[2843] = 0x7d;
		sine[2844] = 0x7c;
		sine[2845] = 0x7b;
		sine[2846] = 0x7a;
		sine[2847] = 0x79;
		sine[2848] = 0x78;
		sine[2849] = 0x77;
		sine[2850] = 0x76;
		sine[2851] = 0x75;
		sine[2852] = 0x73;
		sine[2853] = 0x72;
		sine[2854] = 0x71;
		sine[2855] = 0x70;
		sine[2856] = 0x6f;
		sine[2857] = 0x6e;
		sine[2858] = 0x6d;
		sine[2859] = 0x6c;
		sine[2860] = 0x6b;
		sine[2861] = 0x6a;
		sine[2862] = 0x69;
		sine[2863] = 0x68;
		sine[2864] = 0x67;
		sine[2865] = 0x66;
		sine[2866] = 0x65;
		sine[2867] = 0x64;
		sine[2868] = 0x63;
		sine[2869] = 0x62;
		sine[2870] = 0x62;
		sine[2871] = 0x61;
		sine[2872] = 0x60;
		sine[2873] = 0x5f;
		sine[2874] = 0x5e;
		sine[2875] = 0x5d;
		sine[2876] = 0x5c;
		sine[2877] = 0x5b;
		sine[2878] = 0x5a;
		sine[2879] = 0x59;
		sine[2880] = 0x58;
		sine[2881] = 0x57;
		sine[2882] = 0x56;
		sine[2883] = 0x55;
		sine[2884] = 0x55;
		sine[2885] = 0x54;
		sine[2886] = 0x53;
		sine[2887] = 0x52;
		sine[2888] = 0x51;
		sine[2889] = 0x50;
		sine[2890] = 0x4f;
		sine[2891] = 0x4e;
		sine[2892] = 0x4e;
		sine[2893] = 0x4d;
		sine[2894] = 0x4c;
		sine[2895] = 0x4b;
		sine[2896] = 0x4a;
		sine[2897] = 0x49;
		sine[2898] = 0x49;
		sine[2899] = 0x48;
		sine[2900] = 0x47;
		sine[2901] = 0x46;
		sine[2902] = 0x45;
		sine[2903] = 0x44;
		sine[2904] = 0x44;
		sine[2905] = 0x43;
		sine[2906] = 0x42;
		sine[2907] = 0x41;
		sine[2908] = 0x40;
		sine[2909] = 0x40;
		sine[2910] = 0x3f;
		sine[2911] = 0x3e;
		sine[2912] = 0x3d;
		sine[2913] = 0x3d;
		sine[2914] = 0x3c;
		sine[2915] = 0x3b;
		sine[2916] = 0x3a;
		sine[2917] = 0x3a;
		sine[2918] = 0x39;
		sine[2919] = 0x38;
		sine[2920] = 0x37;
		sine[2921] = 0x37;
		sine[2922] = 0x36;
		sine[2923] = 0x35;
		sine[2924] = 0x35;
		sine[2925] = 0x34;
		sine[2926] = 0x33;
		sine[2927] = 0x32;
		sine[2928] = 0x32;
		sine[2929] = 0x31;
		sine[2930] = 0x30;
		sine[2931] = 0x30;
		sine[2932] = 0x2f;
		sine[2933] = 0x2e;
		sine[2934] = 0x2e;
		sine[2935] = 0x2d;
		sine[2936] = 0x2c;
		sine[2937] = 0x2c;
		sine[2938] = 0x2b;
		sine[2939] = 0x2a;
		sine[2940] = 0x2a;
		sine[2941] = 0x29;
		sine[2942] = 0x29;
		sine[2943] = 0x28;
		sine[2944] = 0x27;
		sine[2945] = 0x27;
		sine[2946] = 0x26;
		sine[2947] = 0x26;
		sine[2948] = 0x25;
		sine[2949] = 0x24;
		sine[2950] = 0x24;
		sine[2951] = 0x23;
		sine[2952] = 0x23;
		sine[2953] = 0x22;
		sine[2954] = 0x21;
		sine[2955] = 0x21;
		sine[2956] = 0x20;
		sine[2957] = 0x20;
		sine[2958] = 0x1f;
		sine[2959] = 0x1f;
		sine[2960] = 0x1e;
		sine[2961] = 0x1e;
		sine[2962] = 0x1d;
		sine[2963] = 0x1d;
		sine[2964] = 0x1c;
		sine[2965] = 0x1c;
		sine[2966] = 0x1b;
		sine[2967] = 0x1b;
		sine[2968] = 0x1a;
		sine[2969] = 0x1a;
		sine[2970] = 0x19;
		sine[2971] = 0x19;
		sine[2972] = 0x18;
		sine[2973] = 0x18;
		sine[2974] = 0x17;
		sine[2975] = 0x17;
		sine[2976] = 0x16;
		sine[2977] = 0x16;
		sine[2978] = 0x15;
		sine[2979] = 0x15;
		sine[2980] = 0x14;
		sine[2981] = 0x14;
		sine[2982] = 0x13;
		sine[2983] = 0x13;
		sine[2984] = 0x13;
		sine[2985] = 0x12;
		sine[2986] = 0x12;
		sine[2987] = 0x11;
		sine[2988] = 0x11;
		sine[2989] = 0x11;
		sine[2990] = 0x10;
		sine[2991] = 0x10;
		sine[2992] = 0xf;
		sine[2993] = 0xf;
		sine[2994] = 0xf;
		sine[2995] = 0xe;
		sine[2996] = 0xe;
		sine[2997] = 0xe;
		sine[2998] = 0xd;
		sine[2999] = 0xd;
		sine[3000] = 0xc;
		sine[3001] = 0xc;
		sine[3002] = 0xc;
		sine[3003] = 0xb;
		sine[3004] = 0xb;
		sine[3005] = 0xb;
		sine[3006] = 0xa;
		sine[3007] = 0xa;
		sine[3008] = 0xa;
		sine[3009] = 0xa;
		sine[3010] = 0x9;
		sine[3011] = 0x9;
		sine[3012] = 0x9;
		sine[3013] = 0x8;
		sine[3014] = 0x8;
		sine[3015] = 0x8;
		sine[3016] = 0x8;
		sine[3017] = 0x7;
		sine[3018] = 0x7;
		sine[3019] = 0x7;
		sine[3020] = 0x7;
		sine[3021] = 0x6;
		sine[3022] = 0x6;
		sine[3023] = 0x6;
		sine[3024] = 0x6;
		sine[3025] = 0x5;
		sine[3026] = 0x5;
		sine[3027] = 0x5;
		sine[3028] = 0x5;
		sine[3029] = 0x4;
		sine[3030] = 0x4;
		sine[3031] = 0x4;
		sine[3032] = 0x4;
		sine[3033] = 0x4;
		sine[3034] = 0x3;
		sine[3035] = 0x3;
		sine[3036] = 0x3;
		sine[3037] = 0x3;
		sine[3038] = 0x3;
		sine[3039] = 0x3;
		sine[3040] = 0x2;
		sine[3041] = 0x2;
		sine[3042] = 0x2;
		sine[3043] = 0x2;
		sine[3044] = 0x2;
		sine[3045] = 0x2;
		sine[3046] = 0x2;
		sine[3047] = 0x2;
		sine[3048] = 0x1;
		sine[3049] = 0x1;
		sine[3050] = 0x1;
		sine[3051] = 0x1;
		sine[3052] = 0x1;
		sine[3053] = 0x1;
		sine[3054] = 0x1;
		sine[3055] = 0x1;
		sine[3056] = 0x1;
		sine[3057] = 0x1;
		sine[3058] = 0x0;
		sine[3059] = 0x0;
		sine[3060] = 0x0;
		sine[3061] = 0x0;
		sine[3062] = 0x0;
		sine[3063] = 0x0;
		sine[3064] = 0x0;
		sine[3065] = 0x0;
		sine[3066] = 0x0;
		sine[3067] = 0x0;
		sine[3068] = 0x0;
		sine[3069] = 0x0;
		sine[3070] = 0x0;
		sine[3071] = 0x0;
		sine[3072] = 0x0;
		sine[3073] = 0x0;
		sine[3074] = 0x0;
		sine[3075] = 0x0;
		sine[3076] = 0x0;
		sine[3077] = 0x0;
		sine[3078] = 0x0;
		sine[3079] = 0x0;
		sine[3080] = 0x0;
		sine[3081] = 0x0;
		sine[3082] = 0x0;
		sine[3083] = 0x0;
		sine[3084] = 0x0;
		sine[3085] = 0x0;
		sine[3086] = 0x0;
		sine[3087] = 0x1;
		sine[3088] = 0x1;
		sine[3089] = 0x1;
		sine[3090] = 0x1;
		sine[3091] = 0x1;
		sine[3092] = 0x1;
		sine[3093] = 0x1;
		sine[3094] = 0x1;
		sine[3095] = 0x1;
		sine[3096] = 0x1;
		sine[3097] = 0x2;
		sine[3098] = 0x2;
		sine[3099] = 0x2;
		sine[3100] = 0x2;
		sine[3101] = 0x2;
		sine[3102] = 0x2;
		sine[3103] = 0x2;
		sine[3104] = 0x2;
		sine[3105] = 0x3;
		sine[3106] = 0x3;
		sine[3107] = 0x3;
		sine[3108] = 0x3;
		sine[3109] = 0x3;
		sine[3110] = 0x3;
		sine[3111] = 0x4;
		sine[3112] = 0x4;
		sine[3113] = 0x4;
		sine[3114] = 0x4;
		sine[3115] = 0x4;
		sine[3116] = 0x5;
		sine[3117] = 0x5;
		sine[3118] = 0x5;
		sine[3119] = 0x5;
		sine[3120] = 0x6;
		sine[3121] = 0x6;
		sine[3122] = 0x6;
		sine[3123] = 0x6;
		sine[3124] = 0x7;
		sine[3125] = 0x7;
		sine[3126] = 0x7;
		sine[3127] = 0x7;
		sine[3128] = 0x8;
		sine[3129] = 0x8;
		sine[3130] = 0x8;
		sine[3131] = 0x8;
		sine[3132] = 0x9;
		sine[3133] = 0x9;
		sine[3134] = 0x9;
		sine[3135] = 0xa;
		sine[3136] = 0xa;
		sine[3137] = 0xa;
		sine[3138] = 0xa;
		sine[3139] = 0xb;
		sine[3140] = 0xb;
		sine[3141] = 0xb;
		sine[3142] = 0xc;
		sine[3143] = 0xc;
		sine[3144] = 0xc;
		sine[3145] = 0xd;
		sine[3146] = 0xd;
		sine[3147] = 0xe;
		sine[3148] = 0xe;
		sine[3149] = 0xe;
		sine[3150] = 0xf;
		sine[3151] = 0xf;
		sine[3152] = 0xf;
		sine[3153] = 0x10;
		sine[3154] = 0x10;
		sine[3155] = 0x11;
		sine[3156] = 0x11;
		sine[3157] = 0x11;
		sine[3158] = 0x12;
		sine[3159] = 0x12;
		sine[3160] = 0x13;
		sine[3161] = 0x13;
		sine[3162] = 0x13;
		sine[3163] = 0x14;
		sine[3164] = 0x14;
		sine[3165] = 0x15;
		sine[3166] = 0x15;
		sine[3167] = 0x16;
		sine[3168] = 0x16;
		sine[3169] = 0x17;
		sine[3170] = 0x17;
		sine[3171] = 0x18;
		sine[3172] = 0x18;
		sine[3173] = 0x19;
		sine[3174] = 0x19;
		sine[3175] = 0x1a;
		sine[3176] = 0x1a;
		sine[3177] = 0x1b;
		sine[3178] = 0x1b;
		sine[3179] = 0x1c;
		sine[3180] = 0x1c;
		sine[3181] = 0x1d;
		sine[3182] = 0x1d;
		sine[3183] = 0x1e;
		sine[3184] = 0x1e;
		sine[3185] = 0x1f;
		sine[3186] = 0x1f;
		sine[3187] = 0x20;
		sine[3188] = 0x20;
		sine[3189] = 0x21;
		sine[3190] = 0x21;
		sine[3191] = 0x22;
		sine[3192] = 0x23;
		sine[3193] = 0x23;
		sine[3194] = 0x24;
		sine[3195] = 0x24;
		sine[3196] = 0x25;
		sine[3197] = 0x26;
		sine[3198] = 0x26;
		sine[3199] = 0x27;
		sine[3200] = 0x27;
		sine[3201] = 0x28;
		sine[3202] = 0x29;
		sine[3203] = 0x29;
		sine[3204] = 0x2a;
		sine[3205] = 0x2a;
		sine[3206] = 0x2b;
		sine[3207] = 0x2c;
		sine[3208] = 0x2c;
		sine[3209] = 0x2d;
		sine[3210] = 0x2e;
		sine[3211] = 0x2e;
		sine[3212] = 0x2f;
		sine[3213] = 0x30;
		sine[3214] = 0x30;
		sine[3215] = 0x31;
		sine[3216] = 0x32;
		sine[3217] = 0x32;
		sine[3218] = 0x33;
		sine[3219] = 0x34;
		sine[3220] = 0x35;
		sine[3221] = 0x35;
		sine[3222] = 0x36;
		sine[3223] = 0x37;
		sine[3224] = 0x37;
		sine[3225] = 0x38;
		sine[3226] = 0x39;
		sine[3227] = 0x3a;
		sine[3228] = 0x3a;
		sine[3229] = 0x3b;
		sine[3230] = 0x3c;
		sine[3231] = 0x3d;
		sine[3232] = 0x3d;
		sine[3233] = 0x3e;
		sine[3234] = 0x3f;
		sine[3235] = 0x40;
		sine[3236] = 0x40;
		sine[3237] = 0x41;
		sine[3238] = 0x42;
		sine[3239] = 0x43;
		sine[3240] = 0x44;
		sine[3241] = 0x44;
		sine[3242] = 0x45;
		sine[3243] = 0x46;
		sine[3244] = 0x47;
		sine[3245] = 0x48;
		sine[3246] = 0x49;
		sine[3247] = 0x49;
		sine[3248] = 0x4a;
		sine[3249] = 0x4b;
		sine[3250] = 0x4c;
		sine[3251] = 0x4d;
		sine[3252] = 0x4e;
		sine[3253] = 0x4e;
		sine[3254] = 0x4f;
		sine[3255] = 0x50;
		sine[3256] = 0x51;
		sine[3257] = 0x52;
		sine[3258] = 0x53;
		sine[3259] = 0x54;
		sine[3260] = 0x55;
		sine[3261] = 0x55;
		sine[3262] = 0x56;
		sine[3263] = 0x57;
		sine[3264] = 0x58;
		sine[3265] = 0x59;
		sine[3266] = 0x5a;
		sine[3267] = 0x5b;
		sine[3268] = 0x5c;
		sine[3269] = 0x5d;
		sine[3270] = 0x5e;
		sine[3271] = 0x5f;
		sine[3272] = 0x60;
		sine[3273] = 0x61;
		sine[3274] = 0x62;
		sine[3275] = 0x62;
		sine[3276] = 0x63;
		sine[3277] = 0x64;
		sine[3278] = 0x65;
		sine[3279] = 0x66;
		sine[3280] = 0x67;
		sine[3281] = 0x68;
		sine[3282] = 0x69;
		sine[3283] = 0x6a;
		sine[3284] = 0x6b;
		sine[3285] = 0x6c;
		sine[3286] = 0x6d;
		sine[3287] = 0x6e;
		sine[3288] = 0x6f;
		sine[3289] = 0x70;
		sine[3290] = 0x71;
		sine[3291] = 0x72;
		sine[3292] = 0x73;
		sine[3293] = 0x75;
		sine[3294] = 0x76;
		sine[3295] = 0x77;
		sine[3296] = 0x78;
		sine[3297] = 0x79;
		sine[3298] = 0x7a;
		sine[3299] = 0x7b;
		sine[3300] = 0x7c;
		sine[3301] = 0x7d;
		sine[3302] = 0x7e;
		sine[3303] = 0x7f;
		sine[3304] = 0x80;
		sine[3305] = 0x81;
		sine[3306] = 0x82;
		sine[3307] = 0x84;
		sine[3308] = 0x85;
		sine[3309] = 0x86;
		sine[3310] = 0x87;
		sine[3311] = 0x88;
		sine[3312] = 0x89;
		sine[3313] = 0x8a;
		sine[3314] = 0x8b;
		sine[3315] = 0x8d;
		sine[3316] = 0x8e;
		sine[3317] = 0x8f;
		sine[3318] = 0x90;
		sine[3319] = 0x91;
		sine[3320] = 0x92;
		sine[3321] = 0x94;
		sine[3322] = 0x95;
		sine[3323] = 0x96;
		sine[3324] = 0x97;
		sine[3325] = 0x98;
		sine[3326] = 0x99;
		sine[3327] = 0x9b;
		sine[3328] = 0x9c;
		sine[3329] = 0x9d;
		sine[3330] = 0x9e;
		sine[3331] = 0x9f;
		sine[3332] = 0xa1;
		sine[3333] = 0xa2;
		sine[3334] = 0xa3;
		sine[3335] = 0xa4;
		sine[3336] = 0xa6;
		sine[3337] = 0xa7;
		sine[3338] = 0xa8;
		sine[3339] = 0xa9;
		sine[3340] = 0xab;
		sine[3341] = 0xac;
		sine[3342] = 0xad;
		sine[3343] = 0xae;
		sine[3344] = 0xb0;
		sine[3345] = 0xb1;
		sine[3346] = 0xb2;
		sine[3347] = 0xb3;
		sine[3348] = 0xb5;
		sine[3349] = 0xb6;
		sine[3350] = 0xb7;
		sine[3351] = 0xb9;
		sine[3352] = 0xba;
		sine[3353] = 0xbb;
		sine[3354] = 0xbd;
		sine[3355] = 0xbe;
		sine[3356] = 0xbf;
		sine[3357] = 0xc1;
		sine[3358] = 0xc2;
		sine[3359] = 0xc3;
		sine[3360] = 0xc5;
		sine[3361] = 0xc6;
		sine[3362] = 0xc7;
		sine[3363] = 0xc9;
		sine[3364] = 0xca;
		sine[3365] = 0xcb;
		sine[3366] = 0xcd;
		sine[3367] = 0xce;
		sine[3368] = 0xcf;
		sine[3369] = 0xd1;
		sine[3370] = 0xd2;
		sine[3371] = 0xd4;
		sine[3372] = 0xd5;
		sine[3373] = 0xd6;
		sine[3374] = 0xd8;
		sine[3375] = 0xd9;
		sine[3376] = 0xdb;
		sine[3377] = 0xdc;
		sine[3378] = 0xdd;
		sine[3379] = 0xdf;
		sine[3380] = 0xe0;
		sine[3381] = 0xe2;
		sine[3382] = 0xe3;
		sine[3383] = 0xe5;
		sine[3384] = 0xe6;
		sine[3385] = 0xe8;
		sine[3386] = 0xe9;
		sine[3387] = 0xea;
		sine[3388] = 0xec;
		sine[3389] = 0xed;
		sine[3390] = 0xef;
		sine[3391] = 0xf0;
		sine[3392] = 0xf2;
		sine[3393] = 0xf3;
		sine[3394] = 0xf5;
		sine[3395] = 0xf6;
		sine[3396] = 0xf8;
		sine[3397] = 0xf9;
		sine[3398] = 0xfb;
		sine[3399] = 0xfc;
		sine[3400] = 0xfe;
		sine[3401] = 0xff;
		sine[3402] = 0x101;
		sine[3403] = 0x102;
		sine[3404] = 0x104;
		sine[3405] = 0x105;
		sine[3406] = 0x107;
		sine[3407] = 0x108;
		sine[3408] = 0x10a;
		sine[3409] = 0x10c;
		sine[3410] = 0x10d;
		sine[3411] = 0x10f;
		sine[3412] = 0x110;
		sine[3413] = 0x112;
		sine[3414] = 0x113;
		sine[3415] = 0x115;
		sine[3416] = 0x117;
		sine[3417] = 0x118;
		sine[3418] = 0x11a;
		sine[3419] = 0x11b;
		sine[3420] = 0x11d;
		sine[3421] = 0x11e;
		sine[3422] = 0x120;
		sine[3423] = 0x122;
		sine[3424] = 0x123;
		sine[3425] = 0x125;
		sine[3426] = 0x127;
		sine[3427] = 0x128;
		sine[3428] = 0x12a;
		sine[3429] = 0x12b;
		sine[3430] = 0x12d;
		sine[3431] = 0x12f;
		sine[3432] = 0x130;
		sine[3433] = 0x132;
		sine[3434] = 0x134;
		sine[3435] = 0x135;
		sine[3436] = 0x137;
		sine[3437] = 0x139;
		sine[3438] = 0x13a;
		sine[3439] = 0x13c;
		sine[3440] = 0x13e;
		sine[3441] = 0x13f;
		sine[3442] = 0x141;
		sine[3443] = 0x143;
		sine[3444] = 0x144;
		sine[3445] = 0x146;
		sine[3446] = 0x148;
		sine[3447] = 0x14a;
		sine[3448] = 0x14b;
		sine[3449] = 0x14d;
		sine[3450] = 0x14f;
		sine[3451] = 0x150;
		sine[3452] = 0x152;
		sine[3453] = 0x154;
		sine[3454] = 0x156;
		sine[3455] = 0x157;
		sine[3456] = 0x159;
		sine[3457] = 0x15b;
		sine[3458] = 0x15d;
		sine[3459] = 0x15e;
		sine[3460] = 0x160;
		sine[3461] = 0x162;
		sine[3462] = 0x164;
		sine[3463] = 0x165;
		sine[3464] = 0x167;
		sine[3465] = 0x169;
		sine[3466] = 0x16b;
		sine[3467] = 0x16d;
		sine[3468] = 0x16e;
		sine[3469] = 0x170;
		sine[3470] = 0x172;
		sine[3471] = 0x174;
		sine[3472] = 0x175;
		sine[3473] = 0x177;
		sine[3474] = 0x179;
		sine[3475] = 0x17b;
		sine[3476] = 0x17d;
		sine[3477] = 0x17f;
		sine[3478] = 0x180;
		sine[3479] = 0x182;
		sine[3480] = 0x184;
		sine[3481] = 0x186;
		sine[3482] = 0x188;
		sine[3483] = 0x18a;
		sine[3484] = 0x18b;
		sine[3485] = 0x18d;
		sine[3486] = 0x18f;
		sine[3487] = 0x191;
		sine[3488] = 0x193;
		sine[3489] = 0x195;
		sine[3490] = 0x197;
		sine[3491] = 0x199;
		sine[3492] = 0x19a;
		sine[3493] = 0x19c;
		sine[3494] = 0x19e;
		sine[3495] = 0x1a0;
		sine[3496] = 0x1a2;
		sine[3497] = 0x1a4;
		sine[3498] = 0x1a6;
		sine[3499] = 0x1a8;
		sine[3500] = 0x1aa;
		sine[3501] = 0x1ac;
		sine[3502] = 0x1ae;
		sine[3503] = 0x1af;
		sine[3504] = 0x1b1;
		sine[3505] = 0x1b3;
		sine[3506] = 0x1b5;
		sine[3507] = 0x1b7;
		sine[3508] = 0x1b9;
		sine[3509] = 0x1bb;
		sine[3510] = 0x1bd;
		sine[3511] = 0x1bf;
		sine[3512] = 0x1c1;
		sine[3513] = 0x1c3;
		sine[3514] = 0x1c5;
		sine[3515] = 0x1c7;
		sine[3516] = 0x1c9;
		sine[3517] = 0x1cb;
		sine[3518] = 0x1cd;
		sine[3519] = 0x1cf;
		sine[3520] = 0x1d1;
		sine[3521] = 0x1d3;
		sine[3522] = 0x1d5;
		sine[3523] = 0x1d7;
		sine[3524] = 0x1d9;
		sine[3525] = 0x1db;
		sine[3526] = 0x1dd;
		sine[3527] = 0x1df;
		sine[3528] = 0x1e1;
		sine[3529] = 0x1e3;
		sine[3530] = 0x1e5;
		sine[3531] = 0x1e7;
		sine[3532] = 0x1e9;
		sine[3533] = 0x1eb;
		sine[3534] = 0x1ed;
		sine[3535] = 0x1ef;
		sine[3536] = 0x1f1;
		sine[3537] = 0x1f3;
		sine[3538] = 0x1f5;
		sine[3539] = 0x1f7;
		sine[3540] = 0x1f9;
		sine[3541] = 0x1fb;
		sine[3542] = 0x1fd;
		sine[3543] = 0x200;
		sine[3544] = 0x202;
		sine[3545] = 0x204;
		sine[3546] = 0x206;
		sine[3547] = 0x208;
		sine[3548] = 0x20a;
		sine[3549] = 0x20c;
		sine[3550] = 0x20e;
		sine[3551] = 0x210;
		sine[3552] = 0x212;
		sine[3553] = 0x215;
		sine[3554] = 0x217;
		sine[3555] = 0x219;
		sine[3556] = 0x21b;
		sine[3557] = 0x21d;
		sine[3558] = 0x21f;
		sine[3559] = 0x221;
		sine[3560] = 0x223;
		sine[3561] = 0x226;
		sine[3562] = 0x228;
		sine[3563] = 0x22a;
		sine[3564] = 0x22c;
		sine[3565] = 0x22e;
		sine[3566] = 0x230;
		sine[3567] = 0x232;
		sine[3568] = 0x235;
		sine[3569] = 0x237;
		sine[3570] = 0x239;
		sine[3571] = 0x23b;
		sine[3572] = 0x23d;
		sine[3573] = 0x23f;
		sine[3574] = 0x242;
		sine[3575] = 0x244;
		sine[3576] = 0x246;
		sine[3577] = 0x248;
		sine[3578] = 0x24a;
		sine[3579] = 0x24d;
		sine[3580] = 0x24f;
		sine[3581] = 0x251;
		sine[3582] = 0x253;
		sine[3583] = 0x255;
		sine[3584] = 0x258;
		sine[3585] = 0x25a;
		sine[3586] = 0x25c;
		sine[3587] = 0x25e;
		sine[3588] = 0x261;
		sine[3589] = 0x263;
		sine[3590] = 0x265;
		sine[3591] = 0x267;
		sine[3592] = 0x26a;
		sine[3593] = 0x26c;
		sine[3594] = 0x26e;
		sine[3595] = 0x270;
		sine[3596] = 0x273;
		sine[3597] = 0x275;
		sine[3598] = 0x277;
		sine[3599] = 0x279;
		sine[3600] = 0x27c;
		sine[3601] = 0x27e;
		sine[3602] = 0x280;
		sine[3603] = 0x283;
		sine[3604] = 0x285;
		sine[3605] = 0x287;
		sine[3606] = 0x289;
		sine[3607] = 0x28c;
		sine[3608] = 0x28e;
		sine[3609] = 0x290;
		sine[3610] = 0x293;
		sine[3611] = 0x295;
		sine[3612] = 0x297;
		sine[3613] = 0x29a;
		sine[3614] = 0x29c;
		sine[3615] = 0x29e;
		sine[3616] = 0x2a0;
		sine[3617] = 0x2a3;
		sine[3618] = 0x2a5;
		sine[3619] = 0x2a7;
		sine[3620] = 0x2aa;
		sine[3621] = 0x2ac;
		sine[3622] = 0x2af;
		sine[3623] = 0x2b1;
		sine[3624] = 0x2b3;
		sine[3625] = 0x2b6;
		sine[3626] = 0x2b8;
		sine[3627] = 0x2ba;
		sine[3628] = 0x2bd;
		sine[3629] = 0x2bf;
		sine[3630] = 0x2c1;
		sine[3631] = 0x2c4;
		sine[3632] = 0x2c6;
		sine[3633] = 0x2c9;
		sine[3634] = 0x2cb;
		sine[3635] = 0x2cd;
		sine[3636] = 0x2d0;
		sine[3637] = 0x2d2;
		sine[3638] = 0x2d4;
		sine[3639] = 0x2d7;
		sine[3640] = 0x2d9;
		sine[3641] = 0x2dc;
		sine[3642] = 0x2de;
		sine[3643] = 0x2e0;
		sine[3644] = 0x2e3;
		sine[3645] = 0x2e5;
		sine[3646] = 0x2e8;
		sine[3647] = 0x2ea;
		sine[3648] = 0x2ed;
		sine[3649] = 0x2ef;
		sine[3650] = 0x2f1;
		sine[3651] = 0x2f4;
		sine[3652] = 0x2f6;
		sine[3653] = 0x2f9;
		sine[3654] = 0x2fb;
		sine[3655] = 0x2fe;
		sine[3656] = 0x300;
		sine[3657] = 0x303;
		sine[3658] = 0x305;
		sine[3659] = 0x307;
		sine[3660] = 0x30a;
		sine[3661] = 0x30c;
		sine[3662] = 0x30f;
		sine[3663] = 0x311;
		sine[3664] = 0x314;
		sine[3665] = 0x316;
		sine[3666] = 0x319;
		sine[3667] = 0x31b;
		sine[3668] = 0x31e;
		sine[3669] = 0x320;
		sine[3670] = 0x323;
		sine[3671] = 0x325;
		sine[3672] = 0x328;
		sine[3673] = 0x32a;
		sine[3674] = 0x32d;
		sine[3675] = 0x32f;
		sine[3676] = 0x332;
		sine[3677] = 0x334;
		sine[3678] = 0x337;
		sine[3679] = 0x339;
		sine[3680] = 0x33c;
		sine[3681] = 0x33e;
		sine[3682] = 0x341;
		sine[3683] = 0x343;
		sine[3684] = 0x346;
		sine[3685] = 0x348;
		sine[3686] = 0x34b;
		sine[3687] = 0x34e;
		sine[3688] = 0x350;
		sine[3689] = 0x353;
		sine[3690] = 0x355;
		sine[3691] = 0x358;
		sine[3692] = 0x35a;
		sine[3693] = 0x35d;
		sine[3694] = 0x35f;
		sine[3695] = 0x362;
		sine[3696] = 0x365;
		sine[3697] = 0x367;
		sine[3698] = 0x36a;
		sine[3699] = 0x36c;
		sine[3700] = 0x36f;
		sine[3701] = 0x371;
		sine[3702] = 0x374;
		sine[3703] = 0x377;
		sine[3704] = 0x379;
		sine[3705] = 0x37c;
		sine[3706] = 0x37e;
		sine[3707] = 0x381;
		sine[3708] = 0x384;
		sine[3709] = 0x386;
		sine[3710] = 0x389;
		sine[3711] = 0x38b;
		sine[3712] = 0x38e;
		sine[3713] = 0x391;
		sine[3714] = 0x393;
		sine[3715] = 0x396;
		sine[3716] = 0x398;
		sine[3717] = 0x39b;
		sine[3718] = 0x39e;
		sine[3719] = 0x3a0;
		sine[3720] = 0x3a3;
		sine[3721] = 0x3a6;
		sine[3722] = 0x3a8;
		sine[3723] = 0x3ab;
		sine[3724] = 0x3ad;
		sine[3725] = 0x3b0;
		sine[3726] = 0x3b3;
		sine[3727] = 0x3b5;
		sine[3728] = 0x3b8;
		sine[3729] = 0x3bb;
		sine[3730] = 0x3bd;
		sine[3731] = 0x3c0;
		sine[3732] = 0x3c3;
		sine[3733] = 0x3c5;
		sine[3734] = 0x3c8;
		sine[3735] = 0x3cb;
		sine[3736] = 0x3cd;
		sine[3737] = 0x3d0;
		sine[3738] = 0x3d3;
		sine[3739] = 0x3d5;
		sine[3740] = 0x3d8;
		sine[3741] = 0x3db;
		sine[3742] = 0x3dd;
		sine[3743] = 0x3e0;
		sine[3744] = 0x3e3;
		sine[3745] = 0x3e6;
		sine[3746] = 0x3e8;
		sine[3747] = 0x3eb;
		sine[3748] = 0x3ee;
		sine[3749] = 0x3f0;
		sine[3750] = 0x3f3;
		sine[3751] = 0x3f6;
		sine[3752] = 0x3f9;
		sine[3753] = 0x3fb;
		sine[3754] = 0x3fe;
		sine[3755] = 0x401;
		sine[3756] = 0x403;
		sine[3757] = 0x406;
		sine[3758] = 0x409;
		sine[3759] = 0x40c;
		sine[3760] = 0x40e;
		sine[3761] = 0x411;
		sine[3762] = 0x414;
		sine[3763] = 0x416;
		sine[3764] = 0x419;
		sine[3765] = 0x41c;
		sine[3766] = 0x41f;
		sine[3767] = 0x421;
		sine[3768] = 0x424;
		sine[3769] = 0x427;
		sine[3770] = 0x42a;
		sine[3771] = 0x42c;
		sine[3772] = 0x42f;
		sine[3773] = 0x432;
		sine[3774] = 0x435;
		sine[3775] = 0x438;
		sine[3776] = 0x43a;
		sine[3777] = 0x43d;
		sine[3778] = 0x440;
		sine[3779] = 0x443;
		sine[3780] = 0x445;
		sine[3781] = 0x448;
		sine[3782] = 0x44b;
		sine[3783] = 0x44e;
		sine[3784] = 0x451;
		sine[3785] = 0x453;
		sine[3786] = 0x456;
		sine[3787] = 0x459;
		sine[3788] = 0x45c;
		sine[3789] = 0x45f;
		sine[3790] = 0x461;
		sine[3791] = 0x464;
		sine[3792] = 0x467;
		sine[3793] = 0x46a;
		sine[3794] = 0x46d;
		sine[3795] = 0x46f;
		sine[3796] = 0x472;
		sine[3797] = 0x475;
		sine[3798] = 0x478;
		sine[3799] = 0x47b;
		sine[3800] = 0x47d;
		sine[3801] = 0x480;
		sine[3802] = 0x483;
		sine[3803] = 0x486;
		sine[3804] = 0x489;
		sine[3805] = 0x48c;
		sine[3806] = 0x48e;
		sine[3807] = 0x491;
		sine[3808] = 0x494;
		sine[3809] = 0x497;
		sine[3810] = 0x49a;
		sine[3811] = 0x49d;
		sine[3812] = 0x49f;
		sine[3813] = 0x4a2;
		sine[3814] = 0x4a5;
		sine[3815] = 0x4a8;
		sine[3816] = 0x4ab;
		sine[3817] = 0x4ae;
		sine[3818] = 0x4b1;
		sine[3819] = 0x4b3;
		sine[3820] = 0x4b6;
		sine[3821] = 0x4b9;
		sine[3822] = 0x4bc;
		sine[3823] = 0x4bf;
		sine[3824] = 0x4c2;
		sine[3825] = 0x4c5;
		sine[3826] = 0x4c8;
		sine[3827] = 0x4ca;
		sine[3828] = 0x4cd;
		sine[3829] = 0x4d0;
		sine[3830] = 0x4d3;
		sine[3831] = 0x4d6;
		sine[3832] = 0x4d9;
		sine[3833] = 0x4dc;
		sine[3834] = 0x4df;
		sine[3835] = 0x4e1;
		sine[3836] = 0x4e4;
		sine[3837] = 0x4e7;
		sine[3838] = 0x4ea;
		sine[3839] = 0x4ed;
		sine[3840] = 0x4f0;
		sine[3841] = 0x4f3;
		sine[3842] = 0x4f6;
		sine[3843] = 0x4f9;
		sine[3844] = 0x4fc;
		sine[3845] = 0x4fe;
		sine[3846] = 0x501;
		sine[3847] = 0x504;
		sine[3848] = 0x507;
		sine[3849] = 0x50a;
		sine[3850] = 0x50d;
		sine[3851] = 0x510;
		sine[3852] = 0x513;
		sine[3853] = 0x516;
		sine[3854] = 0x519;
		sine[3855] = 0x51c;
		sine[3856] = 0x51f;
		sine[3857] = 0x522;
		sine[3858] = 0x524;
		sine[3859] = 0x527;
		sine[3860] = 0x52a;
		sine[3861] = 0x52d;
		sine[3862] = 0x530;
		sine[3863] = 0x533;
		sine[3864] = 0x536;
		sine[3865] = 0x539;
		sine[3866] = 0x53c;
		sine[3867] = 0x53f;
		sine[3868] = 0x542;
		sine[3869] = 0x545;
		sine[3870] = 0x548;
		sine[3871] = 0x54b;
		sine[3872] = 0x54e;
		sine[3873] = 0x551;
		sine[3874] = 0x554;
		sine[3875] = 0x557;
		sine[3876] = 0x55a;
		sine[3877] = 0x55d;
		sine[3878] = 0x55f;
		sine[3879] = 0x562;
		sine[3880] = 0x565;
		sine[3881] = 0x568;
		sine[3882] = 0x56b;
		sine[3883] = 0x56e;
		sine[3884] = 0x571;
		sine[3885] = 0x574;
		sine[3886] = 0x577;
		sine[3887] = 0x57a;
		sine[3888] = 0x57d;
		sine[3889] = 0x580;
		sine[3890] = 0x583;
		sine[3891] = 0x586;
		sine[3892] = 0x589;
		sine[3893] = 0x58c;
		sine[3894] = 0x58f;
		sine[3895] = 0x592;
		sine[3896] = 0x595;
		sine[3897] = 0x598;
		sine[3898] = 0x59b;
		sine[3899] = 0x59e;
		sine[3900] = 0x5a1;
		sine[3901] = 0x5a4;
		sine[3902] = 0x5a7;
		sine[3903] = 0x5aa;
		sine[3904] = 0x5ad;
		sine[3905] = 0x5b0;
		sine[3906] = 0x5b3;
		sine[3907] = 0x5b6;
		sine[3908] = 0x5b9;
		sine[3909] = 0x5bc;
		sine[3910] = 0x5bf;
		sine[3911] = 0x5c2;
		sine[3912] = 0x5c5;
		sine[3913] = 0x5c8;
		sine[3914] = 0x5cb;
		sine[3915] = 0x5ce;
		sine[3916] = 0x5d1;
		sine[3917] = 0x5d4;
		sine[3918] = 0x5d7;
		sine[3919] = 0x5da;
		sine[3920] = 0x5dd;
		sine[3921] = 0x5e0;
		sine[3922] = 0x5e3;
		sine[3923] = 0x5e6;
		sine[3924] = 0x5ea;
		sine[3925] = 0x5ed;
		sine[3926] = 0x5f0;
		sine[3927] = 0x5f3;
		sine[3928] = 0x5f6;
		sine[3929] = 0x5f9;
		sine[3930] = 0x5fc;
		sine[3931] = 0x5ff;
		sine[3932] = 0x602;
		sine[3933] = 0x605;
		sine[3934] = 0x608;
		sine[3935] = 0x60b;
		sine[3936] = 0x60e;
		sine[3937] = 0x611;
		sine[3938] = 0x614;
		sine[3939] = 0x617;
		sine[3940] = 0x61a;
		sine[3941] = 0x61d;
		sine[3942] = 0x620;
		sine[3943] = 0x623;
		sine[3944] = 0x626;
		sine[3945] = 0x629;
		sine[3946] = 0x62d;
		sine[3947] = 0x630;
		sine[3948] = 0x633;
		sine[3949] = 0x636;
		sine[3950] = 0x639;
		sine[3951] = 0x63c;
		sine[3952] = 0x63f;
		sine[3953] = 0x642;
		sine[3954] = 0x645;
		sine[3955] = 0x648;
		sine[3956] = 0x64b;
		sine[3957] = 0x64e;
		sine[3958] = 0x651;
		sine[3959] = 0x654;
		sine[3960] = 0x657;
		sine[3961] = 0x65b;
		sine[3962] = 0x65e;
		sine[3963] = 0x661;
		sine[3964] = 0x664;
		sine[3965] = 0x667;
		sine[3966] = 0x66a;
		sine[3967] = 0x66d;
		sine[3968] = 0x670;
		sine[3969] = 0x673;
		sine[3970] = 0x676;
		sine[3971] = 0x679;
		sine[3972] = 0x67c;
		sine[3973] = 0x67f;
		sine[3974] = 0x683;
		sine[3975] = 0x686;
		sine[3976] = 0x689;
		sine[3977] = 0x68c;
		sine[3978] = 0x68f;
		sine[3979] = 0x692;
		sine[3980] = 0x695;
		sine[3981] = 0x698;
		sine[3982] = 0x69b;
		sine[3983] = 0x69e;
		sine[3984] = 0x6a1;
		sine[3985] = 0x6a5;
		sine[3986] = 0x6a8;
		sine[3987] = 0x6ab;
		sine[3988] = 0x6ae;
		sine[3989] = 0x6b1;
		sine[3990] = 0x6b4;
		sine[3991] = 0x6b7;
		sine[3992] = 0x6ba;
		sine[3993] = 0x6bd;
		sine[3994] = 0x6c0;
		sine[3995] = 0x6c4;
		sine[3996] = 0x6c7;
		sine[3997] = 0x6ca;
		sine[3998] = 0x6cd;
		sine[3999] = 0x6d0;
		sine[4000] = 0x6d3;
		sine[4001] = 0x6d6;
		sine[4002] = 0x6d9;
		sine[4003] = 0x6dc;
		sine[4004] = 0x6e0;
		sine[4005] = 0x6e3;
		sine[4006] = 0x6e6;
		sine[4007] = 0x6e9;
		sine[4008] = 0x6ec;
		sine[4009] = 0x6ef;
		sine[4010] = 0x6f2;
		sine[4011] = 0x6f5;
		sine[4012] = 0x6f8;
		sine[4013] = 0x6fc;
		sine[4014] = 0x6ff;
		sine[4015] = 0x702;
		sine[4016] = 0x705;
		sine[4017] = 0x708;
		sine[4018] = 0x70b;
		sine[4019] = 0x70e;
		sine[4020] = 0x711;
		sine[4021] = 0x714;
		sine[4022] = 0x718;
		sine[4023] = 0x71b;
		sine[4024] = 0x71e;
		sine[4025] = 0x721;
		sine[4026] = 0x724;
		sine[4027] = 0x727;
		sine[4028] = 0x72a;
		sine[4029] = 0x72d;
		sine[4030] = 0x731;
		sine[4031] = 0x734;
		sine[4032] = 0x737;
		sine[4033] = 0x73a;
		sine[4034] = 0x73d;
		sine[4035] = 0x740;
		sine[4036] = 0x743;
		sine[4037] = 0x746;
		sine[4038] = 0x74a;
		sine[4039] = 0x74d;
		sine[4040] = 0x750;
		sine[4041] = 0x753;
		sine[4042] = 0x756;
		sine[4043] = 0x759;
		sine[4044] = 0x75c;
		sine[4045] = 0x75f;
		sine[4046] = 0x763;
		sine[4047] = 0x766;
		sine[4048] = 0x769;
		sine[4049] = 0x76c;
		sine[4050] = 0x76f;
		sine[4051] = 0x772;
		sine[4052] = 0x775;
		sine[4053] = 0x779;
		sine[4054] = 0x77c;
		sine[4055] = 0x77f;
		sine[4056] = 0x782;
		sine[4057] = 0x785;
		sine[4058] = 0x788;
		sine[4059] = 0x78b;
		sine[4060] = 0x78e;
		sine[4061] = 0x792;
		sine[4062] = 0x795;
		sine[4063] = 0x798;
		sine[4064] = 0x79b;
		sine[4065] = 0x79e;
		sine[4066] = 0x7a1;
		sine[4067] = 0x7a4;
		sine[4068] = 0x7a8;
		sine[4069] = 0x7ab;
		sine[4070] = 0x7ae;
		sine[4071] = 0x7b1;
		sine[4072] = 0x7b4;
		sine[4073] = 0x7b7;
		sine[4074] = 0x7ba;
		sine[4075] = 0x7be;
		sine[4076] = 0x7c1;
		sine[4077] = 0x7c4;
		sine[4078] = 0x7c7;
		sine[4079] = 0x7ca;
		sine[4080] = 0x7cd;
		sine[4081] = 0x7d0;
		sine[4082] = 0x7d4;
		sine[4083] = 0x7d7;
		sine[4084] = 0x7da;
		sine[4085] = 0x7dd;
		sine[4086] = 0x7e0;
		sine[4087] = 0x7e3;
		sine[4088] = 0x7e6;
		sine[4089] = 0x7ea;
		sine[4090] = 0x7ed;
		sine[4091] = 0x7f0;
		sine[4092] = 0x7f3;
		sine[4093] = 0x7f6;
		sine[4094] = 0x7f9;
		sine[4095] = 0x7fc;


		//=========== static DC value ===================
		u16 dataShifted;
		for(Index = 0; Index < npoints; Index++){
			dataShifted = sine[Index]<<4;
			TxPacket[Index*2] = (u8)(dataShifted & 0xFF);
			TxPacket[Index*2+1] = (u8)(dataShifted >> 8);
		}
		//===============================================

}


/*****************************************************************************/
/**
*
* This function transmits one packet non-blockingly through the DMA engine.
*
* @param	AxiDmaInstPtr points to the DMA engine instance
*
* @return	- XST_SUCCESS if the DMA accepts the packet successfully,
*		- XST_FAILURE otherwise.
*
* @note     None.
*
******************************************************************************/
static int sendDMApacket(XAxiDma * AxiDmaInstPtr, int debug_mode){
	XAxiDma_BdRing *TxRingPtr;
	u8 *TxPacket;
	u8 Value;
	XAxiDma_Bd *BdPtr;
	int Status;
	int Index;

	TxRingPtr = XAxiDma_GetTxRing(AxiDmaInstPtr);

	/* Create pattern in the packet to transmit */
	TxPacket = (u8 *) Packet;
	//Value = TEST_START_VALUE;
	Value = 0x01;

	fillTxPacketBuffer(MAX_PKT_LEN,TxPacket);

	/* Flush the SrcBuffer before the DMA transfer, in case the Data Cache
	 * is enabled
	 */
	Xil_DCacheFlushRange((UINTPTR)TxPacket, MAX_PKT_LEN);
#ifdef __aarch64__
	Xil_DCacheFlushRange((UINTPTR)RX_BUFFER_BASE, MAX_PKT_LEN);
#endif


	/* Allocate a BD */
	Status = XAxiDma_BdRingAlloc(TxRingPtr, 1, &BdPtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Set up the BD using the information of the packet to transmit */
	Status = XAxiDma_BdSetBufAddr(BdPtr, (UINTPTR) Packet);
	if (Status != XST_SUCCESS) {
		xil_printf(" *** Error: Tx set buffer addr %x on BD %x failed %d\r\n",
		    (UINTPTR)Packet, (UINTPTR)BdPtr, Status);
		return XST_FAILURE;
	}

	Status = XAxiDma_BdSetLength(BdPtr, MAX_PKT_LEN, TxRingPtr->MaxTransferLen);
	if (Status != XST_SUCCESS) {
		xil_printf(" *** Error: Tx set length %d on BD %x failed %d\r\n",
		    MAX_PKT_LEN, (UINTPTR)BdPtr, Status);
		return XST_FAILURE;
	}

#if (XPAR_AXIDMA_0_SG_INCLUDE_STSCNTRL_STRM == 1)
	Status = XAxiDma_BdSetAppWord(BdPtr, XAXIDMA_LAST_APPWORD, MAX_PKT_LEN);

	/* If Set app length failed, it is not fatal */
	if (Status != XST_SUCCESS) {
		xil_printf("Set app word failed with %d\r\n", Status);
	}
#endif

	/* For single packet, both SOF and EOF are to be set
	 */
	XAxiDma_BdSetCtrl(BdPtr, XAXIDMA_BD_CTRL_TXEOF_MASK |
						XAXIDMA_BD_CTRL_TXSOF_MASK);

	XAxiDma_BdSetId(BdPtr, (UINTPTR)Packet);

	/* Give the BD to DMA to kick off the transmission. */
	Status = XAxiDma_BdRingToHw(TxRingPtr, 1, BdPtr);
	if (Status != XST_SUCCESS) {
		xil_printf("to hw failed %d\r\n", Status);
		return XST_FAILURE;
	}
	return XST_SUCCESS;
}


/*
*
* This function checks data buffer after the DMA transfer is finished.
*
* @param	None
*
* @return	- XST_SUCCESS if validation is successful
*		- XST_FAILURE if validation is failure.
*
* @note		None.
*
******************************************************************************/
static int SaveData(int debug_mode)
{
	u8 *RxPacket;
	int Index = 0;
	int idx = 0;
	u8 Value;
	Xuint32 m0, m1, v0, v1;

	RxPacket = (u8 *) RX_BUFFER_BASE;
	Value = TEST_START_VALUE;

	/* Invalidate the DestBuffer before receiving the data, in case the
	 * Data Cache is enabled
	 */
#ifndef __aarch64__
	Xil_DCacheInvalidateRange((UINTPTR)RxPacket, MAX_PKT_LEN);
	Xil_DCacheInvalidateRange((Xuint32)outputDataBuffer, MAX_PKT_LEN);
	Xil_DCacheFlushRange((Xuint32)outputDataBuffer, MAX_PKT_LEN);
#endif

   idx = 0;
	for(Index = 0; Index < MAX_PKT_LEN; Index+=4) {
		m0 = ((unsigned int)RxPacket[Index+1]<<8) | (0x00FF & (unsigned int)RxPacket[Index]);
		m1 = ((unsigned int)RxPacket[Index+3]<<8) | (0x00FF & (unsigned int)RxPacket[Index+2]);
		v0 = m0 >> 2;
		v1 = m1 >> 2;
		//xil_printf("Sample: %d: %x%x\r\n",idx,v0,v1);
		outputDataBuffer[idx] = (v0 << 16) | (0x0000FFFF & v1);
		//xil_printf("Index: %d: %x\r\n",idx,outputDataBuffer[idx]);
		idx++;
	}
	numberDataSamples = idx*2;
	//xil_printf("Number of Samples: %d:\r\n",idx*2);
	return XST_SUCCESS;
}


static int receiveDMApacket(XAxiDma * AxiDmaInstPtr, int debug_mode)
{
	XAxiDma_BdRing *RxRingPtr;

	XAxiDma_Bd *BdPtr;
	int ProcessedBdCount;
	int FreeBdCount;
	int Status;


	RxRingPtr = XAxiDma_GetRxRing(AxiDmaInstPtr);

	/* Flush the SrcBuffer before the DMA transfer, in case the Data Cache
	 * is enabled
	 */
	Xil_DCacheFlushRange((UINTPTR)TX_BUFFER_BASE, MAX_PKT_LEN);

#ifdef __aarch64__
	Xil_DCacheFlushRange((UINTPTR)RX_BUFFER_BASE, MAX_PKT_LEN);
#endif
	/* Wait until the data has been received by the Rx channel */
	while ((ProcessedBdCount = XAxiDma_BdRingFromHw(RxRingPtr,
						       XAXIDMA_ALL_BDS, &BdPtr)) == 0) {
	}

	setGyroChannelControl(0x00000000);
    SaveData(0);


	/* Free all processed RX BDs for future transmission */
	Status = XAxiDma_BdRingFree(RxRingPtr, ProcessedBdCount, BdPtr);
	if (Status != XST_SUCCESS) {
		xil_printf("Failed to free %d rx BDs %d\r\n",
		    ProcessedBdCount, Status);
		return XST_FAILURE;
	}

	/* Return processed BDs to RX channel so we are ready to receive new
	 * packets:
	 *    - Allocate all free RX BDs
	 *    - Pass the BDs to RX channel
	 */
	FreeBdCount = XAxiDma_BdRingGetFreeCnt(RxRingPtr);
	Status = XAxiDma_BdRingAlloc(RxRingPtr, FreeBdCount, &BdPtr);
	if (Status != XST_SUCCESS) {
		xil_printf("bd alloc failed\r\n");
		return XST_FAILURE;
	}

	Status = XAxiDma_BdRingToHw(RxRingPtr, FreeBdCount, BdPtr);
	if (Status != XST_SUCCESS) {
		xil_printf("Submit %d rx BDs failed %d\r\n", FreeBdCount, Status);
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}


/*****************************************************************************/
/**
*
* This function waits until the DMA transaction is finished, checks data,
* and cleans up.
*
* @param	None
*
* @return	- XST_SUCCESS if DMA transfer is successful and data is correct,
*		- XST_FAILURE if fails.
*
* @note		None.
*
******************************************************************************/
static int CheckDmaResult(XAxiDma * AxiDmaInstPtr, int debug_mode, int skip_tx)
{
	XAxiDma_BdRing *TxRingPtr;
	XAxiDma_BdRing *RxRingPtr;
	XAxiDma_Bd *BdPtr;
	int ProcessedBdCount;
	int FreeBdCount;
	int Status;

	TxRingPtr = XAxiDma_GetTxRing(AxiDmaInstPtr);
	RxRingPtr = XAxiDma_GetRxRing(AxiDmaInstPtr);

	if(skip_tx == 0){
	/* Wait until the one BD TX transaction is done */
	while ((ProcessedBdCount = XAxiDma_BdRingFromHw(TxRingPtr,
						       XAXIDMA_ALL_BDS,
						       &BdPtr)) == 0) {  }

	  /* Free all processed TX BDs for future transmission */
	  Status = XAxiDma_BdRingFree(TxRingPtr, ProcessedBdCount, BdPtr);
	  if (Status != XST_SUCCESS) {
		xil_printf("Failed to free %d tx BDs %d\r\n",
		    ProcessedBdCount, Status);
		return XST_FAILURE;
	  }
	}
	/* Wait until the data has been received by the Rx channel */
	while ((ProcessedBdCount = XAxiDma_BdRingFromHw(RxRingPtr,
						       XAXIDMA_ALL_BDS, &BdPtr)) == 0) {
	}

	/* Check received data */
	if (SaveData(1) != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Free all processed RX BDs for future transmission */
	Status = XAxiDma_BdRingFree(RxRingPtr, ProcessedBdCount, BdPtr);
	if (Status != XST_SUCCESS) {
		xil_printf("Failed to free %d rx BDs %d\r\n",
		    ProcessedBdCount, Status);
		return XST_FAILURE;
	}

	/* Return processed BDs to RX channel so we are ready to receive new
	 * packets:
	 *    - Allocate all free RX BDs
	 *    - Pass the BDs to RX channel
	 */
	FreeBdCount = XAxiDma_BdRingGetFreeCnt(RxRingPtr);
	Status = XAxiDma_BdRingAlloc(RxRingPtr, FreeBdCount, &BdPtr);
	if (Status != XST_SUCCESS) {
		xil_printf("bd alloc failed\r\n");
		return XST_FAILURE;
	}

	Status = XAxiDma_BdRingToHw(RxRingPtr, FreeBdCount, BdPtr);
	if (Status != XST_SUCCESS) {
		xil_printf("Submit %d rx BDs failed %d\r\n", FreeBdCount, Status);
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}


// --------------------------------------------------------------------------
int receiveDMApackets(int num_packets){
	int i;



	for(i = 0; i < num_packets; i++){

	  Status = receiveDMApacket(&AxiDma, 0);
	  if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	  }

	}

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}
// --------------------------------------------------------------------------
int sendDMApackets(int num_packets){
	int i;

	for(i = 0; i < num_packets; i++){
	  Status = sendDMApacket(&AxiDma, 0);
	  if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	  }
	}
	if (Status != XST_SUCCESS) {
	  return XST_FAILURE;
	}
	return XST_SUCCESS;
}

// June 5, 2019
// this function reset the FIFO, sets the packet size
// and receives 1 packet of data by activating
// the input channel.
// The argument dictates the packet size in number of
// samples.
// The clock of the channel is now set to be the maximum
// frequency.

void acquireSamples(int packet_size){

	// reset the FIFO and the CHannels
	resetGyroTxFIFO();
	resetGyroRxFIFO();

	setGyroChannelConfiguration(0x80000000);
	setGyroChannelConfiguration(0x00000000);

	// bit 17:16 is to divide clock by 2/4/8.
	if(packet_size == 64)
	  setGyroChannelConfiguration(0x00000000);
	if(packet_size == 128)
	  setGyroChannelConfiguration(0x00001000);
	if(packet_size == 256)
	  setGyroChannelConfiguration(0x00002000);
	if(packet_size == 512)
	  setGyroChannelConfiguration(0x00003000);
	if(packet_size == 1024)
	  setGyroChannelConfiguration(0x00004000);
	if(packet_size == 2048)
	  setGyroChannelConfiguration(0x00005000);
	if(packet_size == 4096)
	  setGyroChannelConfiguration(0x00006000);
	if(packet_size == 8192)
	  setGyroChannelConfiguration(0x00007000);

	setGyroChannelControl(0x00000000);

	// activate the output and the input shift registers
	setGyroChannelControl(0x00000010);
	receiveDMApackets(1);
	setGyroChannelControl(0x00000000);

}
// -------------------------------------------------------------------
int sendPacketButton(void){
	sendDMApackets(1);
	//setGyroTxFIFOLooping();
	setGyroChannelControl(0x00000001);
	//nops(100000);
	//setGyroChannelControl(0x00000000);
	return 1;
 }

 // -------------------------------------------------------------------
int receivePacketButton(void){

//	XAxiDma_BdRing *RxRingPtr;
//	XAxiDma_Bd *BdPtr;
//	int ProcessedBdCount;
//	int FreeBdCount;
//	int Status;
	int i;

	//Status = RxSetup(&AxiDma); // ####

	resetGyroRxFIFO();

	for (i=0; i<NUM_RXFIFO_READS_REQUIRED;i++)
	{
		setGyroChannelControl(0x00000010);

		//======================================================
		// remove this later ---only added for calibration testing
		nops(100000);
		writeSPI_non_blocking(6,0x0e); // set calibration bit
		//======================================================

		nops(10000000); // this is the value for DIV 1

		//======================================================
		// remove this later ---only added for calibration testing
		writeSPI_non_blocking(6,0x02); // clear calibration bit
		//======================================================

		setGyroChannelControl(0x00000000);
		receiveDMApacket(&AxiDma,0);

		setGyroChannelControl(0x00000010);

		//======================================================
		// remove this later ---only added for calibration testing
		nops(100000);
		writeSPI_non_blocking(6,0x0e); // set calibration bit
		//======================================================

		nops(10000000); // this is the value for DIV 1

		//======================================================
		// remove this later ---only added for calibration testing
		writeSPI_non_blocking(6,0x02); // clear calibration bit
		//======================================================

		setGyroChannelControl(0x00000000);
		receiveDMApacket(&AxiDma,0);
	}
	return 1;
}
// -------------------------------------------------------------------
int initDMADevice(void){

	openDMADevice();

	Status = TxSetup(&AxiDma);
	if (Status != XST_SUCCESS) {
	   return XST_FAILURE;
	}
	else {
		 xil_printf("TxSetup completed. \r\n");
	}

	Status = RxSetup(&AxiDma);
	if (Status != XST_SUCCESS) {
	   return XST_FAILURE;
	}
	else {
		 xil_printf("RxSetup completed. \r\n");
	}

	return XST_SUCCESS;
}
// -------------------------------------------------------------------
int test_DMA_loopback( int num_packets, int debug_mode){
	int i;

    initDMADevice();

	for(i = 0; i < num_packets; i++){
	  /* Send a packet */

	  Status = sendDMApacket(&AxiDma, i);

	  if (Status != XST_SUCCESS) {
		  xil_printf(" Failed sending packet number: %d\r\n",i+1);
		return XST_FAILURE;
	  }


	  if(i == 0){
    setGyroChannelControl(0x00000011);
	  }

	  /* Check DMA transfer result */


			Status = CheckDmaResult(&AxiDma, debug_mode, 1);
	  if (Status != XST_SUCCESS) {
		xil_printf(" Failed reading packet number: %d\r\n",1);
		return XST_FAILURE;
	  }


	}


	xil_printf(" >>> Successfully ran AXI DMA SG Polling Example\r\n");
	xil_printf("--- Exiting DMA Loopback main() --- \r\n");

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

// -------------------------------------------------------------------
void nops(unsigned int num) {
    int i;
    for(i = 0; i < num; i++) {
        asm("nop");
    }
}
// -------------------------------------------------------------------




//------------------------------------------------------------
int SetupUartPs(XScuGic *IntcInstPtr, XUartPs *UartInstPtr,
			u16 DeviceId, u16 UartIntrId)
{
	int Status;
	XUartPs_Config *Config;
	u32 IntrMask;


	/*
	 * Initialize the UART driver so that it's ready to use
	 * Look up the configuration in the config table, then initialize it.
	 */
	Config = XUartPs_LookupConfig(DeviceId);
	if (NULL == Config) {
		return XST_FAILURE;
	}

	Status = XUartPs_CfgInitialize(UartInstPtr, Config, Config->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Check hardware build */
	Status = XUartPs_SelfTest(UartInstPtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Connect the UART to the interrupt subsystem such that interrupts
	 * can occur. This function is application specific.
	 */
	Status = SetupUartInterruptSystem(IntcInstPtr, UartInstPtr, UartIntrId);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Setup the handlers for the UART that will be called from the
	 * interrupt context when data has been sent and received, specify
	 * a pointer to the UART driver instance as the callback reference
	 * so the handlers are able to access the instance data
	 */
	XUartPs_SetHandler(UartInstPtr, (XUartPs_Handler)UartPsISR, UartInstPtr);

	/*
	 * Enable the interrupt of the UART so interrupts will occur, setup
	 * a local loopback so data that is sent will be received.
	 */
	IntrMask =
		XUARTPS_IXR_TOUT | XUARTPS_IXR_PARITY | XUARTPS_IXR_FRAMING |
		XUARTPS_IXR_OVER | XUARTPS_IXR_TXEMPTY | XUARTPS_IXR_RXFULL |
		XUARTPS_IXR_RXOVR;

	if (UartInstPtr->Platform == XPLAT_ZYNQ_ULTRA_MP) {
		IntrMask |= XUARTPS_IXR_RBRK;
	}

	XUartPs_SetInterruptMask(UartInstPtr, IntrMask);

	XUartPs_SetOperMode(UartInstPtr, XUARTPS_OPER_MODE_NORMAL);

	/*
	 * Set the receiver timeout. If it is not set, and the last few bytes
	 * of data do not trigger the over-water or full interrupt, the bytes
	 * will not be received. By default it is disabled.
	 *
	 * The setting of 8 will timeout after 8 x 4 = 32 character times.
	 * Increase the time out value if baud rate is high, decrease it if
	 * baud rate is low.
	 */
	XUartPs_SetRecvTimeout(UartInstPtr, 8);

	return XST_SUCCESS;
}
//------------------------------------------------------------


//------------------------------------------------------------
void UartPsISR(void *CallBackRef, u32 Event, unsigned int EventData)
{
//	xil_printf("IRQ handler!\n");

	/* All of the data has been sent */
	if (Event == XUARTPS_EVENT_SENT_DATA) {
//		xil_printf("1\n");
	}

	/* All of the data has been received */
	if (Event == XUARTPS_EVENT_RECV_DATA) {
//		xil_printf("2\n");
		state |= SERVICE_UART;
	}

	/*
	 * Data was received, but not the expected number of bytes, a
	 * timeout just indicates the data stopped for 8 character times
	 */
	if (Event == XUARTPS_EVENT_RECV_TOUT) {
//		xil_printf("3\n");
	}

	/*
	 * Data was received with an error, keep the data but determine
	 * what kind of errors occurred
	 */
	if (Event == XUARTPS_EVENT_RECV_ERROR) {
//		xil_printf("4\n");
	}

	/*
	 * Data was received with an parity or frame or break error, keep the data
	 * but determine what kind of errors occurred. Specific to Zynq Ultrascale+
	 * MP.
	 */
	if (Event == XUARTPS_EVENT_PARE_FRAME_BRKE) {
//		xil_printf("5\n");
	}

	/*
	 * Data was received with an overrun error, keep the data but determine
	 * what kind of errors occurred. Specific to Zynq Ultrascale+ MP.
	 */
	if (Event == XUARTPS_EVENT_RECV_ORERR) {
//		xil_printf("6\n");
	}
}
//------------------------------------------------------------


//------------------------------------------------------------
static int SetupUartInterruptSystem(XScuGic *IntcInstancePtr,
				XUartPs *UartInstancePtr,
				u16 UartIntrId)
{
	int Status;

	XScuGic_Config *IntcConfig; /* Config for interrupt controller */

	/* Initialize the interrupt controller driver */
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	if (NULL == IntcConfig) {
		return XST_FAILURE;
	}

	Status = XScuGic_CfgInitialize(IntcInstancePtr, IntcConfig,
					IntcConfig->CpuBaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Connect the interrupt controller interrupt handler to the
	 * hardware interrupt handling logic in the processor.
	 */
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
				(Xil_ExceptionHandler) XScuGic_InterruptHandler,
				IntcInstancePtr);

	/*
	 * Connect a device driver handler that will be called when an
	 * interrupt for the device occurs, the device driver handler
	 * performs the specific interrupt processing for the device
	 */
	Status = XScuGic_Connect(IntcInstancePtr, UartIntrId,
				  (Xil_ExceptionHandler) XUartPs_InterruptHandler,
				  (void *) UartInstancePtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Enable the interrupt for the device */
	XScuGic_Enable(IntcInstancePtr, UartIntrId);


	/* Enable interrupts */
	 Xil_ExceptionEnable();


	return XST_SUCCESS;
}
//------------------------------------------------------------


//------------------------------------------------------------
void read_uart_bytes(void)
{
	u8 numBytesReceived = 0;
	u16 numPoints;
	unsigned int commandByte,regAddr,regData;

	// loop through Uart Rx buffer and store received data
	while (XUartPs_IsReceiveData(UART_BASEADDR))
	{
		UartRxData[numBytesReceived++] = XUartPs_ReadReg(UART_BASEADDR,
					    					XUARTPS_FIFO_OFFSET);
	}

	//take first received byte as the command
	commandByte = (unsigned int)UartRxData[0];

	// check received byte for valid command
	switch (commandByte){

		case (CMD_READ_DATA):
			send_Tx_data_over_UART(get_num_data_points(UartRxData));
			break;

		case (CMD_READ_PACKETS):
			send_data_over_UART(get_num_data_points(UartRxData),(u8*)outputDataBuffer);
			//send_data_over_UART(get_num_data_points(UartRxData),(u8*)RX_BUFFER_BASE);
			break;

		case (CMD_LOAD_SAWTOOTH_UP_DATA):
			load_sawtooth_up_data();
			break;

		case (CMD_LOAD_SAWTOOTH_DOWN_DATA):
			load_sawtooth_down_data();
			break;

		case (CMD_READ_REGISTER):
			//verify address byte was received after command byte
			if (numBytesReceived<2)
			{
				return;
			}
			regAddr = (unsigned int)UartRxData[1];
			readSPI(&regData,regAddr);
			char *c = (char*)&regData;
			xil_printf("%c%c",*(c+1),*c); //send high byte first
			break;

		case (CMD_WRITE_REGISTER):
			//verify address byte, data bytes(2) received after command byte
			if (numBytesReceived<4)
			{
				return;
			}
			regAddr = (unsigned int)UartRxData[1];
			regData = (UartRxData[2]<<8) | UartRxData[3];
			writeSPI_non_blocking(regAddr,regData);
			break;

		case (CMD_PROG_OTP_CHIP_ADDR):
			//verify 3 bytes for chipID received after command byte
			if (numBytesReceived<4)
			{
				return;
			}
		send_byte_over_UART(ProgramOTP_chipID( (UartRxData[1]<<16) |
				(UartRxData[2]<<8) | UartRxData[3]));
			break;

		case (CMD_PROG_OTP_VBG_TRIM):
			//verify 1 byte for trim value received after command byte
			if (numBytesReceived<2)
			{
				return;
			}
		send_byte_over_UART(ProgramOTP_VbgTrim(UartRxData[1]));
			break;

		case (CMD_CAL_ADC0):
			run_ADC0_calibration();
			break;

		case (CMD_CAL_ADC1):
			run_ADC1_calibration();
			break;

		case (CMD_READ_ADC0_CAL):
			read_ADC0_cal_data();

			//8 16-bit cal values so send 16 bytes
			send_data_over_UART(16,(u8*)ADC_calData);
			break;

		case (CMD_READ_ADC1_CAL):
			read_ADC1_cal_data();

			//8 16-bit cal values so send 16 bytes
			send_data_over_UART(16,(u8*)ADC_calData);
			break;

		case (CMD_FILL_DAC_TXFIFO):
			sendPacketButton();
			break;

		case (CMD_START_ADC_ACQUISITIONS):
			receivePacketButton();
			send_byte_over_UART(RESPONSE_ADC_ACQUIRE_DONE);
			break;

		case (CMD_FPGA_ALL_OUTPUTS_LOW):
			disableSPI();
			disableGyroChannel();
			FPGA_outputs_state = 2;		// 1=on, 2=off
			break;

		case (CMD_FPGA_ALL_OUTPUTS_ENABLED):
			enableSPI();
			enableGyroChannel();
			FPGA_outputs_state = 1;		// 1=on, 2=off
			break;

		case (CMD_FPGA_GET_OUTPUTS_STATE):
			send_byte_over_UART(FPGA_outputs_state);
			break;

		case (CMD_RUN_TADC_CONVERSIONS):
			//verify 4 bytes received(command and 3 data bytes after)
			if (numBytesReceived<4)
			{
				return;
			}

			// first byte received is command, second byte is signal to measure,
			// third and fourth bytes are 16-bit number of measurements MSbyte(3rd) LSbyte(4th)
			numPoints = (u16)((UartRxData[2]<<8)+(UartRxData[3]));
			if (numPoints > MAX_TADC_RESULTS_SIZE)
			{
				numPoints = MAX_TADC_RESULTS_SIZE;
			}

			fill_testADC_results_array((u16)(UartRxData[1]<<8),numPoints);
			send_data_over_UART(numPoints*2,(u8*)testADCresults);
			break;

		case (CMD_ENABLE_HSI_SIGNALS):
			enableHSIGyroChannel();
			break;

		case (CMD_DISABLE_HSI_SIGNALS):
			disableHSIGyroChannel();
			break;

		case (CMD_GET_MCLK_DIV):
			send_byte_over_UART( (u8)(MCK_div_setting>>12) );
			break;

		case (CMD_SET_MCLK_DIV):
			//verify clock division setting byte was received after command byte
			if (numBytesReceived<2)
			{
				return;
			}

			// second byte received has the division setting
			changeMCLKdivision(UartRxData[1]);

			// use new variable in call to configuration function
			setGyroChannelConfiguration(MCK_div_setting | packet_size_setting |
					HSI_input_channel_setting | HSI_output_channel_setting);
			break;

		case (CMD_GET_SPICLK_DIV):
			send_byte_over_UART( (u8)(MCK_div_setting>>12) );
			break;

		case (CMD_SET_SPICLK_DIV):
			//verify clock division setting byte was received after command byte
			if (numBytesReceived<2)
			{
				return;
			}

			// second byte received has the division setting
			changeSPIclockDivision(UartRxData[1]);

			// use new variable in call to configuration function
			setSPIClockDivision(SPI_clock_division_setting);
			break;

		case (CMD_GET_PACKET_SIZE):
			send_byte_over_UART( (u8)(packet_size_setting>>12) );
			break;

		case (CMD_SET_PACKET_SIZE):
			//verify packet size setting byte was received after command byte
			if (numBytesReceived<2)
			{
				return;
			}

			// second byte received has the packet size setting
			packet_size_setting = (u32)UartRxData[1] << 12;

			// use new variable in call to configuration function
			setGyroChannelConfiguration(MCK_div_setting | packet_size_setting |
					HSI_input_channel_setting | HSI_output_channel_setting);
			break;

		case (CMD_GET_DAC_SELECTION):
			send_byte_over_UART( (u8)HSI_output_channel_setting );
			break;

		case (CMD_SET_DAC_SELECTION):
			//verify DAC selection setting byte was received after command byte
			if (numBytesReceived<2)
			{
				return;
			}

			// second byte received has the DAC selection
			HSI_output_channel_setting = UartRxData[1];

			// use new variable in call to configuration function
			setGyroChannelConfiguration(MCK_div_setting | packet_size_setting |
					HSI_input_channel_setting | HSI_output_channel_setting);
			break;

		case (CMD_GET_ADC_SELECTION):
			send_byte_over_UART( (u8)HSI_input_channel_setting );
			break;

		case (CMD_SET_ADC_SELECTION):
			//verify ADC selection setting byte was received after command byte
			if (numBytesReceived<2)
			{
				return;
			}

			// second byte received has the DAC selection
			changeHSI_ADC_selection(UartRxData[1]);

			// use new variable in call to configuration function
			setGyroChannelConfiguration(MCK_div_setting | packet_size_setting |
					HSI_input_channel_setting | HSI_output_channel_setting);
			break;

		case (CMD_GET_CONFIG_SETTINGS):
			sendConfigBytesOverUart();
			break;


	}
}
//------------------------------------------------------------


//------------------------------------------------------------
void sendConfigBytesOverUart(void)
{
	send_byte_over_UART( (u8)HSI_output_channel_setting );		//DAC channel mux selection
	send_byte_over_UART( (u8)(HSI_input_channel_setting>>4) );	//ADC channel mux selection
	send_byte_over_UART( (u8)(MCK_div_setting>>16) );
	send_byte_over_UART( (u8)SPI_clock_division_setting );
	send_byte_over_UART( (u8)(packet_size_setting>>12) );

}
//------------------------------------------------------------


//------------------------------------------------------------
void changeHSI_ADC_selection(u8 selection)
{
	switch (selection){
		case (0):
		HSI_input_channel_setting = CONFIG_INPUT_CHANNEL_HSIA0;
			break;
		case (1):
		HSI_input_channel_setting = CONFIG_INPUT_CHANNEL_HSIA1;
			break;
	}
}
//------------------------------------------------------------


//------------------------------------------------------------
void changeSPIclockDivision(u8 divSetting)
{
	switch (divSetting){
		case (DIV_1):
		SPI_clock_division_setting = CONFIG_SPI_CLK_DIV_1;
			break;
		case (DIV_2):
		SPI_clock_division_setting = CONFIG_SPI_CLK_DIV_2;
			break;
		case (DIV_4):
		SPI_clock_division_setting = CONFIG_SPI_CLK_DIV_4;
			break;
		case (DIV_8):
		SPI_clock_division_setting = CONFIG_SPI_CLK_DIV_8;
			break;
	}
}
//------------------------------------------------------------


//------------------------------------------------------------
void changeMCLKdivision(u8 divSetting)
{
	switch (divSetting){
		case (DIV_1):
			MCK_div_setting = CONFIG_MCK_DIV_1;
			break;
		case (DIV_2):
			MCK_div_setting = CONFIG_MCK_DIV_2;
			break;
		case (DIV_4):
			MCK_div_setting = CONFIG_MCK_DIV_4;
			break;
		case (DIV_8):
			MCK_div_setting = CONFIG_MCK_DIV_8;
			break;
		case (DIV_16):
			MCK_div_setting = CONFIG_MCK_DIV_16;
			break;
		case (DIV_32):
			MCK_div_setting = CONFIG_MCK_DIV_32;
			break;
		case (DIV_64):
			MCK_div_setting = CONFIG_MCK_DIV_64;
			break;
		case (DIV_128):
			MCK_div_setting = CONFIG_MCK_DIV_128;
			break;
	}
}
//------------------------------------------------------------



//------------------------------------------------------------
void run_ADC0_calibration(void)
{
	unsigned int reg0,reg4,reg5,reg6,reg7,reg0_RO;
	unsigned int newReg4val = 0;
	unsigned int newReg6val = 0;
	u8	reg4changed = 0;
	u8  reg5changed = 0;
	u8  reg7changed = 0;
	u16 numDoneChecks = 0; 	// use this counter to see how many reads of the
							// calibration flag needed until done

	//read all necessary registers here
	readSPI(&reg4,4);
	readSPI(&reg5,5);
	readSPI(&reg6,6);
	readSPI(&reg7,7);

	//ensure ADC0_TEST_SEL is set to normal operation
	if (reg7 & 0xC000)
	{
		reg7changed = 1;
		writeSPI_non_blocking(7,0x00);
	}

	//ensure a TIIA_VGSW bit is set, in reg4[7:4]
	if (!(reg4 & 0x00F0))
	{
		reg4changed = 1;
		newReg4val = reg4 | 0xF0;
	}

	//ensure TIIA is enabled, reg4 bit0
	if (!(reg4 & 0x0001))
	{
		reg4changed = 1;
		newReg4val = newReg4val | 0x1;
	}

	//change reg 4 if needed
	if (reg4changed) writeSPI_non_blocking(4,newReg4val);

	//ensure VGA is enabled, reg5 bit0
	if (!(reg5 & 0x1))
	{
		reg5changed = 1;
		writeSPI_non_blocking(5,reg5|0x1);
	}

	//ensure ADC0 is enabled, reg6 bit1
	if (!(reg6 & 0x2))
	{
		newReg6val = reg6|0x2;
		writeSPI_non_blocking(6,newReg6val);
	}

	//if ADC0 cal bit is on turn it off, reg6 bit2
	if (reg6 & 0x4)
	{
		newReg6val &= 0xFFFB;
		writeSPI_non_blocking(6,newReg6val);
	}

	//set reg0 readback mode to read-only to see when cal is done
	readSPI(&reg0,0);
	writeSPI_non_blocking(0,reg0|0x200);

	//to run cal turn on reg6 bit2
	writeSPI_non_blocking(6,newReg6val|0x4);

	//store reg0 read-only data for initial while loop test
	readSPI(&reg0_RO,0);

	//wait until cal is done, reg0 readback mode bit0=0 during cal
	while (~reg0_RO & 0x1)
	{
		numDoneChecks++;
		readSPI(&reg0_RO,0);
	}

	//restore register 6 with calibration bit off
	writeSPI_non_blocking(6,reg6&0xFFFB);

	//restore registers 4,5,7
	if (reg4changed) writeSPI_non_blocking(4,reg4);
	if (reg5changed) writeSPI_non_blocking(5,reg5);
	if (reg7changed) writeSPI_non_blocking(7,reg7);

	//register 0 back into normal readback mode
	writeSPI_non_blocking(0,reg0&0xFDFF);
}
//------------------------------------------------------------


//------------------------------------------------------------
void run_ADC1_calibration(void)
{
	unsigned int reg0,reg8,reg9,reg10,reg11,reg0_RO;
	unsigned int newreg8val = 0;
	unsigned int newreg10val = 0;
	u16 numDoneChecks = 0; 	// use this counter to see how many reads of the
							// calibration flag needed until done
	u8	reg8changed = 0;
	u8  reg9changed = 0;
	u8  reg11changed = 0;

	//read all necessary registers here
	readSPI(&reg8,8);
	readSPI(&reg9,9);
	readSPI(&reg10,10);
	readSPI(&reg11,11);

	//ensure ADC1_TEST_SEL is set to normal operation
	if (reg11 & 0xC000)
	{
		reg11changed = 1;
		writeSPI_non_blocking(11,0x00);
	}

	//ensure a TIIA_VGSW bit is set, in reg8[7:4]
	if (!(reg8 & 0x00F0))
	{
		reg8changed = 1;
		newreg8val = reg8 | 0xF0;
	}

	//ensure TIIA is enabled, reg8 bit0
	if (!(reg8 & 0x0001))
	{
		reg8changed = 1;
		newreg8val = newreg8val | 0x1;
	}

	//change reg8 if needed
	if (reg8changed) writeSPI_non_blocking(8,newreg8val);

	//ensure VGA is enabled, reg9 bit0
	if (!(reg9 & 0x1))
	{
		reg9changed = 1;
		writeSPI_non_blocking(9,reg9|0x1);
	}

	//ensure ADC1 is enabled, reg10 bit1
	if (!(reg10 & 0x2))
	{
		newreg10val = reg10|0x2;
		writeSPI_non_blocking(10,newreg10val);
	}

	//if ADC1 cal bit is on turn it off, reg10 bit2
	if (reg10 & 0x4)
	{
		newreg10val &= 0xFFFB;
		writeSPI_non_blocking(10,newreg10val);
	}

	//to run cal turn on reg10 bit2
	writeSPI_non_blocking(10,newreg10val|0x4);

	//set reg0 readback mode to read-only to see when cal is done
	readSPI(&reg0,0);
	writeSPI_non_blocking(0,reg0|0x200);

	//store reg0 read-only data for initial while loop test
	readSPI(&reg0_RO,0);

	//wait until cal is done, reg0 readback mode bit1=0 during cal
	while (~reg0_RO & 0x2)
	{
		numDoneChecks++;
		readSPI(&reg0_RO,0);
	}

	//register 0 back into normal readback mode
	writeSPI_non_blocking(0,reg0&0xFBFF);

	//restore register 10 with calibration bit off
	writeSPI_non_blocking(10,reg10&0xFFFB);

	//restore registers 8,9,11
	if (reg8changed) writeSPI_non_blocking(8,reg8);
	if (reg9changed) writeSPI_non_blocking(9,reg9);
	if (reg11changed) writeSPI_non_blocking(11,reg11);
}
//------------------------------------------------------------


//------------------------------------------------------------
void read_ADC0_cal_data(void)
{
	unsigned int reg6,i;
	unsigned int firstCalRegisterAddress = 32;

	//store original register 6 setting
	readSPI(&reg6,6);

	//set register 6 readback mode to read-only
	writeSPI_non_blocking(6,reg6|0xFF00);

	for (i=0;i<8;i++)
	{
		readSPI((unsigned int*)&ADC_calData[i],firstCalRegisterAddress+i);
	}

	//set register 6 readback mode back to normal
	writeSPI_non_blocking(6,reg6&0x00FF);

}
//------------------------------------------------------------


//------------------------------------------------------------
void read_ADC1_cal_data(void)
{
	unsigned int reg10,i;
	unsigned int firstCalRegisterAddress = 40;

	//store original register 10 setting
	readSPI(&reg10,10);

	//set register 6 readback mode to read-only
	writeSPI_non_blocking(10,reg10|0xFF00);

	for (i=0;i < 8; i++)
	{
		readSPI((unsigned int*)&ADC_calData[i],firstCalRegisterAddress+i);
	}

	//set register 10 readback mode back to normal
	writeSPI_non_blocking(10,reg10&0x00FF);

}
//------------------------------------------------------------


//------------------------------------------------------------
void fill_testADC_results_array(u16 signalToMeasure, u16 numReadings)
{
	unsigned int reg0,reg1,i,TADCresult;
	u16 testADCinitialConditions,testADCstartConditions;
	u8 firstSetup = 1;

	//store original register 0,1 setting
	readSPI(&reg0,0);
	readSPI(&reg1,1);

	//set register 1 readback mode to read-only, this is
	//controlled by register 0 bit 10
	writeSPI_non_blocking(0,reg0|0x0400);

	if (numReadings > MAX_TADC_RESULTS_SIZE)
	{
		numReadings = MAX_TADC_RESULTS_SIZE;
	}

	//build initial register setting for desired test case
	testADCinitialConditions = TADC_ENABLE | signalToMeasure |
			TADC_RESET | TADC_START;

	// if temperature sensor is being measured need to enable it too
	if (signalToMeasure == TADC_MUX_TEMPERATURE_SENSOR)
	{
		testADCinitialConditions |= TADC_TEMP_SENSOR_ENABLE;
	}

	// if VEXT is being measured set VEXTSEL bit high too
	if (signalToMeasure == TADC_MUX_VEXT)
	{
		testADCinitialConditions |= TADC_VEXTSEL;
	}

	//to start conversion set the start bit low
	testADCstartConditions = testADCinitialConditions & ~TADC_START;

	// need to set initial conditions and led ADC settle before looping
	// through successive measurements
	writeSPI_non_blocking(1,testADCinitialConditions);

	SetTimerDuration(65535, 8);		// delay for 5msec after initial mux setting
	timerRunning = 1;				// set flag that is cleared in timer ISR
	XTtcPs_Start(&DelayTimer);		// start the timer
	while(timerRunning);			// wait for ISR to clear flag

	SetTimerDuration(10000, 1);		// change timer setting to 100usec
									// for use in loop below

	for (i=0; i < numReadings; i++)
	{
		// initial tadc setting for desired measurement
		writeSPI_non_blocking(1,testADCinitialConditions);

		// start test ADC conversion
		writeSPI_non_blocking(1,testADCstartConditions);

		// wait for conversion to complete
		timerRunning = 1;
		XTtcPs_Start(&DelayTimer);
		while(timerRunning);

		// store result in array
		readSPI((unsigned int*)&TADCresult,1);

		// 12-bit result is in LSBs of 16-bit register
		testADCresults[i] = TADCresult & 0xFFF;
	}

	//restore register 0 with RBKSEL1 turned off
	writeSPI_non_blocking(0,reg0&0xFBFF);
	writeSPI_non_blocking(1,reg1);

}
//------------------------------------------------------------


//------------------------------------------------------------
unsigned int get_num_data_points(u8 *RxData)
{
	unsigned int num_points = 0;

	// most significant byte in number sent first
	num_points += RxData[1];
	num_points = num_points << 8;

	// least significant byte in number sent next
	num_points += RxData[2];

	return num_points;

}
//------------------------------------------------------------



//------------------------------------------------------------
void load_sawtooth_up_data(void)
{
	int i,j;

	UartTxData[0] = 0; // initial array value

	// load the data array with sawtooth data
	for(i=1; i<TX_BUFFER_SIZE; i++)
	{
		j = UartTxData[i-1] + SAWTOOTH_STEP_VALUE;
		if (j>SAWTOOTH_MAX_VALUE)
		{
			UartTxData[i] = 0;
		}
		else{
			UartTxData[i] = j;
		}
	}
}
//------------------------------------------------------------


//------------------------------------------------------------
void load_sawtooth_down_data(void)
{
	int i,j;

	UartTxData[0] = SAWTOOTH_MAX_VALUE; // initial array value

	// load the data array with sawtooth data
	for(i=1; i<TX_BUFFER_SIZE; i++){
		j = UartTxData[i-1] - SAWTOOTH_STEP_VALUE;
		if (j < 0){
			UartTxData[i] = SAWTOOTH_MAX_VALUE;
		} else {
			UartTxData[i] = j;
		}
	}
}
//------------------------------------------------------------


//------------------------------------------------------------
void send_Tx_data_over_UART(unsigned int num_points_to_send)
{
	int i;
	// send the data array to the transmit buffer as space is available
	for (i = 0; i < num_points_to_send; i++) {
		/* Wait until there is space in TX FIFO */
		 while (XUartPs_IsTransmitFull(XPAR_XUARTPS_0_BASEADDR));

		/* Write the byte into the TX FIFO */
		XUartPs_WriteReg(XPAR_XUARTPS_0_BASEADDR, XUARTPS_FIFO_OFFSET,
				UartTxData[i]);
	}
}
//------------------------------------------------------------


//------------------------------------------------------------
void send_data_over_UART(unsigned int num_bytes_to_send, u8 *dataArray)
{
	int i;
	// send the data array to the transmit buffer as space is available
	for (i = 0; i < num_bytes_to_send; i++) {
		/* Wait until there is space in TX FIFO */
		 while (XUartPs_IsTransmitFull(XPAR_XUARTPS_0_BASEADDR));

		/* Write the byte into the TX FIFO */
		XUartPs_WriteReg(XPAR_XUARTPS_0_BASEADDR, XUARTPS_FIFO_OFFSET,
				dataArray[i]);
	}
}
//------------------------------------------------------------


//------------------------------------------------------------
void send_byte_over_UART(Xuint8 byteToSend)
{
	/* Wait until there is space in TX FIFO */
	 while (XUartPs_IsTransmitFull(XPAR_XUARTPS_0_BASEADDR));

	/* Write the byte into the TX FIFO */
	XUartPs_WriteReg(XPAR_XUARTPS_0_BASEADDR, XUARTPS_FIFO_OFFSET,
						byteToSend);
}
//------------------------------------------------------------



//------------------------------------------------------------
int InitializeDelayTimer(void)
{
	int Status;
	XTtcPs_Config *Config;

	/*
	 * Look up the configuration based on the device identifier
	 */
	Config = XTtcPs_LookupConfig(DELAY_TIMER_DEVICE_ID);
	if (NULL == Config) {
		return XST_FAILURE;
	}

	/*
	 * Initialize the device
	 */
	Status = XTtcPs_CfgInitialize(&DelayTimer, Config, Config->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Set up appropriate options for Ticker: interval mode without
	 * waveform output.
	 */
	u16 TimerOptions = (XTTCPS_OPTION_INTERVAL_MODE |
						  XTTCPS_OPTION_WAVE_DISABLE);

	/*
	 * Set the options
	 */
	XTtcPs_SetOptions(&DelayTimer, TimerOptions);
	XTtcPs_SetInterval(&DelayTimer, 1000);
	XTtcPs_SetPrescaler(&DelayTimer, 2);

	/*
	 * Connect to the interrupt controller
	 */
	Status = XScuGic_Connect(&interrupt_controller, DELAY_TIMER_INTERRUPT_ID,
		(Xil_InterruptHandler)DelayTimerInterruptHandler, (void *)&DelayTimer);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Enable interrupts for the ttc in global interrupt controller
	 */
	XScuGic_Enable(&interrupt_controller, DELAY_TIMER_INTERRUPT_ID);

	/*
	 * Enable the interval timeout interrupt in this ttc instance
	 */
	XTtcPs_EnableInterrupts(&DelayTimer, XTTCPS_IXR_INTERVAL_MASK);

	return Status;
}
//------------------------------------------------------------



//------------------------------------------------------------
void SetTimerDuration(XInterval num10nsecCounts, u8 prescalar)
{
	/*
	 * Set the interval and prescaler
	 */
	XTtcPs_SetInterval(&DelayTimer, num10nsecCounts);

	if (prescalar == 1)
	{
		prescalar = XTTCPS_CLK_CNTRL_PS_DISABLE;
	}
	XTtcPs_SetPrescaler(&DelayTimer, prescalar);
}
//------------------------------------------------------------



//------------------------------------------------------------
void DelayTimerInterruptHandler(void *CallBackRef)
{
	u32 StatusEvent;

	/*
	 * Read the interrupt status, then write it back to clear the interrupt.
	 */
	StatusEvent = XTtcPs_GetInterruptStatus((XTtcPs *)CallBackRef);
	XTtcPs_ClearInterruptStatus((XTtcPs *)CallBackRef, StatusEvent);

	if (0 != (XTTCPS_IXR_INTERVAL_MASK & StatusEvent)) {

		timerRunning = FALSE;
	}
	else {
		/*
		 * The Interval event should be the only one enabled. If it is
		 * not it is an error
		 */
		TimerErrorCount++;
	}
	XTtcPs_Stop(&DelayTimer);
}
//------------------------------------------------------------



//------------------------------------------------------------
Xuint8 ProgramOTP_chipID(u32 id)
{
	u32 otp32register;

	//shift ID over to bits 31:8 of the 32 bit OTP register
	otp32register = id << 8;
	return ProgramOTP(otp32register);
}
//------------------------------------------------------------



//------------------------------------------------------------
Xuint8 ProgramOTP_VbgTrim(u8 trimVal)
{
	//mask bits 5-31 if set in trimVal
	trimVal &= 0x1F;

	return ProgramOTP((u32)trimVal);
}
//------------------------------------------------------------



//------------------------------------------------------------
Xuint8 ProgramOTP(u32 otp32ProgramValue)
{
	int i;
	Xuint8 readbackErrorCode = 0;
	u32 x = 1;
	u32 otp32TestValue;

	otp32TestValue = readOTP32bits() | otp32ProgramValue;

	// setup the timer for 25usec delay to use later
	SetTimerDuration(2500, 1);

	// loop through all 32 bits in otp register to clear out any 1s
	for(i=0;i<32;i++)
	{
		writeSPI_non_blocking_orig(2,0x0010);		//CLKM=1
		writeSPI_non_blocking_orig(2,0x0000);		//CLKM=0
		writeSPI_non_blocking_orig(2,0x0020);		//CLKS=1
		writeSPI_non_blocking_orig(2,0x0000);		//CLKS=0

	}

	// shift a 1 into bit position 0
	writeSPI_non_blocking_orig(2,0x8000);		//DIN=1,CLKM=0,CLKS=0
	writeSPI_non_blocking_orig(2,0x8010);		//DIN=1,CLKM=1,CLKS=0
	writeSPI_non_blocking_orig(2,0x8000);		//DIN=1,CLKM=0,CLKS=0
	writeSPI_non_blocking_orig(2,0x8020);		//DIN=1,CLKM=0,CLKS=1
	writeSPI_non_blocking_orig(2,0x8000);		//DIN=1,CLKM=0,CLKS=0
	writeSPI_non_blocking_orig(2,0x0000);		//DIN=0,CLKM=0,CLKS=0

	// check each bit position to see if it should be programmed
	// to a '1', then shift bit to next position
	for(i=0;i<32;i++)
	{
		// check if this bit should be programmed
		if (otp32ProgramValue & (x << i) )
		{
			writeSPI_non_blocking_orig(2,0x4000);	//SHORTEN=1,IZAPEN=0,WE=0
			writeSPI_non_blocking_orig(2,0x6000);	//SHORTEN=1,IZAPEN=1,WE=0
			// wait 1<t<10us, ensure spi transfer time takes care of this
			// if no delay is used
			writeSPI_non_blocking_orig(2,0x7000);	//SHORTEN=1,IZAPEN=1,WE=1
			writeSPI_non_blocking_orig(2,0x3000);	//SHORTEN=0,IZAPEN=1,WE=1

			//delay 25usec for zap time
			/*timerRunning = 1;
			XTtcPs_Start(&DelayTimer);
			while(timerRunning);*/
			// delay above was not needed because delay
			// between spi register write completions is ~25usec

			writeSPI_non_blocking_orig(2,0x7000);	//SHORTEN=1,IZAPEN=1,WE=1
			writeSPI_non_blocking_orig(2,0x6000);	//SHORTEN=1,IZAPEN=1,WE=0
			writeSPI_non_blocking_orig(2,0x4000);	//SHORTEN=1,IZAPEN=0,WE=0
			writeSPI_non_blocking_orig(2,0x0000);	//SHORTEN=0,IZAPEN=0,WE=0
		}

		//shift bit to next position in register
		writeSPI_non_blocking_orig(2,0x0010);		//DIN=0,CLKM=1,CLKS=0
		writeSPI_non_blocking_orig(2,0x0000);		//DIN=0,CLKM=0,CLKS=0
		writeSPI_non_blocking_orig(2,0x0020);		//DIN=0,CLKM=0,CLKS=1
		writeSPI_non_blocking_orig(2,0x0000);		//DIN=0,CLKM=0,CLKS=0
	}

	//enable read operations
	writeSPI_non_blocking_orig(2,0x0001);		//RSWEN=1
	// wait min 4.5usec
	writeSPI_non_blocking_orig(2,0x0003);		//BANK=1,RSWEN=1
	writeSPI_non_blocking_orig(2,0x0007);		//READ=1,BANK=1,RSWEN=1

	//test for correct value in NVM register
	if (otp32TestValue != readOTP32bits()) readbackErrorCode |= 0x01;

	//set fuse block in read mode (low current)
	writeSPI_non_blocking_orig(2,0x0047);		//BIASL=1,READ=1,BANK=1,RSWEN=1
	//test for correct value in NVM register
	if (otp32TestValue != readOTP32bits()) readbackErrorCode |= 0x02;

	//set fuse block in read mode (high current)
	writeSPI_non_blocking_orig(2,0x000F);		//BIASH=1,READ=1,BANK=1,RSWEN=1
	//test for correct value in NVM register
	if (otp32TestValue != readOTP32bits()) readbackErrorCode |= 0x04;

	//clear all bits in the OTP programming register
	writeSPI_non_blocking_orig(2,0x0000);

	return readbackErrorCode;
}
//------------------------------------------------------------


//------------------------------------------------------------
/*
 * Reads the 32-bit value from the OTP memory block
 */
u32 readOTP32bits(void)
{
	unsigned int reg3originalValue,regReadResult;
	u32 otp32bitResult;

	// read value of register 3 to restore later
	readSPI(&reg3originalValue,3);

	// set 2 RBKSEL bits in order to read OTP register values
	writeSPI_non_blocking_orig(3,(0x0300|reg3originalValue));

	// read lower 16 bits of 32 bit result
	readSPI(&regReadResult,2);
	otp32bitResult = regReadResult;

	// read upper 16 bits of 32 bit result
	readSPI(&regReadResult,3);
	otp32bitResult += (regReadResult << 16);

	// restore register 3 original value
	writeSPI_non_blocking_orig(3,reg3originalValue);

	return otp32bitResult;
}

// --------------------------------------------------------------------
void test_DMA_receive_packets(int num_packets){

	resetGyroRxFIFO();
	setGyroChannelControl(0x00000010);
	nops(4000000);
	receiveDMApacket(&AxiDma, 0);

	setGyroChannelControl(0x00000010);
	nops(4000000);
	receiveDMApacket(&AxiDma, 0);
	setGyroChannelControl(0x00000000);

	setGyroChannelControl(0x00000010);
	nops(4000000);
	receiveDMApacket(&AxiDma, 0);
	setGyroChannelControl(0x00000000);

}

// -------------------------------------------------------------------
int main() {
    init_platform();



//    unsigned int readVal, writeVal;

    xil_printf("\n\r=====================\n\r");
    xil_printf("== START version 28 ==\n\r");
    // set interrupt_0/1 of AXI PL interrupt generator to 0

    *(baseaddr_p+0) = 0x00000000;
    *(baseaddr_p+1) = 0x00000000;
    *(baseaddr_p+2) = 0x00000000;
    *(baseaddr_p+3) = 0x00000000;

    xil_printf("Checkpoint 1\n\r");

    // set interrupt_0/1 of AXI PL interrupt generator to 1
    *(baseaddr_p+0) = 0x00000001;
    *(baseaddr_p+1) = 0x00000002;

    xil_printf("Checkpoint 2\n\r");
    // read interrupt_0/1 of AXI PL interrupt generator
    xil_printf("slv_reg0: 0x%08x\n\r", *(baseaddr_p+0));
    xil_printf("slv_reg1: 0x%08x\n\r", *(baseaddr_p+1));
    xil_printf("slv_reg2: 0x%08x\n\r", *(baseaddr_p+2));
    xil_printf("slv_reg3: 0x%08x\n\r", *(baseaddr_p+3));


    // clear SPI registers
    initSPI();
//    enableSPI();


    setSPIClockDivision(SPI_clock_division_setting); // needs to be 1 , 2 or 3
    readSPIStatus();

    // set interrupt_0/1 of AXI PL interrupt generator to 0
    *(baseaddr_p+0) = 0x00000000;
    *(baseaddr_p+1) = 0x00000000;
    *(baseaddr_p+2) = 0x00000000;

   // xil_printf("Checkpoint 3\n\r");
    // read interrupt_0/1 of AXI PL interrupt generator

/*
    xil_printf("Checkpoint 4\n\r");
    // setup and enable interrupts for IRQ_F2P[1:0]
    int status = setup_interrupt_system();
    if (status != XST_SUCCESS) {
         return XST_FAILURE;
    }

    xil_printf("Checkpoint 5\n\r");
    nops(1000);
    // set interrupt_0 of AXI PL interrupt generator to 1 (isr0 will be called)
    *(baseaddr_p+0) = 0x00000001;

    xil_printf("Checkpoint 6\n\r");
    nops(1000);
    // set interrupt_1 of AXI PL interrupt generator to 1 (isr1 will be called)
    *(baseaddr_p+1) = 0x00000001;
    xil_printf("Reading slv_reg1: 0x%08x\n\r", *(baseaddr_p+1));

    // disable interrupts for IRQ_F2P[1:1]
    XScuGic_Disable(&intc, INTC_INTERRUPT_ID_1);

    xil_printf("Checkpoint 7\n\r");
    nops(1000);
    // set interrupt_0 of AXI PL interrupt generator to 1 (isr0 will be called)
    *(baseaddr_p+0) = 0x00000001;

    xil_printf("Checkpoint 8\n\r");
    nops(10000);
    // set interrupt_1 of AXI PL interrupt generator to 1non
    // (isr1 wont be called since interrupts for IRQ_F2P[1:1] are disabled)
    *(baseaddr_p+1) = 0x00000000;

    xil_printf("Checkpoint 9\n\r");
	nops(1000);
	// set interrupt_0 of AXI PL interrupt generator to 1 (isr0 will be called)
	*(baseaddr_p+2) = 0x00000001;
	nops(10000000);
	*(baseaddr_p+2) = 0x00000000;
    xil_printf("Before Busy-Wait Loop slv_reg3: 0x%08x\n\r", *(baseaddr_p+3));

    flag = 1;
    while(flag == 1){
    	nops(100);
    }
    xil_printf("After Busy-Wait Loop slv_reg3: 0x%08x\n\r", *(baseaddr_p+3));
*/
/*
    xil_printf("== SPI test ==\n\r");
    setControlSPI(0x00000007);		// clock division

    writeVal = 0x00808A51;
    xil_printf(" SPI writing : 0x%08x\n\r", writeVal);
    err = writeSPI_non_blocking(0x00000000, writeVal);		// write operation
    if(err == 0){
    	xil_printf(" Write Success \n\r");
    } else {
    	xil_printf(" Write Fail \n\r");
    }

    err = readSPI(&readVal, 0x00000000);
    xil_printf(" SPI reading : 0x%08x\n\r", readVal);
    xil_printf("After SPI reading 0 done: 0x%08x\n\r", *(baseaddr_spi+0));
    xil_printf("After SPI reading 0 done: 0x%08x\n\r", *(baseaddr_spi+0));

    */

    xil_printf("== GYRO Channel test ==\n\r");

    //readGyroTxFIFODebugData();
    //readGyroRxFIFODebugData();
    resetGyroTxFIFO();
    resetGyroRxFIFO();
    initGyroChannel();
//    enableGyroChannel();

    //configure ADC0, ADC1 here via spi

    // --- loopback mode, POL = 0, in and out channels = 00
    //setGyroChannelConfiguration(0x01000000);

    //=======================================================
    // setGyroChannelConfiguration() description:
    //
    // bit 18:16 is to divide clock by 1/2/4/8/16/32/64/128
    // with 128 (7 Hex) we get 50 MHz divided by 128 = 390 KHz.
    // bits 14:12 are to select the packet size.
    //  000 is 64 samples  (32 words)
    //  001 is 128 samples  (64 words)
    //  010 is 256 samples (128 words)
    //  011 is 512 samples (256 words)
    //  100 is 1024 samples  (512 words)
    //  101 is 2048 samples  (1024 words)
    //  110 is 4096 samples (2048 words)
    //  111 is 8192 samples (4096 words)
    //
    // bits 6:4 - control the in+channel:
    //   00 is HSI_A0
    //   01 is HSI_A1
    //   10 and 11 inactive.
    // bits 2:0  - control the out_channel:
    //   000 is HSI_DAP
    //   001 is HSI_DAM
    //   010 is HSI_DBP
    //   011 is HGSI_DBM
    //	 100 is HSI_DC
    //=======================================================
    setGyroChannelConfiguration(MCK_div_setting | packet_size_setting |
    		HSI_input_channel_setting | HSI_output_channel_setting);
    //setGyroChannelConfiguration(0x00017000);

    setGyroChannelControl(0x00000000);

    xil_printf(" - after initialization ==\n\r");

    readGyroChannelStatus();
    readGyroChannelDebugData();
    readGyroTxFIFODebugData();
    readGyroRxFIFODebugData();

    xil_printf("== Starting FIFO / DMA test ++\n\r");

    initDMADevice();

    //setGyroChannelControl(0x00000011); // moved inside loopback
    //test_DMA_receive_packets(1);
    // --- stopping both channels
	setGyroChannelControl(0x00000000);

	//readGyroChannelStatus();
	//readGyroChannelDebugData();


	//readGyroTxFIFODebugData();
	//readGyroRxFIFODebugData();

    xil_printf("== After Rx ++\n\r");

    xil_printf("== STOP ==\n\r");
    xil_printf("=====================\n\n\r");

/*


xil_printf("== START 2  ==\n\r");
    acquireSamples(MAX_PKT_LEN);
xil_printf("== STOP 2  ==\n\r");

*/


    //#################################################################
    //#################################################################
    // code below here is merged from zedboard project used to develop
    // UART interrupts for received data
    //#################################################################
    //#################################################################
    int looping = 1;

	Status = SetupUartPs(&interrupt_controller, &UartPs,
					UARTPS_DEVICE_ID, UART_INT_IRQ_ID);
	if (Status != XST_SUCCESS) {
		xil_printf("Failed to set up UartPs\r\n");
		return XST_FAILURE;
	}

	xil_printf("  waiting for received UART data...\n");

	InitializeDelayTimer();

	while(looping){// loop here and let interrupts drive further actions


		//-------------------------------------------------------------------
		// uart received data so retrieve command
		if (state & SERVICE_UART){

			read_uart_bytes();
			state &= ~SERVICE_UART;
		}
		//-------------------------------------------------------------------


	}
	// end of code for UART interrupts
	//#################################################################
	//#################################################################



    cleanup_platform();
    return 0;
}
