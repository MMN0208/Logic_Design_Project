module inc_counter_16bit (En, Clk, Clr, Q);
  input En, Clk, Clr;
  output reg [15:0] Q;
  
  always @ (posedge Clk)
    if (Clr) begin
      Q <= 0;
	 end
    else if (En) begin
      Q <= Q + 1'b1;
	 end
endmodule