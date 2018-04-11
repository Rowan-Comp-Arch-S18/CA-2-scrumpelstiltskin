module pc_tb();

    reg [63:0] in;
    reg [1:0] ps;
    reg clock, reset;

    wire [63:0] pc, pc4;

    initial begin
        clock <= 1'b1;
        reset <= 1'b1;
        ps <= 2'b0;
        in <= 64'b0;

        #100;
        $stop;
    end

    always begin
        in <= {$random, $random};
        #10;
        ps <= ps + 2'b1;
        #1;
    end

endmodule
