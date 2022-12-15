module counter_modk (clock, rst_neg, Q, roll_over);
  parameter n = 4;
  parameter k = 16;

  input clock, rst_neg;
  output [n-1:0] Q;
  reg [n-1:0] Q;
  output reg roll_over;

  always @(posedge clock or negedge rst_neg)
  begin
    if (~rst_neg)  begin
      Q <= 'd0;
      roll_over <= 'd0;
	 end
    else begin
      Q <= Q + 1'b1;
      if (Q == k - 1) begin
        roll_over <= 'd1;
      end else if (Q == k) begin
        Q <= 'd0;
        roll_over <= 'd0;
      end else if (Q == 'd0) begin
		    roll_over <= 'd0;
		  end
    end
  end
endmodule