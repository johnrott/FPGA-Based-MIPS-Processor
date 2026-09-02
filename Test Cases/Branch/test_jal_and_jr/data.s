.data 
test_array: .word 0x7FFFFFF6, 0x7FFFFFF6, 0x7FFFFFF2, 0x7FFFFFF1 
.text 
.global main 
main: 
addi $t0, $zero, 96 #code goes to where you addi $t1 whith 2, instruction 
nop
nop
nop
nop
nop
addi $t1, $t1, 1
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
addi $t1, $t1, 1
nop
nop
nop 
nop
nop
addi $t1, $t1, 3
nop
nop
nop
nop
nop
next:
addi $t1, $t1, 1
nop
nop
nop 
nop
nop
addi $t1, $t1, 4
nop
nop
nop
nop
nop
jr $ra
nop
nop
nop
nop
nop
