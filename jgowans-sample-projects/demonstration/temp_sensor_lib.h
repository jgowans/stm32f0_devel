#ifndef TEMP_SENSOR_LIB_H_
#define TEMP_SENSOR_LIB_H_

#include <stdint.h>
#include "stm32f0xx.h"

#define TC74ADDR_READ 0b10010001
#define TC74ADDR_WRITE 0b10010000

void temp_sensor_init_iic(void);
uint8_t temp_sensor_read(void);

#endif
