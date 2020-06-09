`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:24:23 06/01/2020 
// Design Name: 
// Module Name:    CPU 
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
module CPU(input rst,
		input clk,
		input clka,
		output reg [31:0] out_F,
		output reg [31:0] out_M,
      output reg [31:0] out_ZF,
		output reg [31:0] out_PC);
	 
	 wire[31:0] ord;
	 wire[31:0] F;
	 wire Write_Reg, imm_s, rt_imm_s, Mem_Write;
	 wire[4:0] W_Addr;
	 wire[31:0] R_Data_A, R_Data_B, W_Data, ALU_B, imm_data, M_R_Data, PC_new, PC_now;
	 wire[15:0] imm;
	 wire[3:0] ALU_OP;
	 wire ZF, OF;
	 wire[1:0] PC_s, w_r_s, wr_data_s;
	 
	 READ my_read(
		.clk(clk),
		.rst(rst), 
		.PC_s(PC_s), 
		.in_3(ord[25:0]), 
		.in_2(imm_data), 
		.in_1(R_Data_A), 
		.Inst_code(ord), 
		.PC_new(PC_new),
		.PC(PC_now)
	);
	 
	 
	 RegFile my_regfile(.Clk(~clk),
	 .Clr(rst),
	 .Write_Reg(Write_Reg),
	 .R_Addr_A(ord[25:21]),
	 .R_Addr_B(ord[20:16]),
	 .W_Addr(W_Addr),
	 .W_Data(W_Data),
	 .R_Data_A(R_Data_A),
	 .R_Data_B(R_Data_B));
	 
	 
	 ALU my_alu(
		.A(R_Data_A),
		.B(ALU_B),
		.ALU_OP(ALU_OP),
		.ZF(ZF),
		.OF(OF),
		.F(F));
	
	
	DECODER my_decoder(
		.OP(ord[31:26]), 
		.func(ord[5:0]), 
		.ZF(ZF), 
		.w_r_s(w_r_s), 
		.imm_s(imm_s), 
		.rt_imm_s(rt_imm_s), 
		.wr_data_s(wr_data_s),
		.ALU_OP(ALU_OP), 
		.Mem_Write(Mem_Write), 
		.Write_Reg(Write_Reg), 
		.PC_s(PC_s));
	
	RAM_1 my_ram1(
	  .clka(clka), 
	  .wea(Mem_Write), 
	  .addra(F[5:0]), 
	  .dina(R_Data_B), 
	  .douta(M_R_Data));
	
	
	assign imm = ord[15:0];
	assign W_Addr = (w_r_s[1])? 5'b11111:((w_r_s[0])? ord[20:16]:ord[15:11]);
	assign imm_data = (imm_s)? {{16{imm[15]}},imm}:{{16{1'b0}},imm};
	assign ALU_B = (rt_imm_s)? imm_data:R_Data_B;
	assign W_Data = (wr_data_s[1])? PC_new:((wr_data_s[0])? M_R_Data:F);
	
	always@(*)
		begin
			out_F <= F;
			out_M <= M_R_Data;
			out_ZF <= {{30{1'b0}},ZF,OF};
			out_PC <= PC_now;
		end
	 


endmodule

