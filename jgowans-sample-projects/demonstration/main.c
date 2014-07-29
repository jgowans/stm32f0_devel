#define STM32F051

#include "stdint.h"
#include "stm32f0xx.h"
#include "eeprom_lib.h"
#include "temp_sensor_lib.h"
#include "lcd_stm32f0.h"

static uint32_t check_for_eeprom_magic(void); // will return 1 if magic found
static void cycle_leds(void);
static void test_potentiometres(void);  // this is a spelling error - I will fix when I have more time. TJM
static uint8_t get_pot_value(uint32_t pot_number);
static void test_RG_LED(void);
static void test_temperature_sensor(void);
static void write_magic_to_eeprom(void);
static void assert_crystal_locked(void);
static void serial_loopback(void);
static void init_adc(void);
static void init_leds(void);
static void init_push_buttons(void);
static void init_usart(void);
static void init_RG_LED(void);
static void deinit_RG_LED(void);
static uint32_t push_button_pressed(uint32_t button_number);

uint8_t eeprom_magic[] = {0xDE, 0xAD, 0xBA, 0xBE};

void main(void) {
  init_leds();
  init_push_buttons();
  lcd_init();
  // flash some sort of welcome message
  lcd_two_line_write("Peripherals", "initialised.");
  
  assert_crystal_locked();

  if (check_for_eeprom_magic() == 0) {
    cycle_leds();
    test_potentiometres();
    test_RG_LED();
    test_temperature_sensor();
    write_magic_to_eeprom();
    lcd_two_line_write("EEPROM written", "Cycle power now");
    for(;;);
  }
  lcd_two_line_write("EEPROM test pass", "Press S0");
  while (!push_button_pressed(0));
  serial_loopback();
}

static uint32_t check_for_eeprom_magic(void) {
  lcd_two_line_write("Attemping to", "read from EEPROM");
  uint32_t pos;
  eeprom_init_spi();
  for(pos = 0; pos < sizeof(eeprom_magic); pos++) {
    if (eeprom_read_from_address(pos) != eeprom_magic[pos]) {
      return 0; 
    }
    eeprom_write_to_address(pos, 0x00); // erase the byte after verifying it
  }
  return 1;
}

static void cycle_leds(void) {
  lcd_two_line_write("Intro Lab!", "Press S0");
  init_RG_LED();
  // enable the 50 ms interrupt. 
  // ISR toggles between 0xAA and 0x55, also changes RG PWM.
  RCC->APB1ENR |= RCC_APB1ENR_TIM14EN;
  TIM14->PSC = 8000;
  TIM14->ARR = 30; // period should be (48e6)/(8e3 * 30) = 5 ms.
  TIM14->DIER |= TIM_DIER_UIE; // enable the update event interrupt
  TIM14->CR1 |= TIM_CR1_CEN; // enable the counter
  // enable the interrupt in the NVIC
  NVIC_EnableIRQ(TIM14_IRQn);
  while (!push_button_pressed(0));
  NVIC_DisableIRQ(TIM14_IRQn); 
  TIM14->CR1 &= ~TIM_CR1_CEN; // disable the counter
  deinit_RG_LED();

}

static void test_potentiometres(void) {
  uint8_t pot_value = 0;
  lcd_two_line_write("Initialising ADC", " ");

  init_adc();

  lcd_two_line_write("Turn POT0 fully", "counterclockwise");
  while ((GPIOB->ODR = get_pot_value(0)) > 5);
  lcd_two_line_write("Turn POT0 fully", "clockwise");
  while ((GPIOB->ODR = get_pot_value(0)) < 250);
  lcd_two_line_write("Turn POT1 fully", "counterclockwise");
  while ((GPIOB->ODR = get_pot_value(1)) > 5);
  lcd_two_line_write("Turn POT1 fully", "clockwise");
  while ((GPIOB->ODR = get_pot_value(1)) < 250);

  lcd_two_line_write("Pot test complete", "Press S1");
  while(!push_button_pressed(1)) {
    GPIOB->ODR = get_pot_value(1);
  }
}

static uint8_t get_pot_value(uint32_t pot_number) {
  uint8_t pot_value;
  // point ATD to the right pot
  if (pot_number == 0) {
    ADC1->CHSELR = ADC_CHSELR_CHSEL5;
  } else {
    ADC1->CHSELR = ADC_CHSELR_CHSEL6;
  }
  ADC1->CR |= ADC_CR_ADSTART; // start a conversion
  while((ADC1->ISR & ADC_ISR_EOC) == 0); // wait till conversion complete
  return (uint8_t)ADC1->DR;
}

static void test_RG_LED(void) {
  init_RG_LED();
  lcd_two_line_write("Testing RG LED", "Press S2");
  while(!push_button_pressed(2)) {
    TIM2->CCR3 = get_pot_value(0);
    TIM2->CCR4 = get_pot_value(1);
  }
  deinit_RG_LED();
}

static void test_temperature_sensor(void) {
  uint8_t sensor_value = 0;
  lcd_two_line_write("Testing temprtr", "sensor.");
  // initialise IIC
  temp_sensor_init_iic();
  while( (sensor_value > 30) || (sensor_value < 20) ) {
    sensor_value = temp_sensor_read();
    GPIOB->ODR = sensor_value;
  }
  lcd_two_line_write("Tempratur sensor", "passed. Press S3");

  while( !push_button_pressed(3) ) { 
    sensor_value = temp_sensor_read();
    GPIOB->ODR = sensor_value;
  }
}

static void write_magic_to_eeprom(void) {
  uint32_t pos;
  uint32_t match_failed = 0;
  lcd_two_line_write("Trying to write", "to EEPROM");
  // eeprom should already bt init'd by now.
  for(pos = 0; pos < sizeof(eeprom_magic); pos++) {
    eeprom_write_to_address(pos, eeprom_magic[pos]);
  }
  for(pos = 0; pos < sizeof(eeprom_magic); pos++) {
    if (eeprom_magic[pos] != eeprom_read_from_address(pos)) {
      match_failed += 1;
    }
  }
  if (match_failed != 0) {
    lcd_two_line_write("Cannot write to", "EEPROM. Fail.");
    for(;;);
  }
}

static void assert_crystal_locked(void) {
  SystemCoreClockUpdate(); // update the SystemCoreClock global variable
  if (SystemCoreClock != 48000000) {
   lcd_two_line_write("Crystal not ", "locked. Fail.");
   for(;;);
  }
  return;
}

static void serial_loopback(void) {
  uint8_t received_char;
  lcd_two_line_write("Attemping to init", "USART loopback");
  init_usart();
  lcd_two_line_write("All tests pass!", "Now in loopback");
  for(;;) {
    while ( (USART1->ISR & USART_ISR_RXNE) == 0); // while receive IS empty, hang
    received_char = USART1->RDR;
    GPIOB->ODR = received_char;
    USART1->TDR = received_char + 1;
  }
}

static void init_adc(void) {
  RCC->APB2ENR |= RCC_APB2ENR_ADCEN; //enable clock for ADC
  RCC->AHBENR |= RCC_AHBENR_GPIOAEN; //enable clock for port
  GPIOA->MODER |= GPIO_MODER_MODER6; //set PA6 to analogue mode
  ADC1->CHSELR |= ADC_CHSELR_CHSEL6;// select channel 6
  ADC1->CFGR1 |= ADC_CFGR1_RES_1; // resolution to 8 bit 
  ADC1->CR |= ADC_CR_ADEN; // set ADEN=1 in the ADC_CR register
  while((ADC1->ISR & ADC_ISR_ADRDY) == 0); //wait until ADRDY==1 in ADC_ISR
}



static void init_leds(void) {
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

static void init_push_buttons(void) {
  RCC->AHBENR |= RCC_AHBENR_GPIOAEN; //enable clock for push-buttons
  // set pins to inputs
  GPIOA->MODER &= ~GPIO_MODER_MODER0; //set PA0 to input
  GPIOA->MODER &= ~GPIO_MODER_MODER1; //set PA1 to input
  GPIOA->MODER &= ~GPIO_MODER_MODER2; //set PA2 to input
  GPIOA->MODER &= ~GPIO_MODER_MODER3; //set PA3 to input
  // enable pull-up resistors
  GPIOA->PUPDR |= GPIO_PUPDR_PUPDR0_0; //enable pull-up for PA0
  GPIOA->PUPDR |= GPIO_PUPDR_PUPDR1_0; //enable pull-up for PA1
  GPIOA->PUPDR |= GPIO_PUPDR_PUPDR2_0; //enable pull-up for PA2
  GPIOA->PUPDR |= GPIO_PUPDR_PUPDR3_0; //enable pull-up for PA3
}

static void init_usart(void) {
  // clock to USART1
  RCC->APB2ENR |= RCC_APB2ENR_USART1EN;
  // clock to GPIOA
  RCC->AHBENR |= RCC_AHBENR_GPIOAEN;
  // PA9 and PA10 to AF
  GPIOA->MODER |= GPIO_MODER_MODER9_1;
  GPIOA->MODER |= GPIO_MODER_MODER10_1;
  // remap to correct AF
  GPIOA->AFR[1] |= (1 << (1*4)); // remap pin 9 to AF1
  GPIOA->AFR[1] |= (1 << (2*4)); // remap pin 10 to AF1

  // BRR = fclk / baud = fclk / 115200
  SystemCoreClockUpdate();
  USART1->BRR = SystemCoreClock/115200;
  // enable with UE in CR1
  USART1->CR1 |= USART_CR1_UE;
  USART1->CR1 |= USART_CR1_RE;
  USART1->CR1 |= USART_CR1_TE;
}

static void init_RG_LED(void) {
  // initialise the timer to generate PWM
  RCC->AHBENR |= RCC_AHBENR_GPIOBEN;
  RCC->APB1ENR |= RCC_APB1ENR_TIM2EN;

  GPIOB->MODER |= GPIO_MODER_MODER10_1; // PB10 = AF
  GPIOB->MODER |= GPIO_MODER_MODER11_1; // PB11 = AF
  GPIOB->AFR[1] |= (2 << (4*(10 - 8))); // PB10_AF = AF2 (ie: map to TIM2_CH3)
  GPIOB->AFR[1] |= (2 << (4*(11 - 8))); // PB11_AF = AF2 (ie: map to TIM2_CH4)

  TIM2->ARR = 255;
  // specify PWM mode: OCxM bits in CCMRx. We want mode 1
  TIM2->CCMR2 |= (TIM_CCMR2_OC3M_2 | TIM_CCMR2_OC3M_1); // PWM Mode 1
  TIM2->CCMR2 |= (TIM_CCMR2_OC4M_2 | TIM_CCMR2_OC4M_1); // PWM Mode 1 

  // enable the OC channels
  TIM2->CCER |= TIM_CCER_CC3E;
  TIM2->CCER |= TIM_CCER_CC4E;

  TIM2->CR1 |= TIM_CR1_CEN; // counter enable
}

static void deinit_RG_LED(void) {
  // disable the timer and pins
  TIM2->CR1 &= ~TIM_CR1_CEN;
  GPIOB->MODER &= ~GPIO_MODER_MODER10;
  GPIOB->MODER &= ~GPIO_MODER_MODER11;
}

static uint32_t push_button_pressed(uint32_t button_number) {
  // isolate lower 4 bits of GPIOA
  uint32_t buttons_isolated = GPIOA->IDR & 0b1111;
  // for a press to be detected, that bit and ONLY that bit must be CLEAR.
  if (buttons_isolated == (0b1111 & ~(1 << button_number))) {
    return 1;
  } else {
    return 0;
  }
}

