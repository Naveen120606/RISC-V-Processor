`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2025 21:52:14
// Design Name: 
// Module Name: MUX_2x1
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


module MUX_2x1
#(parameter Datawidth=32)(
input select,
input[Datawidth-1:0] i0,i1,
output reg[Datawidth-1:0] out
    );
    
    always @(*) begin
        if(select) out = i1;
        else out =i0;
    end
    
endmodule
