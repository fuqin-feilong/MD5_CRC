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
    reg rst_n,clk;
   // wire [127:0]digest;
   // wire valid;
    //wire [127:0]value;
    //reg [127:0]message;
    reg [7:0]data_in;
    wire[7:0]data_out;
    wire [7:0]addr;
    wire wen;
    initial
        begin
        clk=0;
      // wen=0;

       rst_n=0;
        data_in=8'h61;
         #10 rst_n=1;
         
         //#10 rst=0;
        
        end
      always #5 clk=~clk;
      


qspi aa(
.clk(clk),
.rst_n(rst_n),
//RAM

.data_in(data_in),
.addr(addr), 
.data_out(data_out),
.wen(wen)
);
    







endmodule
