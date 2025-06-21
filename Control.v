`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2025 05:58:41
// Design Name: 
// Module Name: Control
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


module Control(
input [5:0] Op_code,
output RegDst,Branch,
output MemRead,MemtoReg,
output [1:0] ALUOp,
output MemWrite,ALUSrc,
output RegWrite
    );
    
    reg [8:0] temp;
    always @(*) begin
        case(Op_code)
            6'b000000: temp = 9'b100100010; // r-type
            6'b100011: temp = 9'b011110000; // lw-type
            6'b101011: temp = 9'bx1x001000; // sw-type
            6'b000100: temp = 9'bx0x000101; // beq-type
        endcase
    end
    
    assign{RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp} = temp;
endmodule
