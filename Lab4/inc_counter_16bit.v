module inc_counter_16bit (En, Clk, Clr, Q);
  input En, Clk, Clr;
  output reg [15:0] Q;
  
  always @ (posedge Clk)
    if (Clr)
      Q <= 0;
    else if (En)
      Q <= Q + 1'b1;
endmodule