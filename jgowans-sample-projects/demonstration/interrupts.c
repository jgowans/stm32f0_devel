// Interrupt handlers live in this file

#include <stdint.h>
#include "stm32f0xx.h"

void TIM14_IRQHandler(void) {
  static uint32_t pwm_value = 0;
  static uint32_t direction = 0;
  
  // ack the interrupt
  TIM14->SR &= ~TIM_SR_UIF;

  // set PWM's here dependant on direction

  if (pwm_value == 10) { // max value, start going down
    GPIOB->ODR = 0xFF;
    direction = -1; 
  } 
  if (pwm_value == 0) { // min value, start going up
    GPIOB->ODR = 0x00;
    direction = 1;
  }

  pwm_value += direction;
}
