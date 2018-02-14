module ram_testbench();
    reg [12:0] address;
    reg clock;
    reg [63:0] in;
    reg write;

    wire [63:0] out;

    ram ram (
        .address(address),
        .clock(clock),
        .in(in),
        .write(write),
        .out(out)
    );

    defparam ram.memory_words = 6000;

    initial begin
        address <= 13'd0;
        clock <= 1'b0;
        in <= 64'd0;
        write <= 1'b0;
        #10000;
        $stop;
    end

    always begin
        #5;
        clock <= ~clock;
    end

    always begin
        #10;
        in <= {$random, $random};
        address <= address + 1;
        #10;
        write <= ~write;
    end
endmodule
