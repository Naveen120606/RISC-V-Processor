`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2025 07:36:13
// Design Name: 
// Module Name: data_memory
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


module data_memory(
input [31:0] address,
input[31:0] write_data,
input memWrite,memRead,
input memtoReg,
output out_data
    );
    
    reg[31:0] datas [0:31];
    
    reg[31:0] read_data;
    
    always @(*) begin
        if(memWrite) datas[address] = write_data;
        else if(memRead) read_data = datas[address];
    end
    
    MUX_2x1 inst9(.select(memtoReg),.i0(address),.i1(read_data),.out(out_data));
endmodule
