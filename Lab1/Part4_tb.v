`include "Part4.v"
`timescale 1ns/1ns

module part4_tb;
    reg [2:0] Sw;
    wire [6:0] Hex0;

    initial begin
        $dumpfile("Part4_tb.vcd");
        $dumpvars(0, part4_tb);
    end

    part4 uut (Sw[1:0], Hex0);

    initial begin
        for(Sw = 0; Sw < 4; Sw = Sw + 1) #1;
        $finish;
    end
endmodule