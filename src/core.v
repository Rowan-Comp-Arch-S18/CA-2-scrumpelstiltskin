module core(clock, reset, ps_kbdata, ps_kbclock, vga_red_out, vga_green_out, vga_blue_out, vga_h_sync, vga_v_sync, vga_clock,    data_bus, address_bus, read, write, program_count, r0, r1, r2, r3,r4, r5, r6, r7, instruction, HEX0, HEX1, HEX2, HEX3);

    input clock, reset;

    input vga_clock;

    input ps_kbdata, ps_kbclock;

    output [3:0] vga_red_out, vga_green_out, vga_blue_out;
    output vga_h_sync, vga_v_sync;

    output [6:0] HEX0, HEX1, HEX2, HEX3;

    wire [63:0] constant;
    wire [30:0] controlword;
    wire [4:0] status;
    output [63:0] program_count;
    output [31:0] instruction;

    output [63:0] data_bus;
    output [63:0] address_bus;

    output read, write;

    output [15:0] r0, r1, r2, r3, r4, r5, r6, r7;

    datapath datapath(
        .controlword(controlword),
        .immediate(constant),
        .status(status),
        .program_count(program_count),
        .data_bus(data_bus),
        .address_bus(address_bus),
        .read(read), .write(write),
        .clock(clock),
        .reset(reset),
        .r0(r0),
        .r1(r1),
        .r2(r2),
        .r3(r3),
        .r4(r4),
        .r5(r5),
        .r6(r6),
        .r7(r7)
    );

    controlunit controlunit(
        .controlword(controlword),
        .constant(constant),
        .status(status),
        .instruction(instruction),
        .clock(clock),
        .reset(reset)
    );

    rom_case rom(
        .address(program_count >> 2),
        .out(instruction)
    );

    vga_text vga_text(
        .address(address_bus),
        .data(data_bus),
        .read(read),
        .write(write),
        .red_out(vga_red_out),
        .green_out(vga_green_out),
        .blue_out(vga_blue_out),
        .h_sync(vga_h_sync),
        .v_sync(vga_v_sync),
        .clock(clock),
        .vga_clock(vga_clock),
        .reset(reset)
    );
    keyboard keyboard(
        .address(address_bus),
        .PS2_data(ps_kbdata),
        .PS2_clk(ps_kbclock),
        .system_clk(clock),
        .data(data_bus),
        .reset(reset),
        .read(read)
    );

     seven_seg_perpherial seven_seg(
        .data(data_bus), 
        .address(address_bus), 
        .read(read), 
        .write(write), 
        .reset(reset), 
        .clock(clock), 
        .HEX0(HEX0), 
        .HEX1(HEX1), 
        .HEX2(HEX2), 
        .HEX3(HEX3)
    );

endmodule

