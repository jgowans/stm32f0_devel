#define STM32F051

#include <stdint.h>
#include "stm32f0xx.h"

// By Wolfgang Wieser, heavily based on:
// http://fun-tech.se/stm32/OlimexBlinky/mini.php

#define STACK_TOP 0x20000800   // just a tiny stack for demo

void delay(void);
int main(void);
void display(uint32_t);

int main(void)
{
  uint8_t count = 0;
    RCC->AHBENR |= RCC_AHBENR_GPIOBEN;
	GPIOB->MODER = 0x00005555;
	GPIOB->ODR = 8;
	for (;;) {
		delay();
		display(count++);
	}
}

void delay(void) {
    volatile uint32_t i = 0;
	for(; i < 65535; i++);
}

void display(uint32_t num) {
  uint32_t to_disp = num/4;
  GPIOB->ODR = to_disp;
}
