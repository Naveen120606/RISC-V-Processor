`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2025 06:48:59
// Design Name: 
// Module Name: ALU
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


module ALU(
input [31:0] data1,data2,
input [31:0] branch_add,
input [3:0] operation,
input ALUSrc,
output Zero,
output [31:0] ALU_result
    );
    
    wire[31:0] data2_temp;
    reg[31:0] result;
    reg Zero_temp;
    
    MUX_2x1 inst6(.select(ALUSrc),.i0(data2),.i1(branch_add),.out(data2_temp));
    
    always @(*) begin
        if(operation==4'b0000) result = (data1) & (data2_temp);
        else if(operation==4'b0001) result = (data1) | (data2_temp);
        else if(operation==4'b0010) result = (data1) + (data2_temp);
        else if(operation==4'b0110) result = (data1) - (data2_temp);
        else if(operation==4'b0111) result = (data1<data2_temp);
    end
    
    assign Zero = (result==0);
    assign ALU_result = result;
endmodule
