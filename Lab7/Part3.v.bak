module part3 (SW, KEY, LEDR, LEDG);
  input [1:0] SW;
  input [1:0] KEY;
  output [9:0] LEDR;

  wire w;
  assign w = SW[1];

  wire Clock;
  assign Clock = KEY[0];
  reg z;

  wire s0Clock, s1Clock, s0In, s1In, s0Clr, s1Clr;
  wire [3:0] s0Q, s1Q;

  assign s0Clock = (~s0Q[3] | ~w) & ~Clock;
  assign s1Clock = (~s1Q[3] | w) & ~Clock;

  assign s0Clr = w;
  assign s1Clr = ~w;

  assign s0In = ~(s0Q[3] | s0Q[2] | s0Q[1] | s0Q[0]) & w;
  assign s1In = ~(s1Q[3] | s1Q[2] | s1Q[1] | s1Q[0]) & ~w;

  shift_register S0 (s0Clock, s0Clr, s0In, s0Q);
  shift_register S1 (s1Clock, s1Clr, s1In, s1Q);

  always 
  begin: zset
    if (s0Q[3] == 1 | s1Q[3] == 1)
      z = 1;
    else
      z = 0;
  end

  assign LEDR[3:0] = s0Q;
  assign LEDR[7:4] = s1Q;

  assign LEDR[9] = z;
endmodule
