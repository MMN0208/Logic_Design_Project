module select_character (en, sel, signal);
    input en;
    input [2:0] sel;
    output reg [13:0] signal;

    always @ (negedge en) begin
    case (sel)
      0: signal = 14'b00101110000000; // A
      1: signal = 14'b00111010101000; // B
      2: signal = 14'b00111010111010; // C
      3: signal = 14'b00111010100000; // D
      4: signal = 14'b00100000000000; // E
      5: signal = 14'b00101011101000; // F
      6: signal = 14'b00111011101000; // G
      7: signal = 14'b00101010100000; // H
    endcase
  end
endmodule