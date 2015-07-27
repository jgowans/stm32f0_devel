#define STM32F051

#include <stdint.h>
#include "stm32f0xx.h"
#include "mountain.h"

void main(void);
static void init_dac(void);
static void init_dma(void);
static void init_tim2(void);

void TIM2_IRQHandler(void) {
    TIM2->SR &= ~TIM_SR_UIF;
    GPIOB->ODR += 1;
}

extern const uint16_t *table_mountain;

void main(void)
{
    uint32_t i;
    RCC->AHBENR |= RCC_AHBENR_GPIOBEN;
    GPIOB->MODER = 0x00005555;
    GPIOB->ODR = 0x0000;
    NVIC_EnableIRQ(15);
    init_dac();
    init_dma();
    init_tim2();
    for(;;) {
        GPIOB->ODR = DMA1->ISR;
    }
}

static void init_dac(void) {
    RCC->APB1ENR |= RCC_APB1ENR_DACEN;
    RCC->AHBENR |= RCC_AHBENR_GPIOAEN;
    GPIOA->MODER |= GPIO_MODER_MODER4;// PA4 as analogue
    DAC->CR |= DAC_CR_EN1;
    DAC->CR |= DAC_CR_BOFF1; //disable the buffer to increase voltage swing
}

static void init_dma(void) {
    RCC->AHBENR |= RCC_AHBENR_DMAEN;
    DMA1_Channel2->CPAR = (uint32_t)(&(DAC->DHR12R1));
    DMA1_Channel2->CMAR = (uint32_t)table_mountain;
    DMA1_Channel2->CNDTR = mountain_length();
    DMA1_Channel2->CCR |= DMA_CCR_DIR;  //read from memory
    DMA1_Channel2->CCR |= DMA_CCR_CIRC;
    DMA1_Channel2->CCR |= DMA_CCR_PSIZE_0; //half word
    DMA1_Channel2->CCR |= DMA_CCR_MSIZE_0; //half word
    DMA1_Channel2->CCR |= DMA_CCR_MINC;
    DMA1_Channel2->CCR |= DMA_CCR_EN;
}

static void init_tim2(void) {
    RCC->APB1ENR |= RCC_APB1ENR_TIM2EN;
    TIM2->PSC = 50;
    TIM2->ARR = 50;
    TIM2->CR2 |= TIM_CR2_CCDS; //not sure...
    TIM2->DIER |= TIM_DIER_UDE;
    TIM2->CR1 |= TIM_CR1_CEN;
}
