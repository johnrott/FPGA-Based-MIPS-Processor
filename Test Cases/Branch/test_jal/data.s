.data 
test_array: .word 0x7FFFFFF6, 0x7FFFFFF6, 0x7FFFFFF2, 0x7FFFFFF1 
.text 
.global main 
main: 
addi $t1, $zero, 48  
nop
nop
nop
nop
nop
jal next
nop
nop
nop
nop
nop
addi $t0, $t0, 69
nop
nop
nop
nop
next:
addi $t3, $t3, 2
nop
nop
nop
nop
nop
addi $t3, $t3, 1
nop
nop
nop
nop
nop
add $t4, $zero, $ra
nop
nop
nop
nop
nop
jr $t1
nop
nop
nop
nop
nop


