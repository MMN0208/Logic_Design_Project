module accumulator (rst, clk, A, carry, overflow, sum);
    input rst, clk;
    input [7:0] A;
    output reg carry, overflow;
    output reg [7:0] sum;

    always @(posedge clk, negedge rst) begin
        if (~rst) begin
            sum <= 0;
            carry <= 0;
            overflow <= 0;
        end
        else begin
            {carry, sum} <= sum + A;
            if (sum > 8'b11111111) begin
                overflow <= 1;
            end
        end
    end
endmodule