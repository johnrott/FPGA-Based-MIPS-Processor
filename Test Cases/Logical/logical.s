.data

test_array: .word 6, 8, 3, 4, 0, 0, 0

.text

.global main

loop:	addi $t0, $zero, 420

nop

nop

nop

nop

nop

addi $t1, $zero, 69  

nop

nop

nop

nop

nop

addi $t5, $zero, 1

nop

nop

nop

nop

nop

and $t2, $zero, $t1 #zero

nop

nop

nop

nop

nop

and $t2, $t1, $t1 # equals 1

nop

nop

nop

nop

nop

andi $t3, $t0, 420 // should be true

nop

nop

nop

nop

nop

andi $t4, $t0, 1 #should be zero

nop

nop

nop

nop

nop

or $t2, $t5, $zero #1

nop

nop

nop

nop

nop

or $t2, $zero, $t5 #1

nop

nop

nop

nop

nop

or $t2, $zero, $zero #zero

nop

nop

nop

nop

nop

nor $t2, $t5, $zero

nop

nop

nop

nop

nop

nor $t2, $zero, $t5 #

nop

nop

nop

nop

nop

nor $t2, $zero, $zero #1

nop

nop

nop

nop

nop

xor $t2, $zero, $zero #1

nop

nop

nop

nop

nop

xor $t2, $t5, $zero #1

nop

nop

nop

nop

nop

xor $t2, $zero, $t5 #1

nop

nop

nop

nop

nop