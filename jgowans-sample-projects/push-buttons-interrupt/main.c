#include <stdint.h>
#include "stm32f0xx.h"

void main(void);
void init_leds(void);
void init_push_buttons(void);
void init_EXTI(void);
void init_NVIC(void);
void EXTI4_15_IRQHandler(void);

void main(void)
{
	init_leds();
	init_push_buttons();
	init_EXTI();
	init_NVIC();
	
	for(;;) {
		GPIOB->ODR += 1;
		for(volatile int i = 0; i < 65535; i++);
	}
	
}

void EXTI4_15_IRQHandler(void) {
	EXTI->PR |= EXTI_PR_PR12;
	GPIOB->ODR = 0x00;
}

void init_leds(void) {
	RCC->AHBENR |= RCC_AHBENR_GPIOBEN; //enable clock for LEDs
	GPIOB->MODER |= GPIO_MODER_MODER0_0; //set PB0 to output
	GPIOB->MODER |= GPIO_MODER_MODER1_0; //set PB1 to output
	GPIOB->MODER |= GPIO_MODER_MODER2_0; //set PB2 to output
	GPIOB->MODER |= GPIO_MODER_MODER3_0; //set PB3 to output
	GPIOB->MODER |= GPIO_MODER_MODER4_0; //set PB4 to output
	GPIOB->MODER |= GPIO_MODER_MODER5_0; //set PB5 to output
	GPIOB->MODER |= GPIO_MODER_MODER6_0; //set PB6 to output
	GPIOB->MODER |= GPIO_MODER_MODER7_0; //set PB7 to output
}

void init_push_buttons(void) {
	RCC->AHBENR |= RCC_AHBENR_GPIOBEN; //enable clock for push-buttons
	// set pins to inputs
	GPIOB->MODER &= ~GPIO_MODER_MODER12; //set PB12 to input
	GPIOB->MODER &= ~GPIO_MODER_MODER13; //set PB13 to input
	GPIOB->MODER &= ~GPIO_MODER_MODER14; //set PB14 to input
	GPIOB->MODER &= ~GPIO_MODER_MODER15; //set PB15 to input 
	// enable pull-up resistors
	GPIOB->PUPDR |= GPIO_PUPDR_PUPDR12_0; //enable pull-up for PB12
	GPIOB->PUPDR |= GPIO_PUPDR_PUPDR13_0; //enable pull-up for B13
	GPIOB->PUPDR |= GPIO_PUPDR_PUPDR14_0; //enable pull-up for B14
	GPIOB->PUPDR |= GPIO_PUPDR_PUPDR15_0; //enable pull-up for B15
}

void init_EXTI(void) {
	RCC->APB2ENR |= RCC_APB2ENR_SYSCFGCOMPEN; // clock for the system configuration controller
	SYSCFG->EXTICR[3] |= SYSCFG_EXTICR4_EXTI12_PB; // set interrupt 12 to be sourced from port B for EXTICR4
	EXTI->IMR |= EXTI_IMR_MR12; // un-mask the interrupt
	EXTI->RTSR |= EXTI_RTSR_TR12; // enable the rising edge trigger for interrupt 12
	
}
void init_NVIC(void) {
	NVIC_EnableIRQ(EXTI4_15_IRQn);
}