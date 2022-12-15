module shift_register (clk, rst, D, Q);
    input clk, rst;
    input D;
    output [3:0] Q;
    
    d_ff D0 (clk, rst, D, Q[0]);
    d_ff D1 (clk, rst, Q[0], Q[1]);
    d_ff D2 (clk, rst, Q[1], Q[2]);
    d_ff D3 (clk, rst, Q[2], Q[3]);
endmodule