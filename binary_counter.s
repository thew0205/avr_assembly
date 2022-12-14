	.file	"binary_counter.s"
_SPH_ = 0x3e
_SPL_ = 0x3d
_SREG_ = 0x3f
_tmp_reg_ = 0
_zero_reg_ = 1
delay_time = 100000
	.text
	.section	.text
.global	main
	.type	main, @function
.vector:
	jmp init; reset vector first code to execute
	jmp default_excetpion ; the 24 interrupt source
	jmp default_excetpion
	jmp default_excetpion
	jmp default_excetpion
	jmp default_excetpion
	jmp default_excetpion
	jmp default_excetpion
	jmp default_excetpion
	jmp default_excetpion
	jmp default_excetpion
	jmp default_excetpion
	jmp default_excetpion
	jmp default_excetpion
	jmp default_excetpion
	jmp default_excetpion
	jmp default_excetpion
	jmp default_excetpion
	jmp default_excetpion
	jmp default_excetpion
	jmp default_excetpion
	jmp default_excetpion
	jmp default_excetpion
	jmp default_excetpion
	jmp default_excetpion
	jmp default_excetpion


.org 0x68
init:
.L__stack_usage = 0
	cli;  disable interrupt
	eor r16, r16 ; a xor a is always zero
	out _SREG_, r16 ; clear the sreg register 
	ldi r16,lo8(0x080ff) ;set the stack pointer to 0X080ff even though I wont be using it 
	out _SPH_, r16
	ldi r16, hi8(0x080ff)
	out _SPL_, r16

main:
	;sbi 0xA,7
	ldi r18,lo8(0xff)
	out 0xA, r18 ; set all pin in port D as output
	ldi r18,0xff
	out 0xb,r18
	ldi r19, 0x00
.L4:
	inc r19
	out 0xb,r19
	; busy wait delay
    ; using 4 byte for the delay time
	ldi r24,lo8(delay_time)
	ldi r25,hi8(delay_time)
	ldi r26,hlo8(delay_time)
	ldi r27,hhi8(delay_time)
.delay_loop:
	cpi r24,0
	cpc r25,_zero_reg_
	cpc r26,_zero_reg_
	cpc r27,_zero_reg_
	brlt .L4
	sbiw r24,1
	sbc r26,_zero_reg_
	sbc r27,_zero_reg_
	rjmp .delay_loop
	rjmp .exit
	.size	main, .-main

.exit:
	jmp init; restart device

default_excetpion:
	rjmp default_excetpion


