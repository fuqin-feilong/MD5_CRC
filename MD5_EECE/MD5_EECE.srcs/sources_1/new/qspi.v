`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/28 22:30:22
// Design Name: 
// Module Name: qspi_adder
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


module qspi#( parameter addr_width = 8
)(
input clk, input rst_n,
//RAM
output reg [addr_width-1:0] addr, 
input [7:0]data_in,
output reg [7:0] data_out,
output reg wen
);
reg [9:0] count;
reg [127:0]message=0;
wire [127:0]value=0;
wire valid;
wire [127:0]digest;
wire [7:0] rcount;//0x00 ~ 0x0f : get the data ; 0x10 ~ 0x1f : output the data to RAM 
assign rcount = count[9:2];
always @(posedge clk,negedge rst_n) begin
    if (!rst_n)
         count <= 0;
    else
    if (rcount < 32)
        count <= count + 1;
    else
        count <= 0;
    end
always @(posedge clk,negedge rst_n) begin
        if (!rst_n)
            addr <= 0;
        else
        if (rcount < 32) addr <= rcount;
        else
            addr <= 0;
        end
    reg [7:0] mem [0:15];
    integer i; reg [7:0] dig [0:15];
    initial begin
       for(i=0;i<16;i=i+1) dig[i]=0;
       end
always @(posedge clk,negedge rst_n) begin
        if (!rst_n) begin
            for (i=0;i<15;i=i+1) mem[i] <= 0;
            end
        else
        if ((rcount < 16)&&(count[1:0] == 2'b11)) mem[rcount] <= data_in;
    end
always @(posedge clk,negedge rst_n) begin
        if (!rst_n)
            data_out <= 0;
        else
        if (rcount < 32)
              data_out <= dig[rcount-16];
        else
            data_out <= 0;
    end

always @(posedge clk,negedge rst_n) begin
        if (!rst_n) begin
                wen <= 0;
            end
        else
        if ((rcount >= 16)&&(rcount < 32)) 
            wen <= 1;
        else
            wen <= 0;
        end



 reg en_out = 0;
    
   always @(posedge clk) begin
        if (rcount==15) begin
            message<={mem[0][7:0],mem[1][7:0],mem[2][7:0],mem[3][7:0],  mem[4][7:0],mem[5][7:0],mem[6][7:0],mem[7][7:0],  mem[8][7:0],mem[9][7:0],mem[10][7:0],mem[11][7:0]};
        end
        end 
    
    always @(posedge clk) begin
        if (valid==1) 
          en_out=1;
       else if (en_out)
       {dig[0][7:0],dig[1][7:0],dig[2][7:0],dig[3][7:0],dig[4][7:0],dig[5][7:0],dig[6][7:0],dig[7][7:0],dig[8][7:0],dig[9][7:0],dig[10][7:0],dig[11][7:0],dig[12][7:0],dig[13][7:0],dig[14][7:0],dig[15][7:0]}<=digest[127:0];
    end

        
 md5_run  md5(
.digest_o(digest),//output [127:0] 
 .valid(valid),//output 
 .value(value), //  output [127:0]
.clk(clk),
 .rst(~rst_n), //input
.message(message),//   input [127:0] 
.new_message(1)
);







endmodule