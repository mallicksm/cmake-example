#define TEXT_SIZE (1 * 1024 * 1024)
// DATA is where rw data is saved i.e. +RW and +ZI
#define DATA_SIZE (4 * 1024 * 1024)

// LPC Bases
#define UART0_BASE 0x03002000
#define UART1_BASE 0x03003000
#define UART2_BASE 0x03004000
#define UART3_BASE 0x11026000
#define UART4_BASE 0x1c043000
#define UART5_BASE 0x1c044000
#define UART6_BASE 0x1c045000
#define SCR0_BASE 0x11010000
#define SCR1_BASE 0x11014000

// GIC600AE
#define GICD_BASE 0x02000000
#define GICD_SIZE 0x8000

#define GICR_BASE 0x02040000
#define GICR_SIZE (4 * 0x20000) // NCPU=4

// Interrupts
#define UART0_IRQ (125 + 32)  // 157
#define TIMER_IRQ (30)

// Timebase Counter
#define SYSCOUNTER_BASE 0x05204000

// UART CPU
#define UART_CPU 0
