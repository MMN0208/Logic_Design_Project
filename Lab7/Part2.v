module part2 (SW, KEY, LEDR);
  input [1:0] SW;
  input [1:0] KEY;
  output [4:0] LEDR;

  wire [3:0] Y;
  wire w, z;

  assign w = SW[1];

  behavioral_fsm F0 (KEY[0], ~SW[0], w, Y, z);

  assign LEDR[3:0] = Y;
  assign LEDR[4] = z;
endmodule