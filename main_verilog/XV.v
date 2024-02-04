
module Executer(
    input start,
    input [15 : 0] x,
    input [15 : 0] v,
    input reset,
    input clk,

    output done,
    output [15 : 0] distance
);
wire done_set ,done_reset;
wire C_inc , C_reset;
wire X2_load;
wire [1 : 0] select_for_mult;
wire E_load , E_reset;
wire T_custom_reset ,T_load;
wire distance_load ,c ,hard_reset;


DP dp1(.T_load(T_load),
    .T_custom_reset(T_custom_reset),
    .C_inc(C_inc),
    .C_reset(C_reset),
    .done_reset(done_reset),
    .done_set(done_set),
    .X2_load(X2_load),
    .select_for_mult(select_for_mult),
    .E_load(E_load),
    .E_reset(E_reset),
    .distance_load(distance_load),
    .hard_reset(hard_reset),
    .clk(clk),
    .x(x),
    .v(v),
    .distance_(distance),
    .c_(c),
    .done_(done));

CU cu1(.s(start),
    .c(c),
    .reset(reset),
    .clk(clk),
    .T_load(T_load),
    .T_custom_reset(T_custom_reset),
    .C_inc(C_inc),
    .C_reset(C_reset),
    .done_reset(done_reset),
    .done_set(done_set),
    .X2_load(X2_load),
    .select_for_mult(select_for_mult),
    .E_load(E_load),
    .E_reset(E_reset),
    .distance_load(distance_load),
    .hard_reset(hard_reset));

endmodule

module TB;

reg [15:0] x ,v ,expected ,distance_;
reg reset ,clk ,start;
reg [1:0]flag;
wire done;

wire [15:0] distance;

always #10 clk = ~clk;
Executer  e1(.clk(clk),.reset(reset),.start(start),.x(x),.v(v),.done(done),.distance(distance));


initial
begin
    $dumpfile("proj.vcd");
    $dumpvars(0, TB);

    clk = 0 ;
    reset = 0;
    #10;
    reset = 1; 
    #20;
    reset = 0;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // case : cos(90)
    x = 16'd3216; // x input 
    v = 16'd2048; // v input
    expected = 16'd1; // expected result
    #10 start = 1;
    #30 start = 0;
    #400
    if (distance[15] == 1) begin
        distance_ = -distance;
        flag[0] = 1;
    end
    else begin
        flag[0] = 0;
        distance_ = distance;
    end
    if (expected[15]  == 1) begin
        expected = -expected;
        flag[1] = 1;
    end
    else begin
        flag[1] = 0;
    end
    case(flag[1:0])
    2'b00 : $display ("out input is as below\nx = %b | v = %b\nour result is (binary / decimal) %b\t%d \nout expected result is (binary / decimal) %b,\t%d  \n ",x ,v ,distance_ ,distance_ ,expected ,expected);
    2'b01 : $display ("out input is as below\nx = %b | v = %b\nour result is (binary / decimal) -%b\t-%d \nout expected result is (binary / decimal) %b\t%d,  \n ",x ,v ,distance_ ,distance_ ,expected ,expected);
    2'b10 : $display ("out input is as below\nx = %b | v = %b\nour result is (binary / decimal) %b\t%d \nout expected result is (binary / decimal) -%b\t-%d,  \n ",x ,v ,distance_ ,distance_ ,expected ,expected);
    2'b11 : $display ("out input is as below\nx = %b | v = %b\nour result is (binary / decimal) -%b\t-%d \nout expected result is (binary / decimal) -%b\t-%d,  \n ",x ,v ,distance_ ,distance_ ,expected ,expected);
    endcase 

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // case : cos(0)
    x = 16'd0; // x input 
    v = 16'd2893; // v input
    expected = 16'd2893; // expected result
    #10 start = 1;
    #30 start = 0;
    #400
    if (distance[15] == 1) begin
        distance_ = -distance;
        flag[0] = 1;
    end
    else begin
        flag[0] = 0;
        distance_ = distance;
    end
    if (expected[15]  == 1) begin
        expected = -expected;
        flag[1] = 1;
    end
    else begin
        flag[1] = 0;
    end
    case(flag[1:0])
    2'b00 : $display ("out input is as below\nx = %b | v = %b\nour result is (binary / decimal) %b\t%d \nout expected result is (binary / decimal) %b,\t%d  \n ",x ,v ,distance_ ,distance_ ,expected ,expected);
    2'b01 : $display ("out input is as below\nx = %b | v = %b\nour result is (binary / decimal) -%b\t-%d \nout expected result is (binary / decimal) %b\t%d,  \n ",x ,v ,distance_ ,distance_ ,expected ,expected);
    2'b10 : $display ("out input is as below\nx = %b | v = %b\nour result is (binary / decimal) %b\t%d \nout expected result is (binary / decimal) -%b\t-%d,  \n ",x ,v ,distance_ ,distance_ ,expected ,expected);
    2'b11 : $display ("out input is as below\nx = %b | v = %b\nour result is (binary / decimal) -%b\t-%d \nout expected result is (binary / decimal) -%b\t-%d,  \n ",x ,v ,distance_ ,distance_ ,expected ,expected);
    endcase 

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //cos(p/3)
    x = 16'd2048; // x input 
    v = 16'd2048; // v input
    expected = 16'd1106; // expected result
    #10 start = 1;
    #30 start = 0;
    #400
    if (distance[15] == 1) begin
        distance_ = -distance;
        flag[0] = 1;
    end
    else begin
        flag[0] = 0;
        distance_ = distance;
    end
    if (expected[15]  == 1) begin
        expected = -expected;
        flag[1] = 1;
    end
    else begin
        flag[1] = 0;
    end
    case(flag[1:0])
    2'b00 : $display ("out input is as below\nx = %b | v = %b\nour result is (binary / decimal) %b\t%d \nout expected result is (binary / decimal) %b,\t%d  \n ",x ,v ,distance_ ,distance_ ,expected ,expected);
    2'b01 : $display ("out input is as below\nx = %b | v = %b\nour result is (binary / decimal) -%b\t-%d \nout expected result is (binary / decimal) %b\t%d,  \n ",x ,v ,distance_ ,distance_ ,expected ,expected);
    2'b10 : $display ("out input is as below\nx = %b | v = %b\nour result is (binary / decimal) %b\t%d \nout expected result is (binary / decimal) -%b\t-%d,  \n ",x ,v ,distance_ ,distance_ ,expected ,expected);
    2'b11 : $display ("out input is as below\nx = %b | v = %b\nour result is (binary / decimal) -%b\t-%d \nout expected result is (binary / decimal) -%b\t-%d,  \n ",x ,v ,distance_ ,distance_ ,expected ,expected);
    endcase 

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    x = 16'd2048 ; // x input 
    v = 16'd10240; // v input
    expected = 16'd5532; // expected result
    #10 start = 1;
    #30 start = 0;
    #400
    if (distance[15] == 1) begin
        distance_ = -distance;
        flag[0] = 1;
    end
    else begin
        flag[0] = 0;
        distance_ = distance;
    end
    if (expected[15]  == 1) begin
        expected = -expected;
        flag[1] = 1;
    end
    else begin
        flag[1] = 0;
    end
    case(flag[1:0])
    2'b00 : $display ("out input is as below\nx = %b | v = %b\nour result is (binary / decimal) %b\t%d \nout expected result is (binary / decimal) %b,\t%d  \n ",x ,v ,distance_ ,distance_ ,expected ,expected);
    2'b01 : $display ("out input is as below\nx = %b | v = %b\nour result is (binary / decimal) -%b\t-%d \nout expected result is (binary / decimal) %b\t%d,  \n ",x ,v ,distance_ ,distance_ ,expected ,expected);
    2'b10 : $display ("out input is as below\nx = %b | v = %b\nour result is (binary / decimal) %b\t%d \nout expected result is (binary / decimal) -%b\t-%d,  \n ",x ,v ,distance_ ,distance_ ,expected ,expected);
    2'b11 : $display ("out input is as below\nx = %b | v = %b\nour result is (binary / decimal) -%b\t-%d \nout expected result is (binary / decimal) -%b\t-%d,  \n ",x ,v ,distance_ ,distance_ ,expected ,expected);
    endcase 

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    #300;
    $finish;


end

endmodule


module DP #() (
    input T_load,
    input T_custom_reset,
    input C_inc,
    input C_reset,
    input done_reset,
    input done_set,
    input X2_load,
    input [1:0]select_for_mult,
    input E_load,
    input E_reset,
    input distance_load,
    input hard_reset,

    input clk,
    input [15:0] x,
    input [15:0] v,

    output c_, 
    output [15:0] distance_,
    output done_
);

wire [2:0] count_;
wire [15:0] rom_ ,mul_ ,x2_ ,term_ ,sum_ ,E_ ,mux_out1_ ,mux_out2_ ,T_;

// loop counter
Counter C1(.inc(C_inc) ,.reset(C_reset) ,.clk(clk) ,.c_val(count_) ,.break(c_));

// calculate x^2 and save it on x2_ wire
X2 X2_1(.in(mul_) ,.load(X2_load) ,.clk(clk) ,.out(x2_));

// rom value
Rom rom1(.s(count_) ,.out(rom_));

// 2 mux before multiplier 2 inputs
Mux mux1(.s(select_for_mult) ,.in1(x) ,.in2(rom_) ,.in3(x2_) ,.in4(v) ,.out(mux_out1_));
Mux mux2(.s(select_for_mult) ,.in1(x) ,.in2(T_) ,.in3(T_) ,.in4(E_) ,.out(mux_out2_));

// mult with muxed inputs
Multiplier mult1(.in1(mux_out1_) ,.in2(mux_out2_) ,.out(mul_));

// for calculating E
FullAdder16bit adder1(.in1(T_) ,.in2(E_) ,.out(sum_));

// update T1 on the loop
Term T1(.in(mul_) ,.load(T_load) ,.clk(clk) ,.custom_reset(T_custom_reset) ,.out(T_));

// update E1 on the loop
Exp E1(.in(sum_) ,.load(E_load) ,.clk(clk) ,.reset(E_reset) ,.out(E_));

// value of the output
Distance dist1(.in(mul_) ,.load(distance_load) ,.clk(clk) ,.out(distance_));
Done done1(.clear(done_reset) ,.set(done_set) ,.clk(clk) ,.out(done_) ,.reset(hard_reset));


endmodule

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

///////////////////////////////////////////////////////////////////////////////////////////////
// our data 

module Rom #(
) (
    input [2:0] s,
    output reg [15:0] out
);

    always @(*) begin
        case (s)
            3'b000: out <= -16'd1024;
            3'b001: out <=  -16'd170;
            3'b010: out <=  -16'd68;
            3'b011: out <=  -16'd36;
            3'b100: out <=  -16'd23;
            3'b101: out <=  -16'd16;
            3'b110: out <=  -16'd11;
        default: out <=  0;
        endcase
    end  
endmodule

///////////////////////////////////////////////////////////////////////////////////////////////
// our calculation components

module FullAdder16bit #() 
(
   input [15:0] in1,
   input [15:0] in2,
   output  [15:0] out
);
assign out = in1 + in2;
endmodule

  module Distance #() (
    input [15:0] in, 
    input load,
    input clk,
    output reg [15:0] out
 );

always @(posedge clk) begin
    if(load == 1)begin
        out <= in;
    end
end
    
endmodule


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


module Mux #() (
    input [15:0] in1,
    input [15:0] in2,
    input [15:0] in3,
    input [15:0] in4,
    input [1:0] s,

    output  [15:0] out
);

    assign out = ( s[1] == 0 ) ? (( s[0] == 0 ) ? in1:in2 ) : (( s[0] == 0 ) ? in3:in4 );
endmodule

///////////////////////////////////////////////////////////////////////////////////////////////
// our registers

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
