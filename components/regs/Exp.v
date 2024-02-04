module Exp #() (
    input [15:0]in, 
    input load,
    input clk,
    input reset,
    output reg [15:0] out
 );

always @(posedge clk) begin
    if (reset == 1)begin
        out <= 0;
    end 
    else if(load == 1)begin
        out <= in;
    end
end
    
endmodule