`include "Part3.v"
`timescale 1ns/1ns

module part3_tb;
    reg [10:0] Sw;
    wire [9:0] Led;

    initial begin
        $dumpfile("Part3_tb.vcd");
        $dumpvars(0, part3_tb);
    end

    part3 uut (Sw[9:0], Led);

    initial begin
        for(Sw = 0; Sw < 1024; Sw = Sw + 1) #1;
        $finish;
    end
endmodule