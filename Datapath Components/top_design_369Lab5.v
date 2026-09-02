`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Pct Effort : John 35%, Dylan 35%, Josh, 30%
//////////////////////////////////////////////////////////////////////////////////


module top_design_369Lab5(Clk, Reset, out7, en_out);

input Clk, Reset;
output [6:0] out7;
output [7:0] en_out;

wire [31:0] PCResult, Write_Data;
wire Clkd;

ClkDiv cdiv(Clk, 1'b0, Clkd);
Datapath(Clkd, Reset, Write_Data, PCResult);
Two4DigitDisplay disp(Clk, PCResult[15:0], Write_Data[15:0],out7, en_out);

endmodule
