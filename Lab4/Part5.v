module part5 (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
	input CLOCK_50;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
	
	wire [2:0] ChSel;
	wire [1:0] Ch0, Ch1, Ch2, Ch3, Ch4, Ch5, Ch6, Ch7;
	wire [1:0] mux0_out, mux1_out, mux2_out, mux3_out, mux4_out, mux5_out, mux6_out, mux7_out;
	wire [6:0] hex0_out, hex1_out, hex2_out, hex3_out, hex4_out, hex5_out, hex6_out, hex7_out;

    wire [25:0] CYCLES;
    wire [2:0] SECONDS;
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
    defparam C1.n = 3;
    defparam C1.k = 8;
        
	assign ChSel = SECONDS;
    assign {Ch3, Ch0, Ch1, Ch2} = 8'b11000110;
	assign {Ch4, Ch5, Ch6, Ch7} = 8'b11111111;
	assign {HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7} = {hex0_out, hex1_out, hex2_out, hex3_out, hex4_out, hex5_out, hex6_out, hex7_out};

	
	mux_2bit_8to1 mux0 (ChSel, Ch2, Ch3, Ch4, Ch5, Ch6, Ch7, Ch0, Ch1, mux0_out);
	mux_2bit_8to1 mux1 (ChSel, Ch1, Ch2, Ch3, Ch4, Ch5, Ch6, Ch7, Ch0, mux1_out);
	mux_2bit_8to1 mux2 (ChSel, Ch0, Ch1, Ch2, Ch3, Ch4, Ch5, Ch6, Ch7, mux2_out);
	mux_2bit_8to1 mux3 (ChSel, Ch7, Ch0, Ch1, Ch2, Ch3, Ch4, Ch5, Ch6, mux3_out);
	mux_2bit_8to1 mux4 (ChSel, Ch6, Ch7, Ch0, Ch1, Ch2, Ch3, Ch4, Ch5, mux4_out);
	mux_2bit_8to1 mux5 (ChSel, Ch5, Ch6, Ch7, Ch0, Ch1, Ch2, Ch3, Ch4, mux5_out);
	mux_2bit_8to1 mux6 (ChSel, Ch4, Ch5, Ch6, Ch7, Ch0, Ch1, Ch2, Ch3, mux6_out);
	mux_2bit_8to1 mux7 (ChSel, Ch3, Ch4, Ch5, Ch6, Ch7, Ch0, Ch1, Ch2, mux7_out);
	char_7seg hex0 (mux0_out, hex0_out);
	char_7seg hex1 (mux1_out, hex1_out);
	char_7seg hex2 (mux2_out, hex2_out);
	char_7seg hex3 (mux3_out, hex3_out);
	char_7seg hex4 (mux4_out, hex4_out);
	char_7seg hex5 (mux5_out, hex5_out);
	char_7seg hex6 (mux6_out, hex6_out);
	char_7seg hex7 (mux7_out, hex7_out);
endmodule