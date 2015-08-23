#ifndef __MCP4921_H_
#define __MCP4921_H_

#include <stdint.h>
#include "stm32f0xx.h"

void mcp4921_init(void);
int mcp4921_set_value(uint8_t device, uint16_t value);
void mcp4921_device_disable(uint8_t device);

#endif
