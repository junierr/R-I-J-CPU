`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:39:59 06/02/2020
// Design Name:   top
// Module Name:   C:/ise/exp10/testTOP.v
// Project Name:  exp10
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testTOP;

	// Inputs
	reg rst;
	reg clk;
	reg clka;
	reg change1;
	reg change2;
	reg change3;
	reg change4;

	// Outputs
	wire [31:0] LED;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.rst(rst), 
		.clk(clk), 
		.clka(clka), 
		.change1(change1), 
		.change2(change2), 
		.change3(change3), 
		.change4(change4), 
		.LED(LED)
	);
	always #20 clk=~clk;
	always #20 clka=~clka;
	initial begin
		// Initialize Inputs
		rst = 0;
		clk = 0;
		clka = 0;
		change1 = 1;
		change2 = 0;
		change3 = 0;
		change4 = 0;

		// Wait 100 ns for global reset to finish
		#50;
      rst = 1;
		#50
		rst = 0;
		// Add stimulus here

	end
      
endmodule

