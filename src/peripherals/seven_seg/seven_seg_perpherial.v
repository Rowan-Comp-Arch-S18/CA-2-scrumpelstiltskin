module seven_seg_perpherial(data, address, read, write, reset, clock, HEX0, HEX1, HEX2, HEX3);

    inout data;
    input address;
    input read;
    input write;
    input reset;
    input clock;
    output [6:0] HEX0, HEX1, HEX2, HEX3;

    reg [63:0] reg_value;

    always @ (posedge clock) begin
        if (reset) begin
            reg_value <= 64'd0;
        end else if (load) begin
            reg_value <= data; 
        end
    end

    wire address_detect;
    wire load_wire;
    wire en_buffer;


    parameter ADDRESS = 64'h2000; // For assigning an address

    assign address_detect = ADDRESS ? 1'b1 : 1'b0;
    assign load_wire = address_detect & write;
    assign en_buffer = address_detect & read;
    assign data = en_buffer ? reg_value : 64'bz;

    sevenHEX0 Seven_Seg(
        .in(reg_value[3:0]),
        .out(~HEX0)
    );

    sevenHEX1 Seven_Seg(
        .in(reg_value[7:4]),
        .out(~HEX1)
    );

    sevenHEX2 Seven_Seg(
        .in(reg_value[11:8]),
        .out(~HEX2)
    );

    sevenHEX3 Seven_Seg(
        .in(reg_value[15:12]),
        .out(~HEX3)
    );

endmodule