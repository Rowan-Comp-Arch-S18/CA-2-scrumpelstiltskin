module datapath_tb ();

reg [22:0] control_word;
reg clk, reset;
reg [63:0] k;

wire [3:0] status;

datapath dut_01 (
    .control_word(control_word), .k(k), .clk(clk), .reset(reset),   // inputs
    .status(status)                                                 // outputs
);

initial begin
    clk <= 1'b1;
    reset <= 1'b0;
    k <= 64'b0;
    control_word <= 23'b0;

    #350
    $stop;
end

always begin
    #10;
    clk <= ~clk;
    #1;
end

always @(posedge clk) begin
    control_word <= {$random};
    k <= {$random, $random};
end

endmodule
