#ifndef EEPROMLIB_H_
#define EEPROMLIB_H_

#include <stdint.h>
#include "stm32f0xx.h"

void eeprom_write_to_address(uint16_t address, uint8_t data);
uint8_t eeprom_read_from_address(uint16_t address);
void eeprom_init_spi(void);

#endif
