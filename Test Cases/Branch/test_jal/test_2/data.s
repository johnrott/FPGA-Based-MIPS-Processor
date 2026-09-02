.data 
test_array: .word 0x7FFFFFF6, 0x7FFFFFF6, 0x7FFFFFF2, 0x7FFFFFF1 
.text 
.global main 
main: 
addi $t1, $zero, 48  
jal next
addi $t0, $t0, 69
next:
addi $t3, $t3, 2
addi $t3, $t3, 1
add $t4, $zero, $ra
jr $ra

