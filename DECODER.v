`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:40:47 06/01/2020 
// Design Name: 
// Module Name:    DECODER 
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
module DECODER(input OP, 
				input func,
				input ZF, 
				output w_r_s,
				output imm_s,
				output rt_imm_s,
				output wr_data_s,
				output ALU_OP,
				output Write_Reg,
				output Mem_Write,
				output PC_s);
	 
	 wire[5:0] OP, func;
	 wire ZF;
	 reg imm_s, rt_imm_s, Mem_Write, Write_Reg;
	 reg[1:0] w_r_s, wr_data_s, PC_s;
	 reg[3:0] ALU_OP;
	 
	 always @(*)
	 begin
	 case (OP)
		6'b000000: //R–Õ÷∏¡Ó
			begin
				w_r_s <= 2'b0;
				imm_s <= 1'b0;
				rt_imm_s <= 1'b0;
				wr_data_s <= 2'b00;
				Write_Reg <= 1'b1;
				Mem_Write <= 1'b0;
				PC_s <= 2'b00;
				case (func)
					6'b100000:ALU_OP <= 4'b0100;
					6'b100010:ALU_OP <= 4'b0101;
					6'b100100:ALU_OP <= 4'b0000;
					6'b100101:ALU_OP <= 4'b0001;
					6'b100110:ALU_OP <= 4'b0010;
					6'b100111:ALU_OP <= 4'b0011;
					6'b101011:ALU_OP <= 4'b0110;
					6'b000100:ALU_OP <= 4'b0111;
					6'b001000:
					begin
						w_r_s <= 2'b00;
						imm_s <= 1'b0;
						rt_imm_s <= 1'b0;
						wr_data_s <= 2'b00;
						ALU_OP <= 4'b0100;
						Write_Reg <= 1'b0;
						Mem_Write <= 1'b0;
						PC_s <= 2'b01;
					end
				endcase	
			end
		6'b001000:  //addi
		begin
			w_r_s <= 2'b01;
			imm_s <= 1'b1;
			rt_imm_s <= 1'b1;
			wr_data_s <= 2'b00;
			ALU_OP <= 4'b0100;
			Write_Reg <= 1'b1;
			Mem_Write <= 1'b0;
			PC_s <= 2'b0;
		end
		6'b001100:  //andi
		begin
			w_r_s <= 2'b01;
			imm_s <= 1'b0;
			rt_imm_s <= 1'b1;
			wr_data_s <= 2'b00;
			ALU_OP <= 4'b0000;
			Write_Reg <= 1'b1;
			Mem_Write <= 1'b0;
			PC_s <= 2'b0;
		end
		6'b001110:  //xori
		begin
			w_r_s <= 2'b01;
			imm_s <= 1'b0;
			rt_imm_s <= 1'b1;
			wr_data_s <= 2'b00;
			ALU_OP <= 4'b0010;
			Write_Reg <= 1'b1;
			Mem_Write <= 1'b0;
			PC_s <= 2'b0;
		end
		6'b001011:  //sltiu
		begin
			w_r_s <= 2'b01;
			imm_s <= 1'b0;
			rt_imm_s <= 1'b1;
			wr_data_s <= 2'b00;
			ALU_OP <= 4'b0110;
			Write_Reg <= 1'b1;
			Mem_Write <= 1'b0;
			PC_s <= 2'b0;
		end
		6'b100011:  //lw
		begin
			w_r_s <= 2'b01;
			imm_s <= 1'b1;
			rt_imm_s <= 1'b1;
			wr_data_s <= 2'b01;
			ALU_OP <= 4'b0100;
			Write_Reg <= 1'b1;
			Mem_Write <= 1'b0;
			PC_s <= 2'b0;
		end
		6'b101011:  //sw
		begin
			w_r_s <= 2'b00;
			imm_s <= 1'b1;
			rt_imm_s <= 1'b1;
			wr_data_s <= 2'b00;
			ALU_OP <= 4'b0100;
			Write_Reg <= 1'b0;
			Mem_Write <= 1'b1;
			PC_s <= 2'b0;
		end
		6'b000100:  //beq
		begin
			w_r_s <= 2'b00;
			imm_s <= 1'b0;
			rt_imm_s <= 1'b0;
			wr_data_s <= 2'b00;
			ALU_OP <= 4'b0101;
			Write_Reg <= 1'b0;
			Mem_Write <= 1'b0;
			if(!ZF) PC_s <= 2'b10;
			else PC_s <= 2'b00;
		end
		6'b000101:  //bne
		begin
			w_r_s <= 2'b00;
			imm_s <= 1'b0;
			rt_imm_s <= 1'b0;
			wr_data_s <= 2'b00;
			ALU_OP <= 4'b0101;
			Write_Reg <= 1'b0;
			Mem_Write <= 1'b0;
			if(!ZF) PC_s <= 2'b10;
			else PC_s <= 2'b00;
		end
		6'b000010:  //j
		begin
			w_r_s <= 2'b00;
			imm_s <= 1'b0;
			rt_imm_s <= 1'b0;
			wr_data_s <= 2'b00;
			ALU_OP <= 4'b0000;
			Write_Reg <= 1'b0;
			Mem_Write <= 1'b0;
			PC_s <= 2'b11;
		end
		6'b000011:  //jal
		begin
			w_r_s <= 2;
			imm_s <= 1'b0;
			rt_imm_s <= 1'b0;
			wr_data_s <= 2;
			ALU_OP <= 4'b0000;
			Write_Reg <= 1'b1;
			Mem_Write <= 1'b0;
			PC_s <= 2'b11;
		end
	endcase
	end


endmodule

