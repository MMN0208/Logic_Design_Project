module part3 (SW, HEX0, HEX2, HEX4, HEX5);

    input [7:0] SW;
    output [6:0] HEX0, HEX2, HEX4, HEX5;

    wire [3:0] A, B;
    wire [7:0] P;

    assign {A, B} = SW;

    multiplier M0 (A, B, P);

    displayHEX H0 (B, HEX0);
    displayHEX H1 (A, HEX2);
    displayHEX H2 (P[3:0], HEX4);
    displayHEX H3 (P[7:4], HEX5);

endmodule