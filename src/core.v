module core(clock, reset);

    input clock, reset;

    wire [63:0] constant;
    wire [30:0] controlword;
    wire [4:0] status;
    wire [63:0] program_count;
    wire [31:0] instruction;

    datapath datapath(
        .controlword(controlword),
        .immediate(constant),
        .status(status),
        .program_count(program_count),
        .clock(clock),
        .reset(reset)
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

endmodule

