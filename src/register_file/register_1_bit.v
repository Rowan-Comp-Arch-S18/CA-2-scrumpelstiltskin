module register_1_bit (D, L, clk, reset, Q);

input D; //1-bit data input
input L; // load enable
input clk; // posedge clock input
input reset; // active high reset

output Q; // 1-bit output

dff_asychronous dff1 (
  .d(D),
  .clk(clk),
  .reset(reset),
  .q(Q)
);

endmodule
