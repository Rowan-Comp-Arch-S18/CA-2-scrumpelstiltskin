module register_n_bit(D, L, clk, reset, Q);
// register  dimentions
parameter n=64;

input [n-1:0] D; // m-bit data input
input L; // load enable
input clk; // posedge clock input
input reset; // active high reset

output [n-1:0] Q; // m-bit output

generate
  genvar i;
  for(i = 0; i < n; i=i+1) begin : registers_1_bit
    register_1_bit r_1_bit_i(.D(D[i]), .L(L), .clk(clk), .reset(reset), .Q(Q[i]));
	end
endgenerate

reg [n-1:0] Q_reg;
assign Q = Q_reg;

initial begin
  Q_reg <= {n{1'b0}};
end

endmodule
