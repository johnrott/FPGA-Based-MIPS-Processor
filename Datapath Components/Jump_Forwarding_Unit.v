`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2025 02:39:15 PM
// Design Name: 
// Module Name: Jump_Forwarding_Unit
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


module Jump_Forwarding_Unit(
    
    input IDEX_RegWrite,
    input [4:0] IDEX_RegisterDestination,
    
    input EXMEM_RegWrite,
    input [4:0] EXMEM_RegisterDestination,
    input MEMWB_RegWrite,
    input [4:0] MEMWB_RegisterDestination,
    

    input [4:0] FID_rs,

    output reg [1:0] ForwardJump
    );
    always @(*) begin
        // Default
        ForwardJump = 2'b00;

        // -------- FORWARD A --------
        
        if (IDEX_RegWrite &&
            (IDEX_RegisterDestination != 5'd0) &&
            (IDEX_RegisterDestination == FID_rs))
            ForwardJump = 2'b01;   // EX ? ID
        else if (EXMEM_RegWrite &&
            (EXMEM_RegisterDestination != 5'd0) &&
            (EXMEM_RegisterDestination == FID_rs))
            ForwardJump = 2'b10;   // EX/MEM ? ID

        else if (MEMWB_RegWrite &&
                 (MEMWB_RegisterDestination != 5'd0) &&
                 (MEMWB_RegisterDestination == FID_rs))
            ForwardJump = 2'b11;   // MEM/WB ? ID
    end

endmodule
