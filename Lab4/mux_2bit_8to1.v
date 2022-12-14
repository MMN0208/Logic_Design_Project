module mux_2bit_8to1 (S, Q, T, U, V, W, X, Y, Z, M);
	input [2:0] S;
	input [1:0] Q, T, U, V, W, X, Y, Z;
	output [1:0] M;
	
	wire [1:0] mux0_out, mux1_out;
	
	assign M[0] = (~S[2] & mux0_out[0]) | (S[2] & mux1_out[0]);
	assign M[1] = (~S[2] & mux0_out[1]) | (S[2] & mux1_out[1]);
	
	mux_2bit_4to1 mux0 (S[1:0], Q, T, U, V, mux0_out);
	mux_2bit_4to1 mux1 (S[1:0], W, X, Y, Z, mux1_out);
endmodule