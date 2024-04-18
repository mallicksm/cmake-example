ENTRY( _entry )

SECTIONS
{
   ER_TEXT 0x06000000 : {
      *entry.*(.text)
      *(.text.startup)
      *(.text)
      *(.rodata)
      *(.rodata.*)
   }
   ER_DATA : {
      PROVIDE(Load$$ER_DATA$$RW$$Base = .);
      PROVIDE(Image$$ER_DATA$$RW$$Limit = .);
      *(.data)
      PROVIDE(Image$$ER_DATA$$RW$$Base = .);
   }
}
