#include "stdint.h"
#include "stm32f0xx.h"

void init_leds(void);
void init_push_buttons(void);
void stage0(void);
void stage1(void);
void stage2(void);
void stage3(void);

void main(void) {
	init_leds();
	init_push_buttons();
	// display welcome message and cycle through LEDs
	// wait for pushbutton S0 event
	stage0();
	
	// read pot 1 value to LEDs 
	// read pot 2 value to LCD
	// wait for pushbutton S1 event
	stage1();

	// read temperature sensor value to LEDs. Ensure in range 15 to 30
	// engage PLL
	// wait fir pushbutton S2 event

	// test EEPROM
	// output table mountain
	// wait for push button S3 event

	// USART to lookback mode displaying on LEDs 
	// test complete

}

void stage0(void) {
	lcd_init(); // set up lines and send initialisation commands to LCD
	lcd_command(0x01); // clear screen
	lcd_string("Factory defaults");
	lcd_command(0xC0); // goto lower line
	lcd_string("Press S0");

	while ((GPIOA->IDR & GPIO_IDR_0) == 0) {
		for(int i = 0; i < 65535; i++);
		GPIOB->ODR += 1;
	}
}

void stage1(void) {
	lcd_command(0x01); //clear screen
	lcd_string("Pots being read");
	lcd_command(0xC0); // goto lower line
	lcd_string("Press S1");

	while(1);
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

void init_push_buttons(void) {
        RCC->AHBENR |= RCC_AHBENR_GPIOAEN; //enable clock for push-buttons
        // set pins to inputs
        GPIOA->MODER &= ~GPIO_MODER_MODER0; //set PA0 to input
        GPIOA->MODER &= ~GPIO_MODER_MODER1; //set PA1 to input
        GPIOA->MODER &= ~GPIO_MODER_MODER2; //set PA2 to input
        GPIOA->MODER &= ~GPIO_MODER_MODER3; //set PA3 to input
        // enable pull-up resistors
        GPIOA->PUPDR |= GPIO_PUPDR_PUPDR0_1; //enable pull-down for PA0
        GPIOA->PUPDR |= GPIO_PUPDR_PUPDR1_1; //enable pull-down for PA1
        GPIOA->PUPDR |= GPIO_PUPDR_PUPDR2_1; //enable pull-down for PA2
        GPIOA->PUPDR |= GPIO_PUPDR_PUPDR3_1; //enable pull-down for PA3
}
