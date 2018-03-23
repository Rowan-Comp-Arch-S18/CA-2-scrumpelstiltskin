module ram_tb();

    reg [63:0] in;
    reg [12:0] address;
    reg clock, write;

    wire [63:0] out;
    wire [63:0] expected[15:0];
    ram dut1(
        .in(in), .address(address), .write(write), .clock(clock),   	// inputs
        .out(out)                                  						// outputs
    );
    initial begin
        clock <= 1'b1;
        address <= 64'b0;
        write <= 1'b1;
    end

    always begin
        #10 clock <= ~clock;
        #4 write <= ~write;
    end

    always @(posedge clock) begin;
        in <= {$random, $random};
    end

endmodule
