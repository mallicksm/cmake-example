#-------------------------------------------------------------------------------
# Reset entry point
#-------------------------------------------------------------------------------
#include "macros.h"
#include "memlayout.h"
#include "param.h"
#include "vm.h"
.section StartUp, "ax"
#-------------------------------------------------------------------------------
# Code Section: entrypoint
#-------------------------------------------------------------------------------
PROC(_entry)
   bl debug_init
   bl hartid // x0 <- hartid
   bl set_sp
#ifdef INIT
   cbz x0, hartid_zero
   dsb sy
   wfe       // suspend all but core0 and restart after boot_pagetable is established
hartid_zero:
   b init    // should never return
#else
   b start   // should never return
#endif
ENDPROC(_entry)

#-------------------------------------------------------------------------------
# Code Section: function debug_init
#   prototype void debug_init(void)
#-------------------------------------------------------------------------------
# Description:
# Initialize Debug registers
#   Event register reset state is UNKNOWN so create a fake event then clear it
#-------------------------------------------------------------------------------
PROC(debug_init)
   msr scr_el3, xzr
   msr esr_el3, xzr
   msr elr_el3, xzr
   msr far_el3, xzr
   msr vbar_el3, xzr
   msr sctlr_el3, xzr
   sevl // ensure Event register cleared for All PE
   wfe
   ret
ENDPROC(debug_init)

#-------------------------------------------------------------------------------
# Code Section: function hartid
#   prototype uint64 hartid()
#   clobber x9, x10 (corruptable registers x9-x15)
#-------------------------------------------------------------------------------
# Description:
#    x0 <- hartid
#-------------------------------------------------------------------------------
#define A78_MPIDR_SPECS
PROC(hartid)
   mrs x0, mpidr_el1   ;# Note:
#ifdef A78_MPIDR_SPECS
   lsr w0, w0, #8      ;#    shift out the AFF0
#else
   bfi x0, x0, #6, #2  ;#    move core bits adjacent to cluster bits
   lsr w0, w0, #6      ;#    shift out the 6 bits
#endif
   and x0, x0, #0xf    ;#    mask hartid
   ret
ENDPROC(hartid)

#-------------------------------------------------------------------------------
# Code Section: function set_sp
#   prototype int set_sp(hartid)
#   clobber x9, x10, x11 (corruptable registers x9-x15)
#-------------------------------------------------------------------------------
# Description:
#    set up kernel 'C' stack
#      stack0 is declared in start.c
#      with PGSIZE-byte stack in CPU
#      sp = stack0 + (hartid + 1) * PGSIZE*STACKSZ
#
#  Stack memory image
#                 +--------------------------+
#    Core N stack |   PGSIZE*STACKSZ Bytes   |
#                 +--------------------------+
#                 ~                          ~
#                 +--------------------------+ +0x2000*STACKSZ
#    Core 1 stack |   PGSIZE*STACKSZ Bytes   |
#                 +--------------------------+ +0x1000*STACKSZ
#    Core 0 stack |   PGSIZE*STACKSZ Bytes   |
#                 +--------------------------+ =stack0
#-------------------------------------------------------------------------------
PROC(set_sp)
   ldr x9, =stack0
   mov x10, #(PGSIZE*STACKSZ*NCPU)
   add x11, x0, #1
   mul x10, x10, x11
   add sp, x9, x10
   ret
ENDPROC(set_sp)

#-------------------------------------------------------------------------------
# Code Section: Compiler hack to not include useless arm symbols
#-------------------------------------------------------------------------------
PROC(__main)
ENDPROC(__main)
