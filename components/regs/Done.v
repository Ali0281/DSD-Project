module Done #() 
(
    input clear,
    input set,
    input clk,
    input reset,
    output reg out
);
    always @(posedge clk or posedge reset) begin
        if ((reset == 1) | (clear == 1)) begin
            out <= 0 ;
        end 
        else if (set == 1) begin
            out <= 1;
        end
    end
endmodule
