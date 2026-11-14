.data
// a test the .data section can be left empty
.text
// leaving the .global qualifier out
// causes main to be declared 
// 0000000000000000 l .text	0000000000000000 main
// instead of
// 0000000000000000 g .text	0000000000000000 main
// in the symbol table
// then the linker rejects it
.global main

main:
  add x0, x1, x2
