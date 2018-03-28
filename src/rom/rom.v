module rom_case(out, address);
    output reg [31:0] out;
    input [15:0] address;
    always @ (address) begin
        case (address)
            16'h0000: out = 32'h91002841;                         // ADDI X1, R2, 10
            16'h0001: out = 32'hF8001061;                         // STUR X1, [R3, 1]
            16'h0002: out = 32'hF84013E9;                         // LDUR X9, [XZR, 1]
            16'h0003: out = 32'hD360442C;                         // LSL X12, X1, 17
            16'h0004: out = 32'h910003E7;                         // ADDI X7, XZR, 0
            16'h0005: out = 32'hF100C8FF;                         // SUBIS XZR, X7, 50
            16'h0006: out = 32'h54000082;                         // B.GS 4
            16'h0007: out = 32'hF84000F7;                         // LDUR X23, [X7, 0]
            16'h0008: out = 32'b11111000000000110010000011110111; // STUR X23, [X7, 50]
            16'h0009: out = 32'b10010001000000000000010011100111; // ADDI X7, X7, 1
            16'h000a: out = 32'b00010100000000000000011111111010; // B -6
            default: out = 32'hD60003E0;                          // BR XZR            
        endcase
    end
end

