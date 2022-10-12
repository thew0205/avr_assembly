	.file	"main.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	delay
	.type	delay, @function
delay:
	push r28
	push r29
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 4 */
/* stack size = 6 */
.L__stack_usage = 6
	std Y+1,r22
	std Y+2,r23
	std Y+3,r24
	std Y+4,r25
.L2:
	ldd r24,Y+1
	ldd r25,Y+2
	ldd r26,Y+3
	ldd r27,Y+4
	sbiw r24,4
	cpc r26,__zero_reg__
	cpc r27,__zero_reg__
	brge .L3
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	ret
.L3:
	ldd r24,Y+1
	ldd r25,Y+2
	ldd r26,Y+3
	ldd r27,Y+4
	sbiw r24,1
	sbc r26,__zero_reg__
	sbc r27,__zero_reg__
	std Y+1,r24
	std Y+2,r25
	std Y+3,r26
	std Y+4,r27
	rjmp .L2
	.size	delay, .-delay
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbi 0x4,5
	ldi r28,lo8(32)
.L5:
	in r24,0x5
	eor r24,r28
	out 0x5,r24
	ldi r22,lo8(-96)
	ldi r23,lo8(-122)
	ldi r24,lo8(1)
	ldi r25,0
	call delay
	rjmp .L5
	.size	main, .-main
.global	a3
	.section	.rodata
	.type	a3, @object
	.size	a3, 2
a3:
	.word	8
.global	a1
	.data
	.type	a1, @object
	.size	a1, 1
a1:
	.byte	7
.global	a12
	.type	a12, @object
	.size	a12, 2
a12:
	.word	8
	.ident	"GCC: (AVR_8_bit_GNU_Toolchain_3.7.0_1796) 7.3.0"
.global __do_copy_data
