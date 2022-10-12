`include "Part2.v"
`timescale 1ns/1ns

module part2_tb;
    reg [10:0] Sw;
    wire [9:0] Led;

    initial begin
        $dumpfile("Part2_tb.vcd");
        $dumpvars(0, part2_tb);
    end

    part2 uut (Sw[9:0], Led);

    initial begin
        for(Sw = 0; Sw < 1024; Sw = Sw + 1) #1;
        $finish;
    end
endmodule