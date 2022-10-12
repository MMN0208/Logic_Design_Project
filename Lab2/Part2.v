module part2 (SW, HEX0, HEX1);
	input [3:0] SW;
	output [6:0] HEX0, HEX1;
	wire [3:0] x, A_out, mux_out, comp_out_4bit;
	wire [6:0] hex0_out, hex1_out;
	wire comp_out;
	
	assign x = SW;
	assign {HEX0, HEX1} = {hex0_out, hex1_out};
	assign comp_out_4bit = {{3{1'b0}}, comp_out};
	
	comparator c0 (x, comp_out);
	circuitA cA0 (x, A_out);
	mux_4bit_2to1 mux0 (comp_out, x, A_out, mux_out);
	displayBSD d0 (mux_out, hex0_out);
	displayBSD d1 (comp_out_4bit, hex1_out);
endmodule

module comparator (x, Greater);
	input [3:0] x;
	output Greater;
	
	assign Greater = x[3] & (x[2] | x[1]);
endmodule

module circuitA (x, A);
	input [3:0] x;
	output [3:0] A;
	
	assign A[3] = ~x[3];
	assign A[2] = x[2] & x[1];
	assign A[1] = ~x[1];
	assign A[0] = x[0];
endmodule

module mux_4bit_2to1 (s, X, Y, M);
	input s;
	input [3:0] X, Y;
	output [3:0] M;
	
	assign M = ({4{~s}} & X) | ({4{s}} & Y);
endmodule