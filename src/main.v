module main(CLOCK_50, VGA_R, VGA_G, VGA_B, VGA_HS, VGA_VS, BUTTON, LEDG, GPIO0_D, GPIO1_D, HEX0, HEX1, HEX2);

    input CLOCK_50;
    input [2:0] BUTTON;

    output [9:0] LEDG;
    output [3:0] VGA_R, VGA_G, VGA_B;
    output VGA_HS, VGA_VS;

    output [6:0] HEX0, HEX1, HEX2;

    output [31:0] GPIO0_D;
    inout [31:0] GPIO1_D;

    assign LEDG[3:0] = VGA_R;
    assign LEDG[7:4] = VGA_G;
    assign LEDG[8] = VGA_HS;
    assign LEDG[9] = BUTTON[0];

    wire core_clock;

    pll pll(CLOCK_50, core_clock);
    //assign core_clock = ~BUTTON[2];
    //assign core_clock = CLOCK_50;

    wire [15:0] r0, r1, r2, r3, r4, r5, r6, r7;
    wire [63:0] data_bus;
    wire [63:0] address_bus;
    wire read, write;
    wire [63:0] program_count;
    wire [31:0] instruction;

    core core(
        .clock(core_clock),
        .reset(~BUTTON[0]),
        .vga_red_out(VGA_R),
        .vga_green_out(VGA_G),
        .vga_blue_out(VGA_B),
        .vga_h_sync(VGA_HS),
        .vga_v_sync(VGA_VS),
        .vga_clock(CLOCK_50),
        .data_bus(data_bus),
        .address_bus(address_bus),
        .read(read),
        .write(write),
        .program_count(program_count),
        .instruction(instruction),
        .r0(r0),
        .r1(r1),
        .r2(r2),
        .r3(r3),
        .r4(r4),
        .r5(r5),
        .r6(r6),
        .r7(r7)
    );

    wire [6:0] data_hex0, data_hex1, data_hex2, data_hex3;
    wire [6:0] address_hex0, address_hex1, address_hex2, address_hex3;
    wire [6:0] program_counter_hex0, program_counter_hex1, program_counter_hex2, program_counter_hex3;

    quad_7seg_decoder data_decoder(
        .in(data_bus[15:0]),
        .hex0(data_hex0),
        .hex1(data_hex1),
        .hex2(data_hex2),
        .hex3(data_hex3)
    );

    quad_7seg_decoder address_decoder(
        .in(address_bus[15:0]),
        .hex0(address_hex0),
        .hex1(address_hex1),
        .hex2(address_hex2),
        .hex3(address_hex3)
    );

    quad_7seg_decoder program_counter_decoder(
        .in(program_count[15:0]),
        .hex0(program_counter_hex0),
        .hex1(program_counter_hex1),
        .hex2(program_counter_hex2),
        .hex3(program_counter_hex3)
    );

    assign HEX0 = ~program_counter_hex0;
    assign HEX1 = ~program_counter_hex1;
    assign HEX2 = ~program_counter_hex2;
    assign HEX3 = ~program_counter_hex3;

    GPIO_Board gpio(
        .clock_50(CLOCK_50),
        .R0(r0),
        .R1(r1),
        .R2(r2),
        .R3(r3),
        .R4(r4),
        .R5(r5),
        .R6(r6),
        .R7(r7),
        .HEX0(data_hex0),
        .HEX1(data_hex1),
        .HEX2(data_hex2),
        .HEX3(data_hex3),
        .HEX4(address_hex0),
        .HEX5(address_hex1),
        .HEX6(address_hex2),
        .HEX7(address_hex3),
        .LEDS(instruction),
        .GPIO_0(GPIO0_D),
        .GPIO_1(GPIO1_D)
    );

endmodule

