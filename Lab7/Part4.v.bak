module part4 (CLOCK_50, KEY, SW, LEDR);
  input CLOCK_50;
  input [1:0] KEY;
  input [2:0] SW;
  output [1:0] LEDR;

  wire [24:0] HALFSEC;

  wire half;

  // generate half second clock
  counter_modk C0 (CLOCK_50, KEY[0], HALFSEC, half);
  defparam C0.n = 25;
  defparam C0.k = 25000000;
  
  complete_morse_decoder C0 (~half, KEY[1], KEY[0], SW, LEDR[0]);
endmodule