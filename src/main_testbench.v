
// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module main_testbench();

    reg clock;

    main main(
        .CLOCK_50(clock)
    );

    initial begin
        clock <= 1'b0;
        #10000
        $stop;
    end

    always begin
        clock <= ~clock;
    end

endmodule


