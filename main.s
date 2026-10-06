.data
matrix:
    .word 1 2 3 4 5 6
    .word 1 2 3 4 5 6
    .word 6 2 3 4 5 6
    .word 6 1 3 4 5 6
    .word 1 2 3 4 5 6
    .word 1 2 3 4 5 6

# t0 - matrix addres
# t1 - size
# t2 - i
# t3 - j
# t4 - cur sum
# t5 - max value
# t6 - max index
# a3 - word * size

.text
.globl main
main:
    la t0, matrix 
    li t1, 6
    slli a3, t1, 2
    li t5, 0

    addi t2, zero, 0

row_loop:
    bge t2, t1, finale # if t2 >= t1 then finale
    

    mv a0, t0
    mv a1, t1
    jal row_sum  # jump to row_sum and save position to ra

    beq t2, zero, update_max
    ble a0, t5, noupd # if a0 <= t5 then noupd

update_max:
    mv t5, a0
    mv t6, t2

noupd:
    
    addi t2, t2, 1 # t2 = t2 + 1
    add t0, t0, a3 # t0 = t0 + a3    

    j row_loop
    
row_sum:
    li t3, 0 # t3 = 0
    li t4, 0 # t4 = 0
sum_loop:
    bge t3, a1, sum_done # if t3 >= a1 then sum_done
    
    lw a2, 0(a0)
    add t4, t4, a2 # t4 = t4 + a2
    addi a0, a0, 4 # a0 = a0 + 4
    addi t3, t3, 1 # t3 = t3 + 1

    j sum_loop  # jump to sum_loop

sum_done:
    mv a0, t4
    ret
finale:
    mv a1, t6
    li a0, 1
    ecall

    li a0, 10
    ecall
