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
u32 packet_size_setting = CONFIG_PACKET_SIZE_2048_SAMPLES;
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

#define MAX_PKT_LEN				8192	// this is Bytes
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


volatile int busySamplingFlag = 0;
volatile int ADCSamplingFinished = 0;
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
	u8 Value1,Value2;
	u8 Value;

	Value1 = 0x0c;
	Value2 = 0x80;
/*
	  for(Index = 0; Index < (npoints/4); Index = Index+2) {
		TxPacket[Index] = Value1;
		TxPacket[Index+1] = Value2;
	  }
*/
double x;

  //x = sin(0.0);

/*
	  for(Index = 0; Index < npoints/2; Index++){
		TxPacket[Index*2] = 0xff;
		TxPacket[Index*2+1] =(Value & 0x7f);
		Value =(Value +1)& 0xFF;
	  }


	  // sin 6.txt
*/
/*
	  TxPacket[2] = 0x00;
	  TxPacket[3] = 0x80;
	  TxPacket[0] = 0x90;
	  TxPacket[1] = 0x8c;
	  TxPacket[6] = 0x00;
	  TxPacket[7] = 0x99;
	  TxPacket[4] = 0x40;
	  TxPacket[5] = 0xa5;
	  TxPacket[10] = 0x20;
	  TxPacket[11] = 0xb1;
	  TxPacket[8] = 0x80;
	  TxPacket[9] = 0xbc;
	  TxPacket[14] = 0x40;
	  TxPacket[15] = 0xc7;
	  TxPacket[12] = 0x60;
	  TxPacket[13] = 0xd1;
	  TxPacket[18] = 0xb0;
	  TxPacket[19] = 0xda;
	  TxPacket[16] = 0x20;
	  TxPacket[17] = 0xe3;
	  TxPacket[22] = 0xa0;
	  TxPacket[23] = 0xea;
	  TxPacket[20] = 0x10;
	  TxPacket[21] = 0xf1;
	  TxPacket[26] = 0x70;
	  TxPacket[27] = 0xf6;
	  TxPacket[24] = 0xa0;
	  TxPacket[25] = 0xfa;
	  TxPacket[30] = 0xa0;
	  TxPacket[31] = 0xfd;
	  TxPacket[28] = 0x70;
	  TxPacket[29] = 0xff;
	  TxPacket[34] = 0xf0;
	  TxPacket[35] = 0xff;
	  TxPacket[32] = 0x50;
	  TxPacket[33] = 0xff;
	  TxPacket[38] = 0x60;
	  TxPacket[39] = 0xfd;
	  TxPacket[36] = 0x40;
	  TxPacket[37] = 0xfa;
	  TxPacket[42] = 0xf0;
	  TxPacket[43] = 0xf5;
	  TxPacket[40] = 0x70;
	  TxPacket[41] = 0xf0;
	  TxPacket[46] = 0xf0;
	  TxPacket[47] = 0xe9;
	  TxPacket[44] = 0x50;
	  TxPacket[45] = 0xe2;
	  TxPacket[50] = 0xd0;
	  TxPacket[51] = 0xd9;
	  TxPacket[48] = 0x60;
	  TxPacket[49] = 0xd0;
	  TxPacket[54] = 0x40;
	  TxPacket[55] = 0xc6;
	  TxPacket[52] = 0x60;
	  TxPacket[53] = 0xbb;
	  TxPacket[58] = 0xf0;
	  TxPacket[59] = 0xaf;
	  TxPacket[56] = 0x00;
	  TxPacket[57] = 0xa4;
	  TxPacket[62] = 0xc0;
	  TxPacket[63] = 0x97;
	  TxPacket[60] = 0x50;
	  TxPacket[61] = 0x8b;
	  TxPacket[66] = 0xb0;
	  TxPacket[67] = 0x7e;
	  TxPacket[64] = 0x20;
	  TxPacket[65] = 0x72;
	  TxPacket[70] = 0xb0;
	  TxPacket[71] = 0x65;
	  TxPacket[68] = 0x80;
	  TxPacket[69] = 0x59;
	  TxPacket[74] = 0xb0;
	  TxPacket[75] = 0x4d;
	  TxPacket[72] = 0x50;
	  TxPacket[73] = 0x42;
	  TxPacket[78] = 0xa0;
	  TxPacket[79] = 0x37;
	  TxPacket[76] = 0x90;
	  TxPacket[77] = 0x2d;
	  TxPacket[82] = 0x50;
	  TxPacket[83] = 0x24;
	  TxPacket[80] = 0x00;
	  TxPacket[81] = 0x1c;
	  TxPacket[86] = 0xa0;
	  TxPacket[87] = 0x14;
	  TxPacket[84] = 0x50;
	  TxPacket[85] = 0x0e;
	  TxPacket[90] = 0x10;
	  TxPacket[91] = 0x09;
	  TxPacket[88] = 0x00;
	  TxPacket[89] = 0x05;
	  TxPacket[94] = 0x10;
	  TxPacket[95] = 0x02;
	  TxPacket[92] = 0x70;
	  TxPacket[93] = 0x00;
	  TxPacket[98] = 0x00;
	  TxPacket[99] = 0x00;
	  TxPacket[96] = 0xd0;
	  TxPacket[97] = 0x00;
	  TxPacket[102] = 0xd0;
	  TxPacket[103] = 0x02;
	  TxPacket[100] = 0x10;
	  TxPacket[101] = 0x06;
	  TxPacket[106] = 0x80;
	  TxPacket[107] = 0x0a;
	  TxPacket[104] = 0x10;
	  TxPacket[105] = 0x10;
	  TxPacket[110] = 0xc0;
	  TxPacket[111] = 0x16;
	  TxPacket[108] = 0x70;
	  TxPacket[109] = 0x1e;
	  TxPacket[114] = 0x10;
	  TxPacket[115] = 0x27;
	  TxPacket[112] = 0x80;
	  TxPacket[113] = 0x30;
	  TxPacket[118] = 0xd0;
	  TxPacket[119] = 0x3a;
	  TxPacket[116] = 0xb0;
	  TxPacket[117] = 0x45;
	  TxPacket[122] = 0x30;
	  TxPacket[123] = 0x51;
	  TxPacket[120] = 0x20;
	  TxPacket[121] = 0x5d;
	  TxPacket[126] = 0x70;
	  TxPacket[127] = 0x69;
	  TxPacket[124] = 0xf0;
	  TxPacket[125] = 0x75;
	  TxPacket[130] = 0x80;
	  TxPacket[131] = 0x82;
	  TxPacket[128] = 0x10;
	  TxPacket[129] = 0x8f;
	  TxPacket[134] = 0x80;
	  TxPacket[135] = 0x9b;
	  TxPacket[132] = 0xb0;
	  TxPacket[133] = 0xa7;
	  TxPacket[138] = 0x70;
	  TxPacket[139] = 0xb3;
	  TxPacket[136] = 0xb0;
	  TxPacket[137] = 0xbe;
	  TxPacket[142] = 0x60;
	  TxPacket[143] = 0xc9;
	  TxPacket[140] = 0x50;
	  TxPacket[141] = 0xd3;
	  TxPacket[146] = 0x80;
	  TxPacket[147] = 0xdc;
	  TxPacket[144] = 0xc0;
	  TxPacket[145] = 0xe4;
	  TxPacket[150] = 0x00;
	  TxPacket[151] = 0xec;
	  TxPacket[148] = 0x40;
	  TxPacket[149] = 0xf2;
	  TxPacket[154] = 0x60;
	  TxPacket[155] = 0xf7;
	  TxPacket[152] = 0x50;
	  TxPacket[153] = 0xfb;
	  TxPacket[158] = 0x10;
	  TxPacket[159] = 0xfe;
	  TxPacket[156] = 0xa0;
	  TxPacket[157] = 0xff;
	  TxPacket[162] = 0xf0;
	  TxPacket[163] = 0xff;
	  TxPacket[160] = 0x00;
	  TxPacket[161] = 0xff;
	  TxPacket[166] = 0xd0;
	  TxPacket[167] = 0xfc;
	  TxPacket[164] = 0x70;
	  TxPacket[165] = 0xf9;
	  TxPacket[170] = 0xf0;
	  TxPacket[171] = 0xf4;
	  TxPacket[168] = 0x40;
	  TxPacket[169] = 0xef;
	  TxPacket[174] = 0x70;
	  TxPacket[175] = 0xe8;
	  TxPacket[172] = 0xb0;
	  TxPacket[173] = 0xe0;
	  TxPacket[178] = 0x00;
	  TxPacket[179] = 0xd8;
	  TxPacket[176] = 0x70;
	  TxPacket[177] = 0xce;
	  TxPacket[182] = 0x10;
	  TxPacket[183] = 0xc4;
	  TxPacket[180] = 0x20;
	  TxPacket[181] = 0xb9;
	  TxPacket[186] = 0x90;
	  TxPacket[187] = 0xad;
	  TxPacket[184] = 0x90;
	  TxPacket[185] = 0xa1;
	  TxPacket[190] = 0x40;
	  TxPacket[191] = 0x95;
	  TxPacket[188] = 0xc0;
	  TxPacket[189] = 0x88;
	  TxPacket[194] = 0x20;
	  TxPacket[195] = 0x7c;
	  TxPacket[192] = 0x90;
	  TxPacket[193] = 0x6f;
	  TxPacket[198] = 0x30;
	  TxPacket[199] = 0x63;
	  TxPacket[196] = 0x10;
	  TxPacket[197] = 0x57;
	  TxPacket[202] = 0x50;
	  TxPacket[203] = 0x4b;
	  TxPacket[200] = 0x20;
	  TxPacket[201] = 0x40;
	  TxPacket[206] = 0x80;
	  TxPacket[207] = 0x35;
	  TxPacket[204] = 0xa0;
	  TxPacket[205] = 0x2b;
	  TxPacket[210] = 0x90;
	  TxPacket[211] = 0x22;
	  TxPacket[208] = 0x70;
	  TxPacket[209] = 0x1a;
	  TxPacket[214] = 0x40;
	  TxPacket[215] = 0x13;
	  TxPacket[212] = 0x20;
	  TxPacket[213] = 0x0d;
	  TxPacket[218] = 0x20;
	  TxPacket[219] = 0x08;
	  TxPacket[216] = 0x50;
	  TxPacket[217] = 0x04;
	  TxPacket[222] = 0xa0;
	  TxPacket[223] = 0x01;
	  TxPacket[220] = 0x40;
	  TxPacket[221] = 0x00;
	  TxPacket[226] = 0x10;
	  TxPacket[227] = 0x00;
	  TxPacket[224] = 0x20;
	  TxPacket[225] = 0x01;
	  TxPacket[230] = 0x60;
	  TxPacket[231] = 0x03;
	  TxPacket[228] = 0xe0;
	  TxPacket[229] = 0x06;
	  TxPacket[234] = 0x90;
	  TxPacket[235] = 0x0b;
	  TxPacket[232] = 0x60;
	  TxPacket[233] = 0x11;
	  TxPacket[238] = 0x30;
	  TxPacket[239] = 0x18;
	  TxPacket[236] = 0x10;
	  TxPacket[237] = 0x20;
	  TxPacket[242] = 0xe0;
	  TxPacket[243] = 0x28;
	  TxPacket[240] = 0x90;
	  TxPacket[241] = 0x32;
	  TxPacket[246] = 0xf0;
	  TxPacket[247] = 0x3c;
	  TxPacket[244] = 0x00;
	  TxPacket[245] = 0x48;
	  TxPacket[250] = 0x90;
	  TxPacket[251] = 0x53;
	  TxPacket[248] = 0x90;
	  TxPacket[249] = 0x5f;
	  TxPacket[254] = 0xf0;
	  TxPacket[255] = 0x6b;
	  TxPacket[252] = 0x70;
	  TxPacket[253] = 0x78;
*/


Value = 0x00;
		  for(Index = 0; Index < npoints/2; Index++){
			TxPacket[Index*2] = 0xf0;
			TxPacket[Index*2+1] =((2*Value) & 0xff);
			Value = (Value +1) & 0xFF;
		  }



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
	setGyroTxFIFOLooping();
	setGyroChannelControl(0x00000001);
	nops(100000);
	setGyroChannelControl(0x00000000);
	return 1;
 }

 // -------------------------------------------------------------------
int receivePacketButton(void){

	XAxiDma_BdRing *RxRingPtr;
	XAxiDma_Bd *BdPtr;
	int ProcessedBdCount;
	int FreeBdCount;
	int Status;

	//Status = RxSetup(&AxiDma); // ####

	resetGyroRxFIFO();

	Xil_DCacheFlushRange((Xuint32)outputDataBuffer, MAX_PKT_LEN/4);

	setGyroChannelControl(0x00000010);
	nops(10000000); // this is the value for DIV 1
	setGyroChannelControl(0x00000000);
	receiveDMApacket(&AxiDma,0);

	setGyroChannelControl(0x00000010);
	nops(10000000); // this is the value for DIV 1
	setGyroChannelControl(0x00000000);
	receiveDMApacket(&AxiDma,0);

	Xil_DCacheFlushRange((Xuint32)outputDataBuffer, MAX_PKT_LEN/4);

	ADCSamplingFinished = 1;

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
			while(busySamplingFlag == 1);
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
    //   011 is HSI_DBM
    //	 100 is HSI_DC
    //=======================================================
    setGyroChannelConfiguration(MCK_div_setting | packet_size_setting |
    		HSI_input_channel_setting | HSI_output_channel_setting);
    //setGyroChannelConfiguration(0x00016000);

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
