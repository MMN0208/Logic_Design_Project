module part5 (SW, LEDR, HEX0, HEX1, HEX3, HEX5);
	input [8:0] SW;
	output [8:0] LEDR;
	output [6:0] HEX0, HEX1, HEX3, HEX5;
	
	wire [3:0] A, B;
	wire c0;
	wire [6:0] hex0_out, hex1_out, hex3_out, hex5_out;
	
	assign {c0, A, B} = SW[8:0];
	assign LEDR = SW;
	assign {HEX0, HEX1} = {hex0_out, hex1_out};
	assign {HEX3, HEX5} = {hex3_out, hex5_out};
	
	reg [4:0] T0, S0;
	reg [3:0] Z0, S1;
	reg c1;
	
	always begin
		T0 = A + B + c0;
		if(T0 > 9) begin
			Z0 = 10;
			c1 = 1;
		end else begin
			Z0 = 0;
			c1 = 0;
		end
		S0 = T0 - Z0;
		S1 = c1;
	end
	
	displayBSD hex0 (S0[3:0], hex0_out);
	displayBSD hex1 (S1, hex1_out);
	displayBSD input0 (A, hex3_out);
	displayBSD input1 (B, hex5_out);
endmodule
	
	