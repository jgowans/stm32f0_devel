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
	.loc 1 10 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 11 0
	add	r3, r7, #7
	mov	r2, #99
	strb	r2, [r3]
	.loc 1 12 0
	bl	init_leds
	.loc 1 13 0
	ldr	r3, .L5
	ldr	r2, .L5
	ldrh	r2, [r2, #20]
	uxth	r2, r2
	mov	r1, #170
	orr	r2, r1
	uxth	r2, r2
	strh	r2, [r3, #20]
	.loc 1 14 0
	bl	init_usart
.L4:
	.loc 1 16 0
	mov	r8, r8
.L2:
	.loc 1 16 0 is_stmt 0 discriminator 1
	ldr	r3, .L5+4
	ldr	r2, [r3, #28]
	mov	r3, #32
	and	r3, r2
	beq	.L2
	.loc 1 17 0 is_stmt 1
	ldr	r3, .L5+4
	ldrh	r3, [r3, #36]
	uxth	r2, r3
	add	r3, r7, #7
	strb	r2, [r3]
	.loc 1 18 0
	ldr	r3, .L5
	add	r2, r7, #7
	ldrb	r2, [r2]
	uxth	r2, r2
	strh	r2, [r3, #20]
	.loc 1 19 0
	ldr	r3, .L5+4
	add	r2, r7, #7
	ldrb	r2, [r2]
	uxth	r2, r2
	add	r2, r2, #1
	uxth	r2, r2
	strh	r2, [r3, #40]
	.loc 1 21 0
	mov	r8, r8
	.loc 1 16 0
	b	.L4
.L6:
	.align	2
.L5:
	.word	1207960576
	.word	1073759232
	.cfi_endproc
.LFE33:
	.size	main, .-main
	.align	2
	.global	delay
	.code	16
	.thumb_func
	.type	delay, %function
delay:
.LFB34:
	.loc 1 24 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 25 0
	mov	r3, #0
	str	r3, [r7, #4]
	.loc 1 26 0
	b	.L8
.L9:
	.loc 1 26 0 is_stmt 0 discriminator 2
	ldr	r3, [r7, #4]
	add	r3, r3, #1
	str	r3, [r7, #4]
.L8:
	.loc 1 26 0 discriminator 1
	ldr	r2, [r7, #4]
	ldr	r3, .L10
	cmp	r2, r3
	ble	.L9
	.loc 1 27 0 is_stmt 1
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L11:
	.align	2
.L10:
	.word	565534
	.cfi_endproc
.LFE34:
	.size	delay, .-delay
	.align	2
	.global	init_usart
	.code	16
	.thumb_func
	.type	init_usart, %function
init_usart:
.LFB35:
	.loc 1 31 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 33 0
	ldr	r3, .L13
	ldr	r2, .L13
	ldr	r2, [r2, #28]
	mov	r1, #128
	lsl	r1, r1, #10
	orr	r2, r1
	str	r2, [r3, #28]
	.loc 1 35 0
	ldr	r3, .L13
	ldr	r2, .L13
	ldr	r2, [r2, #20]
	mov	r1, #128
	lsl	r1, r1, #10
	orr	r2, r1
	str	r2, [r3, #20]
	.loc 1 37 0
	mov	r3, #144
	lsl	r3, r3, #23
	mov	r2, #144
	lsl	r2, r2, #23
	ldr	r2, [r2]
	mov	r1, #32
	orr	r2, r1
	str	r2, [r3]
	.loc 1 38 0
	mov	r3, #144
	lsl	r3, r3, #23
	mov	r2, #144
	lsl	r2, r2, #23
	ldr	r2, [r2]
	mov	r1, #128
	orr	r2, r1
	str	r2, [r3]
	.loc 1 40 0
	mov	r3, #144
	lsl	r3, r3, #23
	mov	r2, #144
	lsl	r2, r2, #23
	ldr	r2, [r2, #32]
	mov	r1, #128
	lsl	r1, r1, #1
	orr	r2, r1
	str	r2, [r3, #32]
	.loc 1 41 0
	mov	r3, #144
	lsl	r3, r3, #23
	mov	r2, #144
	lsl	r2, r2, #23
	ldr	r2, [r2, #32]
	mov	r1, #128
	lsl	r1, r1, #5
	orr	r2, r1
	str	r2, [r3, #32]
	.loc 1 44 0
	ldr	r3, .L13+4
	ldr	r2, .L13+8
	strh	r2, [r3, #12]
	.loc 1 46 0
	ldr	r3, .L13+4
	ldr	r2, .L13+4
	ldr	r2, [r2]
	mov	r1, #1
	orr	r2, r1
	str	r2, [r3]
	.loc 1 47 0
	ldr	r3, .L13+4
	ldr	r2, .L13+4
	ldr	r2, [r2]
	mov	r1, #4
	orr	r2, r1
	str	r2, [r3]
	.loc 1 48 0
	ldr	r3, .L13+4
	ldr	r2, .L13+4
	ldr	r2, [r2]
	mov	r1, #8
	orr	r2, r1
	str	r2, [r3]
	.loc 1 49 0
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L14:
	.align	2
.L13:
	.word	1073876992
	.word	1073759232
	.word	833
	.cfi_endproc
.LFE35:
	.size	init_usart, .-init_usart
	.align	2
	.global	init_leds
	.code	16
	.thumb_func
	.type	init_leds, %function
init_leds:
.LFB36:
	.loc 1 51 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 52 0
	ldr	r3, .L16
	ldr	r2, .L16
	ldr	r2, [r2, #20]
	mov	r1, #128
	lsl	r1, r1, #11
	orr	r2, r1
	str	r2, [r3, #20]
	.loc 1 53 0
	ldr	r3, .L16+4
	ldr	r2, .L16+4
	ldr	r2, [r2]
	mov	r1, #1
	orr	r2, r1
	str	r2, [r3]
	.loc 1 54 0
	ldr	r3, .L16+4
	ldr	r2, .L16+4
	ldr	r2, [r2]
	mov	r1, #4
	orr	r2, r1
	str	r2, [r3]
	.loc 1 55 0
	ldr	r3, .L16+4
	ldr	r2, .L16+4
	ldr	r2, [r2]
	mov	r1, #16
	orr	r2, r1
	str	r2, [r3]
	.loc 1 56 0
	ldr	r3, .L16+4
	ldr	r2, .L16+4
	ldr	r2, [r2]
	mov	r1, #64
	orr	r2, r1
	str	r2, [r3]
	.loc 1 57 0
	ldr	r3, .L16+4
	ldr	r2, .L16+4
	ldr	r2, [r2]
	mov	r1, #128
	lsl	r1, r1, #1
	orr	r2, r1
	str	r2, [r3]
	.loc 1 58 0
	ldr	r3, .L16+4
	ldr	r2, .L16+4
	ldr	r2, [r2]
	mov	r1, #128
	lsl	r1, r1, #3
	orr	r2, r1
	str	r2, [r3]
	.loc 1 59 0
	ldr	r3, .L16+4
	ldr	r2, .L16+4
	ldr	r2, [r2]
	mov	r1, #128
	lsl	r1, r1, #5
	orr	r2, r1
	str	r2, [r3]
	.loc 1 60 0
	ldr	r3, .L16+4
	ldr	r2, .L16+4
	ldr	r2, [r2]
	mov	r1, #128
	lsl	r1, r1, #7
	orr	r2, r1
	str	r2, [r3]
	.loc 1 61 0
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L17:
	.align	2
.L16:
	.word	1073876992
	.word	1207960576
	.cfi_endproc
.LFE36:
	.size	init_leds, .-init_leds
.Letext0:
	.file 2 "/usr/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/usr/arm-none-eabi/include/stdint.h"
	.file 4 "../../STM32F0xx_StdPeriph_Lib_V1.3.1/Libraries/CMSIS/Device/ST/STM32F0xx/Include/stm32f0xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x3a4
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF46
	.byte	0x1
	.4byte	.LASF47
	.4byte	.LASF48
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
	.uleb128 0x5
	.4byte	0x81
	.uleb128 0x8
	.byte	0x2c
	.byte	0x4
	.2byte	0x269
	.4byte	0x178
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x4
	.2byte	0x26b
	.4byte	0x9e
	.byte	0
	.uleb128 0x9
	.4byte	.LASF15
	.byte	0x4
	.2byte	0x26c
	.4byte	0xb3
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF16
	.byte	0x4
	.2byte	0x26d
	.4byte	0x81
	.byte	0x6
	.uleb128 0x9
	.4byte	.LASF17
	.byte	0x4
	.2byte	0x26e
	.4byte	0x9e
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x4
	.2byte	0x26f
	.4byte	0x9e
	.byte	0xc
	.uleb128 0xa
	.ascii	"IDR\000"
	.byte	0x4
	.2byte	0x270
	.4byte	0xb3
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x271
	.4byte	0x81
	.byte	0x12
	.uleb128 0xa
	.ascii	"ODR\000"
	.byte	0x4
	.2byte	0x272
	.4byte	0xb3
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x273
	.4byte	0x81
	.byte	0x16
	.uleb128 0x9
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x274
	.4byte	0x9e
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x275
	.4byte	0x9e
	.byte	0x1c
	.uleb128 0xa
	.ascii	"AFR\000"
	.byte	0x4
	.2byte	0x276
	.4byte	0x178
	.byte	0x20
	.uleb128 0xa
	.ascii	"BRR\000"
	.byte	0x4
	.2byte	0x277
	.4byte	0xb3
	.byte	0x28
	.uleb128 0x9
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x278
	.4byte	0x81
	.byte	0x2a
	.byte	0
	.uleb128 0x5
	.4byte	0xa3
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x279
	.4byte	0xb8
	.uleb128 0x8
	.byte	0x38
	.byte	0x4
	.2byte	0x2b5
	.4byte	0x248
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x4
	.2byte	0x2b7
	.4byte	0x9e
	.byte	0
	.uleb128 0x9
	.4byte	.LASF25
	.byte	0x4
	.2byte	0x2b8
	.4byte	0x9e
	.byte	0x4
	.uleb128 0xa
	.ascii	"CIR\000"
	.byte	0x4
	.2byte	0x2b9
	.4byte	0x9e
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF26
	.byte	0x4
	.2byte	0x2ba
	.4byte	0x9e
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF27
	.byte	0x4
	.2byte	0x2bb
	.4byte	0x9e
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF28
	.byte	0x4
	.2byte	0x2bc
	.4byte	0x9e
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF29
	.byte	0x4
	.2byte	0x2bd
	.4byte	0x9e
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF30
	.byte	0x4
	.2byte	0x2be
	.4byte	0x9e
	.byte	0x1c
	.uleb128 0x9
	.4byte	.LASF31
	.byte	0x4
	.2byte	0x2bf
	.4byte	0x9e
	.byte	0x20
	.uleb128 0xa
	.ascii	"CSR\000"
	.byte	0x4
	.2byte	0x2c0
	.4byte	0x9e
	.byte	0x24
	.uleb128 0x9
	.4byte	.LASF32
	.byte	0x4
	.2byte	0x2c1
	.4byte	0x9e
	.byte	0x28
	.uleb128 0x9
	.4byte	.LASF33
	.byte	0x4
	.2byte	0x2c2
	.4byte	0x9e
	.byte	0x2c
	.uleb128 0x9
	.4byte	.LASF34
	.byte	0x4
	.2byte	0x2c3
	.4byte	0x9e
	.byte	0x30
	.uleb128 0xa
	.ascii	"CR2\000"
	.byte	0x4
	.2byte	0x2c4
	.4byte	0x9e
	.byte	0x34
	.byte	0
	.uleb128 0xb
	.4byte	.LASF35
	.byte	0x4
	.2byte	0x2c5
	.4byte	0x189
	.uleb128 0x8
	.byte	0x2c
	.byte	0x4
	.2byte	0x34a
	.4byte	0x32e
	.uleb128 0xa
	.ascii	"CR1\000"
	.byte	0x4
	.2byte	0x34c
	.4byte	0x9e
	.byte	0
	.uleb128 0xa
	.ascii	"CR2\000"
	.byte	0x4
	.2byte	0x34d
	.4byte	0x9e
	.byte	0x4
	.uleb128 0xa
	.ascii	"CR3\000"
	.byte	0x4
	.2byte	0x34e
	.4byte	0x9e
	.byte	0x8
	.uleb128 0xa
	.ascii	"BRR\000"
	.byte	0x4
	.2byte	0x34f
	.4byte	0xb3
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x350
	.4byte	0x81
	.byte	0xe
	.uleb128 0x9
	.4byte	.LASF36
	.byte	0x4
	.2byte	0x351
	.4byte	0xb3
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x352
	.4byte	0x81
	.byte	0x12
	.uleb128 0x9
	.4byte	.LASF37
	.byte	0x4
	.2byte	0x353
	.4byte	0x9e
	.byte	0x14
	.uleb128 0xa
	.ascii	"RQR\000"
	.byte	0x4
	.2byte	0x354
	.4byte	0xb3
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x355
	.4byte	0x81
	.byte	0x1a
	.uleb128 0xa
	.ascii	"ISR\000"
	.byte	0x4
	.2byte	0x356
	.4byte	0x9e
	.byte	0x1c
	.uleb128 0xa
	.ascii	"ICR\000"
	.byte	0x4
	.2byte	0x357
	.4byte	0x9e
	.byte	0x20
	.uleb128 0xa
	.ascii	"RDR\000"
	.byte	0x4
	.2byte	0x358
	.4byte	0xb3
	.byte	0x24
	.uleb128 0x9
	.4byte	.LASF38
	.byte	0x4
	.2byte	0x359
	.4byte	0x81
	.byte	0x26
	.uleb128 0xa
	.ascii	"TDR\000"
	.byte	0x4
	.2byte	0x35a
	.4byte	0xb3
	.byte	0x28
	.uleb128 0x9
	.4byte	.LASF39
	.byte	0x4
	.2byte	0x35b
	.4byte	0x81
	.byte	0x2a
	.byte	0
	.uleb128 0xb
	.4byte	.LASF40
	.byte	0x4
	.2byte	0x35c
	.4byte	0x254
	.uleb128 0xc
	.4byte	.LASF41
	.byte	0x1
	.byte	0x9
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x35e
	.uleb128 0xd
	.4byte	.LASF43
	.byte	0x1
	.byte	0xb
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0xe
	.4byte	.LASF42
	.byte	0x1
	.byte	0x18
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x380
	.uleb128 0xf
	.ascii	"i\000"
	.byte	0x1
	.byte	0x19
	.4byte	0x380
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x5
	.4byte	0x73
	.uleb128 0x10
	.4byte	.LASF44
	.byte	0x1
	.byte	0x1f
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.4byte	.LASF45
	.byte	0x1
	.byte	0x33
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
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
	.byte	0x1
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
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
.LASF18:
	.ascii	"PUPDR\000"
.LASF22:
	.ascii	"LCKR\000"
.LASF15:
	.ascii	"OTYPER\000"
.LASF14:
	.ascii	"MODER\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF46:
	.ascii	"GNU C 4.8.3 20140228 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 208322] -mcpu=cortex-m0 -mthumb -g\000"
.LASF8:
	.ascii	"long long int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF21:
	.ascii	"BSRR\000"
.LASF36:
	.ascii	"GTPR\000"
.LASF4:
	.ascii	"long int\000"
.LASF26:
	.ascii	"APB2RSTR\000"
.LASF11:
	.ascii	"uint16_t\000"
.LASF17:
	.ascii	"OSPEEDR\000"
.LASF6:
	.ascii	"__uint32_t\000"
.LASF10:
	.ascii	"unsigned int\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF24:
	.ascii	"GPIO_TypeDef\000"
.LASF35:
	.ascii	"RCC_TypeDef\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF47:
	.ascii	"main.c\000"
.LASF13:
	.ascii	"sizetype\000"
.LASF32:
	.ascii	"AHBRSTR\000"
.LASF27:
	.ascii	"APB1RSTR\000"
.LASF16:
	.ascii	"RESERVED0\000"
.LASF19:
	.ascii	"RESERVED1\000"
.LASF20:
	.ascii	"RESERVED2\000"
.LASF23:
	.ascii	"RESERVED3\000"
.LASF38:
	.ascii	"RESERVED4\000"
.LASF39:
	.ascii	"RESERVED5\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF40:
	.ascii	"USART_TypeDef\000"
.LASF45:
	.ascii	"init_leds\000"
.LASF42:
	.ascii	"delay\000"
.LASF2:
	.ascii	"short int\000"
.LASF29:
	.ascii	"APB2ENR\000"
.LASF12:
	.ascii	"uint32_t\000"
.LASF48:
	.ascii	"/home/jgowans/STM32F0_Development/JGowans-sample-pr"
	.ascii	"ojects/usart\000"
.LASF5:
	.ascii	"__uint16_t\000"
.LASF44:
	.ascii	"init_usart\000"
.LASF37:
	.ascii	"RTOR\000"
.LASF30:
	.ascii	"APB1ENR\000"
.LASF43:
	.ascii	"received\000"
.LASF31:
	.ascii	"BDCR\000"
.LASF33:
	.ascii	"CFGR2\000"
.LASF34:
	.ascii	"CFGR3\000"
.LASF25:
	.ascii	"CFGR\000"
.LASF41:
	.ascii	"main\000"
.LASF28:
	.ascii	"AHBENR\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.8.3 20140228 (release) [ARM/embedded-4_8-branch revision 208322]"
