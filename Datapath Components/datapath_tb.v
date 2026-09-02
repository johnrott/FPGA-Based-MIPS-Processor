`timescale 1ns / 1ps

///////////////////PERCENT EFFORT////////////////////////


//John Rottinghaus - 35%
//Joshua Dokken - 32.5%
//Dylan Correa - 32.5%



//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2025 01:02:21 PM
// Design Name: 
// Module Name: datapath_tb
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


module datapath_tb();

    reg Clk_tb, Rst_tb;
    wire [31:0] WD_tb, bam, p, po;

    Datapath data(
        .Clk(Clk_tb),
        .Rst(Rst_tb),
        .Write_Data(WD_tb),
        .ab(ab),
        .bam(bam),
        .p(p),
        .po(po)
    );


    initial begin
        Clk_tb = 0;
        forever #50 Clk_tb = ~Clk_tb; 
    end

    initial begin
        Rst_tb = 1;
        #200;
        Rst_tb = 0;
        
    end
endmodule
