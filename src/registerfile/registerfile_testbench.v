module registerfile_testbench();
    reg [4:0] select_a, select_b, address;
    reg [63:0] data_in;
    reg write, reset, clock;

    wire [63:0] out_a, out_b;

    registerfile reg_file (out_a, out_b, select_a, select_b, data_in, address, write, reset, clock);

    initial begin
        clock <= 1'b0;
        reset <= 1'b0;
        data_in <= 64'b0;
        write <= 1'b1;
        address <= 5'd0;
        select_a <= 5'd0;
        select_b <= 5'd0;
        #5
        reset <= 1'b0;
        #95
        $stop;
    end

    always begin
        #5
        clock <= ~clock;
    end

    always begin
        data_in <= {$random, $random};
        #10
        address <= 5'b1;
        select_b <= 5'b1;
        data_in <= {$random, $random};
    end
endmodule


