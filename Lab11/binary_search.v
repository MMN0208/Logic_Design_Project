module binary_search (clock, reset, s, din, Tin, found, done, addo, addf);
    input clock, reset, s;
    input [7:0] din, Tin; // din is 8-bit word from memory, Tin is target input
    output reg found, done;
    output reg [4:0] addo, addf; // addo to get data from memory, addf is address of target

    localparam S1 = 3'd0;
    localparam S2 = 3'd1;
    localparam S3 = 3'd2;
    localparam S4 = 3'd3;
	 localparam S5 = 3'd4;

    reg [2:0] y_Q, Y_D; // current state and next state
    reg [7:0] T; // Target reg
    reg [5:0] m; // middle
    reg [4:0] L; // Left
    reg [4:0] R; // Right

    always @(y_Q, s, L, R, din, T, m, found) begin
        done = 0;
        case (y_Q)
            S1: begin
                m = 0;
                L = 0;
                R = 31;
                found = 0;
                addf = 0;
					 
					 if (s) Y_D = S2;
                else begin
						Y_D = S1;
						T = Tin; // set Target reg
					 end
            end

            S2: begin
					 found = 0;
					 addf = 0;
                if (L <= R) begin
                    m = L + R;
                    m = m / 2;
                    addo = m[4:0]; // middle address
						  Y_D = S3;
                end else Y_D = S5;
            end
				
            S3: begin
                // wait 1 cycle to get data from memory array
					 Y_D = S4;
            end

            S4: begin
					 found = 0;
					 addf = 0;
					 Y_D = S2;
                if (din < T) L = m[4:0] + 1'b1; // if current value at index m in memory is less than Target
                else if (din > T) R = m[4:0] - 1'b1; // if current value at index m in memory is greater than Target
                else if (din == T) begin
                    found = 1'b1;
                    addf = m[4:0];
						  Y_D = S5;
                end
            end

            S5: begin
                done = 1'b1;
                if (found) begin
                    found = 1'b1;
                    addf = m[4:0];
                end else begin
                    found = 0;
                    addf = 0;
					 end
					 
					 if (s) Y_D = S5;
                else Y_D = S1;
            end
				
				default: begin
					 Y_D = S1;
				end
        endcase
    end

    always @(posedge clock, posedge reset) begin
        if (reset) y_Q <= S1;
        else y_Q <= Y_D;
    end


endmodule
