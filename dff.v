module dff_asychronous (d, clk, reset, q);
input d; // data
input clk; // clock
input reset; // active low asyncronous reset

output q; // output

reg q_reg;
always @(posedge clk or posedge ~reset) begin
  q_reg <= (reset ? 1'b0 : d);
end

assign q = q_reg;
endmodule
