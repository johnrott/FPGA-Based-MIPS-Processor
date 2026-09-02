`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - data_memory.v
// Description - 32-Bit wide data memory.
//
// INPUTS:-
// Address: 32-Bit address input port.
// WriteData: 32-Bit input port.
// Clk: 1-Bit Input clock signal.
// MemWrite: 1-Bit control signal for memory write.
// MemRead: 1-Bit control signal for memory read.
//
// OUTPUTS:-
// ReadData: 32-Bit registered output port.
//
// FUNCTIONALITY:-
// Design the above memory similar to the 'RegisterFile' model in the previous 
// assignment.  Create a 1K memory, for which we need 10 bits.  In order to 
// implement byte addressing, we will use bits Address[11:2] to index the 
// memory location. The 'WriteData' value is written into the address 
// corresponding to Address[11:2] in the positive clock edge if 'MemWrite' 
// signal is 1. 'ReadData' is the value of memory location Address[11:2] if 
// 'MemRead' is 1, otherwise, it is 0x00000000. The reading of memory is not 
// clocked.
//
// you need to declare a 2d array. in this case we need an array of 1024 (1K)  
// 32-bit elements for the memory.   
// for example,  to declare an array of 256 32-bit elements, declaration is: reg[31:0] memory[0:255]
// if i continue with the same declaration, we need 8 bits to index to one of 256 elements. 
// however , address port for the data memory is 32 bits. from those 32 bits, least significant 2 
// bits help us index to one of the 4 bytes within a single word. therefore we only need bits [9-2] 
// of the "Address" input to index any of the 256 words. 
////////////////////////////////////////////////////////////////////////////////

module DataPath( Clk, Reset);

wire [4:0]rt; 
wire [4:0]rs;
wire [4:0]rd;
wire [15:0]immediate;

  input Clk, Reset;
      // ==================== ID/EX PIPELINE REGISTER ====================

  // ---------------------- Decode stage ------------ //
  reg [31:0] immediate;
  wire ReadData1;
  wire ReadData2;
  wire [31:0] signExtension;
    //assign the parts that go to the register file
  wire [5:0] IF_ID, ID_EX, EX_MEM, MEM_WB;
assign rs_id = immediate[25:21];
assign rt_id = immediate[20:16];
assign rd_id = immediate[15:11];
assign MEM_WB = immediate[25:20];

SignExtension(immediate [15:0], signExtension);
  
RegisterFile regfile (
    .ReadRegister1(rs_id),       // IF/ID instruction[25:21]
    .ReadRegister2(rt_id),       // IF/ID instruction[20:16]
    .WriteRegister(WB_WriteReg), // From MEM/WB stage
    .WriteData(WB_WriteData),    // From MEM/WB stage
    .RegWrite(WB_RegWrite),      // From MEM/WB stage
    .Clk(Clk),                   // System clock
    .ReadData1(reg_read_data1_ID),
    .ReadData2(reg_read_data2_ID)
);
    //register between Decode and Execution

// Define all signals stored in the pipeline register
reg [31:0] ReadData1_IDEX;
reg [31:0] ReadData2_IDEX;
reg [31:0] SignExtImm_IDEX;
reg [4:0]  rs_IDEX;
reg [4:0]  rt_IDEX;
reg [4:0]  rd_IDEX;

// Control signals from decode stage (will come from your control unit)
reg RegDst_IDEX;
reg ALUSrc_IDEX;
reg ALUSrc_IDEX;
reg [2:0] ALUOp_IDEX; // example width, depends on your control design

// Update these registers every clock cycle
always @(posedge Clk or posedge Reset) begin
    if (Reset) begin
        ReadData1_IDEX <= 32'b0;
        ReadData2_IDEX <= 32'b0;
        SignExtImm_IDEX <= 32'b0;
        rs_IDEX <= 5'b0;
        rt_IDEX <= 5'b0;
        rd_IDEX <= 5'b0;
        RegDst_IDEX <= 1'b0;
        ALUSrc_IDEX <= 1'b0;
        ALUOp_IDEX <= 3'b000;
    end else begin
        ReadData1_IDEX <= reg_read_data1_ID;
        ReadData2_IDEX <= reg_read_data2_ID;
        SignExtImm_IDEX <= signExtension;
        rs_IDEX <= rs_id;
        rt_IDEX <= rt_id;
        rd_IDEX <= rd_id;
        RegDst_IDEX <= RegDst;   // from controller
        ALUSrc_IDEX <= ALUSrc;   // from controller
        ALUOp_IDEX <= ALUOp;     // from controller
    end
end
    

// ------------------- execution stage ------------//
    wire [31:0] ALU_inA = ReadData1_IDEX;     // from reg_read1 or forwarded value
    wire [31:0] ALU_inB = ReadData2_IDEX;     // from reg_read2 or forwarded or signext
    wire [31:0] ALU_inB_afterSrc; // after ALUSrc MUX
    wire [31:0] Write_EX_MEM;
    wire 
    reg [31:0] immediate_EX_MEM;
    
    
    reg [31:0] bruh;
    wire ALUSrc;
    wire RegDst;
    
     // ALUSrc selects immediate or register (after forwarding)
    assign ALU_inB_afterSrc = (ALUSrc) ? ALU_inB : bruh;
    
    assign Write_Ex_MEM = (RegDst) ? ALU_inB : bruh;
    
    ALU alu (
        .a(ALU_inA),
        .b(ALU_inB_afterSrc),
        .alu_control(IDEX_ALUOp),
        .result(ALU_result_EX),
        .zero(ALU_zero_EX)
    );
    
    

endmodule
