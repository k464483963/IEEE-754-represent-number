/*
 * Filename: parseNum.s
 * Author: HanJie Zhan
 * UserId: cs30s120cg
 * Date:07/18/2020
 * Sources of help: tutors
 */

/*
 *Function Name: parseNum.s
 *Function Prototype:void extractParts( unsigned long ieeeBin, 
 *ieeeParts_t * fill );
 *Description: This function store hexadecimal to ieee number to fill struct
 *Parameters: char * argv[] passing the array of argument
 *Side Effects: None
 *Error Conditions: None
 *Return value: None
 *
 * Registers used:
 * <register> - <use> -- <description of what the value represents>
 * r0 - array pointer -- array hold the argument
 * r1 - local var  -- store the after shift number		
 * r4 - local var  -- store the mesg string.
 *  Stack variables:
 * <name> - <fp offset> -- <description of what the value represents> 
 * example:
 * sum-[fp-8]--holdsthesumofvalues
 */

@ tell the assembler what the hardward is
.arch	armv6			@ armv6 instruction set
.cpu    cortex-a53		@ cpu type
.syntax  unified		@ allow modern syntax

@ List external functions call and #defines and "magic" numbers
@.extern  			@ pre-defined putchar function
.equ     FP_OFFSET, 12		@ fp offset in frame
.equ	 BIT,31
.equ	 BIT2,23
.equ	 BIT3,127
.equ	 BIT4,9
.equ	 HEXA,0x800000
.equ	 BYTE,4

@ read-only data segment
.section .rodata		@ start of read-only literals

@ Text segment
.text				@ start of the text segment
.type	 extractParts, %function	@ define main to be a function
.global  extractParts			@ make main global for linking

extractParts:
push     {r4,r5,fp,lr}		@ stack frame register save
add      fp,sp, FP_OFFSET	@ locate our frame pointer

lsr r4,r0,BIT			@right shift BIT bit
strb r4,[r1,0]			@store the value back to r4

lsr  r4,r0,BIT2			@left shift BIT2 bit
sub  r4,r4,BIT3			@subtract r4
strb r4,[r1,1]			@store number to r4

lsl  r4,r0,BIT4			@left shift r0 store in r4
lsr  r4,r4,BIT4			@right shift r4 BIT4 bit
add	r4,r4,HEXA		
str	r4,[r1,BYTE]		@store value in mantissa member


sub	 sp,fp,FP_OFFSET	@ restore stack frame top
pop	 {r4,r5,fp,lr}		@ remove stack frame and restore
bx  	 lr			@ return to calling function

.end


