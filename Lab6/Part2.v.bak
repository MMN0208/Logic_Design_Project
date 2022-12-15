module part2 (SW, KEY, LEDR, HEX0, HEX1, HEX2, HEX3);

    input [8:0] SW;
    input [1:0] KEY;
    output [9:0] LEDR;
    output [6:0] HEX0, HEX1, HEX2, HEX3;

    wire Add_Sub;
    wire [7:0] A, S;

    assign {Add_Sub, A} = SW;

    accumulator A0 (KEY[0], KEY[1], Add_Sub, A, LEDR[8], LEDR[9], S);

    assign LEDR[7:0] = S;

    displayHEX H0 (S[3:0], HEX0);
    displayHEX H1 (S[7:4], HEX1);
    displayHEX H2 (A[3:0], HEX2);
    displayHEX H3 (A[7:4], HEX3);

endmodule