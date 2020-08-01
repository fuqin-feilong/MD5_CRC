`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/31 09:58:59
// Design Name: 
// Module Name: qspi_slave
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

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/28 21:05:25
// Design Name: 
// Module Name: qspi_slave
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


module qspi_slave
#(
parameter	data_width	=	8	,
parameter	addr_width	=		32	, 
parameter	dummy	=	4
)
(
//QSPI
input	I_qspi_clk	,
input	I_qspi_cs	,
inout	IO_qspi_io0	,
inout	IO_qspi_io1	,
inout	IO_qspi_io2	,
inout	IO_qspi_io3	,

//RAMr	
output	[addr_width-1:0]	o_addr	,
output	[data_width-1:0]	o_data	,
input	[data_width-1:0]		i_data	, output		o_valid
);
localparam	INS_QWrite_Quad	=	8'b00110010  ; //32H,QSPI write instruction 
localparam	INS_FRead_Quad	=	8'b01101011  ; //6BH,QSPI read instruction
reg        [addr_width-1:0]        R_o_addr        ; 
reg        [data_width-1:0]        R_o_data        ; 
reg     	R_o_valid         ;
assign o_addr  = R_o_addr;
assign o_data = {R_o_data[7:4],IO_qspi_io3,IO_qspi_io2,IO_qspi_io1,IO_qspi_io0}; 
assign o_valid = R_o_valid;
reg        R_qspi_io0         ;
reg        R_qspi_io1         ;
reg        R_qspi_io2         ;
reg        R_qspi_io3         ;
reg        R_qspi_io0_out_en  ;
reg        R_qspi_io1_out_en  ;
reg        R_qspi_io2_out_en  ;
reg        R_qspi_io3_out_en  ;
assign	IO_qspi_io0	=	R_qspi_io0_out_en ? R_qspi_io0 :1'bz;
assign	IO_qspi_io1	=	R_qspi_io1_out_en ? R_qspi_io1 :1'bz;
assign	IO_qspi_io2	=	R_qspi_io2_out_en ? R_qspi_io2 :1'bz ;
assign	IO_qspi_io3	=	R_qspi_io3_out_en ? R_qspi_io3 :1'bz ;
reg	[7:0]	count;
always @(posedge I_qspi_clk or posedge I_qspi_cs) 
    begin
        if (I_qspi_cs) 
          begin count <= 0;
          end
    else
        begin
            count <= count + 1;
        end
    end
    reg [7:0] R_INS;
always @(posedge I_qspi_clk or posedge I_qspi_cs) 
    begin
if (I_qspi_cs) 
begin R_INS <= 0;
end 
else 
begin
if (count < 8) 
begin
R_INS[7-count] <= IO_qspi_io0;
end
end
end
always @(posedge I_qspi_clk or posedge I_qspi_cs)
begin
if (I_qspi_cs)
begin 
R_qspi_io0_out_en <= 0;
R_qspi_io1_out_en <= 0;
R_qspi_io2_out_en <= 0;
R_qspi_io3_out_en <= 0;
end 
else 
begin
if ((R_INS == INS_FRead_Quad )&&(count >= 19 )) begin
R_qspi_io0_out_en <= 1;
R_qspi_io1_out_en <= 1;
R_qspi_io2_out_en <= 1;
R_qspi_io3_out_en <= 1;
end
else 
begin
R_qspi_io0_out_en <= 0;
R_qspi_io1_out_en <= 0;
R_qspi_io2_out_en <= 0;
R_qspi_io3_out_en <= 0;
end
end
end 
reg [addr_width-1:0] addr;
always @(posedge I_qspi_clk or posedge I_qspi_cs) begin
if (I_qspi_cs) addr <= 0;
else
begin
if ((count >= 8 )&&(count <= 15 )) begin
addr[31:28] <= addr[27:24]; 
addr[27:24] <= addr[24:20]; 
addr[23:20] <= addr[19:16]; 
addr[19:16] <= addr[15:12]; 
addr[15:12] <= addr[11:8]; 
addr[11:8]  <= addr[7:4];
addr[7:4]	<= addr[3:0];
addr[3:0]	<= {IO_qspi_io3,IO_qspi_io2,IO_qspi_io1,IO_qspi_io0};
end
end
end
reg addr_add;
always @(posedge I_qspi_clk or posedge I_qspi_cs) begin
if (I_qspi_cs) addr_add <= 0;
else
begin
if ((R_INS == INS_FRead_Quad )&&(count >= 17 ))
addr_add <= !addr_add;
else if ((R_INS == INS_QWrite_Quad )&&(count >= 20 )) 
addr_add <= !addr_add;
else
addr_add <= 0;
end
end
always @(posedge I_qspi_clk or posedge I_qspi_cs) begin
if (I_qspi_cs) R_o_addr <= 0;
else
begin
if (count == 15 )
R_o_addr <= {addr[27:0],IO_qspi_io3,IO_qspi_io2,IO_qspi_io1,IO_qspi_io0};
else if ((count >= 18 )&&(addr_add)) R_o_addr <= R_o_addr + 1;
end
end
reg Write_HL;
always @(posedge I_qspi_clk or posedge I_qspi_cs) begin
if (I_qspi_cs) Write_HL <= 0;
else
begin
if ((R_INS == INS_QWrite_Quad )&&(count >= 20 )) Write_HL <= !Write_HL;
else
Write_HL <= 0;
end
end
always @(negedge I_qspi_clk or posedge I_qspi_cs) begin
if (I_qspi_cs ) R_o_valid <= 0;
else
begin
if ((R_INS == INS_QWrite_Quad )&&(count >= 21 )) R_o_valid <= !R_o_valid;
else
R_o_valid <= 0;
end
end
always @(posedge I_qspi_clk or posedge I_qspi_cs) begin
if (I_qspi_cs) R_o_data[7:0] <= 0;
else
begin
if ((R_INS == INS_QWrite_Quad )&&(count >= 20 )) begin
if (Write_HL)
R_o_data[3:0] <= {IO_qspi_io3,IO_qspi_io2,IO_qspi_io1,IO_qspi_io0} ;
else
R_o_data[7:4] <= {IO_qspi_io3,IO_qspi_io2,IO_qspi_io1,IO_qspi_io0} ;
end
else
R_o_data[7:0] <= 0;
end
end
reg Read_HL;
always @(posedge I_qspi_clk or posedge I_qspi_cs) begin
if (I_qspi_cs) begin
Read_HL <= 0;
end else begin
if ((R_INS == INS_FRead_Quad )&&(count >= 19 )) Read_HL <= !Read_HL;
else
Read_HL <= 0;
end
end
always @(posedge I_qspi_clk or posedge I_qspi_cs) begin
if (I_qspi_cs) begin
R_qspi_io0 <= 0;
R_qspi_io1 <= 0;
R_qspi_io2 <= 0;
R_qspi_io3 <= 0;
end else begin
if ((R_INS == INS_FRead_Quad )&&(count >= 19 ))
if (Read_HL) begin
R_qspi_io0 <= i_data[0]; R_qspi_io1 <= i_data[1]; R_qspi_io2 <= i_data[2]; R_qspi_io3 <= i_data[3];
end else begin
R_qspi_io0 <= i_data[4]; R_qspi_io1 <= i_data[5]; R_qspi_io2 <= i_data[6]; R_qspi_io3 <= i_data[7];
end else begin
R_qspi_io0 <= 0;
R_qspi_io1 <= 0;
R_qspi_io2 <= 0;
R_qspi_io3 <= 0;
end
end
end
endmodule










