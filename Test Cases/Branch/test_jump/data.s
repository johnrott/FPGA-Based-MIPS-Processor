.data 
test_array: .word 0x7FFFFFF6, 0x7FFFFFF6, 0x7FFFFFF2, 0x7FFFFFF1 
.text 
.global main 
main: addi $t0, $zero, 5
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
loop: addi $t0, $t0, -1
nop
nop
nop
nop
nop
j loop
nop
nop
nop 
nop
nop