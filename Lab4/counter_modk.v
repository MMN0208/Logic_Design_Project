module counter_modk(clock, rst_neg, Q);
  parameter n = 4;
  parameter k = 16;

  input clock, rst_neg;
  output [n-1:0] Q;
  reg [n-1:0] Q;

  always @(posedge clock or negedge rst_neg)
  begin
    if (~rst_neg)
      Q <= 'd0;
    else begin
      Q <= Q + 1'b1;
      if (Q == k) begin
        Q <= 'd0;
      end
    end
  end
endmodule

