@ tell the assembler what the hardward is
	.arch	armv6			@ armv6 instruction set
	.cpu    cortex-a53		@ cpu type
	.syntax  unified		@ allow modern syntax

@ List external functions call and #defines and "magic" numbers
	.extern  strtoul		@ pre-defined putchar function
	.equ     FP_OFFSET, 4		@ fp offset in frame
	.equ	 BASE,	 16

@ read-only data segment
	.section .rodata		@ start of read-only literals

@ Text segment
	.text			@ start of the text segment
	.type	 parseNum, %function	@ define main to be a function
	.global  parseNum			@ make main global for linking

parseNum:
	push	{fp,lr}
	add	fp,sp,FP_OFFSET
	
	ldr	r0,[r0,4]
	mov	r1,0
	mov	r2,BASE
	bl	strtoul

	sub	 sp,fp,FP_OFFSET	@ restore stack frame top
	pop	 {fp,lr}		@ remove stack frame and restore
	bx  	 lr			@ return to calling function

.end



