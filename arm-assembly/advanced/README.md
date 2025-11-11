Producing the disassembly:

1. Compile ``literal_pool.s`` using ``gcc literal_pool.s``
2. Dummp the contents of the ELF ``a.out`` using ``objdump -d a.out``
3. Below, I have copied the output from ``main`` to the end of the label ``labelx``

```
000103d0 <main>:
   103d0:	e59f0014 	ldr	r0, [pc, #20]	; 103ec <labelx+0x4>
   103d4:	e5802004 	str	r2, [r0, #4]
   103d8:	e59f7010 	ldr	r7, [pc, #16]	; 103f0 <labelx+0x8>
   103dc:	e0865007 	add	r5, r6, r7
   103e0:	e0865007 	add	r5, r6, r7
   103e4:	e51f1000 	ldr	r1, [pc, #-0]	; 103ec <labelx+0x4>

000103e8 <labelx>:
   103e8:	e0865007 	add	r5, r6, r7
   103ec:	00021024 	.word	0x00021024
   103f0:	00ffffaa 	.word	0x00ffffaa
```
