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
		I2C1->CR2 |= (1 << 16); // set NBYTES to 1?
		// send start and address with read byte. Goes into TXDR
		I2C1->CR2 |= I2C_CR2_RD_WRN;
		// START and STOP done in CR2
		I2C1->CR2 |= I2C_CR2_START;
		// wait for ACK (start bit reset)
		// clock in a byte
		// STOP condition
		I2C1->CR2 |= I2C_CR2_STOP;
		// wait for RXNE==1
		// write to LEDs
	}
}

void init_iic(void) {
	// enable clock to port B
	RCC->AHBENR |= RCC_AHBENR_GPIOBEN;
	// set SCLK (PB8) to alternate function, open drain, with pull-up
	GPIOB->MODER |= GPIO_MODER_MODER8_1;
	GPIOB->OTYPER |= GPIO_OTYPER_OT_8;
	GPIOB->PUPDR |= GPIO_PUPDR_PUPDR8_0;
	// set SDA (PB9) to alternate function, open drain with pull-up
	GPIOB->MODER |= GPIO_MODER_MODER9_1;
	GPIOB->OTYPER |= GPIO_OTYPER_OT_9;
	GPIOB->PUPDR |= GPIO_PUPDR_PUPDR9_0;
	// map PB8 and PB9 to I2C1
	GPIOB->AFR[1] |= 0x01; // PB8 to AF1
	GPIOB->AFR[1] |= (0x01 << 4); // PB9 to AF1
	// set up IIC stuff
	
	// enable clock to I2C1
	RCC->APB1ENR |= RCC_APB1ENR_I2C1EN;
	// configure timing in PRESC, SCLDEL, SDADEL in TIMINGR
	I2C1->TIMINGR |= (0x13 << 0); // SCLL
	I2C1->TIMINGR |= (0x0F << 8); // SCLH
	I2C1->TIMINGR |= (0x02 << 16); // SDADEL
	I2C1->TIMINGR |= (0x04 << 20); // SCLDEL
	I2C1->TIMINGR |= (1 << 28);// PRESC
	// set addressing mode in ADD10
	//set slave address in SADD
	I2C1->CR2 |= TC74ADDR_READ;
	// enable I2C
	I2C1->CR1 |= I2C_CR1_PE;
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