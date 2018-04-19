module vram(address, clock, in, write, out, address2, out2);
    input [12:0] address;
    input [12:0] address2;
    input clock;
    input [7:0] in;
    input write;

    output reg [7:0] out;
    output reg [7:0] out2;

    parameter memory_words = 7200;

    reg [7:0] mem [0:memory_words-1];

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

    always @ (posedge clock) begin
        out2 <= mem[address2];
    end

endmodule
