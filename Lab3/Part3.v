module part3 (SW, LEDR);
  input [1:0] SW;
  output [1:0] LEDR;
  
  assign LEDR[1] = 0;
  
  wire Q;

  d_ff D0 (SW[1], SW[0], LEDR[0]);
endmodule

module d_ff (Clk, D, Q);
	input Clk, D;
	output Q;
	
	wire Qm;
	
	d_latch master (~Clk, D, Qm);
	d_latch slave (Clk, Qm, Q);
endmodule