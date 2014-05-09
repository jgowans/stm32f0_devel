#include <stdint.h>
#include "stm32f0xx.h"

void main(void);

extern void lcd_init (void);
extern void lcd_string (unsigned char *instring);
extern void lcd_command (unsigned char command);


void main(void) {
	int i =0;
	lcd_init(); // set up LCD lines and send initialisation commands
	lcd_command(0x01);  //clear screen
	lcd_string("Hello World");
	lcd_command(0xC0); // go to lower line
	lcd_string("Revision 1");
	// set LEDs to outputs
	GPIOB->MODER |= (GPIO_MODER_MODER0_0 | GPIO_MODER_MODER1_0 | GPIO_MODER_MODER2_0 | GPIO_MODER_MODER3_0 | 
				GPIO_MODER_MODER4_0 | GPIO_MODER_MODER5_0 | GPIO_MODER_MODER6_0 | GPIO_MODER_MODER7_0);
	for(;;) {
		for(i=0; i < 65535; i++); // delay for a few hundred milliseconds
		GPIOB->ODR += 1; // increment the patten on the LEDs
	}
}
