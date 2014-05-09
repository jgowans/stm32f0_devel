/*
Copyright (C) Samuel Ginsberg 2004
Porting to STM32F0 dev board by James Gowans, 2014
LCD lines are as follows:
LCD_RS = PC14
LCD_E = PC15
LCD_D4 = PB8
LCD_D5 = PB9
LCD_D6 = PB10
LCD_D7 = PB11
*/

#include "stm32f0xx.h" /* include peripheral declarations */
#define delay_cnt 0x1FF

void delay (void);
void lcd_command (unsigned char command);
void pulse_strobe (void);
void lcd_put (unsigned char character);

//============================================================================

void lcd_string (unsigned char *instring) {
	char count=0;
	while (instring[count]) {
		lcd_put (instring[count]);
		count++;
	}
}	  

//============================================================================

void lcd_init () {
	/*This function sets up the port lines for the LCD and initializes
	the LCD module for use.*/
	unsigned int count;
	for (count=0;count<200;count++) delay(); //allow the LCD some power up time
	// set the relevant pins to outputs
	RCC->AHBENR |= RCC_AHBENR_GPIOCEN;
	RCC->AHBENR |= RCC_AHBENR_GPIOBEN; 
	GPIOC->MODER |= GPIO_MODER_MODER14_0;
	GPIOC->MODER |= GPIO_MODER_MODER15_0;
	GPIOB->MODER |= GPIO_MODER_MODER8_0;
	GPIOB->MODER |= GPIO_MODER_MODER9_0;
	GPIOB->MODER |= GPIO_MODER_MODER10_0;
	GPIOB->MODER |= GPIO_MODER_MODER11_0;
	for (count=0;count<200;count++) delay(); //allow the LCD some power up time

	lcd_command (0x33); //power up initialization for the lcd
	lcd_command (0x33); //power up initialization for the lcd
	lcd_command (0x32); //set LCD into 4 bit mode
	lcd_command (0x0C); //turn display on and set up cursor
	lcd_command (0x28); //set up 2 lines and character size
	lcd_command (0x01); //clear display
}

//============================================================================

void lcd_command (unsigned char command) {
	/*This function sends a command to the LCD. Care is taken not to 
	interfere with the other lines on the port.
	Useful commands:
	0x01: Clear screen
	0x02: Cursor home
	0xC0: Line 2*/
	GPIOC->BSRR |= GPIO_BSRR_BR_14;// pull RS (PC14) low
	// clear data lines
	GPIOB->BSRR |= (GPIO_BSRR_BR_8 | GPIO_BSRR_BR_9 | GPIO_BSRR_BR_10 | GPIO_BSRR_BR_11);
	// upper nibble to data lines
	GPIOB->BSRR |= (command & 0xF0) << 4; // shift from bit[7:0] to bit[11:4]
	pulse_strobe ();
	// clear data lines
	GPIOB->BSRR |= (GPIO_BSRR_BR_8 | GPIO_BSRR_BR_9 | GPIO_BSRR_BR_10 | GPIO_BSRR_BR_11);
	// lower nibble to data lines
	GPIOB->BSRR |= (command & 0x0F) << 8; // shift from bit[7:0] to bit[15:8]
	pulse_strobe ();
}

//============================================================================

void lcd_put (unsigned char character) {
	//Puts a single character on the LCD at the next position on the screen.
	//The character to be printed is in the input parameter. For numbers, letters 
	//and other common characters the ASCII code will produce correct display.
	//Refer to the Hitachi HD44780 datasheet for full character set information.
	GPIOC->BSRR |= GPIO_BSRR_BS_14;// pull RS (PC14) high
	// clear data lines
	GPIOB->BSRR |= (GPIO_BSRR_BR_8 | GPIO_BSRR_BR_9 | GPIO_BSRR_BR_10 | GPIO_BSRR_BR_11);
	// upper nibble to data lines
	GPIOB->BSRR |= (character & 0xF0) << 4; // shift from bit[7:0] to bit[11:4]
	pulse_strobe ();
	// clear data lines
	GPIOB->BSRR |= (GPIO_BSRR_BR_8 | GPIO_BSRR_BR_9 | GPIO_BSRR_BR_10 | GPIO_BSRR_BR_11);
	// lower nibble to data lines
	GPIOB->BSRR |= (character & 0x0F) << 8; // shift from bit[7:0] to bit[15:8]
	pulse_strobe ();
}

//============================================================================

void delay (void)
//a delay used by the LCD functions.
{unsigned int count;
for (count=0;count<delay_cnt;count++);
}

//============================================================================

void pulse_strobe (void)
//Pulse the strobe line of the LCD to indicate that data is ready.
{
delay ();
GPIOC->BSRR |= GPIO_BSRR_BS_15;// pull E (PC15) high
delay ();
GPIOC->BSRR |= GPIO_BSRR_BR_15;// pull E (PC15) low
delay ();
GPIOC->BSRR |= GPIO_BSRR_BS_15;// pull E (PC15) high
}                     

//============================================================================
