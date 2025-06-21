`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2025 06:14:51
// Design Name: 
// Module Name: Processor_Top_Module
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


module Processor_Top_Module(
input CLK,
input resetn,
output[31:0] ALU_Result
    );
    
    wire PCSrc;
    wire[31:0] instruction;
    wire[31:0] writedata;
    wire[31:0] branch_add;
    
    assign branch_add = (instruction[15]?{16'b1111111111111111,instruction[15:0]}:{16'b0,instruction[15:0]});
    
    IF_ID stage1(
    .CLK(CLK),
    .resetn(resetn),
    .PCSrc(PCSrc),
    .instruction(instruction)
    );
    
    Control stage2(
    .Op_code(instruction[31:26]),
    .RegDst(RegDst),
    .Branch(Branch),
    .MemRead(MemRead),
    .MemtoReg(MemtoReg),
    .ALUOp(ALUOp),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite)
    );
    
    OF_stage stage3(
    .RegWrite(RegWrite),
    .RegDst(RegDst),
    .writedata(writedata),
    .instruction(instruction),
    .readdata1(readdata1),
    .readdata2(readdata2)
    );
    
    EX_stage stage4(
    .function_code(instruction[5:0]),
    .ALUOp(ALUOp),
    .data1(readdata1),
    .data2(readdata2),
    .branch_add(branch_add),
    .ALUSrc(ALUSrc),
    .Zero(Zero),
    .ALU_result(ALU_result)
    );
    
    data_memory stage5(
    .address(ALU_result),
    .write_data(readdata2),
    .memWrite(MemWrite),
    .memRead(MemRead),
    .memtoReg(MemtoReg),
    .out_data(writedata)
    );
    
    assign PCSrc = Zero & Branch;
    assign ALU_Result = ALU_result;
endmodule
