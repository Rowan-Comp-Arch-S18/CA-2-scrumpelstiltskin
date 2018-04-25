module keyboard(address, PS2_data, PS2_clk, system_clk, data, reset);

    input [13:0]address;
    input PS2_data;
    input PS2_clk;
    input system_clk;
    input reset;

    parameter VRAM_ADDRESS = 14'h3fff;
    output [63:0] data;
    assign data = (address==VRAM_ADDRESS ? out : 14'bz);

    character_buffer_32 char_buffer (
        .PS2_data(PS2_data),
        .PS2_clk(PS2_clk),
        .system_clk(system_clk),
        .read(1'b1),
    );
endmodule
