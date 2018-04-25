module character_lookup(character, h_position, v_position, pixel);
    input [7:0] character;
    input [2:0] h_position;
    input [2:0] v_position;

    output pixel;

    reg [63:0] character_data;

    assign pixel = character_data[8-h_position + v_position*8];

    always @ (character) begin
        case (character)
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
