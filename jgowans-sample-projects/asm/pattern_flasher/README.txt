TO COMPILE AND LOAD THIS CODE:

Open a command window at your OpenOCD installation and run: 
openocd-x64-0.7.0.exe -f interface/stlink-v2.cfg -f target/stm32f0x_stlink.cfg (you may have to change your version number)

<<<<<<< HEAD
Point another command prompt to this directory (where your code is) and run each line separately:

arm-none-eabi-as -mcpu=cortex-m0 -mthumb -g -ahls=main.lst -o main.o main.s

arm-none-eabi-ld -Ttext=0x8000000 -nostartfiles -o main.elf main.o

=======
arm-none-eabi-as -mcpu=cortex-m0 -mthumb -g -ahls=main.lst -o main.o main.s

arm-none-eabi-ld -Ttext=0x8000000 -nostartfiles -o main.elf main.o

>>>>>>> upstream/master
arm-none-eabi-gdb main.elf

target remote localhost:3333

<<<<<<< HEAD
monitor reset halt (not always necessary)

=======
>>>>>>> upstream/master
load

continue

>> PROFIT!

<<<<<<< HEAD
=======

>>>>>>> upstream/master

Old notes:


meaning: http://www.kunen.org/uC/gnu_tool.html
instruction set: http://www.ic.unicamp.br/~ranido/mc404/arm/arm-instructionset.pdf
more about instruction set: http://simplemachines.it/doc/arm_inst.pdf
video on gdb for a snake game: http://hackaday.com/2012/09/27/beginners-look-at-on-chip-debugging/

arm-none-eabi-as -mcpu=cortex-m1 -mthumb -mapcs-32 -gstabs -ahls=led_stm32.lst -o led_stm32.o led_stm32.asm

arm-none-eabi-ld -v -T stm32f1_new.ld -nostartfiles -o led-stm32.elf led-stm32.o

arm-none-eabi-objcopy -O binary led-stm32.elf  led-stm32.bin


#use the -T flag to negate the need for a linker file!
arm-none-eabi-ld -Ttext=0x0 -o add.elf add.o


