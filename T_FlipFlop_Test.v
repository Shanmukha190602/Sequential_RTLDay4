`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2024 19:19:13
// Design Name: 
// Module Name: T_FlipFlop_Test
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


module T_FlipFlop_Test();

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in nanoseconds
    // Signals
    reg clk;
    reg reset;
    reg T;
    wire q, q_bar;
    
    // Instantiation
    
    T_FlipFlop Dut(
    
    .q(q),
    .q_bar(q_bar),
    .t(T),
    .clk(clk),
    .reset(reset)
    );
    
    initial begin
    
        // Giving inputs
        
        T = 0;
        clk = 0;
        reset = 1;
    end
    
    // Clock generation
    always #((CLK_PERIOD)/2) clk = ~clk;
    
    always #5 T = ~T;
    initial #20 reset = 0;
    initial #50 reset = 1;
    initial #80 reset = 0;
    initial #100 $finish;
    
    always @(posedge clk) begin
    
        $monitor("Time: %d ns,  T = %B, q = %B, q_bar = %B",$time, T, q, q_bar);
    end
endmodule
