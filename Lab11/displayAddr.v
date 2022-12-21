module displayAddr (Addr, En, Output0, Output1);
	input [4:0] Addr;
	input En;
	output reg [6:0] Output0, Output1;
	
	wire [6:0] hex0_out, hex1_out;
	
	always begin
		if(En) begin
			Output0 = hex0_out;
			Output1 = hex1_out;
		end else begin
			Output0 = 7'b1111111; // turn off display
			Output1 = 7'b1111111; // turn off display
		end
	end
	
	displayHEX H0 (Addr[3:0], hex0_out);
	displayHEX H1 ({3'b0, Addr[4]}, hex1_out);
endmodule