#define STM32F051

#include <stdint.h>
#include "stm32f0xx.h"

void main(void);
void init_leds(void);
void init_adc(void);

void main(void)
{
    uint32_t delay_cnt;
  init_leds();
  init_adc();
  
  for(;;) {
    // start conversion
    ADC1->CR |= ADC_CR_ADSTART;
    // wait for end of conversion: EOC == 1. Not necessary to clear EOC as we read from DR
    while((ADC1->ISR & ADC_ISR_EOC) == 0);
    GPIOB->ODR = ADC1->DR;
    for(delay_cnt = 0; delay_cnt < 1000000; ++delay_cnt);
  }
  
}

void init_leds(void) {
  RCC->AHBENR |= RCC_AHBENR_GPIOBEN;   //enable clock for LEDs
  GPIOB->MODER |= GPIO_MODER_MODER0_0; //set PB0 to output
  GPIOB->MODER |= GPIO_MODER_MODER1_0; //set PB1 to output
  GPIOB->MODER |= GPIO_MODER_MODER2_0; //set PB2 to output
  GPIOB->MODER |= GPIO_MODER_MODER3_0; //set PB3 to output
  GPIOB->MODER |= GPIO_MODER_MODER4_0; //set PB4 to output
  GPIOB->MODER |= GPIO_MODER_MODER5_0; //set PB5 to output
  GPIOB->MODER |= GPIO_MODER_MODER6_0; //set PB6 to output
  GPIOB->MODER |= GPIO_MODER_MODER7_0; //set PB7 to output
}

void init_adc(void) {
  RCC->APB2ENR |= RCC_APB2ENR_ADCEN; //enable clock for ADC
  RCC->AHBENR |= RCC_AHBENR_GPIOAEN; //enable clock for port which ADC samples from
  GPIOA->MODER |= GPIO_MODER_MODER5; //set PA5 to analogue mode
  ADC1->CHSELR |= ADC_CHSELR_CHSEL5; // select channel 5
  ADC1->CFGR1 |= ADC_CFGR1_RES_1;    // resolution to 8 bit 
  ADC1->CR |= ADC_CR_ADCAL;         // set ADCAL high and wait for it to go low
  while( (ADC1->CR & ADC_CR_ADCAL) != 0);
  ADC1->CR |= ADC_CR_ADEN;           // set ADEN=1 in the ADC_CR register
  while((ADC1->ISR & ADC_ISR_ADRDY) == 0); //wait until ADRDY==1 in ADC_ISR
}
