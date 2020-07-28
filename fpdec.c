#include <stdio.h>
#include "pa3.h"
#include "pa3Strings.h"
#define	TWO_COMMAND 2	

int main(int argc, char *argv[]){
	if(argc != TWO_COMMAND){
		fprintf(stderr,INVALID_ARGS);
		
		fprintf(stderr, SHORT_USAGE);

		return 1;
	}
	
	unsigned long newLong;

	newLong = parseNum(argv[TWO_COMMAND]);

	ieeeParts_t newFill;

	extractParts(newLong,&newFill);

	printf(SIGN_STR,newFill.sign);

	printf(EXP_STR,newFill.exp);

	printf(MANTISSA_STR,newFill.mantissa);

	unsigned int newInt = (int)newLong;

	printf(DECIMAL_STR,newInt);

} 
