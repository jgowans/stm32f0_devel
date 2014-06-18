#define STM32F051

#include <stdint.h>
#include "stm32f0xx.h"

// This projects demonstrates PWM on the RG LED
// Red:   PB10, TIM2_CH3
// Green: PB11, TIM2_CH4
// Both run on AF2

void init_timer(void);

void main(void) {
  init_timer();
  for(;;);
}

void init_timer(void) {
  RCC->AHBENR |= RCC_AHBENR_GPIOBEN;
  RCC->APB1ENR |= RCC_APB1ENR_TIM2EN;

  GPIOB->MODER |= GPIO_MODER_MODER10_1; // PB10 = AF
  GPIOB->MODER |= GPIO_MODER_MODER11_1; // PB11 = AF
  GPIOB->AFR[1] |= (2 << (4*(10 - 8))); // PB10_AF = AF2 (ie: map to TIM2_CH3)
  GPIOB->AFR[1] |= (2 << (4*(11 - 8))); // PB11_AF = AF2 (ie: map to TIM2_CH4)

  TIM2->ARR = 8000;  // f = 1 KHz
  // specify PWM mode: OCxM bits in CCMRx. We want mode 1
  TIM2->CCMR2 |= (TIM_CCMR2_OC3M_2 | TIM_CCMR2_OC3M_1); // PWM Mode 1
  TIM2->CCMR2 |= (TIM_CCMR2_OC4M_2 | TIM_CCMR2_OC4M_1); // PWM Mode 1 
  // set PWM percantages
  TIM2->CCR3 = 20 * 80; // Red = 20%
  TIM2->CCR4 = 90 * 80; // Green = 90%

  // enable the OC channels
  TIM2->CCER |= TIM_CCER_CC3E;
  TIM2->CCER |= TIM_CCER_CC4E;

  TIM2->CR1 |= TIM_CR1_CEN; // counter enable
}
