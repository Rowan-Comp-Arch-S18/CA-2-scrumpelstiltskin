module pc(pc, pc4, in, ps, clock, reset);
    input [63:0] in;
    input [1:0] ps;
    input clock, reset;
    output reg [63:0] pc;
    output [63:0] pc4;

    wire [63:0] pc_in;
    wire [63:0] adder_out;
    wire load_pc;

    always @(posedge clock or posedge reset) begin
        if(reset)
            pc = 63'b0;
        else begin
            case(ps)
                2'b00:
                    pc<=pc;
                2'b01:
                    pc<=pc+4;
                2'b10:
                    pc<=in;
                2'b11:
                    pc<=pc+4+(in << 2);
            endcase
        end
    end

    assign pc4 = pc+4;
endmodule
