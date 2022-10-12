module part1 (SW, HEX0, HEX1);
	input [7:0] SW;
	output [6:0] HEX0, HEX1;
	wire [3:0] x0, x1;
	wire [6:0] hex0_out, hex1_out;
	
	assign {x1, x0} = SW;
	assign {HEX0, HEX1} = {hex0_out, hex1_out};
	
	displayBSD d0 (x0, hex0_out);
	displayBSD d1 (x1, hex1_out);
endmodule

module displayBSD (x, Display);
	input [3:0] x;
	output [6:0] Display;
	
	assign Display[0] = (~x[3] & ~x[2] & ~x[1] & x[0]) | (~x[3] & x[2] & ~x[1] & ~x[0]);
	assign Display[1] = (~x[3] & x[2] & ~x[1] & x[0]) | (~x[3] & x[2] & x[1] & ~x[0]);
	assign Display[2] = (~x[3] & ~x[2] & x[1] & ~x[0]);
	assign Display[3] = (~x[3] & ~x[2] & ~x[1] & x[0]) | (~x[3] & x[2] & ~x[1] & ~x[0]) | (~x[3] & x[2] & x[1] & x[0]);
	assign Display[4] = (~x[3] & ~x[2] & ~x[1] & x[0]) | (~x[3] & ~x[2] & x[1] & x[0]) | (~x[3] & x[2] & ~x[1] & ~x[0]) | (~x[3] & x[2] & ~x[1] & x[0]) | (~x[3] & x[2] & x[1] & x[0]) | (x[3] & ~x[2] & ~x[1] & x[0]);
	assign Display[5] = (~x[3] & ~x[2] & ~x[1] & x[0]) | (~x[3] & ~x[2] & x[1] & ~x[0]) | (~x[3] & ~x[2] & x[1] & x[0]) | (~x[3] & x[2] & x[1] & x[0]);
	assign Display[6] = (~x[3] & ~x[2] & ~x[1] & ~x[0]) | (~x[3] & ~x[2] & ~x[1] & x[0]) | (~x[3] & x[2] & x[1] & x[0]);
endmodule