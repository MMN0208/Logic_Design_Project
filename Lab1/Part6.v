module part6 (SW, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
	input [9:0] SW;
	output [9:0] LEDR;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
	
	wire [2:0] ChSel;
	wire [1:0] Ch0, Ch1, Ch2, Ch3, Ch4, Ch5, Ch6, Ch7;
	wire [1:0] mux0_out, mux1_out, mux2_out, mux3_out, mux4_out, mux5_out, mux6_out, mux7_out;
	wire [6:0] hex0_out, hex1_out, hex2_out, hex3_out, hex4_out, hex5_out, hex6_out, hex7_out;
	
	assign LEDR = SW;
	assign ChSel = SW[9:7];
	assign {Ch3, Ch0, Ch1, Ch2} = {1'b1, SW[6:0]};
	assign {Ch4, Ch5, Ch6, Ch7} = 8'b11111111;
	assign {HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7} = {hex0_out, hex1_out, hex2_out, hex3_out, hex4_out, hex5_out, hex6_out, hex7_out};
	
	mux_2bit_8to1 mux0 (ChSel, Ch7, Ch6, Ch5, Ch4, Ch3, Ch0, Ch1, Ch2, mux0_out);
	mux_2bit_8to1 mux1 (ChSel, Ch6, Ch5, Ch4, Ch3, Ch0, Ch1, Ch2, Ch7, mux1_out);
	mux_2bit_8to1 mux2 (ChSel, Ch5, Ch4, Ch3, Ch0, Ch1, Ch2, Ch7, Ch6, mux2_out);
	mux_2bit_8to1 mux3 (ChSel, Ch4, Ch3, Ch0, Ch1, Ch2, Ch7, Ch6, Ch5, mux3_out);
	mux_2bit_8to1 mux4 (ChSel, Ch3, Ch0, Ch1, Ch2, Ch7, Ch6, Ch5, Ch4, mux4_out);
	mux_2bit_8to1 mux5 (ChSel, Ch0, Ch1, Ch2, Ch7, Ch6, Ch5, Ch4, Ch3, mux5_out);
	mux_2bit_8to1 mux6 (ChSel, Ch1, Ch2, Ch7, Ch6, Ch5, Ch4, Ch3, Ch0, mux6_out);
	mux_2bit_8to1 mux7 (ChSel, Ch2, Ch7, Ch6, Ch5, Ch4, Ch3, Ch0, Ch1, mux7_out);
	char_7seg hex0 (mux0_out, hex0_out);
	char_7seg hex1 (mux1_out, hex1_out);
	char_7seg hex2 (mux2_out, hex2_out);
	char_7seg hex3 (mux3_out, hex3_out);
	char_7seg hex4 (mux4_out, hex4_out);
	char_7seg hex5 (mux5_out, hex5_out);
	char_7seg hex6 (mux6_out, hex6_out);
	char_7seg hex7 (mux7_out, hex7_out);
endmodule

module mux_2bit_8to1 (S, Q, T, U, V, W, X, Y, Z, M);
	input [2:0] S;
	input [1:0] Q, T, U, V, W, X, Y, Z;
	output [1:0] M;
	
	wire [1:0] mux0_out, mux1_out;
	
	assign M[0] = (~S[1] & mux0_out[0]) | (S[1] & mux1_out[0]);
	assign M[1] = (~S[1] & mux0_out[1]) | (S[1] & mux1_out[1]);
	
	mux_2bit_4to1 mux0 (S[1:0], Q, T, U, V, mux0_out);
	mux_2bit_4to1 mux1 (S[1:0], W, X, Y, Z, mux1_out);
endmodule