module accumulator_ex (rst, clk, add_sub, A, carry, overflow, res);
    input rst, clk, add_sub;
    input [7:0] A;
    output reg carry, overflow;
    output reg [7:0] res;
	 
	 reg [7:0] temp;
	 
	 always @(*) begin
		temp = res;
	 end

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            res <= 0;
            carry <= 0;
            overflow <= 0;
        end
        else begin
            if (add_sub) begin
                {carry, res} <= temp - A;
					 if (res > temp || res > A) begin
						  overflow <= 1'b1;
					 end else begin
						  overflow <= 0;
					 end
            end
            else begin
                {carry, res} <= temp + A;
                if (res < temp || res < A) begin
                    overflow <= 1'b1;
                end else begin
					     overflow <= 0;
					 end
            end
        end
    end
endmodule