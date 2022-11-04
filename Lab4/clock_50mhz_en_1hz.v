module clock_50mhz_en_1hz (Clk, En);
	input Clk;
	output En;
	
	wire [25:0] counter_50_mil;
	reg Clr;
	
	inc_counter_26bit C0 (Clk, Clr, counter_50_mil);
	
	always @ (negedge Clk) begin
		if (counter_50_mil >= 49999999) begin
			Clr <= 1'b1;
		end
		else begin
			Clr <= 1'b0;
		end
	end
	
	assign En = Clr;
endmodule