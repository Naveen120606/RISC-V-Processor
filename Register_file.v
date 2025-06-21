`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2025 21:55:16
// Design Name: 
// Module Name: Register_file
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


module Register_file(
input regWrite,
input[4:0] readreg1,readreg2,
input[4:0] writereg,
input[31:0] writedata,
output[31:0] readdata1,readdata2
    );
    
    reg[31:0] registers [31:0];
    reg[31:0] read1,read2;
    always @(*) begin
        if(regWrite)
            registers[writereg] = writedata;
        
        read1 = registers[readreg1];
        read2 = registers[readreg2];
    end
    
    assign readdata1 = read1;
    assign readdata2 = read2;
endmodule
