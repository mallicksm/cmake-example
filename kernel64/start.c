#include "types.h"
#include "memlayout.h"
#include "param.h"
#include "vm.h"
// start
//------------------------------------------------------------------------------
// Description:
//    jump to main
//------------------------------------------------------------------------------
__attribute__((aligned(16))) char stack0[PGSIZE * STACKSZ + PGSIZE];
void start() {
   while (1)
      ;
}
