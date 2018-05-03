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
        output [7:0] out;
        case(in)
            7'h45:
                out = 7'd48; // 0
            7'h16:
                out = 7'd49; // 1
            7'h1e:
                out = 7'd50; // 2
            7'h26:
                out = 7'd51; // 3
            7'h25:
                out = 7'd52; // 4
            7'h2e:
                out = 7'd53; // 5
            7'h36:
                out = 7'd54; // 6
            7'h3d:
                out = 7'd55; // 7
            7'h3e:
                out = 7'd56; // 8
            7'h46:
                out = 7'd57; // 9
            7'h1c:
                out = 7'd65; // A
            7'h32:
                out = 7'd66; // B
            7'h21:
                out = 7'd67; // C
            7'h23:
                out = 7'd68; // D
            7'h24:
                out = 7'd69; // E
            7'h2b:
                out = 7'd70; // F
            7'h34:
                out = 7'd71; // G
            7'h33:
                out = 7'd72; // H
            7'h43:
                out = 7'd73; // I
            7'h3b:
                out = 7'd74; // J
            7'h42:
                out = 7'd75; // K
            7'h4b:
                out = 7'd76; // L
            7'h3a:
                out = 7'd77; // M
            7'h31:
                out = 7'd78; // N
            7'h44:
                out = 7'd79; // O
            7'h4d:
                out = 7'd80; // P
            7'h15:
                out = 7'd81; // Q
            7'h2d:
                out = 7'd82; // R
            7'h1b:
                out = 7'd83; // S
            7'h2c:
                out = 7'd84; // T
            7'h3c:
                out = 7'd85; // U
            7'h2a:
                out = 7'd86; // V
            7'h1d:
                out = 7'd87; // W
            7'h22:
                out = 7'd88; // X
            7'h35:
                out = 7'd89; // Y
            7'h1a:
                out = 7'd90; // Z
            default:
                out = 7'd63; // ?
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
