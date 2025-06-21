`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2025 07:19:02
// Design Name: 
// Module Name: EX_stage
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


module EX_stage(
input[5:0] function_code,
input[1:0] ALUOp,
input[31:0] data1,data2,branch_add,
input ALUSrc,
output Zero,
output[31:0] ALU_result
    );
    
    wire[3:0] operation;
    
    ALU_control inst7(.function_code(function_code),.ALUOp(ALUOp),.operation(operation));
    ALU inst8(.data1(data1),.data2(data2),.branch_add(branch_add),.operation(operation),.ALUSrc(ALUSrc),.Zero(Zero),.ALU_result(ALU_result));
endmodule
