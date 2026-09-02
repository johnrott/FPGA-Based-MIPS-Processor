.data

test_array: .word FFFF, 8, 3, 4, 0, 0, 0

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

lw $t2, 0($t1)

nop

nop

nop

nop

nop

sw $t2, 0($t0) # save value eeeeeeee @ mem[69]

nop

nop

nop

nop

nop


lw $t2, 4($t1) # save mem[1] = eeeeeeee @ $t2 

nop

nop

nop

nop

nop

sw $t2, 4($t0) # save value eeeeeeee @ mem[68]

nop

nop

nop

nop

nop


lw $t2, 8($t1) #

nop

nop

nopp

nop

nop

sw $t2, 8($t0) # save value eeeeeeee @ mem[69]

nop

nop

nop

nop

nop


lw $t2, 12($t1)

nop

nop

nop

nop

nop

sw $t2, 12($t0) # save value eeeeeeee @ mem[69]

nop

nop

nop

nop

nop


lw $t2, 16($t1)

nop

nop

nop

nop

nop

sw $t2, 16($t0) # save value eeeeeeee @ mem[69]

nop

nop

nop

nop

nop


lw $t2, 20($t1)

nop

nop

nop

nop

sw $t2, 20($t0) # save value eeeeeeee @ mem[69]

nop

nop

nop

nop

nop

lw $t4, 0($t0) #from mem of 69 you load the value to make sure it correctly wrote

nop

nop

nop

nop

nop

lw $t4, 4($t0) #from mem of 69 you load the value to make sure it correctly wrote

nop

nop

nop

nop

nop

lw $t4,8($t0) #from mem of 69 you load the value to make sure it correctly wrote

nop

nop

nop

nop

nop

lw $t4, 12($t0) #from mem of 69 you load the value to make sure it correctly wrote

nop

nop

nop

nop

nop

lw $t4, 16($t0) #from mem of 69 you load the value to make sure it correctly wrote

nop

nop

nop

nop

nop

lw $t4, 20($t0) #from mem of 69 you load the value to make sure it correctly wrote

nop

nop

nop

nop

nop
