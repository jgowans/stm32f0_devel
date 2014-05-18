#define STM32F051

#include <stdint.h>
#include "stm32f0xx.h"

void init_leds(void);

void main(void) {
  init_leds();

  // set up a 0.1 s interrupt. 
  RCC->APB1ENR |= RCC_APB1ENR_TIM14EN; // clock to the timer
  TIM14->PSC = 8000;
  TIM14->ARR = 100; // period should be around 100 ms
  TIM14->DIER |= TIM_DIER_UIE; // enable the update event interrupt
  TIM14->CR1 |= TIM_CR1_CEN; // enable the counter

  // enable interrupt in NVIC
  NVIC_EnableIRQ(TIM14_IRQn);

  for(;;);
}

void TIM14_IRQHandler(void) {
  // ack interrupt
  TIM14->SR &= ~TIM_SR_UIF;

  GPIOB->ODR += 1;
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

