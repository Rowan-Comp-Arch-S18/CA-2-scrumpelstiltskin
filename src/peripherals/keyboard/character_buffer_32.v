module character_buffer_32(PS2_data, PS2_clk, system_clk, read, reset, out);
    input read;
    input system_clk;
    input r;
    output [7:0] out;

    reg [4:0] first_addr, last_addr;
    reg [7:0] input_character_buffer;
    reg [3:0] input_counter;
    reg write, err;

    character_buffer_registerfile buffer(
        .out_a(out),
        .out_b(),
        .select_a(first_addr),
        .select_b(last_addr),
        .data_in(input_buffer),
        .address(last_addr),
        .write(write),
        .reset(reset),
        .clock(system_clk)
    );

    initial begin
        input_counter <= 4'b0;
        write <= 1'b0;
        first_addr <= 5'b0;
        last_addr <= 5'b0;
    end

    always @(posedge clk or posedge reset or posedge PS2_clk or posedge read) begin
        if(!clk && !reset && !err && PS2_clk) begin
            if(input_counter == 4'b0) begin
                if(PS2_data != 1'b0)
                    err <= 4'b0;
                else begin
                    write <= 1'b0;
                    last_addr = address_select + 5'b1;
                    input_buffer <= 5'b0;
                end

            end
            else if (input_counter == 4'd10) begin
                if(PS2_data != 1'b1)
                    clear_buffer <= 1'b1;
                write <= 1'b1;
            end
            else if (input_counter == 4'd9) begin
                    err <= ~(input_character_buffer[7] ^ input_character_buffer[6] ^ input_character_buffer[5] ^ input_character_buffer[4] ^ input_character_buffer[3] ^ input_character_buffer[2] ^ input_character_buffer[1] ^ input_character_buffer[0]) == PS2_data;
            end
            else begin
                input_buffer <= input_buffer >> 1;
                input_buffer = input_buffer + {PS2_data, 9'b0};
            end
        end

        if(clear_buffer) begin
            input_counter <= 4'b0;
            write <= 1'b0;
            clear_buffer <= 1'b0;
        end

        if(read) begin
            if(first_addr == 5'b0)
                first_addr <= first_addr + 5'b1;
        end
    end

endmodule
