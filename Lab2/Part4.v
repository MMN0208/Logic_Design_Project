module part4 (SW, LEDR, HEX0, HEX1); 
	input [8:0] SW;
	output [9:0] LEDR;
	output [6:0] HEX0, HEX1;

	wire [3:0] X, Y, adder_out, s_converter_out;
	wire c_in, c_out;
	wire error;
	wire compX_out, compY_out, comp_out;
	wire [3:0] comp_out_4bit, mux_out;
	wire [6:0] hex0_out, hex1_out;
	
	assign {c_in, X, Y} = SW[8:0];
	assign error = compX_out | compY_out;
	assign comp_out_4bit = {{3{1'b0}}, comp_out};
	
	assign LEDR[4:0] = {c_out, adder_out};
	assign LEDR[8:5] = 0;
	assign LEDR[9] = error;
	assign {HEX0, HEX1} = {hex0_out, hex1_out};

	comparator compX (X, compX_out);
	comparator compY (Y, compY_out);
	part3 adder_4bit ({c_in, X, Y}, {c_out, adder_out});
	comparator_5bit comp ({c_out, adder_out}, comp_out);
	sum_converter s_converter (adder_out, s_converter_out);
	mux_4bit_2to1 mux (comp_out, adder_out, s_converter_out, mux_out);
	displayBSD hex0 (mux_out, hex0_out);
	displayBSD hex1 (comp_out_4bit, hex1_out);
endmodule

module comparator_5bit (x, z);
	input [4:0] x;
	output z;
	
	assign z = x[4] | (x[3] & x[2]) | (x[3] & x[1]);
endmodule

module sum_converter (sum, new_sum);
	input [3:0] sum;
	output [3:0] new_sum;
	
	assign new_sum[0] = sum[0];
	assign new_sum[1] = ~sum[1];
	assign new_sum[2] = (~sum[3] & ~sum[1]) | (sum[2] & sum[1]);
	assign new_sum[3] = ~sum[3] & sum[1];
endmodule
 