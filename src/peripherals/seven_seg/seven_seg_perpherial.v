module seven_seg_perpherial(data, address, read, write, reset, clock, HEX0, HEX1, HEX2, HEX3);

    inout [63:0] data;
    input [63:0] address;
    input read;
    input write;
    input reset;
    input clock;
    output [6:0] HEX0, HEX1, HEX2, HEX3;

    reg [63:0] reg_value;
    wire load_wire;

    always @ (posedge clock) begin
        if (reset) begin
            reg_value <= 64'd0;
        end else if (load_wire) begin
            reg_value <= data; 
        end
    end

    wire address_detect;
    wire en_buffer;

    parameter ADDRESS = 64'h2000; // For assigning an address

    assign address_detect = ADDRESS ? 1'b1 : 1'b0;
    assign load_wire = address_detect & write;
    assign en_buffer = address_detect & read;
    assign data = en_buffer ? reg_value : 64'bz;

    Seven_Seg sevenHEX0(
        .in(reg_value[3:0]),
        .out(HEX0)
    );

    Seven_Seg sevenHEX1(
        .in(reg_value[7:4]),
        .out(HEX1)
    );

    Seven_Seg sevenHEX2(
        .in(reg_value[11:8]),
        .out(HEX2)
    );

    Seven_Seg sevenHEX3(
        .in(reg_value[15:12]),
        .out(HEX3)
    );

endmodule