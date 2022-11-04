module part2 (SW, KEY, HEX0, HEX1, HEX2, HEX3);
	input [1:0] SW, KEY;
	output [6:0] HEX0, HEX1, HEX2, HEX3;
	
	wire [15:0] Q;
	
	inc_counter_16bit C0 (SW[1], KEY[0], SW[0], Q);
	
	displayHEX H0 (Q[3:0], HEX0);
	displayHEX H1 (Q[7:4], HEX1);
	displayHEX H2 (Q[11:8], HEX2);
	displayHEX H3 (Q[15:12], HEX3);
endmodule