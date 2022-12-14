module part3 (CLOCK_50, SW, LEDR, KEY, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
    input CLOCK_50;
    input [1:0] LEDR;
    input [5:0] SW;
    input [1:0] KEY;
    output [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;

    wire [6:0] TEN_MILLIS;
    wire [5:0] SECONDS, MINUTES;
    wire preset;

    assign preset = KEY[1];

    reg ten_milli, sec, min;

    counter_modk C0 (CLOCK_50, KEY[0], CYCLES, ten_milli);
    defparam C0.n = 19;
    defparam C0.k = 500000;

    counter_modk C1 (~ten_milli, KEY[0], TEN_MILLIS, sec);
    defparam C1.n = 7;
    defparam C1.k = 100;

    counter_modk C2 (~sec, KEY[0], SECONDS, min);
    defparam C2.n = 6;
    defparam C2.k = 60;

    counter_modk C2 (~min, KEY[0], MINUTES, LEDR[0]);
    defparam C2.n = 6;
    defparam C2.k = 60;

    always @ (negedge preset) begin
        if(~preset) begin
            if(SW[5:0] < 60) begin
                MINUTES <= SW[5:0];
            end
            else begin
                MINUTES <= 'd0;
            end
        end
    end

    twodigit_displayHEX D2 (MINUTES, HEX5, HEX4);
    twodigit_displayHEX D1 (SECONDS, HEX3, HEX2);
    twodigit_displayHEX D0 (TEN_MILLIS, HEX1, HEX0);
endmodule

