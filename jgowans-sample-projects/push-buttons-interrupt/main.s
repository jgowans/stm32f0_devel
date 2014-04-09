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
	.code	16
	.thumb_func
	.type	NVIC_EnableIRQ, %function
NVIC_EnableIRQ:
.LFB24:
	.file 1 "C:\\STM32F0_Development\\STM32F0xx_StdPeriph_Lib_V1.3.1\\Libraries\\CMSIS\\Include/core_cm0.h"
	.loc 1 516 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	mov	r2, r0
	add	r3, r7, #7
	strb	r2, [r3]
	.loc 1 517 0
	ldr	r3, .L2
	add	r2, r7, #7
	ldrb	r2, [r2]
	mov	r1, r2
	mov	r2, #31
	and	r2, r1
	mov	r1, #1
	mov	r0, r1
	lsl	r0, r0, r2
	mov	r2, r0
	str	r2, [r3]
	.loc 1 518 0
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L3:
	.align	2
.L2:
	.word	-536813312
	.cfi_endproc
.LFE24:
	.size	NVIC_EnableIRQ, .-NVIC_EnableIRQ
	.align	2
	.global	main
	.code	16
	.thumb_func
	.type	main, %function
main:
.LFB33:
	.file 2 "main.c"
	.loc 2 12 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 2 13 0
	bl	init_leds
	.loc 2 14 0
	bl	init_push_buttons
	.loc 2 15 0
	bl	init_EXTI
	.loc 2 16 0
	bl	init_NVIC
.L7:
	.loc 2 19 0
	ldr	r2, .L8
	ldr	r3, .L8
	ldr	r3, [r3, #20]
	uxth	r3, r3
	add	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r2, #20]
.LBB2:
	.loc 2 20 0
	mov	r3, #0
	str	r3, [r7, #4]
	b	.L5
.L6:
	.loc 2 20 0 is_stmt 0 discriminator 2
	ldr	r3, [r7, #4]
	add	r3, r3, #1
	str	r3, [r7, #4]
.L5:
	.loc 2 20 0 discriminator 1
	ldr	r2, [r7, #4]
	ldr	r3, .L8+4
	cmp	r2, r3
	ble	.L6
.LBE2:
	.loc 2 21 0 is_stmt 1
	b	.L7
.L9:
	.align	2
.L8:
	.word	1207960576
	.word	65534
	.cfi_endproc
.LFE33:
	.size	main, .-main
	.align	2
	.global	EXTI4_15_IRQHandler
	.code	16
	.thumb_func
	.type	EXTI4_15_IRQHandler, %function
EXTI4_15_IRQHandler:
.LFB34:
	.loc 2 25 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 2 26 0
	ldr	r3, .L11
	ldr	r2, .L11
	ldr	r2, [r2, #20]
	mov	r1, #128
	lsl	r1, r1, #5
	orr	r2, r1
	str	r2, [r3, #20]
	.loc 2 27 0
	ldr	r3, .L11+4
	mov	r2, #0
	strh	r2, [r3, #20]
	.loc 2 28 0
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L12:
	.align	2
.L11:
	.word	1073808384
	.word	1207960576
	.cfi_endproc
.LFE34:
	.size	EXTI4_15_IRQHandler, .-EXTI4_15_IRQHandler
	.align	2
	.global	init_leds
	.code	16
	.thumb_func
	.type	init_leds, %function
init_leds:
.LFB35:
	.loc 2 30 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 2 31 0
	ldr	r3, .L14
	ldr	r2, .L14
	ldr	r2, [r2, #20]
	mov	r1, #128
	lsl	r1, r1, #11
	orr	r2, r1
	str	r2, [r3, #20]
	.loc 2 32 0
	ldr	r3, .L14+4
	ldr	r2, .L14+4
	ldr	r2, [r2]
	mov	r1, #1
	orr	r2, r1
	str	r2, [r3]
	.loc 2 33 0
	ldr	r3, .L14+4
	ldr	r2, .L14+4
	ldr	r2, [r2]
	mov	r1, #4
	orr	r2, r1
	str	r2, [r3]
	.loc 2 34 0
	ldr	r3, .L14+4
	ldr	r2, .L14+4
	ldr	r2, [r2]
	mov	r1, #16
	orr	r2, r1
	str	r2, [r3]
	.loc 2 35 0
	ldr	r3, .L14+4
	ldr	r2, .L14+4
	ldr	r2, [r2]
	mov	r1, #64
	orr	r2, r1
	str	r2, [r3]
	.loc 2 36 0
	ldr	r3, .L14+4
	ldr	r2, .L14+4
	ldr	r2, [r2]
	mov	r1, #128
	lsl	r1, r1, #1
	orr	r2, r1
	str	r2, [r3]
	.loc 2 37 0
	ldr	r3, .L14+4
	ldr	r2, .L14+4
	ldr	r2, [r2]
	mov	r1, #128
	lsl	r1, r1, #3
	orr	r2, r1
	str	r2, [r3]
	.loc 2 38 0
	ldr	r3, .L14+4
	ldr	r2, .L14+4
	ldr	r2, [r2]
	mov	r1, #128
	lsl	r1, r1, #5
	orr	r2, r1
	str	r2, [r3]
	.loc 2 39 0
	ldr	r3, .L14+4
	ldr	r2, .L14+4
	ldr	r2, [r2]
	mov	r1, #128
	lsl	r1, r1, #7
	orr	r2, r1
	str	r2, [r3]
	.loc 2 40 0
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L15:
	.align	2
.L14:
	.word	1073876992
	.word	1207960576
	.cfi_endproc
.LFE35:
	.size	init_leds, .-init_leds
	.align	2
	.global	init_push_buttons
	.code	16
	.thumb_func
	.type	init_push_buttons, %function
init_push_buttons:
.LFB36:
	.loc 2 42 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 2 43 0
	ldr	r3, .L17
	ldr	r2, .L17
	ldr	r2, [r2, #20]
	mov	r1, #128
	lsl	r1, r1, #11
	orr	r2, r1
	str	r2, [r3, #20]
	.loc 2 45 0
	ldr	r3, .L17+4
	ldr	r2, .L17+4
	ldr	r1, [r2]
	ldr	r2, .L17+8
	and	r2, r1
	str	r2, [r3]
	.loc 2 46 0
	ldr	r3, .L17+4
	ldr	r2, .L17+4
	ldr	r1, [r2]
	ldr	r2, .L17+12
	and	r2, r1
	str	r2, [r3]
	.loc 2 47 0
	ldr	r3, .L17+4
	ldr	r2, .L17+4
	ldr	r1, [r2]
	ldr	r2, .L17+16
	and	r2, r1
	str	r2, [r3]
	.loc 2 48 0
	ldr	r3, .L17+4
	ldr	r2, .L17+4
	ldr	r2, [r2]
	lsl	r2, r2, #2
	lsr	r2, r2, #2
	str	r2, [r3]
	.loc 2 50 0
	ldr	r3, .L17+4
	ldr	r2, .L17+4
	ldr	r2, [r2, #12]
	mov	r1, #128
	lsl	r1, r1, #17
	orr	r2, r1
	str	r2, [r3, #12]
	.loc 2 51 0
	ldr	r3, .L17+4
	ldr	r2, .L17+4
	ldr	r2, [r2, #12]
	mov	r1, #128
	lsl	r1, r1, #19
	orr	r2, r1
	str	r2, [r3, #12]
	.loc 2 52 0
	ldr	r3, .L17+4
	ldr	r2, .L17+4
	ldr	r2, [r2, #12]
	mov	r1, #128
	lsl	r1, r1, #21
	orr	r2, r1
	str	r2, [r3, #12]
	.loc 2 53 0
	ldr	r3, .L17+4
	ldr	r2, .L17+4
	ldr	r2, [r2, #12]
	mov	r1, #128
	lsl	r1, r1, #23
	orr	r2, r1
	str	r2, [r3, #12]
	.loc 2 54 0
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L18:
	.align	2
.L17:
	.word	1073876992
	.word	1207960576
	.word	-50331649
	.word	-201326593
	.word	-805306369
	.cfi_endproc
.LFE36:
	.size	init_push_buttons, .-init_push_buttons
	.align	2
	.global	init_EXTI
	.code	16
	.thumb_func
	.type	init_EXTI, %function
init_EXTI:
.LFB37:
	.loc 2 56 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 2 57 0
	ldr	r3, .L20
	ldr	r2, .L20
	ldr	r2, [r2, #24]
	mov	r1, #1
	orr	r2, r1
	str	r2, [r3, #24]
	.loc 2 58 0
	ldr	r3, .L20+4
	ldr	r2, .L20+4
	ldr	r2, [r2, #20]
	mov	r1, #1
	orr	r2, r1
	str	r2, [r3, #20]
	.loc 2 59 0
	ldr	r3, .L20+8
	ldr	r2, .L20+8
	ldr	r2, [r2]
	mov	r1, #128
	lsl	r1, r1, #5
	orr	r2, r1
	str	r2, [r3]
	.loc 2 60 0
	ldr	r3, .L20+8
	ldr	r2, .L20+8
	ldr	r2, [r2, #8]
	mov	r1, #128
	lsl	r1, r1, #5
	orr	r2, r1
	str	r2, [r3, #8]
	.loc 2 62 0
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L21:
	.align	2
.L20:
	.word	1073876992
	.word	1073807360
	.word	1073808384
	.cfi_endproc
.LFE37:
	.size	init_EXTI, .-init_EXTI
	.align	2
	.global	init_NVIC
	.code	16
	.thumb_func
	.type	init_NVIC, %function
init_NVIC:
.LFB38:
	.loc 2 63 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 2 64 0
	mov	r0, #7
	bl	NVIC_EnableIRQ
	.loc 2 65 0
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE38:
	.size	init_NVIC, .-init_NVIC
.Letext0:
	.file 3 "c:\\program files (x86)\\gnu tools arm embedded\\4.8 2013q4\\arm-none-eabi\\include\\stdint.h"
	.file 4 "C:\\STM32F0_Development\\STM32F0xx_StdPeriph_Lib_V1.3.1\\Libraries\\CMSIS\\Device\\ST\\STM32F0xx\\Include/stm32f0xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x597
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF92
	.byte	0x1
	.4byte	.LASF93
	.4byte	.LASF94
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
	.byte	0x3
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
	.byte	0x3
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
	.uleb128 0x5
	.4byte	.LASF95
	.byte	0x1
	.byte	0x4
	.byte	0xc7
	.4byte	0x16c
	.uleb128 0x6
	.4byte	.LASF11
	.sleb128 -14
	.uleb128 0x6
	.4byte	.LASF12
	.sleb128 -13
	.uleb128 0x6
	.4byte	.LASF13
	.sleb128 -5
	.uleb128 0x6
	.4byte	.LASF14
	.sleb128 -2
	.uleb128 0x6
	.4byte	.LASF15
	.sleb128 -1
	.uleb128 0x6
	.4byte	.LASF16
	.sleb128 0
	.uleb128 0x6
	.4byte	.LASF17
	.sleb128 1
	.uleb128 0x6
	.4byte	.LASF18
	.sleb128 2
	.uleb128 0x6
	.4byte	.LASF19
	.sleb128 3
	.uleb128 0x6
	.4byte	.LASF20
	.sleb128 4
	.uleb128 0x6
	.4byte	.LASF21
	.sleb128 5
	.uleb128 0x6
	.4byte	.LASF22
	.sleb128 6
	.uleb128 0x6
	.4byte	.LASF23
	.sleb128 7
	.uleb128 0x6
	.4byte	.LASF24
	.sleb128 8
	.uleb128 0x6
	.4byte	.LASF25
	.sleb128 9
	.uleb128 0x6
	.4byte	.LASF26
	.sleb128 10
	.uleb128 0x6
	.4byte	.LASF27
	.sleb128 11
	.uleb128 0x6
	.4byte	.LASF28
	.sleb128 12
	.uleb128 0x6
	.4byte	.LASF29
	.sleb128 13
	.uleb128 0x6
	.4byte	.LASF30
	.sleb128 14
	.uleb128 0x6
	.4byte	.LASF31
	.sleb128 15
	.uleb128 0x6
	.4byte	.LASF32
	.sleb128 16
	.uleb128 0x6
	.4byte	.LASF33
	.sleb128 17
	.uleb128 0x6
	.4byte	.LASF34
	.sleb128 18
	.uleb128 0x6
	.4byte	.LASF35
	.sleb128 19
	.uleb128 0x6
	.4byte	.LASF36
	.sleb128 20
	.uleb128 0x6
	.4byte	.LASF37
	.sleb128 21
	.uleb128 0x6
	.4byte	.LASF38
	.sleb128 22
	.uleb128 0x6
	.4byte	.LASF39
	.sleb128 23
	.uleb128 0x6
	.4byte	.LASF40
	.sleb128 24
	.uleb128 0x6
	.4byte	.LASF41
	.sleb128 25
	.uleb128 0x6
	.4byte	.LASF42
	.sleb128 26
	.uleb128 0x6
	.4byte	.LASF43
	.sleb128 27
	.uleb128 0x6
	.4byte	.LASF44
	.sleb128 28
	.uleb128 0x6
	.4byte	.LASF45
	.sleb128 29
	.uleb128 0x6
	.4byte	.LASF46
	.sleb128 30
	.uleb128 0x6
	.4byte	.LASF47
	.sleb128 31
	.byte	0
	.uleb128 0x7
	.4byte	.LASF48
	.byte	0x4
	.2byte	0x15f
	.4byte	0x81
	.uleb128 0x8
	.2byte	0x320
	.byte	0x1
	.2byte	0x118
	.4byte	0x20a
	.uleb128 0x9
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x11a
	.4byte	0x221
	.byte	0
	.uleb128 0x9
	.4byte	.LASF50
	.byte	0x1
	.2byte	0x11b
	.4byte	0x226
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x11c
	.4byte	0x236
	.byte	0x80
	.uleb128 0x9
	.4byte	.LASF52
	.byte	0x1
	.2byte	0x11d
	.4byte	0x226
	.byte	0x84
	.uleb128 0xa
	.4byte	.LASF53
	.byte	0x1
	.2byte	0x11e
	.4byte	0x23b
	.2byte	0x100
	.uleb128 0xa
	.4byte	.LASF54
	.byte	0x1
	.2byte	0x11f
	.4byte	0x226
	.2byte	0x104
	.uleb128 0xa
	.4byte	.LASF55
	.byte	0x1
	.2byte	0x120
	.4byte	0x240
	.2byte	0x180
	.uleb128 0xa
	.4byte	.LASF56
	.byte	0x1
	.2byte	0x121
	.4byte	0x226
	.2byte	0x184
	.uleb128 0xa
	.4byte	.LASF57
	.byte	0x1
	.2byte	0x122
	.4byte	0x245
	.2byte	0x200
	.uleb128 0xb
	.ascii	"IP\000"
	.byte	0x1
	.2byte	0x123
	.4byte	0x265
	.2byte	0x300
	.byte	0
	.uleb128 0xc
	.4byte	0x53
	.4byte	0x21a
	.uleb128 0xd
	.4byte	0x21a
	.byte	0
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF58
	.uleb128 0xe
	.4byte	0x20a
	.uleb128 0xc
	.4byte	0x53
	.4byte	0x236
	.uleb128 0xd
	.4byte	0x21a
	.byte	0x1e
	.byte	0
	.uleb128 0xe
	.4byte	0x20a
	.uleb128 0xe
	.4byte	0x20a
	.uleb128 0xe
	.4byte	0x20a
	.uleb128 0xc
	.4byte	0x53
	.4byte	0x255
	.uleb128 0xd
	.4byte	0x21a
	.byte	0x3f
	.byte	0
	.uleb128 0xc
	.4byte	0x53
	.4byte	0x265
	.uleb128 0xd
	.4byte	0x21a
	.byte	0x7
	.byte	0
	.uleb128 0xe
	.4byte	0x255
	.uleb128 0x7
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x124
	.4byte	0x178
	.uleb128 0xe
	.4byte	0x53
	.uleb128 0xc
	.4byte	0x53
	.4byte	0x28b
	.uleb128 0xd
	.4byte	0x21a
	.byte	0x1
	.byte	0
	.uleb128 0xf
	.byte	0x18
	.byte	0x4
	.2byte	0x23a
	.4byte	0x2e2
	.uleb128 0x10
	.ascii	"IMR\000"
	.byte	0x4
	.2byte	0x23c
	.4byte	0x276
	.byte	0
	.uleb128 0x10
	.ascii	"EMR\000"
	.byte	0x4
	.2byte	0x23d
	.4byte	0x276
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF60
	.byte	0x4
	.2byte	0x23e
	.4byte	0x276
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF61
	.byte	0x4
	.2byte	0x23f
	.4byte	0x276
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF62
	.byte	0x4
	.2byte	0x240
	.4byte	0x276
	.byte	0x10
	.uleb128 0x10
	.ascii	"PR\000"
	.byte	0x4
	.2byte	0x241
	.4byte	0x276
	.byte	0x14
	.byte	0
	.uleb128 0x7
	.4byte	.LASF63
	.byte	0x4
	.2byte	0x242
	.4byte	0x28b
	.uleb128 0xe
	.4byte	0x3a
	.uleb128 0xf
	.byte	0x2c
	.byte	0x4
	.2byte	0x269
	.4byte	0x3b3
	.uleb128 0x9
	.4byte	.LASF64
	.byte	0x4
	.2byte	0x26b
	.4byte	0x276
	.byte	0
	.uleb128 0x9
	.4byte	.LASF65
	.byte	0x4
	.2byte	0x26c
	.4byte	0x2ee
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF50
	.byte	0x4
	.2byte	0x26d
	.4byte	0x3a
	.byte	0x6
	.uleb128 0x9
	.4byte	.LASF66
	.byte	0x4
	.2byte	0x26e
	.4byte	0x276
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF67
	.byte	0x4
	.2byte	0x26f
	.4byte	0x276
	.byte	0xc
	.uleb128 0x10
	.ascii	"IDR\000"
	.byte	0x4
	.2byte	0x270
	.4byte	0x2ee
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF68
	.byte	0x4
	.2byte	0x271
	.4byte	0x3a
	.byte	0x12
	.uleb128 0x10
	.ascii	"ODR\000"
	.byte	0x4
	.2byte	0x272
	.4byte	0x2ee
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF54
	.byte	0x4
	.2byte	0x273
	.4byte	0x3a
	.byte	0x16
	.uleb128 0x9
	.4byte	.LASF69
	.byte	0x4
	.2byte	0x274
	.4byte	0x276
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF70
	.byte	0x4
	.2byte	0x275
	.4byte	0x276
	.byte	0x1c
	.uleb128 0x10
	.ascii	"AFR\000"
	.byte	0x4
	.2byte	0x276
	.4byte	0x3b3
	.byte	0x20
	.uleb128 0x10
	.ascii	"BRR\000"
	.byte	0x4
	.2byte	0x277
	.4byte	0x2ee
	.byte	0x28
	.uleb128 0x9
	.4byte	.LASF56
	.byte	0x4
	.2byte	0x278
	.4byte	0x3a
	.byte	0x2a
	.byte	0
	.uleb128 0xe
	.4byte	0x27b
	.uleb128 0x7
	.4byte	.LASF71
	.byte	0x4
	.2byte	0x279
	.4byte	0x2f3
	.uleb128 0xf
	.byte	0x1c
	.byte	0x4
	.2byte	0x27f
	.4byte	0x402
	.uleb128 0x9
	.4byte	.LASF72
	.byte	0x4
	.2byte	0x281
	.4byte	0x276
	.byte	0
	.uleb128 0x9
	.4byte	.LASF73
	.byte	0x4
	.2byte	0x282
	.4byte	0x53
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF74
	.byte	0x4
	.2byte	0x283
	.4byte	0x412
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF75
	.byte	0x4
	.2byte	0x284
	.4byte	0x276
	.byte	0x18
	.byte	0
	.uleb128 0xc
	.4byte	0x53
	.4byte	0x412
	.uleb128 0xd
	.4byte	0x21a
	.byte	0x3
	.byte	0
	.uleb128 0xe
	.4byte	0x402
	.uleb128 0x7
	.4byte	.LASF76
	.byte	0x4
	.2byte	0x285
	.4byte	0x3c4
	.uleb128 0xf
	.byte	0x38
	.byte	0x4
	.2byte	0x2b5
	.4byte	0x4e2
	.uleb128 0x10
	.ascii	"CR\000"
	.byte	0x4
	.2byte	0x2b7
	.4byte	0x276
	.byte	0
	.uleb128 0x9
	.4byte	.LASF77
	.byte	0x4
	.2byte	0x2b8
	.4byte	0x276
	.byte	0x4
	.uleb128 0x10
	.ascii	"CIR\000"
	.byte	0x4
	.2byte	0x2b9
	.4byte	0x276
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF78
	.byte	0x4
	.2byte	0x2ba
	.4byte	0x276
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF79
	.byte	0x4
	.2byte	0x2bb
	.4byte	0x276
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF80
	.byte	0x4
	.2byte	0x2bc
	.4byte	0x276
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF81
	.byte	0x4
	.2byte	0x2bd
	.4byte	0x276
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF82
	.byte	0x4
	.2byte	0x2be
	.4byte	0x276
	.byte	0x1c
	.uleb128 0x9
	.4byte	.LASF83
	.byte	0x4
	.2byte	0x2bf
	.4byte	0x276
	.byte	0x20
	.uleb128 0x10
	.ascii	"CSR\000"
	.byte	0x4
	.2byte	0x2c0
	.4byte	0x276
	.byte	0x24
	.uleb128 0x9
	.4byte	.LASF84
	.byte	0x4
	.2byte	0x2c1
	.4byte	0x276
	.byte	0x28
	.uleb128 0x9
	.4byte	.LASF75
	.byte	0x4
	.2byte	0x2c2
	.4byte	0x276
	.byte	0x2c
	.uleb128 0x9
	.4byte	.LASF85
	.byte	0x4
	.2byte	0x2c3
	.4byte	0x276
	.byte	0x30
	.uleb128 0x10
	.ascii	"CR2\000"
	.byte	0x4
	.2byte	0x2c4
	.4byte	0x276
	.byte	0x34
	.byte	0
	.uleb128 0x7
	.4byte	.LASF86
	.byte	0x4
	.2byte	0x2c5
	.4byte	0x423
	.uleb128 0x11
	.4byte	.LASF96
	.byte	0x1
	.2byte	0x203
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x514
	.uleb128 0x12
	.4byte	.LASF95
	.byte	0x1
	.2byte	0x203
	.4byte	0x16c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x13
	.4byte	.LASF97
	.byte	0x2
	.byte	0xb
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x540
	.uleb128 0x14
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x15
	.ascii	"i\000"
	.byte	0x2
	.byte	0x14
	.4byte	0x540
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	0x73
	.uleb128 0x16
	.4byte	.LASF87
	.byte	0x2
	.byte	0x19
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x16
	.4byte	.LASF88
	.byte	0x2
	.byte	0x1e
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x16
	.4byte	.LASF89
	.byte	0x2
	.byte	0x2a
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x16
	.4byte	.LASF90
	.byte	0x2
	.byte	0x38
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.4byte	.LASF91
	.byte	0x2
	.byte	0x3f
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
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
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0x5
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
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
.LASF55:
	.ascii	"ICPR\000"
.LASF67:
	.ascii	"PUPDR\000"
.LASF70:
	.ascii	"LCKR\000"
.LASF65:
	.ascii	"OTYPER\000"
.LASF62:
	.ascii	"SWIER\000"
.LASF64:
	.ascii	"MODER\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF90:
	.ascii	"init_EXTI\000"
.LASF53:
	.ascii	"ISPR\000"
.LASF16:
	.ascii	"WWDG_IRQn\000"
.LASF8:
	.ascii	"long long int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF24:
	.ascii	"TSC_IRQn\000"
.LASF69:
	.ascii	"BSRR\000"
.LASF40:
	.ascii	"I2C2_IRQn\000"
.LASF4:
	.ascii	"long int\000"
.LASF78:
	.ascii	"APB2RSTR\000"
.LASF87:
	.ascii	"EXTI4_15_IRQHandler\000"
.LASF92:
	.ascii	"GNU C 4.8.3 20131129 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 205641] -mcpu=cortex-m0 -mthumb -g -s"
	.ascii	"td=c99\000"
.LASF5:
	.ascii	"uint16_t\000"
.LASF33:
	.ascii	"TIM6_DAC_IRQn\000"
.LASF12:
	.ascii	"HardFault_IRQn\000"
.LASF66:
	.ascii	"OSPEEDR\000"
.LASF29:
	.ascii	"TIM1_BRK_UP_TRG_COM_IRQn\000"
.LASF28:
	.ascii	"ADC1_COMP_IRQn\000"
.LASF10:
	.ascii	"unsigned int\000"
.LASF35:
	.ascii	"TIM14_IRQn\000"
.LASF60:
	.ascii	"RTSR\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF71:
	.ascii	"GPIO_TypeDef\000"
.LASF86:
	.ascii	"RCC_TypeDef\000"
.LASF45:
	.ascii	"USART3_4_IRQn\000"
.LASF27:
	.ascii	"DMA1_Channel4_5_6_7_IRQn\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF80:
	.ascii	"AHBENR\000"
.LASF41:
	.ascii	"SPI1_IRQn\000"
.LASF93:
	.ascii	"main.c\000"
.LASF36:
	.ascii	"TIM15_IRQn\000"
.LASF15:
	.ascii	"SysTick_IRQn\000"
.LASF30:
	.ascii	"TIM1_CC_IRQn\000"
.LASF94:
	.ascii	"C:\\STM32F0_Development\\JGowans-sample-projects\\p"
	.ascii	"ush-buttons-interrupt\000"
.LASF58:
	.ascii	"sizetype\000"
.LASF42:
	.ascii	"SPI2_IRQn\000"
.LASF47:
	.ascii	"USB_IRQn\000"
.LASF51:
	.ascii	"ICER\000"
.LASF84:
	.ascii	"AHBRSTR\000"
.LASF79:
	.ascii	"APB1RSTR\000"
.LASF37:
	.ascii	"TIM16_IRQn\000"
.LASF25:
	.ascii	"DMA1_Channel1_IRQn\000"
.LASF76:
	.ascii	"SYSCFG_TypeDef\000"
.LASF91:
	.ascii	"init_NVIC\000"
.LASF50:
	.ascii	"RESERVED0\000"
.LASF68:
	.ascii	"RESERVED1\000"
.LASF54:
	.ascii	"RESERVED2\000"
.LASF56:
	.ascii	"RESERVED3\000"
.LASF43:
	.ascii	"USART1_IRQn\000"
.LASF20:
	.ascii	"RCC_CRS_IRQn\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF44:
	.ascii	"USART2_IRQn\000"
.LASF88:
	.ascii	"init_leds\000"
.LASF61:
	.ascii	"FTSR\000"
.LASF2:
	.ascii	"short int\000"
.LASF49:
	.ascii	"ISER\000"
.LASF59:
	.ascii	"NVIC_Type\000"
.LASF23:
	.ascii	"EXTI4_15_IRQn\000"
.LASF73:
	.ascii	"RESERVED\000"
.LASF96:
	.ascii	"NVIC_EnableIRQ\000"
.LASF17:
	.ascii	"PVD_VDDIO2_IRQn\000"
.LASF38:
	.ascii	"TIM17_IRQn\000"
.LASF39:
	.ascii	"I2C1_IRQn\000"
.LASF19:
	.ascii	"FLASH_IRQn\000"
.LASF48:
	.ascii	"IRQn_Type\000"
.LASF89:
	.ascii	"init_push_buttons\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF14:
	.ascii	"PendSV_IRQn\000"
.LASF26:
	.ascii	"DMA1_Channel2_3_IRQn\000"
.LASF34:
	.ascii	"TIM7_IRQn\000"
.LASF22:
	.ascii	"EXTI2_3_IRQn\000"
.LASF11:
	.ascii	"NonMaskableInt_IRQn\000"
.LASF82:
	.ascii	"APB1ENR\000"
.LASF95:
	.ascii	"IRQn\000"
.LASF57:
	.ascii	"RESERVED4\000"
.LASF21:
	.ascii	"EXTI0_1_IRQn\000"
.LASF81:
	.ascii	"APB2ENR\000"
.LASF31:
	.ascii	"TIM2_IRQn\000"
.LASF83:
	.ascii	"BDCR\000"
.LASF72:
	.ascii	"CFGR1\000"
.LASF75:
	.ascii	"CFGR2\000"
.LASF85:
	.ascii	"CFGR3\000"
.LASF52:
	.ascii	"RSERVED1\000"
.LASF77:
	.ascii	"CFGR\000"
.LASF63:
	.ascii	"EXTI_TypeDef\000"
.LASF18:
	.ascii	"RTC_IRQn\000"
.LASF97:
	.ascii	"main\000"
.LASF46:
	.ascii	"CEC_CAN_IRQn\000"
.LASF32:
	.ascii	"TIM3_IRQn\000"
.LASF74:
	.ascii	"EXTICR\000"
.LASF13:
	.ascii	"SVC_IRQn\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.8.3 20131129 (release) [ARM/embedded-4_8-branch revision 205641]"
