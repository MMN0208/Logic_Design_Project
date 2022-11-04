module part3 (CLOCK_50, HEX0);
	input CLOCK_50;
	output [6:0] HEX0;
	
	wire [3:0] Q;
	wire En_1Hz;
	reg BSD_Clr;
	
	clock_50mhz_en_1hz C0 (CLOCK_50, En_1Hz);
	
	inc_counter_16bit I0 (En_1Hz, CLOCK_50, BSD_Clr, Q);
	
	always @ (negedge CLOCK_50) begin
		if (Q >= 9) begin
			BSD_Clr <= 1'b1;
		end
		else begin
			BSD_Clr <= 1'b0;
		end
	end
	
	displayHEX H0 (Q, HEX0);
endmodule