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
#include "lcd_stm32f0.h"
#define delay_cnt 0x1FF

enum TypeOfCharacter {
  COMMAND = 0,
  TEXT = 1
};


void delay (void);
void pulse_strobe (void);
void lcd_put (uint8_t character, enum TypeOfCharacter ch_type);

//============================================================================

void lcd_string(uint8_t *string_to_print) {
  uint32_t count=0;
  while (string_to_print[count] != 0) {
    lcd_put (string_to_print[count], TEXT);
    count++;
  }
}
void lcd_two_line_write(uint8_t* line1, uint8_t line2) {
  lcd_command(LCD_CLEAR_DISPLAY);
  lcd_string(line1);
  lcd_command(LCD_GOTO_LINE_2);
  lcd_string(line2);
}

//============================================================================

void lcd_init () {
  /*This function sets up the port lines for the LCD and initializes
  the LCD module for use.*/
  uint32_t count;
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

  lcd_command(LCD_EIGHT_BIT_MODE); // 0x33
  lcd_command(LCD_EIGHT_BIT_MODE); // 0x33
  lcd_command(LCD_FOUR_BIT_MODE); // 0x32
  lcd_command(LCD_DISPLAY_ON); // 0x0C
  lcd_command(LCD_FOUR_BIT_TWO_LINE_MODE); //0x28
  lcd_command(LCD_CLEAR_DISPLAY); // 0x01*/
}

//============================================================================

void lcd_command (enum LcdCommand command) {
  //This function sends a command to the LCD. 
  //Care is taken not to interfere with the other lines on the port.
  lcd_put((uint8_t)command, COMMAND);
}

//============================================================================

void lcd_put (uint8_t character, enum TypeOfCharacter ch_type) {
  //Puts a single character on the LCD at the next position on the screen.
  //The character to be printed is in the input parameter. For numbers, letters 
  //and other common characters the ASCII code will produce correct display.
  //Refer to the Hitachi HD44780 datasheet for full character set information.
  if (ch_type == TEXT) {
    GPIOC->BSRR |= GPIO_BSRR_BS_14;// pull RS (PC14) high
  } else if (ch_type == COMMAND) {
    GPIOC->BSRR |= GPIO_BSRR_BR_14;// pull RS (PC14) low
  }
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

void delay (void) {
  //a delay used by the LCD functions.
  volatile uint32_t count;
  for (count=0;count<delay_cnt;count++);
}

//============================================================================

void pulse_strobe (void) {
  //Pulse the strobe line of the LCD to indicate that data is ready.
  delay ();
  GPIOC->BSRR |= GPIO_BSRR_BS_15;// pull E (PC15) high
  delay ();
  GPIOC->BSRR |= GPIO_BSRR_BR_15;// pull E (PC15) low
  delay ();
  GPIOC->BSRR |= GPIO_BSRR_BS_15;// pull E (PC15) high
}                     

//============================================================================
