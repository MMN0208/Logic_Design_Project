module accumulator (rst, clk, A, carry, overflow, sum);
    input rst, clk;
    input [7:0] A;
    output reg carry, overflow;
    output reg [7:0] sum;
	 
	 reg [7:0] temp;
	 
	 always @(*) begin
		temp = sum;
	 end

    always @(posedge clk, negedge rst) begin
        if (~rst) begin
            sum <= 0;
            carry <= 0;
            overflow <= 0;
        end
        else begin
            {carry, sum} <= temp + A;
            if (sum < temp || sum < A) begin
                overflow <= 1'b1;
            end else begin
					 overflow <= 0;
				end
        end
    end
endmodule