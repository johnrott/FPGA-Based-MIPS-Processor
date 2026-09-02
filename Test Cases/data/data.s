.data

test_array: .word FFFFFFFF, 8, 3, 4, 0, 0, 0

.text

.global main

loop:	addi $t0, $zero, 68

nop

nop

nop

nop

nop

addi $t1, $zero, 4

nop

nop

nop

nop

nop

lw $t2, 8($t1) # save mem[1] = dddddddd @ $t2 

nop

nop

nop

nop

nop

sw $t2, 0($t0) # save value dddddddd @ mem[68]

nop

nop

nop

nop

nop

lw $t3, 0($t0) #from mem of 69 you load the value to make sure it correctly wrote

nop

nop

nop

nop

nop

lw $t4, 0($zero) #should be ffffffff

nop

nop

nop

nop

nop

lb $t2, 4($t1) #

nop

nop

nop

nop

nop

lb $t2, 5($t1)

nop

nop

nop

nop

nop

lb $t2, 6($t1)

nop

nop

nop

nop

nop

lb $t2, 7($t1)

nop

nop

nop

nop

nop

lb $t2, 8($t1)

nop

nop

nop

nop

nop

sb $t2, 3($t0)

nop

nop

nop

nop

nop

nop

lw $t3, 0($t0)

nop

nop

nop

nop

nop

nop
