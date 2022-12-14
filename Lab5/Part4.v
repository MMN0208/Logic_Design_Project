module part4 (CLOCK_50, KEY, SW, LEDR);
  input CLOCK_50;
  input [1:0] KEY;
  input [2:0] SW;
  output reg [1:0] LEDR;

  wire [24:0] HALFSEC;
  wire HALFPULSE;
  wire [3:0] INDEX;

  wire half, done;
  reg [13:0] SIGNAL;

  // generate half second clock
  counter_modk C0 (CLOCK_50, KEY[0], HALFSEC, half);
  defparam C0.n = 25;
  defparam C0.k = 25000000;

  counter_modk C1 (~half, KEY[0], INDEX, done);
  defparam C1.n = 4;
  defparam C1.k = 14;
  
  always begin
	LEDR[1] = done;
  end


// A    o-      -_---         101110000000
// B    -ooo    ---_-_-_-     111010101000
// C    -o-o    ---_-_---_-   111010111010
// D    -oo     ---_-_-       111010100000
// E    o       -             100000000000
// F    oo-o    -_-_---_-     101011101000
// G    --o     ---_---_-     111011101000
// H    oooo    -_-_-_-       101010100000


  always @ (negedge KEY[1]) begin
    case (SW[2:0])
      0: SIGNAL = 14'b00101110000000; // A
      1: SIGNAL = 14'b00111010101000; // B
      2: SIGNAL = 14'b00111010111010; // C
      3: SIGNAL = 14'b00111010100000; // D
      4: SIGNAL = 14'b00100000000000; // E
      5: SIGNAL = 14'b00101011101000; // F
      6: SIGNAL = 14'b00111011101000; // G
      7: SIGNAL = 14'b00101010100000; // H
    endcase
  end

  always begin
    case (INDEX)
      0:LEDR[0] = SIGNAL[13];
      1:LEDR[0] = SIGNAL[12];
      2:LEDR[0] = SIGNAL[11];
      3:LEDR[0] = SIGNAL[10];
      4:LEDR[0] = SIGNAL[9];
      5:LEDR[0] = SIGNAL[8];
      6:LEDR[0] = SIGNAL[7];
      7:LEDR[0] = SIGNAL[6];
      8:LEDR[0] = SIGNAL[5];
      9:LEDR[0] = SIGNAL[4];
      10:LEDR[0] = SIGNAL[3];
      11:LEDR[0] = SIGNAL[2];
      12:LEDR[0] = SIGNAL[1];
      13:LEDR[0] = SIGNAL[0];
		default: LEDR[0] = 'd0;
    endcase
  end

endmodule