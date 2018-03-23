module mux_8_1 (
    A, B, C, D, E, F, G, H, select,     // inputs
    OUT                                 // outputs
);

input [63:0] A, B, C, D, E, F, G, H;
input [2:0] select;

output [63:0] OUT;

assign OUT = ( {64 {~select[2] &~select[1] & ~select[0]}} ) & A |
             ( {64 {~select[2] &~select[1] &  select[0]}} ) & B |
             ( {64 {~select[2] & select[1] & ~select[0]}} ) & C |
             ( {64 {~select[2] & select[1] &  select[0]}} ) & D |
             ( {64 { select[2] &~select[1] & ~select[0]}} ) & E |
             ( {64 { select[2] &~select[1] &  select[0]}} ) & F |
             ( {64 { select[2] & select[1] & ~select[0]}} ) & G |
             ( {64 { select[2] & select[1] &  select[0]}} ) & H ;
endmodule
