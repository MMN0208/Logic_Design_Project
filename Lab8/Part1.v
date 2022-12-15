module part1 (Address, Clock, DataIn, Write, DataOut);
	input [4:0] Address;
	input Clock;
	input [3:0] DataIn;
	input Write;
	output [3:0] DataOut;
	
	ram32x4 R0 (Address, Clock, DataIn, Write, DataOut);
endmodule