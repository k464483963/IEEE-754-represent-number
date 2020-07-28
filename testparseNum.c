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
void testparseNum() {
    char *argv[] = {"./1","0xFF"};
    TEST( parseNum(argv) == 255 );
   
}

int main(int argc, char *argv[]) {
  fprintf( stderr, "Testing parseNum...\n\n" );
  testparseNum();
  fprintf( stderr, "\nDone running tests.\n" );
  return 0;
}
