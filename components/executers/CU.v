
module CU #() (
   input s,
   input c,
   input reset,
   input clk,
   
   output reg T_load,
   output reg T_custom_reset,
   output reg C_inc,
   output reg C_reset,
   output reg done_reset,
   output reg done_set,
   output reg X2_load,
   output reg [1:0]select_for_mult,
   output reg E_load,
   output reg E_reset,
   output reg distance_load,
   output reg hard_reset
);


reg [2:0] mode;

/*
always @(posedge clk,posedge reset) begin
    if (reset == 1)
        mode <= 1;
    else if (mode == 7) mode <= 1;    
    else if (mode == 6) mode <= 4;
    else if (mode == 5) mode <= 6;
    else if (mode == 4)begin
        if(c == 1)
            mode <= 7;
        else 
            mode <= 5;
        end
    else if (mode == 3) mode = 4;
    else if (mode == 2)begin
        if(s != 1)
            mode <= 3;
        else mode <= 2;
        end
    else if (mode == 1)begin
        if(s == 1)
            mode <= 2;
        else mode <= 1;
        end
end   


always @(*) begin
    if (mode == 3) T_custom_reset <= 1 ;
    else T_custom_reset <= 0;
    if (mode == 5 | mode == 6) T_load <= 1;
    else T_load <= 0;
    if (mode == 6) C_inc <= 1;
    else C_inc <= 0;
    if (mode == 3) C_reset <= 1;
    else C_reset <= 0;
    if (mode == 7) done_set <= 1;
    else done_set <= 0;
    if (mode == 3) done_reset <= 1;
    else done_reset <= 0;
    if (mode == 3) X2_load <= 1;
    else X2_load <= 0;
    if (mode == 7 | mode == 5) select_for_mult[0] <= 1;
    else select_for_mult[0] <= 0;
    if (mode == 7 | mode == 6) select_for_mult[1]<= 1;
    else select_for_mult[1]<= 0;
    if (mode == 3) E_reset <= 1;
    else E_reset <= 0;
    if (mode == 4) E_load <= 1;
    else E_load <= 0;
    if (mode == 7) distance_load <= 1;
    else distance_load <= 0;
    if (mode == 1) hard_reset <= 1;
    else  hard_reset <= 0;
    
end

*/


always @(posedge clk,posedge reset) begin
    if (reset == 1)
        mode <= 1;
    else if (mode == 6) mode <= 1;    
    else if (mode == 5) mode <= 4;
    else if (mode == 4)begin
        if(c == 1)
            mode <= 6;
        else 
            mode <= 5;
        end
    else if (mode == 3) mode = 4;
    else if (mode == 2)begin
        if(s != 1)
            mode <= 3;
        else mode <= 2;
        end
    else if (mode == 1)begin
        if(s == 1)
            mode <= 2;
        else mode <= 1;
        end
end

always @(*) begin
    if (mode == 3) T_custom_reset <= 1 ;
    else T_custom_reset <= 0;
    if (mode == 5 | mode == 4) T_load <= 1;
    else T_load <= 0;
    if (mode == 5) C_inc <= 1;
    else C_inc <= 0;
    if (mode == 3) C_reset <= 1;
    else C_reset <= 0;
    if (mode == 6) done_set <= 1;
    else done_set <= 0;
    if (mode == 3) done_reset <= 1;
    else done_reset <= 0;
    if (mode == 3) X2_load <= 1;
    else X2_load <= 0;
    if (mode == 6 | mode == 4) select_for_mult[0] <= 1;
    else select_for_mult[0] <= 0;
    if (mode == 6 | mode == 5) select_for_mult[1]<= 1;
    else select_for_mult[1]<= 0;
    if (mode == 3) E_reset <= 1;
    else E_reset <= 0;
    if (mode == 4) E_load <= 1;
    else E_load <= 0;
    if (mode == 6) distance_load <= 1;
    else distance_load <= 0;
    if (mode == 1) hard_reset <= 1;
    else  hard_reset <= 0;
    
end

endmodule
