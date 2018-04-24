module vram (address, address2, in, in2, write, write2, out, out2, clock);

    input [7:0] in, in2;
    input [63:0] address, address2;
    input write, write2, clock;
    output reg [7:0] out, out2;

    // Declare the RAM variable
    reg [7:0] ram[7199:0];

    always @ (posedge clock) begin // Port A
        if (write) begin
            ram[address] <= in;
            out <= in;
        end else begin
            out <= ram[address];
        end
    end

    always @ (posedge clock) begin // Port b
        if (write2) begin
            ram[address2] <= in2;
            out2 <= in2;
        end
        else begin
            out2 <= ram[address2];
        end
    end
endmodule

