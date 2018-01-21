module register_file_32_x_64(EN_A,EN_B, WR, BA, AA, DA, D, clock, reset, A, B);
// register file dimentions
parameter n=32;
parameter m=64;

input EN_A; // [OPTIONAL] Enable A output
input EN_B; // [OPTIONAL] Enable B output
input WR; // Write Register signal to enable load on register selected by DA
input [log2(n)-1:0] AA; // log2(n) bit address of register to select for A output
input [log2(n)-1:0] BA; // log2(n) bit address of register to select for B output
input [m-1:0] D; // n-registers of m-width
input [log2(n)-1:0] DA; // log2(n) bit address of register to be loaded with D
input clock; // clock for registers
input reset; // reset signal to reset all registers to 0

output [m-1:0] A; // m bit output from selected register
output [m-1:0] B; // m bit output from selected register
//output [n-1:0] R0, ... Rn-1; // direct n bit register outputs to be used for debugging/visualization

reg [m-1:0] R[n-1:0];

generate
genvar i;
  for(i = 0; i < n; i = i + 1) begin : registers_m_bit
    register_n_bit register_m_bit_i (.D(), .L(), .clk(clk), .reset(reset), .Q());
  end
endgenerate

function log2;
    input x;
    reg i, log;
    begin
        i = x;
        log = 1;
        while(i!=1) begin
            i=i/2;
            log = log + 1;
        end
    end
endfunction

endmodule
