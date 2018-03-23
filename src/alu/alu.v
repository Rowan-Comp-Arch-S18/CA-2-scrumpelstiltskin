module alu (
    FS, A, B, Cin,   // inputs
    F, Cout, status  // outputs
);

input [4:0] FS; // function select
input [63:0] A, B;
input Cin;

output [63:0] F;
output Cout;
output [3:0] status;


wire [63:0] a_signal, b_signal;

assign a_signal = FS[0] ? ~A : A;
assign b_signal = FS[1] ? ~B : B;

wire [63:0] and_out, or_out, xor_out, add_out, shift_left, shift_right;
assign and_out = a_signal & b_signal;
assign or_out = a_signal | b_signal;
assign xor_out = a_signal ^ b_signal;
assign shift_left = a_signal << b_signal[5:0];
assign shift_right = a_signal >> b_signal[5:0];

full_adder_64_bit adder (
    a_signal, b_signal, Cin,
    add_out, Cout
);

mux_8_1 function_select_mux (and_out, or_out, add_out, xor_out, shift_left, shift_right, 64'b0, 64'b0, FS[4:2], F);


wire V, C, N, Z;

assign Z = (F == 64'b0) ? 1'b1 : 1'b0;
assign N = F[63];
assign V = ~(a_signal[63] ^ b_signal[63]) & (F[63] ^ a_signal[63]);
assign C = Cout;

assign status = {Z, N, C, V};

endmodule
