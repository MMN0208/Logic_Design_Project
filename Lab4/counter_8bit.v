module counter_8bit (En, Clk, Clr, Q);
  input En, Clk, Clr;
  output [7:0] Q;

  wire [7:0] T, Qs;

  t_ff T0 (En, Clk, Clr, Qs[0]);
  assign T[0] = En & Qs[0];

  t_ff T1 (T[0], Clk, Clr, Qs[1]);
  assign T[1] = T[0] & Qs[1];

  t_ff T2 (T[1], Clk, Clr, Qs[2]);
  assign T[2] = T[1] & Qs[2];

  t_ff T3 (T[2], Clk, Clr, Qs[3]);
  assign T[3] = T[2] & Qs[3];
  
  t_ff T4 (T[3], Clk, Clr, Qs[4]);
  assign T[4] = T[3] & Qs[4];

  t_ff T5 (T[4], Clk, Clr, Qs[5]);
  assign T[5] = T[4] & Qs[5];

  t_ff T6 (T[5], Clk, Clr, Qs[6]);
  assign T[6] = T[5] & Qs[6];

  t_ff T7 (T[6], Clk, Clr, Qs[7]);
  assign T[7] = T[6] & Qs[7];

  assign Q = Qs;
endmodule