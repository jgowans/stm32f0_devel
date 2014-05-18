CC = arm-none-eabi-gcc
DEVICE_INCLUDES = -I ../../STM32F0xx_StdPeriph_Lib_V1.3.1/Libraries/CMSIS/Device/ST/STM32F0xx/Include
ARM_INCLUDES = -I ../../STM32F0xx_StdPeriph_Lib_V1.3.1/Libraries/CMSIS/Include
CFLAGS = ${DEVICE_INCLUDES} ${ARM_INCLUDES} -mcpu=cortex-m0 -mthumb -g -c -std=c99

LD = arm-none-eabi-ld
LINKER_FILE = stm32f0_linker.ld
LDFLAGS = -T ${LINKER_FILE}

OBJCOPY = arm-none-eabi-objcopy 
OBJFLAGS = -O binary

OBJS = main.o startup_stm32f051.o 

main.bin: main.elf
	$(OBJCOPY) $(OBJFLAGS) main.elf main.bin
	
main.elf: $(OBJS)
	$(LD) $(LDFLAGS) -o main.elf $(OBJS) 
	
startup_stm32f051.o: startup_stm32f051.s
	$(CC) $(CFLAGS) -o startup_stm32f051.o startup_stm32f051.s

main.o: main.c 


clean:
	$(RM) *.o *.elf *.bin
