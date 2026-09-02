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

lh $t2, 0($t1) #

nop

nop

nop

nop

nop

sh $t2, 0($t0)
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


lh $t2, 2($t1)

nop

nop

nop

nop

nop
sh $t2, 2($t0)
nop
nop
nop
nop
nop

lw $t4, 0($t0)
nop
nop
nop
nop
nop


lb $t2, 0($t1)
nop
nop
nop
nop
nop

sb $t2, 5($t1)
nop
nop
nop
nop
nop

lb $t2, 3($t1)
nop
nop
nop
nop
nop

sb $t2, 6($t1)
nop
nop
nop
nop
nop

lw $t5, 4($t1)
nop
nop
nop
nop
nop
