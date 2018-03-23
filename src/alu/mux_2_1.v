module mux_2_1 (
    A, B, select,   // inputs
    F               // outputs
);

input [63:0] A, B;
input select;

output [63:0] F;

assign F = {64{~select}} & A |
           {64{ select}} & B ;
endmodule
