`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2025 11:10:12 AM
// Design Name: 
// Module Name: forwardingUnit
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


module forwardingUnit(
    input EXMEM_RegWrite,
    input [4:0] EXMEM_RegisterDestination,
    input MEMWB_RegWrite,
    input [4:0] MEMWB_RegisterDestination,

    input [4:0] IDEX_rs,
    input [4:0] IDEX_rt,

    // NEW: ALUSrcE tells us if RT is *not* used
    input ALUSrcE,

    // NEW: isShiftE tells us if this instruction is SLL/SRL/SRA
    input isShiftE,

    output reg [1:0] ForwardAE,
    output reg [1:0] ForwardBE
);

    always @(*) begin
        // Default
        ForwardAE = 2'b00;
        ForwardBE = 2'b00;

        // -------- FORWARD A --------
        if (EXMEM_RegWrite &&
            (EXMEM_RegisterDestination != 5'd0) &&
            (EXMEM_RegisterDestination == IDEX_rs))
            ForwardAE = 2'b10;   // EX/MEM ? EX

        else if (MEMWB_RegWrite &&
                 (MEMWB_RegisterDestination != 5'd0) &&
                 (MEMWB_RegisterDestination == IDEX_rs))
            ForwardAE = 2'b01;   // MEM/WB ? EX

        // -------- FORWARD B --------
        if (EXMEM_RegWrite &&
            (EXMEM_RegisterDestination != 5'd0) &&
            (EXMEM_RegisterDestination == IDEX_rt))
            ForwardBE = 2'b10;   // EX/MEM ? EX

        else if (MEMWB_RegWrite &&
                 (MEMWB_RegisterDestination != 5'd0) &&
                 (MEMWB_RegisterDestination == IDEX_rt))
            ForwardBE = 2'b01;   // MEM/WB ? EX
    end
endmodule

/*module forwardingUnit(
    input EXMEM_RegWrite,
    input [4:0] EXMEM_RegisterDestination,
    input MEMWB_RegWrite,
    input [4:0] MEMWB_RegisterDestination,
    input WB_RegWrite,
    input [4:0] WB_RegisterDestination,

    input [4:0] IDEX_rs,
    input [4:0] IDEX_rt,

    // NEW: ALUSrcE tells us if RT is *not* used
    input ALUSrcE,

    // NEW: isShiftE tells us if this instruction is SLL/SRL/SRA
    input isShiftE,

    output [1:0] ForwardAE,
    output [1:0] ForwardBE
);

    // Matches for forwarding to A
    wire ex_rs_match = EXMEM_RegWrite && (EXMEM_RegisterDestination != 5'd0) &&
                       (EXMEM_RegisterDestination == IDEX_rs);

    wire wb_rs_match = MEMWB_RegWrite && (MEMWB_RegisterDestination != 5'd0) &&
                       (MEMWB_RegisterDestination == IDEX_rs);

    wire w_rs_match  = WB_RegWrite && (WB_RegisterDestination != 5'd0) &&
                       (WB_RegisterDestination == IDEX_rs);

    // Matches for forwarding to B
    wire ex_rt_match = EXMEM_RegWrite && (EXMEM_RegisterDestination != 5'd0) &&
                       (EXMEM_RegisterDestination == IDEX_rt);

    wire wb_rt_match = MEMWB_RegWrite && (MEMWB_RegisterDestination != 5'd0) &&
                       (MEMWB_RegisterDestination == IDEX_rt);

    wire w_rt_match  = WB_RegWrite && (WB_RegisterDestination != 5'd0) &&
                       (WB_RegisterDestination == IDEX_rt);

    // NEW:
    // RT should be forwarded ONLY if the instruction actually uses RT as an ALU operand.
    //
    // RT is NOT used when:
    //  - ALUSrcE = 1  (immediate instruction)
    //  - isShiftE = 1 (SLL/SRL/SRA use A and shamt)
    //
    wire usesRtAsALUOperandE = (!ALUSrcE) && (!isShiftE);
    wire usesRsAsALUOperandE = (!isShiftE);

    // Forward A (RS) normally
    assign ForwardAE =
       
        ex_rs_match ? 2'b10 :
        wb_rs_match ? 2'b01 :
        //w_rs_match  ? 2'b11 :
                      2'b00;


    // Forward B (RT) ONLY IF RT is used
    assign ForwardBE =
            ex_rt_match ? 2'b10 :
            wb_rt_match ? 2'b01 :
            //w_rt_match  ? 2'b11 :
                          2'b00;


endmodule*/