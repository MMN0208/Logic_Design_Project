module displayHEX (Input, Output);
	input [3:0] Input;
	output reg [6:0] Output;
	
	always begin
		case(Input)
			4'b0000: Output = 7'b1000000;
			4'b0001: Output = 7'b1111001;
			4'b0010: Output = 7'b0100100;
			4'b0011: Output = 7'b0110000;
			4'b0100: Output = 7'b0011001;
			4'b0101: Output = 7'b0010010;
			4'b0110: Output = 7'b0000010;
			4'b0111: Output = 7'b1111000;
			4'b1000: Output = 7'b0000000;
			4'b1001: Output = 7'b0011000;
			4'b1010: Output = 7'b0001000;
			4'b1011: Output = 7'b0000011;
			4'b1100: Output = 7'b1000110;
			4'b1101: Output = 7'b0100001;
			4'b1110: Output = 7'b0000110;
			4'b1111: Output = 7'b0001110;
		endcase
	end
endmodule