module part5 (SW, KEY, LEDR, HEX0, HEX1, HEX2, HEX3);

    input [9:0] SW;
    input [1:0] KEY;
    output [7:0] LEDR;
    output [6:0] HEX0, HEX1, HEX2, HEX3;

    wire [15:0] product;

    adder_tree_multiplier_with_en A0 (KEY[1], KEY[0], SW[9], SW[8], SW[7:0], LEDR, product);

    displayHEX H0 (product[3:0], HEX0);
    displayHEX H1 (product[7:4], HEX1);
    displayHEX H2 (product[11:8], HEX2);
    displayHEX H3 (product[15:12], HEX3);

endmodule