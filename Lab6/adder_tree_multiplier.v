module adder_tree_multiplier (A, B, P);
	input [7:0] A, B;
	output [15:0] P;
	
	wire [7:0] p0, p1, p2, p3, p4, p5, p6, p7;
	
	wire [7:0] s01, s02, s03, s04;
	wire c01, c02, c03, c04;
	
	wire [9:0] s11, s12;
	wire c11, c12;
	
	wire [11:0] s21;
	wire c21;
	
	//stage 1: partial product
	assign p0 = A & {8{B[0]}};
	assign p1 = A & {8{B[1]}};
	assign p2 = A & {8{B[2]}};
	assign p3 = A & {8{B[3]}};
	assign p4 = A & {8{B[4]}};
	assign p5 = A & {8{B[5]}};
	assign p6 = A & {8{B[6]}};
	assign p7 = A & {8{B[7]}};
	
	//stage 2: 4 additions
	full_adder F01 ({1'b0, p0[7:1]}, p1[7:0], 0, s01, c01);
	full_adder F02 ({1'b0, p2[7:1]}, p3[7:0], 0, s02, c02);
	full_adder F03 ({1'b0, p4[7:1]}, p5[7:0], 0, s03, c03);
	full_adder F04 ({1'b0, p6[7:1]}, p7[7:0], 0, s04, c04);
	
	//stage 3: 2 additions
	full_adder F11 ({2'b0, c01, s01[7:1]}, {c02, s02, p2[0]}, 0, s11, c11);
	defparam F11.n = 10;
	full_adder F12 ({2'b0, c03, s03[7:1]}, {c04, s04, p6[0]}, 0, s12, c12);
	defparam F12.n = 10;
	
	//stage 4: 1 addition
	full_adder F21 ({4'b0, s11[9:2]}, {s12, s03[0], p4[0]}, 0, s21, c21);
	defparam F21.n = 12;
	
	
	assign P[0] = p0[0];
	assign P[1] = s01[0];
	assign P[2] = s11[0];
	assign P[3] = s11[1];
	assign P[15:4] = s21;
	
endmodule