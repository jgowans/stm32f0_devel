#define STM32F051

#include <stdint.h>
#include "stm32f0xx.h"

void lock_crystal(void);
void unlock_crystal(void);
void toggle_LED_many_times(const uint32_t times_to_toggle);

void main(void) {
  RCC->AHBENR |= RCC_AHBENR_GPIOBEN; //enable clock for LED port
  GPIOB->MODER |= GPIO_MODER_MODER0_0;
  for(;;) {
    toggle_LED_many_times(200000);
    lock_crystal();
    toggle_LED_many_times(200000*6);
    unlock_crystal();
  }
}

void lock_crystal(void) {
  RCC->CR |= RCC_CR_HSEON; // enable HSE
  while(!(RCC->CR & RCC_CR_HSERDY)); // hange here until HSE ready
  // the following adds a wait state to Flash reads and enables the prefetch buffer. This may or may not be necessary...
  FLASH->ACR = FLASH_ACR_PRFTBE | FLASH_ACR_LATENCY;
  RCC->CFGR |= RCC_CFGR_PLLMULL6; // PLLCLK = HSE * 6 = 8 * 6 = 48 MHz = maximum
  RCC->CFGR |= RCC_CFGR_PLLSRC_HSE_PREDIV; // select HSE as source for PLL
  RCC->CR |= RCC_CR_PLLON; // enable the PLL
  while(!(RCC->CR & RCC_CR_PLLRDY)); // hang here until PLL ready
  RCC->CFGR |= RCC_CFGR_SW_PLL; // SYSCLK sourced from PLL
  while(!(RCC->CFGR & RCC_CFGR_SWS_PLL)); // hang until SYSLK switched
}

void unlock_crystal(void) {
  RCC->CFGR &= ~RCC_CFGR_SW; // clear the SYSCLK selection bits, causing SYSCLK to be sourced from HSI
  while(RCC->CFGR & RCC_CFGR_SWS_PLL); // hang until SYSLK no longer PLL
  RCC->CR &= ~RCC_CR_HSEON;
}

void toggle_LED_many_times(const uint32_t times_to_toggle) {
  for(uint32_t counter = 0; counter < times_to_toggle; counter++) {
    GPIOB->BSRR |= GPIO_BSRR_BS_0;
    GPIOB->BSRR |= GPIO_BSRR_BR_0;
  }
}

