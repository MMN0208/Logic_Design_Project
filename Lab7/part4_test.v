module part4_test (clk, en, rst, sel, Q);
    input clk, en, rst;
    input [2:0] sel;
    output Q;

    wire [13:0] signal;

    select_character S0 (~en, sel, signal);
    morse_decoder_fsm M0 (clk, rst, signal, Q);
endmodule