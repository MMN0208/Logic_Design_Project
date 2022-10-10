module part3 (SW, LEDR);
	input [9:0] SW;
	output [9:0] LEDR;
	wire s0, s1;
	wire [1:0] U, V, W, X, M;
	
	assign {s1, s0} = SW[9:8];
	assign {X, W, V, U} = SW[7:0];
	assign M[0] = (~s1 & ~s0 & U[0]) | (~s1 & s0 & V[0]) | (s1 & ~s0 & W[0]) | (s1 & s0 & X[0]);
	assign M[1] = (~s1 & ~s0 & U[1]) | (~s1 & s0 & V[1]) | (s1 & ~s0 & W[1]) | (s1 & s0 & X[1]);
	
	assign LEDR[1:0] = M;
	assign LEDR[7:2] = 0;
	assign LEDR[9:8] = {s1, s0};
endmodule