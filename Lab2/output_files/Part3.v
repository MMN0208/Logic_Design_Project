module part3 (SW, LEDR);
	input [8:0] SW;
	output [4:0] LEDR;
	wire [3:0] A, B, C_in, Sum, C_out;
	
	assign {C_in[0], A, B} = SW;
	assign LEDR = {C_out[3], Sum};
	
	full_adder fa0 (A[0], B[0], C_in[0], Sum[0], C_out[0]);
	full_adder fa1 (A[1], B[1], C_out[0], Sum[1], C_out[1]);
	full_adder fa2 (A[2], B[2], C_out[1], Sum[2], C_out[2]);
	full_adder fa3 (A[3], B[3], C_out[2], Sum[3], C_out[3]);
endmodule

module full_adder (a, b, c_in, s, c_out);
	input a, b, c_in;
	output s, c_out;
	wire xor0_out, xor1_out, and0_out, and1_out, or0_out;
	
	assign xor0_out = a ^ b;
	assign xor1_out = xor0_out ^ c_in;
	assign and0_out = xor0_out & c_in;
	assign and1_out = a & b;
	assign or0_out = and0_out | and1_out;
	
	assign s = xor1_out;
	assign c_out = or0_out;
endmodule