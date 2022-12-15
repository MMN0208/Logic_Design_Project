module fsm_ff (clk, rst, D, Q);

    input clk, rst;
    input [8:0] D;
    output [8:0] Q;

    d_ff D0 (clk, rst, D[0], Q[0]);
    d_ff D1 (clk, rst, D[1], Q[1]);
    d_ff D2 (clk, rst, D[2], Q[2]);
    d_ff D3 (clk, rst, D[3], Q[3]);
    d_ff D4 (clk, rst, D[4], Q[4]);
    d_ff D5 (clk, rst, D[5], Q[5]);
    d_ff D6 (clk, rst, D[6], Q[6]);
    d_ff D7 (clk, rst, D[7], Q[7]);
    d_ff D8 (clk, rst, D[8], Q[8]);

endmodule