module part2 (CLOCK_50, KEY, LEDR, HEX2, HEX1, HEX0);
  input CLOCK_50;
  input [1:0] KEY;
  output [6:0] HEX0, HEX1, HEX2;
  output [1:0] LEDR;

  wire [25:0] CYCLES;
  wire [3:0] c1_out, c2_out, c3_out;
  wire ones, tens, hundreds;

  counter_modk C0 (CLOCK_50, KEY[0], CYCLES, ones);
  defparam C0.n = 26;
  defparam C0.k = 50000000;

  counter_modk C1 (~ones, KEY[0], c1_out, tens);
  defparam C1.n = 4;
  defparam C1.k = 10;

  counter_modk C2 (~tens, KEY[0], c2_out, hundreds);
  defparam C2.n = 4;
  defparam C2.k = 10;

  counter_modk C3 (~hundreds, KEY[0], c3_out, LEDR[0]);
  defparam C3.n = 4;
  defparam C3.k = 10;

  displayHEX H2 (c3_out, HEX2);
  displayHEX H1 (c2_out, HEX1);
  displayHEX H0 (c1_out, HEX0);

endmodule