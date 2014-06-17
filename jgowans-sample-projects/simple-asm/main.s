;@@ led-stm32.asm
@@@ written by Frank Sergeant
@@@    frank@pygmy.utoh.org
@@@    http://pygmy.utoh.org/riscy
@@@ This program is in the public domain.  See http://pygmy.utoh.org/riscy/cortex/ 
@@@ for notes about the program and how to assemble, link, and burn to flash.

@@@ This program has not yet been ported to the STM32F0. Work in progress.


@@@ Directives
        .thumb                  @ (same as saying '.code 16')
        .syntax unified

@@@ Equates
		.equ GPIOC_CRH,   0x40011004
        .equ GPIOC_ODR,   0x4001100C
        .equ RCC_APB2ENR, 0x40021018
        .equ STACKINIT,   0x20000100
        
        .equ LEDDELAY,    100000
        
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

        @@ Enable the Port C peripheral clock by setting bit 4
        ldr r6, = RCC_APB2ENR
        mov r0, 0x10
        str r0, [r6]
        
        @@ Set the config and mode bits for Port C bit 12 so it will
        @@ be a push-pull output (up to 50 MHz) by setting bits 19-16
        @@ to '0011'.

        ldr r6, = GPIOC_CRH
        ldr r0, = 0x44444434
        str r0, [r6]

        @@ Load R2 and R3 with the "on" and "off" constants
        mov r2, 0              @ value to turn on LED
        mov r3, 0x200         @ value to turn off LED

        ldr r6, = GPIOC_ODR    @  point to Port C output data register
        
loop:
        str r2, [r6]           @ clear Port C, pin 12, turning on LED
        ldr r1, = LEDDELAY
		bl delay
        str r3, [r6]           @ set Port C, pin 12, turning off LED
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
        add r0, 1
        add r1, 1
        b _dummy 
		