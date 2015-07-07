#ifndef MCP4921_H_
#define MCP4921_H_

#include <stdint.h>
#include <stm32f0xx.h>

// Initialises the pins and SPI peripheral connected to the MCP4921
void mcp4921_init(void);

void mcp4921_set_value(uint16_t value);

#endif
