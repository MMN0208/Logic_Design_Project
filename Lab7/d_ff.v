module d_ff (clk, rst, d, Q);
    input clk, rst, d;
    output reg Q;

    always @ (posedge clk) begin
        if (~rst) begin
            Q <= 'd0;
        end else begin
            Q <= d;
        end
    end
endmodule