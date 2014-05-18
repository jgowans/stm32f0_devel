#define STM32F051

#include <stdint.h>
#include "stm32f0xx.h"

void main(void) {
  RCC->AHBENR |= RCC_AHBENR_GPIOBEN; //enable clock for LEDs
  GPIOB->MODER |= GPIO_MODER_MODER0_0; //set PB0 to output

  // set pin to alternate function
  // map pin to timer

  RCC->APB1ENR |= RCC_APB1ENR_TIM14EN; // clock to the timer
  TIM14->PSC = 8000;
  TIM14->ARR = 100; // period should be around 10 ms
  // capture compare should be around 70% on the one pin
  // and 95% on the other pin
  TIM14->CR1 |= TIM_CR1_CEN; // enable the counter

  for(;;);
}

