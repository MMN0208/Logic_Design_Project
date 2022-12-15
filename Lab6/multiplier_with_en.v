module multiplier_with_en (clk, rst, en_A, en_B, I, display, P);
    input clk, rst, en_A, en_B;
    input [7:0] I;
    output reg [7:0] display;
    output reg [15:0] P;

    reg [7:0] A, B;

    always @ (*) begin
        if(en_A) begin
            display = A;
        end
        else if(en_B) begin
            display = B;
        end
    end

    always @(en_A, en_B, I) begin
        if (en_A) begin
            A = I;
        end
        if (en_B) begin
            B = I;
        end
    end
    always @(posedge clk, negedge rst) begin
        if (~rst) begin
            P <= 0;
        end
        else begin
            P = A * B;
        end
    end
endmodule