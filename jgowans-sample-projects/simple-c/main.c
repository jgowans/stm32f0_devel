#define STM32F051

#include <stdint.h>
#include "stm32f0xx.h"

int main(void) {
  volatile uint32_t my_variale_foobar = 0;
  *((uint8_t *)TIM2_BASE) = 0xBE;
  for(;;) {
    my_variale_foobar++;
  }
        return 0;
}
