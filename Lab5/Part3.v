module part3 (CLOCK_50, SW, KEY, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
    input CLOCK_50;
    input [5:0] SW;
    input [1:0] KEY;
    output [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;
	 
	 wire [18:0] CYCLES;
    wire [6:0] TEN_MILLIS;
    wire [5:0] SECONDS;
	 wire [5:0] MINUTES;

    wire ten_milli, sec, min;

    counter_modk C0 (CLOCK_50, KEY[0], CYCLES, ten_milli);
    defparam C0.n = 19;
    defparam C0.k = 500000;

    counter_modk C1 (~ten_milli, KEY[0], TEN_MILLIS, sec);
    defparam C1.n = 7;
    defparam C1.k = 100;

    counter_modk C2 (~sec, KEY[0], SECONDS, min);
    defparam C2.n = 6;
    defparam C2.k = 60;

    minute_counter_async_set M0 (~min, KEY[1], KEY[0], SW, MINUTES);

    twodigit_displayHEX D2 (MINUTES, HEX5, HEX4);
    twodigit_displayHEX D1 (SECONDS, HEX3, HEX2);
    twodigit_displayHEX D0 (TEN_MILLIS, HEX1, HEX0);
endmodule

