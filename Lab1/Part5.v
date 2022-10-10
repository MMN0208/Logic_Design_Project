module part5 (SW, LEDR, HEX0, HEX1, HEX2, HEX3);
	input [9:0] SW;
	output [9:0] LEDR;
	output [6:0] HEX0, HEX1, HEX2, HEX3;
	
	wire [1:0] ChSel, Ch0, Ch1, Ch2, Ch3;
	wire [1:0] mux0_out, mux1_out, mux2_out, mux3_out;
	wire [6:0] hex0_out, hex1_out, hex2_out, hex3_out;
	
	assign LEDR = SW;
	assign {ChSel, Ch0, Ch1, Ch2, Ch3} = SW;
	assign HEX0 = hex0_out;
	assign HEX1 = hex1_out;
	assign HEX2 = hex2_out;
	assign HEX3 = hex3_out;
	
	mux_2bit_4to1 mux0 (ChSel, Ch0, Ch1, Ch2, Ch3, mux0_out);
	mux_2bit_4to1 mux1 (ChSel, Ch1, Ch2, Ch3, Ch0, mux1_out);
	mux_2bit_4to1 mux2 (ChSel, Ch2, Ch3, Ch0, Ch1, mux2_out);
	mux_2bit_4to1 mux3 (ChSel, Ch3, Ch0, Ch1, Ch2, mux3_out);
	char_7seg hex0 (mux0_out, hex0_out);
	char_7seg hex1 (mux1_out, hex1_out);
	char_7seg hex2 (mux2_out, hex2_out);
	char_7seg hex3 (mux3_out, hex3_out);
endmodule

module mux_2bit_4to1 (S, U, V, W, X, M);
	input [1:0] S, U, V, W, X;
	output [1:0] M;
	
	assign M[0] = (~S[1] & ~S[0] & U[0]) | (~S[1] & S[0] & V[0]) | (S[1] & ~S[0] & W[0]) | (S[1] & S[0] & X[0]);
	assign M[1] = (~S[1] & ~S[0] & U[1]) | (~S[1] & S[0] & V[1]) | (S[1] & ~S[0] & W[1]) | (S[1] & S[0] & X[1]);
endmodule

module char_7seg (C, Display);
	input [1:0] C;
	output [6:0] Display;
	
	assign Display[0] = (~C[1] & ~C[0]) | (C[1] & C[0]);
	assign Display[1] = (~C[1] & C[0]) | (C[1] & C[0]);
	assign Display[2] = (~C[1] & C[0]) | (C[1] & ~C[0]) | (C[1] & C[0]);
	assign Display[3] = (C[1] & C[0]);
	assign Display[4] = (C[1] & C[0]);
	assign Display[5] = (~C[1] & ~C[0]) | (C[1] & ~C[0]) | (C[1] & C[0]);
	assign Display[6] = (C[1] & C[0]);
endmodule