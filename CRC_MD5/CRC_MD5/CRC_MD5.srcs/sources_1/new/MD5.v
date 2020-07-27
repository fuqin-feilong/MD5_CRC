`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/26 20:40:16
// Design Name: 
// Module Name: MD5
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


module MD5(rst,clk,out_a,out_b,out_c,out_d,in_data,ready);
	input rst,clk;
	input [31:0] in_data;
	output [31:0] out_a,out_b,out_c,out_d;
	output ready;
	reg [31:0] out_a,out_b,out_c,out_d;
	reg [31:0] a=32'h01234567,b=32'h89abcdef,c=32'hfedcba98,d=32'd76543210;
	reg [31:0] in_data_reg[0:15];
	reg ready;
	reg [7:0] case_c1 = 0;
	reg [4:0] S11=7,S12=12,S13=17,S14=22,
			  S21=5,S22=9,S23=14,S24=20,
			  S31=4,S32=11,S33=16,S34=23,
			  S41=6,S42=10,S43=15,S44=21;
			  
	always @(posedge clk or negedge rst)
		begin
			if(!rst)
				begin
					case_c1<=8'd0;	
					ready<=1'b0;			
				end
			else
				begin
					case(case_c1)
						0:
							begin
								case_c1<=8'd1;	
								in_data_reg[0]<=in_data;
								ready<=1'b0;
							end
						1:
							begin
								case_c1<=8'd2;	
								in_data_reg[1]<=in_data;
							end	
						2:
							begin
								case_c1<=8'd3;	
								in_data_reg[2]<=in_data;
							end
						3:
							begin
								case_c1<=8'd4;	
								in_data_reg[3]<=in_data;
							end
						4:
							begin
								case_c1<=8'd5;	
								in_data_reg[4]<=in_data;
							end
						5:
							begin
								case_c1<=8'd6;	
								in_data_reg[5]<=in_data;
							end
						6:
							begin
								case_c1<=8'd7;	
								in_data_reg[6]<=in_data;
							end
						7:
							begin
								case_c1<=8'd8;	
								in_data_reg[7]<=in_data;
							end
						8:
							begin
								case_c1<=8'd9;	
								in_data_reg[8]<=in_data;
							end
						9:
							begin
								case_c1<=8'd10;	
								in_data_reg[9]<=in_data;
							end
						10:
							begin
								case_c1<=8'd11;	
								in_data_reg[10]<=in_data;
							end
						11:
							begin
								case_c1<=8'd12;	
								in_data_reg[11]<=in_data;
							end
						12:
							begin
								case_c1<=8'd13;	
								in_data_reg[12]<=in_data;
							end
						13:
							begin
								case_c1<=8'd14;	
								in_data_reg[13]<=in_data;
							end
						14:
							begin
								case_c1<=8'd15;	
								in_data_reg[14]<=in_data;
							end
						15:
							begin
								case_c1<=8'd16;	
								in_data_reg[15]<=in_data;
							end
						16:
							begin
								case_c1<=8'd17;	
								a<=FF(a, b, c, d, in_data_reg[0],S11,32'hd76aa478);
							end
						17:
							begin
								case_c1<=8'd18;	
								d<=FF(d, a, b, c, in_data_reg[1], S12, 32'he8c7b756);
							end
						18:
							begin
								case_c1<=8'd19;	
								c<=FF(c, d, a, b, in_data_reg[2], S13, 32'h242070db);
							end
						19:
							begin
								case_c1<=8'd20;	
								b<=FF(b, c, d, a, in_data_reg[3], S14, 32'hc1bdceee);
							end
						20:
							begin
								case_c1<=8'd21;	
								a<=FF(a, b, c, d, in_data_reg[4], S11, 32'hf57c0faf);
							end
						21:
							begin
								case_c1<=8'd22;	
								d<=FF(d, a, b, c, in_data_reg[5], S12, 32'h4787c62a);
							end
						22:
							begin
								case_c1<=8'd23;	
								c<=FF(c, d, a, b, in_data_reg[6], S13, 32'ha8304613);
							end
						23:
							begin
								case_c1<=8'd24;	
								b<=FF(b, c, d, a, in_data_reg[7], S14, 32'hfd469501);
							end
						24:
							begin
								case_c1<=8'd25;	
								a<=FF(a, b, c, d,in_data_reg[8], S11, 32'h698098d8); 
							end
						25:
							begin
								case_c1<=8'd26;	
								d<=FF(d, a, b, c,in_data_reg[9], S12, 32'h8b44f7af); 
							end
						26:
							begin
								case_c1<=8'd27;	
								c<=FF(c, d, a, b,in_data_reg[10], S13, 32'hffff5bb1);
							end
						27:
							begin
								case_c1<=8'd28;	
								b<=FF(b, c, d, a, in_data_reg[11], S14, 32'h895cd7be);
							end
						28:
							begin
								case_c1<=8'd29;	
								a<=FF(a, b, c, d, in_data_reg[12], S11, 32'h6b901122);
							end
						29:
							begin
								case_c1<=8'd30;	
								d<= FF(d, a, b, c,in_data_reg[13], S12, 32'hfd987193);
							end
						30:
							begin
								case_c1<=8'd31;	
								c<=FF(c, d, a, b, in_data_reg[14], S13, 32'ha679438e);
							end
						31:
							begin
								case_c1<=8'd32;	
								b<= FF(b, c, d, a,in_data_reg[15], S14, 32'h49b40821);
							end
						32:
							begin
								case_c1<=8'd33;	
								a<=GG(a, b, c, d,in_data_reg[1], S21, 32'hf61e2562); 
							end
						33:
							begin
								case_c1<=8'd34;	
								d<=GG(d, a, b, c, in_data_reg[6], S22, 32'hc040b340); 
							end
						34:
							begin
								case_c1<=8'd35;	
								c<=GG(c, d, a, b, in_data_reg[11], S23, 32'h265e5a51); 
							end
						35:
							begin
								case_c1<=8'd36;	
								b<=GG(b, c, d, a,in_data_reg[0], S24, 32'he9b6c7aa);
							end
						36:
							begin
								case_c1<=8'd37;	
								a<= GG(a, b, c, d,in_data_reg[5], S21, 32'hd62f105d);
							end
						37:
							begin
								case_c1<=8'd38;	
								d<=GG(d, a, b, c, in_data_reg[10], S22,  32'h2441453);
							end
						38:
							begin
								case_c1<=8'd39;	
								c<=GG(c, d, a, b,in_data_reg[15], S23, 32'hd8a1e681);
							end
						39:
							begin
								case_c1<=8'd40;	
								b<=GG(b, c, d, a, in_data_reg[4], S24, 32'he7d3fbc8); 
							end
						40:
							begin
								case_c1<=8'd41;	
								a<=GG(a, b, c, d, in_data_reg[9], S21, 32'h21e1cde6);
							end
						41:
							begin
								case_c1<=8'd42;	
								d<=GG(d, a, b, c, in_data_reg[14], S22, 32'hc33707d6);
							end
						42:
							begin
								case_c1<=8'd43;	
								c<=GG(c, d, a, b, in_data_reg[3], S23, 32'hf4d50d87);
							end
						43:
							begin
								case_c1<=8'd44;	
								b<=GG(b, c, d, a, in_data_reg[8], S24, 32'h455a14ed);
							end
						44:
							begin
								case_c1<=8'd45;	
								a<=GG(a, b, c, d, in_data_reg[13], S21, 32'ha9e3e905);
							end
						45:
							begin
								case_c1<=8'd46;	
								d<=GG(d, a, b, c, in_data_reg[2], S22, 32'hfcefa3f8); 
							end
						46:
							begin
								case_c1<=8'd47;	
								c<=GG(c, d, a, b, in_data_reg[7], S23, 32'h676f02d9);
							end
						47:
							begin
								case_c1<=8'd48;	
								b<=GG(b, c, d, a, in_data_reg[12], S24, 32'h8d2a4c8a);
							end
						48:
							begin
								case_c1<=8'd49;	
								a<=HH(a, b, c, d,in_data_reg[5], S31, 32'hfffa3942);
							end
						49:
							begin
								case_c1<=8'd50;	
								d<=HH(d, a, b, c,in_data_reg[8], S32, 32'h8771f681);
							end
						50:
							begin
								case_c1<=8'd51;	
								c<=HH(c, d, a, b,in_data_reg[11], S33, 32'h6d9d6122);
							end
						51:
							begin
								case_c1<=8'd52;	
								b<=HH(b, c, d, a,in_data_reg[14], S34, 32'hfde5380c);
							end
						52:
							begin
								case_c1<=8'd53;	
								a<=HH(a, b, c, d,in_data_reg[1], S31, 32'ha4beea44);
							end
						53:
							begin
								case_c1<=8'd54;	
								d<=HH(d, a, b, c,in_data_reg[4], S32, 32'h4bdecfa9);
							end
						54:
							begin
								case_c1<=8'd55;	
								c<=HH(c, d, a, b,in_data_reg[7], S33, 32'hf6bb4b60); 
							end
						55:
							begin
								case_c1<=8'd56;	
								b<=HH(b, c, d, a,in_data_reg[10], S34, 32'hbebfbc70); 
							end
						56:
							begin
								case_c1<=8'd57;	
								a<=HH(a, b, c, d,in_data_reg[13], S31, 32'h289b7ec6); 
							end
						57:
							begin
								case_c1<=8'd58;	
								d<=HH(d, a, b, c,in_data_reg[0], S32, 32'heaa127fa); 
							end
						58:
							begin
								case_c1<=8'd59;	
								c<=HH(c, d, a, b,in_data_reg[3], S33, 32'hd4ef3085);
							end
						59:
							begin
								case_c1<=8'd60;	
								b<=HH(b, c, d, a,in_data_reg[6], S34,  32'h4881d05);
							end
						60:
							begin
								case_c1<=8'd61;	
								a<=HH(a, b, c, d,in_data_reg[9], S31, 32'hd9d4d039);
							end
						61:
							begin
								case_c1<=8'd62;	
								d<=HH(d, a, b, c,in_data_reg[12], S32, 32'he6db99e5);
							end
						62:
							begin
								case_c1<=8'd63;	
								c<=HH(c, d, a, b,in_data_reg[15], S33, 32'h1fa27cf8);
							end
						63:
							begin
								case_c1<=8'd64;	
								b<= HH(b, c, d, a,in_data_reg[2], S34,32'hc4ac5665);
							end
						64:
							begin
								case_c1<=8'd65;	
								a<=II(a, b, c, d,in_data_reg[0], S41, 32'hf4292244); 
							end
						65:
							begin
								case_c1<=8'd66;	
								d<=II(d, a, b, c,in_data_reg[7], S42, 32'h432aff97);
							end
						66:
							begin
								case_c1<=8'd67;	
								c<=II(c, d, a, b, in_data_reg[14], S43, 32'hab9423a7); 
							end
						67:
							begin
								case_c1<=8'd68;	
								b<=II(b, c, d, a,in_data_reg[5], S44, 32'hfc93a039);
							end
						68:
							begin
								case_c1<=8'd69;	
								a<=II(a, b, c, d,in_data_reg[12], S41, 32'h655b59c3);
							end
						69:
							begin
								case_c1<=8'd70;	
								d<=II(d, a, b, c,in_data_reg[3], S42, 32'h8f0ccc92);
							end
						70:
							begin
								case_c1<=8'd71;	
								c<=II(c, d, a, b,in_data_reg[10], S43, 32'hffeff47d); 
							end
						71:
							begin
								case_c1<=8'd72;	
								b<=II(b, c, d, a,in_data_reg[1], S44, 32'h85845dd1);
							end
						72:
							begin
								case_c1<=8'd73;	
								a<=II(a, b, c, d,in_data_reg[8], S41, 32'h6fa87e4f); 
							end
						73:
							begin
								case_c1<=8'd74;	
								d<=II(d, a, b, c,in_data_reg[15], S42, 32'hfe2ce6e0); 
							end
						74:
							begin
								case_c1<=8'd75;	
								c<= II(c, d, a, b,in_data_reg[6], S43, 32'ha3014314);
							end
						75:
							begin
								case_c1<=8'd76;	
								b<=II(b, c, d, a,in_data_reg[13], S44, 32'h4e0811a1);
							end
						76:
							begin
								case_c1<=8'd77;	
								a<=II(a, b, c, d,in_data_reg[4], S41, 32'hf7537e82); 
							end
						77:
							begin
								case_c1<=8'd78;	
								d<=II(d, a, b, c,in_data_reg[11], S42, 32'hbd3af235);
							end
						78:
							begin
								case_c1<=8'd79;	
								c<= II(c, d, a, b,in_data_reg[2], S43, 32'h2ad7d2bb); 
							end
						79:
							begin
								case_c1<=8'd80;	
								b<=II(b, c, d, a,in_data_reg[9], S44, 32'heb86d391); 
							end
						80:
							begin
								out_a<=a+32'h01234567;
								out_b<=b+32'h89abcdef;
								out_c<=c+32'hfedcba98;
								out_d<=d+32'h76543210;
								ready<=1'b1;
							end
					endcase
				end
		end
		
	function [31:0] F;
		input [31:0] B,C,D;
		begin
			F=(B & C) | ((~B) & D);
		end
	endfunction	
	
	function [31:0] G;
		input [31:0] B,C,D;
		begin
			G=(B & D) | ((~D) & C);
		end
	endfunction
	
	function [31:0] H;
		input [31:0] B,C,D;
		begin
			H=B ^ C ^ D;
		end
	endfunction
	
	function [31:0] I;
		input [31:0] B,C,D;
		begin
			I=C ^ (B | (~D));
		end
	endfunction
	
	function [31:0] FF;
		input [31:0] A,B,C,D,M;
		input [4:0] S;
		input [31:0] T;
		begin
			FF=A+F(B,C,D)+M+T;
			FF=(FF<<S) | (FF >> (32-S));
			FF=FF+B;
		end
	endfunction	
	
	function [31:0] GG;
		input [31:0] A,B,C,D,M;
		input [4:0] S;
		input [31:0] T;
		begin
			GG=A+F(B,C,D)+M+T;
			GG=(GG<<S) | (GG >> (32-S));
			GG=GG+B;
		end
	endfunction	
	
	function [31:0] HH;
		input [31:0] A,B,C,D,M;
		input [4:0] S;
		input [31:0] T;
		begin
			HH=A+F(B,C,D)+M+T;
			HH=(HH<<S) | (HH >> (32-S));
			HH=HH+B;
		end
	endfunction	
	
	function [31:0] II;
		input [31:0] A,B,C,D,M;
		input [4:0] S;
		input [31:0] T;
		begin
			II=A+F(B,C,D)+M+T;
			II=(II<<S) | (II >> (32-S));
			II=II+B;
		end
	endfunction	
	
	
endmodule