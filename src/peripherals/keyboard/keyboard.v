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
    reg [10:0] input_buffer;

    reg input_error;

    wire address_detected = ((address == VRAM_ADDRESS) && read);

    assign data = address_detected ? {56'b0, ps2_to_ASCII(active_character)} : 64'bz;

    function ps2_to_ASCII;
        input [7:0] in;
        case(in)
            8'h29:
                ps2_to_ASCII = 8'd32; // SPACE
            8'h45:
                ps2_to_ASCII = 8'd48; // 0
            8'h16:
                ps2_to_ASCII = 8'd49; // 1
            8'h1e:
                ps2_to_ASCII = 8'd50; // 2
            8'h26:
                ps2_to_ASCII = 8'd51; // 3
            8'h25:
                ps2_to_ASCII = 8'd52; // 4
            8'h2e:
                ps2_to_ASCII = 8'd53; // 5
            8'h36:
                ps2_to_ASCII = 8'd54; // 6
            8'h3d:
                ps2_to_ASCII = 8'd55; // 7
            8'h3e:
                ps2_to_ASCII = 8'd56; // 8
            8'h46:
                ps2_to_ASCII = 8'd57; // 9
            8'h1c:
                ps2_to_ASCII = 8'd65; // A
            8'h32:
                ps2_to_ASCII = 8'd66; // B
            8'h21:
                ps2_to_ASCII = 8'd67; // C
            8'h23:
                ps2_to_ASCII = 8'd68; // D
            8'h24:
                ps2_to_ASCII = 8'd69; // E
            8'h2b:
                ps2_to_ASCII = 8'd70; // F
            8'h34:
                ps2_to_ASCII = 8'd71; // G
            8'h33:
                ps2_to_ASCII = 8'd72; // H
            8'h43:
                ps2_to_ASCII = 8'd73; // I
            8'h3b:
                ps2_to_ASCII = 8'd74; // J
            8'h42:
                ps2_to_ASCII = 8'd75; // K
            8'h4b:
                ps2_to_ASCII = 8'd76; // L
            8'h3a:
                ps2_to_ASCII = 8'd77; // M
            8'h31:
                ps2_to_ASCII = 8'd78; // N
            8'h44:
                ps2_to_ASCII = 8'd79; // O
            8'h4d:
                ps2_to_ASCII = 8'd80; // P
            8'h15:
                ps2_to_ASCII = 8'd81; // Q
            8'h2d:
                ps2_to_ASCII = 8'd82; // R
            8'h1b:
                ps2_to_ASCII = 8'd83; // S
            8'h2c:
                ps2_to_ASCII = 8'd84; // T
            8'h3c:
                ps2_to_ASCII = 8'd85; // U
            8'h2a:
                ps2_to_ASCII = 8'd86; // V
            8'h1d:
                ps2_to_ASCII = 8'd87; // W
            8'h22:
                ps2_to_ASCII = 8'd88; // X
            8'h35:
                ps2_to_ASCII = 8'd89; // Y
            8'h1a:
                ps2_to_ASCII = 8'd90; // Z
            default:
                ps2_to_ASCII = 8'd63; // ?
        endcase
    endfunction

    function odd_pairity;
        input [7:0] in;
        odd_pairity = in[7] ^ in[6] ^ in[5] ^ in[4] ^ in[3] ^ in[2] ^ in[1] ^ in[0];
    endfunction

    initial begin
        input_counter <= 4'h0;
        input_error <= 1'b0;
        active_character <= 8'h48;
        character_buffer <= 8'b0;
    end

    always @(negedge PS2_clk) begin

        input_buffer[input_counter] <= PS2_data;

        if (input_counter >= 4'd10) begin
            input_counter <= 4'd0;
            active_character <= input_buffer[8:1];
        end else begin
            input_counter <= input_counter + 4'd1;
        end

        /*
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
            //input_counter <= input_counter + 4'b1;
        end
        else begin
            //input_counter <= 4'b0;
            input_error <= 1'b0;
        end
        if(input_counter == 4'ha) begin
               input_counter <= 4'b0;
                character_buffer <= 8'b0;
        end
        */
    end
endmodule
