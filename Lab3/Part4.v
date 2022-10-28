module part4 (Clk, D, Qa, Qb, Qc);
	input Clk, D;
	output Qa, Qb, Qc;
	
	D_latch D0 (Clk, D, Qa);
	D_ff D1 (Clk, D, Qb);
	D_ff D2 (~Clk, D, Qc);

endmodule	

module D_latch (Clk, D, Q);
	input D, Clk;
	output reg Q;
	
	always @ (D, Clk) begin
		if (Clk) 
			Q = D;
	end
endmodule

module D_ff (Clk, D, Q);
	input Clk, D;
	output Q;
	
	wire Qm;
	
	D_latch master (~Clk, D, Qm);
	D_latch slave (Clk, Qm, Q);
endmodule