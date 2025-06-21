`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2025 22:38:15
// Design Name: 
// Module Name: OF_stage
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


module OF_stage(
input RegWrite,RegDst,
input[31:0] writedata,
input[31:0] instruction,
output[31:0] readdata1,readdata2
    );
    
//    wire[31:0] instruction;
    
//    Instruction_memory inst3(.PC(PC),.instruction(instruction));
    
    wire[4:0] RegDst_temp;
    
    MUX_2x1 inst4(.select(RegDst),.i0(instruction[20:16]),.i1(instruction[15:11]),.out(RegDst_temp));
    
    Register_file inst5(
    .regWrite(RegWrite),
    .readreg1(instruction[25:21]),
    .readreg2(instruction[20:16]),
    .writereg(RegDst_temp),
    .writedata(writedata),
    .readdata1(readdata1),
    .readdata2(readdata2)
    );
endmodule
