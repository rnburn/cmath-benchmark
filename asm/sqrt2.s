	.file	"sqrt2.cpp"
	.text
	.p2align 4,,15
	.globl	_Z13compute_sqrt2PKdiPd
	.type	_Z13compute_sqrt2PKdiPd, @function
_Z13compute_sqrt2PKdiPd:
.LFB256:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L31
	leaq	32(%rdx), %rax
	cmpq	%rax, %rdi
	leaq	32(%rdi), %rax
	setnb	%cl
	cmpq	%rax, %rdx
	setnb	%al
	orb	%al, %cl
	je	.L3
	cmpl	$9, %esi
	jbe	.L3
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	movq	%rdi, %rcx
	andq	$-32, %rsp
	shrq	$3, %rcx
	xorl	%r9d, %r9d
	pushq	-8(%r10)
	negq	%rcx
	pushq	%rbp
	andl	$3, %ecx
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x70
	je	.L4
	cmpl	$1, %ecx
	vsqrtsd	(%rdi), %xmm0, %xmm0
	movl	$1, %r9d
	vmovsd	%xmm0, (%rdx)
	je	.L4
	cmpl	$2, %ecx
	vsqrtsd	8(%rdi), %xmm0, %xmm0
	movl	$2, %r9d
	vmovsd	%xmm0, 8(%rdx)
	je	.L4
	vsqrtsd	16(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, 16(%rdx)
	movl	$3, %r9d
.L4:
	movl	%esi, %ebx
	xorl	%eax, %eax
	xorl	%r8d, %r8d
	subl	%ecx, %ebx
	movl	%ecx, %ecx
	salq	$3, %rcx
	movl	%ebx, %r11d
	leaq	(%rdi,%rcx), %r10
	shrl	$2, %r11d
	addq	%rdx, %rcx
	.p2align 4,,10
	.p2align 3
.L6:
	addl	$1, %r8d
	vsqrtpd	(%r10,%rax), %ymm0
	vextractf128	$0x1, %ymm0, 16(%rcx,%rax)
	vmovups	%xmm0, (%rcx,%rax)
	addq	$32, %rax
	cmpl	%r8d, %r11d
	ja	.L6
	movl	%ebx, %ecx
	andl	$-4, %ecx
	cmpl	%ecx, %ebx
	leal	(%rcx,%r9), %eax
	je	.L28
	movslq	%eax, %rcx
	vsqrtsd	(%rdi,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rcx,8)
	leal	1(%rax), %ecx
	cmpl	%ecx, %esi
	jle	.L28
	movslq	%ecx, %rcx
	vsqrtsd	(%rdi,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rcx,8)
	leal	2(%rax), %ecx
	cmpl	%ecx, %esi
	jle	.L28
	movslq	%ecx, %rcx
	vsqrtsd	(%rdi,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rcx,8)
	leal	3(%rax), %ecx
	cmpl	%ecx, %esi
	jle	.L28
	movslq	%ecx, %rcx
	vsqrtsd	(%rdi,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rcx,8)
	leal	4(%rax), %ecx
	cmpl	%ecx, %esi
	jle	.L28
	addl	$5, %eax
	movslq	%ecx, %rcx
	cmpl	%eax, %esi
	vsqrtsd	(%rdi,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rcx,8)
	jle	.L28
	cltq
	vsqrtsd	(%rdi,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax,8)
	vzeroupper
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L28:
	.cfi_restore_state
	vzeroupper
	popq	%rbx
	popq	%r10
	.cfi_def_cfa 10, 0
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L3:
	.cfi_restore 3
	.cfi_restore 6
	leal	-1(%rsi), %eax
	leaq	8(%rdi,%rax,8), %rax
	.p2align 4,,10
	.p2align 3
.L9:
	vsqrtsd	(%rdi), %xmm0, %xmm0
	addq	$8, %rdi
	vmovsd	%xmm0, (%rdx)
	addq	$8, %rdx
	cmpq	%rax, %rdi
	jne	.L9
	rep ret
	.p2align 4,,10
	.p2align 3
.L31:
	rep ret
	.cfi_endproc
.LFE256:
	.size	_Z13compute_sqrt2PKdiPd, .-_Z13compute_sqrt2PKdiPd
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
