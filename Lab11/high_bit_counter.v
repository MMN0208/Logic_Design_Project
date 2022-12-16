module high_bit_counter (clock, reset, s, din, result, done);
    input clock, reset, s;
    input [7:0] din;
    output reg [3:0] result;
    output reg done;

    parameter S1 = 'd0;
    parameter S2 = 'd1;
    parameter S3 = 'd2;

    
    reg [1:0] y_Q, Y_D;
	 reg [7:0] A;
    reg high_bit;

    always @(y_Q, A, s) begin
		  high_bit = 0;
		  done = 0;
        case (y_Q)
            S1: begin
                if (s) Y_D = S2; // start the program
                else Y_D = S1;
            end

            S2: begin
                if (A[0]) high_bit = 1;
                else high_bit = 0;

                if (!A) Y_D = S3; // A == 0, stop the program              
                else Y_D = S2;
            end

            S3: begin
                if (!s) begin
						done = 0;
						Y_D = S1;
                end else begin
						done = 1;
						Y_D = S3;
					 end
            end
            default: Y_D = S1;
        endcase
    end

    always @(posedge clock, posedge reset) begin
        if (reset) begin
            y_Q <= S1;
            result <= 0;
        end else begin 
            y_Q <= Y_D;
            if (high_bit) begin
                result <= result + 1'b1;
            end else begin
                result <= result;
            end
        end
    end

    always @(posedge clock) begin
        if (!s) begin
            A <= din;
        end
        else begin
            A <= A >> 1;
        end
    end
endmodule

