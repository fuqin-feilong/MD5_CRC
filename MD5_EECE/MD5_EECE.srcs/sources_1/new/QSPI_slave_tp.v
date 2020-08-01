`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/31 10:02:23
// Design Name: 
// Module Name: QSPI_slave_tp
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



module QSPI_slave_tp(
    clk,
    rst_n,
    qspi_d0,
    qspi_d1,
    qspi_d2,
    qspi_d3,
    I_qspi_cs,
    I_qspi_clk
    );

input   clk;
input   rst_n;
inout   qspi_d0;
inout   qspi_d1;
inout   qspi_d2;
inout   qspi_d3;
input   I_qspi_cs;
input   I_qspi_clk;

wire [31:0] addr;
wire [7:0]  o_data;
wire [7:0]  i_data;
wire o_valid;
//QSPI����ģ��
qspi_slave u_qspi_slave(
    .I_qspi_clk  (I_qspi_clk)  , 
    .I_qspi_cs   (I_qspi_cs)  , 
    .IO_qspi_io0 (qspi_d0)  ,
    .IO_qspi_io1 (qspi_d1)  ,
    .IO_qspi_io2 (qspi_d2)  , 
    .IO_qspi_io3 (qspi_d3)  , 
    .o_addr      (addr)    ,
    .o_data      (o_data)  ,
    .i_data      (i_data)  ,
    .o_valid     (o_valid) 
    );

wire [31:0] addrb;
wire [7:0] dinb;
wire [7:0] doutb;
wire web;
//RAM
blk_mem_gen_0 u_blk_mem_gen_0(
    .addra(addr),
    .clka(I_qspi_clk),
    .dina(o_data),
    .douta(i_data),
    .wea(o_valid),
    .addrb(addrb),
    .clkb(clk),
    .dinb(dinb),
    .doutb(doutb),
    .web(web)
);
//���ݴ���ģ��
qspi u_qspi(
     .clk(clk),
     .rst_n(rst_n),
     .addr(addrb),
     .data_in(doutb),
     .data_out(dinb),
     .wen(web)
);

endmodule
