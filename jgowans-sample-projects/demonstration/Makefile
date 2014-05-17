CC = arm-none-eabi-gcc
DEVICE_INCLUDES = -I ../../STM32F0xx_StdPeriph_Lib_V1.3.1/Libraries/CMSIS/Device/ST/STM32F0xx/Include
ARM_INCLUDES = -I ../../STM32F0xx_StdPeriph_Lib_V1.3.1/Libraries/CMSIS/Include
CFLAGS = ${DEVICE_INCLUDES} ${ARM_INCLUDES} -mcpu=cortex-m0 -mthumb -g -c -std=c99

LD = arm-none-eabi-ld
LINKER_FILE = stm32f0_linker.ld
LDFLAGS = -T ${LINKER_FILE}

OBJCOPY = arm-none-eabi-objcopy 
OBJFLAGS = -O binary

OBJS = main.o startup_stm32f051.o lcd_stm32f0.o temp_sensor_lib.o eeprom_lib.o

main.bin: main.elf
	$(OBJCOPY) $(OBJFLAGS) main.elf main.bin
	
main.elf: $(OBJS)
	$(LD) $(LDFLAGS) -o main.elf $(OBJS) 
	
startup_stm32f051.o: startup_stm32f051.s
	$(CC) $(CFLAGS) -o startup_stm32f051.o startup_stm32f051.s

main.o: main.c temp_sensor_lib.h lcd_stm32f0.h eeprom_lib.h
temp_sensor_lib.o: temp_sensor_lib.c temp_sensor_lib.h
eeprom_lib.o: eeprom_lib.c eeprom_lib.h
lcd_stm32f0.o: lcd_stm32f0.c lcd_stm32f0.h


clean:
	$(RM) *.o *.elf *.bin
