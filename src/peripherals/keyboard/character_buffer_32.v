module character_buffer_32(PS2_data, PS2_clk, system_clk, read, reset, out);
    input read;
    input system_clk;
    input PS2_clk;
    input PS2_data;
    input reset;

    output [7:0] out;

    reg [4:0] first_addr, last_addr;
    reg [7:0] input_character_buffer[7:0];
    reg [3:0] input_counter;
    reg write, err;
    
    initial begin
        input_counter <= 4'ha;
        write <= 1'b0;
        first_addr <= 5'b0;
        last_addr <= 5'b0;
		  input_character_buffer <= 8'b0;
		  err <= 1'b0;
    end

    always @(posedge system_clk or posedge reset or posedge PS2_clk or posedge read) begin
        if(PS2_clk) begin
            if(input_counter == 4'b0) begin
                if(PS2_data != 1'b0)
                    err <= 4'b0;
                else begin
                    write <= 1'b0;
                    last_addr = last_addr + 5'b1;
                    input_character_buffer <= 5'b0;
                end

            end
            else if (input_counter >= 4'ha) begin
                if(PS2_data != 1'b1) begin
                    err <= 1'b1;
                    write <= 1'b1;
                end
            end
            else if (input_counter == 4'h9) begin
                    err <= ~(input_character_buffer[7] ^ input_character_buffer[6] ^ input_character_buffer[5] ^ input_character_buffer[4] ^ input_character_buffer[3] ^ input_character_buffer[2] ^ input_character_buffer[1] ^ input_character_buffer[0]) == PS2_data;
            end
            else begin
                input_character_buffer <= input_character_buffer >> 1;
                input_character_buffer <= input_character_buffer + {PS2_data, 7'b0};
            end

			if(err) begin
					input_counter <= 4'b0;
						write <= 1'b0;
            err <= 1'b0;
			end
			else
				input_counter <= input_counter + 4'b1;

			if(read) begin
					if(first_addr == 5'b0)
						first_addr <= first_addr + 5'b1;
			end
    end
	 end

endmodule
