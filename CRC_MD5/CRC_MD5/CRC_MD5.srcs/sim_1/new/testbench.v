`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/26 22:02:21
// Design Name: 
// Module Name: testbench
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


module testbench();
    reg rst,clk;
    wire [31:0]out_a;
    wire [31:0]out_b;
    wire [31:0]out_c;
    wire [31:0]out_d;
    wire ready;
    initial
        begin
        clk=0;
        rst=1;
         #1000 rst=0;
         #1000 rst=1;
         #1000 rst=0;
         #1000 rst=1;
         #1000 rst=0;
         #1000 rst=1;
        end
      always #5 clk=~clk;
      

    
top test(
        .rst(rst),
        .clk(clk),
        .out_a(out_a),
        .out_b(out_b),
        .out_c(out_c),
        .out_d(out_d),
        .ready(ready)
);

endmodule
