@ Somewhat simplified version of TJM's led_flasher
@ Gives clock to LED port, sets LED pins to outputs and toggles 
@ inifnitely between two patterns.

        .syntax unified         @ specifies the assembly syntax we're going to be writing in
        .global _start          @ presents this symbol to the linker. The linker expects this symbol for GDB to use as entry point.

vectors:        
        .word 0x20007FFF        @ stack pointer defulat to last byte of RAM
        .word _start + 1        @ reset vector (manually adjust to odd for thumb)

_start:
        @ Enable the Port B peripheral clock by setting bit 17 of RCC->AHBENR
        ldr r0, =#0b00000000000001000000000000000000
        ldr r1, =#0x40021014    @ address of AHBENR
        str r0, [r1]            @ write the desired value to the address of AHBENR
        
        @ Set the mode bits for Port B so that pB0-PB7 are configured as push-pull outputs. 
        @ GPIOB->MODER[15..0] = [0, 1]*8
        @  = > MODER = 0b0000 0000 0000 0000 0101 0101 0101 0101

        ldr r1, =#0x48000400    @ address of GPIOB->MODER
        ldr r0, =#0x00005555    @ desired MODER pattern as calculated above
        str r0, [r1]            @ write pattern to MODER 
        movs r0, #0xF5          @ a pattern to display on LEDs
        movs r1, #0xAA          @ different pattern to display on LEDs
        ldr r2, =#0x48000414    @ address of GPIOB->ODR
infinite_loop:
        str r0, [r2]            @ write pattern to ODR
        str r1, [r2]            @ write different pattern to ODR
        b infinite_loop

