module char_7seg (C, Display);
	input [1:0] C;
	output [6:0] Display;
	
	assign Display[0] = (~C[1] & ~C[0]) | (C[1] & C[0]);
	assign Display[1] = (~C[1] & C[0]) | (C[1] & C[0]);
	assign Display[2] = (~C[1] & C[0]) | (C[1] & ~C[0]) | (C[1] & C[0]);
	assign Display[3] = (C[1] & C[0]);
	assign Display[4] = (C[1] & C[0]);
	assign Display[5] = (~C[1] & ~C[0]) | (C[1] & ~C[0]) | (C[1] & C[0]);
	assign Display[6] = (C[1] & C[0]);
endmodule