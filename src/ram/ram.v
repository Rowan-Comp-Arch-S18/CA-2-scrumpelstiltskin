module ram(
    in, address, write, clock,  // inputs
    out                         // outputs
);

    input [63:0] in;
    input [12:0] address;
    input clock, write;

    output reg [63:0] out;

    parameter memory_words = 7840;

    reg [63:0] mem [0:memory_words-1];

    always @(posedge clock) begin
        if(write) begin
            mem[address] <= in;
        end
    end

    always @(posedge clock) begin
        if(!write) begin
            out<= mem[address];
        end
    end

endmodule
