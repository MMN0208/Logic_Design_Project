module behavioral_fsm (clk, rst, w, Q, zout);
    input clk, rst, w;
    output reg zout;
    output [8:0] Q;
    
    reg [8:0] y_Q, Y_D;
    
    parameter A = 'd0;
    parameter B = 'd1;
    parameter C = 'd2;
    parameter D = 'd3;
    parameter E = 'd4;
    parameter F = 'd5;
    parameter G = 'd6;
    parameter H = 'd7;
    parameter I = 'd8;

    assign Q = y_Q;

    always @(y_Q, w) begin
        
        case (y_Q)
            A:if (w == 0) begin
                Y_D = B;
            end else begin
                Y_D = F;
            end

            B:if (w == 0) begin
                Y_D = C;
            end else begin
                Y_D = F;
            end

            C:if (w == 0) begin
                Y_D = D;
            end else begin
                Y_D = F;
            end

            D:if (w == 0) begin
                Y_D = E;
            end else begin
                Y_D = F;
            end

            E:if (w == 0) begin
                Y_D = E;
            end else begin
                Y_D = F;
            end
            
            F:if (w == 1) begin
                Y_D = G;
            end else begin
                Y_D = B;
            end

            G:if (w == 1) begin
                Y_D = H;
            end else begin
                Y_D = B;
            end

            H:if (w == 1) begin
                Y_D = I;
            end else begin
                Y_D = B;
            end

            I:if (w == 1) begin
                Y_D = I;
            end else begin
                Y_D = B;
            end

            default: Y_D = 4'bxxxx;
        endcase

    end

    always @(posedge clk, posedge rst) begin
        
        case (y_Q)
            A: zout = 0;
            B: zout = 0;
            C: zout = 0;
            D: zout = 0;
            E: zout = 1;
            F: zout = 0;
            G: zout = 0;
            H: zout = 0;
            I: zout = 1;
            default: zout = 0;
        endcase

        if (rst) begin
            y_Q = A;
        end else begin
            y_Q = Y_D;
        end

    end

endmodule