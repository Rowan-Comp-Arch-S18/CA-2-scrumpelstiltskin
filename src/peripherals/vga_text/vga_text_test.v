module vga_text_test(CLOCK_50, VGA_R, VGA_G, VGA_HS, VGA_VS, LEDG);

    input CLOCK_50;

    output [3:0] VGA_R, VGA_G;
    output VGA_HS, VGA_VS;
    output [9:0] LEDG;

    reg [63:0] data;
    reg [63:0] address;

    reg read, write, reset;

    reg [13:0] count;

//    assign LEDG[3:0] = VGA_R;
//    assign LEDG[7:4] = VGA_R;
//    assign LEDG[8] = VGA_HS;
//    assign LEDG[9] = VGA_VS;

//    assign LEDG = 10'b1111111111;

    initial begin
        write <= 1'b1;
        read <= 1'b0;
        reset <= 1'b1;
        count <= 14'd0;
    end

    always @ (posedge CLOCK_50) begin
        write <= 1'b1;
        read <= 1'b0;
        reset <= 1'b0;
        if (count < 13'd7200) begin

            address <= 63'h30002 + {50'd0, count};

            case (count)
                14'd0: data <= 8'd84;
                14'd1: data <= 8'd73;
                14'd2: data <= 8'd77;
                14'd3: data <= 8'd32;
                14'd4: data <= 8'd72;
                14'd5: data <= 8'd69;
                14'd6: data <= 8'd76;
                14'd7: data <= 8'd69;
                14'd8: data <= 8'd78;
                14'd9: data <= 8'd32;
                14'd10: data <= 8'd74;
                14'd11: data <= 8'd79;
                14'd12: data <= 8'd72;
                14'd13: data <= 8'd78;
                14'd14: data <= 8'd32;
                14'd15: data <= 8'd82;
                14'd16: data <= 8'd65;
                14'd17: data <= 8'd74;
                default: data <= 8'd32;
            endcase

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
        .reset(reset),
        .led(LEDG)
    );
endmodule

