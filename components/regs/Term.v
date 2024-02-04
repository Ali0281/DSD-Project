module Term #() (
    input [15:0]in, 
    input load,
    input clk,
    input custom_reset,
    output reg [15:0] out
 );

always @(posedge clk) begin
    if (custom_reset == 1)begin        
        // we could implement this part with a mux befor the input ---like this---> S ? 1 : inp_T
        // but we did this because reseting to 1 is a common thing for this register 
        out <= 16'b0000100000000000;
    end
    else if(load == 1)begin
        out <= in;
    end
end
    
endmodule