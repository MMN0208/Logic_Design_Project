module part1 (SW, KEY, HEX0, HEX1);
  input [1:0] SW, KEY;
  output [6:0] HEX0, HEX1;

  wire [7:0] Q;

  counter_8bit C0 (SW[1], KEY[0], SW[0], Q);


  displayHEX H0 (Q[3:0], HEX0);
  displayHEX H1 (Q[7:4], HEX1);
endmodule