module rtl_fsm (clk, rst, w, Q, z);
    input clk, rst, w;
    output [8:0] Q;
    output z;

    wire [8:0] D, Y;

    fsm_ff FF (clk, rst, D, Y);
    
    assign D[0] = ~(~(~Y[0] | Y[1] | Y[2] | Y[3] | Y[4] | Y[5] | Y[6] | Y[7] | Y[8]) | ~(D[1] | D[2] | D[3] | D[4] | D[5] | D[6] | D[7] | D[8])); 

    assign D[1] = (~Y[0] | Y[5] | Y[6] | Y[7] | Y[8]) & ~w; // B
    assign D[2] = Y[1] & ~w; // C
    assign D[3] = Y[2] & ~w; // D
    assign D[4] = (Y[3] | Y[4]) & ~w; // E

    assign D[5] = (~Y[0] | Y[1] | Y[2] | Y[3] | Y[4]) & w; // F
    assign D[6] = Y[5] & w; // G
    assign D[7] = Y[6] & w; // H
    assign D[8] = (Y[7] | Y[8]) & w; // I

    assign Q = Y;
    assign z = D[4] | D[8];
endmodule