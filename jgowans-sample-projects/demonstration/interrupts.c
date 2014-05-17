// Interrupt handlers live in this file

#include <stdint.h>
#include "stm32f0xx.h"

void TIM2_IRQHandler(void) {
  static uint32_t irq_counter = 0;
  static uint32_t direction = 0;
  if (irq_counter  == 10) {
    if (direction == 0) {
      GPIOB->ODR = 0xAA;
      direction = 1; 
    } else {
      GPIOB->ODR = 0x55;
      direction = 0;
    }
  }

  // set PWM's here dependant on direction

}
