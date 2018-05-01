module character_lookup(character, h_position, v_position, pixel);
    input [7:0] character;
    input [2:0] h_position;
    input [2:0] v_position;

    output pixel;

    reg [63:0] character_data;

    assign pixel = character_data[7-h_position + v_position*8];

    always @ (character) begin
        case (character)
            8'd0: begin
                character_data[07:00] <= 8'b10100000;
                character_data[15:08] <= 8'b11100000;
                character_data[23:16] <= 8'b10100000;
                character_data[31:24] <= 8'b00101000;
                character_data[39:32] <= 8'b00101000;
                character_data[47:40] <= 8'b00010100;
                character_data[55:48] <= 8'b00000100;
                character_data[63:56] <= 8'b00000111;
            end

            8'd32: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00000000;
                character_data[23:16] <= 8'b00000000;
                character_data[31:24] <= 8'b00000000;
                character_data[39:32] <= 8'b00000000;
                character_data[47:40] <= 8'b00000000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd33: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00100000;
                character_data[23:16] <= 8'b00100000;
                character_data[31:24] <= 8'b00100000;
                character_data[39:32] <= 8'b00000000;
                character_data[47:40] <= 8'b00100000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd34: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00101000;
                character_data[23:16] <= 8'b00101000;
                character_data[31:24] <= 8'b00000000;
                character_data[39:32] <= 8'b00000000;
                character_data[47:40] <= 8'b00000000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd35: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00101000;
                character_data[23:16] <= 8'b01111100;
                character_data[31:24] <= 8'b00101000;
                character_data[39:32] <= 8'b01111100;
                character_data[47:40] <= 8'b00101000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd36: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00111100;
                character_data[23:16] <= 8'b01010000;
                character_data[31:24] <= 8'b00111000;
                character_data[39:32] <= 8'b00010100;
                character_data[47:40] <= 8'b00111000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd37: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b01000100;
                character_data[23:16] <= 8'b00001000;
                character_data[31:24] <= 8'b00010000;
                character_data[39:32] <= 8'b00100000;
                character_data[47:40] <= 8'b01000100;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd38: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00110000;
                character_data[23:16] <= 8'b01000000;
                character_data[31:24] <= 8'b00110000;
                character_data[39:32] <= 8'b01001100;
                character_data[47:40] <= 8'b00111000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd39: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00010000;
                character_data[23:16] <= 8'b00010000;
                character_data[31:24] <= 8'b00000000;
                character_data[39:32] <= 8'b00000000;
                character_data[47:40] <= 8'b00000000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd40: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00010000;
                character_data[23:16] <= 8'b00100000;
                character_data[31:24] <= 8'b00100000;
                character_data[39:32] <= 8'b00100000;
                character_data[47:40] <= 8'b00010000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd41: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00100000;
                character_data[23:16] <= 8'b00010000;
                character_data[31:24] <= 8'b00010000;
                character_data[39:32] <= 8'b00010000;
                character_data[47:40] <= 8'b00100000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd42: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00101000;
                character_data[23:16] <= 8'b00010000;
                character_data[31:24] <= 8'b00101000;
                character_data[39:32] <= 8'b00000000;
                character_data[47:40] <= 8'b00000000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd43: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00000000;
                character_data[23:16] <= 8'b00010000;
                character_data[31:24] <= 8'b00111000;
                character_data[39:32] <= 8'b00010000;
                character_data[47:40] <= 8'b000-0000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd44: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00000000;
                character_data[23:16] <= 8'b00000000;
                character_data[31:24] <= 8'b00000000;
                character_data[39:32] <= 8'b00000000;
                character_data[47:40] <= 8'b00100000;
                character_data[55:48] <= 8'b00100000;
                character_data[63:56] <= 8'b01000000;
            end

            8'd45: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00000000;
                character_data[23:16] <= 8'b00000000;
                character_data[31:24] <= 8'b00111000;
                character_data[39:32] <= 8'b00000000;
                character_data[47:40] <= 8'b00000000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd46: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00000000;
                character_data[23:16] <= 8'b00000000;
                character_data[31:24] <= 8'b00000000;
                character_data[39:32] <= 8'b00000000;
                character_data[47:40] <= 8'b00100000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd47: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00000100;
                character_data[23:16] <= 8'b00001000;
                character_data[31:24] <= 8'b00010000;
                character_data[39:32] <= 8'b00100000;
                character_data[47:40] <= 8'b01000000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd48: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00111000;
                character_data[23:16] <= 8'b01000100;
                character_data[31:24] <= 8'b01010100;
                character_data[39:32] <= 8'b01000100;
                character_data[47:40] <= 8'b00111000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd49: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00110000;
                character_data[23:16] <= 8'b01010000;
                character_data[31:24] <= 8'b00010000;
                character_data[39:32] <= 8'b00010000;
                character_data[47:40] <= 8'b01111100;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd50: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00111000;
                character_data[23:16] <= 8'b01000100;
                character_data[31:24] <= 8'b00011000;
                character_data[39:32] <= 8'b00100000;
                character_data[47:40] <= 8'b01111100;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd51: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b01110000;
                character_data[23:16] <= 8'b00001000;
                character_data[31:24] <= 8'b00110000;
                character_data[39:32] <= 8'b00001000;
                character_data[47:40] <= 8'b01110000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd52: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b01000100;
                character_data[23:16] <= 8'b01000100;
                character_data[31:24] <= 8'b01111100;
                character_data[39:32] <= 8'b00000100;
                character_data[47:40] <= 8'b00000100;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd53: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b01111100;
                character_data[23:16] <= 8'b01000000;
                character_data[31:24] <= 8'b01111000;
                character_data[39:32] <= 8'b00000100;
                character_data[47:40] <= 8'b01111000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd54: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00111000;
                character_data[23:16] <= 8'b01000000;
                character_data[31:24] <= 8'b01111000;
                character_data[39:32] <= 8'b01000100;
                character_data[47:40] <= 8'b00111000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd55: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b01111100;
                character_data[23:16] <= 8'b00001000;
                character_data[31:24] <= 8'b00010000;
                character_data[39:32] <= 8'b00010000;
                character_data[47:40] <= 8'b00010000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd56: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00111000;
                character_data[23:16] <= 8'b01000100;
                character_data[31:24] <= 8'b00111000;
                character_data[39:32] <= 8'b01000100;
                character_data[47:40] <= 8'b00111000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd57: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00111000;
                character_data[23:16] <= 8'b01000100;
                character_data[31:24] <= 8'b00111100;
                character_data[39:32] <= 8'b00000100;
                character_data[47:40] <= 8'b00111000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd58: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00000000;
                character_data[23:16] <= 8'b00010000;
                character_data[31:24] <= 8'b00000000;
                character_data[39:32] <= 8'b00010000;
                character_data[47:40] <= 8'b00000000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd59: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00000000;
                character_data[23:16] <= 8'b00010000;
                character_data[31:24] <= 8'b00000000;
                character_data[39:32] <= 8'b00010000;
                character_data[47:40] <= 8'b00010000;
                character_data[55:48] <= 8'b00100000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd60: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00001000;
                character_data[23:16] <= 8'b00110000;
                character_data[31:24] <= 8'b01000000;
                character_data[39:32] <= 8'b00110000;
                character_data[47:40] <= 8'b00001000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd61: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00000000;
                character_data[23:16] <= 8'b01111100;
                character_data[31:24] <= 8'b00000000;
                character_data[39:32] <= 8'b01111100;
                character_data[47:40] <= 8'b00000000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd62: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b01000000;
                character_data[23:16] <= 8'b00110000;
                character_data[31:24] <= 8'b00001000;
                character_data[39:32] <= 8'b00110000;
                character_data[47:40] <= 8'b01000000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd63: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00110000;
                character_data[23:16] <= 8'b01001000;
                character_data[31:24] <= 8'b00010000;
                character_data[39:32] <= 8'b00000000;
                character_data[47:40] <= 8'b00010000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd64: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00111000;
                character_data[23:16] <= 8'b01000100;
                character_data[31:24] <= 8'b01011100;
                character_data[39:32] <= 8'b01010100;
                character_data[47:40] <= 8'b01011100;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd65: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00111000;
                character_data[23:16] <= 8'b01000100;
                character_data[31:24] <= 8'b01111100;
                character_data[39:32] <= 8'b01000100;
                character_data[47:40] <= 8'b01000100;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd66: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b01110000;
                character_data[23:16] <= 8'b01000100;
                character_data[31:24] <= 8'b01111000;
                character_data[39:32] <= 8'b01000100;
                character_data[47:40] <= 8'b01111000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd67: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00111000;
                character_data[23:16] <= 8'b01000000;
                character_data[31:24] <= 8'b01000000;
                character_data[39:32] <= 8'b01000000;
                character_data[47:40] <= 8'b00111000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd68: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b01111000;
                character_data[23:16] <= 8'b01000100;
                character_data[31:24] <= 8'b01000100;
                character_data[39:32] <= 8'b01000100;
                character_data[47:40] <= 8'b01111000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd69: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b01111100;
                character_data[23:16] <= 8'b01000000;
                character_data[31:24] <= 8'b01111000;
                character_data[39:32] <= 8'b01000000;
                character_data[47:40] <= 8'b01111100;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd70: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b01111100;
                character_data[23:16] <= 8'b01000000;
                character_data[31:24] <= 8'b01111000;
                character_data[39:32] <= 8'b01000000;
                character_data[47:40] <= 8'b01000000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd71: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00111000;
                character_data[23:16] <= 8'b01000000;
                character_data[31:24] <= 8'b01011100;
                character_data[39:32] <= 8'b01000100;
                character_data[47:40] <= 8'b00111100;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd72: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b01000100;
                character_data[23:16] <= 8'b01000100;
                character_data[31:24] <= 8'b01111100;
                character_data[39:32] <= 8'b01000100;
                character_data[47:40] <= 8'b01000100;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd73: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b01111100;
                character_data[23:16] <= 8'b00010000;
                character_data[31:24] <= 8'b00010000;
                character_data[39:32] <= 8'b00010000;
                character_data[47:40] <= 8'b01111100;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd74: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00111100;
                character_data[23:16] <= 8'b00000100;
                character_data[31:24] <= 8'b00000100;
                character_data[39:32] <= 8'b01000100;
                character_data[47:40] <= 8'b00111000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd75: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b01000100;
                character_data[23:16] <= 8'b01001000;
                character_data[31:24] <= 8'b01110000;
                character_data[39:32] <= 8'b01001000;
                character_data[47:40] <= 8'b01000100;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd76: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b01000000;
                character_data[23:16] <= 8'b01000000;
                character_data[31:24] <= 8'b01000000;
                character_data[39:32] <= 8'b01000000;
                character_data[47:40] <= 8'b01111100;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd77: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00101000;
                character_data[23:16] <= 8'b01111100;
                character_data[31:24] <= 8'b01010100;
                character_data[39:32] <= 8'b01010100;
                character_data[47:40] <= 8'b01010100;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd78: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b01000100;
                character_data[23:16] <= 8'b01100100;
                character_data[31:24] <= 8'b01010100;
                character_data[39:32] <= 8'b01001100;
                character_data[47:40] <= 8'b01000100;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd79: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00111000;
                character_data[23:16] <= 8'b01000100;
                character_data[31:24] <= 8'b01000100;
                character_data[39:32] <= 8'b01000100;
                character_data[47:40] <= 8'b00111000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd80: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b01111000;
                character_data[23:16] <= 8'b01000100;
                character_data[31:24] <= 8'b01111000;
                character_data[39:32] <= 8'b01000000;
                character_data[47:40] <= 8'b01000000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd81: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00111000;
                character_data[23:16] <= 8'b01000100;
                character_data[31:24] <= 8'b01000100;
                character_data[39:32] <= 8'b01001100;
                character_data[47:40] <= 8'b00111100;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd82: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b01111000;
                character_data[23:16] <= 8'b01000100;
                character_data[31:24] <= 8'b01111000;
                character_data[39:32] <= 8'b01000100;
                character_data[47:40] <= 8'b01000100;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd83: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b00111000;
                character_data[23:16] <= 8'b01000000;
                character_data[31:24] <= 8'b00111000;
                character_data[39:32] <= 8'b00000100;
                character_data[47:40] <= 8'b00111000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd84: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b01111100;
                character_data[23:16] <= 8'b00010000;
                character_data[31:24] <= 8'b00010000;
                character_data[39:32] <= 8'b00010000;
                character_data[47:40] <= 8'b00010000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd85: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b01000100;
                character_data[23:16] <= 8'b01000100;
                character_data[31:24] <= 8'b01000100;
                character_data[39:32] <= 8'b01000100;
                character_data[47:40] <= 8'b00111000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd86: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b01000100;
                character_data[23:16] <= 8'b01000100;
                character_data[31:24] <= 8'b01000100;
                character_data[39:32] <= 8'b00101000;
                character_data[47:40] <= 8'b00010000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd87: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b01000100;
                character_data[23:16] <= 8'b01000100;
                character_data[31:24] <= 8'b01010100;
                character_data[39:32] <= 8'b01010100;
                character_data[47:40] <= 8'b00101000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd88: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b01000100;
                character_data[23:16] <= 8'b00101000;
                character_data[31:24] <= 8'b00010000;
                character_data[39:32] <= 8'b00101000;
                character_data[47:40] <= 8'b01000100;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd89: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b01000100;
                character_data[23:16] <= 8'b00101000;
                character_data[31:24] <= 8'b00010000;
                character_data[39:32] <= 8'b00010000;
                character_data[47:40] <= 8'b00010000;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            8'd90: begin
                character_data[07:00] <= 8'b00000000;
                character_data[15:08] <= 8'b01111100;
                character_data[23:16] <= 8'b00001000;
                character_data[31:24] <= 8'b00010000;
                character_data[39:32] <= 8'b00100000;
                character_data[47:40] <= 8'b01111100;
                character_data[55:48] <= 8'b00000000;
                character_data[63:56] <= 8'b00000000;
            end

            default: begin
                character_data[07:00] <= 8'b11111111;
                character_data[15:08] <= 8'b11111111;
                character_data[23:16] <= 8'b11111111;
                character_data[31:24] <= 8'b11111111;
                character_data[39:32] <= 8'b11111111;
                character_data[47:40] <= 8'b11111111;
                character_data[55:48] <= 8'b11111111;
                character_data[63:56] <= 8'b11111111;
            end
        endcase
    end
endmodule
