`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:36:53 06/01/2020 
// Design Name: 
// Module Name:    READ 
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
module READ(clk, rst, in_3, in_2, in_1, PC_s, Inst_code, PC_new, PC);
	 input clk, rst;
	 input PC_s, in_3, in_2, in_1;
	 output PC_new, PC;
	 output[31:0] Inst_code;
	 
	 reg[31:0] PC;
	 wire[31:0] PC_new, in_2, in_1;
	 wire[25:0] in_3;
	 wire[1:0] PC_s;
	 
	ROM_2 my_rom2(
	  .clka(clk), // input clka
	  .addra(PC[7:2]), // input [5 : 0] addra
	  .douta(Inst_code) // output [31 : 0] douta
	);
	
	initial
		PC <= 32'b0;
	
	assign PC_new = PC+4;
	 
	 always@(posedge rst, negedge clk)
		begin
			if(rst) PC <= 0;
			else
				begin
					case(PC_s)
						2'b00:PC <= PC_new;
						2'b01:PC <= in_1;
						2'b10:PC <= PC_new+(in_2<<2);
						2'b11:PC <= {PC_new[31:28], in_3, 1'b0, 1'b0};
					endcase
				end
		end
	
endmodule
