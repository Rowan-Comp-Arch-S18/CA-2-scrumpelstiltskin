module register_file_32_x_64_tb();
    reg [4:0] AA, AB, DA;
    reg [63:0] D;
    reg w, reset, clock;

    wire [63:0] A, B;

    register_file_32_x_64 reg_file (A, B, AA, AB, D, DA, w, reset, clock);

	initial begin
        clock <= 1'b1;
        reset <= 1'b0;
        D <= 64'b0;
        w <= 1'b1;
        DA <= 5'd0;
        AA <= 5'd0;
        AB <= 5'd0;
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
        D <= {$random, $random};
        #10
        DA <= 5'b1;
        AB <= 5'b1;
    end
endmodule

