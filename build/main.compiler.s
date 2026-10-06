	.file	"main.c"
	.option nopic
	.attribute arch, "rv32i2p1"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	max_sum_row
	.type	max_sum_row, @function
max_sum_row:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	addi	s0,sp,64
	sw	a0,-52(s0)
	sw	a1,-56(s0)
	sw	a2,-60(s0)
	lw	s1,-56(s0)
	addi	a3,s1,-1
	sw	a3,-44(s0)
	mv	a3,s1
	mv	a6,a3
	li	a7,0
	srli	a3,a6,27
	slli	a5,a7,5
	add	a5,a3,a5
	slli	a4,a6,5
	sw	zero,-20(s0)
	sw	zero,-24(s0)
	sw	zero,-28(s0)
	j	.L2
.L3:
	lw	a4,-60(s0)
	lw	a5,-28(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	lw	a4,-24(s0)
	add	a5,a4,a5
	sw	a5,-24(s0)
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
.L2:
	lw	a4,-28(s0)
	lw	a5,-56(s0)
	blt	a4,a5,.L3
	li	a5,1
	sw	a5,-32(s0)
	j	.L4
.L8:
	sw	zero,-36(s0)
	sw	zero,-40(s0)
	j	.L5
.L6:
	mv	a4,s1
	lw	a5,-32(s0)
	mv	a1,a5
	mv	a0,a4
	call	__mulsi3
	mv	a5,a0
	slli	a5,a5,2
	lw	a4,-60(s0)
	add	a4,a4,a5
	lw	a5,-40(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	lw	a4,-36(s0)
	add	a5,a4,a5
	sw	a5,-36(s0)
	lw	a5,-40(s0)
	addi	a5,a5,1
	sw	a5,-40(s0)
.L5:
	lw	a4,-40(s0)
	lw	a5,-56(s0)
	blt	a4,a5,.L6
	lw	a4,-36(s0)
	lw	a5,-24(s0)
	ble	a4,a5,.L7
	lw	a5,-36(s0)
	sw	a5,-24(s0)
	lw	a5,-32(s0)
	sw	a5,-20(s0)
.L7:
	lw	a5,-32(s0)
	addi	a5,a5,1
	sw	a5,-32(s0)
.L4:
	lw	a4,-32(s0)
	lw	a5,-52(s0)
	blt	a4,a5,.L8
	lw	a5,-20(s0)
	mv	a0,a5
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	addi	sp,sp,64
	jr	ra
	.size	max_sum_row, .-max_sum_row
	.section	.rodata
	.align	2
.LC1:
	.string	"%d\n"
	.align	2
.LC0:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	6
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	6
	.word	1
	.word	3
	.word	4
	.word	5
	.word	6
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-176
	sw	ra,172(sp)
	sw	s0,168(sp)
	addi	s0,sp,176
	lla	a4,.LC0
	addi	a5,s0,-164
	mv	a3,a4
	li	a4,144
	mv	a2,a4
	mv	a1,a3
	mv	a0,a5
	call	memcpy
	addi	a5,s0,-164
	mv	a2,a5
	li	a1,6
	li	a0,6
	call	max_sum_row
	sw	a0,-20(s0)
	lw	a1,-20(s0)
	lla	a0,.LC1
	call	printf
	li	a5,0
	mv	a0,a5
	lw	ra,172(sp)
	lw	s0,168(sp)
	addi	sp,sp,176
	jr	ra
	.size	main, .-main
	.globl	__mulsi3
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
