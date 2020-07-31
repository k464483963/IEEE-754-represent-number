@ tell the assembler what the hardward is
	.arch	armv6			@ armv6 instruction set
	.cpu    cortex-a53		@ cpu type
	.syntax  unified		@ allow modern syntax

@ List external functions call and #defines and "magic" numbers
       @.extern  		@ pre-defined putchar function
	.equ     FP_OFFSET, 12		@ fp offset in frame

@ read-only data segment
	.section .rodata		@ start of read-only literals

@ Text segment
	.text				@ start of the text segment
	.type	 extractParts, %function	@ define main to be a function
	.global  extractParts			@ make main global for linking

extractParts:
	push     {r4,r5,fp,lr}		@ stack frame register save
	add      fp,sp, FP_OFFSET	@ locate our frame pointer

	lsr r4,r0,31
	strb r4,[r1,0]

	lsr  r4,r0,23
	sub  r4,r4,127
	strb r4,[r1,1]

	lsl  r4,r0,9
	lsr  r4,r4,9
	add	r4,r4,0x800000
	str	r4,[r1,4]


	sub	 sp,fp,FP_OFFSET	@ restore stack frame top
	pop	 {r4,r5,fp,lr}		@ remove stack frame and restore
	bx  	 lr			@ return to calling function

.end


