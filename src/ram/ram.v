module ram(address, clock, in, write, out);
    input [12:0] address;
    input clock;
    input [63:0] in;
    input write;

    output reg [63:0] out;

    parameter memory_words = 8064; //needs to actually be more like 6000

    reg [63:0] mem [0:memory_words-1];

    always @ (posedge clock) begin
        if (write) begin
            mem[address] <= in;
        end
    end

    always @ (posedge clock) begin
        if (!write) begin
            out <= mem[address];
        end
    end

endmodule
