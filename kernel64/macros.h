//=============================================================================
// C++ Programming
// Created: Mar-10-2023
// Author: soummya
//
// Note:
//
// Description: Description
//    usefull global macros
//=============================================================================

// assembly macros to mark begining and end
// of functions to be used in 'C'
// .align is p2align while .balign is byte align
#define PROC(name) \
   .global name;   \
   .align 2;       \
   name:

#define ENDPROC(name) \
   .type name, @function;

// provides space/alignment for arm interrupt vector table
#define VENTRY(name) \
   .balign 0x80;     \
   b name;

// Ideal for counting the number of elements in an array whereby
// the sizeof(array)/sizeof(array[0]) computes the number of elements
#define NELEM(x) (sizeof(x) / sizeof((x)[0]))

// used to mark unused variables in order to suppress
// compiler warnings
#define UNUSED_VARIABLE(N) \
   do {                    \
      (void)(N);           \
   } while (0)

// bonafide targets of x() macros customized for cli
#define CLI_EXTERN(name, comment) \
   extern int name##_cli(int argc, char* argv[]);

#define CLI_ALIASES(name, comment) \
   {                               \
      .cmd = #name,                \
      .func = name##_cli,          \
   },

#define CLI_HELP(name, comment) \
   printf("   %s            \t%s\n", #name, #comment);

// The compiler memory barrier will prevent the compiler from
// scheduling non-volatile memory access after the write to the
// register.
// This could happen if some initialization code issues non-volatile
// accesses to an area used by an interrupt handler, in the assumption
// that it is safe as the interrupts are disabled at the time it does
// that (according to program order). However, non-volatile accesses
// are not necessarily in program order relatively with volatile inline
// assembly statements (and volatile accesses).
#define COMPILER_BARRIER() __asm volatile("" :: \
                                             : "memory")

#define REG32(__addr) (*(volatile uint32*)(__addr))
#define REG64(__addr) (*(volatile uint64*)(__addr))
#define MI(__val, __bitoffset, __bitwidth)           \
   tmp &= ~(((1 << __bitwidth) - 1) << __bitoffset); \
   tmp |= __val << __bitoffset;

#define RMW32(__addr, __value, __bitoffset, __bitwidth) \
   do {                                                 \
      uint32 tmp;                                       \
      tmp = REG32(__addr);                              \
      MI(__value, __bitoffset, __bitwidth);             \
      REG32(__addr) = tmp;                              \
   } while (0)

