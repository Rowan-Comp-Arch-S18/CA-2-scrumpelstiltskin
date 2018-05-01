module keyboard_testbench();

    parameter message = 96'h48_65_6c_6c_6f_20_57_6f_72_6c_64_21;
    reg [6:0] message_counter;
    reg [13:0]address;
    reg PS2_data;
    reg PS2_clk;
    reg system_clk;
    reg reset;

    parameter VRAM_ADDRESS = 14'h3fff;
    wire [63:0] data;

    keyboard dut00(address, PS2_data, PS2_clk, system_clk, data, reset);

    initial begin
        message_counter <= 7'b0;
        address <= 14'h3fff;
        reset <= 1'b0;
        system_clk <= 1'b1;
        PS2_clk <= 1'b0;
        PS2_clk <= 1'b0;

    end

    always begin
        #5
        system_clk <= ~system_clk;
    end

    always begin
        #10
        PS2_clk <= ~PS2_clk;
    end

    always begin

        message_counter <= 7'b0;
        #20
        PS2_data <= 1'b0;

        #20
        PS2_data <= message[message_counter];
        message_counter <= message_counter + 7'b1;
        #20
        PS2_data <= message[message_counter];
        message_counter <= message_counter + 7'b1;
        #20
        PS2_data <= message[message_counter];
        message_counter <= message_counter + 7'b1;
        #20
        PS2_data <= message[message_counter];
        message_counter <= message_counter + 7'b1;
        #20
        PS2_data <= message[message_counter];
        message_counter <= message_counter + 7'b1;
        #20
        PS2_data <= message[message_counter];
        message_counter <= message_counter + 7'b1;
        #20
        PS2_data <= message[message_counter];
        message_counter <= message_counter + 7'b1;
        #20
        PS2_data <= message[message_counter];
        message_counter <= message_counter + 7'b1;

        #20
        PS2_data <= odd_pairity(message[message_counter:message_counter-7]);

        #20
        PS2_data <= 1'b1;

    end

function odd_pairity;
    input [7:0] in;
    odd_pairity = in[7] ^ in[6] ^ in[5] ^ in[4] ^ in[3] ^ in[2] ^ in[1] ^ in[0];
endfunction

endmodule
