/* This will work with STM32 type of microcontrollers.    *
 * The sizes of RAM and flash are specified smaller than  *
 * what most of the STM32 provide to ensure that the demo *
 * program will run on ANY STM32.                         */

ENTRY(main)
 
 MEMORY
{
    ram (rwx) : ORIGIN = 0x20000000, LENGTH = 20K
    rom (rx)  : ORIGIN = 0x00000000, LENGTH = 128K
}

SECTIONS
{
    .  = 0x0;         /* From 0x00000000 */
    .text :
    {
        *(vectors)    /* Vector table */
        *(.text)      /* Program code */
        *(.rodata)    /* Read only data */
    } >rom

    .  = 0x20000000;  /* From 0x20000000 */
    .data :
    {
        *(.data)      /* Data memory */
    } >ram AT > rom

    .bss :
    {
        *(.bss)       /* Zero-filled run time allocate data memory */
    } >ram AT > rom
}