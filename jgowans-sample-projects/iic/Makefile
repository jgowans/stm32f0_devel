CC = arm-none-eabi-gcc
DEVICE_INCLUDES = -I ../../STM32F0xx_StdPeriph_Lib_V1.3.1/Libraries/CMSIS/Device/ST/STM32F0xx/Include
ARM_INCLUDES = -I ../../STM32F0xx_StdPeriph_Lib_V1.3.1/Libraries/CMSIS/Include
CFLAGS = ${DEVICE_INCLUDES} ${ARM_INCLUDES} -mcpu=cortex-m0 -mthumb -g -std=c99

AS = arm-none-eabi-as

LD = arm-none-eabi-ld
LINKER_FILE = stm32f0_linker.ld
LDFLAGS = -T $(LINKER_FILE) -nostartfiles

OBJS = \
       main.o \
       startup_stm32f051.o \
       system_stm32f0xx.o \

main.elf: $(OBJS)
	$(CC) $(LDFLAGS) -o main.elf $(OBJS)
	
main.o: main.c 
startup_stm32f051.o: startup_stm32f051.s
system_stm32f0xx.o: system_stm32f0xx.c

clean:
	$(RM) *.o *.elf *.bin
