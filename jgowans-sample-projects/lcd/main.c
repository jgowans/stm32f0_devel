#define STM32F051

#include <stdint.h>
#include "stm32f0xx.h"
#include "lcd_stm32f0.h"

void main(void);

extern void lcd_init (void);


void main(void) {
  int i =0;
  lcd_init(); // set up LCD lines and send initialisation commands
  lcd_command(LCD_CLEAR_DISPLAY);
  lcd_string("Hello World");
  lcd_command(LCD_GOTO_LINE_2); // go to lower line
  lcd_string("Revision 1 new");
  // set LEDs to outputs
  GPIOB->MODER |= (GPIO_MODER_MODER0_0 | GPIO_MODER_MODER1_0 | GPIO_MODER_MODER2_0 | GPIO_MODER_MODER3_0 | 
        GPIO_MODER_MODER4_0 | GPIO_MODER_MODER5_0 | GPIO_MODER_MODER6_0 | GPIO_MODER_MODER7_0);
  for(;;) {
    for(i=0; i < 65535; i++); // delay for a few hundred microseconds
    GPIOB->ODR += 1; // increment the patten on the LEDs
  }
}
