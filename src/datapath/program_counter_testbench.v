module program_counter_testbench();

    reg [63:0] in;
    reg [1:0] ps;
    reg clock, reset;

    wire [63:0] pc;
    wire [63:0] pc4;

    program_counter prog_counter(
        .ps(ps),
        .in(in),
        .pc(pc),
        .pc4(pc4),
        .reset(reset),
        .clock(clock)
    );

    initial begin
        in <= 63'd0;
        ps <= 2'b00;
        clock <= 1'b0;
        reset <= 1'b0;

        #20;

        ps <= 2'b01;

        #20;

        in <= 63'h30;
        ps <= 2'b10;

        #20;

        in <= 63'h10;
        ps <= 63'b11;

        #20;

        $stop;

    end

    always begin
        #5 clock <= ~clock;
    end

endmodule

