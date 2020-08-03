/*
 * Filename: fpodecEC.s
 * Author: HanJie Zhan
 * UserId: cs30s120cg
 * Date:07/18/2020
 * Sources of help: tutors
 */

/*
 *Function Name: main();
 *Function Prototype: int main(int argc,char *argv[]);
 *Description: This function would get the user hexadecimal and convert
 *to ieee 
 *Parameters: argc for the number of argument, *argv pointer point to arugument
 *Side Effects: None
 *Error Conditions: None
 *Return value: return 1 if fail, return 0 if successful.
 *
 * Registers used:
 * <register> - <use> -- <description of what the value represents>
 * r0 - arg 1 -- number of arg
 * r1 - arg 2 -- pointer point to argument
 * r5 - local var  -- hold message
 * r4 - local var  -- store the mesg string.
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
	.extern  printf			@ pre-defined printf function
	.extern	 fprintf		@ pre-defined fprintf function
	.extern	 parseNum		@ calling function
	.extern	 extractParts		@ calling function
	.equ     FP_OFFSET, 12		@ fp offset in frame
	.equ	 CHAR_SIGN, -16		@ defined variable
	.equ	 CHAR_EXP, -19		@ defined variable
	.equ	 BYTE_MANTASSIA, -20	@ defined varibble
	.equ	 BASE,20		@ defined varibble
	.equ	 SPACE,8		@ defined varibble
	.equ	 COMPARE,2		@ defined varibble

	
@ read-only data segment
	.section .rodata		@ start of read-only literals
mesg:	.asciz	"Incorrect number of arguments.\n"
mesg3:	.asciz	"Sign Bit: %u\n"
mesg2:	.asciz	"\nUsage ./fpdec {hexString}\n\n"
mesg4:	.asciz  "Unbiased Exponent: %hhd\n"
mesg5:	.asciz  "Mantissa: %lx\n"

@ Text segment
	.text				@ start of the text segment
	.type	 main, %function	@ define main to be a function
	.global  main			@ make main global for linking

main:
	push	{r4,r5,fp,lr}		@stack frame register save
	add	fp,sp,FP_OFFSET		@locate our frame pointer

	ldr	r4,=mesg		@load mesg address
	ldr	r5,=mesg2		@load mesg address
	CMP	r0,COMPARE		@compare r0 value
	BEQ	else			@if equal jump to else
	mov	r1,r4			@move r4 value to r1
	ldr	r0,=stderr		@print error mesg
	ldr	r0,[r0]			@dereference r0 value store in r0
	bl	fprintf			@jump to fprintf function
	mov	r1,r5			@move r5 value to r1
	ldr	r0,=stderr		@print error mesg
	ldr	r0,[r0]
	bl	fprintf			@jump to fprintf function
	mov	r0,1
	b	l1			@back to l1 statment
	

else:
	mov	r0,r1			@move r1 content to r0
	bl	parseNum		@jump to parseNum function
	sub	sp,sp,SPACE
	
	sub	r1,fp,BASE
	bl	extractParts		@jump to extractParts function
	
	ldr	r0,=mesg3		@load mesg to r0
	ldrb	r1,[fp,BYTE_MANTASSIA]
	bl	printf

	ldr	r0,=mesg4
	ldrb	r1,[fp,CHAR_EXP]	@load exp value to r1
	bl	printf			@jump to printf function

	ldr	r0,=mesg5		
	ldr	r1,[fp,CHAR_SIGN]
	bl	printf			@jump to printf function

	mov	r0,0			@return 0 if successfull
l1:	sub	sp,fp,FP_OFFSET		@getting sp to correct position
	pop	{r4,r5,fp,lr}		@pop rigister store in cpu
	bx	lr			@back to caller

.end


	

