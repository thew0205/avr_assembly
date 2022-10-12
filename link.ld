MEMORY{
	flash (RX) : ORIGIN = 0x0000, LENGTH = 32K
	sram (! RW) : ORIGIN =  0X800100, LENGTH = 2K
}

SECTIONS{
.text :{
	*(.vector)
	*(.text)
	}>flash
.rodata :{
	*(.rodata)
	}>flash
.data :{
	*(.data)
	}>sram AT> flash
.bss :{
	*(.bss)
	}>sram
}