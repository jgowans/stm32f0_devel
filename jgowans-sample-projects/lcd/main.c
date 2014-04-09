#include <stdint.h>
#include "stm32f0xx.h"

void main(void);

extern void lcd_init (void);
extern void lcd_string (unsigned char *instring);
extern void lcd_command (unsigned char command);


void main(void) {
	int i =0;
	lcd_init();
	lcd_command(0x01);  //clear screen
	lcd_string("Hello Tommy.");
	GPIOB->MODER |= GPIO_MODER_MODER0_0;
	GPIOB->BSRR |= GPIO_BSRR_BS_0;
	for(;;) {
		i++;
	}
}
