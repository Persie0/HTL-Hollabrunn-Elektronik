/**
  ******************************************************************************
  * @file    DS2438.c
  * @author  Daniel Marek, Marvin Perzi 
  * @version V01
  * @date    19-01-2022
  * @brief   Main/Example program for the DS2438 (Battery Management IC) Libary
  ******************************************************************************
  * @history 19-01-2022: Perzi/Marek creation
  ******************************************************************************
*/

#include <stm32f10x.h>
#include <stdio.h>
#include "stm32f10x_gpio.h"
#include "stm32f10x_rcc.h"
#include "stm32f10x_tim.h"
#include "stm32f10x_exti.h"
#include <stdbool.h>
#include <Nextion.h>

/*----------------------------- Define Pins for Motor and Sensor--------------*/
// Calc peripheral address GPIOB IDR, GPIOC ODR
#define GPIOB_IDR GPIOB_BASE + 2*sizeof(uint32_t)
#define GPIOC_ODR GPIOC_BASE + 3*sizeof(uint32_t)

// Calc Bit Band Adress from peripheral address: a = peripheral address b = Bit number
#define BITBAND_PERI(a,b) ((PERIPH_BB_BASE + (a-PERIPH_BASE)*32 + (b*4)))

#define SM1  *((volatile unsigned long *)(BITBAND_PERI(GPIOC_ODR,0)))	 // PC0
#define SM2  *((volatile unsigned long *)(BITBAND_PERI(GPIOC_ODR,2)))	 // PC2
#define SM3  *((volatile unsigned long *)(BITBAND_PERI(GPIOC_ODR,1)))	 // PC1
#define SM4  *((volatile unsigned long *)(BITBAND_PERI(GPIOC_ODR,3)))	 // PC3
#define Sensor  *((volatile unsigned long *)(BITBAND_PERI(GPIOB_IDR,12)))	 // PB12


/*---------------------------Prototypes ---------------------------------------*/
    // ===========================================================
    //                 INITIALIZATION FUNCTIONS
    // ===========================================================

    /*
    *   \brief EXTI1_config.
		* 	Leitung PB12 wird mit EXTI15_10 verbunden, Interupt bei rising edge,Priorität 0
    */
static void EXTI15_10_IRQHandler_Config(void);

    /*
    *   \brief Timer3_config.
		* 	activate TIM3 clock, set PSC und ARR, Init NVIC for Timer 3,Priorität 0
    */
static void TIM3_Config(void);

    /*
    *   \brief Clock config.
		* 	activate and use HSE with 48Mhz
    */
void set_clock_48MHz();

    /*
    *   \brief initiate motor pins.
		* 	initiates PC0-3 as output to control the step motor
    */
void init_motor(void);


    // ===========================================================
    //                  WAIT FUNCTIONS
    // ===========================================================

    /**
    *   \brief waits for 1ms times factor
    *   \param factor is number by which the 1ms are multiplied by
    */
void wait_1ms(int factor);


    // ===========================================================
    //                  STEP MOTOR TURNING FUNCTIONS
    // ===========================================================

/**
*   \brief turns the motor right
*   \param how long should be waited for between each step
*/
void rechtslauf(int wait);

/**
*   \brief turns the motor left
*   \param how long should be waited for between each step
*/
void linkslauf(int wait);

/**
*   \brief turns the motor and checks with the r_lauf variable in which direction
*/
void drehen();


    // ===========================================================
    //                 CODE AND FUNCTION BODYS
    // ===========================================================

//struct with h,m,s to show on nextion display
static struct {
    int hours;
    int minutes;
    int seconds;
} clock = {0, 0, 0};

//buffer for bounce protection, saves time since last interrupt
int buffer=0;
// motor turning direction
//true=right; false=left
bool r_lauf=true;

void wait_1ms(int factor){	//wait for 1ms multiplied by the value that gets passed as argument
    int j;
    for(j = 0; j < 8000*factor; j++) {
    }
}

//initialise motor ports as output
void init_motor(void) {
    int temp;

    RCC->APB2ENR |= 0x10;     // enable clock for GPIOC	(APB2 Peripheral clock enable register)


//Configure GPIO lines Switches  	
    temp = GPIOC->CRL;
    temp &= 0xFFFF0000;	// Reset PC0-PC3 Configuration Bits
    temp |= 0x00003333; //set as output
    GPIOC->CRL = temp;

/* --------------- Event Objects on Page 1 (Main Page)------------------------*/

}

//step motor turning right waiting for passed seconds between each step
void rechtslauf(int wait)
{
    SM1=1;
    SM2=0;
    SM3=0;
    SM4=1;
    wait_1ms(wait);
    SM1=1;
    SM2=0;
    SM3=1;
    SM4=0;
    wait_1ms(wait);
    SM1=0;
    SM2=1;
    SM3=1;
    SM4=0;
    wait_1ms(wait);
    SM1=0;
    SM2=1;
    SM3=0;
    SM4=1;
    wait_1ms(wait);
}

//step motor turning left waiting for passed seconds between each step
void linkslauf(int wait)
{
    SM1=0;
    SM2=1;
    SM3=0;
    SM4=1;
    wait_1ms(wait);
    SM1=0;
    SM2=1;
    SM3=1;
    SM4=0;
    wait_1ms(wait);
    SM1=1;
    SM2=0;
    SM3=1;
    SM4=0;
    wait_1ms(wait);
    SM1=1;
    SM2=1;
    SM3=0;
    SM4=1;
    wait_1ms(wait);
}

//turn the motor
void drehen()
{
    //check if motor should turn left or right
    if(r_lauf)
        rechtslauf(2);
    else
        linkslauf(2);
}

/* Handle PB12 interrupt */
void EXTI15_10_IRQHandler(void) {
    /* Make sure that interrupt flag is set */
    if (EXTI_GetITStatus(EXTI_Line12) != RESET) {
        //bounce protection, wait 2 seconds before triggering interrupt again
        if(buffer>2) {
            //change motor direction
            r_lauf = !r_lauf;
            //reset bounce protection buffer
            buffer=0;
        }
        /* Clear interrupt flag */
        EXTI_ClearITPendingBit(EXTI_Line12);
    }
}

static void EXTI15_10_IRQHandler_Config(void) {
    GPIO_InitTypeDef gpio;
    EXTI_InitTypeDef EXTI_InitStruct;
    NVIC_InitTypeDef nvic;

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE); // GPIOB Clock Enable


    GPIO_StructInit(&gpio);// Create gpio struct and fill it with defaults
    gpio.GPIO_Mode = GPIO_Mode_IPU; // Configure PB12 to input Pull UP Mode
    gpio.GPIO_Pin = GPIO_Pin_12; //PB12
    GPIO_Init(GPIOB, &gpio);
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO, ENABLE);
    //AFIOEN - Clock enable
    //Deinitializes the EXTI peripheral registers to their default reset values.
    EXTI_DeInit();

    EXTI_StructInit(&EXTI_InitStruct);
    EXTI_InitStruct.EXTI_Line =  EXTI_Line12;//EXTI Line for PB12
    EXTI_InitStruct.EXTI_Mode = EXTI_Mode_Interrupt;//Interrupt mode
    EXTI_InitStruct.EXTI_Trigger = EXTI_Trigger_Rising;//trigger for rising edge
    EXTI_InitStruct.EXTI_LineCmd = ENABLE;//enable EXTI_Line12
    EXTI_Init (&EXTI_InitStruct); /* save initialisation */

    GPIO_EXTILineConfig(GPIO_PortSourceGPIOB, GPIO_PinSource12); /* configure EXTI_Line12, Port B12 */

    EXTI_ClearITPendingBit(EXTI_Line12); //EXTI_clear_pending: Das Auslösen auf vergangene Vorgänge nach dem enablen verhindern

    // Init NVIC for EXTI Interrupt
    //enable EXTI_Line12 interrupt and set to highest priority
    nvic.NVIC_IRQChannel = EXTI15_10_IRQn;
    nvic.NVIC_IRQChannelCmd = ENABLE;
    nvic.NVIC_IRQChannelPreemptionPriority = 0;
    nvic.NVIC_IRQChannelSubPriority = 0;
    NVIC_Init(&nvic);
    return;

}



//use and set clock to HSE at 48MHz
void set_clock_48MHz()
{
    RCC_DeInit();//Resets the RCC clock configuration to the default reset state.
    do{//enable HSE
        RCC_HSEConfig(RCC_HSE_ON);//enables HSE
    }
    while (!RCC_WaitForHSEStartUp());//wait until HSE is enabled
    RCC_PLLConfig(RCC_PLLSource_HSE_Div1, RCC_PLLMul_6);//PPL = multilpier; set HSE 8*6=48Mhz

    do{
        RCC_PLLCmd(ENABLE);//enable PLL - multiplier
    }
    while(RCC_GetFlagStatus(RCC_FLAG_PLLRDY)!=SET);//while PLL clock is not ready
    RCC_HCLKConfig(RCC_SYSCLK_Div1);
    RCC_SYSCLKConfig(RCC_SYSCLKSource_PLLCLK);
    SystemCoreClockUpdate();
}

void TIM3_IRQHandler(void) {
    // Timer 1, löst alle 1000ms aus
    // Interrupt pending bit löschen (Verhinderung eines nochmaligen
    // Interrupt-auslösens) TIM1->SR &=~0x01;
    TIM_ClearFlag(TIM3, TIM_FLAG_Update);
    //add 1s to struct
    clock.seconds++;
    //add 1s to bounce protection buffer
    buffer++;
}

static void TIM3_Config(void) {
    TIM_TimeBaseInitTypeDef TIM_TimeBase_InitStructure;
    NVIC_InitTypeDef nvic;
    //enable TIM3 peripheral clock
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM3, ENABLE);

    TIM_DeInit(TIM3);
    //set TIM3 clock to the same as system clock
    TIM_TimeBase_InitStructure.TIM_ClockDivision = TIM_CKD_DIV1;
    //counting up
    TIM_TimeBase_InitStructure.TIM_CounterMode = TIM_CounterMode_Up;
    /* T_INT = 13,8ns, Annahme: Presc = 47999 ---> Auto Reload Wert = 52801
    (=0xCE41) --> 1s Update Event*/
    // Auto-Reload Wert = Maximaler Zaehlerstand des Upcounters
    TIM_TimeBase_InitStructure.TIM_Period = 0x3E8;
    // Wert des prescalers (Taktverminderung)
    TIM_TimeBase_InitStructure.TIM_Prescaler = 0xBB7F; // Error: 0%
    // Repetition Counter deaktivieren
    TIM_TimeBase_InitStructure.TIM_RepetitionCounter = 0;
    TIM_TimeBaseInit(TIM3, &TIM_TimeBase_InitStructure);

    TIM_ITConfig(TIM3, TIM_DIER_UIE, ENABLE); // Update Interrupt Enable

    // Init NVIC for Timer 3 Update Interrupt
    nvic.NVIC_IRQChannel = TIM3_IRQn;
    nvic.NVIC_IRQChannelCmd = ENABLE;
    nvic.NVIC_IRQChannelPreemptionPriority = 0;
    nvic.NVIC_IRQChannelSubPriority = 2;
    NVIC_Init(&nvic);

    TIM_Cmd(TIM3, ENABLE); // Counter-Enable bit (CEN) setzen
}


    // ===========================================================
    //                 MAIN
    // ===========================================================

int main(void)
{
    //single hours, minutes and seconds
    char h[2],m[2],s[2];
    //combined hours, minutes and seconds
    char time[10];
    NexEventObj p0_t1; // Button t1 Object on page0 (Text)
    NexEventObj p0_t3; // Button t3 Object on page0 (Text)
    init_motor();
    set_clock_48MHz();
    EXTI15_10_IRQHandler_Config(); // Konfigurieren des Externen Interrupts für Leitung PB12
    TIM3_Config();//configure timer 3

    /*------------------------ Initalize Events page 1 (Schritt_Motor page) ----------------*/
    p0_t1.pid = 0;			  // Page ID
    p0_t1.cid = 2;			  // Component ID  of "Schalter Button"
    p0_t1.name = "t1";		  // Unique Name on page
    p0_t1.pophandler = NULL;  // Callback Function in case of Release Button Event
    p0_t1.pushhandler = NULL; // Callback Function in case of Pressing Button Event

    p0_t3.pid = 0;			  // Page ID
    p0_t3.cid = 4;				// Component ID  of "Schalter Button"
    p0_t3.name = "t3";		  // Unique Name on page
    p0_t3.pophandler = NULL;  // Callback Function in case of Release Button Event
    p0_t3.pushhandler = NULL; // Callback Function in case of Pressing Button Event

    /* ------------------ Initalize System ------------*/
    Nex_Init(0); // Init Nextion Display - no debugging via UART#1(115200,n,8,1)

    while(1)
    {
        //change seconds to minutes, minutes to hours
        if (clock.seconds >= 60) {
            clock.seconds = 0;
            clock.minutes++;
        }

        if (clock.minutes >= 60) {
            clock.minutes = 0;
            clock.hours++;
        }

        if (clock.hours >= 24) {
            clock.hours = 0;
        }
        //convert single hours, minutes and seconds to String
        sprintf(h, "%02d", clock.hours);
        sprintf(m, "%02d", clock.minutes);
        sprintf(s, "%02d", clock.seconds);
        //combine single hour, minutes and seconds
        snprintf(time, sizeof(time), "%s:%s:%s ", h, m, s);
        //set time on display
        NexText_setText(&p0_t1,time);
        //set motor direction on display depending on direction
        if(r_lauf)
        {
            NexText_setText(&p0_t3,"right");
        }
        else
        {
            NexText_setText(&p0_t3,"left");
        }
        drehen();
    }
}
	
