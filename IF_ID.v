`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2025 12:08:10
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(
input CLK,
input resetn,
input PCSrc,
output [31:0] instruction
    );
    
    reg[31:0] PC;
    reg[31:0] PC_temp;
    wire[31:0] PC_updated;
    reg[31:0] branch;
    
    Instruction_memory inst1(.PC(PC),.instruction(instruction));
    
    always @(*) begin
        branch = (instruction[15]?{16'b1111111111111111,instruction[15:0]}:{16'b0,instruction[15:0]}) << 2;
        PC_temp = PC + 3'd4;
    end
    
    MUX_2x1 inst2(.select(PCSrc),.i0(PC_temp),.i1(PC_temp + branch),.out(PC_updated));
    
    always @(posedge CLK) begin
        if(~resetn)
            PC <= 0;
        else begin
            PC <= PC_updated;
        end
    end
    
endmodule
