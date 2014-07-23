TO COMPILE AND LOAD THIS CODE:

Open a command window at your OpenOCD installation and run: 
openocd-x64-0.7.0.exe -f interface/stlink-v2.cfg -f target/stm32f0x_stlink.cfg (you may have to change or remove the openOCD version number)

Point another command prompt to this directory (where your code is) and run each line separately:

arm-none-eabi-as -mcpu=cortex-m0 -mthumb -g -ahls=main.lst -o main.o main.s

arm-none-eabi-ld -Ttext=0x8000000 -nostartfiles -o main.elf main.o

arm-none-eabi-gdb main.elf

target remote localhost:3333

monitor reset halt (not always necessary)

load

continue

>> PROFIT!