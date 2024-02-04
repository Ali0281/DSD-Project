module Rom #(
) (
    input [2:0] s,
    output reg [15:0] out
);

    always @(*) begin
        case (s)
            // in order : - (1024 | 170 | 68 | 36 | 23 | 16 | 11)
            // hint : the neg 
            3'b000: out <= 16'b1111110000000000;
            3'b001: out <= 16'b1111111101010110;
            3'b010: out <= 16'b1111111110111100;
            3'b011: out <= 16'b1111111111011100;
            3'b100: out <= 16'b1111111111101001;
            3'b101: out <= 16'b1111111111110000;
            3'b110: out <= 16'b1111111111110101;
            3'b111: out <= 0;
        endcase
    end  
endmodule