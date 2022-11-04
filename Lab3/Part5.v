module part5 (SW, KEY, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	input [7:0] SW;
	input [1:0] KEY;
	output [1:0] LEDR;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

	reg [7:0] A;
	wire [7:0] Q, sum;
	wire co;
	
	D_FF_Async_Reset D0 (~KEY[1], SW[0], ~KEY[0], Q[0]) ;
	D_FF_Async_Reset D1 (~KEY[1], SW[1], ~KEY[0], Q[1]);
	D_FF_Async_Reset D2 (~KEY[1], SW[2], ~KEY[0], Q[2]);
	D_FF_Async_Reset D3 (~KEY[1], SW[3], ~KEY[0], Q[3]);
	D_FF_Async_Reset D4 (~KEY[1], SW[4], ~KEY[0], Q[4]);
	D_FF_Async_Reset D5 (~KEY[1], SW[5], ~KEY[0], Q[5]);
	D_FF_Async_Reset D6 (~KEY[1], SW[6], ~KEY[0], Q[6]);
	D_FF_Async_Reset D7 (~KEY[1], SW[7], ~KEY[0], Q[7]);
	
	always A = Q;
	
	fulladder_8bit FA0 (A, SW, 1'b0, sum, co);
	
	assign LEDR = {1'b0, co};
	
	displayHEX H0 (SW[3:0], HEX0);
	displayHEX H1 (SW[7:4], HEX1);
	displayHEX H2 (A[3:0], HEX2);
	displayHEX H3 (A[7:4], HEX3);
	displayHEX H4 (sum[3:0], HEX4);
	displayHEX H5 (sum[7:4], HEX5);
endmodule

module D_Latch_Async_Reset (Clk, D, R, Q);
	input Clk, D, R;
	output reg Q;
	
	always @ (D, Clk, R) begin
		if (R)
			Q = 1'b0;
		else if (Clk)
			Q = D;
	end
endmodule

module D_FF_Async_Reset (Clk, D, R, Q);
	input Clk, D, R;
	output Q;
	
	wire Qm;
	
	D_Latch_Async_Reset master (~Clk, D, R, Qm);
	D_Latch_Async_Reset slave (Clk, Qm, R , Q);
endmodule

module displayHEX (Input, Output);
	input [3:0] Input;
	output reg [6:0] Output;
	
	always begin
		case(Input)
			4'b0000: Output = 7'b1000000;
			4'b0001: Output = 7'b1111001;
			4'b0010: Output = 7'b0100100;
			4'b0011: Output = 7'b0110000;
			4'b0100: Output = 7'b0011001;
			4'b0101: Output = 7'b0010010;
			4'b0110: Output = 7'b0000010;
			4'b0111: Output = 7'b1111000;
			4'b1000: Output = 7'b0000000;
			4'b1001: Output = 7'b0011000;
			4'b1010: Output = 7'b0001000;
			4'b1011: Output = 7'b0000011;
			4'b1100: Output = 7'b1000110;
			4'b1101: Output = 7'b0100001;
			4'b1110: Output = 7'b0000110;
			4'b1111: Output = 7'b0001110;
		endcase
	end
endmodule

module fulladder_8bit (a, b, ci, s, co);
	input [7:0] a, b;
	input ci;
	output [7:0] s;
	output co;
	
	wire c1;
	
	fulladder_4bit FA0 (a[3:0], b[3:0], ci, s[3:0], c1);
	fulladder_4bit FA1 (a[7:4], b[7:4], c1, s[7:4], co);
endmodule

module fulladder_4bit (a, b, ci, s, co);
	input [3:0] a, b;
	input ci;
	output [3:0] s;
	output co;
	
	wire c1, c2, c3;
	
	fulladder_1bit FA0 (a[0], b[0], ci, s[0], c1);
	fulladder_1bit FA1 (a[1], b[1], c1, s[1], c2);
	fulladder_1bit FA2 (a[2], b[2], c2, s[2], c3);
	fulladder_1bit FA3 (a[3], b[3], c3, s[3], co);
endmodule
	
module fulladder_1bit (a, b, ci, s, co);
  input a, b, ci;
  output co, s;

  wire d;

  assign d = a ^ b;
  assign s = d ^ ci;
  assign co = (b & ~d) | (d & ci);
endmodule