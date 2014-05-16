#include "stdint.h"
#include "stm32f0xx.h"

void init_leds(void);
void init_push_buttons(void);
uint32_t check_for_eeprom_magic(void); // will return 1 if magic found
void cycle_leds(void);
void test_potentiometres(void);
void test_temperature_sensor(void);
void write_magic_to_eeprom(void);
void serial_loopback(void);

uint8_t eeprom_magic = {0xDE, 0xAD, 0xBA, 0xBE};

void main(void) {
  init_leds();
  init_push_buttons();
  init_lcd();
  // flash some sort of welcome message
  lcd_string("Periphs init'd");

  if (check_for_eeprom_magic() == 0) {
    cycle_leds();
    test_potentiometres();
    test_temperature_sensor();
    write_magic_to_eeprom();
  }
  display_eeprom_success_screen();
  lock_crystal();
  serial_loopback();
  // USART to lookback mode displaying on LEDs 
  // test complete

}

void check_for_eeprom_magic(void) {
  uint32_t pos;
  // initialise EEPROM

  for(pos = 0; pos < sizeof(eeprom_magic); pos++) {
    if (eeprom_read_from_address(pos) != eeprom_magic[pos]) {
      return 0; 
    }
  }
  return 1;


}

void cycle_leds(void) {
  lcd_command(0x01); // clear screen
  lcd_string("Factory defaults");
  lcd_command(0xC0); // goto lower line
  lcd_string("Press S0");

  // enable the 200 ms interrupt. 
  // ISR toggles between 0xAA and 0x55, also changes RG PWM.

  // fix this to ensure ONLY the desired button is pressed
  while ((GPIOA->IDR & GPIO_IDR_0) == 0);
}

void test_potentiometres(void) {
  lcd_command(0x01); //clear screen
  lcd_string("Pots being read");
  lcd_command(0xC0); // goto lower line
  lcd_string("Press S1");

  // initialise ATD to POT0 (perhaps a new function?)

  lcd_two_line_write("Turn POT0 fully", "counterclockwise");
  while (ADC_value < 250);
  lcd_two_line_write("Turn POT0 fully", "clockwise");
  while (ADC_value > 5);

  // initialise ATD to POT1 (perhaps a new function?)

  lcd_two_line_write("Turn POT1 fully", "counterclockwise");
  while (ADC_value < 250);
  lcd_two_line_write("Turn POT1 fully", "clockwise");
  while (ADC_value > 5);

  while(1);
}

void test_temperature_sensor(void) {
  uint8_t sensor_value = 0;
  lcd_two_line_write("Testing temprtr", "sensor.");
  // initialise IIC

  while( (sensor_value > 30) || (sensor_value < 20) || !(push_button_pressed) ) {
    sensor_value = // TODO: read value here
  }

  while( /* TODO: push button not pressed */ ) {
    sensor_value = ;// TODO: read value here
}

void write_magic_to_eeprom(void) {
  uint32_t pos;
  // initialise EEPROM

 for(pos = 0; pos < sizeof(eeprom_magic); pos++) {
   eeprom_write_to_address(pos, eeprom_magic[pos]);
 }

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

