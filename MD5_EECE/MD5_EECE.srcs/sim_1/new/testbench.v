`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/28 08:58:46
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
    wire [127:0]digest;
    wire valid;
    wire [127:0]value;
    reg [127:0]message;
    initial
        begin
        clk=0;
        rst=1;
        message=128'h61616161616161616161616161616161;
         #10 rst=1;
         
         #10 rst=0;
        
        end
      always #5 clk=~clk;
      

    
md5_iterative  md5(
.digest_o(digest),//output [127:0] 
 .valid(valid),//output 
 .value(value), //  output [127:0]
.clk(clk),
 .rst(rst), //input
.message(message),//   input [127:0] 
.new_message(1)
);

endmodule
