`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2025 10:24:37 AM
// Design Name: 
// Module Name: controller_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////




module controller_tb;

    reg [5:0] opcode;
    reg [5:0] func;

    wire RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemRead, MemToReg;
    wire [3:0] ALUOp;

 
    controller control (
        .opcode(opcode),
        .func(func),
        .RegWrite(RegWrite),
        .RegDst(RegDst),
        .ALUSrc(ALUSrc),
        .ALUOp(ALUOp),
        .Branch(Branch),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .MemToReg(MemToReg)
    );


    initial begin

        //arithmetic
        opcode = 6'b000000; func = 6'b100000; #10;
        func = 6'b100010; #10;
        func = 6'b100100; #10;
        func = 6'b100101; #10;
        func = 6'b100111; #10;
        func = 6'b100110; #10;
        func = 6'b101010; #10;
        func = 6'b000010; #10;
        func = 6'b000000; #10;

        //i type
        opcode = 6'b001000; func = 6'b000000; #10;
        opcode = 6'b001010; func = 6'b000000; #10;
        opcode = 6'b001100; func = 6'b000000; #10;
        opcode = 6'b001101; func = 6'b000000; #10;
        opcode = 6'b001110; func = 6'b000000; #10;

        //memory
        opcode = 6'b100011; func = 6'b000000; #10;
        opcode = 6'b101011; func = 6'b000000; #10;
        opcode = 6'b100001; func = 6'b000000; #10;
        opcode = 6'b101001; func = 6'b000000; #10;
        opcode = 6'b100000; func = 6'b000000; #10;
        opcode = 6'b101000; func = 6'b000000; #10;
        
        //branch
        opcode = 6'b000100; func = 6'b000000; #10;
        opcode = 6'b000101; func = 6'b000000; #10;
        opcode = 6'b000001; func = 6'b000001; #10;
        opcode = 6'b000001; func = 6'b000000; #10;
        opcode = 6'b000111; func = 6'b000000; #10;
        opcode = 6'b000110; func = 6'b000000; #10;

        //jump
        opcode = 6'b000010; func = 6'b000000; #10;
        opcode = 6'b000011; func = 6'b000000; #10;



    end

endmodule


