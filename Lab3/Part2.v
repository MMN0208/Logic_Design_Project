module part2 (SW, LEDR);
  input [1:0] SW;
  output [1:0] LEDR;
  
  assign LEDR[1] = 0;
  
  wire Q;

  d_latch D0 (SW[1], SW[0], LEDR[0]);
endmodule

module d_latch (Clk, D, Q);
  input Clk, D;
  output Q;

  wire S, R;

  assign S = D;
  assign R = ~D;

  wire R_g, S_g, Qa, Qb /* synthesis keep */ ;

  assign R_g = ~(R & Clk);
  assign S_g = ~(S & Clk);
  assign Qa = ~(R_g & Qb);
  assign Qb = ~(S_g & Qa);

  assign Q = Qa;
endmodule