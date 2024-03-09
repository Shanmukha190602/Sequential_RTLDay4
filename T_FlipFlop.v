`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2024 19:09:59
// Design Name: 
// Module Name: T_FlipFlop
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


module T_FlipFlop(

    output reg q,
    output q_bar,
    input t, clk,reset
);

    always @ (posedge clk)
        if (reset==1) begin
            q <= 0;
        end
        else if(t==0) begin   // Memory state
            q <=q;
        end
        else begin
            q <= ~q;
        end
    
    assign q_bar = ~q;
endmodule
