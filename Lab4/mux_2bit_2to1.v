module mux_2bit_4to1 (S, U, V, W, X, M);
	input [1:0] S, U, V, W, X;
	output [1:0] M;
	
	assign M[0] = (~S[1] & ~S[0] & U[0]) | (~S[1] & S[0] & V[0]) | (S[1] & ~S[0] & W[0]) | (S[1] & S[0] & X[0]);
	assign M[1] = (~S[1] & ~S[0] & U[1]) | (~S[1] & S[0] & V[1]) | (S[1] & ~S[0] & W[1]) | (S[1] & S[0] & X[1]);
endmodule