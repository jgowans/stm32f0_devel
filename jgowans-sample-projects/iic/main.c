#define STM32F051

#include <stdint.h>
#include "stm32f0xx.h"

#define TC74ADDR_READ 0b10010001
#define TC74ADDR_WRITE 0b10010000

void main(void);
void init_iic(void);
void init_leds(void);

void main(void) {
	init_leds();
	init_iic();
	for(;;) {
		// set addressing mode in ADD10
		//set slave address in SADD
		I2C2->CR2 |= TC74ADDR_READ;
		I2C2->CR2 |= (1 << 16); // set NBYTES to 1?
		// send start and address with read byte. Goes into TXDR
		// indicate we are going to be doing a read
		I2C2->CR2 |= I2C_CR2_RD_WRN;
		// START and STOP done in CR2
		I2C2->CR2 |= I2C_CR2_START;
		// wait for ACK (start bit reset)
		// wait for TC flag
		while ((I2C2->ISR & I2C_ISR_RXNE) == 0);
		// clock in a byte
		GPIOB->ODR = I2C2->RXDR;
		// STOP condition
		I2C2->CR2 |= I2C_CR2_STOP;
		// wait for RXNE==1
		// write to LEDs
	}
}

void init_iic(void) {
	// enable clock to port B
	RCC->AHBENR |= RCC_AHBENR_GPIOFEN;
	// set SCLK (PF6) to alternate function, open drain
	GPIOF->MODER |= GPIO_MODER_MODER6_1;
	GPIOF->OTYPER |= GPIO_OTYPER_OT_6;
	// set SDA (PF7) to alternate function, open drain
	GPIOF->MODER |= GPIO_MODER_MODER7_1;
	GPIOF->OTYPER |= GPIO_OTYPER_OT_7;
	// PF6 and PF7 only have 1 alternate function, so it's not necessary to map them
	// set up IIC stuff
	
	// enable clock to I2C2
	RCC->APB1ENR |= RCC_APB1ENR_I2C2EN;
	// disable the periperal
	I2C2->CR1 &= ~I2C_CR1_PE;
	// configure timing in PRESC, SCLDEL, SDADEL in TIMINGR
	I2C2->TIMINGR |= (0x13 << 0); // SCLL
	I2C2->TIMINGR |= (0x0F << 8); // SCLH
	I2C2->TIMINGR |= (0x02 << 16); // SDADEL
	I2C2->TIMINGR |= (0x04 << 20); // SCLDEL
	I2C2->TIMINGR |= (1 << 28);// PRESC
	// enable I2C
	I2C2->CR1 |= I2C_CR1_PE;
}

void init_leds(void) {
	RCC->AHBENR |= RCC_AHBENR_GPIOBEN; //enable clock for LEDs
	GPIOB->MODER |= GPIO_MODER_MODER0_0; //set PB0 to output
	GPIOB->MODER |= GPIO_MODER_MODER1_0; //set PB1 to output
	GPIOB->MODER |= GPIO_MODER_MODER2_0; //set PB2 to output
	GPIOB->MODER |= GPIO_MODER_MODER3_0; //set PB3 to output
	GPIOB->MODER |= GPIO_MODER_MODER4_0; //set PB4 to output
	GPIOB->MODER |= GPIO_MODER_MODER5_0; //set PB5 to output
	GPIOB->MODER |= GPIO_MODER_MODER6_0; //set PB6 to output
	GPIOB->MODER |= GPIO_MODER_MODER7_0; //set PB7 to output
}
