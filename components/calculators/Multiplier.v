
module Multiplier #()
(
   input [15:0] in1,
   input [15:0] in2,
   output reg [15:0] out
);
reg [31:0] mult;
reg [15:0] inn1;
reg [15:0] inn2;

always @(*) begin
   if(in1[15] == 1) begin
       inn1 = -in1;
   end
   else begin
       inn1 = in1;
   end
   if(in2[15] == 1) begin
       inn2 = -in2;
   end
   else begin
       inn2 = in2;  
   end  
   
   if ((in1[15] ^ in2[15]) == 1) begin
       mult = -(inn1 * inn2);
   end 
   else begin
       mult = inn1 * inn2;
   end 
   out <= mult[26:11];
end
endmodule
