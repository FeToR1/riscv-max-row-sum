.data
matrix:
    .word 1 2 3 4 5 6
    .word 1 2 3 4 5 6
    .word 6 2 3 4 5 6
    .word 6 1 3 4 5 6
    .word 1 2 3 4 5 6
    .word 1 2 3 4 5 6

.text
.globl main
main:
    la a0, matrix
    li a1, 6 # number of rows
    li a2, 6 # number of columns
    jal max_sum_row

    mv a1, a0
    li a0, 1 # print a1
    ecall

    li a0, 10 # exit
    ecall

# a0 - element address, then result
# a1 - rows
# a2 - columns
# a3 - current element

# t0 - row address
# t1 - row size in bytes
# t2 - i
# t3 - j
# t4 - cur sum
# t5 - max sum
# t6 - max index
max_sum_row:
    mv t0, a0
    slli t1, a2, 2 # t1 = a2 * 4 = 6 * 4
    li t2, 0

row_loop:
    bge t2, a1, rows_done

    mv a0, t0
    li t3, 0
    li t4, 0

sum_loop:
    bge t3, a2, sum_done

    lw a3, 0(a0)  
    add t4, t4, a3
    addi a0, a0, 4
    addi t3, t3, 1

    j sum_loop

sum_done:
    beq t2, zero, update_max # init on first iter
    ble t4, t5, noupd

update_max:
    mv t5, t4
    mv t6, t2

noupd:
    addi t2, t2, 1
    add t0, t0, t1

    j row_loop

rows_done:
    mv a0, t6
    ret
