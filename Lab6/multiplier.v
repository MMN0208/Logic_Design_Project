module multiplier_module (A, B, P);
    input [3:0] A, B;
    output reg [7:0] P; 
    
    always @(*) begin
        P = A * B;
    end
endmodule