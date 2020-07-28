/*
 * Filename: testhash
 * Author: TODO
 * Userid: TODO
 * Description: Unit test program to test the function hash().
 * Date: TODO
 * Sources of Help: TODO
 */

#include <string.h>
#include <stdlib.h>

#include "test.h"    /* For TEST() macro and stdio.h */
#include "pa3.h"

/*
 * Unit Test for hash.c
 *
 * unsigned int hash( char * src );
 *
 */
void testextractParts() {
	ieeeParts_t fill;
       extractParts(0x41260000,&fill);	
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
