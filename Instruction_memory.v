`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2025 09:27:35
// Design Name: 
// Module Name: Instruction_memory
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


module Instruction_memory(
input [31:0] PC,
output[31:0] instruction
    );
    
    reg[7:0] memory [0:31];
    
    assign instruction = {memory[PC+3],memory[PC+2],memory[PC+1],memory[PC]};
endmodule
