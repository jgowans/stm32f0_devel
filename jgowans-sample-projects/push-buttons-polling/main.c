#include <stdint.h>
#include "stm32f0xx.h"

void main(void);
void init_leds(void);
void init_push_buttons(void);

void main(void)
{
	init_leds();
	init_push_buttons();
	
	for(;;) {
		if ((GPIOB->IDR & GPIO_IDR_12) == 0) { GPIOB->ODR = 0x03; }
		else if ((GPIOB->IDR & GPIO_IDR_13) == 0) { GPIOB->ODR = 0x0C; }
		else if ((GPIOB->IDR & GPIO_IDR_14) == 0) { GPIOB->ODR = 0x30; }
		else if ((GPIOB->IDR & GPIO_IDR_15) == 0) { GPIOB->ODR = 0xC0; }
		else { GPIOB->ODR = 0x00; }
	}
	
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