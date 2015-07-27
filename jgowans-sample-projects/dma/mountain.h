#ifndef __MOUNTAIN_H__
#define __MOUNTAIN_H__

#include <stdint.h>

const uint16_t table_mountain[778];
uint32_t mountain_length(void);
uint32_t mountain_get_element(uint32_t idx);

#endif
