#include "mcp4921.h"

/*
 * MCP4921 DAC example project
 * James Gowans, University of Cape Town, 2015-07-07
 *
 * Connections:
 * The !LDAC pin should be tied low.
 * SDI(4) to PB15
 * CLK to PB13
 *
 * This device uses SPI mode 0,0 or 1,1. Data is clocked on rising edge. 
 * A write command is 4 config bits and 12 data bits. 
 */

struct mcp4921_config_t {
    union {
        uint16_t value;
        struct __attribute__((__packed__)) {
            unsigned int data : 12;
            unsigned int not_shutdown : 1;
            unsigned int ga : 1;
            unsigned int buf : 1;
            unsigned int not_write : 1;
        } bitfield;
    };
};

static struct mcp4921_config_t mcp4921_configs[2];
static void mcp4921_struct_reset(uint8_t device);
static void spi_init(void);
static uint16_t spi_write(uint8_t device, uint16_t val);

// Initialises the pins and SPI peripheral connected to the MCP4921
void mcp4921_init(void) {
    mcp4921_struct_reset(0);
    mcp4921_struct_reset(1);
    spi_init();
    mcp4921_set_value(0, 0);
    mcp4921_set_value(1, 0);
}

int mcp4921_set_value(uint8_t device, uint16_t value) {
    if( (device == 0) || (device == 1) ) {
        if(value < 4095) {
            mcp4921_configs[device].bitfield.not_shutdown = 1;
            mcp4921_configs[device].bitfield.data = value;
            spi_write(device, mcp4921_configs[device].value);
            return 0;
        }
    }
    return -1;
}

void mcp4921_device_disable(uint8_t device) {
    if( (device == 0) || (device == 1) ) {
        mcp4921_configs[device].bitfield.not_shutdown = 0;
        spi_write(device, mcp4921_configs[device].value);
    }
}

// Sets the fields of the config struct to default values 
static void mcp4921_struct_reset(uint8_t device) {
    mcp4921_configs[device].value = 0;
    mcp4921_configs[device].bitfield.ga = 1;
}

static void spi_init(void) {
    //Run at 6 MHz. Can keep MISO off.
    // clock to PB
    RCC->AHBENR |= RCC_AHBENR_GPIOBEN; //enable clock for SPI port
    // no need to map pins to the perpiheral - they are AF0
    GPIOB->MODER |= GPIO_MODER_MODER12_0; // set pin CS0 (PB12) to output push-pull
    GPIOB->MODER |= GPIO_MODER_MODER13_1; // set pin SCK (PB13) to Alternate Function
    GPIOB->MODER |= GPIO_MODER_MODER14_0; // set pin CS1 (PB14) to output push-pull
    GPIOB->MODER |= GPIO_MODER_MODER15_1; // set pin MOSI (PB15) to Alternate Function
    GPIOB->BSRR |= GPIO_BSRR_BS_12; // pull CS0 high
    GPIOB->BSRR |= GPIO_BSRR_BS_14; // pull CS1 high

    // clock enable to SPI2
    RCC->APB1ENR |= RCC_APB1ENR_SPI2EN;
    SPI2->CR1 |= SPI_CR1_BIDIOE; // enable output
    SPI2->CR1 |= SPI_CR1_BR_1; // set baud to fpclk / 8 = 48 MHz / 8 = 6 MHz
    SPI2->CR1 |= SPI_CR1_MSTR; // set to master mode
    SPI2->CR2 |= SPI_CR2_SSOE; // enable slave output to work in master mode
    SPI2->CR2 |= (SPI_CR2_DS_0 | SPI_CR2_DS_1 | SPI_CR2_DS_2 | SPI_CR2_DS_3); // set to 16bit mode
    SPI2->CR1 |= SPI_CR1_SPE; // enable the SPI peripheral
}

static uint16_t spi_write(uint8_t device, uint16_t val) {
    uint16_t dummy;
    if(device == 0) {
        GPIOB->BSRR |= GPIO_BSRR_BR_12; // pull CS0 low
    } 
    if(device == 1) {
        GPIOB->BSRR |= GPIO_BSRR_BR_14; // pull CS1 low
    }
    SPI2->DR = val;
    while ((SPI2->SR & SPI_SR_RXNE) == 0); // hang while RX is empty
    dummy = SPI2->DR;
    GPIOB->BSRR |= (GPIO_BSRR_BS_12 | GPIO_BSRR_BS_14); // pull CS0 and CS1 high
    return dummy;
}
