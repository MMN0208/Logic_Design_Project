module part1 (KEY, LEDR);
  input [1:0] KEY;
  output [5:0] LEDR;

  counter_modk C1 (KEY[1], KEY[0], LEDR[4:0], LEDR[5]);
  defparam C1.n = 5;
  defparam C1.k = 20;

endmodule