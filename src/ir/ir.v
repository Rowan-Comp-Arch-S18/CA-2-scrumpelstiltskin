module ir (Q, D, reset, clock, control_word);
    parameter n = 16;

    input [n-1:0] D;
    input reset;
    input clock;
    input [1:0] control_word;
    // control_word
    // 00: load Q
    // 01: PC + 4
    // 10: load PC
    // 11: reset PC to 0

    output reg [n-1:0] Q;

    reg pc_Q, pc_D, pc_reset;
    pc pc_inst (.Q(pc_Q), .D(pc_D), .reset(pc_reset), .clock(clock));

    always @ (posedge clock or posedge reset) begin
        case(control_word) begin
            2'b00: D <= Q;
            2'b01: 
            end
        endcase
    end

endmodule
