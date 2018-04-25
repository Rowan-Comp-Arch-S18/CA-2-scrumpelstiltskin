module vga_text_testbench();

    reg CLOCK_50;

    wire [3:0] VGA_R, VGA_G;
    wire VGA_HS, VGA_VS;

    reg [63:0] data;
    reg [63:0] address;

    reg read, write, reset;

    reg [13:0] count;

    initial begin
        write <= 1'b1;
        read <= 1'b0;
        reset <= 1'b1;
        count <= 14'd0;
        CLOCK_50 <= 1'b0;
        #1000000 $stop;
    end

    always begin
        #5 CLOCK_50 <= ~CLOCK_50;
    end

    always @ (posedge CLOCK_50) begin
        reset <= 1'b0;
        if (count < 13'd7200) begin
            address <= 63'h30002 + {50'd0, count};
            data <= 8'd84;
            count <= count + 1'd1;
        end
    end

    vga_text vgatext(
        .address(address),
        .data(data),
        .read(read),
        .write(write),
        .red_out(VGA_R),
        .green_out(VGA_G),
        .h_sync(VGA_HS),
        .v_sync(VGA_VS),
        .clock(CLOCK_50),
        .reset(reset)
    );

endmodule

