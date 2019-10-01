#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>
#include "platform.h"
#include "xparameters.h"
#include "xil_printf.h"
#include "xbasic_types.h"
#include "xscugic.h"
#include "xuartps.h"
#include "xuartps_hw.h"
#include "xil_exception.h"
#include "xttcps.h"
#include "xgpiops.h"


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
#define NUM_RXFIFO_DUMMY_READS_REQUIRED	31

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
#define CMD_FAST_CAL_ADC0			0x94	// perform fast calibration on ADC0
#define CMD_FAST_CAL_ADC1			0x95	// perform fast calibration on ADC1
#define CMD_LOOP_ADC_ACQUISITIONS	0xA0	// loops AXI commands to read ADC samples --for debug only--
#define CMD_START_ADC_ACQUISITIONS	0xA1	// read values via HSI bus into RxFIFO until full
#define CMD_FILL_DAC_TXFIFO			0xA2	// fill the TxFIFO with values and send via HSI bus
#define CMD_CAPTURE_ADC0_CAL_DATA	0xA3	// run calibration while capturing ADC0 data
#define CMD_CAPTURE_ADC1_CAL_DATA	0xA4	// run calibration while capturing ADC1 data
#define CMD_FPGA_ALL_OUTPUTS_LOW	0xA7	// set all FPGA outputs low for safe power down
#define CMD_FPGA_ALL_OUTPUTS_ENABLED 0xA8	// enable all FPGA outputs after power supplies turned on
#define CMD_FPGA_GET_OUTPUTS_STATE  0xA9	// read the enabled/disabled state of FPGA outputs
#define CMD_RUN_TADC_CONVERSION		0xAB	// take a single test ADC conversion and return result
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
#define CMD_ENABLE_VFUSE			0xBE	// set Vfuse control bit high to enable Vfuse
#define CMD_DISABLE_VFUSE			0xBF	// set Vfuse control bit low to disable Vfuse


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

#define MAX_PKT_LEN				8192	//8192//16384	// this is Bytes
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

#define TX_DATA_RAMP_UP		1
#define TX_DATA_RAMP_DOWN	2
static u8 typeOfTxDataToLoad = TX_DATA_RAMP_UP;

#define MAX_TADC_RESULTS_SIZE 512
static u16 testADCresults[MAX_TADC_RESULTS_SIZE];

#define WAVEFORM_DATA_ARRAY_SIZE 10
static volatile TxFifoData[WAVEFORM_DATA_ARRAY_SIZE];


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

XGpioPs MIO_gpio;
#define MIO_GPIO_BANK 0
#define VFUSE_MIO_OUTPUT_PIN 13
#define DIRECTION_OUTPUT 1
#define DIRECTION_INPUT 0


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
//static void fillTxPacketBuffer(int npoints, u8 *TxPacket);
static void fillTxPacketBuffer(int npoints, u32 *TxPacket);


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
static int captureADC0calibrationData(void);
static int captureADC1calibrationData(void);
static void fastCalibrationADC0(void);
static void fastCalibrationADC1(void);
static int receivePacketButton(void);
static void fill_testADC_results_array(u16 signalToMeasure, u16 numReadings);
static void changeSPIclockDivision(u8 divSetting);
static void changeMCLKdivision(u8 divSetting);
static void changeHSI_ADC_selection(u8 selection);
static void sendConfigBytesOverUart(void);
static unsigned int read_test_ADC_result(void);
static void init_MIO_gpio(void);
static void enable_Vfuse(void);
static void disable_Vfuse(void);
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
//static void fillTxPacketBuffer(int npoints, u8 *TxPacket){
	static void fillTxPacketBuffer(int npoints, u32 *TxPacket){
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
		u16 pattern1[4096];
		u16 pattern2[4096];
//		u16 pattern3[4096];
//		u16 pattern4[4096];

		pattern1[0]=0;
		pattern1[1]=1;
		pattern1[2]=2;
		pattern1[3]=3;
		pattern1[4]=4;
		pattern1[5]=5;
		pattern1[6]=6;
		pattern1[7]=7;
		pattern1[8]=8;
		pattern1[9]=9;
		pattern1[10]=10;
		pattern1[11]=11;
		pattern1[12]=12;
		pattern1[13]=13;
		pattern1[14]=14;
		pattern1[15]=15;
		pattern1[16]=16;
		pattern1[17]=17;
		pattern1[18]=18;
		pattern1[19]=19;
		pattern1[20]=20;
		pattern1[21]=21;
		pattern1[22]=22;
		pattern1[23]=23;
		pattern1[24]=24;
		pattern1[25]=25;
		pattern1[26]=26;
		pattern1[27]=27;
		pattern1[28]=28;
		pattern1[29]=29;
		pattern1[30]=30;
		pattern1[31]=31;
		pattern1[32]=32;
		pattern1[33]=33;
		pattern1[34]=34;
		pattern1[35]=35;
		pattern1[36]=36;
		pattern1[37]=37;
		pattern1[38]=38;
		pattern1[39]=39;
		pattern1[40]=40;
		pattern1[41]=41;
		pattern1[42]=42;
		pattern1[43]=43;
		pattern1[44]=44;
		pattern1[45]=45;
		pattern1[46]=46;
		pattern1[47]=47;
		pattern1[48]=48;
		pattern1[49]=49;
		pattern1[50]=50;
		pattern1[51]=51;
		pattern1[52]=52;
		pattern1[53]=53;
		pattern1[54]=54;
		pattern1[55]=55;
		pattern1[56]=56;
		pattern1[57]=57;
		pattern1[58]=58;
		pattern1[59]=59;
		pattern1[60]=60;
		pattern1[61]=61;
		pattern1[62]=62;
		pattern1[63]=63;
		pattern1[64]=64;
		pattern1[65]=65;
		pattern1[66]=66;
		pattern1[67]=67;
		pattern1[68]=68;
		pattern1[69]=69;
		pattern1[70]=70;
		pattern1[71]=71;
		pattern1[72]=72;
		pattern1[73]=73;
		pattern1[74]=74;
		pattern1[75]=75;
		pattern1[76]=76;
		pattern1[77]=77;
		pattern1[78]=78;
		pattern1[79]=79;
		pattern1[80]=80;
		pattern1[81]=81;
		pattern1[82]=82;
		pattern1[83]=83;
		pattern1[84]=84;
		pattern1[85]=85;
		pattern1[86]=86;
		pattern1[87]=87;
		pattern1[88]=88;
		pattern1[89]=89;
		pattern1[90]=90;
		pattern1[91]=91;
		pattern1[92]=92;
		pattern1[93]=93;
		pattern1[94]=94;
		pattern1[95]=95;
		pattern1[96]=96;
		pattern1[97]=97;
		pattern1[98]=98;
		pattern1[99]=99;
		pattern1[100]=100;
		pattern1[101]=101;
		pattern1[102]=102;
		pattern1[103]=103;
		pattern1[104]=104;
		pattern1[105]=105;
		pattern1[106]=106;
		pattern1[107]=107;
		pattern1[108]=108;
		pattern1[109]=109;
		pattern1[110]=110;
		pattern1[111]=111;
		pattern1[112]=112;
		pattern1[113]=113;
		pattern1[114]=114;
		pattern1[115]=115;
		pattern1[116]=116;
		pattern1[117]=117;
		pattern1[118]=118;
		pattern1[119]=119;
		pattern1[120]=120;
		pattern1[121]=121;
		pattern1[122]=122;
		pattern1[123]=123;
		pattern1[124]=124;
		pattern1[125]=125;
		pattern1[126]=126;
		pattern1[127]=127;
		pattern1[128]=128;
		pattern1[129]=129;
		pattern1[130]=130;
		pattern1[131]=131;
		pattern1[132]=132;
		pattern1[133]=133;
		pattern1[134]=134;
		pattern1[135]=135;
		pattern1[136]=136;
		pattern1[137]=137;
		pattern1[138]=138;
		pattern1[139]=139;
		pattern1[140]=140;
		pattern1[141]=141;
		pattern1[142]=142;
		pattern1[143]=143;
		pattern1[144]=144;
		pattern1[145]=145;
		pattern1[146]=146;
		pattern1[147]=147;
		pattern1[148]=148;
		pattern1[149]=149;
		pattern1[150]=150;
		pattern1[151]=151;
		pattern1[152]=152;
		pattern1[153]=153;
		pattern1[154]=154;
		pattern1[155]=155;
		pattern1[156]=156;
		pattern1[157]=157;
		pattern1[158]=158;
		pattern1[159]=159;
		pattern1[160]=160;
		pattern1[161]=161;
		pattern1[162]=162;
		pattern1[163]=163;
		pattern1[164]=164;
		pattern1[165]=165;
		pattern1[166]=166;
		pattern1[167]=167;
		pattern1[168]=168;
		pattern1[169]=169;
		pattern1[170]=170;
		pattern1[171]=171;
		pattern1[172]=172;
		pattern1[173]=173;
		pattern1[174]=174;
		pattern1[175]=175;
		pattern1[176]=176;
		pattern1[177]=177;
		pattern1[178]=178;
		pattern1[179]=179;
		pattern1[180]=180;
		pattern1[181]=181;
		pattern1[182]=182;
		pattern1[183]=183;
		pattern1[184]=184;
		pattern1[185]=185;
		pattern1[186]=186;
		pattern1[187]=187;
		pattern1[188]=188;
		pattern1[189]=189;
		pattern1[190]=190;
		pattern1[191]=191;
		pattern1[192]=192;
		pattern1[193]=193;
		pattern1[194]=194;
		pattern1[195]=195;
		pattern1[196]=196;
		pattern1[197]=197;
		pattern1[198]=198;
		pattern1[199]=199;
		pattern1[200]=200;
		pattern1[201]=201;
		pattern1[202]=202;
		pattern1[203]=203;
		pattern1[204]=204;
		pattern1[205]=205;
		pattern1[206]=206;
		pattern1[207]=207;
		pattern1[208]=208;
		pattern1[209]=209;
		pattern1[210]=210;
		pattern1[211]=211;
		pattern1[212]=212;
		pattern1[213]=213;
		pattern1[214]=214;
		pattern1[215]=215;
		pattern1[216]=216;
		pattern1[217]=217;
		pattern1[218]=218;
		pattern1[219]=219;
		pattern1[220]=220;
		pattern1[221]=221;
		pattern1[222]=222;
		pattern1[223]=223;
		pattern1[224]=224;
		pattern1[225]=225;
		pattern1[226]=226;
		pattern1[227]=227;
		pattern1[228]=228;
		pattern1[229]=229;
		pattern1[230]=230;
		pattern1[231]=231;
		pattern1[232]=232;
		pattern1[233]=233;
		pattern1[234]=234;
		pattern1[235]=235;
		pattern1[236]=236;
		pattern1[237]=237;
		pattern1[238]=238;
		pattern1[239]=239;
		pattern1[240]=240;
		pattern1[241]=241;
		pattern1[242]=242;
		pattern1[243]=243;
		pattern1[244]=244;
		pattern1[245]=245;
		pattern1[246]=246;
		pattern1[247]=247;
		pattern1[248]=248;
		pattern1[249]=249;
		pattern1[250]=250;
		pattern1[251]=251;
		pattern1[252]=252;
		pattern1[253]=253;
		pattern1[254]=254;
		pattern1[255]=255;
		pattern1[256]=256;
		pattern1[257]=257;
		pattern1[258]=258;
		pattern1[259]=259;
		pattern1[260]=260;
		pattern1[261]=261;
		pattern1[262]=262;
		pattern1[263]=263;
		pattern1[264]=264;
		pattern1[265]=265;
		pattern1[266]=266;
		pattern1[267]=267;
		pattern1[268]=268;
		pattern1[269]=269;
		pattern1[270]=270;
		pattern1[271]=271;
		pattern1[272]=272;
		pattern1[273]=273;
		pattern1[274]=274;
		pattern1[275]=275;
		pattern1[276]=276;
		pattern1[277]=277;
		pattern1[278]=278;
		pattern1[279]=279;
		pattern1[280]=280;
		pattern1[281]=281;
		pattern1[282]=282;
		pattern1[283]=283;
		pattern1[284]=284;
		pattern1[285]=285;
		pattern1[286]=286;
		pattern1[287]=287;
		pattern1[288]=288;
		pattern1[289]=289;
		pattern1[290]=290;
		pattern1[291]=291;
		pattern1[292]=292;
		pattern1[293]=293;
		pattern1[294]=294;
		pattern1[295]=295;
		pattern1[296]=296;
		pattern1[297]=297;
		pattern1[298]=298;
		pattern1[299]=299;
		pattern1[300]=300;
		pattern1[301]=301;
		pattern1[302]=302;
		pattern1[303]=303;
		pattern1[304]=304;
		pattern1[305]=305;
		pattern1[306]=306;
		pattern1[307]=307;
		pattern1[308]=308;
		pattern1[309]=309;
		pattern1[310]=310;
		pattern1[311]=311;
		pattern1[312]=312;
		pattern1[313]=313;
		pattern1[314]=314;
		pattern1[315]=315;
		pattern1[316]=316;
		pattern1[317]=317;
		pattern1[318]=318;
		pattern1[319]=319;
		pattern1[320]=320;
		pattern1[321]=321;
		pattern1[322]=322;
		pattern1[323]=323;
		pattern1[324]=324;
		pattern1[325]=325;
		pattern1[326]=326;
		pattern1[327]=327;
		pattern1[328]=328;
		pattern1[329]=329;
		pattern1[330]=330;
		pattern1[331]=331;
		pattern1[332]=332;
		pattern1[333]=333;
		pattern1[334]=334;
		pattern1[335]=335;
		pattern1[336]=336;
		pattern1[337]=337;
		pattern1[338]=338;
		pattern1[339]=339;
		pattern1[340]=340;
		pattern1[341]=341;
		pattern1[342]=342;
		pattern1[343]=343;
		pattern1[344]=344;
		pattern1[345]=345;
		pattern1[346]=346;
		pattern1[347]=347;
		pattern1[348]=348;
		pattern1[349]=349;
		pattern1[350]=350;
		pattern1[351]=351;
		pattern1[352]=352;
		pattern1[353]=353;
		pattern1[354]=354;
		pattern1[355]=355;
		pattern1[356]=356;
		pattern1[357]=357;
		pattern1[358]=358;
		pattern1[359]=359;
		pattern1[360]=360;
		pattern1[361]=361;
		pattern1[362]=362;
		pattern1[363]=363;
		pattern1[364]=364;
		pattern1[365]=365;
		pattern1[366]=366;
		pattern1[367]=367;
		pattern1[368]=368;
		pattern1[369]=369;
		pattern1[370]=370;
		pattern1[371]=371;
		pattern1[372]=372;
		pattern1[373]=373;
		pattern1[374]=374;
		pattern1[375]=375;
		pattern1[376]=376;
		pattern1[377]=377;
		pattern1[378]=378;
		pattern1[379]=379;
		pattern1[380]=380;
		pattern1[381]=381;
		pattern1[382]=382;
		pattern1[383]=383;
		pattern1[384]=384;
		pattern1[385]=385;
		pattern1[386]=386;
		pattern1[387]=387;
		pattern1[388]=388;
		pattern1[389]=389;
		pattern1[390]=390;
		pattern1[391]=391;
		pattern1[392]=392;
		pattern1[393]=393;
		pattern1[394]=394;
		pattern1[395]=395;
		pattern1[396]=396;
		pattern1[397]=397;
		pattern1[398]=398;
		pattern1[399]=399;
		pattern1[400]=400;
		pattern1[401]=401;
		pattern1[402]=402;
		pattern1[403]=403;
		pattern1[404]=404;
		pattern1[405]=405;
		pattern1[406]=406;
		pattern1[407]=407;
		pattern1[408]=408;
		pattern1[409]=409;
		pattern1[410]=410;
		pattern1[411]=411;
		pattern1[412]=412;
		pattern1[413]=413;
		pattern1[414]=414;
		pattern1[415]=415;
		pattern1[416]=416;
		pattern1[417]=417;
		pattern1[418]=418;
		pattern1[419]=419;
		pattern1[420]=420;
		pattern1[421]=421;
		pattern1[422]=422;
		pattern1[423]=423;
		pattern1[424]=424;
		pattern1[425]=425;
		pattern1[426]=426;
		pattern1[427]=427;
		pattern1[428]=428;
		pattern1[429]=429;
		pattern1[430]=430;
		pattern1[431]=431;
		pattern1[432]=432;
		pattern1[433]=433;
		pattern1[434]=434;
		pattern1[435]=435;
		pattern1[436]=436;
		pattern1[437]=437;
		pattern1[438]=438;
		pattern1[439]=439;
		pattern1[440]=440;
		pattern1[441]=441;
		pattern1[442]=442;
		pattern1[443]=443;
		pattern1[444]=444;
		pattern1[445]=445;
		pattern1[446]=446;
		pattern1[447]=447;
		pattern1[448]=448;
		pattern1[449]=449;
		pattern1[450]=450;
		pattern1[451]=451;
		pattern1[452]=452;
		pattern1[453]=453;
		pattern1[454]=454;
		pattern1[455]=455;
		pattern1[456]=456;
		pattern1[457]=457;
		pattern1[458]=458;
		pattern1[459]=459;
		pattern1[460]=460;
		pattern1[461]=461;
		pattern1[462]=462;
		pattern1[463]=463;
		pattern1[464]=464;
		pattern1[465]=465;
		pattern1[466]=466;
		pattern1[467]=467;
		pattern1[468]=468;
		pattern1[469]=469;
		pattern1[470]=470;
		pattern1[471]=471;
		pattern1[472]=472;
		pattern1[473]=473;
		pattern1[474]=474;
		pattern1[475]=475;
		pattern1[476]=476;
		pattern1[477]=477;
		pattern1[478]=478;
		pattern1[479]=479;
		pattern1[480]=480;
		pattern1[481]=481;
		pattern1[482]=482;
		pattern1[483]=483;
		pattern1[484]=484;
		pattern1[485]=485;
		pattern1[486]=486;
		pattern1[487]=487;
		pattern1[488]=488;
		pattern1[489]=489;
		pattern1[490]=490;
		pattern1[491]=491;
		pattern1[492]=492;
		pattern1[493]=493;
		pattern1[494]=494;
		pattern1[495]=495;
		pattern1[496]=496;
		pattern1[497]=497;
		pattern1[498]=498;
		pattern1[499]=499;
		pattern1[500]=500;
		pattern1[501]=501;
		pattern1[502]=502;
		pattern1[503]=503;
		pattern1[504]=504;
		pattern1[505]=505;
		pattern1[506]=506;
		pattern1[507]=507;
		pattern1[508]=508;
		pattern1[509]=509;
		pattern1[510]=510;
		pattern1[511]=511;
		pattern1[512]=512;
		pattern1[513]=513;
		pattern1[514]=514;
		pattern1[515]=515;
		pattern1[516]=516;
		pattern1[517]=517;
		pattern1[518]=518;
		pattern1[519]=519;
		pattern1[520]=520;
		pattern1[521]=521;
		pattern1[522]=522;
		pattern1[523]=523;
		pattern1[524]=524;
		pattern1[525]=525;
		pattern1[526]=526;
		pattern1[527]=527;
		pattern1[528]=528;
		pattern1[529]=529;
		pattern1[530]=530;
		pattern1[531]=531;
		pattern1[532]=532;
		pattern1[533]=533;
		pattern1[534]=534;
		pattern1[535]=535;
		pattern1[536]=536;
		pattern1[537]=537;
		pattern1[538]=538;
		pattern1[539]=539;
		pattern1[540]=540;
		pattern1[541]=541;
		pattern1[542]=542;
		pattern1[543]=543;
		pattern1[544]=544;
		pattern1[545]=545;
		pattern1[546]=546;
		pattern1[547]=547;
		pattern1[548]=548;
		pattern1[549]=549;
		pattern1[550]=550;
		pattern1[551]=551;
		pattern1[552]=552;
		pattern1[553]=553;
		pattern1[554]=554;
		pattern1[555]=555;
		pattern1[556]=556;
		pattern1[557]=557;
		pattern1[558]=558;
		pattern1[559]=559;
		pattern1[560]=560;
		pattern1[561]=561;
		pattern1[562]=562;
		pattern1[563]=563;
		pattern1[564]=564;
		pattern1[565]=565;
		pattern1[566]=566;
		pattern1[567]=567;
		pattern1[568]=568;
		pattern1[569]=569;
		pattern1[570]=570;
		pattern1[571]=571;
		pattern1[572]=572;
		pattern1[573]=573;
		pattern1[574]=574;
		pattern1[575]=575;
		pattern1[576]=576;
		pattern1[577]=577;
		pattern1[578]=578;
		pattern1[579]=579;
		pattern1[580]=580;
		pattern1[581]=581;
		pattern1[582]=582;
		pattern1[583]=583;
		pattern1[584]=584;
		pattern1[585]=585;
		pattern1[586]=586;
		pattern1[587]=587;
		pattern1[588]=588;
		pattern1[589]=589;
		pattern1[590]=590;
		pattern1[591]=591;
		pattern1[592]=592;
		pattern1[593]=593;
		pattern1[594]=594;
		pattern1[595]=595;
		pattern1[596]=596;
		pattern1[597]=597;
		pattern1[598]=598;
		pattern1[599]=599;
		pattern1[600]=600;
		pattern1[601]=601;
		pattern1[602]=602;
		pattern1[603]=603;
		pattern1[604]=604;
		pattern1[605]=605;
		pattern1[606]=606;
		pattern1[607]=607;
		pattern1[608]=608;
		pattern1[609]=609;
		pattern1[610]=610;
		pattern1[611]=611;
		pattern1[612]=612;
		pattern1[613]=613;
		pattern1[614]=614;
		pattern1[615]=615;
		pattern1[616]=616;
		pattern1[617]=617;
		pattern1[618]=618;
		pattern1[619]=619;
		pattern1[620]=620;
		pattern1[621]=621;
		pattern1[622]=622;
		pattern1[623]=623;
		pattern1[624]=624;
		pattern1[625]=625;
		pattern1[626]=626;
		pattern1[627]=627;
		pattern1[628]=628;
		pattern1[629]=629;
		pattern1[630]=630;
		pattern1[631]=631;
		pattern1[632]=632;
		pattern1[633]=633;
		pattern1[634]=634;
		pattern1[635]=635;
		pattern1[636]=636;
		pattern1[637]=637;
		pattern1[638]=638;
		pattern1[639]=639;
		pattern1[640]=640;
		pattern1[641]=641;
		pattern1[642]=642;
		pattern1[643]=643;
		pattern1[644]=644;
		pattern1[645]=645;
		pattern1[646]=646;
		pattern1[647]=647;
		pattern1[648]=648;
		pattern1[649]=649;
		pattern1[650]=650;
		pattern1[651]=651;
		pattern1[652]=652;
		pattern1[653]=653;
		pattern1[654]=654;
		pattern1[655]=655;
		pattern1[656]=656;
		pattern1[657]=657;
		pattern1[658]=658;
		pattern1[659]=659;
		pattern1[660]=660;
		pattern1[661]=661;
		pattern1[662]=662;
		pattern1[663]=663;
		pattern1[664]=664;
		pattern1[665]=665;
		pattern1[666]=666;
		pattern1[667]=667;
		pattern1[668]=668;
		pattern1[669]=669;
		pattern1[670]=670;
		pattern1[671]=671;
		pattern1[672]=672;
		pattern1[673]=673;
		pattern1[674]=674;
		pattern1[675]=675;
		pattern1[676]=676;
		pattern1[677]=677;
		pattern1[678]=678;
		pattern1[679]=679;
		pattern1[680]=680;
		pattern1[681]=681;
		pattern1[682]=682;
		pattern1[683]=683;
		pattern1[684]=684;
		pattern1[685]=685;
		pattern1[686]=686;
		pattern1[687]=687;
		pattern1[688]=688;
		pattern1[689]=689;
		pattern1[690]=690;
		pattern1[691]=691;
		pattern1[692]=692;
		pattern1[693]=693;
		pattern1[694]=694;
		pattern1[695]=695;
		pattern1[696]=696;
		pattern1[697]=697;
		pattern1[698]=698;
		pattern1[699]=699;
		pattern1[700]=700;
		pattern1[701]=701;
		pattern1[702]=702;
		pattern1[703]=703;
		pattern1[704]=704;
		pattern1[705]=705;
		pattern1[706]=706;
		pattern1[707]=707;
		pattern1[708]=708;
		pattern1[709]=709;
		pattern1[710]=710;
		pattern1[711]=711;
		pattern1[712]=712;
		pattern1[713]=713;
		pattern1[714]=714;
		pattern1[715]=715;
		pattern1[716]=716;
		pattern1[717]=717;
		pattern1[718]=718;
		pattern1[719]=719;
		pattern1[720]=720;
		pattern1[721]=721;
		pattern1[722]=722;
		pattern1[723]=723;
		pattern1[724]=724;
		pattern1[725]=725;
		pattern1[726]=726;
		pattern1[727]=727;
		pattern1[728]=728;
		pattern1[729]=729;
		pattern1[730]=730;
		pattern1[731]=731;
		pattern1[732]=732;
		pattern1[733]=733;
		pattern1[734]=734;
		pattern1[735]=735;
		pattern1[736]=736;
		pattern1[737]=737;
		pattern1[738]=738;
		pattern1[739]=739;
		pattern1[740]=740;
		pattern1[741]=741;
		pattern1[742]=742;
		pattern1[743]=743;
		pattern1[744]=744;
		pattern1[745]=745;
		pattern1[746]=746;
		pattern1[747]=747;
		pattern1[748]=748;
		pattern1[749]=749;
		pattern1[750]=750;
		pattern1[751]=751;
		pattern1[752]=752;
		pattern1[753]=753;
		pattern1[754]=754;
		pattern1[755]=755;
		pattern1[756]=756;
		pattern1[757]=757;
		pattern1[758]=758;
		pattern1[759]=759;
		pattern1[760]=760;
		pattern1[761]=761;
		pattern1[762]=762;
		pattern1[763]=763;
		pattern1[764]=764;
		pattern1[765]=765;
		pattern1[766]=766;
		pattern1[767]=767;
		pattern1[768]=768;
		pattern1[769]=769;
		pattern1[770]=770;
		pattern1[771]=771;
		pattern1[772]=772;
		pattern1[773]=773;
		pattern1[774]=774;
		pattern1[775]=775;
		pattern1[776]=776;
		pattern1[777]=777;
		pattern1[778]=778;
		pattern1[779]=779;
		pattern1[780]=780;
		pattern1[781]=781;
		pattern1[782]=782;
		pattern1[783]=783;
		pattern1[784]=784;
		pattern1[785]=785;
		pattern1[786]=786;
		pattern1[787]=787;
		pattern1[788]=788;
		pattern1[789]=789;
		pattern1[790]=790;
		pattern1[791]=791;
		pattern1[792]=792;
		pattern1[793]=793;
		pattern1[794]=794;
		pattern1[795]=795;
		pattern1[796]=796;
		pattern1[797]=797;
		pattern1[798]=798;
		pattern1[799]=799;
		pattern1[800]=800;
		pattern1[801]=801;
		pattern1[802]=802;
		pattern1[803]=803;
		pattern1[804]=804;
		pattern1[805]=805;
		pattern1[806]=806;
		pattern1[807]=807;
		pattern1[808]=808;
		pattern1[809]=809;
		pattern1[810]=810;
		pattern1[811]=811;
		pattern1[812]=812;
		pattern1[813]=813;
		pattern1[814]=814;
		pattern1[815]=815;
		pattern1[816]=816;
		pattern1[817]=817;
		pattern1[818]=818;
		pattern1[819]=819;
		pattern1[820]=820;
		pattern1[821]=821;
		pattern1[822]=822;
		pattern1[823]=823;
		pattern1[824]=824;
		pattern1[825]=825;
		pattern1[826]=826;
		pattern1[827]=827;
		pattern1[828]=828;
		pattern1[829]=829;
		pattern1[830]=830;
		pattern1[831]=831;
		pattern1[832]=832;
		pattern1[833]=833;
		pattern1[834]=834;
		pattern1[835]=835;
		pattern1[836]=836;
		pattern1[837]=837;
		pattern1[838]=838;
		pattern1[839]=839;
		pattern1[840]=840;
		pattern1[841]=841;
		pattern1[842]=842;
		pattern1[843]=843;
		pattern1[844]=844;
		pattern1[845]=845;
		pattern1[846]=846;
		pattern1[847]=847;
		pattern1[848]=848;
		pattern1[849]=849;
		pattern1[850]=850;
		pattern1[851]=851;
		pattern1[852]=852;
		pattern1[853]=853;
		pattern1[854]=854;
		pattern1[855]=855;
		pattern1[856]=856;
		pattern1[857]=857;
		pattern1[858]=858;
		pattern1[859]=859;
		pattern1[860]=860;
		pattern1[861]=861;
		pattern1[862]=862;
		pattern1[863]=863;
		pattern1[864]=864;
		pattern1[865]=865;
		pattern1[866]=866;
		pattern1[867]=867;
		pattern1[868]=868;
		pattern1[869]=869;
		pattern1[870]=870;
		pattern1[871]=871;
		pattern1[872]=872;
		pattern1[873]=873;
		pattern1[874]=874;
		pattern1[875]=875;
		pattern1[876]=876;
		pattern1[877]=877;
		pattern1[878]=878;
		pattern1[879]=879;
		pattern1[880]=880;
		pattern1[881]=881;
		pattern1[882]=882;
		pattern1[883]=883;
		pattern1[884]=884;
		pattern1[885]=885;
		pattern1[886]=886;
		pattern1[887]=887;
		pattern1[888]=888;
		pattern1[889]=889;
		pattern1[890]=890;
		pattern1[891]=891;
		pattern1[892]=892;
		pattern1[893]=893;
		pattern1[894]=894;
		pattern1[895]=895;
		pattern1[896]=896;
		pattern1[897]=897;
		pattern1[898]=898;
		pattern1[899]=899;
		pattern1[900]=900;
		pattern1[901]=901;
		pattern1[902]=902;
		pattern1[903]=903;
		pattern1[904]=904;
		pattern1[905]=905;
		pattern1[906]=906;
		pattern1[907]=907;
		pattern1[908]=908;
		pattern1[909]=909;
		pattern1[910]=910;
		pattern1[911]=911;
		pattern1[912]=912;
		pattern1[913]=913;
		pattern1[914]=914;
		pattern1[915]=915;
		pattern1[916]=916;
		pattern1[917]=917;
		pattern1[918]=918;
		pattern1[919]=919;
		pattern1[920]=920;
		pattern1[921]=921;
		pattern1[922]=922;
		pattern1[923]=923;
		pattern1[924]=924;
		pattern1[925]=925;
		pattern1[926]=926;
		pattern1[927]=927;
		pattern1[928]=928;
		pattern1[929]=929;
		pattern1[930]=930;
		pattern1[931]=931;
		pattern1[932]=932;
		pattern1[933]=933;
		pattern1[934]=934;
		pattern1[935]=935;
		pattern1[936]=936;
		pattern1[937]=937;
		pattern1[938]=938;
		pattern1[939]=939;
		pattern1[940]=940;
		pattern1[941]=941;
		pattern1[942]=942;
		pattern1[943]=943;
		pattern1[944]=944;
		pattern1[945]=945;
		pattern1[946]=946;
		pattern1[947]=947;
		pattern1[948]=948;
		pattern1[949]=949;
		pattern1[950]=950;
		pattern1[951]=951;
		pattern1[952]=952;
		pattern1[953]=953;
		pattern1[954]=954;
		pattern1[955]=955;
		pattern1[956]=956;
		pattern1[957]=957;
		pattern1[958]=958;
		pattern1[959]=959;
		pattern1[960]=960;
		pattern1[961]=961;
		pattern1[962]=962;
		pattern1[963]=963;
		pattern1[964]=964;
		pattern1[965]=965;
		pattern1[966]=966;
		pattern1[967]=967;
		pattern1[968]=968;
		pattern1[969]=969;
		pattern1[970]=970;
		pattern1[971]=971;
		pattern1[972]=972;
		pattern1[973]=973;
		pattern1[974]=974;
		pattern1[975]=975;
		pattern1[976]=976;
		pattern1[977]=977;
		pattern1[978]=978;
		pattern1[979]=979;
		pattern1[980]=980;
		pattern1[981]=981;
		pattern1[982]=982;
		pattern1[983]=983;
		pattern1[984]=984;
		pattern1[985]=985;
		pattern1[986]=986;
		pattern1[987]=987;
		pattern1[988]=988;
		pattern1[989]=989;
		pattern1[990]=990;
		pattern1[991]=991;
		pattern1[992]=992;
		pattern1[993]=993;
		pattern1[994]=994;
		pattern1[995]=995;
		pattern1[996]=996;
		pattern1[997]=997;
		pattern1[998]=998;
		pattern1[999]=999;
		pattern1[1000]=1000;
		pattern1[1001]=1001;
		pattern1[1002]=1002;
		pattern1[1003]=1003;
		pattern1[1004]=1004;
		pattern1[1005]=1005;
		pattern1[1006]=1006;
		pattern1[1007]=1007;
		pattern1[1008]=1008;
		pattern1[1009]=1009;
		pattern1[1010]=1010;
		pattern1[1011]=1011;
		pattern1[1012]=1012;
		pattern1[1013]=1013;
		pattern1[1014]=1014;
		pattern1[1015]=1015;
		pattern1[1016]=1016;
		pattern1[1017]=1017;
		pattern1[1018]=1018;
		pattern1[1019]=1019;
		pattern1[1020]=1020;
		pattern1[1021]=1021;
		pattern1[1022]=1022;
		pattern1[1023]=1023;
		pattern1[1024]=1024;
		pattern1[1025]=1025;
		pattern1[1026]=1026;
		pattern1[1027]=1027;
		pattern1[1028]=1028;
		pattern1[1029]=1029;
		pattern1[1030]=1030;
		pattern1[1031]=1031;
		pattern1[1032]=1032;
		pattern1[1033]=1033;
		pattern1[1034]=1034;
		pattern1[1035]=1035;
		pattern1[1036]=1036;
		pattern1[1037]=1037;
		pattern1[1038]=1038;
		pattern1[1039]=1039;
		pattern1[1040]=1040;
		pattern1[1041]=1041;
		pattern1[1042]=1042;
		pattern1[1043]=1043;
		pattern1[1044]=1044;
		pattern1[1045]=1045;
		pattern1[1046]=1046;
		pattern1[1047]=1047;
		pattern1[1048]=1048;
		pattern1[1049]=1049;
		pattern1[1050]=1050;
		pattern1[1051]=1051;
		pattern1[1052]=1052;
		pattern1[1053]=1053;
		pattern1[1054]=1054;
		pattern1[1055]=1055;
		pattern1[1056]=1056;
		pattern1[1057]=1057;
		pattern1[1058]=1058;
		pattern1[1059]=1059;
		pattern1[1060]=1060;
		pattern1[1061]=1061;
		pattern1[1062]=1062;
		pattern1[1063]=1063;
		pattern1[1064]=1064;
		pattern1[1065]=1065;
		pattern1[1066]=1066;
		pattern1[1067]=1067;
		pattern1[1068]=1068;
		pattern1[1069]=1069;
		pattern1[1070]=1070;
		pattern1[1071]=1071;
		pattern1[1072]=1072;
		pattern1[1073]=1073;
		pattern1[1074]=1074;
		pattern1[1075]=1075;
		pattern1[1076]=1076;
		pattern1[1077]=1077;
		pattern1[1078]=1078;
		pattern1[1079]=1079;
		pattern1[1080]=1080;
		pattern1[1081]=1081;
		pattern1[1082]=1082;
		pattern1[1083]=1083;
		pattern1[1084]=1084;
		pattern1[1085]=1085;
		pattern1[1086]=1086;
		pattern1[1087]=1087;
		pattern1[1088]=1088;
		pattern1[1089]=1089;
		pattern1[1090]=1090;
		pattern1[1091]=1091;
		pattern1[1092]=1092;
		pattern1[1093]=1093;
		pattern1[1094]=1094;
		pattern1[1095]=1095;
		pattern1[1096]=1096;
		pattern1[1097]=1097;
		pattern1[1098]=1098;
		pattern1[1099]=1099;
		pattern1[1100]=1100;
		pattern1[1101]=1101;
		pattern1[1102]=1102;
		pattern1[1103]=1103;
		pattern1[1104]=1104;
		pattern1[1105]=1105;
		pattern1[1106]=1106;
		pattern1[1107]=1107;
		pattern1[1108]=1108;
		pattern1[1109]=1109;
		pattern1[1110]=1110;
		pattern1[1111]=1111;
		pattern1[1112]=1112;
		pattern1[1113]=1113;
		pattern1[1114]=1114;
		pattern1[1115]=1115;
		pattern1[1116]=1116;
		pattern1[1117]=1117;
		pattern1[1118]=1118;
		pattern1[1119]=1119;
		pattern1[1120]=1120;
		pattern1[1121]=1121;
		pattern1[1122]=1122;
		pattern1[1123]=1123;
		pattern1[1124]=1124;
		pattern1[1125]=1125;
		pattern1[1126]=1126;
		pattern1[1127]=1127;
		pattern1[1128]=1128;
		pattern1[1129]=1129;
		pattern1[1130]=1130;
		pattern1[1131]=1131;
		pattern1[1132]=1132;
		pattern1[1133]=1133;
		pattern1[1134]=1134;
		pattern1[1135]=1135;
		pattern1[1136]=1136;
		pattern1[1137]=1137;
		pattern1[1138]=1138;
		pattern1[1139]=1139;
		pattern1[1140]=1140;
		pattern1[1141]=1141;
		pattern1[1142]=1142;
		pattern1[1143]=1143;
		pattern1[1144]=1144;
		pattern1[1145]=1145;
		pattern1[1146]=1146;
		pattern1[1147]=1147;
		pattern1[1148]=1148;
		pattern1[1149]=1149;
		pattern1[1150]=1150;
		pattern1[1151]=1151;
		pattern1[1152]=1152;
		pattern1[1153]=1153;
		pattern1[1154]=1154;
		pattern1[1155]=1155;
		pattern1[1156]=1156;
		pattern1[1157]=1157;
		pattern1[1158]=1158;
		pattern1[1159]=1159;
		pattern1[1160]=1160;
		pattern1[1161]=1161;
		pattern1[1162]=1162;
		pattern1[1163]=1163;
		pattern1[1164]=1164;
		pattern1[1165]=1165;
		pattern1[1166]=1166;
		pattern1[1167]=1167;
		pattern1[1168]=1168;
		pattern1[1169]=1169;
		pattern1[1170]=1170;
		pattern1[1171]=1171;
		pattern1[1172]=1172;
		pattern1[1173]=1173;
		pattern1[1174]=1174;
		pattern1[1175]=1175;
		pattern1[1176]=1176;
		pattern1[1177]=1177;
		pattern1[1178]=1178;
		pattern1[1179]=1179;
		pattern1[1180]=1180;
		pattern1[1181]=1181;
		pattern1[1182]=1182;
		pattern1[1183]=1183;
		pattern1[1184]=1184;
		pattern1[1185]=1185;
		pattern1[1186]=1186;
		pattern1[1187]=1187;
		pattern1[1188]=1188;
		pattern1[1189]=1189;
		pattern1[1190]=1190;
		pattern1[1191]=1191;
		pattern1[1192]=1192;
		pattern1[1193]=1193;
		pattern1[1194]=1194;
		pattern1[1195]=1195;
		pattern1[1196]=1196;
		pattern1[1197]=1197;
		pattern1[1198]=1198;
		pattern1[1199]=1199;
		pattern1[1200]=1200;
		pattern1[1201]=1201;
		pattern1[1202]=1202;
		pattern1[1203]=1203;
		pattern1[1204]=1204;
		pattern1[1205]=1205;
		pattern1[1206]=1206;
		pattern1[1207]=1207;
		pattern1[1208]=1208;
		pattern1[1209]=1209;
		pattern1[1210]=1210;
		pattern1[1211]=1211;
		pattern1[1212]=1212;
		pattern1[1213]=1213;
		pattern1[1214]=1214;
		pattern1[1215]=1215;
		pattern1[1216]=1216;
		pattern1[1217]=1217;
		pattern1[1218]=1218;
		pattern1[1219]=1219;
		pattern1[1220]=1220;
		pattern1[1221]=1221;
		pattern1[1222]=1222;
		pattern1[1223]=1223;
		pattern1[1224]=1224;
		pattern1[1225]=1225;
		pattern1[1226]=1226;
		pattern1[1227]=1227;
		pattern1[1228]=1228;
		pattern1[1229]=1229;
		pattern1[1230]=1230;
		pattern1[1231]=1231;
		pattern1[1232]=1232;
		pattern1[1233]=1233;
		pattern1[1234]=1234;
		pattern1[1235]=1235;
		pattern1[1236]=1236;
		pattern1[1237]=1237;
		pattern1[1238]=1238;
		pattern1[1239]=1239;
		pattern1[1240]=1240;
		pattern1[1241]=1241;
		pattern1[1242]=1242;
		pattern1[1243]=1243;
		pattern1[1244]=1244;
		pattern1[1245]=1245;
		pattern1[1246]=1246;
		pattern1[1247]=1247;
		pattern1[1248]=1248;
		pattern1[1249]=1249;
		pattern1[1250]=1250;
		pattern1[1251]=1251;
		pattern1[1252]=1252;
		pattern1[1253]=1253;
		pattern1[1254]=1254;
		pattern1[1255]=1255;
		pattern1[1256]=1256;
		pattern1[1257]=1257;
		pattern1[1258]=1258;
		pattern1[1259]=1259;
		pattern1[1260]=1260;
		pattern1[1261]=1261;
		pattern1[1262]=1262;
		pattern1[1263]=1263;
		pattern1[1264]=1264;
		pattern1[1265]=1265;
		pattern1[1266]=1266;
		pattern1[1267]=1267;
		pattern1[1268]=1268;
		pattern1[1269]=1269;
		pattern1[1270]=1270;
		pattern1[1271]=1271;
		pattern1[1272]=1272;
		pattern1[1273]=1273;
		pattern1[1274]=1274;
		pattern1[1275]=1275;
		pattern1[1276]=1276;
		pattern1[1277]=1277;
		pattern1[1278]=1278;
		pattern1[1279]=1279;
		pattern1[1280]=1280;
		pattern1[1281]=1281;
		pattern1[1282]=1282;
		pattern1[1283]=1283;
		pattern1[1284]=1284;
		pattern1[1285]=1285;
		pattern1[1286]=1286;
		pattern1[1287]=1287;
		pattern1[1288]=1288;
		pattern1[1289]=1289;
		pattern1[1290]=1290;
		pattern1[1291]=1291;
		pattern1[1292]=1292;
		pattern1[1293]=1293;
		pattern1[1294]=1294;
		pattern1[1295]=1295;
		pattern1[1296]=1296;
		pattern1[1297]=1297;
		pattern1[1298]=1298;
		pattern1[1299]=1299;
		pattern1[1300]=1300;
		pattern1[1301]=1301;
		pattern1[1302]=1302;
		pattern1[1303]=1303;
		pattern1[1304]=1304;
		pattern1[1305]=1305;
		pattern1[1306]=1306;
		pattern1[1307]=1307;
		pattern1[1308]=1308;
		pattern1[1309]=1309;
		pattern1[1310]=1310;
		pattern1[1311]=1311;
		pattern1[1312]=1312;
		pattern1[1313]=1313;
		pattern1[1314]=1314;
		pattern1[1315]=1315;
		pattern1[1316]=1316;
		pattern1[1317]=1317;
		pattern1[1318]=1318;
		pattern1[1319]=1319;
		pattern1[1320]=1320;
		pattern1[1321]=1321;
		pattern1[1322]=1322;
		pattern1[1323]=1323;
		pattern1[1324]=1324;
		pattern1[1325]=1325;
		pattern1[1326]=1326;
		pattern1[1327]=1327;
		pattern1[1328]=1328;
		pattern1[1329]=1329;
		pattern1[1330]=1330;
		pattern1[1331]=1331;
		pattern1[1332]=1332;
		pattern1[1333]=1333;
		pattern1[1334]=1334;
		pattern1[1335]=1335;
		pattern1[1336]=1336;
		pattern1[1337]=1337;
		pattern1[1338]=1338;
		pattern1[1339]=1339;
		pattern1[1340]=1340;
		pattern1[1341]=1341;
		pattern1[1342]=1342;
		pattern1[1343]=1343;
		pattern1[1344]=1344;
		pattern1[1345]=1345;
		pattern1[1346]=1346;
		pattern1[1347]=1347;
		pattern1[1348]=1348;
		pattern1[1349]=1349;
		pattern1[1350]=1350;
		pattern1[1351]=1351;
		pattern1[1352]=1352;
		pattern1[1353]=1353;
		pattern1[1354]=1354;
		pattern1[1355]=1355;
		pattern1[1356]=1356;
		pattern1[1357]=1357;
		pattern1[1358]=1358;
		pattern1[1359]=1359;
		pattern1[1360]=1360;
		pattern1[1361]=1361;
		pattern1[1362]=1362;
		pattern1[1363]=1363;
		pattern1[1364]=1364;
		pattern1[1365]=1365;
		pattern1[1366]=1366;
		pattern1[1367]=1367;
		pattern1[1368]=1368;
		pattern1[1369]=1369;
		pattern1[1370]=1370;
		pattern1[1371]=1371;
		pattern1[1372]=1372;
		pattern1[1373]=1373;
		pattern1[1374]=1374;
		pattern1[1375]=1375;
		pattern1[1376]=1376;
		pattern1[1377]=1377;
		pattern1[1378]=1378;
		pattern1[1379]=1379;
		pattern1[1380]=1380;
		pattern1[1381]=1381;
		pattern1[1382]=1382;
		pattern1[1383]=1383;
		pattern1[1384]=1384;
		pattern1[1385]=1385;
		pattern1[1386]=1386;
		pattern1[1387]=1387;
		pattern1[1388]=1388;
		pattern1[1389]=1389;
		pattern1[1390]=1390;
		pattern1[1391]=1391;
		pattern1[1392]=1392;
		pattern1[1393]=1393;
		pattern1[1394]=1394;
		pattern1[1395]=1395;
		pattern1[1396]=1396;
		pattern1[1397]=1397;
		pattern1[1398]=1398;
		pattern1[1399]=1399;
		pattern1[1400]=1400;
		pattern1[1401]=1401;
		pattern1[1402]=1402;
		pattern1[1403]=1403;
		pattern1[1404]=1404;
		pattern1[1405]=1405;
		pattern1[1406]=1406;
		pattern1[1407]=1407;
		pattern1[1408]=1408;
		pattern1[1409]=1409;
		pattern1[1410]=1410;
		pattern1[1411]=1411;
		pattern1[1412]=1412;
		pattern1[1413]=1413;
		pattern1[1414]=1414;
		pattern1[1415]=1415;
		pattern1[1416]=1416;
		pattern1[1417]=1417;
		pattern1[1418]=1418;
		pattern1[1419]=1419;
		pattern1[1420]=1420;
		pattern1[1421]=1421;
		pattern1[1422]=1422;
		pattern1[1423]=1423;
		pattern1[1424]=1424;
		pattern1[1425]=1425;
		pattern1[1426]=1426;
		pattern1[1427]=1427;
		pattern1[1428]=1428;
		pattern1[1429]=1429;
		pattern1[1430]=1430;
		pattern1[1431]=1431;
		pattern1[1432]=1432;
		pattern1[1433]=1433;
		pattern1[1434]=1434;
		pattern1[1435]=1435;
		pattern1[1436]=1436;
		pattern1[1437]=1437;
		pattern1[1438]=1438;
		pattern1[1439]=1439;
		pattern1[1440]=1440;
		pattern1[1441]=1441;
		pattern1[1442]=1442;
		pattern1[1443]=1443;
		pattern1[1444]=1444;
		pattern1[1445]=1445;
		pattern1[1446]=1446;
		pattern1[1447]=1447;
		pattern1[1448]=1448;
		pattern1[1449]=1449;
		pattern1[1450]=1450;
		pattern1[1451]=1451;
		pattern1[1452]=1452;
		pattern1[1453]=1453;
		pattern1[1454]=1454;
		pattern1[1455]=1455;
		pattern1[1456]=1456;
		pattern1[1457]=1457;
		pattern1[1458]=1458;
		pattern1[1459]=1459;
		pattern1[1460]=1460;
		pattern1[1461]=1461;
		pattern1[1462]=1462;
		pattern1[1463]=1463;
		pattern1[1464]=1464;
		pattern1[1465]=1465;
		pattern1[1466]=1466;
		pattern1[1467]=1467;
		pattern1[1468]=1468;
		pattern1[1469]=1469;
		pattern1[1470]=1470;
		pattern1[1471]=1471;
		pattern1[1472]=1472;
		pattern1[1473]=1473;
		pattern1[1474]=1474;
		pattern1[1475]=1475;
		pattern1[1476]=1476;
		pattern1[1477]=1477;
		pattern1[1478]=1478;
		pattern1[1479]=1479;
		pattern1[1480]=1480;
		pattern1[1481]=1481;
		pattern1[1482]=1482;
		pattern1[1483]=1483;
		pattern1[1484]=1484;
		pattern1[1485]=1485;
		pattern1[1486]=1486;
		pattern1[1487]=1487;
		pattern1[1488]=1488;
		pattern1[1489]=1489;
		pattern1[1490]=1490;
		pattern1[1491]=1491;
		pattern1[1492]=1492;
		pattern1[1493]=1493;
		pattern1[1494]=1494;
		pattern1[1495]=1495;
		pattern1[1496]=1496;
		pattern1[1497]=1497;
		pattern1[1498]=1498;
		pattern1[1499]=1499;
		pattern1[1500]=1500;
		pattern1[1501]=1501;
		pattern1[1502]=1502;
		pattern1[1503]=1503;
		pattern1[1504]=1504;
		pattern1[1505]=1505;
		pattern1[1506]=1506;
		pattern1[1507]=1507;
		pattern1[1508]=1508;
		pattern1[1509]=1509;
		pattern1[1510]=1510;
		pattern1[1511]=1511;
		pattern1[1512]=1512;
		pattern1[1513]=1513;
		pattern1[1514]=1514;
		pattern1[1515]=1515;
		pattern1[1516]=1516;
		pattern1[1517]=1517;
		pattern1[1518]=1518;
		pattern1[1519]=1519;
		pattern1[1520]=1520;
		pattern1[1521]=1521;
		pattern1[1522]=1522;
		pattern1[1523]=1523;
		pattern1[1524]=1524;
		pattern1[1525]=1525;
		pattern1[1526]=1526;
		pattern1[1527]=1527;
		pattern1[1528]=1528;
		pattern1[1529]=1529;
		pattern1[1530]=1530;
		pattern1[1531]=1531;
		pattern1[1532]=1532;
		pattern1[1533]=1533;
		pattern1[1534]=1534;
		pattern1[1535]=1535;
		pattern1[1536]=1536;
		pattern1[1537]=1537;
		pattern1[1538]=1538;
		pattern1[1539]=1539;
		pattern1[1540]=1540;
		pattern1[1541]=1541;
		pattern1[1542]=1542;
		pattern1[1543]=1543;
		pattern1[1544]=1544;
		pattern1[1545]=1545;
		pattern1[1546]=1546;
		pattern1[1547]=1547;
		pattern1[1548]=1548;
		pattern1[1549]=1549;
		pattern1[1550]=1550;
		pattern1[1551]=1551;
		pattern1[1552]=1552;
		pattern1[1553]=1553;
		pattern1[1554]=1554;
		pattern1[1555]=1555;
		pattern1[1556]=1556;
		pattern1[1557]=1557;
		pattern1[1558]=1558;
		pattern1[1559]=1559;
		pattern1[1560]=1560;
		pattern1[1561]=1561;
		pattern1[1562]=1562;
		pattern1[1563]=1563;
		pattern1[1564]=1564;
		pattern1[1565]=1565;
		pattern1[1566]=1566;
		pattern1[1567]=1567;
		pattern1[1568]=1568;
		pattern1[1569]=1569;
		pattern1[1570]=1570;
		pattern1[1571]=1571;
		pattern1[1572]=1572;
		pattern1[1573]=1573;
		pattern1[1574]=1574;
		pattern1[1575]=1575;
		pattern1[1576]=1576;
		pattern1[1577]=1577;
		pattern1[1578]=1578;
		pattern1[1579]=1579;
		pattern1[1580]=1580;
		pattern1[1581]=1581;
		pattern1[1582]=1582;
		pattern1[1583]=1583;
		pattern1[1584]=1584;
		pattern1[1585]=1585;
		pattern1[1586]=1586;
		pattern1[1587]=1587;
		pattern1[1588]=1588;
		pattern1[1589]=1589;
		pattern1[1590]=1590;
		pattern1[1591]=1591;
		pattern1[1592]=1592;
		pattern1[1593]=1593;
		pattern1[1594]=1594;
		pattern1[1595]=1595;
		pattern1[1596]=1596;
		pattern1[1597]=1597;
		pattern1[1598]=1598;
		pattern1[1599]=1599;
		pattern1[1600]=1600;
		pattern1[1601]=1601;
		pattern1[1602]=1602;
		pattern1[1603]=1603;
		pattern1[1604]=1604;
		pattern1[1605]=1605;
		pattern1[1606]=1606;
		pattern1[1607]=1607;
		pattern1[1608]=1608;
		pattern1[1609]=1609;
		pattern1[1610]=1610;
		pattern1[1611]=1611;
		pattern1[1612]=1612;
		pattern1[1613]=1613;
		pattern1[1614]=1614;
		pattern1[1615]=1615;
		pattern1[1616]=1616;
		pattern1[1617]=1617;
		pattern1[1618]=1618;
		pattern1[1619]=1619;
		pattern1[1620]=1620;
		pattern1[1621]=1621;
		pattern1[1622]=1622;
		pattern1[1623]=1623;
		pattern1[1624]=1624;
		pattern1[1625]=1625;
		pattern1[1626]=1626;
		pattern1[1627]=1627;
		pattern1[1628]=1628;
		pattern1[1629]=1629;
		pattern1[1630]=1630;
		pattern1[1631]=1631;
		pattern1[1632]=1632;
		pattern1[1633]=1633;
		pattern1[1634]=1634;
		pattern1[1635]=1635;
		pattern1[1636]=1636;
		pattern1[1637]=1637;
		pattern1[1638]=1638;
		pattern1[1639]=1639;
		pattern1[1640]=1640;
		pattern1[1641]=1641;
		pattern1[1642]=1642;
		pattern1[1643]=1643;
		pattern1[1644]=1644;
		pattern1[1645]=1645;
		pattern1[1646]=1646;
		pattern1[1647]=1647;
		pattern1[1648]=1648;
		pattern1[1649]=1649;
		pattern1[1650]=1650;
		pattern1[1651]=1651;
		pattern1[1652]=1652;
		pattern1[1653]=1653;
		pattern1[1654]=1654;
		pattern1[1655]=1655;
		pattern1[1656]=1656;
		pattern1[1657]=1657;
		pattern1[1658]=1658;
		pattern1[1659]=1659;
		pattern1[1660]=1660;
		pattern1[1661]=1661;
		pattern1[1662]=1662;
		pattern1[1663]=1663;
		pattern1[1664]=1664;
		pattern1[1665]=1665;
		pattern1[1666]=1666;
		pattern1[1667]=1667;
		pattern1[1668]=1668;
		pattern1[1669]=1669;
		pattern1[1670]=1670;
		pattern1[1671]=1671;
		pattern1[1672]=1672;
		pattern1[1673]=1673;
		pattern1[1674]=1674;
		pattern1[1675]=1675;
		pattern1[1676]=1676;
		pattern1[1677]=1677;
		pattern1[1678]=1678;
		pattern1[1679]=1679;
		pattern1[1680]=1680;
		pattern1[1681]=1681;
		pattern1[1682]=1682;
		pattern1[1683]=1683;
		pattern1[1684]=1684;
		pattern1[1685]=1685;
		pattern1[1686]=1686;
		pattern1[1687]=1687;
		pattern1[1688]=1688;
		pattern1[1689]=1689;
		pattern1[1690]=1690;
		pattern1[1691]=1691;
		pattern1[1692]=1692;
		pattern1[1693]=1693;
		pattern1[1694]=1694;
		pattern1[1695]=1695;
		pattern1[1696]=1696;
		pattern1[1697]=1697;
		pattern1[1698]=1698;
		pattern1[1699]=1699;
		pattern1[1700]=1700;
		pattern1[1701]=1701;
		pattern1[1702]=1702;
		pattern1[1703]=1703;
		pattern1[1704]=1704;
		pattern1[1705]=1705;
		pattern1[1706]=1706;
		pattern1[1707]=1707;
		pattern1[1708]=1708;
		pattern1[1709]=1709;
		pattern1[1710]=1710;
		pattern1[1711]=1711;
		pattern1[1712]=1712;
		pattern1[1713]=1713;
		pattern1[1714]=1714;
		pattern1[1715]=1715;
		pattern1[1716]=1716;
		pattern1[1717]=1717;
		pattern1[1718]=1718;
		pattern1[1719]=1719;
		pattern1[1720]=1720;
		pattern1[1721]=1721;
		pattern1[1722]=1722;
		pattern1[1723]=1723;
		pattern1[1724]=1724;
		pattern1[1725]=1725;
		pattern1[1726]=1726;
		pattern1[1727]=1727;
		pattern1[1728]=1728;
		pattern1[1729]=1729;
		pattern1[1730]=1730;
		pattern1[1731]=1731;
		pattern1[1732]=1732;
		pattern1[1733]=1733;
		pattern1[1734]=1734;
		pattern1[1735]=1735;
		pattern1[1736]=1736;
		pattern1[1737]=1737;
		pattern1[1738]=1738;
		pattern1[1739]=1739;
		pattern1[1740]=1740;
		pattern1[1741]=1741;
		pattern1[1742]=1742;
		pattern1[1743]=1743;
		pattern1[1744]=1744;
		pattern1[1745]=1745;
		pattern1[1746]=1746;
		pattern1[1747]=1747;
		pattern1[1748]=1748;
		pattern1[1749]=1749;
		pattern1[1750]=1750;
		pattern1[1751]=1751;
		pattern1[1752]=1752;
		pattern1[1753]=1753;
		pattern1[1754]=1754;
		pattern1[1755]=1755;
		pattern1[1756]=1756;
		pattern1[1757]=1757;
		pattern1[1758]=1758;
		pattern1[1759]=1759;
		pattern1[1760]=1760;
		pattern1[1761]=1761;
		pattern1[1762]=1762;
		pattern1[1763]=1763;
		pattern1[1764]=1764;
		pattern1[1765]=1765;
		pattern1[1766]=1766;
		pattern1[1767]=1767;
		pattern1[1768]=1768;
		pattern1[1769]=1769;
		pattern1[1770]=1770;
		pattern1[1771]=1771;
		pattern1[1772]=1772;
		pattern1[1773]=1773;
		pattern1[1774]=1774;
		pattern1[1775]=1775;
		pattern1[1776]=1776;
		pattern1[1777]=1777;
		pattern1[1778]=1778;
		pattern1[1779]=1779;
		pattern1[1780]=1780;
		pattern1[1781]=1781;
		pattern1[1782]=1782;
		pattern1[1783]=1783;
		pattern1[1784]=1784;
		pattern1[1785]=1785;
		pattern1[1786]=1786;
		pattern1[1787]=1787;
		pattern1[1788]=1788;
		pattern1[1789]=1789;
		pattern1[1790]=1790;
		pattern1[1791]=1791;
		pattern1[1792]=1792;
		pattern1[1793]=1793;
		pattern1[1794]=1794;
		pattern1[1795]=1795;
		pattern1[1796]=1796;
		pattern1[1797]=1797;
		pattern1[1798]=1798;
		pattern1[1799]=1799;
		pattern1[1800]=1800;
		pattern1[1801]=1801;
		pattern1[1802]=1802;
		pattern1[1803]=1803;
		pattern1[1804]=1804;
		pattern1[1805]=1805;
		pattern1[1806]=1806;
		pattern1[1807]=1807;
		pattern1[1808]=1808;
		pattern1[1809]=1809;
		pattern1[1810]=1810;
		pattern1[1811]=1811;
		pattern1[1812]=1812;
		pattern1[1813]=1813;
		pattern1[1814]=1814;
		pattern1[1815]=1815;
		pattern1[1816]=1816;
		pattern1[1817]=1817;
		pattern1[1818]=1818;
		pattern1[1819]=1819;
		pattern1[1820]=1820;
		pattern1[1821]=1821;
		pattern1[1822]=1822;
		pattern1[1823]=1823;
		pattern1[1824]=1824;
		pattern1[1825]=1825;
		pattern1[1826]=1826;
		pattern1[1827]=1827;
		pattern1[1828]=1828;
		pattern1[1829]=1829;
		pattern1[1830]=1830;
		pattern1[1831]=1831;
		pattern1[1832]=1832;
		pattern1[1833]=1833;
		pattern1[1834]=1834;
		pattern1[1835]=1835;
		pattern1[1836]=1836;
		pattern1[1837]=1837;
		pattern1[1838]=1838;
		pattern1[1839]=1839;
		pattern1[1840]=1840;
		pattern1[1841]=1841;
		pattern1[1842]=1842;
		pattern1[1843]=1843;
		pattern1[1844]=1844;
		pattern1[1845]=1845;
		pattern1[1846]=1846;
		pattern1[1847]=1847;
		pattern1[1848]=1848;
		pattern1[1849]=1849;
		pattern1[1850]=1850;
		pattern1[1851]=1851;
		pattern1[1852]=1852;
		pattern1[1853]=1853;
		pattern1[1854]=1854;
		pattern1[1855]=1855;
		pattern1[1856]=1856;
		pattern1[1857]=1857;
		pattern1[1858]=1858;
		pattern1[1859]=1859;
		pattern1[1860]=1860;
		pattern1[1861]=1861;
		pattern1[1862]=1862;
		pattern1[1863]=1863;
		pattern1[1864]=1864;
		pattern1[1865]=1865;
		pattern1[1866]=1866;
		pattern1[1867]=1867;
		pattern1[1868]=1868;
		pattern1[1869]=1869;
		pattern1[1870]=1870;
		pattern1[1871]=1871;
		pattern1[1872]=1872;
		pattern1[1873]=1873;
		pattern1[1874]=1874;
		pattern1[1875]=1875;
		pattern1[1876]=1876;
		pattern1[1877]=1877;
		pattern1[1878]=1878;
		pattern1[1879]=1879;
		pattern1[1880]=1880;
		pattern1[1881]=1881;
		pattern1[1882]=1882;
		pattern1[1883]=1883;
		pattern1[1884]=1884;
		pattern1[1885]=1885;
		pattern1[1886]=1886;
		pattern1[1887]=1887;
		pattern1[1888]=1888;
		pattern1[1889]=1889;
		pattern1[1890]=1890;
		pattern1[1891]=1891;
		pattern1[1892]=1892;
		pattern1[1893]=1893;
		pattern1[1894]=1894;
		pattern1[1895]=1895;
		pattern1[1896]=1896;
		pattern1[1897]=1897;
		pattern1[1898]=1898;
		pattern1[1899]=1899;
		pattern1[1900]=1900;
		pattern1[1901]=1901;
		pattern1[1902]=1902;
		pattern1[1903]=1903;
		pattern1[1904]=1904;
		pattern1[1905]=1905;
		pattern1[1906]=1906;
		pattern1[1907]=1907;
		pattern1[1908]=1908;
		pattern1[1909]=1909;
		pattern1[1910]=1910;
		pattern1[1911]=1911;
		pattern1[1912]=1912;
		pattern1[1913]=1913;
		pattern1[1914]=1914;
		pattern1[1915]=1915;
		pattern1[1916]=1916;
		pattern1[1917]=1917;
		pattern1[1918]=1918;
		pattern1[1919]=1919;
		pattern1[1920]=1920;
		pattern1[1921]=1921;
		pattern1[1922]=1922;
		pattern1[1923]=1923;
		pattern1[1924]=1924;
		pattern1[1925]=1925;
		pattern1[1926]=1926;
		pattern1[1927]=1927;
		pattern1[1928]=1928;
		pattern1[1929]=1929;
		pattern1[1930]=1930;
		pattern1[1931]=1931;
		pattern1[1932]=1932;
		pattern1[1933]=1933;
		pattern1[1934]=1934;
		pattern1[1935]=1935;
		pattern1[1936]=1936;
		pattern1[1937]=1937;
		pattern1[1938]=1938;
		pattern1[1939]=1939;
		pattern1[1940]=1940;
		pattern1[1941]=1941;
		pattern1[1942]=1942;
		pattern1[1943]=1943;
		pattern1[1944]=1944;
		pattern1[1945]=1945;
		pattern1[1946]=1946;
		pattern1[1947]=1947;
		pattern1[1948]=1948;
		pattern1[1949]=1949;
		pattern1[1950]=1950;
		pattern1[1951]=1951;
		pattern1[1952]=1952;
		pattern1[1953]=1953;
		pattern1[1954]=1954;
		pattern1[1955]=1955;
		pattern1[1956]=1956;
		pattern1[1957]=1957;
		pattern1[1958]=1958;
		pattern1[1959]=1959;
		pattern1[1960]=1960;
		pattern1[1961]=1961;
		pattern1[1962]=1962;
		pattern1[1963]=1963;
		pattern1[1964]=1964;
		pattern1[1965]=1965;
		pattern1[1966]=1966;
		pattern1[1967]=1967;
		pattern1[1968]=1968;
		pattern1[1969]=1969;
		pattern1[1970]=1970;
		pattern1[1971]=1971;
		pattern1[1972]=1972;
		pattern1[1973]=1973;
		pattern1[1974]=1974;
		pattern1[1975]=1975;
		pattern1[1976]=1976;
		pattern1[1977]=1977;
		pattern1[1978]=1978;
		pattern1[1979]=1979;
		pattern1[1980]=1980;
		pattern1[1981]=1981;
		pattern1[1982]=1982;
		pattern1[1983]=1983;
		pattern1[1984]=1984;
		pattern1[1985]=1985;
		pattern1[1986]=1986;
		pattern1[1987]=1987;
		pattern1[1988]=1988;
		pattern1[1989]=1989;
		pattern1[1990]=1990;
		pattern1[1991]=1991;
		pattern1[1992]=1992;
		pattern1[1993]=1993;
		pattern1[1994]=1994;
		pattern1[1995]=1995;
		pattern1[1996]=1996;
		pattern1[1997]=1997;
		pattern1[1998]=1998;
		pattern1[1999]=1999;
		pattern1[2000]=2000;
		pattern1[2001]=2001;
		pattern1[2002]=2002;
		pattern1[2003]=2003;
		pattern1[2004]=2004;
		pattern1[2005]=2005;
		pattern1[2006]=2006;
		pattern1[2007]=2007;
		pattern1[2008]=2008;
		pattern1[2009]=2009;
		pattern1[2010]=2010;
		pattern1[2011]=2011;
		pattern1[2012]=2012;
		pattern1[2013]=2013;
		pattern1[2014]=2014;
		pattern1[2015]=2015;
		pattern1[2016]=2016;
		pattern1[2017]=2017;
		pattern1[2018]=2018;
		pattern1[2019]=2019;
		pattern1[2020]=2020;
		pattern1[2021]=2021;
		pattern1[2022]=2022;
		pattern1[2023]=2023;
		pattern1[2024]=2024;
		pattern1[2025]=2025;
		pattern1[2026]=2026;
		pattern1[2027]=2027;
		pattern1[2028]=2028;
		pattern1[2029]=2029;
		pattern1[2030]=2030;
		pattern1[2031]=2031;
		pattern1[2032]=2032;
		pattern1[2033]=2033;
		pattern1[2034]=2034;
		pattern1[2035]=2035;
		pattern1[2036]=2036;
		pattern1[2037]=2037;
		pattern1[2038]=2038;
		pattern1[2039]=2039;
		pattern1[2040]=2040;
		pattern1[2041]=2041;
		pattern1[2042]=2042;
		pattern1[2043]=2043;
		pattern1[2044]=2044;
		pattern1[2045]=2045;
		pattern1[2046]=2046;
		pattern1[2047]=2047;
		pattern1[2048]=2048;
		pattern1[2049]=2049;
		pattern1[2050]=2050;
		pattern1[2051]=2051;
		pattern1[2052]=2052;
		pattern1[2053]=2053;
		pattern1[2054]=2054;
		pattern1[2055]=2055;
		pattern1[2056]=2056;
		pattern1[2057]=2057;
		pattern1[2058]=2058;
		pattern1[2059]=2059;
		pattern1[2060]=2060;
		pattern1[2061]=2061;
		pattern1[2062]=2062;
		pattern1[2063]=2063;
		pattern1[2064]=2064;
		pattern1[2065]=2065;
		pattern1[2066]=2066;
		pattern1[2067]=2067;
		pattern1[2068]=2068;
		pattern1[2069]=2069;
		pattern1[2070]=2070;
		pattern1[2071]=2071;
		pattern1[2072]=2072;
		pattern1[2073]=2073;
		pattern1[2074]=2074;
		pattern1[2075]=2075;
		pattern1[2076]=2076;
		pattern1[2077]=2077;
		pattern1[2078]=2078;
		pattern1[2079]=2079;
		pattern1[2080]=2080;
		pattern1[2081]=2081;
		pattern1[2082]=2082;
		pattern1[2083]=2083;
		pattern1[2084]=2084;
		pattern1[2085]=2085;
		pattern1[2086]=2086;
		pattern1[2087]=2087;
		pattern1[2088]=2088;
		pattern1[2089]=2089;
		pattern1[2090]=2090;
		pattern1[2091]=2091;
		pattern1[2092]=2092;
		pattern1[2093]=2093;
		pattern1[2094]=2094;
		pattern1[2095]=2095;
		pattern1[2096]=2096;
		pattern1[2097]=2097;
		pattern1[2098]=2098;
		pattern1[2099]=2099;
		pattern1[2100]=2100;
		pattern1[2101]=2101;
		pattern1[2102]=2102;
		pattern1[2103]=2103;
		pattern1[2104]=2104;
		pattern1[2105]=2105;
		pattern1[2106]=2106;
		pattern1[2107]=2107;
		pattern1[2108]=2108;
		pattern1[2109]=2109;
		pattern1[2110]=2110;
		pattern1[2111]=2111;
		pattern1[2112]=2112;
		pattern1[2113]=2113;
		pattern1[2114]=2114;
		pattern1[2115]=2115;
		pattern1[2116]=2116;
		pattern1[2117]=2117;
		pattern1[2118]=2118;
		pattern1[2119]=2119;
		pattern1[2120]=2120;
		pattern1[2121]=2121;
		pattern1[2122]=2122;
		pattern1[2123]=2123;
		pattern1[2124]=2124;
		pattern1[2125]=2125;
		pattern1[2126]=2126;
		pattern1[2127]=2127;
		pattern1[2128]=2128;
		pattern1[2129]=2129;
		pattern1[2130]=2130;
		pattern1[2131]=2131;
		pattern1[2132]=2132;
		pattern1[2133]=2133;
		pattern1[2134]=2134;
		pattern1[2135]=2135;
		pattern1[2136]=2136;
		pattern1[2137]=2137;
		pattern1[2138]=2138;
		pattern1[2139]=2139;
		pattern1[2140]=2140;
		pattern1[2141]=2141;
		pattern1[2142]=2142;
		pattern1[2143]=2143;
		pattern1[2144]=2144;
		pattern1[2145]=2145;
		pattern1[2146]=2146;
		pattern1[2147]=2147;
		pattern1[2148]=2148;
		pattern1[2149]=2149;
		pattern1[2150]=2150;
		pattern1[2151]=2151;
		pattern1[2152]=2152;
		pattern1[2153]=2153;
		pattern1[2154]=2154;
		pattern1[2155]=2155;
		pattern1[2156]=2156;
		pattern1[2157]=2157;
		pattern1[2158]=2158;
		pattern1[2159]=2159;
		pattern1[2160]=2160;
		pattern1[2161]=2161;
		pattern1[2162]=2162;
		pattern1[2163]=2163;
		pattern1[2164]=2164;
		pattern1[2165]=2165;
		pattern1[2166]=2166;
		pattern1[2167]=2167;
		pattern1[2168]=2168;
		pattern1[2169]=2169;
		pattern1[2170]=2170;
		pattern1[2171]=2171;
		pattern1[2172]=2172;
		pattern1[2173]=2173;
		pattern1[2174]=2174;
		pattern1[2175]=2175;
		pattern1[2176]=2176;
		pattern1[2177]=2177;
		pattern1[2178]=2178;
		pattern1[2179]=2179;
		pattern1[2180]=2180;
		pattern1[2181]=2181;
		pattern1[2182]=2182;
		pattern1[2183]=2183;
		pattern1[2184]=2184;
		pattern1[2185]=2185;
		pattern1[2186]=2186;
		pattern1[2187]=2187;
		pattern1[2188]=2188;
		pattern1[2189]=2189;
		pattern1[2190]=2190;
		pattern1[2191]=2191;
		pattern1[2192]=2192;
		pattern1[2193]=2193;
		pattern1[2194]=2194;
		pattern1[2195]=2195;
		pattern1[2196]=2196;
		pattern1[2197]=2197;
		pattern1[2198]=2198;
		pattern1[2199]=2199;
		pattern1[2200]=2200;
		pattern1[2201]=2201;
		pattern1[2202]=2202;
		pattern1[2203]=2203;
		pattern1[2204]=2204;
		pattern1[2205]=2205;
		pattern1[2206]=2206;
		pattern1[2207]=2207;
		pattern1[2208]=2208;
		pattern1[2209]=2209;
		pattern1[2210]=2210;
		pattern1[2211]=2211;
		pattern1[2212]=2212;
		pattern1[2213]=2213;
		pattern1[2214]=2214;
		pattern1[2215]=2215;
		pattern1[2216]=2216;
		pattern1[2217]=2217;
		pattern1[2218]=2218;
		pattern1[2219]=2219;
		pattern1[2220]=2220;
		pattern1[2221]=2221;
		pattern1[2222]=2222;
		pattern1[2223]=2223;
		pattern1[2224]=2224;
		pattern1[2225]=2225;
		pattern1[2226]=2226;
		pattern1[2227]=2227;
		pattern1[2228]=2228;
		pattern1[2229]=2229;
		pattern1[2230]=2230;
		pattern1[2231]=2231;
		pattern1[2232]=2232;
		pattern1[2233]=2233;
		pattern1[2234]=2234;
		pattern1[2235]=2235;
		pattern1[2236]=2236;
		pattern1[2237]=2237;
		pattern1[2238]=2238;
		pattern1[2239]=2239;
		pattern1[2240]=2240;
		pattern1[2241]=2241;
		pattern1[2242]=2242;
		pattern1[2243]=2243;
		pattern1[2244]=2244;
		pattern1[2245]=2245;
		pattern1[2246]=2246;
		pattern1[2247]=2247;
		pattern1[2248]=2248;
		pattern1[2249]=2249;
		pattern1[2250]=2250;
		pattern1[2251]=2251;
		pattern1[2252]=2252;
		pattern1[2253]=2253;
		pattern1[2254]=2254;
		pattern1[2255]=2255;
		pattern1[2256]=2256;
		pattern1[2257]=2257;
		pattern1[2258]=2258;
		pattern1[2259]=2259;
		pattern1[2260]=2260;
		pattern1[2261]=2261;
		pattern1[2262]=2262;
		pattern1[2263]=2263;
		pattern1[2264]=2264;
		pattern1[2265]=2265;
		pattern1[2266]=2266;
		pattern1[2267]=2267;
		pattern1[2268]=2268;
		pattern1[2269]=2269;
		pattern1[2270]=2270;
		pattern1[2271]=2271;
		pattern1[2272]=2272;
		pattern1[2273]=2273;
		pattern1[2274]=2274;
		pattern1[2275]=2275;
		pattern1[2276]=2276;
		pattern1[2277]=2277;
		pattern1[2278]=2278;
		pattern1[2279]=2279;
		pattern1[2280]=2280;
		pattern1[2281]=2281;
		pattern1[2282]=2282;
		pattern1[2283]=2283;
		pattern1[2284]=2284;
		pattern1[2285]=2285;
		pattern1[2286]=2286;
		pattern1[2287]=2287;
		pattern1[2288]=2288;
		pattern1[2289]=2289;
		pattern1[2290]=2290;
		pattern1[2291]=2291;
		pattern1[2292]=2292;
		pattern1[2293]=2293;
		pattern1[2294]=2294;
		pattern1[2295]=2295;
		pattern1[2296]=2296;
		pattern1[2297]=2297;
		pattern1[2298]=2298;
		pattern1[2299]=2299;
		pattern1[2300]=2300;
		pattern1[2301]=2301;
		pattern1[2302]=2302;
		pattern1[2303]=2303;
		pattern1[2304]=2304;
		pattern1[2305]=2305;
		pattern1[2306]=2306;
		pattern1[2307]=2307;
		pattern1[2308]=2308;
		pattern1[2309]=2309;
		pattern1[2310]=2310;
		pattern1[2311]=2311;
		pattern1[2312]=2312;
		pattern1[2313]=2313;
		pattern1[2314]=2314;
		pattern1[2315]=2315;
		pattern1[2316]=2316;
		pattern1[2317]=2317;
		pattern1[2318]=2318;
		pattern1[2319]=2319;
		pattern1[2320]=2320;
		pattern1[2321]=2321;
		pattern1[2322]=2322;
		pattern1[2323]=2323;
		pattern1[2324]=2324;
		pattern1[2325]=2325;
		pattern1[2326]=2326;
		pattern1[2327]=2327;
		pattern1[2328]=2328;
		pattern1[2329]=2329;
		pattern1[2330]=2330;
		pattern1[2331]=2331;
		pattern1[2332]=2332;
		pattern1[2333]=2333;
		pattern1[2334]=2334;
		pattern1[2335]=2335;
		pattern1[2336]=2336;
		pattern1[2337]=2337;
		pattern1[2338]=2338;
		pattern1[2339]=2339;
		pattern1[2340]=2340;
		pattern1[2341]=2341;
		pattern1[2342]=2342;
		pattern1[2343]=2343;
		pattern1[2344]=2344;
		pattern1[2345]=2345;
		pattern1[2346]=2346;
		pattern1[2347]=2347;
		pattern1[2348]=2348;
		pattern1[2349]=2349;
		pattern1[2350]=2350;
		pattern1[2351]=2351;
		pattern1[2352]=2352;
		pattern1[2353]=2353;
		pattern1[2354]=2354;
		pattern1[2355]=2355;
		pattern1[2356]=2356;
		pattern1[2357]=2357;
		pattern1[2358]=2358;
		pattern1[2359]=2359;
		pattern1[2360]=2360;
		pattern1[2361]=2361;
		pattern1[2362]=2362;
		pattern1[2363]=2363;
		pattern1[2364]=2364;
		pattern1[2365]=2365;
		pattern1[2366]=2366;
		pattern1[2367]=2367;
		pattern1[2368]=2368;
		pattern1[2369]=2369;
		pattern1[2370]=2370;
		pattern1[2371]=2371;
		pattern1[2372]=2372;
		pattern1[2373]=2373;
		pattern1[2374]=2374;
		pattern1[2375]=2375;
		pattern1[2376]=2376;
		pattern1[2377]=2377;
		pattern1[2378]=2378;
		pattern1[2379]=2379;
		pattern1[2380]=2380;
		pattern1[2381]=2381;
		pattern1[2382]=2382;
		pattern1[2383]=2383;
		pattern1[2384]=2384;
		pattern1[2385]=2385;
		pattern1[2386]=2386;
		pattern1[2387]=2387;
		pattern1[2388]=2388;
		pattern1[2389]=2389;
		pattern1[2390]=2390;
		pattern1[2391]=2391;
		pattern1[2392]=2392;
		pattern1[2393]=2393;
		pattern1[2394]=2394;
		pattern1[2395]=2395;
		pattern1[2396]=2396;
		pattern1[2397]=2397;
		pattern1[2398]=2398;
		pattern1[2399]=2399;
		pattern1[2400]=2400;
		pattern1[2401]=2401;
		pattern1[2402]=2402;
		pattern1[2403]=2403;
		pattern1[2404]=2404;
		pattern1[2405]=2405;
		pattern1[2406]=2406;
		pattern1[2407]=2407;
		pattern1[2408]=2408;
		pattern1[2409]=2409;
		pattern1[2410]=2410;
		pattern1[2411]=2411;
		pattern1[2412]=2412;
		pattern1[2413]=2413;
		pattern1[2414]=2414;
		pattern1[2415]=2415;
		pattern1[2416]=2416;
		pattern1[2417]=2417;
		pattern1[2418]=2418;
		pattern1[2419]=2419;
		pattern1[2420]=2420;
		pattern1[2421]=2421;
		pattern1[2422]=2422;
		pattern1[2423]=2423;
		pattern1[2424]=2424;
		pattern1[2425]=2425;
		pattern1[2426]=2426;
		pattern1[2427]=2427;
		pattern1[2428]=2428;
		pattern1[2429]=2429;
		pattern1[2430]=2430;
		pattern1[2431]=2431;
		pattern1[2432]=2432;
		pattern1[2433]=2433;
		pattern1[2434]=2434;
		pattern1[2435]=2435;
		pattern1[2436]=2436;
		pattern1[2437]=2437;
		pattern1[2438]=2438;
		pattern1[2439]=2439;
		pattern1[2440]=2440;
		pattern1[2441]=2441;
		pattern1[2442]=2442;
		pattern1[2443]=2443;
		pattern1[2444]=2444;
		pattern1[2445]=2445;
		pattern1[2446]=2446;
		pattern1[2447]=2447;
		pattern1[2448]=2448;
		pattern1[2449]=2449;
		pattern1[2450]=2450;
		pattern1[2451]=2451;
		pattern1[2452]=2452;
		pattern1[2453]=2453;
		pattern1[2454]=2454;
		pattern1[2455]=2455;
		pattern1[2456]=2456;
		pattern1[2457]=2457;
		pattern1[2458]=2458;
		pattern1[2459]=2459;
		pattern1[2460]=2460;
		pattern1[2461]=2461;
		pattern1[2462]=2462;
		pattern1[2463]=2463;
		pattern1[2464]=2464;
		pattern1[2465]=2465;
		pattern1[2466]=2466;
		pattern1[2467]=2467;
		pattern1[2468]=2468;
		pattern1[2469]=2469;
		pattern1[2470]=2470;
		pattern1[2471]=2471;
		pattern1[2472]=2472;
		pattern1[2473]=2473;
		pattern1[2474]=2474;
		pattern1[2475]=2475;
		pattern1[2476]=2476;
		pattern1[2477]=2477;
		pattern1[2478]=2478;
		pattern1[2479]=2479;
		pattern1[2480]=2480;
		pattern1[2481]=2481;
		pattern1[2482]=2482;
		pattern1[2483]=2483;
		pattern1[2484]=2484;
		pattern1[2485]=2485;
		pattern1[2486]=2486;
		pattern1[2487]=2487;
		pattern1[2488]=2488;
		pattern1[2489]=2489;
		pattern1[2490]=2490;
		pattern1[2491]=2491;
		pattern1[2492]=2492;
		pattern1[2493]=2493;
		pattern1[2494]=2494;
		pattern1[2495]=2495;
		pattern1[2496]=2496;
		pattern1[2497]=2497;
		pattern1[2498]=2498;
		pattern1[2499]=2499;
		pattern1[2500]=2500;
		pattern1[2501]=2501;
		pattern1[2502]=2502;
		pattern1[2503]=2503;
		pattern1[2504]=2504;
		pattern1[2505]=2505;
		pattern1[2506]=2506;
		pattern1[2507]=2507;
		pattern1[2508]=2508;
		pattern1[2509]=2509;
		pattern1[2510]=2510;
		pattern1[2511]=2511;
		pattern1[2512]=2512;
		pattern1[2513]=2513;
		pattern1[2514]=2514;
		pattern1[2515]=2515;
		pattern1[2516]=2516;
		pattern1[2517]=2517;
		pattern1[2518]=2518;
		pattern1[2519]=2519;
		pattern1[2520]=2520;
		pattern1[2521]=2521;
		pattern1[2522]=2522;
		pattern1[2523]=2523;
		pattern1[2524]=2524;
		pattern1[2525]=2525;
		pattern1[2526]=2526;
		pattern1[2527]=2527;
		pattern1[2528]=2528;
		pattern1[2529]=2529;
		pattern1[2530]=2530;
		pattern1[2531]=2531;
		pattern1[2532]=2532;
		pattern1[2533]=2533;
		pattern1[2534]=2534;
		pattern1[2535]=2535;
		pattern1[2536]=2536;
		pattern1[2537]=2537;
		pattern1[2538]=2538;
		pattern1[2539]=2539;
		pattern1[2540]=2540;
		pattern1[2541]=2541;
		pattern1[2542]=2542;
		pattern1[2543]=2543;
		pattern1[2544]=2544;
		pattern1[2545]=2545;
		pattern1[2546]=2546;
		pattern1[2547]=2547;
		pattern1[2548]=2548;
		pattern1[2549]=2549;
		pattern1[2550]=2550;
		pattern1[2551]=2551;
		pattern1[2552]=2552;
		pattern1[2553]=2553;
		pattern1[2554]=2554;
		pattern1[2555]=2555;
		pattern1[2556]=2556;
		pattern1[2557]=2557;
		pattern1[2558]=2558;
		pattern1[2559]=2559;
		pattern1[2560]=2560;
		pattern1[2561]=2561;
		pattern1[2562]=2562;
		pattern1[2563]=2563;
		pattern1[2564]=2564;
		pattern1[2565]=2565;
		pattern1[2566]=2566;
		pattern1[2567]=2567;
		pattern1[2568]=2568;
		pattern1[2569]=2569;
		pattern1[2570]=2570;
		pattern1[2571]=2571;
		pattern1[2572]=2572;
		pattern1[2573]=2573;
		pattern1[2574]=2574;
		pattern1[2575]=2575;
		pattern1[2576]=2576;
		pattern1[2577]=2577;
		pattern1[2578]=2578;
		pattern1[2579]=2579;
		pattern1[2580]=2580;
		pattern1[2581]=2581;
		pattern1[2582]=2582;
		pattern1[2583]=2583;
		pattern1[2584]=2584;
		pattern1[2585]=2585;
		pattern1[2586]=2586;
		pattern1[2587]=2587;
		pattern1[2588]=2588;
		pattern1[2589]=2589;
		pattern1[2590]=2590;
		pattern1[2591]=2591;
		pattern1[2592]=2592;
		pattern1[2593]=2593;
		pattern1[2594]=2594;
		pattern1[2595]=2595;
		pattern1[2596]=2596;
		pattern1[2597]=2597;
		pattern1[2598]=2598;
		pattern1[2599]=2599;
		pattern1[2600]=2600;
		pattern1[2601]=2601;
		pattern1[2602]=2602;
		pattern1[2603]=2603;
		pattern1[2604]=2604;
		pattern1[2605]=2605;
		pattern1[2606]=2606;
		pattern1[2607]=2607;
		pattern1[2608]=2608;
		pattern1[2609]=2609;
		pattern1[2610]=2610;
		pattern1[2611]=2611;
		pattern1[2612]=2612;
		pattern1[2613]=2613;
		pattern1[2614]=2614;
		pattern1[2615]=2615;
		pattern1[2616]=2616;
		pattern1[2617]=2617;
		pattern1[2618]=2618;
		pattern1[2619]=2619;
		pattern1[2620]=2620;
		pattern1[2621]=2621;
		pattern1[2622]=2622;
		pattern1[2623]=2623;
		pattern1[2624]=2624;
		pattern1[2625]=2625;
		pattern1[2626]=2626;
		pattern1[2627]=2627;
		pattern1[2628]=2628;
		pattern1[2629]=2629;
		pattern1[2630]=2630;
		pattern1[2631]=2631;
		pattern1[2632]=2632;
		pattern1[2633]=2633;
		pattern1[2634]=2634;
		pattern1[2635]=2635;
		pattern1[2636]=2636;
		pattern1[2637]=2637;
		pattern1[2638]=2638;
		pattern1[2639]=2639;
		pattern1[2640]=2640;
		pattern1[2641]=2641;
		pattern1[2642]=2642;
		pattern1[2643]=2643;
		pattern1[2644]=2644;
		pattern1[2645]=2645;
		pattern1[2646]=2646;
		pattern1[2647]=2647;
		pattern1[2648]=2648;
		pattern1[2649]=2649;
		pattern1[2650]=2650;
		pattern1[2651]=2651;
		pattern1[2652]=2652;
		pattern1[2653]=2653;
		pattern1[2654]=2654;
		pattern1[2655]=2655;
		pattern1[2656]=2656;
		pattern1[2657]=2657;
		pattern1[2658]=2658;
		pattern1[2659]=2659;
		pattern1[2660]=2660;
		pattern1[2661]=2661;
		pattern1[2662]=2662;
		pattern1[2663]=2663;
		pattern1[2664]=2664;
		pattern1[2665]=2665;
		pattern1[2666]=2666;
		pattern1[2667]=2667;
		pattern1[2668]=2668;
		pattern1[2669]=2669;
		pattern1[2670]=2670;
		pattern1[2671]=2671;
		pattern1[2672]=2672;
		pattern1[2673]=2673;
		pattern1[2674]=2674;
		pattern1[2675]=2675;
		pattern1[2676]=2676;
		pattern1[2677]=2677;
		pattern1[2678]=2678;
		pattern1[2679]=2679;
		pattern1[2680]=2680;
		pattern1[2681]=2681;
		pattern1[2682]=2682;
		pattern1[2683]=2683;
		pattern1[2684]=2684;
		pattern1[2685]=2685;
		pattern1[2686]=2686;
		pattern1[2687]=2687;
		pattern1[2688]=2688;
		pattern1[2689]=2689;
		pattern1[2690]=2690;
		pattern1[2691]=2691;
		pattern1[2692]=2692;
		pattern1[2693]=2693;
		pattern1[2694]=2694;
		pattern1[2695]=2695;
		pattern1[2696]=2696;
		pattern1[2697]=2697;
		pattern1[2698]=2698;
		pattern1[2699]=2699;
		pattern1[2700]=2700;
		pattern1[2701]=2701;
		pattern1[2702]=2702;
		pattern1[2703]=2703;
		pattern1[2704]=2704;
		pattern1[2705]=2705;
		pattern1[2706]=2706;
		pattern1[2707]=2707;
		pattern1[2708]=2708;
		pattern1[2709]=2709;
		pattern1[2710]=2710;
		pattern1[2711]=2711;
		pattern1[2712]=2712;
		pattern1[2713]=2713;
		pattern1[2714]=2714;
		pattern1[2715]=2715;
		pattern1[2716]=2716;
		pattern1[2717]=2717;
		pattern1[2718]=2718;
		pattern1[2719]=2719;
		pattern1[2720]=2720;
		pattern1[2721]=2721;
		pattern1[2722]=2722;
		pattern1[2723]=2723;
		pattern1[2724]=2724;
		pattern1[2725]=2725;
		pattern1[2726]=2726;
		pattern1[2727]=2727;
		pattern1[2728]=2728;
		pattern1[2729]=2729;
		pattern1[2730]=2730;
		pattern1[2731]=2731;
		pattern1[2732]=2732;
		pattern1[2733]=2733;
		pattern1[2734]=2734;
		pattern1[2735]=2735;
		pattern1[2736]=2736;
		pattern1[2737]=2737;
		pattern1[2738]=2738;
		pattern1[2739]=2739;
		pattern1[2740]=2740;
		pattern1[2741]=2741;
		pattern1[2742]=2742;
		pattern1[2743]=2743;
		pattern1[2744]=2744;
		pattern1[2745]=2745;
		pattern1[2746]=2746;
		pattern1[2747]=2747;
		pattern1[2748]=2748;
		pattern1[2749]=2749;
		pattern1[2750]=2750;
		pattern1[2751]=2751;
		pattern1[2752]=2752;
		pattern1[2753]=2753;
		pattern1[2754]=2754;
		pattern1[2755]=2755;
		pattern1[2756]=2756;
		pattern1[2757]=2757;
		pattern1[2758]=2758;
		pattern1[2759]=2759;
		pattern1[2760]=2760;
		pattern1[2761]=2761;
		pattern1[2762]=2762;
		pattern1[2763]=2763;
		pattern1[2764]=2764;
		pattern1[2765]=2765;
		pattern1[2766]=2766;
		pattern1[2767]=2767;
		pattern1[2768]=2768;
		pattern1[2769]=2769;
		pattern1[2770]=2770;
		pattern1[2771]=2771;
		pattern1[2772]=2772;
		pattern1[2773]=2773;
		pattern1[2774]=2774;
		pattern1[2775]=2775;
		pattern1[2776]=2776;
		pattern1[2777]=2777;
		pattern1[2778]=2778;
		pattern1[2779]=2779;
		pattern1[2780]=2780;
		pattern1[2781]=2781;
		pattern1[2782]=2782;
		pattern1[2783]=2783;
		pattern1[2784]=2784;
		pattern1[2785]=2785;
		pattern1[2786]=2786;
		pattern1[2787]=2787;
		pattern1[2788]=2788;
		pattern1[2789]=2789;
		pattern1[2790]=2790;
		pattern1[2791]=2791;
		pattern1[2792]=2792;
		pattern1[2793]=2793;
		pattern1[2794]=2794;
		pattern1[2795]=2795;
		pattern1[2796]=2796;
		pattern1[2797]=2797;
		pattern1[2798]=2798;
		pattern1[2799]=2799;
		pattern1[2800]=2800;
		pattern1[2801]=2801;
		pattern1[2802]=2802;
		pattern1[2803]=2803;
		pattern1[2804]=2804;
		pattern1[2805]=2805;
		pattern1[2806]=2806;
		pattern1[2807]=2807;
		pattern1[2808]=2808;
		pattern1[2809]=2809;
		pattern1[2810]=2810;
		pattern1[2811]=2811;
		pattern1[2812]=2812;
		pattern1[2813]=2813;
		pattern1[2814]=2814;
		pattern1[2815]=2815;
		pattern1[2816]=2816;
		pattern1[2817]=2817;
		pattern1[2818]=2818;
		pattern1[2819]=2819;
		pattern1[2820]=2820;
		pattern1[2821]=2821;
		pattern1[2822]=2822;
		pattern1[2823]=2823;
		pattern1[2824]=2824;
		pattern1[2825]=2825;
		pattern1[2826]=2826;
		pattern1[2827]=2827;
		pattern1[2828]=2828;
		pattern1[2829]=2829;
		pattern1[2830]=2830;
		pattern1[2831]=2831;
		pattern1[2832]=2832;
		pattern1[2833]=2833;
		pattern1[2834]=2834;
		pattern1[2835]=2835;
		pattern1[2836]=2836;
		pattern1[2837]=2837;
		pattern1[2838]=2838;
		pattern1[2839]=2839;
		pattern1[2840]=2840;
		pattern1[2841]=2841;
		pattern1[2842]=2842;
		pattern1[2843]=2843;
		pattern1[2844]=2844;
		pattern1[2845]=2845;
		pattern1[2846]=2846;
		pattern1[2847]=2847;
		pattern1[2848]=2848;
		pattern1[2849]=2849;
		pattern1[2850]=2850;
		pattern1[2851]=2851;
		pattern1[2852]=2852;
		pattern1[2853]=2853;
		pattern1[2854]=2854;
		pattern1[2855]=2855;
		pattern1[2856]=2856;
		pattern1[2857]=2857;
		pattern1[2858]=2858;
		pattern1[2859]=2859;
		pattern1[2860]=2860;
		pattern1[2861]=2861;
		pattern1[2862]=2862;
		pattern1[2863]=2863;
		pattern1[2864]=2864;
		pattern1[2865]=2865;
		pattern1[2866]=2866;
		pattern1[2867]=2867;
		pattern1[2868]=2868;
		pattern1[2869]=2869;
		pattern1[2870]=2870;
		pattern1[2871]=2871;
		pattern1[2872]=2872;
		pattern1[2873]=2873;
		pattern1[2874]=2874;
		pattern1[2875]=2875;
		pattern1[2876]=2876;
		pattern1[2877]=2877;
		pattern1[2878]=2878;
		pattern1[2879]=2879;
		pattern1[2880]=2880;
		pattern1[2881]=2881;
		pattern1[2882]=2882;
		pattern1[2883]=2883;
		pattern1[2884]=2884;
		pattern1[2885]=2885;
		pattern1[2886]=2886;
		pattern1[2887]=2887;
		pattern1[2888]=2888;
		pattern1[2889]=2889;
		pattern1[2890]=2890;
		pattern1[2891]=2891;
		pattern1[2892]=2892;
		pattern1[2893]=2893;
		pattern1[2894]=2894;
		pattern1[2895]=2895;
		pattern1[2896]=2896;
		pattern1[2897]=2897;
		pattern1[2898]=2898;
		pattern1[2899]=2899;
		pattern1[2900]=2900;
		pattern1[2901]=2901;
		pattern1[2902]=2902;
		pattern1[2903]=2903;
		pattern1[2904]=2904;
		pattern1[2905]=2905;
		pattern1[2906]=2906;
		pattern1[2907]=2907;
		pattern1[2908]=2908;
		pattern1[2909]=2909;
		pattern1[2910]=2910;
		pattern1[2911]=2911;
		pattern1[2912]=2912;
		pattern1[2913]=2913;
		pattern1[2914]=2914;
		pattern1[2915]=2915;
		pattern1[2916]=2916;
		pattern1[2917]=2917;
		pattern1[2918]=2918;
		pattern1[2919]=2919;
		pattern1[2920]=2920;
		pattern1[2921]=2921;
		pattern1[2922]=2922;
		pattern1[2923]=2923;
		pattern1[2924]=2924;
		pattern1[2925]=2925;
		pattern1[2926]=2926;
		pattern1[2927]=2927;
		pattern1[2928]=2928;
		pattern1[2929]=2929;
		pattern1[2930]=2930;
		pattern1[2931]=2931;
		pattern1[2932]=2932;
		pattern1[2933]=2933;
		pattern1[2934]=2934;
		pattern1[2935]=2935;
		pattern1[2936]=2936;
		pattern1[2937]=2937;
		pattern1[2938]=2938;
		pattern1[2939]=2939;
		pattern1[2940]=2940;
		pattern1[2941]=2941;
		pattern1[2942]=2942;
		pattern1[2943]=2943;
		pattern1[2944]=2944;
		pattern1[2945]=2945;
		pattern1[2946]=2946;
		pattern1[2947]=2947;
		pattern1[2948]=2948;
		pattern1[2949]=2949;
		pattern1[2950]=2950;
		pattern1[2951]=2951;
		pattern1[2952]=2952;
		pattern1[2953]=2953;
		pattern1[2954]=2954;
		pattern1[2955]=2955;
		pattern1[2956]=2956;
		pattern1[2957]=2957;
		pattern1[2958]=2958;
		pattern1[2959]=2959;
		pattern1[2960]=2960;
		pattern1[2961]=2961;
		pattern1[2962]=2962;
		pattern1[2963]=2963;
		pattern1[2964]=2964;
		pattern1[2965]=2965;
		pattern1[2966]=2966;
		pattern1[2967]=2967;
		pattern1[2968]=2968;
		pattern1[2969]=2969;
		pattern1[2970]=2970;
		pattern1[2971]=2971;
		pattern1[2972]=2972;
		pattern1[2973]=2973;
		pattern1[2974]=2974;
		pattern1[2975]=2975;
		pattern1[2976]=2976;
		pattern1[2977]=2977;
		pattern1[2978]=2978;
		pattern1[2979]=2979;
		pattern1[2980]=2980;
		pattern1[2981]=2981;
		pattern1[2982]=2982;
		pattern1[2983]=2983;
		pattern1[2984]=2984;
		pattern1[2985]=2985;
		pattern1[2986]=2986;
		pattern1[2987]=2987;
		pattern1[2988]=2988;
		pattern1[2989]=2989;
		pattern1[2990]=2990;
		pattern1[2991]=2991;
		pattern1[2992]=2992;
		pattern1[2993]=2993;
		pattern1[2994]=2994;
		pattern1[2995]=2995;
		pattern1[2996]=2996;
		pattern1[2997]=2997;
		pattern1[2998]=2998;
		pattern1[2999]=2999;
		pattern1[3000]=3000;
		pattern1[3001]=3001;
		pattern1[3002]=3002;
		pattern1[3003]=3003;
		pattern1[3004]=3004;
		pattern1[3005]=3005;
		pattern1[3006]=3006;
		pattern1[3007]=3007;
		pattern1[3008]=3008;
		pattern1[3009]=3009;
		pattern1[3010]=3010;
		pattern1[3011]=3011;
		pattern1[3012]=3012;
		pattern1[3013]=3013;
		pattern1[3014]=3014;
		pattern1[3015]=3015;
		pattern1[3016]=3016;
		pattern1[3017]=3017;
		pattern1[3018]=3018;
		pattern1[3019]=3019;
		pattern1[3020]=3020;
		pattern1[3021]=3021;
		pattern1[3022]=3022;
		pattern1[3023]=3023;
		pattern1[3024]=3024;
		pattern1[3025]=3025;
		pattern1[3026]=3026;
		pattern1[3027]=3027;
		pattern1[3028]=3028;
		pattern1[3029]=3029;
		pattern1[3030]=3030;
		pattern1[3031]=3031;
		pattern1[3032]=3032;
		pattern1[3033]=3033;
		pattern1[3034]=3034;
		pattern1[3035]=3035;
		pattern1[3036]=3036;
		pattern1[3037]=3037;
		pattern1[3038]=3038;
		pattern1[3039]=3039;
		pattern1[3040]=3040;
		pattern1[3041]=3041;
		pattern1[3042]=3042;
		pattern1[3043]=3043;
		pattern1[3044]=3044;
		pattern1[3045]=3045;
		pattern1[3046]=3046;
		pattern1[3047]=3047;
		pattern1[3048]=3048;
		pattern1[3049]=3049;
		pattern1[3050]=3050;
		pattern1[3051]=3051;
		pattern1[3052]=3052;
		pattern1[3053]=3053;
		pattern1[3054]=3054;
		pattern1[3055]=3055;
		pattern1[3056]=3056;
		pattern1[3057]=3057;
		pattern1[3058]=3058;
		pattern1[3059]=3059;
		pattern1[3060]=3060;
		pattern1[3061]=3061;
		pattern1[3062]=3062;
		pattern1[3063]=3063;
		pattern1[3064]=3064;
		pattern1[3065]=3065;
		pattern1[3066]=3066;
		pattern1[3067]=3067;
		pattern1[3068]=3068;
		pattern1[3069]=3069;
		pattern1[3070]=3070;
		pattern1[3071]=3071;
		pattern1[3072]=3072;
		pattern1[3073]=3073;
		pattern1[3074]=3074;
		pattern1[3075]=3075;
		pattern1[3076]=3076;
		pattern1[3077]=3077;
		pattern1[3078]=3078;
		pattern1[3079]=3079;
		pattern1[3080]=3080;
		pattern1[3081]=3081;
		pattern1[3082]=3082;
		pattern1[3083]=3083;
		pattern1[3084]=3084;
		pattern1[3085]=3085;
		pattern1[3086]=3086;
		pattern1[3087]=3087;
		pattern1[3088]=3088;
		pattern1[3089]=3089;
		pattern1[3090]=3090;
		pattern1[3091]=3091;
		pattern1[3092]=3092;
		pattern1[3093]=3093;
		pattern1[3094]=3094;
		pattern1[3095]=3095;
		pattern1[3096]=3096;
		pattern1[3097]=3097;
		pattern1[3098]=3098;
		pattern1[3099]=3099;
		pattern1[3100]=3100;
		pattern1[3101]=3101;
		pattern1[3102]=3102;
		pattern1[3103]=3103;
		pattern1[3104]=3104;
		pattern1[3105]=3105;
		pattern1[3106]=3106;
		pattern1[3107]=3107;
		pattern1[3108]=3108;
		pattern1[3109]=3109;
		pattern1[3110]=3110;
		pattern1[3111]=3111;
		pattern1[3112]=3112;
		pattern1[3113]=3113;
		pattern1[3114]=3114;
		pattern1[3115]=3115;
		pattern1[3116]=3116;
		pattern1[3117]=3117;
		pattern1[3118]=3118;
		pattern1[3119]=3119;
		pattern1[3120]=3120;
		pattern1[3121]=3121;
		pattern1[3122]=3122;
		pattern1[3123]=3123;
		pattern1[3124]=3124;
		pattern1[3125]=3125;
		pattern1[3126]=3126;
		pattern1[3127]=3127;
		pattern1[3128]=3128;
		pattern1[3129]=3129;
		pattern1[3130]=3130;
		pattern1[3131]=3131;
		pattern1[3132]=3132;
		pattern1[3133]=3133;
		pattern1[3134]=3134;
		pattern1[3135]=3135;
		pattern1[3136]=3136;
		pattern1[3137]=3137;
		pattern1[3138]=3138;
		pattern1[3139]=3139;
		pattern1[3140]=3140;
		pattern1[3141]=3141;
		pattern1[3142]=3142;
		pattern1[3143]=3143;
		pattern1[3144]=3144;
		pattern1[3145]=3145;
		pattern1[3146]=3146;
		pattern1[3147]=3147;
		pattern1[3148]=3148;
		pattern1[3149]=3149;
		pattern1[3150]=3150;
		pattern1[3151]=3151;
		pattern1[3152]=3152;
		pattern1[3153]=3153;
		pattern1[3154]=3154;
		pattern1[3155]=3155;
		pattern1[3156]=3156;
		pattern1[3157]=3157;
		pattern1[3158]=3158;
		pattern1[3159]=3159;
		pattern1[3160]=3160;
		pattern1[3161]=3161;
		pattern1[3162]=3162;
		pattern1[3163]=3163;
		pattern1[3164]=3164;
		pattern1[3165]=3165;
		pattern1[3166]=3166;
		pattern1[3167]=3167;
		pattern1[3168]=3168;
		pattern1[3169]=3169;
		pattern1[3170]=3170;
		pattern1[3171]=3171;
		pattern1[3172]=3172;
		pattern1[3173]=3173;
		pattern1[3174]=3174;
		pattern1[3175]=3175;
		pattern1[3176]=3176;
		pattern1[3177]=3177;
		pattern1[3178]=3178;
		pattern1[3179]=3179;
		pattern1[3180]=3180;
		pattern1[3181]=3181;
		pattern1[3182]=3182;
		pattern1[3183]=3183;
		pattern1[3184]=3184;
		pattern1[3185]=3185;
		pattern1[3186]=3186;
		pattern1[3187]=3187;
		pattern1[3188]=3188;
		pattern1[3189]=3189;
		pattern1[3190]=3190;
		pattern1[3191]=3191;
		pattern1[3192]=3192;
		pattern1[3193]=3193;
		pattern1[3194]=3194;
		pattern1[3195]=3195;
		pattern1[3196]=3196;
		pattern1[3197]=3197;
		pattern1[3198]=3198;
		pattern1[3199]=3199;
		pattern1[3200]=3200;
		pattern1[3201]=3201;
		pattern1[3202]=3202;
		pattern1[3203]=3203;
		pattern1[3204]=3204;
		pattern1[3205]=3205;
		pattern1[3206]=3206;
		pattern1[3207]=3207;
		pattern1[3208]=3208;
		pattern1[3209]=3209;
		pattern1[3210]=3210;
		pattern1[3211]=3211;
		pattern1[3212]=3212;
		pattern1[3213]=3213;
		pattern1[3214]=3214;
		pattern1[3215]=3215;
		pattern1[3216]=3216;
		pattern1[3217]=3217;
		pattern1[3218]=3218;
		pattern1[3219]=3219;
		pattern1[3220]=3220;
		pattern1[3221]=3221;
		pattern1[3222]=3222;
		pattern1[3223]=3223;
		pattern1[3224]=3224;
		pattern1[3225]=3225;
		pattern1[3226]=3226;
		pattern1[3227]=3227;
		pattern1[3228]=3228;
		pattern1[3229]=3229;
		pattern1[3230]=3230;
		pattern1[3231]=3231;
		pattern1[3232]=3232;
		pattern1[3233]=3233;
		pattern1[3234]=3234;
		pattern1[3235]=3235;
		pattern1[3236]=3236;
		pattern1[3237]=3237;
		pattern1[3238]=3238;
		pattern1[3239]=3239;
		pattern1[3240]=3240;
		pattern1[3241]=3241;
		pattern1[3242]=3242;
		pattern1[3243]=3243;
		pattern1[3244]=3244;
		pattern1[3245]=3245;
		pattern1[3246]=3246;
		pattern1[3247]=3247;
		pattern1[3248]=3248;
		pattern1[3249]=3249;
		pattern1[3250]=3250;
		pattern1[3251]=3251;
		pattern1[3252]=3252;
		pattern1[3253]=3253;
		pattern1[3254]=3254;
		pattern1[3255]=3255;
		pattern1[3256]=3256;
		pattern1[3257]=3257;
		pattern1[3258]=3258;
		pattern1[3259]=3259;
		pattern1[3260]=3260;
		pattern1[3261]=3261;
		pattern1[3262]=3262;
		pattern1[3263]=3263;
		pattern1[3264]=3264;
		pattern1[3265]=3265;
		pattern1[3266]=3266;
		pattern1[3267]=3267;
		pattern1[3268]=3268;
		pattern1[3269]=3269;
		pattern1[3270]=3270;
		pattern1[3271]=3271;
		pattern1[3272]=3272;
		pattern1[3273]=3273;
		pattern1[3274]=3274;
		pattern1[3275]=3275;
		pattern1[3276]=3276;
		pattern1[3277]=3277;
		pattern1[3278]=3278;
		pattern1[3279]=3279;
		pattern1[3280]=3280;
		pattern1[3281]=3281;
		pattern1[3282]=3282;
		pattern1[3283]=3283;
		pattern1[3284]=3284;
		pattern1[3285]=3285;
		pattern1[3286]=3286;
		pattern1[3287]=3287;
		pattern1[3288]=3288;
		pattern1[3289]=3289;
		pattern1[3290]=3290;
		pattern1[3291]=3291;
		pattern1[3292]=3292;
		pattern1[3293]=3293;
		pattern1[3294]=3294;
		pattern1[3295]=3295;
		pattern1[3296]=3296;
		pattern1[3297]=3297;
		pattern1[3298]=3298;
		pattern1[3299]=3299;
		pattern1[3300]=3300;
		pattern1[3301]=3301;
		pattern1[3302]=3302;
		pattern1[3303]=3303;
		pattern1[3304]=3304;
		pattern1[3305]=3305;
		pattern1[3306]=3306;
		pattern1[3307]=3307;
		pattern1[3308]=3308;
		pattern1[3309]=3309;
		pattern1[3310]=3310;
		pattern1[3311]=3311;
		pattern1[3312]=3312;
		pattern1[3313]=3313;
		pattern1[3314]=3314;
		pattern1[3315]=3315;
		pattern1[3316]=3316;
		pattern1[3317]=3317;
		pattern1[3318]=3318;
		pattern1[3319]=3319;
		pattern1[3320]=3320;
		pattern1[3321]=3321;
		pattern1[3322]=3322;
		pattern1[3323]=3323;
		pattern1[3324]=3324;
		pattern1[3325]=3325;
		pattern1[3326]=3326;
		pattern1[3327]=3327;
		pattern1[3328]=3328;
		pattern1[3329]=3329;
		pattern1[3330]=3330;
		pattern1[3331]=3331;
		pattern1[3332]=3332;
		pattern1[3333]=3333;
		pattern1[3334]=3334;
		pattern1[3335]=3335;
		pattern1[3336]=3336;
		pattern1[3337]=3337;
		pattern1[3338]=3338;
		pattern1[3339]=3339;
		pattern1[3340]=3340;
		pattern1[3341]=3341;
		pattern1[3342]=3342;
		pattern1[3343]=3343;
		pattern1[3344]=3344;
		pattern1[3345]=3345;
		pattern1[3346]=3346;
		pattern1[3347]=3347;
		pattern1[3348]=3348;
		pattern1[3349]=3349;
		pattern1[3350]=3350;
		pattern1[3351]=3351;
		pattern1[3352]=3352;
		pattern1[3353]=3353;
		pattern1[3354]=3354;
		pattern1[3355]=3355;
		pattern1[3356]=3356;
		pattern1[3357]=3357;
		pattern1[3358]=3358;
		pattern1[3359]=3359;
		pattern1[3360]=3360;
		pattern1[3361]=3361;
		pattern1[3362]=3362;
		pattern1[3363]=3363;
		pattern1[3364]=3364;
		pattern1[3365]=3365;
		pattern1[3366]=3366;
		pattern1[3367]=3367;
		pattern1[3368]=3368;
		pattern1[3369]=3369;
		pattern1[3370]=3370;
		pattern1[3371]=3371;
		pattern1[3372]=3372;
		pattern1[3373]=3373;
		pattern1[3374]=3374;
		pattern1[3375]=3375;
		pattern1[3376]=3376;
		pattern1[3377]=3377;
		pattern1[3378]=3378;
		pattern1[3379]=3379;
		pattern1[3380]=3380;
		pattern1[3381]=3381;
		pattern1[3382]=3382;
		pattern1[3383]=3383;
		pattern1[3384]=3384;
		pattern1[3385]=3385;
		pattern1[3386]=3386;
		pattern1[3387]=3387;
		pattern1[3388]=3388;
		pattern1[3389]=3389;
		pattern1[3390]=3390;
		pattern1[3391]=3391;
		pattern1[3392]=3392;
		pattern1[3393]=3393;
		pattern1[3394]=3394;
		pattern1[3395]=3395;
		pattern1[3396]=3396;
		pattern1[3397]=3397;
		pattern1[3398]=3398;
		pattern1[3399]=3399;
		pattern1[3400]=3400;
		pattern1[3401]=3401;
		pattern1[3402]=3402;
		pattern1[3403]=3403;
		pattern1[3404]=3404;
		pattern1[3405]=3405;
		pattern1[3406]=3406;
		pattern1[3407]=3407;
		pattern1[3408]=3408;
		pattern1[3409]=3409;
		pattern1[3410]=3410;
		pattern1[3411]=3411;
		pattern1[3412]=3412;
		pattern1[3413]=3413;
		pattern1[3414]=3414;
		pattern1[3415]=3415;
		pattern1[3416]=3416;
		pattern1[3417]=3417;
		pattern1[3418]=3418;
		pattern1[3419]=3419;
		pattern1[3420]=3420;
		pattern1[3421]=3421;
		pattern1[3422]=3422;
		pattern1[3423]=3423;
		pattern1[3424]=3424;
		pattern1[3425]=3425;
		pattern1[3426]=3426;
		pattern1[3427]=3427;
		pattern1[3428]=3428;
		pattern1[3429]=3429;
		pattern1[3430]=3430;
		pattern1[3431]=3431;
		pattern1[3432]=3432;
		pattern1[3433]=3433;
		pattern1[3434]=3434;
		pattern1[3435]=3435;
		pattern1[3436]=3436;
		pattern1[3437]=3437;
		pattern1[3438]=3438;
		pattern1[3439]=3439;
		pattern1[3440]=3440;
		pattern1[3441]=3441;
		pattern1[3442]=3442;
		pattern1[3443]=3443;
		pattern1[3444]=3444;
		pattern1[3445]=3445;
		pattern1[3446]=3446;
		pattern1[3447]=3447;
		pattern1[3448]=3448;
		pattern1[3449]=3449;
		pattern1[3450]=3450;
		pattern1[3451]=3451;
		pattern1[3452]=3452;
		pattern1[3453]=3453;
		pattern1[3454]=3454;
		pattern1[3455]=3455;
		pattern1[3456]=3456;
		pattern1[3457]=3457;
		pattern1[3458]=3458;
		pattern1[3459]=3459;
		pattern1[3460]=3460;
		pattern1[3461]=3461;
		pattern1[3462]=3462;
		pattern1[3463]=3463;
		pattern1[3464]=3464;
		pattern1[3465]=3465;
		pattern1[3466]=3466;
		pattern1[3467]=3467;
		pattern1[3468]=3468;
		pattern1[3469]=3469;
		pattern1[3470]=3470;
		pattern1[3471]=3471;
		pattern1[3472]=3472;
		pattern1[3473]=3473;
		pattern1[3474]=3474;
		pattern1[3475]=3475;
		pattern1[3476]=3476;
		pattern1[3477]=3477;
		pattern1[3478]=3478;
		pattern1[3479]=3479;
		pattern1[3480]=3480;
		pattern1[3481]=3481;
		pattern1[3482]=3482;
		pattern1[3483]=3483;
		pattern1[3484]=3484;
		pattern1[3485]=3485;
		pattern1[3486]=3486;
		pattern1[3487]=3487;
		pattern1[3488]=3488;
		pattern1[3489]=3489;
		pattern1[3490]=3490;
		pattern1[3491]=3491;
		pattern1[3492]=3492;
		pattern1[3493]=3493;
		pattern1[3494]=3494;
		pattern1[3495]=3495;
		pattern1[3496]=3496;
		pattern1[3497]=3497;
		pattern1[3498]=3498;
		pattern1[3499]=3499;
		pattern1[3500]=3500;
		pattern1[3501]=3501;
		pattern1[3502]=3502;
		pattern1[3503]=3503;
		pattern1[3504]=3504;
		pattern1[3505]=3505;
		pattern1[3506]=3506;
		pattern1[3507]=3507;
		pattern1[3508]=3508;
		pattern1[3509]=3509;
		pattern1[3510]=3510;
		pattern1[3511]=3511;
		pattern1[3512]=3512;
		pattern1[3513]=3513;
		pattern1[3514]=3514;
		pattern1[3515]=3515;
		pattern1[3516]=3516;
		pattern1[3517]=3517;
		pattern1[3518]=3518;
		pattern1[3519]=3519;
		pattern1[3520]=3520;
		pattern1[3521]=3521;
		pattern1[3522]=3522;
		pattern1[3523]=3523;
		pattern1[3524]=3524;
		pattern1[3525]=3525;
		pattern1[3526]=3526;
		pattern1[3527]=3527;
		pattern1[3528]=3528;
		pattern1[3529]=3529;
		pattern1[3530]=3530;
		pattern1[3531]=3531;
		pattern1[3532]=3532;
		pattern1[3533]=3533;
		pattern1[3534]=3534;
		pattern1[3535]=3535;
		pattern1[3536]=3536;
		pattern1[3537]=3537;
		pattern1[3538]=3538;
		pattern1[3539]=3539;
		pattern1[3540]=3540;
		pattern1[3541]=3541;
		pattern1[3542]=3542;
		pattern1[3543]=3543;
		pattern1[3544]=3544;
		pattern1[3545]=3545;
		pattern1[3546]=3546;
		pattern1[3547]=3547;
		pattern1[3548]=3548;
		pattern1[3549]=3549;
		pattern1[3550]=3550;
		pattern1[3551]=3551;
		pattern1[3552]=3552;
		pattern1[3553]=3553;
		pattern1[3554]=3554;
		pattern1[3555]=3555;
		pattern1[3556]=3556;
		pattern1[3557]=3557;
		pattern1[3558]=3558;
		pattern1[3559]=3559;
		pattern1[3560]=3560;
		pattern1[3561]=3561;
		pattern1[3562]=3562;
		pattern1[3563]=3563;
		pattern1[3564]=3564;
		pattern1[3565]=3565;
		pattern1[3566]=3566;
		pattern1[3567]=3567;
		pattern1[3568]=3568;
		pattern1[3569]=3569;
		pattern1[3570]=3570;
		pattern1[3571]=3571;
		pattern1[3572]=3572;
		pattern1[3573]=3573;
		pattern1[3574]=3574;
		pattern1[3575]=3575;
		pattern1[3576]=3576;
		pattern1[3577]=3577;
		pattern1[3578]=3578;
		pattern1[3579]=3579;
		pattern1[3580]=3580;
		pattern1[3581]=3581;
		pattern1[3582]=3582;
		pattern1[3583]=3583;
		pattern1[3584]=3584;
		pattern1[3585]=3585;
		pattern1[3586]=3586;
		pattern1[3587]=3587;
		pattern1[3588]=3588;
		pattern1[3589]=3589;
		pattern1[3590]=3590;
		pattern1[3591]=3591;
		pattern1[3592]=3592;
		pattern1[3593]=3593;
		pattern1[3594]=3594;
		pattern1[3595]=3595;
		pattern1[3596]=3596;
		pattern1[3597]=3597;
		pattern1[3598]=3598;
		pattern1[3599]=3599;
		pattern1[3600]=3600;
		pattern1[3601]=3601;
		pattern1[3602]=3602;
		pattern1[3603]=3603;
		pattern1[3604]=3604;
		pattern1[3605]=3605;
		pattern1[3606]=3606;
		pattern1[3607]=3607;
		pattern1[3608]=3608;
		pattern1[3609]=3609;
		pattern1[3610]=3610;
		pattern1[3611]=3611;
		pattern1[3612]=3612;
		pattern1[3613]=3613;
		pattern1[3614]=3614;
		pattern1[3615]=3615;
		pattern1[3616]=3616;
		pattern1[3617]=3617;
		pattern1[3618]=3618;
		pattern1[3619]=3619;
		pattern1[3620]=3620;
		pattern1[3621]=3621;
		pattern1[3622]=3622;
		pattern1[3623]=3623;
		pattern1[3624]=3624;
		pattern1[3625]=3625;
		pattern1[3626]=3626;
		pattern1[3627]=3627;
		pattern1[3628]=3628;
		pattern1[3629]=3629;
		pattern1[3630]=3630;
		pattern1[3631]=3631;
		pattern1[3632]=3632;
		pattern1[3633]=3633;
		pattern1[3634]=3634;
		pattern1[3635]=3635;
		pattern1[3636]=3636;
		pattern1[3637]=3637;
		pattern1[3638]=3638;
		pattern1[3639]=3639;
		pattern1[3640]=3640;
		pattern1[3641]=3641;
		pattern1[3642]=3642;
		pattern1[3643]=3643;
		pattern1[3644]=3644;
		pattern1[3645]=3645;
		pattern1[3646]=3646;
		pattern1[3647]=3647;
		pattern1[3648]=3648;
		pattern1[3649]=3649;
		pattern1[3650]=3650;
		pattern1[3651]=3651;
		pattern1[3652]=3652;
		pattern1[3653]=3653;
		pattern1[3654]=3654;
		pattern1[3655]=3655;
		pattern1[3656]=3656;
		pattern1[3657]=3657;
		pattern1[3658]=3658;
		pattern1[3659]=3659;
		pattern1[3660]=3660;
		pattern1[3661]=3661;
		pattern1[3662]=3662;
		pattern1[3663]=3663;
		pattern1[3664]=3664;
		pattern1[3665]=3665;
		pattern1[3666]=3666;
		pattern1[3667]=3667;
		pattern1[3668]=3668;
		pattern1[3669]=3669;
		pattern1[3670]=3670;
		pattern1[3671]=3671;
		pattern1[3672]=3672;
		pattern1[3673]=3673;
		pattern1[3674]=3674;
		pattern1[3675]=3675;
		pattern1[3676]=3676;
		pattern1[3677]=3677;
		pattern1[3678]=3678;
		pattern1[3679]=3679;
		pattern1[3680]=3680;
		pattern1[3681]=3681;
		pattern1[3682]=3682;
		pattern1[3683]=3683;
		pattern1[3684]=3684;
		pattern1[3685]=3685;
		pattern1[3686]=3686;
		pattern1[3687]=3687;
		pattern1[3688]=3688;
		pattern1[3689]=3689;
		pattern1[3690]=3690;
		pattern1[3691]=3691;
		pattern1[3692]=3692;
		pattern1[3693]=3693;
		pattern1[3694]=3694;
		pattern1[3695]=3695;
		pattern1[3696]=3696;
		pattern1[3697]=3697;
		pattern1[3698]=3698;
		pattern1[3699]=3699;
		pattern1[3700]=3700;
		pattern1[3701]=3701;
		pattern1[3702]=3702;
		pattern1[3703]=3703;
		pattern1[3704]=3704;
		pattern1[3705]=3705;
		pattern1[3706]=3706;
		pattern1[3707]=3707;
		pattern1[3708]=3708;
		pattern1[3709]=3709;
		pattern1[3710]=3710;
		pattern1[3711]=3711;
		pattern1[3712]=3712;
		pattern1[3713]=3713;
		pattern1[3714]=3714;
		pattern1[3715]=3715;
		pattern1[3716]=3716;
		pattern1[3717]=3717;
		pattern1[3718]=3718;
		pattern1[3719]=3719;
		pattern1[3720]=3720;
		pattern1[3721]=3721;
		pattern1[3722]=3722;
		pattern1[3723]=3723;
		pattern1[3724]=3724;
		pattern1[3725]=3725;
		pattern1[3726]=3726;
		pattern1[3727]=3727;
		pattern1[3728]=3728;
		pattern1[3729]=3729;
		pattern1[3730]=3730;
		pattern1[3731]=3731;
		pattern1[3732]=3732;
		pattern1[3733]=3733;
		pattern1[3734]=3734;
		pattern1[3735]=3735;
		pattern1[3736]=3736;
		pattern1[3737]=3737;
		pattern1[3738]=3738;
		pattern1[3739]=3739;
		pattern1[3740]=3740;
		pattern1[3741]=3741;
		pattern1[3742]=3742;
		pattern1[3743]=3743;
		pattern1[3744]=3744;
		pattern1[3745]=3745;
		pattern1[3746]=3746;
		pattern1[3747]=3747;
		pattern1[3748]=3748;
		pattern1[3749]=3749;
		pattern1[3750]=3750;
		pattern1[3751]=3751;
		pattern1[3752]=3752;
		pattern1[3753]=3753;
		pattern1[3754]=3754;
		pattern1[3755]=3755;
		pattern1[3756]=3756;
		pattern1[3757]=3757;
		pattern1[3758]=3758;
		pattern1[3759]=3759;
		pattern1[3760]=3760;
		pattern1[3761]=3761;
		pattern1[3762]=3762;
		pattern1[3763]=3763;
		pattern1[3764]=3764;
		pattern1[3765]=3765;
		pattern1[3766]=3766;
		pattern1[3767]=3767;
		pattern1[3768]=3768;
		pattern1[3769]=3769;
		pattern1[3770]=3770;
		pattern1[3771]=3771;
		pattern1[3772]=3772;
		pattern1[3773]=3773;
		pattern1[3774]=3774;
		pattern1[3775]=3775;
		pattern1[3776]=3776;
		pattern1[3777]=3777;
		pattern1[3778]=3778;
		pattern1[3779]=3779;
		pattern1[3780]=3780;
		pattern1[3781]=3781;
		pattern1[3782]=3782;
		pattern1[3783]=3783;
		pattern1[3784]=3784;
		pattern1[3785]=3785;
		pattern1[3786]=3786;
		pattern1[3787]=3787;
		pattern1[3788]=3788;
		pattern1[3789]=3789;
		pattern1[3790]=3790;
		pattern1[3791]=3791;
		pattern1[3792]=3792;
		pattern1[3793]=3793;
		pattern1[3794]=3794;
		pattern1[3795]=3795;
		pattern1[3796]=3796;
		pattern1[3797]=3797;
		pattern1[3798]=3798;
		pattern1[3799]=3799;
		pattern1[3800]=3800;
		pattern1[3801]=3801;
		pattern1[3802]=3802;
		pattern1[3803]=3803;
		pattern1[3804]=3804;
		pattern1[3805]=3805;
		pattern1[3806]=3806;
		pattern1[3807]=3807;
		pattern1[3808]=3808;
		pattern1[3809]=3809;
		pattern1[3810]=3810;
		pattern1[3811]=3811;
		pattern1[3812]=3812;
		pattern1[3813]=3813;
		pattern1[3814]=3814;
		pattern1[3815]=3815;
		pattern1[3816]=3816;
		pattern1[3817]=3817;
		pattern1[3818]=3818;
		pattern1[3819]=3819;
		pattern1[3820]=3820;
		pattern1[3821]=3821;
		pattern1[3822]=3822;
		pattern1[3823]=3823;
		pattern1[3824]=3824;
		pattern1[3825]=3825;
		pattern1[3826]=3826;
		pattern1[3827]=3827;
		pattern1[3828]=3828;
		pattern1[3829]=3829;
		pattern1[3830]=3830;
		pattern1[3831]=3831;
		pattern1[3832]=3832;
		pattern1[3833]=3833;
		pattern1[3834]=3834;
		pattern1[3835]=3835;
		pattern1[3836]=3836;
		pattern1[3837]=3837;
		pattern1[3838]=3838;
		pattern1[3839]=3839;
		pattern1[3840]=3840;
		pattern1[3841]=3841;
		pattern1[3842]=3842;
		pattern1[3843]=3843;
		pattern1[3844]=3844;
		pattern1[3845]=3845;
		pattern1[3846]=3846;
		pattern1[3847]=3847;
		pattern1[3848]=3848;
		pattern1[3849]=3849;
		pattern1[3850]=3850;
		pattern1[3851]=3851;
		pattern1[3852]=3852;
		pattern1[3853]=3853;
		pattern1[3854]=3854;
		pattern1[3855]=3855;
		pattern1[3856]=3856;
		pattern1[3857]=3857;
		pattern1[3858]=3858;
		pattern1[3859]=3859;
		pattern1[3860]=3860;
		pattern1[3861]=3861;
		pattern1[3862]=3862;
		pattern1[3863]=3863;
		pattern1[3864]=3864;
		pattern1[3865]=3865;
		pattern1[3866]=3866;
		pattern1[3867]=3867;
		pattern1[3868]=3868;
		pattern1[3869]=3869;
		pattern1[3870]=3870;
		pattern1[3871]=3871;
		pattern1[3872]=3872;
		pattern1[3873]=3873;
		pattern1[3874]=3874;
		pattern1[3875]=3875;
		pattern1[3876]=3876;
		pattern1[3877]=3877;
		pattern1[3878]=3878;
		pattern1[3879]=3879;
		pattern1[3880]=3880;
		pattern1[3881]=3881;
		pattern1[3882]=3882;
		pattern1[3883]=3883;
		pattern1[3884]=3884;
		pattern1[3885]=3885;
		pattern1[3886]=3886;
		pattern1[3887]=3887;
		pattern1[3888]=3888;
		pattern1[3889]=3889;
		pattern1[3890]=3890;
		pattern1[3891]=3891;
		pattern1[3892]=3892;
		pattern1[3893]=3893;
		pattern1[3894]=3894;
		pattern1[3895]=3895;
		pattern1[3896]=3896;
		pattern1[3897]=3897;
		pattern1[3898]=3898;
		pattern1[3899]=3899;
		pattern1[3900]=3900;
		pattern1[3901]=3901;
		pattern1[3902]=3902;
		pattern1[3903]=3903;
		pattern1[3904]=3904;
		pattern1[3905]=3905;
		pattern1[3906]=3906;
		pattern1[3907]=3907;
		pattern1[3908]=3908;
		pattern1[3909]=3909;
		pattern1[3910]=3910;
		pattern1[3911]=3911;
		pattern1[3912]=3912;
		pattern1[3913]=3913;
		pattern1[3914]=3914;
		pattern1[3915]=3915;
		pattern1[3916]=3916;
		pattern1[3917]=3917;
		pattern1[3918]=3918;
		pattern1[3919]=3919;
		pattern1[3920]=3920;
		pattern1[3921]=3921;
		pattern1[3922]=3922;
		pattern1[3923]=3923;
		pattern1[3924]=3924;
		pattern1[3925]=3925;
		pattern1[3926]=3926;
		pattern1[3927]=3927;
		pattern1[3928]=3928;
		pattern1[3929]=3929;
		pattern1[3930]=3930;
		pattern1[3931]=3931;
		pattern1[3932]=3932;
		pattern1[3933]=3933;
		pattern1[3934]=3934;
		pattern1[3935]=3935;
		pattern1[3936]=3936;
		pattern1[3937]=3937;
		pattern1[3938]=3938;
		pattern1[3939]=3939;
		pattern1[3940]=3940;
		pattern1[3941]=3941;
		pattern1[3942]=3942;
		pattern1[3943]=3943;
		pattern1[3944]=3944;
		pattern1[3945]=3945;
		pattern1[3946]=3946;
		pattern1[3947]=3947;
		pattern1[3948]=3948;
		pattern1[3949]=3949;
		pattern1[3950]=3950;
		pattern1[3951]=3951;
		pattern1[3952]=3952;
		pattern1[3953]=3953;
		pattern1[3954]=3954;
		pattern1[3955]=3955;
		pattern1[3956]=3956;
		pattern1[3957]=3957;
		pattern1[3958]=3958;
		pattern1[3959]=3959;
		pattern1[3960]=3960;
		pattern1[3961]=3961;
		pattern1[3962]=3962;
		pattern1[3963]=3963;
		pattern1[3964]=3964;
		pattern1[3965]=3965;
		pattern1[3966]=3966;
		pattern1[3967]=3967;
		pattern1[3968]=3968;
		pattern1[3969]=3969;
		pattern1[3970]=3970;
		pattern1[3971]=3971;
		pattern1[3972]=3972;
		pattern1[3973]=3973;
		pattern1[3974]=3974;
		pattern1[3975]=3975;
		pattern1[3976]=3976;
		pattern1[3977]=3977;
		pattern1[3978]=3978;
		pattern1[3979]=3979;
		pattern1[3980]=3980;
		pattern1[3981]=3981;
		pattern1[3982]=3982;
		pattern1[3983]=3983;
		pattern1[3984]=3984;
		pattern1[3985]=3985;
		pattern1[3986]=3986;
		pattern1[3987]=3987;
		pattern1[3988]=3988;
		pattern1[3989]=3989;
		pattern1[3990]=3990;
		pattern1[3991]=3991;
		pattern1[3992]=3992;
		pattern1[3993]=3993;
		pattern1[3994]=3994;
		pattern1[3995]=3995;
		pattern1[3996]=3996;
		pattern1[3997]=3997;
		pattern1[3998]=3998;
		pattern1[3999]=3999;
		pattern1[4000]=4000;
		pattern1[4001]=4001;
		pattern1[4002]=4002;
		pattern1[4003]=4003;
		pattern1[4004]=4004;
		pattern1[4005]=4005;
		pattern1[4006]=4006;
		pattern1[4007]=4007;
		pattern1[4008]=4008;
		pattern1[4009]=4009;
		pattern1[4010]=4010;
		pattern1[4011]=4011;
		pattern1[4012]=4012;
		pattern1[4013]=4013;
		pattern1[4014]=4014;
		pattern1[4015]=4015;
		pattern1[4016]=4016;
		pattern1[4017]=4017;
		pattern1[4018]=4018;
		pattern1[4019]=4019;
		pattern1[4020]=4020;
		pattern1[4021]=4021;
		pattern1[4022]=4022;
		pattern1[4023]=4023;
		pattern1[4024]=4024;
		pattern1[4025]=4025;
		pattern1[4026]=4026;
		pattern1[4027]=4027;
		pattern1[4028]=4028;
		pattern1[4029]=4029;
		pattern1[4030]=4030;
		pattern1[4031]=4031;
		pattern1[4032]=4032;
		pattern1[4033]=4033;
		pattern1[4034]=4034;
		pattern1[4035]=4035;
		pattern1[4036]=4036;
		pattern1[4037]=4037;
		pattern1[4038]=4038;
		pattern1[4039]=4039;
		pattern1[4040]=4040;
		pattern1[4041]=4041;
		pattern1[4042]=4042;
		pattern1[4043]=4043;
		pattern1[4044]=4044;
		pattern1[4045]=4045;
		pattern1[4046]=4046;
		pattern1[4047]=4047;
		pattern1[4048]=4048;
		pattern1[4049]=4049;
		pattern1[4050]=4050;
		pattern1[4051]=4051;
		pattern1[4052]=4052;
		pattern1[4053]=4053;
		pattern1[4054]=4054;
		pattern1[4055]=4055;
		pattern1[4056]=4056;
		pattern1[4057]=4057;
		pattern1[4058]=4058;
		pattern1[4059]=4059;
		pattern1[4060]=4060;
		pattern1[4061]=4061;
		pattern1[4062]=4062;
		pattern1[4063]=4063;
		pattern1[4064]=4064;
		pattern1[4065]=4065;
		pattern1[4066]=4066;
		pattern1[4067]=4067;
		pattern1[4068]=4068;
		pattern1[4069]=4069;
		pattern1[4070]=4070;
		pattern1[4071]=4071;
		pattern1[4072]=4072;
		pattern1[4073]=4073;
		pattern1[4074]=4074;
		pattern1[4075]=4075;
		pattern1[4076]=4076;
		pattern1[4077]=4077;
		pattern1[4078]=4078;
		pattern1[4079]=4079;
		pattern1[4080]=4080;
		pattern1[4081]=4081;
		pattern1[4082]=4082;
		pattern1[4083]=4083;
		pattern1[4084]=4084;
		pattern1[4085]=4085;
		pattern1[4086]=4086;
		pattern1[4087]=4087;
		pattern1[4088]=4088;
		pattern1[4089]=4089;
		pattern1[4090]=4090;
		pattern1[4091]=4091;
		pattern1[4092]=4092;
		pattern1[4093]=4093;
		pattern1[4094]=4094;
		pattern1[4095]=4095;


		pattern2[0]=4095;
		pattern2[1]=4094;
		pattern2[2]=4093;
		pattern2[3]=4092;
		pattern2[4]=4091;
		pattern2[5]=4090;
		pattern2[6]=4089;
		pattern2[7]=4088;
		pattern2[8]=4087;
		pattern2[9]=4086;
		pattern2[10]=4085;
		pattern2[11]=4084;
		pattern2[12]=4083;
		pattern2[13]=4082;
		pattern2[14]=4081;
		pattern2[15]=4080;
		pattern2[16]=4079;
		pattern2[17]=4078;
		pattern2[18]=4077;
		pattern2[19]=4076;
		pattern2[20]=4075;
		pattern2[21]=4074;
		pattern2[22]=4073;
		pattern2[23]=4072;
		pattern2[24]=4071;
		pattern2[25]=4070;
		pattern2[26]=4069;
		pattern2[27]=4068;
		pattern2[28]=4067;
		pattern2[29]=4066;
		pattern2[30]=4065;
		pattern2[31]=4064;
		pattern2[32]=4063;
		pattern2[33]=4062;
		pattern2[34]=4061;
		pattern2[35]=4060;
		pattern2[36]=4059;
		pattern2[37]=4058;
		pattern2[38]=4057;
		pattern2[39]=4056;
		pattern2[40]=4055;
		pattern2[41]=4054;
		pattern2[42]=4053;
		pattern2[43]=4052;
		pattern2[44]=4051;
		pattern2[45]=4050;
		pattern2[46]=4049;
		pattern2[47]=4048;
		pattern2[48]=4047;
		pattern2[49]=4046;
		pattern2[50]=4045;
		pattern2[51]=4044;
		pattern2[52]=4043;
		pattern2[53]=4042;
		pattern2[54]=4041;
		pattern2[55]=4040;
		pattern2[56]=4039;
		pattern2[57]=4038;
		pattern2[58]=4037;
		pattern2[59]=4036;
		pattern2[60]=4035;
		pattern2[61]=4034;
		pattern2[62]=4033;
		pattern2[63]=4032;
		pattern2[64]=4031;
		pattern2[65]=4030;
		pattern2[66]=4029;
		pattern2[67]=4028;
		pattern2[68]=4027;
		pattern2[69]=4026;
		pattern2[70]=4025;
		pattern2[71]=4024;
		pattern2[72]=4023;
		pattern2[73]=4022;
		pattern2[74]=4021;
		pattern2[75]=4020;
		pattern2[76]=4019;
		pattern2[77]=4018;
		pattern2[78]=4017;
		pattern2[79]=4016;
		pattern2[80]=4015;
		pattern2[81]=4014;
		pattern2[82]=4013;
		pattern2[83]=4012;
		pattern2[84]=4011;
		pattern2[85]=4010;
		pattern2[86]=4009;
		pattern2[87]=4008;
		pattern2[88]=4007;
		pattern2[89]=4006;
		pattern2[90]=4005;
		pattern2[91]=4004;
		pattern2[92]=4003;
		pattern2[93]=4002;
		pattern2[94]=4001;
		pattern2[95]=4000;
		pattern2[96]=3999;
		pattern2[97]=3998;
		pattern2[98]=3997;
		pattern2[99]=3996;
		pattern2[100]=3995;
		pattern2[101]=3994;
		pattern2[102]=3993;
		pattern2[103]=3992;
		pattern2[104]=3991;
		pattern2[105]=3990;
		pattern2[106]=3989;
		pattern2[107]=3988;
		pattern2[108]=3987;
		pattern2[109]=3986;
		pattern2[110]=3985;
		pattern2[111]=3984;
		pattern2[112]=3983;
		pattern2[113]=3982;
		pattern2[114]=3981;
		pattern2[115]=3980;
		pattern2[116]=3979;
		pattern2[117]=3978;
		pattern2[118]=3977;
		pattern2[119]=3976;
		pattern2[120]=3975;
		pattern2[121]=3974;
		pattern2[122]=3973;
		pattern2[123]=3972;
		pattern2[124]=3971;
		pattern2[125]=3970;
		pattern2[126]=3969;
		pattern2[127]=3968;
		pattern2[128]=3967;
		pattern2[129]=3966;
		pattern2[130]=3965;
		pattern2[131]=3964;
		pattern2[132]=3963;
		pattern2[133]=3962;
		pattern2[134]=3961;
		pattern2[135]=3960;
		pattern2[136]=3959;
		pattern2[137]=3958;
		pattern2[138]=3957;
		pattern2[139]=3956;
		pattern2[140]=3955;
		pattern2[141]=3954;
		pattern2[142]=3953;
		pattern2[143]=3952;
		pattern2[144]=3951;
		pattern2[145]=3950;
		pattern2[146]=3949;
		pattern2[147]=3948;
		pattern2[148]=3947;
		pattern2[149]=3946;
		pattern2[150]=3945;
		pattern2[151]=3944;
		pattern2[152]=3943;
		pattern2[153]=3942;
		pattern2[154]=3941;
		pattern2[155]=3940;
		pattern2[156]=3939;
		pattern2[157]=3938;
		pattern2[158]=3937;
		pattern2[159]=3936;
		pattern2[160]=3935;
		pattern2[161]=3934;
		pattern2[162]=3933;
		pattern2[163]=3932;
		pattern2[164]=3931;
		pattern2[165]=3930;
		pattern2[166]=3929;
		pattern2[167]=3928;
		pattern2[168]=3927;
		pattern2[169]=3926;
		pattern2[170]=3925;
		pattern2[171]=3924;
		pattern2[172]=3923;
		pattern2[173]=3922;
		pattern2[174]=3921;
		pattern2[175]=3920;
		pattern2[176]=3919;
		pattern2[177]=3918;
		pattern2[178]=3917;
		pattern2[179]=3916;
		pattern2[180]=3915;
		pattern2[181]=3914;
		pattern2[182]=3913;
		pattern2[183]=3912;
		pattern2[184]=3911;
		pattern2[185]=3910;
		pattern2[186]=3909;
		pattern2[187]=3908;
		pattern2[188]=3907;
		pattern2[189]=3906;
		pattern2[190]=3905;
		pattern2[191]=3904;
		pattern2[192]=3903;
		pattern2[193]=3902;
		pattern2[194]=3901;
		pattern2[195]=3900;
		pattern2[196]=3899;
		pattern2[197]=3898;
		pattern2[198]=3897;
		pattern2[199]=3896;
		pattern2[200]=3895;
		pattern2[201]=3894;
		pattern2[202]=3893;
		pattern2[203]=3892;
		pattern2[204]=3891;
		pattern2[205]=3890;
		pattern2[206]=3889;
		pattern2[207]=3888;
		pattern2[208]=3887;
		pattern2[209]=3886;
		pattern2[210]=3885;
		pattern2[211]=3884;
		pattern2[212]=3883;
		pattern2[213]=3882;
		pattern2[214]=3881;
		pattern2[215]=3880;
		pattern2[216]=3879;
		pattern2[217]=3878;
		pattern2[218]=3877;
		pattern2[219]=3876;
		pattern2[220]=3875;
		pattern2[221]=3874;
		pattern2[222]=3873;
		pattern2[223]=3872;
		pattern2[224]=3871;
		pattern2[225]=3870;
		pattern2[226]=3869;
		pattern2[227]=3868;
		pattern2[228]=3867;
		pattern2[229]=3866;
		pattern2[230]=3865;
		pattern2[231]=3864;
		pattern2[232]=3863;
		pattern2[233]=3862;
		pattern2[234]=3861;
		pattern2[235]=3860;
		pattern2[236]=3859;
		pattern2[237]=3858;
		pattern2[238]=3857;
		pattern2[239]=3856;
		pattern2[240]=3855;
		pattern2[241]=3854;
		pattern2[242]=3853;
		pattern2[243]=3852;
		pattern2[244]=3851;
		pattern2[245]=3850;
		pattern2[246]=3849;
		pattern2[247]=3848;
		pattern2[248]=3847;
		pattern2[249]=3846;
		pattern2[250]=3845;
		pattern2[251]=3844;
		pattern2[252]=3843;
		pattern2[253]=3842;
		pattern2[254]=3841;
		pattern2[255]=3840;
		pattern2[256]=3839;
		pattern2[257]=3838;
		pattern2[258]=3837;
		pattern2[259]=3836;
		pattern2[260]=3835;
		pattern2[261]=3834;
		pattern2[262]=3833;
		pattern2[263]=3832;
		pattern2[264]=3831;
		pattern2[265]=3830;
		pattern2[266]=3829;
		pattern2[267]=3828;
		pattern2[268]=3827;
		pattern2[269]=3826;
		pattern2[270]=3825;
		pattern2[271]=3824;
		pattern2[272]=3823;
		pattern2[273]=3822;
		pattern2[274]=3821;
		pattern2[275]=3820;
		pattern2[276]=3819;
		pattern2[277]=3818;
		pattern2[278]=3817;
		pattern2[279]=3816;
		pattern2[280]=3815;
		pattern2[281]=3814;
		pattern2[282]=3813;
		pattern2[283]=3812;
		pattern2[284]=3811;
		pattern2[285]=3810;
		pattern2[286]=3809;
		pattern2[287]=3808;
		pattern2[288]=3807;
		pattern2[289]=3806;
		pattern2[290]=3805;
		pattern2[291]=3804;
		pattern2[292]=3803;
		pattern2[293]=3802;
		pattern2[294]=3801;
		pattern2[295]=3800;
		pattern2[296]=3799;
		pattern2[297]=3798;
		pattern2[298]=3797;
		pattern2[299]=3796;
		pattern2[300]=3795;
		pattern2[301]=3794;
		pattern2[302]=3793;
		pattern2[303]=3792;
		pattern2[304]=3791;
		pattern2[305]=3790;
		pattern2[306]=3789;
		pattern2[307]=3788;
		pattern2[308]=3787;
		pattern2[309]=3786;
		pattern2[310]=3785;
		pattern2[311]=3784;
		pattern2[312]=3783;
		pattern2[313]=3782;
		pattern2[314]=3781;
		pattern2[315]=3780;
		pattern2[316]=3779;
		pattern2[317]=3778;
		pattern2[318]=3777;
		pattern2[319]=3776;
		pattern2[320]=3775;
		pattern2[321]=3774;
		pattern2[322]=3773;
		pattern2[323]=3772;
		pattern2[324]=3771;
		pattern2[325]=3770;
		pattern2[326]=3769;
		pattern2[327]=3768;
		pattern2[328]=3767;
		pattern2[329]=3766;
		pattern2[330]=3765;
		pattern2[331]=3764;
		pattern2[332]=3763;
		pattern2[333]=3762;
		pattern2[334]=3761;
		pattern2[335]=3760;
		pattern2[336]=3759;
		pattern2[337]=3758;
		pattern2[338]=3757;
		pattern2[339]=3756;
		pattern2[340]=3755;
		pattern2[341]=3754;
		pattern2[342]=3753;
		pattern2[343]=3752;
		pattern2[344]=3751;
		pattern2[345]=3750;
		pattern2[346]=3749;
		pattern2[347]=3748;
		pattern2[348]=3747;
		pattern2[349]=3746;
		pattern2[350]=3745;
		pattern2[351]=3744;
		pattern2[352]=3743;
		pattern2[353]=3742;
		pattern2[354]=3741;
		pattern2[355]=3740;
		pattern2[356]=3739;
		pattern2[357]=3738;
		pattern2[358]=3737;
		pattern2[359]=3736;
		pattern2[360]=3735;
		pattern2[361]=3734;
		pattern2[362]=3733;
		pattern2[363]=3732;
		pattern2[364]=3731;
		pattern2[365]=3730;
		pattern2[366]=3729;
		pattern2[367]=3728;
		pattern2[368]=3727;
		pattern2[369]=3726;
		pattern2[370]=3725;
		pattern2[371]=3724;
		pattern2[372]=3723;
		pattern2[373]=3722;
		pattern2[374]=3721;
		pattern2[375]=3720;
		pattern2[376]=3719;
		pattern2[377]=3718;
		pattern2[378]=3717;
		pattern2[379]=3716;
		pattern2[380]=3715;
		pattern2[381]=3714;
		pattern2[382]=3713;
		pattern2[383]=3712;
		pattern2[384]=3711;
		pattern2[385]=3710;
		pattern2[386]=3709;
		pattern2[387]=3708;
		pattern2[388]=3707;
		pattern2[389]=3706;
		pattern2[390]=3705;
		pattern2[391]=3704;
		pattern2[392]=3703;
		pattern2[393]=3702;
		pattern2[394]=3701;
		pattern2[395]=3700;
		pattern2[396]=3699;
		pattern2[397]=3698;
		pattern2[398]=3697;
		pattern2[399]=3696;
		pattern2[400]=3695;
		pattern2[401]=3694;
		pattern2[402]=3693;
		pattern2[403]=3692;
		pattern2[404]=3691;
		pattern2[405]=3690;
		pattern2[406]=3689;
		pattern2[407]=3688;
		pattern2[408]=3687;
		pattern2[409]=3686;
		pattern2[410]=3685;
		pattern2[411]=3684;
		pattern2[412]=3683;
		pattern2[413]=3682;
		pattern2[414]=3681;
		pattern2[415]=3680;
		pattern2[416]=3679;
		pattern2[417]=3678;
		pattern2[418]=3677;
		pattern2[419]=3676;
		pattern2[420]=3675;
		pattern2[421]=3674;
		pattern2[422]=3673;
		pattern2[423]=3672;
		pattern2[424]=3671;
		pattern2[425]=3670;
		pattern2[426]=3669;
		pattern2[427]=3668;
		pattern2[428]=3667;
		pattern2[429]=3666;
		pattern2[430]=3665;
		pattern2[431]=3664;
		pattern2[432]=3663;
		pattern2[433]=3662;
		pattern2[434]=3661;
		pattern2[435]=3660;
		pattern2[436]=3659;
		pattern2[437]=3658;
		pattern2[438]=3657;
		pattern2[439]=3656;
		pattern2[440]=3655;
		pattern2[441]=3654;
		pattern2[442]=3653;
		pattern2[443]=3652;
		pattern2[444]=3651;
		pattern2[445]=3650;
		pattern2[446]=3649;
		pattern2[447]=3648;
		pattern2[448]=3647;
		pattern2[449]=3646;
		pattern2[450]=3645;
		pattern2[451]=3644;
		pattern2[452]=3643;
		pattern2[453]=3642;
		pattern2[454]=3641;
		pattern2[455]=3640;
		pattern2[456]=3639;
		pattern2[457]=3638;
		pattern2[458]=3637;
		pattern2[459]=3636;
		pattern2[460]=3635;
		pattern2[461]=3634;
		pattern2[462]=3633;
		pattern2[463]=3632;
		pattern2[464]=3631;
		pattern2[465]=3630;
		pattern2[466]=3629;
		pattern2[467]=3628;
		pattern2[468]=3627;
		pattern2[469]=3626;
		pattern2[470]=3625;
		pattern2[471]=3624;
		pattern2[472]=3623;
		pattern2[473]=3622;
		pattern2[474]=3621;
		pattern2[475]=3620;
		pattern2[476]=3619;
		pattern2[477]=3618;
		pattern2[478]=3617;
		pattern2[479]=3616;
		pattern2[480]=3615;
		pattern2[481]=3614;
		pattern2[482]=3613;
		pattern2[483]=3612;
		pattern2[484]=3611;
		pattern2[485]=3610;
		pattern2[486]=3609;
		pattern2[487]=3608;
		pattern2[488]=3607;
		pattern2[489]=3606;
		pattern2[490]=3605;
		pattern2[491]=3604;
		pattern2[492]=3603;
		pattern2[493]=3602;
		pattern2[494]=3601;
		pattern2[495]=3600;
		pattern2[496]=3599;
		pattern2[497]=3598;
		pattern2[498]=3597;
		pattern2[499]=3596;
		pattern2[500]=3595;
		pattern2[501]=3594;
		pattern2[502]=3593;
		pattern2[503]=3592;
		pattern2[504]=3591;
		pattern2[505]=3590;
		pattern2[506]=3589;
		pattern2[507]=3588;
		pattern2[508]=3587;
		pattern2[509]=3586;
		pattern2[510]=3585;
		pattern2[511]=3584;
		pattern2[512]=3583;
		pattern2[513]=3582;
		pattern2[514]=3581;
		pattern2[515]=3580;
		pattern2[516]=3579;
		pattern2[517]=3578;
		pattern2[518]=3577;
		pattern2[519]=3576;
		pattern2[520]=3575;
		pattern2[521]=3574;
		pattern2[522]=3573;
		pattern2[523]=3572;
		pattern2[524]=3571;
		pattern2[525]=3570;
		pattern2[526]=3569;
		pattern2[527]=3568;
		pattern2[528]=3567;
		pattern2[529]=3566;
		pattern2[530]=3565;
		pattern2[531]=3564;
		pattern2[532]=3563;
		pattern2[533]=3562;
		pattern2[534]=3561;
		pattern2[535]=3560;
		pattern2[536]=3559;
		pattern2[537]=3558;
		pattern2[538]=3557;
		pattern2[539]=3556;
		pattern2[540]=3555;
		pattern2[541]=3554;
		pattern2[542]=3553;
		pattern2[543]=3552;
		pattern2[544]=3551;
		pattern2[545]=3550;
		pattern2[546]=3549;
		pattern2[547]=3548;
		pattern2[548]=3547;
		pattern2[549]=3546;
		pattern2[550]=3545;
		pattern2[551]=3544;
		pattern2[552]=3543;
		pattern2[553]=3542;
		pattern2[554]=3541;
		pattern2[555]=3540;
		pattern2[556]=3539;
		pattern2[557]=3538;
		pattern2[558]=3537;
		pattern2[559]=3536;
		pattern2[560]=3535;
		pattern2[561]=3534;
		pattern2[562]=3533;
		pattern2[563]=3532;
		pattern2[564]=3531;
		pattern2[565]=3530;
		pattern2[566]=3529;
		pattern2[567]=3528;
		pattern2[568]=3527;
		pattern2[569]=3526;
		pattern2[570]=3525;
		pattern2[571]=3524;
		pattern2[572]=3523;
		pattern2[573]=3522;
		pattern2[574]=3521;
		pattern2[575]=3520;
		pattern2[576]=3519;
		pattern2[577]=3518;
		pattern2[578]=3517;
		pattern2[579]=3516;
		pattern2[580]=3515;
		pattern2[581]=3514;
		pattern2[582]=3513;
		pattern2[583]=3512;
		pattern2[584]=3511;
		pattern2[585]=3510;
		pattern2[586]=3509;
		pattern2[587]=3508;
		pattern2[588]=3507;
		pattern2[589]=3506;
		pattern2[590]=3505;
		pattern2[591]=3504;
		pattern2[592]=3503;
		pattern2[593]=3502;
		pattern2[594]=3501;
		pattern2[595]=3500;
		pattern2[596]=3499;
		pattern2[597]=3498;
		pattern2[598]=3497;
		pattern2[599]=3496;
		pattern2[600]=3495;
		pattern2[601]=3494;
		pattern2[602]=3493;
		pattern2[603]=3492;
		pattern2[604]=3491;
		pattern2[605]=3490;
		pattern2[606]=3489;
		pattern2[607]=3488;
		pattern2[608]=3487;
		pattern2[609]=3486;
		pattern2[610]=3485;
		pattern2[611]=3484;
		pattern2[612]=3483;
		pattern2[613]=3482;
		pattern2[614]=3481;
		pattern2[615]=3480;
		pattern2[616]=3479;
		pattern2[617]=3478;
		pattern2[618]=3477;
		pattern2[619]=3476;
		pattern2[620]=3475;
		pattern2[621]=3474;
		pattern2[622]=3473;
		pattern2[623]=3472;
		pattern2[624]=3471;
		pattern2[625]=3470;
		pattern2[626]=3469;
		pattern2[627]=3468;
		pattern2[628]=3467;
		pattern2[629]=3466;
		pattern2[630]=3465;
		pattern2[631]=3464;
		pattern2[632]=3463;
		pattern2[633]=3462;
		pattern2[634]=3461;
		pattern2[635]=3460;
		pattern2[636]=3459;
		pattern2[637]=3458;
		pattern2[638]=3457;
		pattern2[639]=3456;
		pattern2[640]=3455;
		pattern2[641]=3454;
		pattern2[642]=3453;
		pattern2[643]=3452;
		pattern2[644]=3451;
		pattern2[645]=3450;
		pattern2[646]=3449;
		pattern2[647]=3448;
		pattern2[648]=3447;
		pattern2[649]=3446;
		pattern2[650]=3445;
		pattern2[651]=3444;
		pattern2[652]=3443;
		pattern2[653]=3442;
		pattern2[654]=3441;
		pattern2[655]=3440;
		pattern2[656]=3439;
		pattern2[657]=3438;
		pattern2[658]=3437;
		pattern2[659]=3436;
		pattern2[660]=3435;
		pattern2[661]=3434;
		pattern2[662]=3433;
		pattern2[663]=3432;
		pattern2[664]=3431;
		pattern2[665]=3430;
		pattern2[666]=3429;
		pattern2[667]=3428;
		pattern2[668]=3427;
		pattern2[669]=3426;
		pattern2[670]=3425;
		pattern2[671]=3424;
		pattern2[672]=3423;
		pattern2[673]=3422;
		pattern2[674]=3421;
		pattern2[675]=3420;
		pattern2[676]=3419;
		pattern2[677]=3418;
		pattern2[678]=3417;
		pattern2[679]=3416;
		pattern2[680]=3415;
		pattern2[681]=3414;
		pattern2[682]=3413;
		pattern2[683]=3412;
		pattern2[684]=3411;
		pattern2[685]=3410;
		pattern2[686]=3409;
		pattern2[687]=3408;
		pattern2[688]=3407;
		pattern2[689]=3406;
		pattern2[690]=3405;
		pattern2[691]=3404;
		pattern2[692]=3403;
		pattern2[693]=3402;
		pattern2[694]=3401;
		pattern2[695]=3400;
		pattern2[696]=3399;
		pattern2[697]=3398;
		pattern2[698]=3397;
		pattern2[699]=3396;
		pattern2[700]=3395;
		pattern2[701]=3394;
		pattern2[702]=3393;
		pattern2[703]=3392;
		pattern2[704]=3391;
		pattern2[705]=3390;
		pattern2[706]=3389;
		pattern2[707]=3388;
		pattern2[708]=3387;
		pattern2[709]=3386;
		pattern2[710]=3385;
		pattern2[711]=3384;
		pattern2[712]=3383;
		pattern2[713]=3382;
		pattern2[714]=3381;
		pattern2[715]=3380;
		pattern2[716]=3379;
		pattern2[717]=3378;
		pattern2[718]=3377;
		pattern2[719]=3376;
		pattern2[720]=3375;
		pattern2[721]=3374;
		pattern2[722]=3373;
		pattern2[723]=3372;
		pattern2[724]=3371;
		pattern2[725]=3370;
		pattern2[726]=3369;
		pattern2[727]=3368;
		pattern2[728]=3367;
		pattern2[729]=3366;
		pattern2[730]=3365;
		pattern2[731]=3364;
		pattern2[732]=3363;
		pattern2[733]=3362;
		pattern2[734]=3361;
		pattern2[735]=3360;
		pattern2[736]=3359;
		pattern2[737]=3358;
		pattern2[738]=3357;
		pattern2[739]=3356;
		pattern2[740]=3355;
		pattern2[741]=3354;
		pattern2[742]=3353;
		pattern2[743]=3352;
		pattern2[744]=3351;
		pattern2[745]=3350;
		pattern2[746]=3349;
		pattern2[747]=3348;
		pattern2[748]=3347;
		pattern2[749]=3346;
		pattern2[750]=3345;
		pattern2[751]=3344;
		pattern2[752]=3343;
		pattern2[753]=3342;
		pattern2[754]=3341;
		pattern2[755]=3340;
		pattern2[756]=3339;
		pattern2[757]=3338;
		pattern2[758]=3337;
		pattern2[759]=3336;
		pattern2[760]=3335;
		pattern2[761]=3334;
		pattern2[762]=3333;
		pattern2[763]=3332;
		pattern2[764]=3331;
		pattern2[765]=3330;
		pattern2[766]=3329;
		pattern2[767]=3328;
		pattern2[768]=3327;
		pattern2[769]=3326;
		pattern2[770]=3325;
		pattern2[771]=3324;
		pattern2[772]=3323;
		pattern2[773]=3322;
		pattern2[774]=3321;
		pattern2[775]=3320;
		pattern2[776]=3319;
		pattern2[777]=3318;
		pattern2[778]=3317;
		pattern2[779]=3316;
		pattern2[780]=3315;
		pattern2[781]=3314;
		pattern2[782]=3313;
		pattern2[783]=3312;
		pattern2[784]=3311;
		pattern2[785]=3310;
		pattern2[786]=3309;
		pattern2[787]=3308;
		pattern2[788]=3307;
		pattern2[789]=3306;
		pattern2[790]=3305;
		pattern2[791]=3304;
		pattern2[792]=3303;
		pattern2[793]=3302;
		pattern2[794]=3301;
		pattern2[795]=3300;
		pattern2[796]=3299;
		pattern2[797]=3298;
		pattern2[798]=3297;
		pattern2[799]=3296;
		pattern2[800]=3295;
		pattern2[801]=3294;
		pattern2[802]=3293;
		pattern2[803]=3292;
		pattern2[804]=3291;
		pattern2[805]=3290;
		pattern2[806]=3289;
		pattern2[807]=3288;
		pattern2[808]=3287;
		pattern2[809]=3286;
		pattern2[810]=3285;
		pattern2[811]=3284;
		pattern2[812]=3283;
		pattern2[813]=3282;
		pattern2[814]=3281;
		pattern2[815]=3280;
		pattern2[816]=3279;
		pattern2[817]=3278;
		pattern2[818]=3277;
		pattern2[819]=3276;
		pattern2[820]=3275;
		pattern2[821]=3274;
		pattern2[822]=3273;
		pattern2[823]=3272;
		pattern2[824]=3271;
		pattern2[825]=3270;
		pattern2[826]=3269;
		pattern2[827]=3268;
		pattern2[828]=3267;
		pattern2[829]=3266;
		pattern2[830]=3265;
		pattern2[831]=3264;
		pattern2[832]=3263;
		pattern2[833]=3262;
		pattern2[834]=3261;
		pattern2[835]=3260;
		pattern2[836]=3259;
		pattern2[837]=3258;
		pattern2[838]=3257;
		pattern2[839]=3256;
		pattern2[840]=3255;
		pattern2[841]=3254;
		pattern2[842]=3253;
		pattern2[843]=3252;
		pattern2[844]=3251;
		pattern2[845]=3250;
		pattern2[846]=3249;
		pattern2[847]=3248;
		pattern2[848]=3247;
		pattern2[849]=3246;
		pattern2[850]=3245;
		pattern2[851]=3244;
		pattern2[852]=3243;
		pattern2[853]=3242;
		pattern2[854]=3241;
		pattern2[855]=3240;
		pattern2[856]=3239;
		pattern2[857]=3238;
		pattern2[858]=3237;
		pattern2[859]=3236;
		pattern2[860]=3235;
		pattern2[861]=3234;
		pattern2[862]=3233;
		pattern2[863]=3232;
		pattern2[864]=3231;
		pattern2[865]=3230;
		pattern2[866]=3229;
		pattern2[867]=3228;
		pattern2[868]=3227;
		pattern2[869]=3226;
		pattern2[870]=3225;
		pattern2[871]=3224;
		pattern2[872]=3223;
		pattern2[873]=3222;
		pattern2[874]=3221;
		pattern2[875]=3220;
		pattern2[876]=3219;
		pattern2[877]=3218;
		pattern2[878]=3217;
		pattern2[879]=3216;
		pattern2[880]=3215;
		pattern2[881]=3214;
		pattern2[882]=3213;
		pattern2[883]=3212;
		pattern2[884]=3211;
		pattern2[885]=3210;
		pattern2[886]=3209;
		pattern2[887]=3208;
		pattern2[888]=3207;
		pattern2[889]=3206;
		pattern2[890]=3205;
		pattern2[891]=3204;
		pattern2[892]=3203;
		pattern2[893]=3202;
		pattern2[894]=3201;
		pattern2[895]=3200;
		pattern2[896]=3199;
		pattern2[897]=3198;
		pattern2[898]=3197;
		pattern2[899]=3196;
		pattern2[900]=3195;
		pattern2[901]=3194;
		pattern2[902]=3193;
		pattern2[903]=3192;
		pattern2[904]=3191;
		pattern2[905]=3190;
		pattern2[906]=3189;
		pattern2[907]=3188;
		pattern2[908]=3187;
		pattern2[909]=3186;
		pattern2[910]=3185;
		pattern2[911]=3184;
		pattern2[912]=3183;
		pattern2[913]=3182;
		pattern2[914]=3181;
		pattern2[915]=3180;
		pattern2[916]=3179;
		pattern2[917]=3178;
		pattern2[918]=3177;
		pattern2[919]=3176;
		pattern2[920]=3175;
		pattern2[921]=3174;
		pattern2[922]=3173;
		pattern2[923]=3172;
		pattern2[924]=3171;
		pattern2[925]=3170;
		pattern2[926]=3169;
		pattern2[927]=3168;
		pattern2[928]=3167;
		pattern2[929]=3166;
		pattern2[930]=3165;
		pattern2[931]=3164;
		pattern2[932]=3163;
		pattern2[933]=3162;
		pattern2[934]=3161;
		pattern2[935]=3160;
		pattern2[936]=3159;
		pattern2[937]=3158;
		pattern2[938]=3157;
		pattern2[939]=3156;
		pattern2[940]=3155;
		pattern2[941]=3154;
		pattern2[942]=3153;
		pattern2[943]=3152;
		pattern2[944]=3151;
		pattern2[945]=3150;
		pattern2[946]=3149;
		pattern2[947]=3148;
		pattern2[948]=3147;
		pattern2[949]=3146;
		pattern2[950]=3145;
		pattern2[951]=3144;
		pattern2[952]=3143;
		pattern2[953]=3142;
		pattern2[954]=3141;
		pattern2[955]=3140;
		pattern2[956]=3139;
		pattern2[957]=3138;
		pattern2[958]=3137;
		pattern2[959]=3136;
		pattern2[960]=3135;
		pattern2[961]=3134;
		pattern2[962]=3133;
		pattern2[963]=3132;
		pattern2[964]=3131;
		pattern2[965]=3130;
		pattern2[966]=3129;
		pattern2[967]=3128;
		pattern2[968]=3127;
		pattern2[969]=3126;
		pattern2[970]=3125;
		pattern2[971]=3124;
		pattern2[972]=3123;
		pattern2[973]=3122;
		pattern2[974]=3121;
		pattern2[975]=3120;
		pattern2[976]=3119;
		pattern2[977]=3118;
		pattern2[978]=3117;
		pattern2[979]=3116;
		pattern2[980]=3115;
		pattern2[981]=3114;
		pattern2[982]=3113;
		pattern2[983]=3112;
		pattern2[984]=3111;
		pattern2[985]=3110;
		pattern2[986]=3109;
		pattern2[987]=3108;
		pattern2[988]=3107;
		pattern2[989]=3106;
		pattern2[990]=3105;
		pattern2[991]=3104;
		pattern2[992]=3103;
		pattern2[993]=3102;
		pattern2[994]=3101;
		pattern2[995]=3100;
		pattern2[996]=3099;
		pattern2[997]=3098;
		pattern2[998]=3097;
		pattern2[999]=3096;
		pattern2[1000]=3095;
		pattern2[1001]=3094;
		pattern2[1002]=3093;
		pattern2[1003]=3092;
		pattern2[1004]=3091;
		pattern2[1005]=3090;
		pattern2[1006]=3089;
		pattern2[1007]=3088;
		pattern2[1008]=3087;
		pattern2[1009]=3086;
		pattern2[1010]=3085;
		pattern2[1011]=3084;
		pattern2[1012]=3083;
		pattern2[1013]=3082;
		pattern2[1014]=3081;
		pattern2[1015]=3080;
		pattern2[1016]=3079;
		pattern2[1017]=3078;
		pattern2[1018]=3077;
		pattern2[1019]=3076;
		pattern2[1020]=3075;
		pattern2[1021]=3074;
		pattern2[1022]=3073;
		pattern2[1023]=3072;
		pattern2[1024]=3071;
		pattern2[1025]=3070;
		pattern2[1026]=3069;
		pattern2[1027]=3068;
		pattern2[1028]=3067;
		pattern2[1029]=3066;
		pattern2[1030]=3065;
		pattern2[1031]=3064;
		pattern2[1032]=3063;
		pattern2[1033]=3062;
		pattern2[1034]=3061;
		pattern2[1035]=3060;
		pattern2[1036]=3059;
		pattern2[1037]=3058;
		pattern2[1038]=3057;
		pattern2[1039]=3056;
		pattern2[1040]=3055;
		pattern2[1041]=3054;
		pattern2[1042]=3053;
		pattern2[1043]=3052;
		pattern2[1044]=3051;
		pattern2[1045]=3050;
		pattern2[1046]=3049;
		pattern2[1047]=3048;
		pattern2[1048]=3047;
		pattern2[1049]=3046;
		pattern2[1050]=3045;
		pattern2[1051]=3044;
		pattern2[1052]=3043;
		pattern2[1053]=3042;
		pattern2[1054]=3041;
		pattern2[1055]=3040;
		pattern2[1056]=3039;
		pattern2[1057]=3038;
		pattern2[1058]=3037;
		pattern2[1059]=3036;
		pattern2[1060]=3035;
		pattern2[1061]=3034;
		pattern2[1062]=3033;
		pattern2[1063]=3032;
		pattern2[1064]=3031;
		pattern2[1065]=3030;
		pattern2[1066]=3029;
		pattern2[1067]=3028;
		pattern2[1068]=3027;
		pattern2[1069]=3026;
		pattern2[1070]=3025;
		pattern2[1071]=3024;
		pattern2[1072]=3023;
		pattern2[1073]=3022;
		pattern2[1074]=3021;
		pattern2[1075]=3020;
		pattern2[1076]=3019;
		pattern2[1077]=3018;
		pattern2[1078]=3017;
		pattern2[1079]=3016;
		pattern2[1080]=3015;
		pattern2[1081]=3014;
		pattern2[1082]=3013;
		pattern2[1083]=3012;
		pattern2[1084]=3011;
		pattern2[1085]=3010;
		pattern2[1086]=3009;
		pattern2[1087]=3008;
		pattern2[1088]=3007;
		pattern2[1089]=3006;
		pattern2[1090]=3005;
		pattern2[1091]=3004;
		pattern2[1092]=3003;
		pattern2[1093]=3002;
		pattern2[1094]=3001;
		pattern2[1095]=3000;
		pattern2[1096]=2999;
		pattern2[1097]=2998;
		pattern2[1098]=2997;
		pattern2[1099]=2996;
		pattern2[1100]=2995;
		pattern2[1101]=2994;
		pattern2[1102]=2993;
		pattern2[1103]=2992;
		pattern2[1104]=2991;
		pattern2[1105]=2990;
		pattern2[1106]=2989;
		pattern2[1107]=2988;
		pattern2[1108]=2987;
		pattern2[1109]=2986;
		pattern2[1110]=2985;
		pattern2[1111]=2984;
		pattern2[1112]=2983;
		pattern2[1113]=2982;
		pattern2[1114]=2981;
		pattern2[1115]=2980;
		pattern2[1116]=2979;
		pattern2[1117]=2978;
		pattern2[1118]=2977;
		pattern2[1119]=2976;
		pattern2[1120]=2975;
		pattern2[1121]=2974;
		pattern2[1122]=2973;
		pattern2[1123]=2972;
		pattern2[1124]=2971;
		pattern2[1125]=2970;
		pattern2[1126]=2969;
		pattern2[1127]=2968;
		pattern2[1128]=2967;
		pattern2[1129]=2966;
		pattern2[1130]=2965;
		pattern2[1131]=2964;
		pattern2[1132]=2963;
		pattern2[1133]=2962;
		pattern2[1134]=2961;
		pattern2[1135]=2960;
		pattern2[1136]=2959;
		pattern2[1137]=2958;
		pattern2[1138]=2957;
		pattern2[1139]=2956;
		pattern2[1140]=2955;
		pattern2[1141]=2954;
		pattern2[1142]=2953;
		pattern2[1143]=2952;
		pattern2[1144]=2951;
		pattern2[1145]=2950;
		pattern2[1146]=2949;
		pattern2[1147]=2948;
		pattern2[1148]=2947;
		pattern2[1149]=2946;
		pattern2[1150]=2945;
		pattern2[1151]=2944;
		pattern2[1152]=2943;
		pattern2[1153]=2942;
		pattern2[1154]=2941;
		pattern2[1155]=2940;
		pattern2[1156]=2939;
		pattern2[1157]=2938;
		pattern2[1158]=2937;
		pattern2[1159]=2936;
		pattern2[1160]=2935;
		pattern2[1161]=2934;
		pattern2[1162]=2933;
		pattern2[1163]=2932;
		pattern2[1164]=2931;
		pattern2[1165]=2930;
		pattern2[1166]=2929;
		pattern2[1167]=2928;
		pattern2[1168]=2927;
		pattern2[1169]=2926;
		pattern2[1170]=2925;
		pattern2[1171]=2924;
		pattern2[1172]=2923;
		pattern2[1173]=2922;
		pattern2[1174]=2921;
		pattern2[1175]=2920;
		pattern2[1176]=2919;
		pattern2[1177]=2918;
		pattern2[1178]=2917;
		pattern2[1179]=2916;
		pattern2[1180]=2915;
		pattern2[1181]=2914;
		pattern2[1182]=2913;
		pattern2[1183]=2912;
		pattern2[1184]=2911;
		pattern2[1185]=2910;
		pattern2[1186]=2909;
		pattern2[1187]=2908;
		pattern2[1188]=2907;
		pattern2[1189]=2906;
		pattern2[1190]=2905;
		pattern2[1191]=2904;
		pattern2[1192]=2903;
		pattern2[1193]=2902;
		pattern2[1194]=2901;
		pattern2[1195]=2900;
		pattern2[1196]=2899;
		pattern2[1197]=2898;
		pattern2[1198]=2897;
		pattern2[1199]=2896;
		pattern2[1200]=2895;
		pattern2[1201]=2894;
		pattern2[1202]=2893;
		pattern2[1203]=2892;
		pattern2[1204]=2891;
		pattern2[1205]=2890;
		pattern2[1206]=2889;
		pattern2[1207]=2888;
		pattern2[1208]=2887;
		pattern2[1209]=2886;
		pattern2[1210]=2885;
		pattern2[1211]=2884;
		pattern2[1212]=2883;
		pattern2[1213]=2882;
		pattern2[1214]=2881;
		pattern2[1215]=2880;
		pattern2[1216]=2879;
		pattern2[1217]=2878;
		pattern2[1218]=2877;
		pattern2[1219]=2876;
		pattern2[1220]=2875;
		pattern2[1221]=2874;
		pattern2[1222]=2873;
		pattern2[1223]=2872;
		pattern2[1224]=2871;
		pattern2[1225]=2870;
		pattern2[1226]=2869;
		pattern2[1227]=2868;
		pattern2[1228]=2867;
		pattern2[1229]=2866;
		pattern2[1230]=2865;
		pattern2[1231]=2864;
		pattern2[1232]=2863;
		pattern2[1233]=2862;
		pattern2[1234]=2861;
		pattern2[1235]=2860;
		pattern2[1236]=2859;
		pattern2[1237]=2858;
		pattern2[1238]=2857;
		pattern2[1239]=2856;
		pattern2[1240]=2855;
		pattern2[1241]=2854;
		pattern2[1242]=2853;
		pattern2[1243]=2852;
		pattern2[1244]=2851;
		pattern2[1245]=2850;
		pattern2[1246]=2849;
		pattern2[1247]=2848;
		pattern2[1248]=2847;
		pattern2[1249]=2846;
		pattern2[1250]=2845;
		pattern2[1251]=2844;
		pattern2[1252]=2843;
		pattern2[1253]=2842;
		pattern2[1254]=2841;
		pattern2[1255]=2840;
		pattern2[1256]=2839;
		pattern2[1257]=2838;
		pattern2[1258]=2837;
		pattern2[1259]=2836;
		pattern2[1260]=2835;
		pattern2[1261]=2834;
		pattern2[1262]=2833;
		pattern2[1263]=2832;
		pattern2[1264]=2831;
		pattern2[1265]=2830;
		pattern2[1266]=2829;
		pattern2[1267]=2828;
		pattern2[1268]=2827;
		pattern2[1269]=2826;
		pattern2[1270]=2825;
		pattern2[1271]=2824;
		pattern2[1272]=2823;
		pattern2[1273]=2822;
		pattern2[1274]=2821;
		pattern2[1275]=2820;
		pattern2[1276]=2819;
		pattern2[1277]=2818;
		pattern2[1278]=2817;
		pattern2[1279]=2816;
		pattern2[1280]=2815;
		pattern2[1281]=2814;
		pattern2[1282]=2813;
		pattern2[1283]=2812;
		pattern2[1284]=2811;
		pattern2[1285]=2810;
		pattern2[1286]=2809;
		pattern2[1287]=2808;
		pattern2[1288]=2807;
		pattern2[1289]=2806;
		pattern2[1290]=2805;
		pattern2[1291]=2804;
		pattern2[1292]=2803;
		pattern2[1293]=2802;
		pattern2[1294]=2801;
		pattern2[1295]=2800;
		pattern2[1296]=2799;
		pattern2[1297]=2798;
		pattern2[1298]=2797;
		pattern2[1299]=2796;
		pattern2[1300]=2795;
		pattern2[1301]=2794;
		pattern2[1302]=2793;
		pattern2[1303]=2792;
		pattern2[1304]=2791;
		pattern2[1305]=2790;
		pattern2[1306]=2789;
		pattern2[1307]=2788;
		pattern2[1308]=2787;
		pattern2[1309]=2786;
		pattern2[1310]=2785;
		pattern2[1311]=2784;
		pattern2[1312]=2783;
		pattern2[1313]=2782;
		pattern2[1314]=2781;
		pattern2[1315]=2780;
		pattern2[1316]=2779;
		pattern2[1317]=2778;
		pattern2[1318]=2777;
		pattern2[1319]=2776;
		pattern2[1320]=2775;
		pattern2[1321]=2774;
		pattern2[1322]=2773;
		pattern2[1323]=2772;
		pattern2[1324]=2771;
		pattern2[1325]=2770;
		pattern2[1326]=2769;
		pattern2[1327]=2768;
		pattern2[1328]=2767;
		pattern2[1329]=2766;
		pattern2[1330]=2765;
		pattern2[1331]=2764;
		pattern2[1332]=2763;
		pattern2[1333]=2762;
		pattern2[1334]=2761;
		pattern2[1335]=2760;
		pattern2[1336]=2759;
		pattern2[1337]=2758;
		pattern2[1338]=2757;
		pattern2[1339]=2756;
		pattern2[1340]=2755;
		pattern2[1341]=2754;
		pattern2[1342]=2753;
		pattern2[1343]=2752;
		pattern2[1344]=2751;
		pattern2[1345]=2750;
		pattern2[1346]=2749;
		pattern2[1347]=2748;
		pattern2[1348]=2747;
		pattern2[1349]=2746;
		pattern2[1350]=2745;
		pattern2[1351]=2744;
		pattern2[1352]=2743;
		pattern2[1353]=2742;
		pattern2[1354]=2741;
		pattern2[1355]=2740;
		pattern2[1356]=2739;
		pattern2[1357]=2738;
		pattern2[1358]=2737;
		pattern2[1359]=2736;
		pattern2[1360]=2735;
		pattern2[1361]=2734;
		pattern2[1362]=2733;
		pattern2[1363]=2732;
		pattern2[1364]=2731;
		pattern2[1365]=2730;
		pattern2[1366]=2729;
		pattern2[1367]=2728;
		pattern2[1368]=2727;
		pattern2[1369]=2726;
		pattern2[1370]=2725;
		pattern2[1371]=2724;
		pattern2[1372]=2723;
		pattern2[1373]=2722;
		pattern2[1374]=2721;
		pattern2[1375]=2720;
		pattern2[1376]=2719;
		pattern2[1377]=2718;
		pattern2[1378]=2717;
		pattern2[1379]=2716;
		pattern2[1380]=2715;
		pattern2[1381]=2714;
		pattern2[1382]=2713;
		pattern2[1383]=2712;
		pattern2[1384]=2711;
		pattern2[1385]=2710;
		pattern2[1386]=2709;
		pattern2[1387]=2708;
		pattern2[1388]=2707;
		pattern2[1389]=2706;
		pattern2[1390]=2705;
		pattern2[1391]=2704;
		pattern2[1392]=2703;
		pattern2[1393]=2702;
		pattern2[1394]=2701;
		pattern2[1395]=2700;
		pattern2[1396]=2699;
		pattern2[1397]=2698;
		pattern2[1398]=2697;
		pattern2[1399]=2696;
		pattern2[1400]=2695;
		pattern2[1401]=2694;
		pattern2[1402]=2693;
		pattern2[1403]=2692;
		pattern2[1404]=2691;
		pattern2[1405]=2690;
		pattern2[1406]=2689;
		pattern2[1407]=2688;
		pattern2[1408]=2687;
		pattern2[1409]=2686;
		pattern2[1410]=2685;
		pattern2[1411]=2684;
		pattern2[1412]=2683;
		pattern2[1413]=2682;
		pattern2[1414]=2681;
		pattern2[1415]=2680;
		pattern2[1416]=2679;
		pattern2[1417]=2678;
		pattern2[1418]=2677;
		pattern2[1419]=2676;
		pattern2[1420]=2675;
		pattern2[1421]=2674;
		pattern2[1422]=2673;
		pattern2[1423]=2672;
		pattern2[1424]=2671;
		pattern2[1425]=2670;
		pattern2[1426]=2669;
		pattern2[1427]=2668;
		pattern2[1428]=2667;
		pattern2[1429]=2666;
		pattern2[1430]=2665;
		pattern2[1431]=2664;
		pattern2[1432]=2663;
		pattern2[1433]=2662;
		pattern2[1434]=2661;
		pattern2[1435]=2660;
		pattern2[1436]=2659;
		pattern2[1437]=2658;
		pattern2[1438]=2657;
		pattern2[1439]=2656;
		pattern2[1440]=2655;
		pattern2[1441]=2654;
		pattern2[1442]=2653;
		pattern2[1443]=2652;
		pattern2[1444]=2651;
		pattern2[1445]=2650;
		pattern2[1446]=2649;
		pattern2[1447]=2648;
		pattern2[1448]=2647;
		pattern2[1449]=2646;
		pattern2[1450]=2645;
		pattern2[1451]=2644;
		pattern2[1452]=2643;
		pattern2[1453]=2642;
		pattern2[1454]=2641;
		pattern2[1455]=2640;
		pattern2[1456]=2639;
		pattern2[1457]=2638;
		pattern2[1458]=2637;
		pattern2[1459]=2636;
		pattern2[1460]=2635;
		pattern2[1461]=2634;
		pattern2[1462]=2633;
		pattern2[1463]=2632;
		pattern2[1464]=2631;
		pattern2[1465]=2630;
		pattern2[1466]=2629;
		pattern2[1467]=2628;
		pattern2[1468]=2627;
		pattern2[1469]=2626;
		pattern2[1470]=2625;
		pattern2[1471]=2624;
		pattern2[1472]=2623;
		pattern2[1473]=2622;
		pattern2[1474]=2621;
		pattern2[1475]=2620;
		pattern2[1476]=2619;
		pattern2[1477]=2618;
		pattern2[1478]=2617;
		pattern2[1479]=2616;
		pattern2[1480]=2615;
		pattern2[1481]=2614;
		pattern2[1482]=2613;
		pattern2[1483]=2612;
		pattern2[1484]=2611;
		pattern2[1485]=2610;
		pattern2[1486]=2609;
		pattern2[1487]=2608;
		pattern2[1488]=2607;
		pattern2[1489]=2606;
		pattern2[1490]=2605;
		pattern2[1491]=2604;
		pattern2[1492]=2603;
		pattern2[1493]=2602;
		pattern2[1494]=2601;
		pattern2[1495]=2600;
		pattern2[1496]=2599;
		pattern2[1497]=2598;
		pattern2[1498]=2597;
		pattern2[1499]=2596;
		pattern2[1500]=2595;
		pattern2[1501]=2594;
		pattern2[1502]=2593;
		pattern2[1503]=2592;
		pattern2[1504]=2591;
		pattern2[1505]=2590;
		pattern2[1506]=2589;
		pattern2[1507]=2588;
		pattern2[1508]=2587;
		pattern2[1509]=2586;
		pattern2[1510]=2585;
		pattern2[1511]=2584;
		pattern2[1512]=2583;
		pattern2[1513]=2582;
		pattern2[1514]=2581;
		pattern2[1515]=2580;
		pattern2[1516]=2579;
		pattern2[1517]=2578;
		pattern2[1518]=2577;
		pattern2[1519]=2576;
		pattern2[1520]=2575;
		pattern2[1521]=2574;
		pattern2[1522]=2573;
		pattern2[1523]=2572;
		pattern2[1524]=2571;
		pattern2[1525]=2570;
		pattern2[1526]=2569;
		pattern2[1527]=2568;
		pattern2[1528]=2567;
		pattern2[1529]=2566;
		pattern2[1530]=2565;
		pattern2[1531]=2564;
		pattern2[1532]=2563;
		pattern2[1533]=2562;
		pattern2[1534]=2561;
		pattern2[1535]=2560;
		pattern2[1536]=2559;
		pattern2[1537]=2558;
		pattern2[1538]=2557;
		pattern2[1539]=2556;
		pattern2[1540]=2555;
		pattern2[1541]=2554;
		pattern2[1542]=2553;
		pattern2[1543]=2552;
		pattern2[1544]=2551;
		pattern2[1545]=2550;
		pattern2[1546]=2549;
		pattern2[1547]=2548;
		pattern2[1548]=2547;
		pattern2[1549]=2546;
		pattern2[1550]=2545;
		pattern2[1551]=2544;
		pattern2[1552]=2543;
		pattern2[1553]=2542;
		pattern2[1554]=2541;
		pattern2[1555]=2540;
		pattern2[1556]=2539;
		pattern2[1557]=2538;
		pattern2[1558]=2537;
		pattern2[1559]=2536;
		pattern2[1560]=2535;
		pattern2[1561]=2534;
		pattern2[1562]=2533;
		pattern2[1563]=2532;
		pattern2[1564]=2531;
		pattern2[1565]=2530;
		pattern2[1566]=2529;
		pattern2[1567]=2528;
		pattern2[1568]=2527;
		pattern2[1569]=2526;
		pattern2[1570]=2525;
		pattern2[1571]=2524;
		pattern2[1572]=2523;
		pattern2[1573]=2522;
		pattern2[1574]=2521;
		pattern2[1575]=2520;
		pattern2[1576]=2519;
		pattern2[1577]=2518;
		pattern2[1578]=2517;
		pattern2[1579]=2516;
		pattern2[1580]=2515;
		pattern2[1581]=2514;
		pattern2[1582]=2513;
		pattern2[1583]=2512;
		pattern2[1584]=2511;
		pattern2[1585]=2510;
		pattern2[1586]=2509;
		pattern2[1587]=2508;
		pattern2[1588]=2507;
		pattern2[1589]=2506;
		pattern2[1590]=2505;
		pattern2[1591]=2504;
		pattern2[1592]=2503;
		pattern2[1593]=2502;
		pattern2[1594]=2501;
		pattern2[1595]=2500;
		pattern2[1596]=2499;
		pattern2[1597]=2498;
		pattern2[1598]=2497;
		pattern2[1599]=2496;
		pattern2[1600]=2495;
		pattern2[1601]=2494;
		pattern2[1602]=2493;
		pattern2[1603]=2492;
		pattern2[1604]=2491;
		pattern2[1605]=2490;
		pattern2[1606]=2489;
		pattern2[1607]=2488;
		pattern2[1608]=2487;
		pattern2[1609]=2486;
		pattern2[1610]=2485;
		pattern2[1611]=2484;
		pattern2[1612]=2483;
		pattern2[1613]=2482;
		pattern2[1614]=2481;
		pattern2[1615]=2480;
		pattern2[1616]=2479;
		pattern2[1617]=2478;
		pattern2[1618]=2477;
		pattern2[1619]=2476;
		pattern2[1620]=2475;
		pattern2[1621]=2474;
		pattern2[1622]=2473;
		pattern2[1623]=2472;
		pattern2[1624]=2471;
		pattern2[1625]=2470;
		pattern2[1626]=2469;
		pattern2[1627]=2468;
		pattern2[1628]=2467;
		pattern2[1629]=2466;
		pattern2[1630]=2465;
		pattern2[1631]=2464;
		pattern2[1632]=2463;
		pattern2[1633]=2462;
		pattern2[1634]=2461;
		pattern2[1635]=2460;
		pattern2[1636]=2459;
		pattern2[1637]=2458;
		pattern2[1638]=2457;
		pattern2[1639]=2456;
		pattern2[1640]=2455;
		pattern2[1641]=2454;
		pattern2[1642]=2453;
		pattern2[1643]=2452;
		pattern2[1644]=2451;
		pattern2[1645]=2450;
		pattern2[1646]=2449;
		pattern2[1647]=2448;
		pattern2[1648]=2447;
		pattern2[1649]=2446;
		pattern2[1650]=2445;
		pattern2[1651]=2444;
		pattern2[1652]=2443;
		pattern2[1653]=2442;
		pattern2[1654]=2441;
		pattern2[1655]=2440;
		pattern2[1656]=2439;
		pattern2[1657]=2438;
		pattern2[1658]=2437;
		pattern2[1659]=2436;
		pattern2[1660]=2435;
		pattern2[1661]=2434;
		pattern2[1662]=2433;
		pattern2[1663]=2432;
		pattern2[1664]=2431;
		pattern2[1665]=2430;
		pattern2[1666]=2429;
		pattern2[1667]=2428;
		pattern2[1668]=2427;
		pattern2[1669]=2426;
		pattern2[1670]=2425;
		pattern2[1671]=2424;
		pattern2[1672]=2423;
		pattern2[1673]=2422;
		pattern2[1674]=2421;
		pattern2[1675]=2420;
		pattern2[1676]=2419;
		pattern2[1677]=2418;
		pattern2[1678]=2417;
		pattern2[1679]=2416;
		pattern2[1680]=2415;
		pattern2[1681]=2414;
		pattern2[1682]=2413;
		pattern2[1683]=2412;
		pattern2[1684]=2411;
		pattern2[1685]=2410;
		pattern2[1686]=2409;
		pattern2[1687]=2408;
		pattern2[1688]=2407;
		pattern2[1689]=2406;
		pattern2[1690]=2405;
		pattern2[1691]=2404;
		pattern2[1692]=2403;
		pattern2[1693]=2402;
		pattern2[1694]=2401;
		pattern2[1695]=2400;
		pattern2[1696]=2399;
		pattern2[1697]=2398;
		pattern2[1698]=2397;
		pattern2[1699]=2396;
		pattern2[1700]=2395;
		pattern2[1701]=2394;
		pattern2[1702]=2393;
		pattern2[1703]=2392;
		pattern2[1704]=2391;
		pattern2[1705]=2390;
		pattern2[1706]=2389;
		pattern2[1707]=2388;
		pattern2[1708]=2387;
		pattern2[1709]=2386;
		pattern2[1710]=2385;
		pattern2[1711]=2384;
		pattern2[1712]=2383;
		pattern2[1713]=2382;
		pattern2[1714]=2381;
		pattern2[1715]=2380;
		pattern2[1716]=2379;
		pattern2[1717]=2378;
		pattern2[1718]=2377;
		pattern2[1719]=2376;
		pattern2[1720]=2375;
		pattern2[1721]=2374;
		pattern2[1722]=2373;
		pattern2[1723]=2372;
		pattern2[1724]=2371;
		pattern2[1725]=2370;
		pattern2[1726]=2369;
		pattern2[1727]=2368;
		pattern2[1728]=2367;
		pattern2[1729]=2366;
		pattern2[1730]=2365;
		pattern2[1731]=2364;
		pattern2[1732]=2363;
		pattern2[1733]=2362;
		pattern2[1734]=2361;
		pattern2[1735]=2360;
		pattern2[1736]=2359;
		pattern2[1737]=2358;
		pattern2[1738]=2357;
		pattern2[1739]=2356;
		pattern2[1740]=2355;
		pattern2[1741]=2354;
		pattern2[1742]=2353;
		pattern2[1743]=2352;
		pattern2[1744]=2351;
		pattern2[1745]=2350;
		pattern2[1746]=2349;
		pattern2[1747]=2348;
		pattern2[1748]=2347;
		pattern2[1749]=2346;
		pattern2[1750]=2345;
		pattern2[1751]=2344;
		pattern2[1752]=2343;
		pattern2[1753]=2342;
		pattern2[1754]=2341;
		pattern2[1755]=2340;
		pattern2[1756]=2339;
		pattern2[1757]=2338;
		pattern2[1758]=2337;
		pattern2[1759]=2336;
		pattern2[1760]=2335;
		pattern2[1761]=2334;
		pattern2[1762]=2333;
		pattern2[1763]=2332;
		pattern2[1764]=2331;
		pattern2[1765]=2330;
		pattern2[1766]=2329;
		pattern2[1767]=2328;
		pattern2[1768]=2327;
		pattern2[1769]=2326;
		pattern2[1770]=2325;
		pattern2[1771]=2324;
		pattern2[1772]=2323;
		pattern2[1773]=2322;
		pattern2[1774]=2321;
		pattern2[1775]=2320;
		pattern2[1776]=2319;
		pattern2[1777]=2318;
		pattern2[1778]=2317;
		pattern2[1779]=2316;
		pattern2[1780]=2315;
		pattern2[1781]=2314;
		pattern2[1782]=2313;
		pattern2[1783]=2312;
		pattern2[1784]=2311;
		pattern2[1785]=2310;
		pattern2[1786]=2309;
		pattern2[1787]=2308;
		pattern2[1788]=2307;
		pattern2[1789]=2306;
		pattern2[1790]=2305;
		pattern2[1791]=2304;
		pattern2[1792]=2303;
		pattern2[1793]=2302;
		pattern2[1794]=2301;
		pattern2[1795]=2300;
		pattern2[1796]=2299;
		pattern2[1797]=2298;
		pattern2[1798]=2297;
		pattern2[1799]=2296;
		pattern2[1800]=2295;
		pattern2[1801]=2294;
		pattern2[1802]=2293;
		pattern2[1803]=2292;
		pattern2[1804]=2291;
		pattern2[1805]=2290;
		pattern2[1806]=2289;
		pattern2[1807]=2288;
		pattern2[1808]=2287;
		pattern2[1809]=2286;
		pattern2[1810]=2285;
		pattern2[1811]=2284;
		pattern2[1812]=2283;
		pattern2[1813]=2282;
		pattern2[1814]=2281;
		pattern2[1815]=2280;
		pattern2[1816]=2279;
		pattern2[1817]=2278;
		pattern2[1818]=2277;
		pattern2[1819]=2276;
		pattern2[1820]=2275;
		pattern2[1821]=2274;
		pattern2[1822]=2273;
		pattern2[1823]=2272;
		pattern2[1824]=2271;
		pattern2[1825]=2270;
		pattern2[1826]=2269;
		pattern2[1827]=2268;
		pattern2[1828]=2267;
		pattern2[1829]=2266;
		pattern2[1830]=2265;
		pattern2[1831]=2264;
		pattern2[1832]=2263;
		pattern2[1833]=2262;
		pattern2[1834]=2261;
		pattern2[1835]=2260;
		pattern2[1836]=2259;
		pattern2[1837]=2258;
		pattern2[1838]=2257;
		pattern2[1839]=2256;
		pattern2[1840]=2255;
		pattern2[1841]=2254;
		pattern2[1842]=2253;
		pattern2[1843]=2252;
		pattern2[1844]=2251;
		pattern2[1845]=2250;
		pattern2[1846]=2249;
		pattern2[1847]=2248;
		pattern2[1848]=2247;
		pattern2[1849]=2246;
		pattern2[1850]=2245;
		pattern2[1851]=2244;
		pattern2[1852]=2243;
		pattern2[1853]=2242;
		pattern2[1854]=2241;
		pattern2[1855]=2240;
		pattern2[1856]=2239;
		pattern2[1857]=2238;
		pattern2[1858]=2237;
		pattern2[1859]=2236;
		pattern2[1860]=2235;
		pattern2[1861]=2234;
		pattern2[1862]=2233;
		pattern2[1863]=2232;
		pattern2[1864]=2231;
		pattern2[1865]=2230;
		pattern2[1866]=2229;
		pattern2[1867]=2228;
		pattern2[1868]=2227;
		pattern2[1869]=2226;
		pattern2[1870]=2225;
		pattern2[1871]=2224;
		pattern2[1872]=2223;
		pattern2[1873]=2222;
		pattern2[1874]=2221;
		pattern2[1875]=2220;
		pattern2[1876]=2219;
		pattern2[1877]=2218;
		pattern2[1878]=2217;
		pattern2[1879]=2216;
		pattern2[1880]=2215;
		pattern2[1881]=2214;
		pattern2[1882]=2213;
		pattern2[1883]=2212;
		pattern2[1884]=2211;
		pattern2[1885]=2210;
		pattern2[1886]=2209;
		pattern2[1887]=2208;
		pattern2[1888]=2207;
		pattern2[1889]=2206;
		pattern2[1890]=2205;
		pattern2[1891]=2204;
		pattern2[1892]=2203;
		pattern2[1893]=2202;
		pattern2[1894]=2201;
		pattern2[1895]=2200;
		pattern2[1896]=2199;
		pattern2[1897]=2198;
		pattern2[1898]=2197;
		pattern2[1899]=2196;
		pattern2[1900]=2195;
		pattern2[1901]=2194;
		pattern2[1902]=2193;
		pattern2[1903]=2192;
		pattern2[1904]=2191;
		pattern2[1905]=2190;
		pattern2[1906]=2189;
		pattern2[1907]=2188;
		pattern2[1908]=2187;
		pattern2[1909]=2186;
		pattern2[1910]=2185;
		pattern2[1911]=2184;
		pattern2[1912]=2183;
		pattern2[1913]=2182;
		pattern2[1914]=2181;
		pattern2[1915]=2180;
		pattern2[1916]=2179;
		pattern2[1917]=2178;
		pattern2[1918]=2177;
		pattern2[1919]=2176;
		pattern2[1920]=2175;
		pattern2[1921]=2174;
		pattern2[1922]=2173;
		pattern2[1923]=2172;
		pattern2[1924]=2171;
		pattern2[1925]=2170;
		pattern2[1926]=2169;
		pattern2[1927]=2168;
		pattern2[1928]=2167;
		pattern2[1929]=2166;
		pattern2[1930]=2165;
		pattern2[1931]=2164;
		pattern2[1932]=2163;
		pattern2[1933]=2162;
		pattern2[1934]=2161;
		pattern2[1935]=2160;
		pattern2[1936]=2159;
		pattern2[1937]=2158;
		pattern2[1938]=2157;
		pattern2[1939]=2156;
		pattern2[1940]=2155;
		pattern2[1941]=2154;
		pattern2[1942]=2153;
		pattern2[1943]=2152;
		pattern2[1944]=2151;
		pattern2[1945]=2150;
		pattern2[1946]=2149;
		pattern2[1947]=2148;
		pattern2[1948]=2147;
		pattern2[1949]=2146;
		pattern2[1950]=2145;
		pattern2[1951]=2144;
		pattern2[1952]=2143;
		pattern2[1953]=2142;
		pattern2[1954]=2141;
		pattern2[1955]=2140;
		pattern2[1956]=2139;
		pattern2[1957]=2138;
		pattern2[1958]=2137;
		pattern2[1959]=2136;
		pattern2[1960]=2135;
		pattern2[1961]=2134;
		pattern2[1962]=2133;
		pattern2[1963]=2132;
		pattern2[1964]=2131;
		pattern2[1965]=2130;
		pattern2[1966]=2129;
		pattern2[1967]=2128;
		pattern2[1968]=2127;
		pattern2[1969]=2126;
		pattern2[1970]=2125;
		pattern2[1971]=2124;
		pattern2[1972]=2123;
		pattern2[1973]=2122;
		pattern2[1974]=2121;
		pattern2[1975]=2120;
		pattern2[1976]=2119;
		pattern2[1977]=2118;
		pattern2[1978]=2117;
		pattern2[1979]=2116;
		pattern2[1980]=2115;
		pattern2[1981]=2114;
		pattern2[1982]=2113;
		pattern2[1983]=2112;
		pattern2[1984]=2111;
		pattern2[1985]=2110;
		pattern2[1986]=2109;
		pattern2[1987]=2108;
		pattern2[1988]=2107;
		pattern2[1989]=2106;
		pattern2[1990]=2105;
		pattern2[1991]=2104;
		pattern2[1992]=2103;
		pattern2[1993]=2102;
		pattern2[1994]=2101;
		pattern2[1995]=2100;
		pattern2[1996]=2099;
		pattern2[1997]=2098;
		pattern2[1998]=2097;
		pattern2[1999]=2096;
		pattern2[2000]=2095;
		pattern2[2001]=2094;
		pattern2[2002]=2093;
		pattern2[2003]=2092;
		pattern2[2004]=2091;
		pattern2[2005]=2090;
		pattern2[2006]=2089;
		pattern2[2007]=2088;
		pattern2[2008]=2087;
		pattern2[2009]=2086;
		pattern2[2010]=2085;
		pattern2[2011]=2084;
		pattern2[2012]=2083;
		pattern2[2013]=2082;
		pattern2[2014]=2081;
		pattern2[2015]=2080;
		pattern2[2016]=2079;
		pattern2[2017]=2078;
		pattern2[2018]=2077;
		pattern2[2019]=2076;
		pattern2[2020]=2075;
		pattern2[2021]=2074;
		pattern2[2022]=2073;
		pattern2[2023]=2072;
		pattern2[2024]=2071;
		pattern2[2025]=2070;
		pattern2[2026]=2069;
		pattern2[2027]=2068;
		pattern2[2028]=2067;
		pattern2[2029]=2066;
		pattern2[2030]=2065;
		pattern2[2031]=2064;
		pattern2[2032]=2063;
		pattern2[2033]=2062;
		pattern2[2034]=2061;
		pattern2[2035]=2060;
		pattern2[2036]=2059;
		pattern2[2037]=2058;
		pattern2[2038]=2057;
		pattern2[2039]=2056;
		pattern2[2040]=2055;
		pattern2[2041]=2054;
		pattern2[2042]=2053;
		pattern2[2043]=2052;
		pattern2[2044]=2051;
		pattern2[2045]=2050;
		pattern2[2046]=2049;
		pattern2[2047]=2048;
		pattern2[2048]=2047;
		pattern2[2049]=2046;
		pattern2[2050]=2045;
		pattern2[2051]=2044;
		pattern2[2052]=2043;
		pattern2[2053]=2042;
		pattern2[2054]=2041;
		pattern2[2055]=2040;
		pattern2[2056]=2039;
		pattern2[2057]=2038;
		pattern2[2058]=2037;
		pattern2[2059]=2036;
		pattern2[2060]=2035;
		pattern2[2061]=2034;
		pattern2[2062]=2033;
		pattern2[2063]=2032;
		pattern2[2064]=2031;
		pattern2[2065]=2030;
		pattern2[2066]=2029;
		pattern2[2067]=2028;
		pattern2[2068]=2027;
		pattern2[2069]=2026;
		pattern2[2070]=2025;
		pattern2[2071]=2024;
		pattern2[2072]=2023;
		pattern2[2073]=2022;
		pattern2[2074]=2021;
		pattern2[2075]=2020;
		pattern2[2076]=2019;
		pattern2[2077]=2018;
		pattern2[2078]=2017;
		pattern2[2079]=2016;
		pattern2[2080]=2015;
		pattern2[2081]=2014;
		pattern2[2082]=2013;
		pattern2[2083]=2012;
		pattern2[2084]=2011;
		pattern2[2085]=2010;
		pattern2[2086]=2009;
		pattern2[2087]=2008;
		pattern2[2088]=2007;
		pattern2[2089]=2006;
		pattern2[2090]=2005;
		pattern2[2091]=2004;
		pattern2[2092]=2003;
		pattern2[2093]=2002;
		pattern2[2094]=2001;
		pattern2[2095]=2000;
		pattern2[2096]=1999;
		pattern2[2097]=1998;
		pattern2[2098]=1997;
		pattern2[2099]=1996;
		pattern2[2100]=1995;
		pattern2[2101]=1994;
		pattern2[2102]=1993;
		pattern2[2103]=1992;
		pattern2[2104]=1991;
		pattern2[2105]=1990;
		pattern2[2106]=1989;
		pattern2[2107]=1988;
		pattern2[2108]=1987;
		pattern2[2109]=1986;
		pattern2[2110]=1985;
		pattern2[2111]=1984;
		pattern2[2112]=1983;
		pattern2[2113]=1982;
		pattern2[2114]=1981;
		pattern2[2115]=1980;
		pattern2[2116]=1979;
		pattern2[2117]=1978;
		pattern2[2118]=1977;
		pattern2[2119]=1976;
		pattern2[2120]=1975;
		pattern2[2121]=1974;
		pattern2[2122]=1973;
		pattern2[2123]=1972;
		pattern2[2124]=1971;
		pattern2[2125]=1970;
		pattern2[2126]=1969;
		pattern2[2127]=1968;
		pattern2[2128]=1967;
		pattern2[2129]=1966;
		pattern2[2130]=1965;
		pattern2[2131]=1964;
		pattern2[2132]=1963;
		pattern2[2133]=1962;
		pattern2[2134]=1961;
		pattern2[2135]=1960;
		pattern2[2136]=1959;
		pattern2[2137]=1958;
		pattern2[2138]=1957;
		pattern2[2139]=1956;
		pattern2[2140]=1955;
		pattern2[2141]=1954;
		pattern2[2142]=1953;
		pattern2[2143]=1952;
		pattern2[2144]=1951;
		pattern2[2145]=1950;
		pattern2[2146]=1949;
		pattern2[2147]=1948;
		pattern2[2148]=1947;
		pattern2[2149]=1946;
		pattern2[2150]=1945;
		pattern2[2151]=1944;
		pattern2[2152]=1943;
		pattern2[2153]=1942;
		pattern2[2154]=1941;
		pattern2[2155]=1940;
		pattern2[2156]=1939;
		pattern2[2157]=1938;
		pattern2[2158]=1937;
		pattern2[2159]=1936;
		pattern2[2160]=1935;
		pattern2[2161]=1934;
		pattern2[2162]=1933;
		pattern2[2163]=1932;
		pattern2[2164]=1931;
		pattern2[2165]=1930;
		pattern2[2166]=1929;
		pattern2[2167]=1928;
		pattern2[2168]=1927;
		pattern2[2169]=1926;
		pattern2[2170]=1925;
		pattern2[2171]=1924;
		pattern2[2172]=1923;
		pattern2[2173]=1922;
		pattern2[2174]=1921;
		pattern2[2175]=1920;
		pattern2[2176]=1919;
		pattern2[2177]=1918;
		pattern2[2178]=1917;
		pattern2[2179]=1916;
		pattern2[2180]=1915;
		pattern2[2181]=1914;
		pattern2[2182]=1913;
		pattern2[2183]=1912;
		pattern2[2184]=1911;
		pattern2[2185]=1910;
		pattern2[2186]=1909;
		pattern2[2187]=1908;
		pattern2[2188]=1907;
		pattern2[2189]=1906;
		pattern2[2190]=1905;
		pattern2[2191]=1904;
		pattern2[2192]=1903;
		pattern2[2193]=1902;
		pattern2[2194]=1901;
		pattern2[2195]=1900;
		pattern2[2196]=1899;
		pattern2[2197]=1898;
		pattern2[2198]=1897;
		pattern2[2199]=1896;
		pattern2[2200]=1895;
		pattern2[2201]=1894;
		pattern2[2202]=1893;
		pattern2[2203]=1892;
		pattern2[2204]=1891;
		pattern2[2205]=1890;
		pattern2[2206]=1889;
		pattern2[2207]=1888;
		pattern2[2208]=1887;
		pattern2[2209]=1886;
		pattern2[2210]=1885;
		pattern2[2211]=1884;
		pattern2[2212]=1883;
		pattern2[2213]=1882;
		pattern2[2214]=1881;
		pattern2[2215]=1880;
		pattern2[2216]=1879;
		pattern2[2217]=1878;
		pattern2[2218]=1877;
		pattern2[2219]=1876;
		pattern2[2220]=1875;
		pattern2[2221]=1874;
		pattern2[2222]=1873;
		pattern2[2223]=1872;
		pattern2[2224]=1871;
		pattern2[2225]=1870;
		pattern2[2226]=1869;
		pattern2[2227]=1868;
		pattern2[2228]=1867;
		pattern2[2229]=1866;
		pattern2[2230]=1865;
		pattern2[2231]=1864;
		pattern2[2232]=1863;
		pattern2[2233]=1862;
		pattern2[2234]=1861;
		pattern2[2235]=1860;
		pattern2[2236]=1859;
		pattern2[2237]=1858;
		pattern2[2238]=1857;
		pattern2[2239]=1856;
		pattern2[2240]=1855;
		pattern2[2241]=1854;
		pattern2[2242]=1853;
		pattern2[2243]=1852;
		pattern2[2244]=1851;
		pattern2[2245]=1850;
		pattern2[2246]=1849;
		pattern2[2247]=1848;
		pattern2[2248]=1847;
		pattern2[2249]=1846;
		pattern2[2250]=1845;
		pattern2[2251]=1844;
		pattern2[2252]=1843;
		pattern2[2253]=1842;
		pattern2[2254]=1841;
		pattern2[2255]=1840;
		pattern2[2256]=1839;
		pattern2[2257]=1838;
		pattern2[2258]=1837;
		pattern2[2259]=1836;
		pattern2[2260]=1835;
		pattern2[2261]=1834;
		pattern2[2262]=1833;
		pattern2[2263]=1832;
		pattern2[2264]=1831;
		pattern2[2265]=1830;
		pattern2[2266]=1829;
		pattern2[2267]=1828;
		pattern2[2268]=1827;
		pattern2[2269]=1826;
		pattern2[2270]=1825;
		pattern2[2271]=1824;
		pattern2[2272]=1823;
		pattern2[2273]=1822;
		pattern2[2274]=1821;
		pattern2[2275]=1820;
		pattern2[2276]=1819;
		pattern2[2277]=1818;
		pattern2[2278]=1817;
		pattern2[2279]=1816;
		pattern2[2280]=1815;
		pattern2[2281]=1814;
		pattern2[2282]=1813;
		pattern2[2283]=1812;
		pattern2[2284]=1811;
		pattern2[2285]=1810;
		pattern2[2286]=1809;
		pattern2[2287]=1808;
		pattern2[2288]=1807;
		pattern2[2289]=1806;
		pattern2[2290]=1805;
		pattern2[2291]=1804;
		pattern2[2292]=1803;
		pattern2[2293]=1802;
		pattern2[2294]=1801;
		pattern2[2295]=1800;
		pattern2[2296]=1799;
		pattern2[2297]=1798;
		pattern2[2298]=1797;
		pattern2[2299]=1796;
		pattern2[2300]=1795;
		pattern2[2301]=1794;
		pattern2[2302]=1793;
		pattern2[2303]=1792;
		pattern2[2304]=1791;
		pattern2[2305]=1790;
		pattern2[2306]=1789;
		pattern2[2307]=1788;
		pattern2[2308]=1787;
		pattern2[2309]=1786;
		pattern2[2310]=1785;
		pattern2[2311]=1784;
		pattern2[2312]=1783;
		pattern2[2313]=1782;
		pattern2[2314]=1781;
		pattern2[2315]=1780;
		pattern2[2316]=1779;
		pattern2[2317]=1778;
		pattern2[2318]=1777;
		pattern2[2319]=1776;
		pattern2[2320]=1775;
		pattern2[2321]=1774;
		pattern2[2322]=1773;
		pattern2[2323]=1772;
		pattern2[2324]=1771;
		pattern2[2325]=1770;
		pattern2[2326]=1769;
		pattern2[2327]=1768;
		pattern2[2328]=1767;
		pattern2[2329]=1766;
		pattern2[2330]=1765;
		pattern2[2331]=1764;
		pattern2[2332]=1763;
		pattern2[2333]=1762;
		pattern2[2334]=1761;
		pattern2[2335]=1760;
		pattern2[2336]=1759;
		pattern2[2337]=1758;
		pattern2[2338]=1757;
		pattern2[2339]=1756;
		pattern2[2340]=1755;
		pattern2[2341]=1754;
		pattern2[2342]=1753;
		pattern2[2343]=1752;
		pattern2[2344]=1751;
		pattern2[2345]=1750;
		pattern2[2346]=1749;
		pattern2[2347]=1748;
		pattern2[2348]=1747;
		pattern2[2349]=1746;
		pattern2[2350]=1745;
		pattern2[2351]=1744;
		pattern2[2352]=1743;
		pattern2[2353]=1742;
		pattern2[2354]=1741;
		pattern2[2355]=1740;
		pattern2[2356]=1739;
		pattern2[2357]=1738;
		pattern2[2358]=1737;
		pattern2[2359]=1736;
		pattern2[2360]=1735;
		pattern2[2361]=1734;
		pattern2[2362]=1733;
		pattern2[2363]=1732;
		pattern2[2364]=1731;
		pattern2[2365]=1730;
		pattern2[2366]=1729;
		pattern2[2367]=1728;
		pattern2[2368]=1727;
		pattern2[2369]=1726;
		pattern2[2370]=1725;
		pattern2[2371]=1724;
		pattern2[2372]=1723;
		pattern2[2373]=1722;
		pattern2[2374]=1721;
		pattern2[2375]=1720;
		pattern2[2376]=1719;
		pattern2[2377]=1718;
		pattern2[2378]=1717;
		pattern2[2379]=1716;
		pattern2[2380]=1715;
		pattern2[2381]=1714;
		pattern2[2382]=1713;
		pattern2[2383]=1712;
		pattern2[2384]=1711;
		pattern2[2385]=1710;
		pattern2[2386]=1709;
		pattern2[2387]=1708;
		pattern2[2388]=1707;
		pattern2[2389]=1706;
		pattern2[2390]=1705;
		pattern2[2391]=1704;
		pattern2[2392]=1703;
		pattern2[2393]=1702;
		pattern2[2394]=1701;
		pattern2[2395]=1700;
		pattern2[2396]=1699;
		pattern2[2397]=1698;
		pattern2[2398]=1697;
		pattern2[2399]=1696;
		pattern2[2400]=1695;
		pattern2[2401]=1694;
		pattern2[2402]=1693;
		pattern2[2403]=1692;
		pattern2[2404]=1691;
		pattern2[2405]=1690;
		pattern2[2406]=1689;
		pattern2[2407]=1688;
		pattern2[2408]=1687;
		pattern2[2409]=1686;
		pattern2[2410]=1685;
		pattern2[2411]=1684;
		pattern2[2412]=1683;
		pattern2[2413]=1682;
		pattern2[2414]=1681;
		pattern2[2415]=1680;
		pattern2[2416]=1679;
		pattern2[2417]=1678;
		pattern2[2418]=1677;
		pattern2[2419]=1676;
		pattern2[2420]=1675;
		pattern2[2421]=1674;
		pattern2[2422]=1673;
		pattern2[2423]=1672;
		pattern2[2424]=1671;
		pattern2[2425]=1670;
		pattern2[2426]=1669;
		pattern2[2427]=1668;
		pattern2[2428]=1667;
		pattern2[2429]=1666;
		pattern2[2430]=1665;
		pattern2[2431]=1664;
		pattern2[2432]=1663;
		pattern2[2433]=1662;
		pattern2[2434]=1661;
		pattern2[2435]=1660;
		pattern2[2436]=1659;
		pattern2[2437]=1658;
		pattern2[2438]=1657;
		pattern2[2439]=1656;
		pattern2[2440]=1655;
		pattern2[2441]=1654;
		pattern2[2442]=1653;
		pattern2[2443]=1652;
		pattern2[2444]=1651;
		pattern2[2445]=1650;
		pattern2[2446]=1649;
		pattern2[2447]=1648;
		pattern2[2448]=1647;
		pattern2[2449]=1646;
		pattern2[2450]=1645;
		pattern2[2451]=1644;
		pattern2[2452]=1643;
		pattern2[2453]=1642;
		pattern2[2454]=1641;
		pattern2[2455]=1640;
		pattern2[2456]=1639;
		pattern2[2457]=1638;
		pattern2[2458]=1637;
		pattern2[2459]=1636;
		pattern2[2460]=1635;
		pattern2[2461]=1634;
		pattern2[2462]=1633;
		pattern2[2463]=1632;
		pattern2[2464]=1631;
		pattern2[2465]=1630;
		pattern2[2466]=1629;
		pattern2[2467]=1628;
		pattern2[2468]=1627;
		pattern2[2469]=1626;
		pattern2[2470]=1625;
		pattern2[2471]=1624;
		pattern2[2472]=1623;
		pattern2[2473]=1622;
		pattern2[2474]=1621;
		pattern2[2475]=1620;
		pattern2[2476]=1619;
		pattern2[2477]=1618;
		pattern2[2478]=1617;
		pattern2[2479]=1616;
		pattern2[2480]=1615;
		pattern2[2481]=1614;
		pattern2[2482]=1613;
		pattern2[2483]=1612;
		pattern2[2484]=1611;
		pattern2[2485]=1610;
		pattern2[2486]=1609;
		pattern2[2487]=1608;
		pattern2[2488]=1607;
		pattern2[2489]=1606;
		pattern2[2490]=1605;
		pattern2[2491]=1604;
		pattern2[2492]=1603;
		pattern2[2493]=1602;
		pattern2[2494]=1601;
		pattern2[2495]=1600;
		pattern2[2496]=1599;
		pattern2[2497]=1598;
		pattern2[2498]=1597;
		pattern2[2499]=1596;
		pattern2[2500]=1595;
		pattern2[2501]=1594;
		pattern2[2502]=1593;
		pattern2[2503]=1592;
		pattern2[2504]=1591;
		pattern2[2505]=1590;
		pattern2[2506]=1589;
		pattern2[2507]=1588;
		pattern2[2508]=1587;
		pattern2[2509]=1586;
		pattern2[2510]=1585;
		pattern2[2511]=1584;
		pattern2[2512]=1583;
		pattern2[2513]=1582;
		pattern2[2514]=1581;
		pattern2[2515]=1580;
		pattern2[2516]=1579;
		pattern2[2517]=1578;
		pattern2[2518]=1577;
		pattern2[2519]=1576;
		pattern2[2520]=1575;
		pattern2[2521]=1574;
		pattern2[2522]=1573;
		pattern2[2523]=1572;
		pattern2[2524]=1571;
		pattern2[2525]=1570;
		pattern2[2526]=1569;
		pattern2[2527]=1568;
		pattern2[2528]=1567;
		pattern2[2529]=1566;
		pattern2[2530]=1565;
		pattern2[2531]=1564;
		pattern2[2532]=1563;
		pattern2[2533]=1562;
		pattern2[2534]=1561;
		pattern2[2535]=1560;
		pattern2[2536]=1559;
		pattern2[2537]=1558;
		pattern2[2538]=1557;
		pattern2[2539]=1556;
		pattern2[2540]=1555;
		pattern2[2541]=1554;
		pattern2[2542]=1553;
		pattern2[2543]=1552;
		pattern2[2544]=1551;
		pattern2[2545]=1550;
		pattern2[2546]=1549;
		pattern2[2547]=1548;
		pattern2[2548]=1547;
		pattern2[2549]=1546;
		pattern2[2550]=1545;
		pattern2[2551]=1544;
		pattern2[2552]=1543;
		pattern2[2553]=1542;
		pattern2[2554]=1541;
		pattern2[2555]=1540;
		pattern2[2556]=1539;
		pattern2[2557]=1538;
		pattern2[2558]=1537;
		pattern2[2559]=1536;
		pattern2[2560]=1535;
		pattern2[2561]=1534;
		pattern2[2562]=1533;
		pattern2[2563]=1532;
		pattern2[2564]=1531;
		pattern2[2565]=1530;
		pattern2[2566]=1529;
		pattern2[2567]=1528;
		pattern2[2568]=1527;
		pattern2[2569]=1526;
		pattern2[2570]=1525;
		pattern2[2571]=1524;
		pattern2[2572]=1523;
		pattern2[2573]=1522;
		pattern2[2574]=1521;
		pattern2[2575]=1520;
		pattern2[2576]=1519;
		pattern2[2577]=1518;
		pattern2[2578]=1517;
		pattern2[2579]=1516;
		pattern2[2580]=1515;
		pattern2[2581]=1514;
		pattern2[2582]=1513;
		pattern2[2583]=1512;
		pattern2[2584]=1511;
		pattern2[2585]=1510;
		pattern2[2586]=1509;
		pattern2[2587]=1508;
		pattern2[2588]=1507;
		pattern2[2589]=1506;
		pattern2[2590]=1505;
		pattern2[2591]=1504;
		pattern2[2592]=1503;
		pattern2[2593]=1502;
		pattern2[2594]=1501;
		pattern2[2595]=1500;
		pattern2[2596]=1499;
		pattern2[2597]=1498;
		pattern2[2598]=1497;
		pattern2[2599]=1496;
		pattern2[2600]=1495;
		pattern2[2601]=1494;
		pattern2[2602]=1493;
		pattern2[2603]=1492;
		pattern2[2604]=1491;
		pattern2[2605]=1490;
		pattern2[2606]=1489;
		pattern2[2607]=1488;
		pattern2[2608]=1487;
		pattern2[2609]=1486;
		pattern2[2610]=1485;
		pattern2[2611]=1484;
		pattern2[2612]=1483;
		pattern2[2613]=1482;
		pattern2[2614]=1481;
		pattern2[2615]=1480;
		pattern2[2616]=1479;
		pattern2[2617]=1478;
		pattern2[2618]=1477;
		pattern2[2619]=1476;
		pattern2[2620]=1475;
		pattern2[2621]=1474;
		pattern2[2622]=1473;
		pattern2[2623]=1472;
		pattern2[2624]=1471;
		pattern2[2625]=1470;
		pattern2[2626]=1469;
		pattern2[2627]=1468;
		pattern2[2628]=1467;
		pattern2[2629]=1466;
		pattern2[2630]=1465;
		pattern2[2631]=1464;
		pattern2[2632]=1463;
		pattern2[2633]=1462;
		pattern2[2634]=1461;
		pattern2[2635]=1460;
		pattern2[2636]=1459;
		pattern2[2637]=1458;
		pattern2[2638]=1457;
		pattern2[2639]=1456;
		pattern2[2640]=1455;
		pattern2[2641]=1454;
		pattern2[2642]=1453;
		pattern2[2643]=1452;
		pattern2[2644]=1451;
		pattern2[2645]=1450;
		pattern2[2646]=1449;
		pattern2[2647]=1448;
		pattern2[2648]=1447;
		pattern2[2649]=1446;
		pattern2[2650]=1445;
		pattern2[2651]=1444;
		pattern2[2652]=1443;
		pattern2[2653]=1442;
		pattern2[2654]=1441;
		pattern2[2655]=1440;
		pattern2[2656]=1439;
		pattern2[2657]=1438;
		pattern2[2658]=1437;
		pattern2[2659]=1436;
		pattern2[2660]=1435;
		pattern2[2661]=1434;
		pattern2[2662]=1433;
		pattern2[2663]=1432;
		pattern2[2664]=1431;
		pattern2[2665]=1430;
		pattern2[2666]=1429;
		pattern2[2667]=1428;
		pattern2[2668]=1427;
		pattern2[2669]=1426;
		pattern2[2670]=1425;
		pattern2[2671]=1424;
		pattern2[2672]=1423;
		pattern2[2673]=1422;
		pattern2[2674]=1421;
		pattern2[2675]=1420;
		pattern2[2676]=1419;
		pattern2[2677]=1418;
		pattern2[2678]=1417;
		pattern2[2679]=1416;
		pattern2[2680]=1415;
		pattern2[2681]=1414;
		pattern2[2682]=1413;
		pattern2[2683]=1412;
		pattern2[2684]=1411;
		pattern2[2685]=1410;
		pattern2[2686]=1409;
		pattern2[2687]=1408;
		pattern2[2688]=1407;
		pattern2[2689]=1406;
		pattern2[2690]=1405;
		pattern2[2691]=1404;
		pattern2[2692]=1403;
		pattern2[2693]=1402;
		pattern2[2694]=1401;
		pattern2[2695]=1400;
		pattern2[2696]=1399;
		pattern2[2697]=1398;
		pattern2[2698]=1397;
		pattern2[2699]=1396;
		pattern2[2700]=1395;
		pattern2[2701]=1394;
		pattern2[2702]=1393;
		pattern2[2703]=1392;
		pattern2[2704]=1391;
		pattern2[2705]=1390;
		pattern2[2706]=1389;
		pattern2[2707]=1388;
		pattern2[2708]=1387;
		pattern2[2709]=1386;
		pattern2[2710]=1385;
		pattern2[2711]=1384;
		pattern2[2712]=1383;
		pattern2[2713]=1382;
		pattern2[2714]=1381;
		pattern2[2715]=1380;
		pattern2[2716]=1379;
		pattern2[2717]=1378;
		pattern2[2718]=1377;
		pattern2[2719]=1376;
		pattern2[2720]=1375;
		pattern2[2721]=1374;
		pattern2[2722]=1373;
		pattern2[2723]=1372;
		pattern2[2724]=1371;
		pattern2[2725]=1370;
		pattern2[2726]=1369;
		pattern2[2727]=1368;
		pattern2[2728]=1367;
		pattern2[2729]=1366;
		pattern2[2730]=1365;
		pattern2[2731]=1364;
		pattern2[2732]=1363;
		pattern2[2733]=1362;
		pattern2[2734]=1361;
		pattern2[2735]=1360;
		pattern2[2736]=1359;
		pattern2[2737]=1358;
		pattern2[2738]=1357;
		pattern2[2739]=1356;
		pattern2[2740]=1355;
		pattern2[2741]=1354;
		pattern2[2742]=1353;
		pattern2[2743]=1352;
		pattern2[2744]=1351;
		pattern2[2745]=1350;
		pattern2[2746]=1349;
		pattern2[2747]=1348;
		pattern2[2748]=1347;
		pattern2[2749]=1346;
		pattern2[2750]=1345;
		pattern2[2751]=1344;
		pattern2[2752]=1343;
		pattern2[2753]=1342;
		pattern2[2754]=1341;
		pattern2[2755]=1340;
		pattern2[2756]=1339;
		pattern2[2757]=1338;
		pattern2[2758]=1337;
		pattern2[2759]=1336;
		pattern2[2760]=1335;
		pattern2[2761]=1334;
		pattern2[2762]=1333;
		pattern2[2763]=1332;
		pattern2[2764]=1331;
		pattern2[2765]=1330;
		pattern2[2766]=1329;
		pattern2[2767]=1328;
		pattern2[2768]=1327;
		pattern2[2769]=1326;
		pattern2[2770]=1325;
		pattern2[2771]=1324;
		pattern2[2772]=1323;
		pattern2[2773]=1322;
		pattern2[2774]=1321;
		pattern2[2775]=1320;
		pattern2[2776]=1319;
		pattern2[2777]=1318;
		pattern2[2778]=1317;
		pattern2[2779]=1316;
		pattern2[2780]=1315;
		pattern2[2781]=1314;
		pattern2[2782]=1313;
		pattern2[2783]=1312;
		pattern2[2784]=1311;
		pattern2[2785]=1310;
		pattern2[2786]=1309;
		pattern2[2787]=1308;
		pattern2[2788]=1307;
		pattern2[2789]=1306;
		pattern2[2790]=1305;
		pattern2[2791]=1304;
		pattern2[2792]=1303;
		pattern2[2793]=1302;
		pattern2[2794]=1301;
		pattern2[2795]=1300;
		pattern2[2796]=1299;
		pattern2[2797]=1298;
		pattern2[2798]=1297;
		pattern2[2799]=1296;
		pattern2[2800]=1295;
		pattern2[2801]=1294;
		pattern2[2802]=1293;
		pattern2[2803]=1292;
		pattern2[2804]=1291;
		pattern2[2805]=1290;
		pattern2[2806]=1289;
		pattern2[2807]=1288;
		pattern2[2808]=1287;
		pattern2[2809]=1286;
		pattern2[2810]=1285;
		pattern2[2811]=1284;
		pattern2[2812]=1283;
		pattern2[2813]=1282;
		pattern2[2814]=1281;
		pattern2[2815]=1280;
		pattern2[2816]=1279;
		pattern2[2817]=1278;
		pattern2[2818]=1277;
		pattern2[2819]=1276;
		pattern2[2820]=1275;
		pattern2[2821]=1274;
		pattern2[2822]=1273;
		pattern2[2823]=1272;
		pattern2[2824]=1271;
		pattern2[2825]=1270;
		pattern2[2826]=1269;
		pattern2[2827]=1268;
		pattern2[2828]=1267;
		pattern2[2829]=1266;
		pattern2[2830]=1265;
		pattern2[2831]=1264;
		pattern2[2832]=1263;
		pattern2[2833]=1262;
		pattern2[2834]=1261;
		pattern2[2835]=1260;
		pattern2[2836]=1259;
		pattern2[2837]=1258;
		pattern2[2838]=1257;
		pattern2[2839]=1256;
		pattern2[2840]=1255;
		pattern2[2841]=1254;
		pattern2[2842]=1253;
		pattern2[2843]=1252;
		pattern2[2844]=1251;
		pattern2[2845]=1250;
		pattern2[2846]=1249;
		pattern2[2847]=1248;
		pattern2[2848]=1247;
		pattern2[2849]=1246;
		pattern2[2850]=1245;
		pattern2[2851]=1244;
		pattern2[2852]=1243;
		pattern2[2853]=1242;
		pattern2[2854]=1241;
		pattern2[2855]=1240;
		pattern2[2856]=1239;
		pattern2[2857]=1238;
		pattern2[2858]=1237;
		pattern2[2859]=1236;
		pattern2[2860]=1235;
		pattern2[2861]=1234;
		pattern2[2862]=1233;
		pattern2[2863]=1232;
		pattern2[2864]=1231;
		pattern2[2865]=1230;
		pattern2[2866]=1229;
		pattern2[2867]=1228;
		pattern2[2868]=1227;
		pattern2[2869]=1226;
		pattern2[2870]=1225;
		pattern2[2871]=1224;
		pattern2[2872]=1223;
		pattern2[2873]=1222;
		pattern2[2874]=1221;
		pattern2[2875]=1220;
		pattern2[2876]=1219;
		pattern2[2877]=1218;
		pattern2[2878]=1217;
		pattern2[2879]=1216;
		pattern2[2880]=1215;
		pattern2[2881]=1214;
		pattern2[2882]=1213;
		pattern2[2883]=1212;
		pattern2[2884]=1211;
		pattern2[2885]=1210;
		pattern2[2886]=1209;
		pattern2[2887]=1208;
		pattern2[2888]=1207;
		pattern2[2889]=1206;
		pattern2[2890]=1205;
		pattern2[2891]=1204;
		pattern2[2892]=1203;
		pattern2[2893]=1202;
		pattern2[2894]=1201;
		pattern2[2895]=1200;
		pattern2[2896]=1199;
		pattern2[2897]=1198;
		pattern2[2898]=1197;
		pattern2[2899]=1196;
		pattern2[2900]=1195;
		pattern2[2901]=1194;
		pattern2[2902]=1193;
		pattern2[2903]=1192;
		pattern2[2904]=1191;
		pattern2[2905]=1190;
		pattern2[2906]=1189;
		pattern2[2907]=1188;
		pattern2[2908]=1187;
		pattern2[2909]=1186;
		pattern2[2910]=1185;
		pattern2[2911]=1184;
		pattern2[2912]=1183;
		pattern2[2913]=1182;
		pattern2[2914]=1181;
		pattern2[2915]=1180;
		pattern2[2916]=1179;
		pattern2[2917]=1178;
		pattern2[2918]=1177;
		pattern2[2919]=1176;
		pattern2[2920]=1175;
		pattern2[2921]=1174;
		pattern2[2922]=1173;
		pattern2[2923]=1172;
		pattern2[2924]=1171;
		pattern2[2925]=1170;
		pattern2[2926]=1169;
		pattern2[2927]=1168;
		pattern2[2928]=1167;
		pattern2[2929]=1166;
		pattern2[2930]=1165;
		pattern2[2931]=1164;
		pattern2[2932]=1163;
		pattern2[2933]=1162;
		pattern2[2934]=1161;
		pattern2[2935]=1160;
		pattern2[2936]=1159;
		pattern2[2937]=1158;
		pattern2[2938]=1157;
		pattern2[2939]=1156;
		pattern2[2940]=1155;
		pattern2[2941]=1154;
		pattern2[2942]=1153;
		pattern2[2943]=1152;
		pattern2[2944]=1151;
		pattern2[2945]=1150;
		pattern2[2946]=1149;
		pattern2[2947]=1148;
		pattern2[2948]=1147;
		pattern2[2949]=1146;
		pattern2[2950]=1145;
		pattern2[2951]=1144;
		pattern2[2952]=1143;
		pattern2[2953]=1142;
		pattern2[2954]=1141;
		pattern2[2955]=1140;
		pattern2[2956]=1139;
		pattern2[2957]=1138;
		pattern2[2958]=1137;
		pattern2[2959]=1136;
		pattern2[2960]=1135;
		pattern2[2961]=1134;
		pattern2[2962]=1133;
		pattern2[2963]=1132;
		pattern2[2964]=1131;
		pattern2[2965]=1130;
		pattern2[2966]=1129;
		pattern2[2967]=1128;
		pattern2[2968]=1127;
		pattern2[2969]=1126;
		pattern2[2970]=1125;
		pattern2[2971]=1124;
		pattern2[2972]=1123;
		pattern2[2973]=1122;
		pattern2[2974]=1121;
		pattern2[2975]=1120;
		pattern2[2976]=1119;
		pattern2[2977]=1118;
		pattern2[2978]=1117;
		pattern2[2979]=1116;
		pattern2[2980]=1115;
		pattern2[2981]=1114;
		pattern2[2982]=1113;
		pattern2[2983]=1112;
		pattern2[2984]=1111;
		pattern2[2985]=1110;
		pattern2[2986]=1109;
		pattern2[2987]=1108;
		pattern2[2988]=1107;
		pattern2[2989]=1106;
		pattern2[2990]=1105;
		pattern2[2991]=1104;
		pattern2[2992]=1103;
		pattern2[2993]=1102;
		pattern2[2994]=1101;
		pattern2[2995]=1100;
		pattern2[2996]=1099;
		pattern2[2997]=1098;
		pattern2[2998]=1097;
		pattern2[2999]=1096;
		pattern2[3000]=1095;
		pattern2[3001]=1094;
		pattern2[3002]=1093;
		pattern2[3003]=1092;
		pattern2[3004]=1091;
		pattern2[3005]=1090;
		pattern2[3006]=1089;
		pattern2[3007]=1088;
		pattern2[3008]=1087;
		pattern2[3009]=1086;
		pattern2[3010]=1085;
		pattern2[3011]=1084;
		pattern2[3012]=1083;
		pattern2[3013]=1082;
		pattern2[3014]=1081;
		pattern2[3015]=1080;
		pattern2[3016]=1079;
		pattern2[3017]=1078;
		pattern2[3018]=1077;
		pattern2[3019]=1076;
		pattern2[3020]=1075;
		pattern2[3021]=1074;
		pattern2[3022]=1073;
		pattern2[3023]=1072;
		pattern2[3024]=1071;
		pattern2[3025]=1070;
		pattern2[3026]=1069;
		pattern2[3027]=1068;
		pattern2[3028]=1067;
		pattern2[3029]=1066;
		pattern2[3030]=1065;
		pattern2[3031]=1064;
		pattern2[3032]=1063;
		pattern2[3033]=1062;
		pattern2[3034]=1061;
		pattern2[3035]=1060;
		pattern2[3036]=1059;
		pattern2[3037]=1058;
		pattern2[3038]=1057;
		pattern2[3039]=1056;
		pattern2[3040]=1055;
		pattern2[3041]=1054;
		pattern2[3042]=1053;
		pattern2[3043]=1052;
		pattern2[3044]=1051;
		pattern2[3045]=1050;
		pattern2[3046]=1049;
		pattern2[3047]=1048;
		pattern2[3048]=1047;
		pattern2[3049]=1046;
		pattern2[3050]=1045;
		pattern2[3051]=1044;
		pattern2[3052]=1043;
		pattern2[3053]=1042;
		pattern2[3054]=1041;
		pattern2[3055]=1040;
		pattern2[3056]=1039;
		pattern2[3057]=1038;
		pattern2[3058]=1037;
		pattern2[3059]=1036;
		pattern2[3060]=1035;
		pattern2[3061]=1034;
		pattern2[3062]=1033;
		pattern2[3063]=1032;
		pattern2[3064]=1031;
		pattern2[3065]=1030;
		pattern2[3066]=1029;
		pattern2[3067]=1028;
		pattern2[3068]=1027;
		pattern2[3069]=1026;
		pattern2[3070]=1025;
		pattern2[3071]=1024;
		pattern2[3072]=1023;
		pattern2[3073]=1022;
		pattern2[3074]=1021;
		pattern2[3075]=1020;
		pattern2[3076]=1019;
		pattern2[3077]=1018;
		pattern2[3078]=1017;
		pattern2[3079]=1016;
		pattern2[3080]=1015;
		pattern2[3081]=1014;
		pattern2[3082]=1013;
		pattern2[3083]=1012;
		pattern2[3084]=1011;
		pattern2[3085]=1010;
		pattern2[3086]=1009;
		pattern2[3087]=1008;
		pattern2[3088]=1007;
		pattern2[3089]=1006;
		pattern2[3090]=1005;
		pattern2[3091]=1004;
		pattern2[3092]=1003;
		pattern2[3093]=1002;
		pattern2[3094]=1001;
		pattern2[3095]=1000;
		pattern2[3096]=999;
		pattern2[3097]=998;
		pattern2[3098]=997;
		pattern2[3099]=996;
		pattern2[3100]=995;
		pattern2[3101]=994;
		pattern2[3102]=993;
		pattern2[3103]=992;
		pattern2[3104]=991;
		pattern2[3105]=990;
		pattern2[3106]=989;
		pattern2[3107]=988;
		pattern2[3108]=987;
		pattern2[3109]=986;
		pattern2[3110]=985;
		pattern2[3111]=984;
		pattern2[3112]=983;
		pattern2[3113]=982;
		pattern2[3114]=981;
		pattern2[3115]=980;
		pattern2[3116]=979;
		pattern2[3117]=978;
		pattern2[3118]=977;
		pattern2[3119]=976;
		pattern2[3120]=975;
		pattern2[3121]=974;
		pattern2[3122]=973;
		pattern2[3123]=972;
		pattern2[3124]=971;
		pattern2[3125]=970;
		pattern2[3126]=969;
		pattern2[3127]=968;
		pattern2[3128]=967;
		pattern2[3129]=966;
		pattern2[3130]=965;
		pattern2[3131]=964;
		pattern2[3132]=963;
		pattern2[3133]=962;
		pattern2[3134]=961;
		pattern2[3135]=960;
		pattern2[3136]=959;
		pattern2[3137]=958;
		pattern2[3138]=957;
		pattern2[3139]=956;
		pattern2[3140]=955;
		pattern2[3141]=954;
		pattern2[3142]=953;
		pattern2[3143]=952;
		pattern2[3144]=951;
		pattern2[3145]=950;
		pattern2[3146]=949;
		pattern2[3147]=948;
		pattern2[3148]=947;
		pattern2[3149]=946;
		pattern2[3150]=945;
		pattern2[3151]=944;
		pattern2[3152]=943;
		pattern2[3153]=942;
		pattern2[3154]=941;
		pattern2[3155]=940;
		pattern2[3156]=939;
		pattern2[3157]=938;
		pattern2[3158]=937;
		pattern2[3159]=936;
		pattern2[3160]=935;
		pattern2[3161]=934;
		pattern2[3162]=933;
		pattern2[3163]=932;
		pattern2[3164]=931;
		pattern2[3165]=930;
		pattern2[3166]=929;
		pattern2[3167]=928;
		pattern2[3168]=927;
		pattern2[3169]=926;
		pattern2[3170]=925;
		pattern2[3171]=924;
		pattern2[3172]=923;
		pattern2[3173]=922;
		pattern2[3174]=921;
		pattern2[3175]=920;
		pattern2[3176]=919;
		pattern2[3177]=918;
		pattern2[3178]=917;
		pattern2[3179]=916;
		pattern2[3180]=915;
		pattern2[3181]=914;
		pattern2[3182]=913;
		pattern2[3183]=912;
		pattern2[3184]=911;
		pattern2[3185]=910;
		pattern2[3186]=909;
		pattern2[3187]=908;
		pattern2[3188]=907;
		pattern2[3189]=906;
		pattern2[3190]=905;
		pattern2[3191]=904;
		pattern2[3192]=903;
		pattern2[3193]=902;
		pattern2[3194]=901;
		pattern2[3195]=900;
		pattern2[3196]=899;
		pattern2[3197]=898;
		pattern2[3198]=897;
		pattern2[3199]=896;
		pattern2[3200]=895;
		pattern2[3201]=894;
		pattern2[3202]=893;
		pattern2[3203]=892;
		pattern2[3204]=891;
		pattern2[3205]=890;
		pattern2[3206]=889;
		pattern2[3207]=888;
		pattern2[3208]=887;
		pattern2[3209]=886;
		pattern2[3210]=885;
		pattern2[3211]=884;
		pattern2[3212]=883;
		pattern2[3213]=882;
		pattern2[3214]=881;
		pattern2[3215]=880;
		pattern2[3216]=879;
		pattern2[3217]=878;
		pattern2[3218]=877;
		pattern2[3219]=876;
		pattern2[3220]=875;
		pattern2[3221]=874;
		pattern2[3222]=873;
		pattern2[3223]=872;
		pattern2[3224]=871;
		pattern2[3225]=870;
		pattern2[3226]=869;
		pattern2[3227]=868;
		pattern2[3228]=867;
		pattern2[3229]=866;
		pattern2[3230]=865;
		pattern2[3231]=864;
		pattern2[3232]=863;
		pattern2[3233]=862;
		pattern2[3234]=861;
		pattern2[3235]=860;
		pattern2[3236]=859;
		pattern2[3237]=858;
		pattern2[3238]=857;
		pattern2[3239]=856;
		pattern2[3240]=855;
		pattern2[3241]=854;
		pattern2[3242]=853;
		pattern2[3243]=852;
		pattern2[3244]=851;
		pattern2[3245]=850;
		pattern2[3246]=849;
		pattern2[3247]=848;
		pattern2[3248]=847;
		pattern2[3249]=846;
		pattern2[3250]=845;
		pattern2[3251]=844;
		pattern2[3252]=843;
		pattern2[3253]=842;
		pattern2[3254]=841;
		pattern2[3255]=840;
		pattern2[3256]=839;
		pattern2[3257]=838;
		pattern2[3258]=837;
		pattern2[3259]=836;
		pattern2[3260]=835;
		pattern2[3261]=834;
		pattern2[3262]=833;
		pattern2[3263]=832;
		pattern2[3264]=831;
		pattern2[3265]=830;
		pattern2[3266]=829;
		pattern2[3267]=828;
		pattern2[3268]=827;
		pattern2[3269]=826;
		pattern2[3270]=825;
		pattern2[3271]=824;
		pattern2[3272]=823;
		pattern2[3273]=822;
		pattern2[3274]=821;
		pattern2[3275]=820;
		pattern2[3276]=819;
		pattern2[3277]=818;
		pattern2[3278]=817;
		pattern2[3279]=816;
		pattern2[3280]=815;
		pattern2[3281]=814;
		pattern2[3282]=813;
		pattern2[3283]=812;
		pattern2[3284]=811;
		pattern2[3285]=810;
		pattern2[3286]=809;
		pattern2[3287]=808;
		pattern2[3288]=807;
		pattern2[3289]=806;
		pattern2[3290]=805;
		pattern2[3291]=804;
		pattern2[3292]=803;
		pattern2[3293]=802;
		pattern2[3294]=801;
		pattern2[3295]=800;
		pattern2[3296]=799;
		pattern2[3297]=798;
		pattern2[3298]=797;
		pattern2[3299]=796;
		pattern2[3300]=795;
		pattern2[3301]=794;
		pattern2[3302]=793;
		pattern2[3303]=792;
		pattern2[3304]=791;
		pattern2[3305]=790;
		pattern2[3306]=789;
		pattern2[3307]=788;
		pattern2[3308]=787;
		pattern2[3309]=786;
		pattern2[3310]=785;
		pattern2[3311]=784;
		pattern2[3312]=783;
		pattern2[3313]=782;
		pattern2[3314]=781;
		pattern2[3315]=780;
		pattern2[3316]=779;
		pattern2[3317]=778;
		pattern2[3318]=777;
		pattern2[3319]=776;
		pattern2[3320]=775;
		pattern2[3321]=774;
		pattern2[3322]=773;
		pattern2[3323]=772;
		pattern2[3324]=771;
		pattern2[3325]=770;
		pattern2[3326]=769;
		pattern2[3327]=768;
		pattern2[3328]=767;
		pattern2[3329]=766;
		pattern2[3330]=765;
		pattern2[3331]=764;
		pattern2[3332]=763;
		pattern2[3333]=762;
		pattern2[3334]=761;
		pattern2[3335]=760;
		pattern2[3336]=759;
		pattern2[3337]=758;
		pattern2[3338]=757;
		pattern2[3339]=756;
		pattern2[3340]=755;
		pattern2[3341]=754;
		pattern2[3342]=753;
		pattern2[3343]=752;
		pattern2[3344]=751;
		pattern2[3345]=750;
		pattern2[3346]=749;
		pattern2[3347]=748;
		pattern2[3348]=747;
		pattern2[3349]=746;
		pattern2[3350]=745;
		pattern2[3351]=744;
		pattern2[3352]=743;
		pattern2[3353]=742;
		pattern2[3354]=741;
		pattern2[3355]=740;
		pattern2[3356]=739;
		pattern2[3357]=738;
		pattern2[3358]=737;
		pattern2[3359]=736;
		pattern2[3360]=735;
		pattern2[3361]=734;
		pattern2[3362]=733;
		pattern2[3363]=732;
		pattern2[3364]=731;
		pattern2[3365]=730;
		pattern2[3366]=729;
		pattern2[3367]=728;
		pattern2[3368]=727;
		pattern2[3369]=726;
		pattern2[3370]=725;
		pattern2[3371]=724;
		pattern2[3372]=723;
		pattern2[3373]=722;
		pattern2[3374]=721;
		pattern2[3375]=720;
		pattern2[3376]=719;
		pattern2[3377]=718;
		pattern2[3378]=717;
		pattern2[3379]=716;
		pattern2[3380]=715;
		pattern2[3381]=714;
		pattern2[3382]=713;
		pattern2[3383]=712;
		pattern2[3384]=711;
		pattern2[3385]=710;
		pattern2[3386]=709;
		pattern2[3387]=708;
		pattern2[3388]=707;
		pattern2[3389]=706;
		pattern2[3390]=705;
		pattern2[3391]=704;
		pattern2[3392]=703;
		pattern2[3393]=702;
		pattern2[3394]=701;
		pattern2[3395]=700;
		pattern2[3396]=699;
		pattern2[3397]=698;
		pattern2[3398]=697;
		pattern2[3399]=696;
		pattern2[3400]=695;
		pattern2[3401]=694;
		pattern2[3402]=693;
		pattern2[3403]=692;
		pattern2[3404]=691;
		pattern2[3405]=690;
		pattern2[3406]=689;
		pattern2[3407]=688;
		pattern2[3408]=687;
		pattern2[3409]=686;
		pattern2[3410]=685;
		pattern2[3411]=684;
		pattern2[3412]=683;
		pattern2[3413]=682;
		pattern2[3414]=681;
		pattern2[3415]=680;
		pattern2[3416]=679;
		pattern2[3417]=678;
		pattern2[3418]=677;
		pattern2[3419]=676;
		pattern2[3420]=675;
		pattern2[3421]=674;
		pattern2[3422]=673;
		pattern2[3423]=672;
		pattern2[3424]=671;
		pattern2[3425]=670;
		pattern2[3426]=669;
		pattern2[3427]=668;
		pattern2[3428]=667;
		pattern2[3429]=666;
		pattern2[3430]=665;
		pattern2[3431]=664;
		pattern2[3432]=663;
		pattern2[3433]=662;
		pattern2[3434]=661;
		pattern2[3435]=660;
		pattern2[3436]=659;
		pattern2[3437]=658;
		pattern2[3438]=657;
		pattern2[3439]=656;
		pattern2[3440]=655;
		pattern2[3441]=654;
		pattern2[3442]=653;
		pattern2[3443]=652;
		pattern2[3444]=651;
		pattern2[3445]=650;
		pattern2[3446]=649;
		pattern2[3447]=648;
		pattern2[3448]=647;
		pattern2[3449]=646;
		pattern2[3450]=645;
		pattern2[3451]=644;
		pattern2[3452]=643;
		pattern2[3453]=642;
		pattern2[3454]=641;
		pattern2[3455]=640;
		pattern2[3456]=639;
		pattern2[3457]=638;
		pattern2[3458]=637;
		pattern2[3459]=636;
		pattern2[3460]=635;
		pattern2[3461]=634;
		pattern2[3462]=633;
		pattern2[3463]=632;
		pattern2[3464]=631;
		pattern2[3465]=630;
		pattern2[3466]=629;
		pattern2[3467]=628;
		pattern2[3468]=627;
		pattern2[3469]=626;
		pattern2[3470]=625;
		pattern2[3471]=624;
		pattern2[3472]=623;
		pattern2[3473]=622;
		pattern2[3474]=621;
		pattern2[3475]=620;
		pattern2[3476]=619;
		pattern2[3477]=618;
		pattern2[3478]=617;
		pattern2[3479]=616;
		pattern2[3480]=615;
		pattern2[3481]=614;
		pattern2[3482]=613;
		pattern2[3483]=612;
		pattern2[3484]=611;
		pattern2[3485]=610;
		pattern2[3486]=609;
		pattern2[3487]=608;
		pattern2[3488]=607;
		pattern2[3489]=606;
		pattern2[3490]=605;
		pattern2[3491]=604;
		pattern2[3492]=603;
		pattern2[3493]=602;
		pattern2[3494]=601;
		pattern2[3495]=600;
		pattern2[3496]=599;
		pattern2[3497]=598;
		pattern2[3498]=597;
		pattern2[3499]=596;
		pattern2[3500]=595;
		pattern2[3501]=594;
		pattern2[3502]=593;
		pattern2[3503]=592;
		pattern2[3504]=591;
		pattern2[3505]=590;
		pattern2[3506]=589;
		pattern2[3507]=588;
		pattern2[3508]=587;
		pattern2[3509]=586;
		pattern2[3510]=585;
		pattern2[3511]=584;
		pattern2[3512]=583;
		pattern2[3513]=582;
		pattern2[3514]=581;
		pattern2[3515]=580;
		pattern2[3516]=579;
		pattern2[3517]=578;
		pattern2[3518]=577;
		pattern2[3519]=576;
		pattern2[3520]=575;
		pattern2[3521]=574;
		pattern2[3522]=573;
		pattern2[3523]=572;
		pattern2[3524]=571;
		pattern2[3525]=570;
		pattern2[3526]=569;
		pattern2[3527]=568;
		pattern2[3528]=567;
		pattern2[3529]=566;
		pattern2[3530]=565;
		pattern2[3531]=564;
		pattern2[3532]=563;
		pattern2[3533]=562;
		pattern2[3534]=561;
		pattern2[3535]=560;
		pattern2[3536]=559;
		pattern2[3537]=558;
		pattern2[3538]=557;
		pattern2[3539]=556;
		pattern2[3540]=555;
		pattern2[3541]=554;
		pattern2[3542]=553;
		pattern2[3543]=552;
		pattern2[3544]=551;
		pattern2[3545]=550;
		pattern2[3546]=549;
		pattern2[3547]=548;
		pattern2[3548]=547;
		pattern2[3549]=546;
		pattern2[3550]=545;
		pattern2[3551]=544;
		pattern2[3552]=543;
		pattern2[3553]=542;
		pattern2[3554]=541;
		pattern2[3555]=540;
		pattern2[3556]=539;
		pattern2[3557]=538;
		pattern2[3558]=537;
		pattern2[3559]=536;
		pattern2[3560]=535;
		pattern2[3561]=534;
		pattern2[3562]=533;
		pattern2[3563]=532;
		pattern2[3564]=531;
		pattern2[3565]=530;
		pattern2[3566]=529;
		pattern2[3567]=528;
		pattern2[3568]=527;
		pattern2[3569]=526;
		pattern2[3570]=525;
		pattern2[3571]=524;
		pattern2[3572]=523;
		pattern2[3573]=522;
		pattern2[3574]=521;
		pattern2[3575]=520;
		pattern2[3576]=519;
		pattern2[3577]=518;
		pattern2[3578]=517;
		pattern2[3579]=516;
		pattern2[3580]=515;
		pattern2[3581]=514;
		pattern2[3582]=513;
		pattern2[3583]=512;
		pattern2[3584]=511;
		pattern2[3585]=510;
		pattern2[3586]=509;
		pattern2[3587]=508;
		pattern2[3588]=507;
		pattern2[3589]=506;
		pattern2[3590]=505;
		pattern2[3591]=504;
		pattern2[3592]=503;
		pattern2[3593]=502;
		pattern2[3594]=501;
		pattern2[3595]=500;
		pattern2[3596]=499;
		pattern2[3597]=498;
		pattern2[3598]=497;
		pattern2[3599]=496;
		pattern2[3600]=495;
		pattern2[3601]=494;
		pattern2[3602]=493;
		pattern2[3603]=492;
		pattern2[3604]=491;
		pattern2[3605]=490;
		pattern2[3606]=489;
		pattern2[3607]=488;
		pattern2[3608]=487;
		pattern2[3609]=486;
		pattern2[3610]=485;
		pattern2[3611]=484;
		pattern2[3612]=483;
		pattern2[3613]=482;
		pattern2[3614]=481;
		pattern2[3615]=480;
		pattern2[3616]=479;
		pattern2[3617]=478;
		pattern2[3618]=477;
		pattern2[3619]=476;
		pattern2[3620]=475;
		pattern2[3621]=474;
		pattern2[3622]=473;
		pattern2[3623]=472;
		pattern2[3624]=471;
		pattern2[3625]=470;
		pattern2[3626]=469;
		pattern2[3627]=468;
		pattern2[3628]=467;
		pattern2[3629]=466;
		pattern2[3630]=465;
		pattern2[3631]=464;
		pattern2[3632]=463;
		pattern2[3633]=462;
		pattern2[3634]=461;
		pattern2[3635]=460;
		pattern2[3636]=459;
		pattern2[3637]=458;
		pattern2[3638]=457;
		pattern2[3639]=456;
		pattern2[3640]=455;
		pattern2[3641]=454;
		pattern2[3642]=453;
		pattern2[3643]=452;
		pattern2[3644]=451;
		pattern2[3645]=450;
		pattern2[3646]=449;
		pattern2[3647]=448;
		pattern2[3648]=447;
		pattern2[3649]=446;
		pattern2[3650]=445;
		pattern2[3651]=444;
		pattern2[3652]=443;
		pattern2[3653]=442;
		pattern2[3654]=441;
		pattern2[3655]=440;
		pattern2[3656]=439;
		pattern2[3657]=438;
		pattern2[3658]=437;
		pattern2[3659]=436;
		pattern2[3660]=435;
		pattern2[3661]=434;
		pattern2[3662]=433;
		pattern2[3663]=432;
		pattern2[3664]=431;
		pattern2[3665]=430;
		pattern2[3666]=429;
		pattern2[3667]=428;
		pattern2[3668]=427;
		pattern2[3669]=426;
		pattern2[3670]=425;
		pattern2[3671]=424;
		pattern2[3672]=423;
		pattern2[3673]=422;
		pattern2[3674]=421;
		pattern2[3675]=420;
		pattern2[3676]=419;
		pattern2[3677]=418;
		pattern2[3678]=417;
		pattern2[3679]=416;
		pattern2[3680]=415;
		pattern2[3681]=414;
		pattern2[3682]=413;
		pattern2[3683]=412;
		pattern2[3684]=411;
		pattern2[3685]=410;
		pattern2[3686]=409;
		pattern2[3687]=408;
		pattern2[3688]=407;
		pattern2[3689]=406;
		pattern2[3690]=405;
		pattern2[3691]=404;
		pattern2[3692]=403;
		pattern2[3693]=402;
		pattern2[3694]=401;
		pattern2[3695]=400;
		pattern2[3696]=399;
		pattern2[3697]=398;
		pattern2[3698]=397;
		pattern2[3699]=396;
		pattern2[3700]=395;
		pattern2[3701]=394;
		pattern2[3702]=393;
		pattern2[3703]=392;
		pattern2[3704]=391;
		pattern2[3705]=390;
		pattern2[3706]=389;
		pattern2[3707]=388;
		pattern2[3708]=387;
		pattern2[3709]=386;
		pattern2[3710]=385;
		pattern2[3711]=384;
		pattern2[3712]=383;
		pattern2[3713]=382;
		pattern2[3714]=381;
		pattern2[3715]=380;
		pattern2[3716]=379;
		pattern2[3717]=378;
		pattern2[3718]=377;
		pattern2[3719]=376;
		pattern2[3720]=375;
		pattern2[3721]=374;
		pattern2[3722]=373;
		pattern2[3723]=372;
		pattern2[3724]=371;
		pattern2[3725]=370;
		pattern2[3726]=369;
		pattern2[3727]=368;
		pattern2[3728]=367;
		pattern2[3729]=366;
		pattern2[3730]=365;
		pattern2[3731]=364;
		pattern2[3732]=363;
		pattern2[3733]=362;
		pattern2[3734]=361;
		pattern2[3735]=360;
		pattern2[3736]=359;
		pattern2[3737]=358;
		pattern2[3738]=357;
		pattern2[3739]=356;
		pattern2[3740]=355;
		pattern2[3741]=354;
		pattern2[3742]=353;
		pattern2[3743]=352;
		pattern2[3744]=351;
		pattern2[3745]=350;
		pattern2[3746]=349;
		pattern2[3747]=348;
		pattern2[3748]=347;
		pattern2[3749]=346;
		pattern2[3750]=345;
		pattern2[3751]=344;
		pattern2[3752]=343;
		pattern2[3753]=342;
		pattern2[3754]=341;
		pattern2[3755]=340;
		pattern2[3756]=339;
		pattern2[3757]=338;
		pattern2[3758]=337;
		pattern2[3759]=336;
		pattern2[3760]=335;
		pattern2[3761]=334;
		pattern2[3762]=333;
		pattern2[3763]=332;
		pattern2[3764]=331;
		pattern2[3765]=330;
		pattern2[3766]=329;
		pattern2[3767]=328;
		pattern2[3768]=327;
		pattern2[3769]=326;
		pattern2[3770]=325;
		pattern2[3771]=324;
		pattern2[3772]=323;
		pattern2[3773]=322;
		pattern2[3774]=321;
		pattern2[3775]=320;
		pattern2[3776]=319;
		pattern2[3777]=318;
		pattern2[3778]=317;
		pattern2[3779]=316;
		pattern2[3780]=315;
		pattern2[3781]=314;
		pattern2[3782]=313;
		pattern2[3783]=312;
		pattern2[3784]=311;
		pattern2[3785]=310;
		pattern2[3786]=309;
		pattern2[3787]=308;
		pattern2[3788]=307;
		pattern2[3789]=306;
		pattern2[3790]=305;
		pattern2[3791]=304;
		pattern2[3792]=303;
		pattern2[3793]=302;
		pattern2[3794]=301;
		pattern2[3795]=300;
		pattern2[3796]=299;
		pattern2[3797]=298;
		pattern2[3798]=297;
		pattern2[3799]=296;
		pattern2[3800]=295;
		pattern2[3801]=294;
		pattern2[3802]=293;
		pattern2[3803]=292;
		pattern2[3804]=291;
		pattern2[3805]=290;
		pattern2[3806]=289;
		pattern2[3807]=288;
		pattern2[3808]=287;
		pattern2[3809]=286;
		pattern2[3810]=285;
		pattern2[3811]=284;
		pattern2[3812]=283;
		pattern2[3813]=282;
		pattern2[3814]=281;
		pattern2[3815]=280;
		pattern2[3816]=279;
		pattern2[3817]=278;
		pattern2[3818]=277;
		pattern2[3819]=276;
		pattern2[3820]=275;
		pattern2[3821]=274;
		pattern2[3822]=273;
		pattern2[3823]=272;
		pattern2[3824]=271;
		pattern2[3825]=270;
		pattern2[3826]=269;
		pattern2[3827]=268;
		pattern2[3828]=267;
		pattern2[3829]=266;
		pattern2[3830]=265;
		pattern2[3831]=264;
		pattern2[3832]=263;
		pattern2[3833]=262;
		pattern2[3834]=261;
		pattern2[3835]=260;
		pattern2[3836]=259;
		pattern2[3837]=258;
		pattern2[3838]=257;
		pattern2[3839]=256;
		pattern2[3840]=255;
		pattern2[3841]=254;
		pattern2[3842]=253;
		pattern2[3843]=252;
		pattern2[3844]=251;
		pattern2[3845]=250;
		pattern2[3846]=249;
		pattern2[3847]=248;
		pattern2[3848]=247;
		pattern2[3849]=246;
		pattern2[3850]=245;
		pattern2[3851]=244;
		pattern2[3852]=243;
		pattern2[3853]=242;
		pattern2[3854]=241;
		pattern2[3855]=240;
		pattern2[3856]=239;
		pattern2[3857]=238;
		pattern2[3858]=237;
		pattern2[3859]=236;
		pattern2[3860]=235;
		pattern2[3861]=234;
		pattern2[3862]=233;
		pattern2[3863]=232;
		pattern2[3864]=231;
		pattern2[3865]=230;
		pattern2[3866]=229;
		pattern2[3867]=228;
		pattern2[3868]=227;
		pattern2[3869]=226;
		pattern2[3870]=225;
		pattern2[3871]=224;
		pattern2[3872]=223;
		pattern2[3873]=222;
		pattern2[3874]=221;
		pattern2[3875]=220;
		pattern2[3876]=219;
		pattern2[3877]=218;
		pattern2[3878]=217;
		pattern2[3879]=216;
		pattern2[3880]=215;
		pattern2[3881]=214;
		pattern2[3882]=213;
		pattern2[3883]=212;
		pattern2[3884]=211;
		pattern2[3885]=210;
		pattern2[3886]=209;
		pattern2[3887]=208;
		pattern2[3888]=207;
		pattern2[3889]=206;
		pattern2[3890]=205;
		pattern2[3891]=204;
		pattern2[3892]=203;
		pattern2[3893]=202;
		pattern2[3894]=201;
		pattern2[3895]=200;
		pattern2[3896]=199;
		pattern2[3897]=198;
		pattern2[3898]=197;
		pattern2[3899]=196;
		pattern2[3900]=195;
		pattern2[3901]=194;
		pattern2[3902]=193;
		pattern2[3903]=192;
		pattern2[3904]=191;
		pattern2[3905]=190;
		pattern2[3906]=189;
		pattern2[3907]=188;
		pattern2[3908]=187;
		pattern2[3909]=186;
		pattern2[3910]=185;
		pattern2[3911]=184;
		pattern2[3912]=183;
		pattern2[3913]=182;
		pattern2[3914]=181;
		pattern2[3915]=180;
		pattern2[3916]=179;
		pattern2[3917]=178;
		pattern2[3918]=177;
		pattern2[3919]=176;
		pattern2[3920]=175;
		pattern2[3921]=174;
		pattern2[3922]=173;
		pattern2[3923]=172;
		pattern2[3924]=171;
		pattern2[3925]=170;
		pattern2[3926]=169;
		pattern2[3927]=168;
		pattern2[3928]=167;
		pattern2[3929]=166;
		pattern2[3930]=165;
		pattern2[3931]=164;
		pattern2[3932]=163;
		pattern2[3933]=162;
		pattern2[3934]=161;
		pattern2[3935]=160;
		pattern2[3936]=159;
		pattern2[3937]=158;
		pattern2[3938]=157;
		pattern2[3939]=156;
		pattern2[3940]=155;
		pattern2[3941]=154;
		pattern2[3942]=153;
		pattern2[3943]=152;
		pattern2[3944]=151;
		pattern2[3945]=150;
		pattern2[3946]=149;
		pattern2[3947]=148;
		pattern2[3948]=147;
		pattern2[3949]=146;
		pattern2[3950]=145;
		pattern2[3951]=144;
		pattern2[3952]=143;
		pattern2[3953]=142;
		pattern2[3954]=141;
		pattern2[3955]=140;
		pattern2[3956]=139;
		pattern2[3957]=138;
		pattern2[3958]=137;
		pattern2[3959]=136;
		pattern2[3960]=135;
		pattern2[3961]=134;
		pattern2[3962]=133;
		pattern2[3963]=132;
		pattern2[3964]=131;
		pattern2[3965]=130;
		pattern2[3966]=129;
		pattern2[3967]=128;
		pattern2[3968]=127;
		pattern2[3969]=126;
		pattern2[3970]=125;
		pattern2[3971]=124;
		pattern2[3972]=123;
		pattern2[3973]=122;
		pattern2[3974]=121;
		pattern2[3975]=120;
		pattern2[3976]=119;
		pattern2[3977]=118;
		pattern2[3978]=117;
		pattern2[3979]=116;
		pattern2[3980]=115;
		pattern2[3981]=114;
		pattern2[3982]=113;
		pattern2[3983]=112;
		pattern2[3984]=111;
		pattern2[3985]=110;
		pattern2[3986]=109;
		pattern2[3987]=108;
		pattern2[3988]=107;
		pattern2[3989]=106;
		pattern2[3990]=105;
		pattern2[3991]=104;
		pattern2[3992]=103;
		pattern2[3993]=102;
		pattern2[3994]=101;
		pattern2[3995]=100;
		pattern2[3996]=99;
		pattern2[3997]=98;
		pattern2[3998]=97;
		pattern2[3999]=96;
		pattern2[4000]=95;
		pattern2[4001]=94;
		pattern2[4002]=93;
		pattern2[4003]=92;
		pattern2[4004]=91;
		pattern2[4005]=90;
		pattern2[4006]=89;
		pattern2[4007]=88;
		pattern2[4008]=87;
		pattern2[4009]=86;
		pattern2[4010]=85;
		pattern2[4011]=84;
		pattern2[4012]=83;
		pattern2[4013]=82;
		pattern2[4014]=81;
		pattern2[4015]=80;
		pattern2[4016]=79;
		pattern2[4017]=78;
		pattern2[4018]=77;
		pattern2[4019]=76;
		pattern2[4020]=75;
		pattern2[4021]=74;
		pattern2[4022]=73;
		pattern2[4023]=72;
		pattern2[4024]=71;
		pattern2[4025]=70;
		pattern2[4026]=69;
		pattern2[4027]=68;
		pattern2[4028]=67;
		pattern2[4029]=66;
		pattern2[4030]=65;
		pattern2[4031]=64;
		pattern2[4032]=63;
		pattern2[4033]=62;
		pattern2[4034]=61;
		pattern2[4035]=60;
		pattern2[4036]=59;
		pattern2[4037]=58;
		pattern2[4038]=57;
		pattern2[4039]=56;
		pattern2[4040]=55;
		pattern2[4041]=54;
		pattern2[4042]=53;
		pattern2[4043]=52;
		pattern2[4044]=51;
		pattern2[4045]=50;
		pattern2[4046]=49;
		pattern2[4047]=48;
		pattern2[4048]=47;
		pattern2[4049]=46;
		pattern2[4050]=45;
		pattern2[4051]=44;
		pattern2[4052]=43;
		pattern2[4053]=42;
		pattern2[4054]=41;
		pattern2[4055]=40;
		pattern2[4056]=39;
		pattern2[4057]=38;
		pattern2[4058]=37;
		pattern2[4059]=36;
		pattern2[4060]=35;
		pattern2[4061]=34;
		pattern2[4062]=33;
		pattern2[4063]=32;
		pattern2[4064]=31;
		pattern2[4065]=30;
		pattern2[4066]=29;
		pattern2[4067]=28;
		pattern2[4068]=27;
		pattern2[4069]=26;
		pattern2[4070]=25;
		pattern2[4071]=24;
		pattern2[4072]=23;
		pattern2[4073]=22;
		pattern2[4074]=21;
		pattern2[4075]=20;
		pattern2[4076]=19;
		pattern2[4077]=18;
		pattern2[4078]=17;
		pattern2[4079]=16;
		pattern2[4080]=15;
		pattern2[4081]=14;
		pattern2[4082]=13;
		pattern2[4083]=12;
		pattern2[4084]=11;
		pattern2[4085]=10;
		pattern2[4086]=9;
		pattern2[4087]=8;
		pattern2[4088]=7;
		pattern2[4089]=6;
		pattern2[4090]=5;
		pattern2[4091]=4;
		pattern2[4092]=3;
		pattern2[4093]=2;
		pattern2[4094]=1;
		pattern2[4095]=0;


		//=========== load DMA ==========================

		if (typeOfTxDataToLoad == TX_DATA_RAMP_UP){
			for(Index = 0; Index < 2048; Index++){
				TxPacket[Index] = (pattern1[Index*2]<<20) + (pattern1[Index*2+1]<<4);
			}
			typeOfTxDataToLoad = TX_DATA_RAMP_DOWN; //change for nex time data loaded
		}
		else{
			for(Index = 0; Index < 2048; Index++){
				TxPacket[Index] = (pattern2[Index*2]<<20) + (pattern2[Index*2+1]<<4);
			}
			typeOfTxDataToLoad = TX_DATA_RAMP_UP; //change for next time data loaded
		}



	/*
		for(Index = 0; Index < 2048; Index++){
			TxPacket[Index+2048] = (pattern2[Index*2]<<20) + (pattern2[Index*2+1]<<4);
		}
		for(Index = 0; Index < 2048; Index++){
			TxPacket[Index+4096] = (pattern1[Index*2]<<20) + (pattern1[Index*2+1]<<4);
		}
		for(Index = 0; Index < 2048; Index++){
			TxPacket[Index+6144] = (pattern2[Index*2]<<20) + (pattern2[Index*2+1]<<4);
		}
*/
/*
		u16 dataShifted;
		for(Index = 0; Index < npoints; Index++){
			dataShifted = pattern1[Index]<<4;
			TxPacket[Index*2] = (u8)(dataShifted & 0xFF);
			TxPacket[Index*2+1] = (u8)(dataShifted >> 8);
		}
		for(Index = 4096; Index < npoints*2; Index++){
			dataShifted = pattern2[Index-4096]<<4;
			TxPacket[Index*2] = (u8)(dataShifted & 0xFF);
			TxPacket[Index*2+1] = (u8)(dataShifted >> 8);
		}
		for(Index = 8192; Index < npoints*3; Index++){
			dataShifted = pattern3[Index-8192]<<4;
			TxPacket[Index*2] = (u8)(dataShifted & 0xFF);
			TxPacket[Index*2+1] = (u8)(dataShifted >> 8);
		}
		for(Index = 12288; Index < npoints*4; Index++){
			dataShifted = pattern2[Index-12288]<<4;
			TxPacket[Index*2] = (u8)(dataShifted & 0xFF);
			TxPacket[Index*2+1] = (u8)(dataShifted >> 8);
		}
	*/	//===============================================

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
	u32 *TxPacket;
	//u8 Value;
	XAxiDma_Bd *BdPtr;
	int Status;
	int Index;

	TxRingPtr = XAxiDma_GetTxRing(AxiDmaInstPtr);

	/* Create pattern in the packet to transmit */
	TxPacket = (u32 *) Packet;
	//TxPacket = (u8 *) Packet;
	//Value = TEST_START_VALUE;
//	Value = 0x01;

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
void fastCalibrationADC0(void)
{
	unsigned int reg6;

	readSPI(&reg6,6);				// store for restoring later

	writeSPI_non_blocking(6,0x0a); // set fastcal and ADC_EN bits
	writeSPI_non_blocking(6,0x0e); // set CAL_START bit
	nops(100000);
	writeSPI_non_blocking(6,0x0a); // clear CAL_START bit

	writeSPI_non_blocking(6,reg6); // restore original value

}

// -------------------------------------------------------------------
void fastCalibrationADC1(void)
{
	unsigned int reg10;

	readSPI(&reg10,10);				// store for restoring later

	writeSPI_non_blocking(10,0x0a); // set fastcal and ADC_EN bits
	writeSPI_non_blocking(10,0x0e); // set CAL_START bit
	nops(100000);
	writeSPI_non_blocking(10,0x0a); // clear CAL_START bit

	writeSPI_non_blocking(10,reg10); // restore original value

}

// -------------------------------------------------------------------
int captureADC1calibrationData(void){

	resetGyroRxFIFO();

	setGyroChannelControl(0x00000010);	//start acquisition

	//======================================================
	// remove this later ---only added for calibration testing
	nops(80000);
	writeSPI_non_blocking(10,0x06); // set calibration bit
	//======================================================

	nops(10000000); 					//delay value for DIV 1 of MCLK

	//======================================================
	// remove this later ---only added for calibration testing
	writeSPI_non_blocking(10,0x02); // clear calibration bit
	//======================================================

	setGyroChannelControl(0x00000000);	//reset acquisition
	receiveDMApacket(&AxiDma,0);		//receive data in ARM memory

	return 1;
}

// -------------------------------------------------------------------
int captureADC0calibrationData(void){

	resetGyroRxFIFO();

	setGyroChannelControl(0x00000010);	//start acquisition

	//======================================================
	// remove this later ---only added for calibration testing
	nops(80000);
	writeSPI_non_blocking(6,0x06); // set calibration bit
	//======================================================

	nops(10000000); 					//delay value for DIV 1 of MCLK

	//======================================================
	// remove this later ---only added for calibration testing
	writeSPI_non_blocking(6,0x02); // clear calibration bit
	//======================================================

	setGyroChannelControl(0x00000000);	//reset acquisition
	receiveDMApacket(&AxiDma,0);		//receive data in ARM memory

	return 1;
}

 // -------------------------------------------------------------------
int receivePacketButton(void){
	unsigned int num_nops;
	u32 num_shifts = 0;

	resetGyroRxFIFO();
	setGyroChannelControl(0x00000010);	//start acquisition

	// delay for the acquisition to take place in the fpga
	num_shifts = MCK_div_setting>>16;
	num_nops = (unsigned int)( 10000000 << num_shifts );
	nops(num_nops);

	setGyroChannelControl(0x00000000);	//reset acquisition
	receiveDMApacket(&AxiDma,0);		//receive data in ARM memory

	return 1;
}

// -------------------------------------------------------------------
int receivePacketButtonLoop(void){

	int i;
	unsigned int num_nops;
	u32 num_shifts = 0;

	//Status = RxSetup(&AxiDma); // ####

	resetGyroRxFIFO();

	for (i=0; i<NUM_RXFIFO_DUMMY_READS_REQUIRED;i++)
	{
		setGyroChannelControl(0x00000010);

		// waiting for the acquisition to complete in the fpga
		// 10,000,000 is the value for DIV 1
		// Don't know what the actual interval should be
		// but this needs to track the MCLK speed
		num_shifts = MCK_div_setting>>16;
		num_nops = (unsigned int)( 10000000 << num_shifts );
		nops(num_nops);

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
	u16 TxData;
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

		case (CMD_FAST_CAL_ADC0):
			fastCalibrationADC0();
			break;

		case (CMD_FAST_CAL_ADC1):
			fastCalibrationADC1();
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

		case (CMD_LOOP_ADC_ACQUISITIONS):
			receivePacketButtonLoop();
			send_byte_over_UART(RESPONSE_ADC_ACQUIRE_DONE);
			break;

		case (CMD_START_ADC_ACQUISITIONS):
			receivePacketButton();
			send_byte_over_UART(RESPONSE_ADC_ACQUIRE_DONE);
			break;

		case (CMD_CAPTURE_ADC0_CAL_DATA):
			captureADC0calibrationData();
			send_byte_over_UART(RESPONSE_ADC_ACQUIRE_DONE);
			break;

		case (CMD_CAPTURE_ADC1_CAL_DATA):
			captureADC1calibrationData();
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

		case (CMD_RUN_TADC_CONVERSION):
			TxData = read_test_ADC_result();
			send_data_over_UART(2,(u8*)&TxData);
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

		case (CMD_ENABLE_VFUSE):
			enable_Vfuse();
			break;

		case (CMD_DISABLE_VFUSE):
			disable_Vfuse();
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
unsigned int read_test_ADC_result(void)
{
	unsigned int reg0,reg1readBack;
	unsigned int firstCalRegisterAddress = 32;

	//store original register 0 setting
	readSPI(&reg0,0);

	//set register 1 readback mode to read-only, this is
	//controlled by register 0 bit 10
	writeSPI_non_blocking(0,reg0|0x0400);

	//read the state of TESTADC readback register
	readSPI(&reg1readBack,1);

	//fist 12 bits are ADC value, mask others
	reg1readBack &= 0xFFF;

	//turn register1 readback mode off
	writeSPI_non_blocking(0,reg0);

	return reg1readBack;
}

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

	//turn Vfuse on (NVM programming voltage)
	enable_Vfuse();

	//delay for Vfuse to come up
	SetTimerDuration(65000, 10);
	timerRunning = 1;
	XTtcPs_Start(&DelayTimer);
	while(timerRunning);

	// setup the timer for 25usec delay to use later
//	SetTimerDuration(2500, 1);

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

	disable_Vfuse();		// programming done so disable voltage

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


//------------------------------------------------------------
void init_MIO_gpio(void)
{
	XGpioPs_Config *GPIO_Config;
	GPIO_Config = XGpioPs_LookupConfig(XPAR_PS7_GPIO_0_DEVICE_ID);

    Status = XGpioPs_CfgInitialize(&MIO_gpio, GPIO_Config, GPIO_Config->BaseAddr);
    if (Status != XST_SUCCESS){
    	xil_printf("error initializing gpio from MIO\n");
    }
    else{
    	xil_printf("success initializing gpio from MIO\n");
    }

    XGpioPs_SetDirectionPin(&MIO_gpio, VFUSE_MIO_OUTPUT_PIN, DIRECTION_OUTPUT);

    XGpioPs_SetOutputEnablePin(&MIO_gpio, VFUSE_MIO_OUTPUT_PIN, DIRECTION_OUTPUT);
}
//------------------------------------------------------------


//------------------------------------------------------------
void enable_Vfuse(void){
	XGpioPs_WritePin(&MIO_gpio, VFUSE_MIO_OUTPUT_PIN, 1);
}
//------------------------------------------------------------


//------------------------------------------------------------
void disable_Vfuse(void){
	XGpioPs_WritePin(&MIO_gpio, VFUSE_MIO_OUTPUT_PIN, 0);
}
//------------------------------------------------------------

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

    init_MIO_gpio();

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
	//readWaveformData();

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
