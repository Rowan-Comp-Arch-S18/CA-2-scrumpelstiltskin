module datapath_testbench();

    reg [24:0] controlword;
    reg [63:0] immediate;
    reg clock;
    reg reset;

    wire [3:0] status;

    // Control Word includes:
    // [1] Databus ALU Enable
    // [1] ALU B Select
    // [5] ALU Function Select
    // [5] Register File Select A
    // [5] Register File Select B
    // [5] Register File Write Address
    // [1] Register File Write
    // [1] Databus RAM Enable
    // [1] RAM Write
    // 25 in total

    datapath datapath(
        .controlword(controlword),
        .immediate(immediate),
        .clock(clock),
        .reset(reset),
        .status(status)
    );

    initial begin
        controlword <= 25'd0;
        immediate <= 64'd0;
        clock <= 1'b0;
        reset <= 1'b1;

        #20;

        reset <= 1'b0;

        // Load 5 into register 3
        controlword <= { 1'b1, 1'b1, 5'b00100, 5'd31, 5'd3, 5'd3, 1'b1, 1'b0, 1'b0 };
        immediate <= 64'd5;

        #20;

        // Load 21 into register 4
        controlword <= { 1'b1, 1'b1, 5'b00100, 5'd31, 5'd4, 5'd4, 1'b1, 1'b0, 1'b0 };
        immediate <= 64'd21;

        #20;

        // Show register 3 on out A and register 4 on out B
        controlword <= { 1'b0, 1'b0, 5'b00000, 5'd3, 5'd4, 5'd0, 1'b0, 1'b0, 1'b0 };
        immediate <= 64'd21;

        #20;

        // Load register 3 into address 21 in RAM
        controlword <= { 1'b1, 1'b1, 5'b00100, 5'd4, 5'd3, 5'd0, 1'b0, 1'b0, 1'b1 };
        immediate <= 64'd0;

        #20;

        // Read address 21 in RAM into register 5
        controlword <= { 1'b0, 1'b1, 5'b00100, 5'd4, 5'd3, 5'd0, 1'b0, 1'b1, 1'b0 };
        immediate <= 64'd0;

        #20;

        $stop;
    end

    always begin
        #5;
        clock <= ~clock;
    end

endmodule

