module program_counter(ps, in, pc, pc4, reset, clock);
    // PS
    // 00 PC <- PC
    // 01 PC <- PC + 4
    // 10 PC <- in
    // 11 PC <- PC + 4 + in*4

    input [63:0] in;
    input [1:0] ps;
    input clock, reset;

    output reg [63:0] pc;
    output [63:0] pc4;

    assign pc4 = pc + 64'd4;

    initial begin
        pc <= 64'd0;
    end

    always @ (posedge clock) begin
        if (reset) begin
            pc <= 63'd0;
        end else begin
            case (ps)
                2'b00: pc <= pc;
                2'b01: pc <= pc + 64'd4;
                2'b10: pc <= in;
                2'b11: pc <= pc + 64'd4 + (in << 2);
            endcase
        end
    end
endmodule
