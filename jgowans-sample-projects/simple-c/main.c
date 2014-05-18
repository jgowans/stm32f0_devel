#define STM32F051

#include <stdint.h>
#include "stm32f0xx.h"

void main(void) {
	*((uint8_t *)TIM2_BASE) = 0xBE;
	volatile uint32_t my_variale_foobar = 0;
	for(;;) {
		my_variale_foobar++;
	}
}
