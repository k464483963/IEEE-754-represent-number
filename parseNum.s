/*
 * Filename: parseNum.s
 * Author: HanJie Zhan
 * UserId: cs30s120cg
 * Date:07/18/2020
 * Sources of help: tutors
 */

/*
 *Function Name: parseNum.s
 *Function Prototype: unsigned long parseNum( char * argv[] );
 *Description: This function convert string to hexadecimal number
 *Parameters: None
 *Side Effects: None
 *Error Conditions: None
 *Return value: the ieee-754 floating point number as an unsigned long.
 *
 * Registers used:
 * <register> - <use> -- <description of what the value represents>
 * r0 - arg  -- the array arg by user
 * r1 - local var -- store 0
 * r2 - local var -- store Base  
 *  Stack variables:
 * <name> - <fp offset> -- <description of what the value represents> * 
 * example:
 * sum-[fp-8]--holdsthesumofvalues
 */
@ tell the assembler what the hardward is
	.arch	armv6			@ armv6 instruction set
	.cpu    cortex-a53		@ cpu type
	.syntax  unified		@ allow modern syntax

@ List external functions call and #defines and "magic" numbers
	.extern  strtoul		@ pre-defined putchar function
	.equ     FP_OFFSET, 4		@ fp offset in frame
	.equ	 BASE,	 16
	.equ	 BYTE, 4

@ read-only data segment
	.section .rodata		@ start of read-only literals

@ Text segment
	.text				@ start of the text segment
	.type	 parseNum, %function	@ define main to be a function
	.global  parseNum		@ make main global for linking

parseNum:
	push	{fp,lr}			@push the stack frame
	add	fp,sp,FP_OFFSET		@get fp in right position
	
	ldr	r0,[r0,BYTE]		@load address of r0 and store in r0
	mov	r1,0			@move 0 to r1
	mov	r2,BASE			@move base to r2
	bl	strtoul			@jump to function strtoul

	sub	 sp,fp,FP_OFFSET	@ restore stack frame top
	pop	 {fp,lr}		@ remove stack frame and restore
	bx  	 lr			@ return to calling function

.end



