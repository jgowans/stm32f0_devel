#include <stdint.h>
#include "stm32f0xx.h"

void main(void);
void init_usart(void);
void delay(void);
void init_leds(void);

void main(void)
{
	unsigned char received = 'c';
	init_leds();
	GPIOB->ODR |= 0xAA;
	init_usart();
	for(;;) {
		while ( (USART2->ISR & USART_ISR_RXNE) == 0); // while receive IS empty, hang
		received = USART2->RDR;
		GPIOB->ODR = received;
		USART2->TDR = received+1;
		
	}
}

void delay(void) {
	volatile int i = 0;
	for(; i < 565535; i++);
}



void init_usart(void) {
	// clock to USART2
	RCC->APB1ENR |= RCC_APB1ENR_USART2EN;
	// clock to GPIOA
	RCC->AHBENR |= RCC_AHBENR_GPIOAEN;
	// PA2 and PA3 to AF
	GPIOA->MODER |= GPIO_MODER_MODER2_1;
	GPIOA->MODER |= GPIO_MODER_MODER3_1;
	// remap to correct AF
	GPIOA->AFR[0] |= (1 << 2*4); // remap pin 2 to AF1
	GPIOA->AFR[0] |= (1 << 3*4); // remap pin 3 to AF1

	// BRR = fclk / baud = 8e6 / 9600
	USART2->BRR = 833; 
	// enable with UE in CR1
	USART2->CR1 |= USART_CR1_UE;
	USART2->CR1 |= USART_CR1_RE;
	USART2->CR1 |= USART_CR1_TE;
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

