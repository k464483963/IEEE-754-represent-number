/*
 * Filename: testparseNum.c
 * Author: HanJie Zhan
 * Userid: A16089692
 * Description: Unit test program to test the function parseNum();
 * Date: 07/20/20
 * Sources of Help: none
 */
#include <string.h>
#include <stdlib.h>

#include "test.h"    /* For TEST() macro and stdio.h */
#include "pa3.h"

/*
 * Unit Test for parseNum.c
 *
 * unsigned long parseNum( char * argv[] );
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
