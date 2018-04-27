module datapath(controlword, immediate, clock, reset, status, program_count, data_bus, address_bus, read, write, r0, r1, r2, r3, r4, r5, r6, r7);

    parameter RAM_UPPER_ADDRESS = 63'd5000;

    // Control Word includes:
    // [1] Databus ALU Enable
    // [1] ALU B Select
    // [5] ALU Function Select
    // [1] Databus Register File B Enable
    // [5] Register File Select A
    // [5] Register File Select B
    // [5] Register File Write Address
    // [1] Register File Write
    // [1] Databus RAM Enable
    // [1] RAM Write
    // [1] Databus Program Counter Enable
    // [2] Program Counter Function Select
    // [1] Program Counter Input Select
    // [1] Status Load
    // 31 in total

    input [30:0] controlword;
    input [63:0] immediate;
    input clock;
    input reset;

    // Register status
    output [4:0] status;
    output [63:0] program_count;
    output read, write;

    output [15:0] r0, r1, r2, r3, r4, r5, r6, r7;

    wire databus_alu_enable;
    wire alu_b_select;
    wire [4:0] alu_function_select;

    wire databus_register_file_b_enable;
    wire [4:0] register_file_select_a;
    wire [4:0] register_file_select_b;
    wire [4:0] register_file_address;
    wire register_file_write;

    wire databus_ram_enable;
    wire ram_write;

    wire databus_program_counter_enable;
    wire [1:0] program_counter_function_select;
    wire program_counter_input_select;

    wire status_load;

    assign {
        databus_alu_enable,
        alu_b_select,
        alu_function_select,
        databus_register_file_b_enable,
        register_file_select_a,
        register_file_select_b,
        register_file_address,
        register_file_write,
        databus_ram_enable,
        ram_write,
        databus_program_counter_enable,
        program_counter_function_select,
        program_counter_input_select,
        status_load
    } = controlword;

    assign write = ram_write;
    assign read = databus_ram_enable;

    inout [63:0] data_bus;
    output [63:0] address_bus;

    wire [63:0] register_file_out_a;
    wire [63:0] register_file_out_b;

    wire [63:0] alu_in_a;
    wire [63:0] alu_in_b;

    registerfile registerfile (
        .out_a(register_file_out_a),
        .out_b(register_file_out_b),
        .select_a(register_file_select_a),
        .select_b(register_file_select_b),
        .data_in(data_bus),
        .address(register_file_address),
        .write(register_file_write),
        .reset(reset),
        .clock(clock),
        .r0(r0),
        .r1(r1),
        .r2(r2),
        .r3(r3),
        .r4(r4),
        .r5(r5),
        .r6(r6),
        .r7(r7)
    );

    wire [63:0] alu_out;
    wire [3:0] alu_status;

    assign alu_in_a = register_file_out_a;
    assign alu_in_b = alu_b_select == 1'b1 ? immediate : register_file_out_b;

    alu alu (
        .a(alu_in_a),
        .b(alu_in_b),
        .function_select(alu_function_select),
        .cin(alu_function_select[1]),
        .f(alu_out),
        .status(alu_status)
    );

    assign address_bus = alu_out;

    reg [3:0] status_register;

    always @ (posedge clock or posedge reset) begin
        if (reset) begin
            status_register <= 4'b0;
        end else if (status_load) begin
            status_register <= alu_status;
        end
    end

    assign status = {status_register, alu_status[0]};

    wire [63:0] ram_out;

    wire ram_detect = address_bus <= RAM_UPPER_ADDRESS ? 1'b1 : 1'b0;

    // Invert the RAM clock so it take one cycle to read ram

    ram ram(
        .address(address_bus[12:0]),
        .clock(~clock),
        .in(data_bus),
        .out(ram_out),
        .write(ram_detect && ram_write)
    );

    wire [63:0] program_counter_in;
    wire [63:0] program_counter_out;
    wire [63:0] program_counter_out_next;

    assign program_counter_in = program_counter_input_select ? immediate : register_file_out_a;

    program_counter pc(
        .ps(program_counter_function_select),
        .in(program_counter_in),
        .pc(program_counter_out),
        .pc4(program_counter_out_next),
        .reset(reset),
        .clock(clock)
    );

    assign program_count = program_counter_out;

    assign data_bus = databus_alu_enable ? alu_out : 64'bz;
    assign data_bus = databus_register_file_b_enable ? register_file_out_b : 64'bz;
    assign data_bus = (databus_ram_enable && ram_detect) ? ram_out : 64'bz;
    assign data_bus = databus_program_counter_enable ? program_counter_out_next : 64'bz;

endmodule

