module part2 (SW, KEY, HEX0, HEX2, HEX4, HEX5);
	input [9:0] SW;
	input [1:0] KEY;
	output [6:0] HEX0, HEX2, HEX4, HEX5;
	
	wire [4:0] Address;
	wire [3:0] DataIn, DataOut;
	wire Clock, Write;

	assign Address = SW[8:4];
	assign DataIn = SW[3:0];
	assign Write = SW[9];
	assign Clock = KEY[0];

	ram32x4 R0 (Address, Clock, DataIn, Write, DataOut);

	displayHEX H0 (DataOut, HEX0);
	displayHEX H1 (DataIn, HEX2);
	displayHEX H2 (Address[3:0], HEX4);
	displayHEX H3 ({3'b0, Address[4]}, HEX5);
endmodule