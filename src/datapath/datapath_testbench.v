module datapath_testbench();

    reg [30:0] controlword;
    reg [63:0] immediate;
    reg clock;
    reg reset;

    wire [3:0] status;
    wire [63:0] program_count;

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

    datapath datapath(
        .controlword(controlword),
        .immediate(immediate),
        .clock(clock),
        .reset(reset),
        .status(status),
        .program_count(program_count)
    );

    initial begin
        controlword <= 31'd0;
        immediate <= 64'd0;
        clock <= 1'b0;
        reset <= 1'b1;

        #10;

        reset <= 1'b0;

        // Load 5 into register 3
        controlword <= { 1'b1, 1'b1, 5'b00100, 1'b0, 5'd31, 5'd3, 5'd3, 1'b1, 1'b0, 1'b0, 1'b0, 2'b01, 1'b0, 1'b0 };
        immediate <= 64'd5;

        #10;

        // Load 21 into register 4
        controlword <= { 1'b1, 1'b1, 5'b00100, 1'b0, 5'd31, 5'd4, 5'd4, 1'b1, 1'b0, 1'b0, 1'b0, 2'b01, 1'b0, 1'b0 };
        immediate <= 64'd21;

        #10;

        // Show register 3 on out A and register 4 on out B
        controlword <= { 1'b0, 1'b0, 5'b00000, 1'b0, 5'd3, 5'd4, 5'd0, 1'b0, 1'b0, 1'b0, 1'b0, 2'b01, 1'b0, 1'b0 };
        immediate <= 64'd21;

        #10;

        // Load register 3 into address 21 in RAM
        controlword <= { 1'b1, 1'b1, 5'b00100, 1'b0, 5'd4, 5'd3, 5'd0, 1'b0, 1'b0, 1'b1, 1'b0, 2'b01, 1'b0, 1'b0 };
        immediate <= 64'd0;

        #10;

        // Read address 21 in RAM into register 5
        controlword <= { 1'b0, 1'b1, 5'b00100, 1'b0, 5'd4, 5'd3, 5'd0, 1'b0, 1'b1, 1'b0, 1'b0, 2'b01, 1'b0, 1'b0 };
        immediate <= 64'd0;

        #20;

        $stop;
    end

    always begin
        #5;
        clock <= ~clock;
    end

endmodule

