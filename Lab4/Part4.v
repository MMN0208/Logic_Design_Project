module part4 (CLOCK_50, HEX0, HEX1, HEX2, HEX3);
	input CLOCK_50;
	output [6:0] HEX0, HEX1, HEX2, HEX3;
	
	wire [1:0] ChSel, Ch0, Ch1, Ch2, Ch3;
	wire [1:0] mux0_out, mux1_out, mux2_out, mux3_out;
	wire [6:0] hex0_out, hex1_out, hex2_out, hex3_out;

    wire [25:0] CYCLES;
    wire [1:0] SECONDS;
    reg secclk;

    counter_modk C0 (CLOCK_50, 1, CYCLES);
    defparam C0.n = 26;
    defparam C0.k = 50000000;

    always @ (posedge CLOCK_50) begin
        if (CYCLES == 0) begin
            secclk = 0;
        end
        else begin
            secclk = 1;
        end
    end

    counter_modk C1 (secclk, 1, SECONDS);
    defparam C1.n = 2;
    defparam C1.k = 4;
        
	assign {ChSel, Ch3, Ch0, Ch1, Ch2} = {SECONDS, 8'b11000110};
	assign HEX0 = hex0_out;
	assign HEX1 = hex1_out;
	assign HEX2 = hex2_out;
	assign HEX3 = hex3_out;
	
	mux_2bit_4to1 mux0 (ChSel, Ch2, Ch3, Ch0, Ch1, mux0_out);
	mux_2bit_4to1 mux1 (ChSel, Ch1, Ch2, Ch3, Ch0, mux1_out);
	mux_2bit_4to1 mux2 (ChSel, Ch0, Ch1, Ch2, Ch3, mux2_out);
	mux_2bit_4to1 mux3 (ChSel, Ch3, Ch0, Ch1, Ch2, mux3_out);
	char_7seg hex0 (mux0_out, hex0_out);
	char_7seg hex1 (mux1_out, hex1_out);
	char_7seg hex2 (mux2_out, hex2_out);
	char_7seg hex3 (mux3_out, hex3_out);
endmodule