module keyboard(address, PS2_data, PS2_clk, system_clk, data, reset, read);

    input [13:0] address;
    input PS2_data;
    input PS2_clk;
    input system_clk;
    input reset;
	 input read;

    parameter VRAM_ADDRESS = 14'h2500;
    output [63:0] data;

    reg [3:0] input_counter;
    reg [7:0] active_character;
    reg [7:0] character_buffer;

    reg input_error;
	 
	 wire address_detected = ((address == VRAM_ADDRESS) && read);

    assign data = address_detected ? {56'b0, active_character} : 64'bz;
function odd_pairity;
    input [7:0] in;
    odd_pairity = in[7] ^ in[6] ^ in[5] ^ in[4] ^ in[3] ^ in[2] ^ in[1] ^ in[0];
endfunction

    initial begin
        input_counter <= 4'ha;
        input_error <= 1'b0;
        active_character <= 8'h48;
        character_buffer <= 8'b0;
    end

    always @(negedge PS2_clk) begin
            if(input_counter == 4'b0) begin
                if(PS2_data != 1'b0) begin
                    input_error <= 1'b1;
                end
            end
            else if(input_counter == 4'h9) begin
                if (PS2_data != odd_pairity(character_buffer)) begin
                    input_error <= 1'b1;
                end
            end
            else if(input_counter == 4'ha) begin
                if (PS2_data != 1'b1) begin
                    input_error <= 1'b1;
                end
                else begin
                    input_counter <= 4'b0;
                    active_character <= character_buffer;
                end
            end
            else begin
                character_buffer[input_counter] <= PS2_data;
            end

            if(!input_error) begin
                input_counter <= input_counter + 4'b1;
            end
            else begin
                input_counter <= 4'b0;
                input_error <= 1'b0;
            end
            if(input_counter == 4'ha) begin
                   input_counter <= 4'b0;
                    character_buffer <= 8'b0;
            end
    end
endmodule
