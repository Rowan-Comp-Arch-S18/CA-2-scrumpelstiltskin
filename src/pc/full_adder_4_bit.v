module full_adder_4_bit (
    a, b, Cin,  // inputs
    F, Cout     // outputs
);

input [3:0] a, b;
input Cin;

output [3:0] F;
output Cout;

wire [02:0] Couts;

full_adder_1_bit fa_00 (.a(a[00]), .b(b[00]), .cin(Cin)      , .cout(Couts[00]), .s(F[00]));
full_adder_1_bit fa_01 (.a(a[01]), .b(b[01]), .cin(Couts[00]), .cout(Couts[01]), .s(F[01]));
full_adder_1_bit fa_02 (.a(a[02]), .b(b[02]), .cin(Couts[01]), .cout(Couts[02]), .s(F[02]));
full_adder_1_bit fa_03 (.a(a[03]), .b(b[03]), .cin(Couts[02]), .cout(Cout),      .s(F[03]));


endmodule
