#include "temp_sensor_lib.h"

void temp_sensor_init_iic(void) {
  uint8_t dummy;
  // enable clock to port B
  RCC->AHBENR |= RCC_AHBENR_GPIOFEN;

  // there is a risk that the slave is sitting in the middle
  // of a transfer when we reset the master.
  // the following block of code simply toggles the clock
  // line 20 times to ensure that the slave gets a chance to 
  // clock out its data.
  // set clock line to open drain, output
  GPIOF->OTYPER |= GPIO_OTYPER_OT_6; // open drain
  GPIOF->MODER |= GPIO_MODER_MODER6_0; // GP output
  for (uint32_t loop_counter = 0; loop_counter < 20; loop_counter++) {
    for (volatile uint32_t delay = 0; delay < 10; delay++);
    GPIOF->BSRR |= GPIO_BSRR_BR_6; // set clock low
    for (volatile uint32_t delay = 0; delay < 10; delay++);
    GPIOF->BSRR |= GPIO_BSRR_BS_6; // set clock high
  }

  // set SCLK (PF6) to alternate function, open drain
  GPIOF->MODER &= ~GPIO_MODER_MODER6; // reset the MODER bits
  GPIOF->MODER |= GPIO_MODER_MODER6_1;
  GPIOF->OTYPER |= GPIO_OTYPER_OT_6;
  // set SDA (PF7) to alternate function, open drain
  GPIOF->MODER |= GPIO_MODER_MODER7_1;
  GPIOF->OTYPER |= GPIO_OTYPER_OT_7;
  // PF6 and PF7 only have 1 alternate function, so it's not necessary to map them
  // set up IIC stuff

  // enable clock to I2C2
  RCC->APB1ENR |= RCC_APB1ENR_I2C2EN;
  // disable the periperal
  I2C2->CR1 &= ~I2C_CR1_PE;
  // configure timing in PRESC, SCLDEL, SDADEL in TIMINGR
  I2C2->TIMINGR |= (0xC7 << 0); // SCLL
  I2C2->TIMINGR |= (0xC2 << 8); // SCLH
//  I2C2->TIMINGR |= (0x13 << 0); // SCLL
//  I2C2->TIMINGR |= (0x0F << 8); // SCLH
  I2C2->TIMINGR |= (0x02 << 16); // SDADEL
  I2C2->TIMINGR |= (0x04 << 20); // SCLDEL
  I2C2->TIMINGR |= (1 << 28);// PRESC
  // enable I2C
  I2C2->CR1 |= I2C_CR1_PE;
  dummy = I2C2->RXDR; // empty the RX buffer
}

uint8_t temp_sensor_read(void) {
  uint8_t temperature_value;
  // set addressing mode in ADD10
  //set slave address in SADD
  I2C2->CR2 |= TC74ADDR_READ;
  I2C2->CR2 |= (1 << 16); // set NBYTES to 1?
  // send start and address with read byte. Goes into TXDR
  // indicate we are going to be doing a read
  I2C2->CR2 |= I2C_CR2_RD_WRN;
  // START and STOP done in CR2
  I2C2->CR2 |= I2C_CR2_START;
  // wait for ACK (start bit reset)
  // wait for TC flag
  for(volatile uint32_t delay = 0; delay < 10000; delay++) {
    if ( (I2C2->ISR & I2C_ISR_RXNE) != 0) {
      break;
    }
  }
  // clock in a byte
  temperature_value = I2C2->RXDR;
  // STOP condition
  I2C2->CR2 |= I2C_CR2_STOP;
  // wait for RXNE==1
  // write to LEDs
  return temperature_value;
}

