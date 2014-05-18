#define STM32F051

#include "stdint.h"
#include "stm32f0xx.h"
#include "eeprom_lib.h"
#include "temp_sensor_lib.h"
#include "lcd_stm32f0.h"

uint32_t check_for_eeprom_magic(void); // will return 1 if magic found
void cycle_leds(void);
void test_potentiometres(void);
uint8_t display_and_return_pot_value(uint32_t pot_number);
void test_temperature_sensor(void);
void write_magic_to_eeprom(void);
void lock_crystal(void);
void serial_loopback(void);
void init_leds(void);
void init_push_buttons(void);
uint32_t push_button_pressed(uint32_t button_number);

uint8_t eeprom_magic[] = {0xDE, 0xAD, 0xBA, 0xBE};

void main(void) {
  init_leds();
  init_push_buttons();
  lcd_init();
  // flash some sort of welcome message
  lcd_two_line_write("Peripherals", "initialised.");

  if (check_for_eeprom_magic() == 0) {
    cycle_leds();
    test_potentiometres();
    test_temperature_sensor();
    write_magic_to_eeprom();
    lcd_two_line_write("EEPROM written", "Cycle power now")
    for(;;);
  }
  lcd_two_line_write("EEPROM test pass", "Press S0");
  while (!push_button_pressed(0));
  lock_crystal();
  serial_loopback();
}

uint32_t check_for_eeprom_magic(void) {
  uint32_t pos;
  return 0;
  eeprom_init_spi();
  for(pos = 0; pos < sizeof(eeprom_magic); pos++) {
    if (eeprom_read_from_address(pos) != eeprom_magic[pos]) {
      return 0; 
    }
  }
  return 1;
}

void cycle_leds(void) {
  lcd_two_line_write("Factory defaults", "Press S0");
  // enable the 50 ms interrupt. 
  // ISR toggles between 0xAA and 0x55, also changes RG PWM.
  RCC->APB1ENR |= RCC_APB1ENR_TIM14EN;
  TIM14->PSC = 8000;
  TIM14->ARR = 50; // period should be (8e6)/(8e3 * 50) = 50 ms.
  TIM14->DIER |= TIM_DIER_UIE; // enable the update event interrupt
  TIM14->CR1 |= TIM_CR1_CEN; // enable the counter
  // enable the interrupt in the NVIC
  NVIC_EnableIRQ(TIM14_IRQn);
  while (!push_button_pressed(0));
  NVIC_DisableIRQ(TIM14_IRQn); 
  TIM14->CR1 &= ~TIM_CR1_CEN; // disable the counter

}

void test_potentiometres(void) {
  uint8_t pot_value = 0;
  lcd_string("Initialising ADC");

  // initialise ATD to POT0 (perhaps a new function?)

  for(;;) {
    while((ADC1->ISR & ADC_ISR_EOC) == 0);
    GPIOB->ODR = ADC1->DR;
  }

  lcd_two_line_write("Turn POT0 fully", "counterclockwise");
  while (display_and_return_pot_value(0) < 250);
  lcd_two_line_write("Turn POT0 fully", "clockwise");
  while (display_and_return_pot_value(0) > 5);
  lcd_two_line_write("Turn POT1 fully", "counterclockwise");
  while (display_and_return_pot_value(1) < 250);
  lcd_two_line_write("Turn POT1 fully", "clockwise");
  while (display_and_return_pot_value(1) < 5);

  lcd_two_line_write("Pot test complete", "Press S1");
  while(!push_button_pressed(1)) {
    display_and_return_pot_value(1);
  }
}

uint8_t display_and_return_pot_value(uint32_t pot_number) {
  uint8_t pot_value;
  // point ATD to the right pot
  if (pot_number == 0) {
    ADC1->CHSELR = ADC_CHSELR_CHSEL5;
  } else {
    ADC1->CHSELR = ADC_CHSELR_CHSEL6;
  }
  ADC1->CR |= ADC_CR_ADSTART; // start a conversion
  while((ADC1->ISR & ADC_ISR_EOC) == 0); // wait till conversion complete
  pot_value = ADC1->DR;
  // write to LEDs
  GPIOB->ODR = pot_value;
  return pot_value;
}

void test_temperature_sensor(void) {
  uint8_t sensor_value = 0;
  lcd_two_line_write("Testing temprtr", "sensor.");
  // initialise IIC
  while( (sensor_value > 30) || (sensor_value < 20) || !(push_button_pressed(0)) ) {
    sensor_value = 0x00; // TODO: read value here
  }
  while( push_button_pressed(0) ) { //TODO: check real button number
    sensor_value = 0x00;// TODO: read value here
  }
}

void write_magic_to_eeprom(void) {
  uint32_t pos;
  // eeprom should already bt init'd by now.
 for(pos = 0; pos < sizeof(eeprom_magic); pos++) {
   eeprom_write_to_address(pos, eeprom_magic[pos]);
 }
}

void lock_crystal(void) {
  lcd_two_line_write("Attempting to", "lock crystal");
  lcd_two_line_write("Crystal locked.", "Press S1");
  while (!push_button_pressed(1));
  return;
}

void init_adc(void) {
  RCC->APB2ENR |= RCC_APB2ENR_ADCEN; //enable clock for ADC
  RCC->AHBENR |= RCC_AHBENR_GPIOAEN; //enable clock for port
  GPIOA->MODER |= GPIO_MODER_MODER6; //set PA6 to analogue mode
  ADC1->CHSELR |= ADC_CHSELR_CHSEL6;// select channel 6
  ADC1->CFGR1 |= ADC_CFGR1_RES_1; // resolution to 8 bit 
  ADC1->CR |= ADC_CR_ADEN; // set ADEN=1 in the ADC_CR register
  while((ADC1->ISR & ADC_ISR_ADRDY) == 0); //wait until ADRDY==1 in ADC_ISR
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

uint32_t push_button_pressed(uint32_t button_number) {
  // isolate lower 4 bits of GPIOA
  uint32_t buttons_isolated = GPIOA->IDR & 0b1111;
  if (buttons_isolated == (1 << button_number)) {
    return 1;
  } else {
    return 0;
  }
}

