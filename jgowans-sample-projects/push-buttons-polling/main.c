#define STM32F051

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
    if ((GPIOA->IDR & GPIO_IDR_0) == 0 ) { GPIOB->ODR = 0x03; }
    else if ((GPIOA->IDR & GPIO_IDR_1) == 0) { GPIOB->ODR = 0x0C; }
    else if ((GPIOA->IDR & GPIO_IDR_2) == 0) { GPIOB->ODR = 0x30; }
    else if ((GPIOA->IDR & GPIO_IDR_3) == 0) { GPIOB->ODR = 0xC0; }
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
  RCC->AHBENR |= RCC_AHBENR_GPIOAEN; //enable clock for push-buttons
  // set pins to inputs
  GPIOA->MODER &= ~GPIO_MODER_MODER0; //set PA0 to input
  GPIOA->MODER &= ~GPIO_MODER_MODER1; //set PA1 to input
  GPIOA->MODER &= ~GPIO_MODER_MODER2; //set PA2 to input
  GPIOA->MODER &= ~GPIO_MODER_MODER3; //set PA3 to input
  // enable pull-down resistors
  GPIOA->PUPDR |= GPIO_PUPDR_PUPDR0_0; //enable pull up for PA0
  GPIOA->PUPDR |= GPIO_PUPDR_PUPDR1_0; //enable pull up for PA1
  GPIOA->PUPDR |= GPIO_PUPDR_PUPDR2_0; //enable pull up for PA2
  GPIOA->PUPDR |= GPIO_PUPDR_PUPDR3_0; //enable pull up for PA3
}
