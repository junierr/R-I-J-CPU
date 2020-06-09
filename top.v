`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:21:58 06/01/2020 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top(input rst,
			input clk,
			input clka,
			input change1,
			input change2,
			input change3,
			input change4,
			output reg [31:0] LED);

	 wire[31:0] ALU_F, RAM_DATA, ZF_OF, PC;
	 
	 CPU my_cpu(
		.rst(rst), 
		.clk(clk), 
		.clka(clka), 
		.out_F(ALU_F), 
		.out_M(RAM_DATA), 
		.out_ZF(ZF_OF), 
		.out_PC(PC)
	);
	
	always@(*)
		begin
			if(change1) LED <= ALU_F;
			else if(change2) LED <= RAM_DATA;
			else if(change3) LED <= ZF_OF;
			else if(change4) LED <= PC;
			else LED <= 0;
		end
	 
endmodule
