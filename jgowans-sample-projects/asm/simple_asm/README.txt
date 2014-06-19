TO COMPILE AND LOAD THIS CODE:

Point your command prompt to this directory and run each line separately:

arm-none-eabi-as -mcpu=cortex-m0 -mthumb -g -ahls=main.lst -o main.o main.s

arm-none-eabi-ld -Ttext=0x8000000 -o main.elf main.o

arm-none-eabi-gdb main.elf

target remote localhost:3333

load

continue

>> PROFIT!



