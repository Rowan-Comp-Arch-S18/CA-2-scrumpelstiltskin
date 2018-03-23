module mux_4_1 (
    A, B, C, D, select, // inputs
    F                   // outputs
);

input [63:0] A, B, C, D;
input [1:0] select;

output [63:0] F;

assign F = ( {64 { ~select[1] & ~select[0]}} ) & A |
           ( {64 { ~select[1] &  select[0]}} ) & B |
           ( {64 {  select[1] & ~select[0]}} ) & C |
           ( {64 {  select[1] &  select[0]}} ) & D ;
endmodule
