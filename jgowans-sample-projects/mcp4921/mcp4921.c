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
        uint8_t value[2];
        struct __attribute__((__packed__)) {
            unsigned int not_write : 1;
            unsigned int buf : 1;
            unsigned int ga : 1;
            unsigned int not_shutdown : 1;
            unsigned int data : 12;
        } bitfield;
    };
};

static struct mcp4921_config_t mcp4921_config;
static void mcp4921_struct_reset();

// Initialises the pins and SPI peripheral connected to the MCP4921
void mcp4921_init(void) {
    mcp4921_struct_reset();
}

void mcp4921_set_value(uint16_t value) {
}

// Sets the fields of the config struct to default values 
static void mcp4921_struct_reset() {
}

