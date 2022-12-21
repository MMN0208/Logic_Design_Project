module accumulator_ex (rst, clk, add_sub, A, carry, overflow, res);
    input rst, clk, add_sub;
    input [7:0] A;
    output reg carry, overflow;
    output reg [7:0] res;

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            res <= 0;
            carry <= 0;
            overflow <= 0;
        end
        else begin
            if (add_sub) begin
                {carry, res} <= res - A;
            end
            else begin
                {carry, res} <= res + A;
                if (res > 8'b11111111) begin
                    overflow <= 1;
                end
            end
        end
    end
endmodule