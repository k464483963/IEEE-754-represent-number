@ tell the assembler what the hardward is
	.arch	armv6			@ armv6 instruction set
	.cpu    cortex-a53		@ cpu type
	.syntax  unified		@ allow modern syntax

@ List external functions call and #defines and "magic" numbers
	.extern  printf		@ pre-defined putchar function
	.extern	 fprintf
	.extern	 parseNum
	.extern	 extractParts
	.equ     FP_OFFSET, 12		@ fp offset in frame
	.equ	 CHAR_SIGN, -16
	.equ	 CHAR_EXP, -17
	.equ	 BYTE_MANTASSIA, -20
	
@ read-only data segment
	.section .rodata		@ start of read-only literals
mesg:	.asciz	"Incorrect number of arguments.\n"
mesg3:	.asciz	"Sign Bit: %u\n"
mesg2:	.asciz	"\nUsage ./fpdec {hexString}\n\n"
mesg4:	.asciz  "Unbiased Exponent: %hhd\n"
mesg5:	.asciz  "Mantissa: %lx\n"

@ Text segment
	.text			@ start of the text segment
	.type	 main, %function	@ define main to be a function
	.global  main			@ make main global for linking

main:
	push	{r4,r5,fp,lr}
	add	fp,sp,FP_OFFSET

	ldr	r4,=mesg
	ldr	r5,=mesg2
	CMP	r0,2
	BEQ	else
	mov	r1,r4
	ldr	r0,=stderr
	ldr	r0,[r0]
	bl	fprintf
	mov	r1,r5
	ldr	r0,=stderr
	ldr	r0,[r0]
	bl	fprintf
	mov	r0,1
	b	l1
	

else:
	mov	r0,r1
	bl	parseNum
	sub	sp,sp,8
	
	sub	r1,fp,20
	bl	extractParts
	
	ldr	r0,=mesg3
	ldrb	r1,[fp,-20]
	bl	printf

	ldr	r0,=mesg4
	ldrb	r1,[fp,-19]
	bl	printf

	ldr	r0,=mesg5
	ldr	r1,[fp,-16]
	bl	printf

	mov	r0,0	
l1:	sub	sp,fp,FP_OFFSET
	pop	{r4,r5,fp,lr}
	bx	lr

	

