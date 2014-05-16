CC = arm-none-eabi-gcc
DEVICE_INCLUDES = -I ../../STM32F0xx_StdPeriph_Lib_V1.3.1/Libraries/CMSIS/Device/ST/STM32F0xx/Include
ARM_INCLUDES = -I ../../STM32F0xx_StdPeriph_Lib_V1.3.1/Libraries/CMSIS/Include
CFLAGS = ${DEVICE_INCLUDES} ${ARM_INCLUDES} -mcpu=cortex-m0 -mthumb -g -c

LD = arm-none-eabi-ld
LINKER_FILE = stm32f0_linker.ld
LDFLAGS = -T ${LINKER_FILE}

AS = arm-none-eabi-as

OBJCOPY = arm-none-eabi-objcopy 
OBJFLAGS = -O binary

main.bin: main.elf
	$(OBJCOPY) $(OBJFLAGS) main.elf main.bin
	
main.elf: main.o startup_stm32f051.o lcd_stm32f0.o
	$(LD) $(LDFLAGS) -o main.elf main.o startup_stm32f051.o lcd_stm32f0.o
	
startup_stm32f051.o: startup_stm32f051.s
main.o: main.c lcd_stm32f0.h lcd_stm32f0.c
lcd_stm32f0.o: lcd_stm32f0.c lcd_stm32f0.h

clean:
# if using linux, replace "del" with "rm"
	$(RM) *.o *.elf *.bin
