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
