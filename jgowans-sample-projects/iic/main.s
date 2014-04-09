	.cpu cortex-m0
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.code	16
	.file	"main.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	main
	.code	16
	.thumb_func
	.type	main, %function
main:
.LFB33:
	.file 1 "main.c"
	.loc 1 11 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 12 0
	bl	init_leds
	.loc 1 13 0
	bl	init_iic
.L2:
	.loc 1 15 0 discriminator 1
	ldr	r3, .L3
	ldr	r2, .L3
	ldr	r2, [r2, #4]
	mov	r1, #128
	lsl	r1, r1, #9
	orr	r2, r1
	str	r2, [r3, #4]
	.loc 1 17 0 discriminator 1
	ldr	r3, .L3
	ldr	r2, .L3
	ldr	r2, [r2, #4]
	mov	r1, #128
	lsl	r1, r1, #3
	orr	r2, r1
	str	r2, [r3, #4]
	.loc 1 19 0 discriminator 1
	ldr	r3, .L3
	ldr	r2, .L3
	ldr	r2, [r2, #4]
	mov	r1, #128
	lsl	r1, r1, #6
	orr	r2, r1
	str	r2, [r3, #4]
	.loc 1 23 0 discriminator 1
	ldr	r3, .L3
	ldr	r2, .L3
	ldr	r2, [r2, #4]
	mov	r1, #128
	lsl	r1, r1, #7
	orr	r2, r1
	str	r2, [r3, #4]
	.loc 1 26 0 discriminator 1
	b	.L2
.L4:
	.align	2
.L3:
	.word	1073763328
	.cfi_endproc
.LFE33:
	.size	main, .-main
	.align	2
	.global	init_iic
	.code	16
	.thumb_func
	.type	init_iic, %function
init_iic:
.LFB34:
	.loc 1 29 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 31 0
	ldr	r3, .L6
	ldr	r2, .L6
	ldr	r2, [r2, #20]
	mov	r1, #128
	lsl	r1, r1, #11
	orr	r2, r1
	str	r2, [r3, #20]
	.loc 1 33 0
	ldr	r3, .L6+4
	ldr	r2, .L6+4
	ldr	r2, [r2]
	mov	r1, #128
	lsl	r1, r1, #10
	orr	r2, r1
	str	r2, [r3]
	.loc 1 34 0
	ldr	r2, .L6+4
	ldr	r3, .L6+4
	ldr	r3, [r3, #4]
	uxth	r3, r3
	mov	r1, #128
	lsl	r1, r1, #1
	orr	r3, r1
	uxth	r3, r3
	strh	r3, [r2, #4]
	.loc 1 35 0
	ldr	r3, .L6+4
	ldr	r2, .L6+4
	ldr	r2, [r2, #12]
	mov	r1, #128
	lsl	r1, r1, #9
	orr	r2, r1
	str	r2, [r3, #12]
	.loc 1 37 0
	ldr	r3, .L6+4
	ldr	r2, .L6+4
	ldr	r2, [r2]
	mov	r1, #128
	lsl	r1, r1, #12
	orr	r2, r1
	str	r2, [r3]
	.loc 1 38 0
	ldr	r2, .L6+4
	ldr	r3, .L6+4
	ldr	r3, [r3, #4]
	uxth	r3, r3
	mov	r1, #128
	lsl	r1, r1, #2
	orr	r3, r1
	uxth	r3, r3
	strh	r3, [r2, #4]
	.loc 1 39 0
	ldr	r3, .L6+4
	ldr	r2, .L6+4
	ldr	r2, [r2, #12]
	mov	r1, #128
	lsl	r1, r1, #11
	orr	r2, r1
	str	r2, [r3, #12]
	.loc 1 41 0
	ldr	r3, .L6+4
	ldr	r2, .L6+4
	ldr	r2, [r2, #36]
	mov	r1, #1
	orr	r2, r1
	str	r2, [r3, #36]
	.loc 1 42 0
	ldr	r3, .L6+4
	ldr	r2, .L6+4
	ldr	r2, [r2, #36]
	mov	r1, #16
	orr	r2, r1
	str	r2, [r3, #36]
	.loc 1 46 0
	ldr	r3, .L6
	ldr	r2, .L6
	ldr	r2, [r2, #28]
	mov	r1, #128
	lsl	r1, r1, #14
	orr	r2, r1
	str	r2, [r3, #28]
	.loc 1 48 0
	ldr	r3, .L6+8
	ldr	r2, .L6+8
	ldr	r2, [r2, #16]
	mov	r1, #19
	orr	r2, r1
	str	r2, [r3, #16]
	.loc 1 49 0
	ldr	r3, .L6+8
	ldr	r2, .L6+8
	ldr	r2, [r2, #16]
	mov	r1, #240
	lsl	r1, r1, #4
	orr	r2, r1
	str	r2, [r3, #16]
	.loc 1 50 0
	ldr	r3, .L6+8
	ldr	r2, .L6+8
	ldr	r2, [r2, #16]
	mov	r1, #128
	lsl	r1, r1, #10
	orr	r2, r1
	str	r2, [r3, #16]
	.loc 1 51 0
	ldr	r3, .L6+8
	ldr	r2, .L6+8
	ldr	r2, [r2, #16]
	mov	r1, #128
	lsl	r1, r1, #15
	orr	r2, r1
	str	r2, [r3, #16]
	.loc 1 52 0
	ldr	r3, .L6+8
	ldr	r2, .L6+8
	ldr	r2, [r2, #16]
	mov	r1, #128
	lsl	r1, r1, #21
	orr	r2, r1
	str	r2, [r3, #16]
	.loc 1 55 0
	ldr	r3, .L6+8
	ldr	r2, .L6+8
	ldr	r2, [r2, #4]
	mov	r1, #145
	orr	r2, r1
	str	r2, [r3, #4]
	.loc 1 57 0
	ldr	r3, .L6+8
	ldr	r2, .L6+8
	ldr	r2, [r2]
	mov	r1, #1
	orr	r2, r1
	str	r2, [r3]
	.loc 1 58 0
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L7:
	.align	2
.L6:
	.word	1073876992
	.word	1207960576
	.word	1073763328
	.cfi_endproc
.LFE34:
	.size	init_iic, .-init_iic
	.align	2
	.global	init_leds
	.code	16
	.thumb_func
	.type	init_leds, %function
init_leds:
.LFB35:
	.loc 1 60 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 61 0
	ldr	r3, .L9
	ldr	r2, .L9
	ldr	r2, [r2, #20]
	mov	r1, #128
	lsl	r1, r1, #11
	orr	r2, r1
	str	r2, [r3, #20]
	.loc 1 62 0
	ldr	r3, .L9+4
	ldr	r2, .L9+4
	ldr	r2, [r2]
	mov	r1, #1
	orr	r2, r1
	str	r2, [r3]
	.loc 1 63 0
	ldr	r3, .L9+4
	ldr	r2, .L9+4
	ldr	r2, [r2]
	mov	r1, #4
	orr	r2, r1
	str	r2, [r3]
	.loc 1 64 0
	ldr	r3, .L9+4
	ldr	r2, .L9+4
	ldr	r2, [r2]
	mov	r1, #16
	orr	r2, r1
	str	r2, [r3]
	.loc 1 65 0
	ldr	r3, .L9+4
	ldr	r2, .L9+4
	ldr	r2, [r2]
	mov	r1, #64
	orr	r2, r1
	str	r2, [r3]
	.loc 1 66 0
	ldr	r3, .L9+4
	ldr	r2, .L9+4
	ldr	r2, [r2]
	mov	r1, #128
	lsl	r1, r1, #1
	orr	r2, r1
	str	r2, [r3]
	.loc 1 67 0
	ldr	r3, .L9+4
	ldr	r2, .L9+4
	ldr	r2, [r2]
	mov	r1, #128
	lsl	r1, r1, #3
	orr	r2, r1
	str	r2, [r3]
	.loc 1 68 0
	ldr	r3, .L9+4
	ldr	r2, .L9+4
	ldr	r2, [r2]
	mov	r1, #128
	lsl	r1, r1, #5
	orr	r2, r1
	str	r2, [r3]
	.loc 1 69 0
	ldr	r3, .L9+4
	ldr	r2, .L9+4
	ldr	r2, [r2]
	mov	r1, #128
	lsl	r1, r1, #7
	orr	r2, r1
	str	r2, [r3]
	.loc 1 70 0
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L10:
	.align	2
.L9:
	.word	1073876992
	.word	1207960576
	.cfi_endproc
.LFE35:
	.size	init_leds, .-init_leds
.Letext0:
	.file 2 "c:\\program files (x86)\\gnu tools arm embedded\\4.8 2013q4\\arm-none-eabi\\include\\stdint.h"
	.file 3 "C:\\STM32F0_Development\\STM32F0xx_StdPeriph_Lib_V1.3.1\\Libraries\\CMSIS\\Device\\ST\\STM32F0xx\\Include/stm32f0xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x313
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF45
	.byte	0x1
	.4byte	.LASF46
	.4byte	.LASF47
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x36
	.4byte	0x45
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x50
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x5
	.4byte	0x53
	.uleb128 0x6
	.4byte	0x53
	.4byte	0x9d
	.uleb128 0x7
	.4byte	0x81
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.4byte	0x3a
	.uleb128 0x8
	.byte	0x2c
	.byte	0x3
	.2byte	0x269
	.4byte	0x162
	.uleb128 0x9
	.4byte	.LASF12
	.byte	0x3
	.2byte	0x26b
	.4byte	0x88
	.byte	0
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x3
	.2byte	0x26c
	.4byte	0x9d
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x3
	.2byte	0x26d
	.4byte	0x3a
	.byte	0x6
	.uleb128 0x9
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x26e
	.4byte	0x88
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF16
	.byte	0x3
	.2byte	0x26f
	.4byte	0x88
	.byte	0xc
	.uleb128 0xa
	.ascii	"IDR\000"
	.byte	0x3
	.2byte	0x270
	.4byte	0x9d
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x271
	.4byte	0x3a
	.byte	0x12
	.uleb128 0xa
	.ascii	"ODR\000"
	.byte	0x3
	.2byte	0x272
	.4byte	0x9d
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x273
	.4byte	0x3a
	.byte	0x16
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x274
	.4byte	0x88
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x275
	.4byte	0x88
	.byte	0x1c
	.uleb128 0xa
	.ascii	"AFR\000"
	.byte	0x3
	.2byte	0x276
	.4byte	0x162
	.byte	0x20
	.uleb128 0xa
	.ascii	"BRR\000"
	.byte	0x3
	.2byte	0x277
	.4byte	0x9d
	.byte	0x28
	.uleb128 0x9
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x278
	.4byte	0x3a
	.byte	0x2a
	.byte	0
	.uleb128 0x5
	.4byte	0x8d
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x279
	.4byte	0xa2
	.uleb128 0x8
	.byte	0x2c
	.byte	0x3
	.2byte	0x28b
	.4byte	0x20c
	.uleb128 0xa
	.ascii	"CR1\000"
	.byte	0x3
	.2byte	0x28d
	.4byte	0x88
	.byte	0
	.uleb128 0xa
	.ascii	"CR2\000"
	.byte	0x3
	.2byte	0x28e
	.4byte	0x88
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x28f
	.4byte	0x88
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF24
	.byte	0x3
	.2byte	0x290
	.4byte	0x88
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF25
	.byte	0x3
	.2byte	0x291
	.4byte	0x88
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF26
	.byte	0x3
	.2byte	0x292
	.4byte	0x88
	.byte	0x14
	.uleb128 0xa
	.ascii	"ISR\000"
	.byte	0x3
	.2byte	0x293
	.4byte	0x88
	.byte	0x18
	.uleb128 0xa
	.ascii	"ICR\000"
	.byte	0x3
	.2byte	0x294
	.4byte	0x88
	.byte	0x1c
	.uleb128 0x9
	.4byte	.LASF27
	.byte	0x3
	.2byte	0x295
	.4byte	0x88
	.byte	0x20
	.uleb128 0x9
	.4byte	.LASF28
	.byte	0x3
	.2byte	0x296
	.4byte	0x88
	.byte	0x24
	.uleb128 0x9
	.4byte	.LASF29
	.byte	0x3
	.2byte	0x297
	.4byte	0x88
	.byte	0x28
	.byte	0
	.uleb128 0xb
	.4byte	.LASF30
	.byte	0x3
	.2byte	0x298
	.4byte	0x173
	.uleb128 0x8
	.byte	0x38
	.byte	0x3
	.2byte	0x2b5
	.4byte	0x2d7
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x3
	.2byte	0x2b7
	.4byte	0x88
	.byte	0
	.uleb128 0x9
	.4byte	.LASF31
	.byte	0x3
	.2byte	0x2b8
	.4byte	0x88
	.byte	0x4
	.uleb128 0xa
	.ascii	"CIR\000"
	.byte	0x3
	.2byte	0x2b9
	.4byte	0x88
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF32
	.byte	0x3
	.2byte	0x2ba
	.4byte	0x88
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF33
	.byte	0x3
	.2byte	0x2bb
	.4byte	0x88
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF34
	.byte	0x3
	.2byte	0x2bc
	.4byte	0x88
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF35
	.byte	0x3
	.2byte	0x2bd
	.4byte	0x88
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF36
	.byte	0x3
	.2byte	0x2be
	.4byte	0x88
	.byte	0x1c
	.uleb128 0x9
	.4byte	.LASF37
	.byte	0x3
	.2byte	0x2bf
	.4byte	0x88
	.byte	0x20
	.uleb128 0xa
	.ascii	"CSR\000"
	.byte	0x3
	.2byte	0x2c0
	.4byte	0x88
	.byte	0x24
	.uleb128 0x9
	.4byte	.LASF38
	.byte	0x3
	.2byte	0x2c1
	.4byte	0x88
	.byte	0x28
	.uleb128 0x9
	.4byte	.LASF39
	.byte	0x3
	.2byte	0x2c2
	.4byte	0x88
	.byte	0x2c
	.uleb128 0x9
	.4byte	.LASF40
	.byte	0x3
	.2byte	0x2c3
	.4byte	0x88
	.byte	0x30
	.uleb128 0xa
	.ascii	"CR2\000"
	.byte	0x3
	.2byte	0x2c4
	.4byte	0x88
	.byte	0x34
	.byte	0
	.uleb128 0xb
	.4byte	.LASF41
	.byte	0x3
	.2byte	0x2c5
	.4byte	0x218
	.uleb128 0xc
	.4byte	.LASF42
	.byte	0x1
	.byte	0xb
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF43
	.byte	0x1
	.byte	0x1d
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF44
	.byte	0x1
	.byte	0x3c
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF20:
	.ascii	"LCKR\000"
.LASF15:
	.ascii	"OSPEEDR\000"
.LASF31:
	.ascii	"CFGR\000"
.LASF34:
	.ascii	"AHBENR\000"
.LASF12:
	.ascii	"MODER\000"
.LASF38:
	.ascii	"AHBRSTR\000"
.LASF37:
	.ascii	"BDCR\000"
.LASF19:
	.ascii	"BSRR\000"
.LASF25:
	.ascii	"TIMINGR\000"
.LASF39:
	.ascii	"CFGR2\000"
.LASF45:
	.ascii	"GNU C 4.8.3 20131129 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 205641] -mcpu=cortex-m0 -mthumb -g\000"
.LASF14:
	.ascii	"RESERVED0\000"
.LASF17:
	.ascii	"RESERVED1\000"
.LASF18:
	.ascii	"RESERVED2\000"
.LASF21:
	.ascii	"RESERVED3\000"
.LASF40:
	.ascii	"CFGR3\000"
.LASF13:
	.ascii	"OTYPER\000"
.LASF44:
	.ascii	"init_leds\000"
.LASF33:
	.ascii	"APB1RSTR\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF29:
	.ascii	"TXDR\000"
.LASF27:
	.ascii	"PECR\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF23:
	.ascii	"OAR1\000"
.LASF24:
	.ascii	"OAR2\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF35:
	.ascii	"APB2ENR\000"
.LASF42:
	.ascii	"main\000"
.LASF36:
	.ascii	"APB1ENR\000"
.LASF32:
	.ascii	"APB2RSTR\000"
.LASF26:
	.ascii	"TIMEOUTR\000"
.LASF10:
	.ascii	"unsigned int\000"
.LASF43:
	.ascii	"init_iic\000"
.LASF22:
	.ascii	"GPIO_TypeDef\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF47:
	.ascii	"C:\\STM32F0_Development\\JGowans-sample-projects\\i"
	.ascii	"ic\000"
.LASF11:
	.ascii	"sizetype\000"
.LASF16:
	.ascii	"PUPDR\000"
.LASF8:
	.ascii	"long long int\000"
.LASF46:
	.ascii	"main.c\000"
.LASF2:
	.ascii	"short int\000"
.LASF5:
	.ascii	"uint16_t\000"
.LASF41:
	.ascii	"RCC_TypeDef\000"
.LASF4:
	.ascii	"long int\000"
.LASF28:
	.ascii	"RXDR\000"
.LASF0:
	.ascii	"signed char\000"
.LASF30:
	.ascii	"I2C_TypeDef\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.8.3 20131129 (release) [ARM/embedded-4_8-branch revision 205641]"
