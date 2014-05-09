CC = arm-none-eabi-gcc
DEVICE_INCLUDES = -I ../../STM32F0xx_StdPeriph_Lib_V1.3.1/Libraries/CMSIS/Device/ST/STM32F0xx/Include
ARM_INCLUDES = -I ../../STM32F0xx_StdPeriph_Lib_V1.3.1/Libraries/CMSIS/Include
CC_FLAGS = ${DEVICE_INCLUDES} ${ARM_INCLUDES} -mcpu=cortex-m0 -mthumb -S -g

AS = arm-none-eabi-as
AS_FLAGS = -g

LD = arm-none-eabi-ld
LINKER_FILE = -T stm32f0_linker.ld
LD_FLAGS = ${LINKER_FILE}

OBJCOPY = arm-none-eabi-objcopy 
OBJ_FLAGS = -O binary

main.bin: main.elf
	$(OBJCOPY) $(OBJ_FLAGS) main.elf main.bin
	
main.elf: main.o startup_stm32f051.o
	$(LD) $(LD_FLAGS) -o main.elf main.o startup_stm32f051.o

main.o: main.s
	$(AS) $(AS_FLAGS) -o main.o main.s
	
startup_stm32f051.o: startup_stm32f051.s
	$(AS) $(AS_FLAGS) -o startup_stm32f051.o startup_stm32f051.s
		
main.s: main.c
	$(CC) $(CC_FLAGS) main.c

clean:
	$(RM) main.s main.o main.elf main.bin
