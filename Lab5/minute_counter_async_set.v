module minute_counter_async_set (clock, set_neg, rst_neg, sw, Q);

	input clock, set_neg, rst_neg;
	input [5:0] sw;
	output reg [5:0] Q;
	
	always @ (posedge clock or negedge set_neg or negedge rst_neg) begin
		if (~rst_neg) begin
			Q <= 'd0;
		end
		else if (~set_neg) begin
			if(sw < 'd60) begin
				Q <= sw;
			end
			else begin 
				Q <= 'd0;
			end
		end
		else begin
			Q <= Q + 1'b1;
			if (Q == 'd60) begin
				Q <= 'd0;
			end
		end
	end

endmodule