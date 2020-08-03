/*
 * Filename: testextractParts.c
 * Author: HanJie Zhan
 * UserId: cs30s120cg
 * Description: Unit test program to test the function extractParts();
 * Date:07/18/2020
 * Sources of help: tutors
 */

#include <string.h>
#include <stdlib.h>

#include "test.h"    /* For TEST() macro and stdio.h */
#include "pa3.h"

/*
 * Unit Test for extractParts.c
 *
 * void extractParts( unsigned long ieeeBin, ieeeParts_t * fill );
 * *
 */
void testextractParts() {

	ieeeParts_t fill;//access struct fill memeber

       extractParts(0x41260000,&fill);//pass in argument

        TEST( fill.sign == 0);
	TEST ( fill.exp == 3);
	TEST (fill.mantissa ==10878976);
   
}

int main(int argc, char *argv[]) {
  fprintf( stderr, "Testing parseNum...\n\n" );
  testextractParts();
  fprintf( stderr, "\nDone running tests.\n" );
  return 0;
}
