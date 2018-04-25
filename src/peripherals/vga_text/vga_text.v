module vga_text(address, data, read, write, red_out, green_out, blue_out, h_sync, v_sync, clock, reset, led);

    // CHANGE THESE
    parameter VRAM_START_ADDRESS = 63'h30002;
    parameter VRAM_BYTES = 13'd7200;
    parameter FG_ADDRESS = 63'h30001;
    parameter BG_ADDRESS = 63'h30000;

    input [63:0] address;
    input read, write;
    input clock, reset;

    input [63:0] data;

    output [9:0] led;

    output [3:0] red_out, green_out, blue_out;
    output h_sync, v_sync;

    wire vram_detect = address >= VRAM_START_ADDRESS && address <= VRAM_START_ADDRESS + VRAM_BYTES ? 1'b1 : 1'b0;
    wire fg_detect = address == FG_ADDRESS ? 1'b1 : 1'b0;
    wire bg_detect = address == BG_ADDRESS ? 1'b1 : 1'b0;

    reg [11:0] fg_color;

    always @ (posedge clock) begin
        if (reset) begin
            fg_color <= 12'hFFF;
        end else if (fg_detect & write) begin
            fg_color <= data[11:0];
        end
    end

    reg [11:0] bg_color;

    always @ (posedge clock) begin
        if (reset) begin
            bg_color <= 12'h000;
        end else if (bg_detect & write) begin
            bg_color <= data[11:0];
        end
    end

    wire [10:0] vga_hpos;
    wire [9:0] vga_vpos;

    wire [12:0] vga_address;
    assign vga_address = vga_hpos[10:3] + vga_vpos[9:3]*80;

    wire [7:0] vga_character;

    assign led[7:0] = vga_character[7:0];
    assign led[9] = vram_detect;
    assign led[8] = write;

    wire vga_pixel;

    wire [7:0] vram_out;

    vram vram(
        .address({63{vram_detect}} & (address - VRAM_START_ADDRESS)),
        .in(data[11:0]),
        .write(vram_detect & write),
        .out(vram_out),
        .address2({51'b0, vga_address}),
        .write2(1'b0),
        .out2(vga_character),
        .clock(clock)
    );

    wire [11:0] vga_colors;
    assign vga_colors = vga_pixel ? fg_color : bg_color;

    vga vga(
        .h_position(vga_hpos),
        .v_position(vga_vpos),
        .red_in(vga_colors[3:0]),
        .green_in(vga_colors[7:4]),
        .blue_in(vga_colors[11:8]),
        .red_out(red_out),
        .green_out(green_out),
        .blue_out(blue_out),
        .h_sync_out(h_sync),
        .v_sync_out(v_sync),
        .clk(clock)
    );

    character_lookup lookup(
        .character(vga_character),
        .h_position(vga_hpos[2:0]),
        .v_position(vga_vpos[2:0]),
        .pixel(vga_pixel)
    );

endmodule

