module d_ff (clk, rst, d, Q);
    input clk, rst, d;
    output Q;

    always @ (posedge clk) {
        if(~rst) begin
            Q <= 0;
        end else begin
            Q <= d;
        end
    }
endmodule