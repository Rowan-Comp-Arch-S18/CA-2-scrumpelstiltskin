module keyboard_testbench();

    reg [15:0] message;
    reg [13:0]address;
    reg PS2_data;
    reg PS2_clk;
    reg system_clk;
    reg reset;

    wire [63:0] data;

    reg [3:0] PS2_count;

    keyboard dut00(address, PS2_data, PS2_clk, system_clk, data, reset, 1'b1);

    initial begin
        address <= 14'h2500;
        reset <= 1'b0;
        system_clk <= 1'b1;
        PS2_count <= 8'd0;
        PS2_clk <= 1'b0;
        PS2_data <= 1'b0;
        message <= 16'b0000010000111000;
        /*
		  
		  
        // H
		  #10
        PS2_data <= 1'b0;

        #20
        PS2_data <= 1'b0;
        #20
        PS2_data <= 1'b0;
        #20
        PS2_data <= 1'b0;
        #20
        PS2_data <= 1'b0;
        #20
        PS2_data <= 1'b1;
        #20 PS2_data <= 1'b0;
        #20
        PS2_data <= 1'b0;
        #20
        PS2_data <= 1'b1;

        #20
        PS2_data <= 1'b0;

        #20
        PS2_data <= 1'b1;
		  
		  // E
		  #20
        PS2_data <= 1'b0;

        #20
        PS2_data <= 1'b1;
        #20
        PS2_data <= 1'b0;
        #20
        PS2_data <= 1'b1;
        #20
        PS2_data <= 1'b0;
        #20
        PS2_data <= 1'b0;
        #20
        PS2_data <= 1'b1;
        #20
        PS2_data <= 1'b1;
        #20
        PS2_data <= 1'b0;

        #20
        PS2_data <= 1'b0;

        #20
        PS2_data <= 1'b1;

		  #40
          */
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

    always @ (negedge PS2_clk) begin
        PS2_data <= message[PS2_count];
        PS2_count <= PS2_count + 8'd1;
    end

endmodule
