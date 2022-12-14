module twodigit_displayHEX (X, H0, H1);
  input [6:0] X;
  output [6:0] H0, H1;

  reg [3:0] ONES, TENS;

  always begin
    ONES = X % 10;
    TENS = (X - ONES) / 10;
  end

  displayHEX B1 (TENS, H1);
  displayHEX B0 (ONES, H0);
endmodule