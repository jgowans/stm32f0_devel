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
	.loc 1 9 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 10 0
	bl	init_leds
	.loc 1 11 0
	bl	init_adc
.L3:
	.loc 1 15 0
	ldr	r3, .L4
	ldr	r2, .L4
	ldr	r2, [r2, #8]
	mov	r1, #4
	orr	r2, r1
	str	r2, [r3, #8]
	.loc 1 17 0
	mov	r8, r8
.L2:
	.loc 1 17 0 is_stmt 0 discriminator 1
	ldr	r3, .L4
	ldr	r2, [r3]
	mov	r3, #4
	and	r3, r2
	beq	.L2
	.loc 1 18 0 is_stmt 1
	ldr	r2, .L4+4
	ldr	r3, .L4
	ldr	r3, [r3, #64]
	uxth	r3, r3
	strh	r3, [r2, #20]
	.loc 1 19 0
	b	.L3
.L5:
	.align	2
.L4:
	.word	1073816576
	.word	1207960576
	.cfi_endproc
.LFE33:
	.size	main, .-main
	.align	2
	.global	init_leds
	.code	16
	.thumb_func
	.type	init_leds, %function
init_leds:
.LFB34:
	.loc 1 23 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 24 0
	ldr	r3, .L7
	ldr	r2, .L7
	ldr	r2, [r2, #20]
	mov	r1, #128
	lsl	r1, r1, #11
	orr	r2, r1
	str	r2, [r3, #20]
	.loc 1 25 0
	ldr	r3, .L7+4
	ldr	r2, .L7+4
	ldr	r2, [r2]
	mov	r1, #1
	orr	r2, r1
	str	r2, [r3]
	.loc 1 26 0
	ldr	r3, .L7+4
	ldr	r2, .L7+4
	ldr	r2, [r2]
	mov	r1, #4
	orr	r2, r1
	str	r2, [r3]
	.loc 1 27 0
	ldr	r3, .L7+4
	ldr	r2, .L7+4
	ldr	r2, [r2]
	mov	r1, #16
	orr	r2, r1
	str	r2, [r3]
	.loc 1 28 0
	ldr	r3, .L7+4
	ldr	r2, .L7+4
	ldr	r2, [r2]
	mov	r1, #64
	orr	r2, r1
	str	r2, [r3]
	.loc 1 29 0
	ldr	r3, .L7+4
	ldr	r2, .L7+4
	ldr	r2, [r2]
	mov	r1, #128
	lsl	r1, r1, #1
	orr	r2, r1
	str	r2, [r3]
	.loc 1 30 0
	ldr	r3, .L7+4
	ldr	r2, .L7+4
	ldr	r2, [r2]
	mov	r1, #128
	lsl	r1, r1, #3
	orr	r2, r1
	str	r2, [r3]
	.loc 1 31 0
	ldr	r3, .L7+4
	ldr	r2, .L7+4
	ldr	r2, [r2]
	mov	r1, #128
	lsl	r1, r1, #5
	orr	r2, r1
	str	r2, [r3]
	.loc 1 32 0
	ldr	r3, .L7+4
	ldr	r2, .L7+4
	ldr	r2, [r2]
	mov	r1, #128
	lsl	r1, r1, #7
	orr	r2, r1
	str	r2, [r3]
	.loc 1 33 0
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L8:
	.align	2
.L7:
	.word	1073876992
	.word	1207960576
	.cfi_endproc
.LFE34:
	.size	init_leds, .-init_leds
	.align	2
	.global	init_adc
	.code	16
	.thumb_func
	.type	init_adc, %function
init_adc:
.LFB35:
	.loc 1 35 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 36 0
	ldr	r3, .L11
	ldr	r2, .L11
	ldr	r2, [r2, #24]
	mov	r1, #128
	lsl	r1, r1, #2
	orr	r2, r1
	str	r2, [r3, #24]
	.loc 1 37 0
	ldr	r3, .L11
	ldr	r2, .L11
	ldr	r2, [r2, #20]
	mov	r1, #128
	lsl	r1, r1, #10
	orr	r2, r1
	str	r2, [r3, #20]
	.loc 1 38 0
	mov	r3, #144
	lsl	r3, r3, #23
	mov	r2, #144
	lsl	r2, r2, #23
	ldr	r2, [r2]
	mov	r1, #192
	lsl	r1, r1, #6
	orr	r2, r1
	str	r2, [r3]
	.loc 1 39 0
	ldr	r3, .L11+4
	ldr	r2, .L11+4
	ldr	r2, [r2, #40]
	mov	r1, #64
	orr	r2, r1
	str	r2, [r3, #40]
	.loc 1 40 0
	ldr	r3, .L11+4
	ldr	r2, .L11+4
	ldr	r2, [r2, #12]
	mov	r1, #16
	orr	r2, r1
	str	r2, [r3, #12]
	.loc 1 41 0
	ldr	r3, .L11+4
	ldr	r2, .L11+4
	ldr	r2, [r2, #8]
	mov	r1, #1
	orr	r2, r1
	str	r2, [r3, #8]
	.loc 1 42 0
	mov	r8, r8
.L10:
	.loc 1 42 0 is_stmt 0 discriminator 1
	ldr	r3, .L11+4
	ldr	r2, [r3]
	mov	r3, #1
	and	r3, r2
	beq	.L10
	.loc 1 44 0 is_stmt 1
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L12:
	.align	2
.L11:
	.word	1073876992
	.word	1073816576
	.cfi_endproc
.LFE35:
	.size	init_adc, .-init_adc
.Letext0:
	.file 2 "/usr/include/newlib/machine/_default_types.h"
	.file 3 "/usr/include/newlib/stdint.h"
	.file 4 "../../STM32F0xx_StdPeriph_Lib_V1.3.1/Libraries/CMSIS/Device/ST/STM32F0xx/Include/stm32f0xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x350
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF44
	.byte	0x1
	.4byte	.LASF45
	.4byte	.LASF46
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
	.byte	0x26
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
	.byte	0x38
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
	.uleb128 0x3
	.4byte	.LASF11
	.byte	0x3
	.byte	0x36
	.4byte	0x3a
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x42
	.4byte	0x53
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.uleb128 0x5
	.4byte	0x8c
	.uleb128 0x6
	.4byte	0x8c
	.4byte	0xb3
	.uleb128 0x7
	.4byte	0x97
	.byte	0x1
	.byte	0
	.uleb128 0x8
	.byte	0x44
	.byte	0x4
	.2byte	0x17c
	.4byte	0x163
	.uleb128 0x9
	.ascii	"ISR\000"
	.byte	0x4
	.2byte	0x17e
	.4byte	0x9e
	.byte	0
	.uleb128 0x9
	.ascii	"IER\000"
	.byte	0x4
	.2byte	0x17f
	.4byte	0x9e
	.byte	0x4
	.uleb128 0x9
	.ascii	"CR\000"
	.byte	0x4
	.2byte	0x180
	.4byte	0x9e
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF14
	.byte	0x4
	.2byte	0x181
	.4byte	0x9e
	.byte	0xc
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x4
	.2byte	0x182
	.4byte	0x9e
	.byte	0x10
	.uleb128 0xa
	.4byte	.LASF16
	.byte	0x4
	.2byte	0x183
	.4byte	0x9e
	.byte	0x14
	.uleb128 0xa
	.4byte	.LASF17
	.byte	0x4
	.2byte	0x184
	.4byte	0x8c
	.byte	0x18
	.uleb128 0xa
	.4byte	.LASF18
	.byte	0x4
	.2byte	0x185
	.4byte	0x8c
	.byte	0x1c
	.uleb128 0x9
	.ascii	"TR\000"
	.byte	0x4
	.2byte	0x186
	.4byte	0x9e
	.byte	0x20
	.uleb128 0xa
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x187
	.4byte	0x8c
	.byte	0x24
	.uleb128 0xa
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x188
	.4byte	0x9e
	.byte	0x28
	.uleb128 0xa
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x189
	.4byte	0x163
	.byte	0x2c
	.uleb128 0x9
	.ascii	"DR\000"
	.byte	0x4
	.2byte	0x18a
	.4byte	0x9e
	.byte	0x40
	.byte	0
	.uleb128 0x6
	.4byte	0x8c
	.4byte	0x173
	.uleb128 0x7
	.4byte	0x97
	.byte	0x4
	.byte	0
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x18b
	.4byte	0xb3
	.uleb128 0x5
	.4byte	0x81
	.uleb128 0x8
	.byte	0x2c
	.byte	0x4
	.2byte	0x269
	.4byte	0x244
	.uleb128 0xa
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x26b
	.4byte	0x9e
	.byte	0
	.uleb128 0xa
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x26c
	.4byte	0x17f
	.byte	0x4
	.uleb128 0xa
	.4byte	.LASF25
	.byte	0x4
	.2byte	0x26d
	.4byte	0x81
	.byte	0x6
	.uleb128 0xa
	.4byte	.LASF26
	.byte	0x4
	.2byte	0x26e
	.4byte	0x9e
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF27
	.byte	0x4
	.2byte	0x26f
	.4byte	0x9e
	.byte	0xc
	.uleb128 0x9
	.ascii	"IDR\000"
	.byte	0x4
	.2byte	0x270
	.4byte	0x17f
	.byte	0x10
	.uleb128 0xa
	.4byte	.LASF17
	.byte	0x4
	.2byte	0x271
	.4byte	0x81
	.byte	0x12
	.uleb128 0x9
	.ascii	"ODR\000"
	.byte	0x4
	.2byte	0x272
	.4byte	0x17f
	.byte	0x14
	.uleb128 0xa
	.4byte	.LASF18
	.byte	0x4
	.2byte	0x273
	.4byte	0x81
	.byte	0x16
	.uleb128 0xa
	.4byte	.LASF28
	.byte	0x4
	.2byte	0x274
	.4byte	0x9e
	.byte	0x18
	.uleb128 0xa
	.4byte	.LASF29
	.byte	0x4
	.2byte	0x275
	.4byte	0x9e
	.byte	0x1c
	.uleb128 0x9
	.ascii	"AFR\000"
	.byte	0x4
	.2byte	0x276
	.4byte	0x244
	.byte	0x20
	.uleb128 0x9
	.ascii	"BRR\000"
	.byte	0x4
	.2byte	0x277
	.4byte	0x17f
	.byte	0x28
	.uleb128 0xa
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x278
	.4byte	0x81
	.byte	0x2a
	.byte	0
	.uleb128 0x5
	.4byte	0xa3
	.uleb128 0xb
	.4byte	.LASF30
	.byte	0x4
	.2byte	0x279
	.4byte	0x184
	.uleb128 0x8
	.byte	0x38
	.byte	0x4
	.2byte	0x2b5
	.4byte	0x314
	.uleb128 0x9
	.ascii	"CR\000"
	.byte	0x4
	.2byte	0x2b7
	.4byte	0x9e
	.byte	0
	.uleb128 0xa
	.4byte	.LASF31
	.byte	0x4
	.2byte	0x2b8
	.4byte	0x9e
	.byte	0x4
	.uleb128 0x9
	.ascii	"CIR\000"
	.byte	0x4
	.2byte	0x2b9
	.4byte	0x9e
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF32
	.byte	0x4
	.2byte	0x2ba
	.4byte	0x9e
	.byte	0xc
	.uleb128 0xa
	.4byte	.LASF33
	.byte	0x4
	.2byte	0x2bb
	.4byte	0x9e
	.byte	0x10
	.uleb128 0xa
	.4byte	.LASF34
	.byte	0x4
	.2byte	0x2bc
	.4byte	0x9e
	.byte	0x14
	.uleb128 0xa
	.4byte	.LASF35
	.byte	0x4
	.2byte	0x2bd
	.4byte	0x9e
	.byte	0x18
	.uleb128 0xa
	.4byte	.LASF36
	.byte	0x4
	.2byte	0x2be
	.4byte	0x9e
	.byte	0x1c
	.uleb128 0xa
	.4byte	.LASF37
	.byte	0x4
	.2byte	0x2bf
	.4byte	0x9e
	.byte	0x20
	.uleb128 0x9
	.ascii	"CSR\000"
	.byte	0x4
	.2byte	0x2c0
	.4byte	0x9e
	.byte	0x24
	.uleb128 0xa
	.4byte	.LASF38
	.byte	0x4
	.2byte	0x2c1
	.4byte	0x9e
	.byte	0x28
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x4
	.2byte	0x2c2
	.4byte	0x9e
	.byte	0x2c
	.uleb128 0xa
	.4byte	.LASF39
	.byte	0x4
	.2byte	0x2c3
	.4byte	0x9e
	.byte	0x30
	.uleb128 0x9
	.ascii	"CR2\000"
	.byte	0x4
	.2byte	0x2c4
	.4byte	0x9e
	.byte	0x34
	.byte	0
	.uleb128 0xb
	.4byte	.LASF40
	.byte	0x4
	.2byte	0x2c5
	.4byte	0x255
	.uleb128 0xc
	.4byte	.LASF41
	.byte	0x1
	.byte	0x8
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF42
	.byte	0x1
	.byte	0x17
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF43
	.byte	0x1
	.byte	0x23
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
	.uleb128 0xa
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
.LASF29:
	.ascii	"LCKR\000"
.LASF26:
	.ascii	"OSPEEDR\000"
.LASF31:
	.ascii	"CFGR\000"
.LASF34:
	.ascii	"AHBENR\000"
.LASF23:
	.ascii	"MODER\000"
.LASF38:
	.ascii	"AHBRSTR\000"
.LASF37:
	.ascii	"BDCR\000"
.LASF28:
	.ascii	"BSRR\000"
.LASF43:
	.ascii	"init_adc\000"
.LASF20:
	.ascii	"CHSELR\000"
.LASF25:
	.ascii	"RESERVED0\000"
.LASF17:
	.ascii	"RESERVED1\000"
.LASF18:
	.ascii	"RESERVED2\000"
.LASF19:
	.ascii	"RESERVED3\000"
.LASF21:
	.ascii	"RESERVED4\000"
.LASF39:
	.ascii	"CFGR3\000"
.LASF24:
	.ascii	"OTYPER\000"
.LASF42:
	.ascii	"init_leds\000"
.LASF33:
	.ascii	"APB1RSTR\000"
.LASF44:
	.ascii	"GNU C 4.8.2 -mcpu=cortex-m0 -mthumb -g\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF14:
	.ascii	"CFGR1\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF12:
	.ascii	"uint32_t\000"
.LASF5:
	.ascii	"__uint16_t\000"
.LASF35:
	.ascii	"APB2ENR\000"
.LASF6:
	.ascii	"__uint32_t\000"
.LASF36:
	.ascii	"APB1ENR\000"
.LASF32:
	.ascii	"APB2RSTR\000"
.LASF41:
	.ascii	"main\000"
.LASF10:
	.ascii	"unsigned int\000"
.LASF30:
	.ascii	"GPIO_TypeDef\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF16:
	.ascii	"SMPR\000"
.LASF13:
	.ascii	"sizetype\000"
.LASF27:
	.ascii	"PUPDR\000"
.LASF8:
	.ascii	"long long int\000"
.LASF45:
	.ascii	"main.c\000"
.LASF46:
	.ascii	"/home/jgowans/stm32f0_sample_code/jgowans-sample-pr"
	.ascii	"ojects/adc-reader\000"
.LASF2:
	.ascii	"short int\000"
.LASF11:
	.ascii	"uint16_t\000"
.LASF40:
	.ascii	"RCC_TypeDef\000"
.LASF4:
	.ascii	"long int\000"
.LASF22:
	.ascii	"ADC_TypeDef\000"
.LASF0:
	.ascii	"signed char\000"
.LASF15:
	.ascii	"CFGR2\000"
	.ident	"GCC: (4.8.2-14ubuntu1+6) 4.8.2"
