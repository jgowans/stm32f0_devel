#define STM32F051

#include <stdint.h>
#include "stm32f0xx.h"

void main(void);
void init_usart(void);
void delay(void);
void init_leds(void);

void main(void) {
  unsigned char received = 'c';
  init_leds();
  GPIOB->ODR |= 0xAA;
  init_usart();
  for(;;) {
    while ( (USART1->ISR & USART_ISR_RXNE) == 0); // while receive IS empty, hang
    received = USART1->RDR;
    GPIOB->ODR = received;
    USART1->TDR = received+1;
  }
}

void delay(void) {
  volatile int i = 0;
  for(; i < 565535; i++);
}



void init_usart(void) {
  // clock to USART1
  RCC->APB2ENR |= RCC_APB2ENR_USART1EN;
  // clock to GPIOA
  RCC->AHBENR |= RCC_AHBENR_GPIOAEN;
  // PA9 and PA10 to AF
  GPIOA->MODER |= GPIO_MODER_MODER9_1;
  GPIOA->MODER |= GPIO_MODER_MODER10_1;
  // remap to correct AF
  GPIOA->AFR[1] |= (1 << (1*4)); // remap pin 9 to AF1
  GPIOA->AFR[1] |= (1 << (2*4)); // remap pin 10 to AF1

  // BRR = fclk / baud = 8e6 / 9600
  USART1->BRR = 833; 
  // enable with UE in CR1
  USART1->CR1 |= USART_CR1_UE;
  USART1->CR1 |= USART_CR1_RE;
  USART1->CR1 |= USART_CR1_TE;
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

