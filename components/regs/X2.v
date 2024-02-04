module X2 #() (    
    input [15:0] in,
    input load,
    input clk,
    output reg [15:0] out
);
always @(posedge clk) begin
    if (load == 1)
        out <= in;
end
endmodule