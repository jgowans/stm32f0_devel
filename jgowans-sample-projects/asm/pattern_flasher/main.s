

@@@ Simple ASM code, ported to STM32F0 by Thomas J. Mathew, June 2014
@@@ Designed to work with the UCT development board.

@@@ This code flashes two different patterns on the LEDs with a short delay between.


@@@ Directives
        .thumb                  @ (same as saying '.code 16')
        .syntax unified
        .global _start

@@@ Register definitions
        .equ GPIOB_MODER, 0x48000400
        .equ GPIOB_ODR,   0x48000414
        .equ RCC_AHBENR,  0x40021014
        .equ GPIOB_CLKEN, 0x00040000
@@@ Misc variables
        .equ STACKINIT,   0x20000100
        .equ LEDDELAY,    1000000
        
.section .text
        .org 0

@@@ Vectors
vectors:        
        .word STACKINIT         @ stack pointer value when stack is empty
        .word _start + 1        @ reset vector (manually adjust to odd for thumb)
        .word _nmi_handler + 1  @ 
        .word _hard_fault  + 1  @ 
        .word _memory_fault + 1 @ 
        .word _bus_fault + 1    @ 
        .word _usage_fault + 1  @ 

_start:

        @@ Enable the Port B peripheral clock by setting bit 17
        ldr r6, = RCC_AHBENR
        ldr r0, = #0x00040000 @0b 0000 0000 0000 0100 0000 0000 0000 0000
        str r0, [r6]
        
        @@ Set the mode bits for Port B so that pB0-PB7 are configured as push-pull outputs. 
        @@ GPIOB_MODER{0-7} = [0 1]
        @@ No need to set GPIOB_OTYPER as its reset state is all 0s (push-pull enabled)
        @@  = > MODER = 0b0000 0000 0000 0000 0101 0101 0101 0101

        ldr r6, = GPIOB_MODER
        ldr r0, = 0x00005555
        str r0, [r6]

        @@ Load R2 and R3 with the "on" and "off" constants
        movs r2, #0xAA              @ value to turn on LED
        movs r3, #0x55              @ value to turn off LED

        ldr r6, = GPIOB_ODR    @  point to Port C output data register
        
loop:
        str r2, [r6]           @ turn on LEDs
        ldr r1, = LEDDELAY
        bl delay
        str r3, [r6]           @ turn off LEDs
        ldr r1, = LEDDELAY
        bl delay
        b loop
delay:
        subs r1, 1
        bne delay
        bx lr

_dummy:                        @ if any int gets triggered, just hang in a loop
_nmi_handler:
_hard_fault:
_memory_fault:
_bus_fault:
_usage_fault:
        adds r0, #1
        adds r1, #1
        b _dummy 

