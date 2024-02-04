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