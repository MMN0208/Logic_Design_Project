module part6 (SW, LEDR, HEX0, HEX1);
	input [5:0] SW;
	output [5:0] LEDR;
	output [6:0] HEX0, HEX1;
	
	wire [6:0] hex0_out, hex1_out;
	
	assign LEDR = SW;
	assign {HEX0, HEX1} = {hex0_out, hex1_out};
	
	reg [5:0] T0, S0, Z0;
	reg [3:0] S1;
	
	always begin
		T0 = SW;
		if(T0 > 59) begin
			Z0 = 60;
			S1 = 6;
		end else if(T0 > 49) begin
			Z0 = 50;
			S1 = 5;
		end else if(T0 > 39) begin
			Z0 = 40;
			S1 = 4;
		end else if(T0 > 29) begin
			Z0 = 30;
			S1 = 3;
		end else if(T0 > 19) begin
			Z0 = 20;
			S1 = 2;
		end else if(T0 > 9) begin
			Z0 = 10;
			S1 = 1;
		end else begin 
			Z0 = 0;
			S1 = 0;
		end
		S0 = T0 - Z0;	
	end
	
	displayBSD hex0 (S0[3:0], hex0_out);
	displayBSD hex1 (S1, hex1_out);
endmodule