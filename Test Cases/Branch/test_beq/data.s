.data 
test_array: .word 0x7FFFFFF6, 0x7FFFFFF6, 0x7FFFFFF2, 0x7FFFFFF1 
.text 
.global main 
main: addi $t0, $zero, 2
nop
nop
nop
nop
nop
addi $t1, $zero, 1
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
beq $t0, $t1, loop
nop
nop
nop 
nop
nop