/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"

//time
u8 timetest=0;

void Delay (u16 nCount);
u16 timedelay=0;
uint8_t buff[5];

u8 RXready=1;
u8 RXtek=0;

#define MAXPWM 4095
u16 ccrval;
//-------perem
s8 mot_scor[4]={0,0,0,0};//4 tek scorosti motorov
s8 mot_newscor[4];//novye scorosti poluchennye po portu UART
//u8 mot_stop[4];//stop obnovlenia shim motorov
u8 mot_time[4]={0,0,0,0};//stop motor for time - not change scor while time 
u8 newspeed=0;
//-------

void changespeed(void)
{
	//sravnivaem new and old state - i menyaem
	u8 i;
	//u8 newhc995 = hc995;
	
	for (i=0;i<4;i++) {
		if ( mot_scor[i] == mot_newscor[i]) {
			//скорость не изменилась, ничего не делаем
			continue;		
		}else if (mot_scor[i]*mot_newscor[i] > 0) {
			//тот же знак, просто скорость другая!
			//тут ничего не делаем = сделаем ниже
		}else {
			//знак разный
			//тут надо сначала мотор остановить!
			//сменить знаки
			//а только потом уже поменять скорости!
			if (mot_scor[i]*mot_newscor[i] < 0) {
				mot_time[i]=100;//сразу заблокируем дрыганье ногами пока не дойдет до нуля!
			}	else mot_time[i]=2;
			//выключим нижние транзисторы и верхние!
			//нижние сами включаться дальше в ШИМ!
			//подготовим сразу верхние как надо!!
			
			//0b1L 1R 2L 2R 3L 3R 4L 4R
			switch (i) {
				case 0:
					GPIO_WriteLow(GPIOD,GPIO_PIN_0|GPIO_PIN_2);
					GPIO_WriteLow(GPIOE,GPIO_PIN_5);
					GPIO_WriteLow(GPIOC,GPIO_PIN_1);
					break;
				case 1:
					GPIO_WriteLow(GPIOC,GPIO_PIN_4|GPIO_PIN_5);
					GPIO_WriteLow(GPIOB,GPIO_PIN_2|GPIO_PIN_3);
					break;
				case 2:
					GPIO_WriteLow(GPIOB,GPIO_PIN_0|GPIO_PIN_1);
					GPIO_WriteLow(GPIOC,GPIO_PIN_6|GPIO_PIN_7);
					break;
				case 3:
					GPIO_WriteLow(GPIOD,GPIO_PIN_3|GPIO_PIN_4);
					GPIO_WriteLow(GPIOC,GPIO_PIN_2|GPIO_PIN_3);
					break;
			}		
			Delay(1);//чтобы исключить deadtime
			//теперь включим верхние как нужно!
			if (mot_scor[i]>0) {
				//xHR
				switch (i) {
					case 0:
						GPIO_WriteHigh(GPIOC,GPIO_PIN_1);
						break;
					case 1:
						GPIO_WriteHigh(GPIOB,GPIO_PIN_2);
						break;
					case 2:
						GPIO_WriteHigh(GPIOB,GPIO_PIN_0);
						break;
					case 3:
						GPIO_WriteHigh(GPIOC,GPIO_PIN_3);
						break;
				}
			}	else {
				//xHL
				switch (i) {
					case 0:
						GPIO_WriteHigh(GPIOE,GPIO_PIN_5);
						break;
					case 1:
						GPIO_WriteHigh(GPIOB,GPIO_PIN_3);
						break;
					case 2:
						GPIO_WriteHigh(GPIOB,GPIO_PIN_1);
						break;
					case 3:
						GPIO_WriteHigh(GPIOC,GPIO_PIN_2);
						break;
				}
			}
		}
		
		
		//скорость надо поменять в любом случае
		
		ccrval = (u32)((mot_newscor[i]>0) ? mot_newscor[i] : (-mot_newscor[i]))*MAXPWM/127;
			
		switch (i) {
		case 0:
			TIM1->CCR1H = (uint8_t)(ccrval>> 8);
			TIM1->CCR1L = (uint8_t)(ccrval);
			break;
		case 1:
			TIM1->CCR2H = (uint8_t)(ccrval>> 8);
			TIM1->CCR2L = (uint8_t)(ccrval);
			break;
		case 2:
			TIM1->CCR3H = (uint8_t)(ccrval>> 8);
			TIM1->CCR3L = (uint8_t)(ccrval);
			break;
		case 3:
			TIM1->CCR4H = (uint8_t)(ccrval>> 8);
			TIM1->CCR4L = (uint8_t)(ccrval);
			break;
		}
		
	}
	
	for (i=0;i<4;i++) {
		mot_scor[i]=mot_newscor[i];
	}	
}

void main(void)
{
	BitStatus kn;
	uint8_t st;
	int fl=0;
	int i;
	long tmp;
	int znak;
	//ErrorStatus Swif = ERROR;
	//uint16_t DownCounter = CLK_TIMEOUT;
	//CLK_Source_TypeDef clock_master;
  
	//knold = RESET;
	//I2C_Send7bitAddress(0x48,I2C_DIRECTION_RX);
	
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);//16mhg
	//internal clock
	//CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
	
	//Delay(1000000);
	
	//GPIO_Init(GPIOD,GPIO_PIN_2,GPIO_MODE_OUT_OD_HIZ_SLOW);//blue en
	
	TIM4_TimeBaseInit(TIM4_PRESCALER_128, 124);//1sec!!!
  TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
  //TIM4->IER |= (uint8_t)TIM4_IT_UPDATE;
  
	/* enable interrupts */
	enableInterrupts();

	/* Enable TIM4 */
	TIM4_Cmd(ENABLE);
	
	//Delay(10000);
	
	//BEEP_LSICalibrationConfig(LSIMeasurment());
	//BEEP_Cmd(DISABLE);
	//BEEP_Init(BEEP_FREQUENCY_1KHZ);
	//BEEP_Cmd(ENABLE);
	//Delay(1000);
	//BEEP_Cmd(DISABLE);
	//Delay(100);
	
	//init pins
	GPIO_Init(GPIOB,GPIO_PIN_0|GPIO_PIN_1|GPIO_PIN_2|GPIO_PIN_3,GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(GPIOC,GPIO_PIN_1|GPIO_PIN_2|GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7,GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(GPIOD,GPIO_PIN_0|GPIO_PIN_2|GPIO_PIN_3|GPIO_PIN_4,GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(GPIOE,GPIO_PIN_5,GPIO_MODE_OUT_PP_LOW_FAST);
	
	//hc995 = 0;//vse vykl!
	//changeHC595();
		
	
	//init shim timer 1
	TIM1_DeInit();
	TIM1_TimeBaseInit(0, TIM1_COUNTERMODE_UP, MAXPWM, 0);
	/* Channel 1, 2,3 and 4 Configuration in PWM mode */
  
  /*
  TIM1_OCMode = TIM1_OCMODE_PWM2
  TIM1_OutputState = TIM1_OUTPUTSTATE_ENABLE
  TIM1_OutputNState = TIM1_OUTPUTNSTATE_ENABLE
  TIM1_Pulse = CCR1_Val
  TIM1_OCPolarity = TIM1_OCPOLARITY_LOW
  TIM1_OCNPolarity = TIM1_OCNPOLARITY_HIGH
  TIM1_OCIdleState = TIM1_OCIDLESTATE_SET
  TIM1_OCNIdleState = TIM1_OCIDLESTATE_RESET
  
  */
  
	TIM1_CCPreloadControl(DISABLE);
	
	TIM1_BDTRConfig(TIM1_OSSISTATE_DISABLE,
                     TIM1_LOCKLEVEL_OFF,
                     0,
                     TIM1_BREAK_DISABLE,
                     TIM1_BREAKPOLARITY_LOW,TIM1_AUTOMATICOUTPUT_DISABLE);
										 
	TIM1_OC1Init(TIM1_OCMODE_PWM2, TIM1_OUTPUTSTATE_DISABLE, TIM1_OUTPUTNSTATE_DISABLE,
               0, TIM1_OCPOLARITY_LOW, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET,
               TIM1_OCNIDLESTATE_RESET); 

  /*TIM1_Pulse = CCR2_Val*/
  TIM1_OC2Init(TIM1_OCMODE_PWM2,  TIM1_OUTPUTSTATE_DISABLE, TIM1_OUTPUTNSTATE_DISABLE,
               0, TIM1_OCPOLARITY_LOW, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET, 
               TIM1_OCNIDLESTATE_RESET);

  /*TIM1_Pulse = CCR3_Val*/
  TIM1_OC3Init(TIM1_OCMODE_PWM2,  TIM1_OUTPUTSTATE_DISABLE, TIM1_OUTPUTNSTATE_DISABLE,
               0, TIM1_OCPOLARITY_LOW, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET,
               TIM1_OCNIDLESTATE_RESET);

  /*TIM1_Pulse = CCR4_Val*/
  TIM1_OC4Init(TIM1_OCMODE_PWM2, TIM1_OUTPUTSTATE_DISABLE, 0, TIM1_OCPOLARITY_LOW,
               TIM1_OCIDLESTATE_SET);

  /* TIM1 counter enable */
  TIM1_CtrlPWMOutputs(DISABLE); //vse v preryvanii!

	TIM1_Cmd(ENABLE);

	//TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);

  /* TIM1 Main Output Enable */
  
	
	GPIO_Init(GPIOD,GPIO_PIN_6,GPIO_MODE_IN_PU_NO_IT);//UART RX
	
	//if (1==2) {
	//init uart RX only!
#ifdef STM8S003
	UART1_DeInit();
  UART1_Init((uint32_t)9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
              UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TX_DISABLE|UART1_MODE_RX_ENABLE);
	
	UART1_ITConfig(UART1_IT_RXNE_OR,ENABLE);
#else 
	UART2_DeInit();
  UART2_Init((uint32_t)9600, UART2_WORDLENGTH_8D, UART2_STOPBITS_1, UART2_PARITY_NO,
              UART2_SYNCMODE_CLOCK_DISABLE, UART2_MODE_TX_DISABLE|UART2_MODE_RX_ENABLE);
	
	UART2_ITConfig(UART2_IT_RXNE_OR,ENABLE);
#endif

	//}

	//TIM1->CCR1L = 200;
	TIM1_ITConfig(TIM1_IT_UPDATE|TIM1_IT_CC1|TIM1_IT_CC2|TIM1_IT_CC3|TIM1_IT_CC4, ENABLE);
	
	//ccrval = 4000;
	//TIM1->CCR2H = (uint8_t)(ccrval>> 8);
  //TIM1->CCR2L = (uint8_t)(ccrval);

	timetest=1;
	mot_newscor[0]=0;
	mot_newscor[1]=0;
	mot_newscor[2]=0;
	mot_newscor[3]=0;
	
	/* Infinite loop */
  while (1)
  {
		/*
		if (timetest==0) {
				u8 i;
				for (i=0;i<4;i++)
					mot_newscor[i]=-mot_newscor[i];
				changespeed();
				timetest = 10;
		}
		*/
		
		if (RXready==5) {
			u8 i;
			timetest = 3;
			changespeed();
			RXready=0;
		}
		
		if (timetest==0) {
			//все выключаем!
			u8 i;
			RXready=5;
			for (i=0;i<4;i++)
				mot_newscor[i]=0;
			changespeed();
			RXready=0;
			timetest = 3;
		}			
		
		//hc995 = 0b00001100;
		//changeHC595();
		//GPIO_WriteHigh(GPIOC,GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7);
		//GPIO_WriteHigh(GPIOA,GPIO_PIN_2);
		//GPIO_WriteHigh(GPIOD,GPIO_PIN_2|GPIO_PIN_3);
		//Delay(500);
		
		//hc995 = 0;
		//changeHC595();
		//GPIO_WriteLow(GPIOC,GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7);
		//GPIO_WriteLow(GPIOA,GPIO_PIN_2);
		//GPIO_WriteLow(GPIOD,GPIO_PIN_2|GPIO_PIN_3);
		//Delay(500);
		
  }
}

#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval : None
  */
void assert_failed(u8* file, u32 line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif


void Delay(u16 nCount)
{
    /* Decrement nCount value */
    timedelay=nCount;
		
		while (timedelay);
}

u16 timesec=1000;

INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
	if (timedelay) timedelay--;
	if (timesec) timesec--;
	
	{
		u8 i;
		for ( i=0;i<4;i++) {
			if (mot_time[i]) mot_time[i]--;
		}	
	}
	
	if (timesec==0) {
		//секундные события!
		if (timetest) timetest--;
		
		timesec = 1000;
	}	
	
	
	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
	
 }
 
 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
	//ochistili pending bit
	//надо включить все нижние ноги!
	//но только если скорость не нулевая! и нет блокировки!
	{
		u8 i;
		for (i=0;i<4;i++) {
			if (mot_scor[i] && mot_time[i]==0) {
				switch (i) {
					case 0:
						if (mot_scor[i] > 0) GPIO_WriteHigh(GPIOD,GPIO_PIN_0); //1NL
						else GPIO_WriteHigh(GPIOD,GPIO_PIN_2);//1NR
					break;
					case 1:
						if (mot_scor[i] > 0) GPIO_WriteHigh(GPIOC,GPIO_PIN_4); //2NL
						else GPIO_WriteHigh(GPIOC,GPIO_PIN_5);//2NR
					break;
					case 2:
						if (mot_scor[i] > 0) GPIO_WriteHigh(GPIOC,GPIO_PIN_6); //3NL
						else GPIO_WriteHigh(GPIOC,GPIO_PIN_7);//3NR
					break;
					case 3:
						if (mot_scor[i] > 0) GPIO_WriteHigh(GPIOD,GPIO_PIN_3); //4NL
						else GPIO_WriteHigh(GPIOD,GPIO_PIN_4);//4NR
					break;
				}
			}
		}
	}
}

/**
  * @brief Timer1 Capture/Compare Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
	if (TIM1_GetITStatus(TIM1_IT_CC1) != RESET)  //capture compare 1motor
	{
		TIM1_ClearITPendingBit(TIM1_IT_CC1);
		//для простоты все нижние выключим!
		GPIO_WriteLow(GPIOD,GPIO_PIN_0|GPIO_PIN_2); //1NRL
	}
	if (TIM1_GetITStatus(TIM1_IT_CC2) != RESET)  //capture compare 1motor
	{
		TIM1_ClearITPendingBit(TIM1_IT_CC2);
		//для простоты все нижние выключим!
		GPIO_WriteLow(GPIOC,GPIO_PIN_4|GPIO_PIN_5);//2NRL
	}
	if (TIM1_GetITStatus(TIM1_IT_CC3) != RESET)  //capture compare 1motor
	{
		TIM1_ClearITPendingBit(TIM1_IT_CC3);
		//для простоты все нижние выключим!
		GPIO_WriteLow(GPIOC,GPIO_PIN_6|GPIO_PIN_7); //3NRL
	}
	if (TIM1_GetITStatus(TIM1_IT_CC4) != RESET)  //capture compare 1motor
	{
		TIM1_ClearITPendingBit(TIM1_IT_CC4);
		//для простоты все нижние выключим!
		GPIO_WriteLow(GPIOD,GPIO_PIN_3|GPIO_PIN_4); //4NRL
	}
}


INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 {
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
		
		char c=0;
		/* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
#ifdef STM8S003		
		if (UART1_GetFlagStatus(UART1_FLAG_RXNE) != RESET )
			c = UART1_ReceiveData8();
#else
		if (UART2_GetFlagStatus(UART2_FLAG_RXNE) != RESET )
			c = UART2_ReceiveData8();
#endif
		
		//ждем 1 2 с1 с2 с3 с4 (с1+с2+с3+с4)
		
		if (RXready==5) return;
		
		if (RXready==2) {
			if (RXtek>=4) {
				u8 tmp=0;
				u8 i;
				
				for (i=0;i<4;i++) {
					tmp += mot_newscor[i];
				}
				
				if (tmp == c) RXready = 5;
				else RXready = 0;
			}			
			
			mot_newscor[RXtek] = c;
			RXtek++;
		}	else {
			if ((RXready==0) && (c==1) ) {
				RXready = 1;
			}
			else if ((RXready==1) && (c==2) ) {
				RXready = 2;
				RXtek=0;
			}	
			else RXready=0;
				
		}
 }