/*
 * Filename: fpdecEC2.c
 * Author: HanJie Zhan
 * UserId: cs30s120cg
 * Date:07/05/2020
 * Sources of help: none.
 */


#include <stdio.h>
#include <math.h>
#include "pa3.h"
#include "pa3Strings.h"
#define	 TWO_COMMAND 2
#define  SHIFT 23

/*Function Name: fpdecEC2.c
*Function Prototype:int main(int argc, char *argv[]);
*Description: This function would get the hexadecimal by the user and convert
*to ieee number
*Parameters: argc for the number of argument, *argv pointer point to the
*argument
*Side Effects: None
*Error Conditions: None
*return value: return 0 if successful, fail 1 instead.
*/

int main(int argc, char *argv[]) {
	//print error message if argument not equal two.
	if(argc != TWO_COMMAND) {
		//print error message
		fprintf(stderr,INVALID_ARGS);
		
		fprintf(stderr, SHORT_USAGE);

		return 1;
	}
	
	unsigned long newLong;//variable store the hexadecimal number

	//convert string to hexadecimal number
	newLong = parseNum(argv);

	ieeeParts_t newFill;//getting access struct fill

	//fill every struct member with ieee number
	extractParts(newLong,&newFill);

	//print ieee sign number
	printf(SIGN_STR,newFill.sign);

	//print ieee exponent number
	printf(EXP_STR,newFill.exp);

	//print ieee mantissa number
	printf(MANTISSA_STR,newFill.mantissa);

	 float expDecimal = (float) newFill.exp;//convert to float

	 //getting mantissa decimal
	 float  mantissaDecimal = 
		(float)(newFill.mantissa/pow(TWO_COMMAND,SHIFT))
		*pow(TWO_COMMAND,expDecimal);


	 float sign = (float)newFill.sign;

	 //if the sign is negative, set the number is nagetive
	if(sign != 0){
	 mantissaDecimal 
		= mantissaDecimal-(mantissaDecimal*TWO_COMMAND);
	}

	printf(DECIMAL_STR,mantissaDecimal);

	

} 
