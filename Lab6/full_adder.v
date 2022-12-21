module full_adder (A, B, Cin, S, Cout);
	parameter n = 8;
	
	input [n-1:0] A, B;
	input Cin;
	output [n-1:0] S;
	output Cout;
	
	assign {Cout, S} = A + B + Cin;
endmodule