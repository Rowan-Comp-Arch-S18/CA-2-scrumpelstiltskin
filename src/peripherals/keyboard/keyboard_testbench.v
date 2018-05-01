module keyboard_testbench();

    reg [13:0]address;
    reg PS2_data;
    reg PS2_clk;
    reg system_clk;
    reg reset;
	 reg read;

    parameter VRAM_ADDRESS = 14'h3fff;
    wire [63:0] data;

    keyboard dut00(address, PS2_data, PS2_clk, system_clk, data, reset, read);

    initial begin
        address <= 14'h3fff;
        reset <= 1'b0;
        system_clk <= 1'b1;
        PS2_clk <= 1'b0;
        PS2_clk <= 1'b0;
		  read <= 1'b0;

        #10
        PS2_data <= 1'b0;
        #10
        PS2_data <= 1'b1;
        #10
        PS2_data <= 1'b0;
        #10
        PS2_data <= 1'b1;
        #10
        PS2_data <= 1'b0;
        #10
        PS2_data <= 1'b1;
        #10
        PS2_data <= 1'b0;
        #10
        PS2_data <= 1'b1;
        #10
        PS2_data <= 1'b0;
        #10
        PS2_data <= 1'b1;
        #10
        PS2_data <= 1'b1;

        #6
		  read<=1'b1;
		  #5
		  read<=1'b0;

        #10
        PS2_data <= 1'b0;
        #10
        PS2_data <= 1'b0;
        #10
        PS2_data <= 1'b0;
        #10
        PS2_data <= 1'b0;
        #10
        PS2_data <= 1'b0;
        #10
        PS2_data <= 1'b0;
        #10
        PS2_data <= 1'b0;
        #10
        PS2_data <= 1'b0;
        #10
        PS2_data <= 1'b0;
        #10
        PS2_data <= 1'b0;
        #10
        PS2_data <= 1'b1;
          #5
          $stop;
    end

    always begin
        #5
        system_clk <= ~system_clk;
    end

    always begin
        #10
        PS2_clk <= ~PS2_clk;
    end

endmodule
