module ram_array (address, clock, data, wren, q);
	input [4:0] address;
	input clock;
	input [3:0] data;
	input wren;
	output reg [3:0] q;
	
	reg [3:0] memory_array [31:0];
	
	always @ (posedge clock) begin
		if (wren) begin
			memory_array[address] <= data;
		end
		q <= memory_array[address];
	end
endmodule