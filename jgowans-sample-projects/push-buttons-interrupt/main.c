#define STM32F051

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
	int i = 0;
	init_leds();
	init_push_buttons();
	init_EXTI();
	init_NVIC();
	
	for(;;) {
		GPIOB->ODR += 1;
		for(i = 0; i < 65535; i++);
	}
	
}

void EXTI0_1_IRQHandler(void) {
	// clear the interrupt pending bit by writing to it
	EXTI->PR |= EXTI_PR_PR0;
	// display a pattern on the LEDs
	GPIOB->ODR = 0x00;
}

void EXTI2_3_IRQHandler(void) {
	// clear the interrupt pending bit by writing to it
	EXTI->PR |= EXTI_PR_PR0;
	// display a pattern on the LEDs
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
	RCC->AHBENR |= RCC_AHBENR_GPIOAEN; //enable clock for push-buttons
	// set pins to inputs
	GPIOA->MODER &= ~GPIO_MODER_MODER0; //set PA0 to input
	GPIOA->MODER &= ~GPIO_MODER_MODER1; //set PA2 to input
	GPIOA->MODER &= ~GPIO_MODER_MODER2; //set PA3 to input
	GPIOA->MODER &= ~GPIO_MODER_MODER3; //set PA3 to input 
	// enable pull-up resistors
	GPIOA->PUPDR |= GPIO_PUPDR_PUPDR0_0; //enable pull up for PA0
	GPIOA->PUPDR |= GPIO_PUPDR_PUPDR1_0; //enable pull up for PA1
	GPIOA->PUPDR |= GPIO_PUPDR_PUPDR2_0; //enable pull up for PA2
	GPIOA->PUPDR |= GPIO_PUPDR_PUPDR3_0; //enable pull up for PA3
}

void init_EXTI(void) {
	RCC->APB2ENR |= RCC_APB2ENR_SYSCFGCOMPEN; // clock for the system configuration controller
	SYSCFG->EXTICR[0] |= SYSCFG_EXTICR1_EXTI0_PA; // set interrupt 12 to be sourced from port B for EXTICR4
	EXTI->IMR |= EXTI_IMR_MR0; // un-mask the interrupt
	EXTI->FTSR |= EXTI_FTSR_TR0; // enable the falling edge trigger for interrupt 12
	
}
void init_NVIC(void) {
	NVIC_EnableIRQ(EXTI0_1_IRQn);
	//NVIC_EnableIRQ(EXTI2_3_IRQn);
}
