	.file	"sqrt1.cpp"
	.text
	.p2align 4,,15
	.globl	_Z13compute_sqrt1PKdiPd
	.type	_Z13compute_sqrt1PKdiPd, @function
_Z13compute_sqrt1PKdiPd:
.LFB256:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L8
	leal	-1(%rsi), %eax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	vxorpd	%xmm2, %xmm2, %xmm2
	leaq	8(%rdi,%rax,8), %r12
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.p2align 4,,10
	.p2align 3
.L3:
	vmovsd	(%rdi), %xmm0
	vucomisd	%xmm0, %xmm2
	vsqrtsd	%xmm0, %xmm1, %xmm1
	ja	.L12
	addq	$8, %rdi
	vmovsd	%xmm1, (%rdx)
	addq	$8, %rdx
	cmpq	%r12, %rdi
	jne	.L3
.L6:
	addq	$32, %rsp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L8:
	.cfi_restore 12
	rep ret
.L12:
	.cfi_def_cfa_offset 48
	.cfi_offset 12, -16
	vmovsd	%xmm2, 24(%rsp)
	movq	%rdx, 16(%rsp)
	movq	%rdi, 8(%rsp)
	vmovsd	%xmm1, (%rsp)
	call	sqrt@PLT
	movq	8(%rsp), %rdi
	movq	16(%rsp), %rdx
	vmovsd	(%rsp), %xmm1
	vmovsd	24(%rsp), %xmm2
	addq	$8, %rdi
	vmovsd	%xmm1, (%rdx)
	addq	$8, %rdx
	cmpq	%r12, %rdi
	jne	.L3
	jmp	.L6
	.cfi_endproc
.LFE256:
	.size	_Z13compute_sqrt1PKdiPd, .-_Z13compute_sqrt1PKdiPd
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
