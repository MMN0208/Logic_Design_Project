module morse_decoder_fsm (clk, rst, signal, zout);
    input clk, rst;
    input [13:0] signal;
    output reg zout;

    reg [3:0] y_Q, Y_D;

    parameter state0 = 'd0;
    parameter state1 = 'd1;
    parameter state2 = 'd2;
    parameter state3 = 'd3;
    parameter state4 = 'd4;
    parameter state5 = 'd5;
    parameter state6 = 'd6;
    parameter state7 = 'd7;
    parameter state8 = 'd8;
    parameter state9 = 'd9;
    parameter state10 = 'd10;
    parameter state11 = 'd11;
    parameter state12 = 'd12;
    parameter state13 = 'd13;
    parameter endstate = 'd14;

    always @ (y_Q) begin
        case (y_Q)
            state0: Y_D = state1;
            state1: Y_D = state2;
            state2: Y_D = state3;
            state3: Y_D = state4;
            state4: Y_D = state5;
            state5: Y_D = state6;
            state6: Y_D = state7;
            state7: Y_D = state8;
            state8: Y_D = state9;
            state9: Y_D = state10;
            state10: Y_D = state11;
            state11: Y_D = state12;
            state12: Y_D = state13;
            state13: Y_D = endstate;
            endstate: Y_D = endstate;
            default: Y_D = state0;
        endcase
    end

    always @ (posedge clk, posedge rst) begin
        case (y_Q)
            state0: zout = signal[13];
            state1: zout = signal[12];
            state2: zout = signal[11];
            state3: zout = signal[10];
            state4: zout = signal[9];
            state5: zout = signal[8];
            state6: zout = signal[7];
            state7: zout = signal[6];
            state8: zout = signal[5];
            state9: zout = signal[4];
            state10: zout = signal[3];
            state11: zout = signal[2];
            state12: zout = signal[1];
            state13: zout = signal[0];
            endstate: zout = 'd0;
            default: zout = 'd0;
        endcase

        if (rst) begin
            y_Q = state0;
        end else begin
            y_Q = Y_D;
        end
    end

endmodule