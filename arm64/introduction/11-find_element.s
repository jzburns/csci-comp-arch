	.text
	.file	"find_element.C"
	.globl	_Z12find_elementPlll            // -- Begin function _Z12find_elementPlll
	.p2align	2
	.type	_Z12find_elementPlll,@function
_Z12find_elementPlll:                   // @_Z12find_elementPlll
	.cfi_startproc
// %bb.0:
	ldr	x8, [x0, x1, lsl #3]
	cmp	x8, x2
	cset	w0, eq
	ret
.Lfunc_end0:
	.size	_Z12find_elementPlll, .Lfunc_end0-_Z12find_elementPlll
	.cfi_endproc
                                        // -- End function
	.ident	"Debian clang version 19.1.7 (3+b1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
