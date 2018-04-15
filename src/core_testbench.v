module core_testbench();

    wire clock, reset;

    core core(
        .clock(clock),
        .reset(reset)
    );

    initial begin
        reset <= 1'b1;
        clock <= 1'b0;

        #20;

        reset <= 1'b0;

        #10000;

        $stop;
    end

    always begin
        #5 clock <= ~clock;
    end
endmodule
