// Interrupt handlers live in this file

#include <stdint.h>
#include "stm32f0xx.h"

void TIM14_IRQHandler(void) {
  static int16_t ccr3_value = 0;
  static int16_t ccr4_value = 0;
  static int16_t ccr3_to_add = 5;
  static int16_t ccr4_to_add = 6;
  static uint8_t interrupt_counter = 0;
  static int8_t direction = 0;

  
  // ack the interrupt
  TIM14->SR &= ~TIM_SR_UIF;

  // set PWM's here dependant on direction
  ccr3_value += ccr3_to_add;
  if (ccr3_value > 255 || ccr3_value < 0) {
    ccr3_to_add = ccr3_to_add * -1;
    ccr3_value += ccr3_to_add;
  }
  ccr4_value += ccr4_to_add;
  if (ccr4_value > 255 || ccr4_value < 0) {
    ccr4_to_add = ccr4_to_add * -1;
    ccr4_value += ccr4_to_add;
  }

  TIM2->CCR3 = ccr3_value;
  TIM2->CCR4 = ccr4_value;

  interrupt_counter += 1;
  if (interrupt_counter == 50) { // toggle after 100 interrupts
    interrupt_counter = 0;
    if (direction == 0) {
      GPIOB->ODR = 0x01;
      direction = 1;
    } else if (direction == 1) {
      GPIOB->ODR = GPIOB->ODR << 1;
      if (GPIOB->ODR == 0x80) {
        direction = -1;
      }
    } else if (direction == -1) {
      GPIOB->ODR = GPIOB->ODR >> 1;
      if (GPIOB->ODR == 0x01) {
        direction = 1;
      }
    }
  } 
}
