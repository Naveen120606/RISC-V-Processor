`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2025 07:00:33
// Design Name: 
// Module Name: ALU_control
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


module ALU_control(
input [5:0] function_code,
input [1:0] ALUOp,
output [3:0] operation
    );
    
    reg[3:0] operation_temp;
    
    always @(*) begin
        if(ALUOp == 2'b00) operation_temp = 4'b0010; // add for load and store
        else if(ALUOp==2'b01) operation_temp = 4'b0110; // subtract for branch equal
        else if((ALUOp==2'b10) && (function_code==6'b100000)) operation_temp = 4'b0010; // add r-type
        else if((ALUOp==2'b10) && (function_code==6'b100010)) operation_temp = 4'b0110; // subtract r-type
        else if((ALUOp==2'b10) && (function_code==6'b100100)) operation_temp = 4'b0000; // AND r-type
        else if((ALUOp==2'b10) && (function_code==6'b100101)) operation_temp = 4'b0001; // OR r-type
        else if((ALUOp==2'b10) && (function_code==6'b101010)) operation_temp = 4'b0111; // set on less than r-type
    end
    
    assign operation = operation_temp;
endmodule
