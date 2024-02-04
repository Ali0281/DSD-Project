module Counter #() (
   input inc, 
   input reset,
   input clk,
   output reg [2:0] c_val,
   output reg break
);
always @(posedge clk) begin
    if (reset == 1)begin
        c_val <= 0;
        break <= 0;
    end
    else if (inc == 1) begin
        if (c_val == 6) begin
            break <= 1;
        end
        c_val <= c_val + 1;
    end
end
    
endmodule
