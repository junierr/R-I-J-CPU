`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:59:40 04/27/2020 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
        input [3:0] ALU_OP,
        input [31:0] A,
        input [31:0] B,
        output reg [31:0] F,
        output ZF,
        output OF);

    parameter OP_AND = 4'b0000,
               OP_OR  = 4'b0001,
               OP_XOR = 4'b0010,
               OP_NOR = 4'b0011,
               OP_ADD = 4'b0100,
               OP_SUB = 4'b0101,
               OP_SLT = 4'b0110,
               OP_SLL = 4'b0111;

    reg C32;
    
    initial begin
        F  <= 32'b0;
        C32 <= 1'b0;
    end
    
    always @(*) begin
        case (ALU_OP)
            OP_AND: F <= A & B;
            OP_OR:  F <= A | B;
            OP_XOR: F <= A ^ B;
            OP_NOR: F <= ~(A ^ B);
            OP_ADD: {C32,F} <= A + B;
            OP_SUB: {C32,F} <= A - B;
            OP_SLT: F <= A < B;
            OP_SLL: F <= B << A;
        endcase
    end

    assign OF = A[31]^B[31]^F[31]^C32;
    assign ZF = ~(F[31] | F[30] | F[29] | F[28] | F[27] | F[26] | F[25] | F[24]
               | F[23] | F[22] | F[21] | F[20] | F[19] | F[18] | F[17] | F[16]
               | F[15] | F[14] | F[13] | F[12] | F[11] | F[10] |  F[9] |  F[8]
               |  F[7] |  F[6] |  F[5] |  F[4] |  F[3] |  F[2] |  F[1] |  F[0]);
endmodule



