`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2025 08:53:43 PM
// Design Name: 
// Module Name: hazardDetection
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


module hazardDetection(
    input [4:0] rsD,
    input [4:0] rtD,

    input MemReadE, //read from memory
    input [4:0] WriteRegE,

    input PCSrcM,      // 1 when branch taken

    output load_stall,
    output flushBranch
);

    //stalls if there is a load instruction hazard in the ex stage
    assign load_stall = ~PCSrcM && MemReadE && (WriteRegE != 5'd0) && ((WriteRegE == rsD) || (WriteRegE == rtD));


    // Branch taken
    assign flushBranch = PCSrcM;
    
endmodule
