module part2 (SW, KEY, LEDR);
  input [1:0] SW;
  input [1:0] KEY;
  output [9:0] LEDR;

  wire [8:0] D, Y;
  wire w, z;

  assign w = SW[1];

  behavioral_fsm F0 (KEY[0], SW[0], w, Y, z);

  assign LEDR[8:0] = Y;
  assign LEDR[9] = z;
endmodule