module inc_counter_26bit (En, Clk, Clr, Q);
	input En, Clk, Clr;
	output reg [25:0] Q;
	
	always @ (posedge Clk) begin 
		if (Clr) begin
			Q <= 0;
		end
		else if (En) begin 
			Q <= Q + 1'b1;
		end
	end
endmodule