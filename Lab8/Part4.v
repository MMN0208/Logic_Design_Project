module part4 (CLOCK_50, SW, KEY, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	input CLOCK_50;
	input [9:0] SW;
	input [1:0] KEY;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
	wire [4:0] WrAddress;
	wire [3:0] DataIn, DataOut;
	wire WrEnable;

	wire [25:0] CYCLES;
	wire second;

	counter_modk C0 (CLOCK_50, 1'b1, CYCLES, second);
	defparam C0.n = 26;
	defparam C0.k = 50000000;

	wire [4:0] RdAddress;
	wire Done, Reset;
	assign Reset = KEY[0];

	counter_modk C1 (~second, Reset, RdAddress, Done);
	defparam C1.n = 5;
	defparam C1.k = 32;

	assign WrAddress = SW[8:4];
	assign DataIn = SW[3:0];
	assign WrEnable = SW[9];

	ram_two_port R0 (~second, DataIn, RdAddress, WrAddress, WrEnable, DataOut);

	displayHEX H0 (DataOut, HEX0);
	displayHEX H1 (DataIn, HEX1);
	displayHEX H2 (RdAddress[3:0], HEX2);
	displayHEX H3 ({3'b0, RdAddress[4]}, HEX3);
	displayHEX H4 (WrAddress[3:0], HEX4);
	displayHEX H5 ({3'b0, WrAddress[4]}, HEX5);
endmodule