module keyboard_testbench();

    reg [120:0] message;
    reg [13:0]address;
    reg PS2_data;
    reg PS2_clk;
    reg system_clk;
    reg reset;

    wire [63:0] data;

    reg [7:0] PS2_count;

    keyboard dut00(address, PS2_data, PS2_clk, system_clk, data, reset, 1'b1);

    initial begin
        address <= 14'h2500;
        reset <= 1'b0;
        system_clk <= 1'b1;
        PS2_count <= 8'd0;
        PS2_clk <= 1'b1;
        PS2_data <= 1'bx;
        // HELLO_WORLD1
        //message <= 132'b0_0011_0011_0_1_0_0010_0100_0_1_0_0100_1011_0_1_0_0100_1011_0_1_0_0100_0100_0_1_0_0010_1001_1_1_0_0001_1101_1_1_0_0100_0100_0_1_0_0010_1101_0_1_0_0100_1011_0_1_0_0010_0011_1_1_0_0001_0110_1_1;
        message <= 132'b0_1100_1100_0_1_0_0010_0100_0_1_0_1101_0010_0_1_0_1101_0010_0_1_0_1001_0100_1_1_0_1011_1000_1_1_0_0010_0010_0_1_0_1011_0100_0_1_0_1101_0010_0_1_0_1101_0100_1_1_0_0110_1000_1_1;
        //message <= 11'b0_1100_1100_0_1;
        
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
          #20000
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
        PS2_data <= message[120-PS2_count];
        PS2_count <= PS2_count + 8'd1;
    end

endmodule
