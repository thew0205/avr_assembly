	.file	"led_chaser.s"
_SPH_ = 0x3e
_SPL_ = 0x3d
_SREG_ = 0x3f
_tmp_reg_ = 0
_zero_reg_ = 1
delay_time = 500000

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


.org 0x0068
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
	ldi r18,lo8(0xff)
	out 0xA, r18 ; set all pin in port D as output
	ldi r18,0x5
	out 0xb,r18
	ldi r19, lo8(-1)
.L4:
	in r16,0xb; read the port D state
    clc; clear the carry bit is status register
	rol r16 ; rotate the bit to the right
    brcc skip; if the last bit overflows into the carry bit
    inc r16; add 1 to compensate for the carry
skip:
	out 0xb,r16

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
default_excetpion:
	rjmp default_excetpion

