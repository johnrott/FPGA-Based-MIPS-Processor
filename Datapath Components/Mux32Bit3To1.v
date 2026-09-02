`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2025 10:15:49 PM
// Design Name: 
// Module Name: Mux32Bit3To1
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


module Mux32Bit3To1(
    output reg [31:0] out,
    input      [31:0] inA,
    input      [31:0] inB,
    input      [31:0] inC,
    input      [1:0]  sel
);
    always @(*) begin
        case (sel)
            2'b00: out = inA; 
            2'b10: out = inB; 
            2'b01: out = inC; 
            default: out = inA;
        endcase
    end
endmodule
