module rom_case(out, address);
    output reg [31:0] out;
    input [15:0] address;
    always @ (address) begin
        case (address)
            16'd0: out = 32'b11010010100001000100101000000001;
            16'd1: out = 32'b11111000010000000000000000100010;
            16'd2: out = 32'b11010010100001000000000000000011;
            16'd3: out = 32'b11111000000000000000000001100010;
            default: out = 32'hD60003E0; // BR XZR
        endcase
    end
end
/*
// Keyboard test
module rom_case(out, address);
    output reg [31:0] out;
    input [15:0] address;
    always @ (address) begin
        case (address)
            16'd0: out = 32'b11010010100001000000000000000010;
            16'd1: out = 32'b11010010100000000000001100100011;
            16'd2: out = 32'b11111000000000000000000001000011;
            default: out = 32'hD60003E0; // BR XZR
        endcase
    end
endmodule 

/*module rom_case(out, address);
    output reg [31:0] out;
    input [15:0] address;
    always @ (address) begin
        case (address)
            16'd0: out = 32'b11010010100001001010000000000000;
            16'd1: out = 32'b11010010100001100000000000000001;
            16'd2: out = 32'b11111000010000000000000000000010;
            16'd3: out = 32'b11111000000000001010000000100010;
            16'd4: out = 32'b00010111111111111111111111111101;
            default: out = 32'hD60003E0; // BR XZR
        endcase
    end
    endmodule
    */

/*
// VGA dmeo
module rom_case(out, address);
    output reg [31:0] out;
    input [15:0] address;
    always @ (address) begin
        case (address)
            16'd0: out = 32'b11010010100001100000000000011101;
            16'd1: out = 32'b11010010100001100000000001011100;
            16'd2: out = 32'b11010010100000000000000111100000;
            16'd3: out = 32'b11010010100000000000000000000001;
            16'd4: out = 32'b11010010100000000000000000000010;
            16'd5: out = 32'b11010010100000000000000000000011;
            16'd6: out = 32'b11010010100000000000000111100100;
            16'd7: out = 32'b11010010100000000000000111100101;
            16'd8: out = 32'b10101010000111000000000100101001;
            16'd9: out = 32'b11010010100000000000010000001010;
            16'd10: out = 32'b11111000000000000000000100101010;
            16'd11: out = 32'b10010001000000000000010100101001;
            16'd12: out = 32'b10010001000000000000010101001010;
            16'd13: out = 32'b11010001000000011100000101001000;
            16'd14: out = 32'b10110101111111111111111101101000;
            16'd15: out = 32'b11010010100000000000000000000111;
            16'd16: out = 32'b11010001000000000000000011101000;
            16'd17: out = 32'b10110101000000000000000011001000;
            16'd18: out = 32'b10010001000000000000010000100001;
            16'd19: out = 32'b11010001000000000000010010000100;
            16'd20: out = 32'b11010001000000000011110000101000;
            16'd21: out = 32'b10110101000000000000000000101000;
            16'd22: out = 32'b11010010100000000000000000100111;
            16'd23: out = 32'b00010100000000000000000000101000;
            16'd24: out = 32'b11010001000000000000010011101000;
            16'd25: out = 32'b10110101000000000000000011001000;
            16'd26: out = 32'b11010001000000000000010000000000;
            16'd27: out = 32'b10010001000000000000010001100011;
            16'd28: out = 32'b11010001000000000000000000001000;
            16'd29: out = 32'b10110101000000000000000000101000;
            16'd30: out = 32'b11010010100000000000000001000111;
            16'd31: out = 32'b00010100000000000000000000100000;
            16'd32: out = 32'b11010001000000000000100011101000;
            16'd33: out = 32'b10110101000000000000000011001000;
            16'd34: out = 32'b10010001000000000000010001000010;
            16'd35: out = 32'b11010001000000000000010010100101;
            16'd36: out = 32'b11010001000000000011110001001000;
            16'd37: out = 32'b10110101000000000000000000101000;
            16'd38: out = 32'b11010010100000000000000001100111;
            16'd39: out = 32'b00010100000000000000000000011000;
            16'd40: out = 32'b11010001000000000000110011101000;
            16'd41: out = 32'b10110101000000000000000011001000;
            16'd42: out = 32'b11010001000000000000010000100001;
            16'd43: out = 32'b10010001000000000000010010000100;
            16'd44: out = 32'b11010001000000000000000000101000;
            16'd45: out = 32'b10110101000000000000000000101000;
            16'd46: out = 32'b11010010100000000000000010000111;
            16'd47: out = 32'b00010100000000000000000000010000;
            16'd48: out = 32'b11010001000000000001000011101000;
            16'd49: out = 32'b10110101000000000000000011001000;
            16'd50: out = 32'b10010001000000000000010000000000;
            16'd51: out = 32'b11010001000000000000010001100011;
            16'd52: out = 32'b11010001000000000011110000001000;
            16'd53: out = 32'b10110101000000000000000000101000;
            16'd54: out = 32'b11010010100000000000000010100111;
            16'd55: out = 32'b00010100000000000000000000001000;
            16'd56: out = 32'b11010001000000000001010011101000;
            16'd57: out = 32'b10110101000000000000000011001000;
            16'd58: out = 32'b11010001000000000000010001000010;
            16'd59: out = 32'b10010001000000000000010010100101;
            16'd60: out = 32'b11010001000000000000000001001000;
            16'd61: out = 32'b10110101000000000000000000101000;
            16'd62: out = 32'b11010010100000000000000000000111;
            16'd63: out = 32'b00010100000000000000000000000000;
            16'd64: out = 32'b11010010100000000000000000000110;
            16'd65: out = 32'b10101010000000100000000011000110;
            16'd66: out = 32'b11010011011000000001000011000110;
            16'd67: out = 32'b10101010000000010000000011000110;
            16'd68: out = 32'b11010011011000000001000011000110;
            16'd69: out = 32'b10101010000000000000000011000110;
            16'd70: out = 32'b11111000000000000000001110100110;
            16'd71: out = 32'b11010010100000000000000000001111;
            16'd72: out = 32'b10101010000001010000000111101111;
            16'd73: out = 32'b11010011011000000001000111101111;
            16'd74: out = 32'b10101010000001000000000111101111;
            16'd75: out = 32'b11010011011000000001000111101111;
            16'd76: out = 32'b10101010000000110000000111101111;
            16'd77: out = 32'b11111000000000000001001110101111;
            16'd78: out = 32'b11010010100000000000000000101100;
            16'd79: out = 32'b11010011011000000100110110001100;
            16'd80: out = 32'b11010001000000000000010110001100;
            16'd81: out = 32'b10110101111111111111111111001100;
            16'd82: out = 32'b00010111111111111111111110111101;
            16'd83: out = 32'b00010111111111111111111111111111;
            default: out = 32'hD60003E0; // BR XZR
        endcase
    end
    endmodule
    */

/*
// VGA test
module rom_case(out, address);
    output reg [31:0] out;
    input [15:0] address;
    always @ (address) begin
        case (address)
            16'd0: out = 32'b11010010100001100000000000011101;
            16'd1: out = 32'b11010010100001100000000001011100;
            16'd2: out = 32'b11010010100000000000000000000000;
            16'd3: out = 32'b11010010100000000000000000000001;
            16'd4: out = 32'b11010010100000000000000000000010;
            16'd5: out = 32'b11010010100000000000000111100011;
            16'd6: out = 32'b11010010100000000000000111100100;
            16'd7: out = 32'b11010010100000000000000111100101;
            16'd8: out = 32'b10101010000111000000000011000110;
            16'd9: out = 32'b11010010100000000000000000000111;
            16'd10: out = 32'b11111000000000000000000011000111;
            16'd11: out = 32'b10010001000000000000010011000110;
            16'd12: out = 32'b10010001000000000000010011100111;
            16'd13: out = 32'b11010001000000111111110011101000;
            16'd14: out = 32'b10110101111111111111111101101000;
            16'd15: out = 32'b00010111111111111111111111111111;
            default: out = 32'hD60003E0; // BR XZR
        endcase
    end
    endmodule
    */

/*
// Clock speed test
// auto generated from http://users.rowan.edu/~haskellt8/assembler/
module rom_case(out, address);
	output reg [31:0] out;
	input  [15:0] address; // address- 16 deep memory  
	always @(address) begin
		case (address)
			// Overclock (Nice!) Test
			16'h0000:  out = 32'b11010010100000000000000000100111; // MOVZ X7, 1
			// change the shift amount to change the delay
			// if using a testbench to debug then change the shift amoun to 1
			16'h0001:  out = 32'b1101001101100000_011000_0011100111; // LSL X7, X7, 24
			16'h0002:  out = 32'b11111000000000110000001111100111; // STUR X7, [XZR, 48]
			16'h0003:  out = 32'b11010001000001100101011111100000; // SUBI X0, XZR, 405
			16'h0004:  out = 32'b11010001000100000000001111100101; // SUBI X5, XZR, 1024
			16'h0005:  out = 32'b10110010000001000110011111100010; // ORRI X2, XZR, 281
			16'h0006:  out = 32'b10001011000001010000000001000010; // ADD X2, X2, X5
			16'h0007:  out = 32'b10001011000001010000000000000000; // ADD X0, X0, X5
			16'h0008:  out = 32'b10001011000001010000000010100101; // ADD X5, X5, X5
			16'h0009:  out = 32'b10001011000000100000000010100010; // ADD X2, X5, X2
			16'h000a:  out = 32'b11010011011000000000010010100101; // LSL X5, X5, 1
			16'h000b:  out = 32'b10001011000001010000000000000000; // ADD X0, X0, X5
			16'h000c:  out = 32'b11010011011000000000010010100101; // LSL X5, X5, 1
			16'h000d:  out = 32'b10001011000001010000000001000010; // ADD X2, X2, X5
			16'h000e:  out = 32'b11001011000001010000001111100101; // SUB X5, XZR, X5
			16'h000f:  out = 32'b10001011000000100000000000000000; // ADD X0, X0, X2
			16'h0010:  out = 32'b10001011000000100000000000000000; // ADD X0, X0, X2
			16'h0011:  out = 32'b11111000000000011000001111100000; // STUR X0, [XZR, 24]
			16'h0012:  out = 32'b11111000000000100000001111100010; // STUR X2, [XZR, 32]
			16'h0013:  out = 32'b11111000000000101000001111100101; // STUR X5, [XZR, 40]
			16'h0014:  out = 32'b10010001000000000000001111100000; // ADDI X0, XZR, 0
			16'h0015:  out = 32'b10010010000000000000001111100001; // ANDI X1, XZR, 0
			16'h0016:  out = 32'b11010010000000000000001111100010; // EORI X2, XZR, 0
			16'h0017:  out = 32'b10110010000000000000001111100011; // ORRI X3, XZR, 0
			16'h0018:  out = 32'b10101010000111110000001111100100; // ORR X4, X31, X31
			16'h0019:  out = 32'b10001010000111110000001111100101; // AND X5, X31, X31
			16'h001a:  out = 32'b10001010000111110000001111100110; // AND X6, X31, X31
			16'h001b:  out = 32'b11111000010000110000001111100111; // LDUR X7, [XZR, 48]
			16'h001c:  out = 32'b11010001000000000000010011100111; // SUBI X7, X7, 1
			16'h001d:  out = 32'b10110101111111111111111111000111; // CBNZ X7, -2
			16'h001e:  out = 32'b11010010100111111111111111100000; // MOVZ X0, 65535
			16'h001f:  out = 32'b11010001000000000000011111100001; // SUBI X1, XZR, 1
			16'h0020:  out = 32'b11010010100111111111111111100010; // MOVZ X2, 65535
			16'h0021:  out = 32'b11010001000000000000011111100011; // SUBI X3, XZR, 1
			16'h0022:  out = 32'b11010010100111111111111111100100; // MOVZ X4, 65535
			16'h0023:  out = 32'b11010001000000000000011111100101; // SUBI X5, XZR, 1
			16'h0024:  out = 32'b11010001000000000000011111100110; // SUBI X6, XZR, 1
			16'h0025:  out = 32'b11111000010000110000001111100111; // LDUR X7, [XZR, 48]
			16'h0026:  out = 32'b11010001000000000000010011100111; // SUBI X7, X7, 1
			16'h0027:  out = 32'b10110101111111111111111111000111; // CBNZ X7, -2
			16'h0028:  out = 32'b11111000010000011000001111100100; // LDUR X4, [XZR, 24]
			16'h0029:  out = 32'b11111000010000100000001111100010; // LDUR X2, [XZR, 32]
			16'h002a:  out = 32'b11111000010000101000001111100101; // LDUR X5, [XZR, 40]
			16'h002b:  out = 32'b10010001000000000000000001000011; // ADDI X3, X2, 0
			16'h002c:  out = 32'b10110010000000010000000001100011; // ORRI X3, X3, 64
			16'h002d:  out = 32'b11010010100000000000000100000111; // MOVZ X7, 8
			16'h002e:  out = 32'b11001011000001110000000001100011; // SUB X3, X3, X7
			16'h002f:  out = 32'b11010010100000000000000000100111; // MOVZ X7, 1
			16'h0030:  out = 32'b11001010000001110000000001100001; // EOR X1, X3, X7
			16'h0031:  out = 32'b11001011000001010000000000100001; // SUB X1, X1, X5
			16'h0032:  out = 32'b10110010000000000000000010000000; // ORRI X0, X4, 0
			16'h0033:  out = 32'b11010010100000000000000000000101; // MOVZ X5, 0
			16'h0034:  out = 32'b11010010100000000000000000000110; // MOVZ X6, 0
			16'h0035:  out = 32'b11111000010000110000001111100111; // LDUR X7, [XZR, 48]
			16'h0036:  out = 32'b11010001000000000000010011100111; // SUBI X7, X7, 1
			16'h0037:  out = 32'b10110101111111111111111111000111; // CBNZ X7, -2
			16'h0038:  out = 32'b11010110000000000000001111100000; // BR XZR
			default: out=32'hD60003E0; //BR XZR
		endcase
	end
endmodule
*/
/*
// auto generated from http://users.rowan.edu/~haskellt8/assembler/
module rom_case(out, address);
	output reg [31:0] out;
	input  [15:0] address; // address- 16 deep memory  
	always @(address) begin
		case (address)
			16'h0000:  out = 32'b11010010100000000000000000100001; // MOVZ X1, 1
			16'h0001:  out = 32'b11010010100000000000000001000010; // MOVZ X2, 2
			16'h0002:  out = 32'b10001011000000100000000000100100; // ADD X4, X1, X2
			16'h0003:  out = 32'b11111000000000010000001111100100; // STUR X4, [XZR, 16]
			16'h0004:  out = 32'b11111000010000010000001111100101; // LDUR X5, [XZR, 16]
			16'h0005:  out = 32'b10010100000000000000000000001010; // BL 10
			16'h0006:  out = 32'b10110101000000000000000000100010; // CBNZ X2, 1
			16'h0007:  out = 32'b00010100000000000000000000000001; // B 1
			16'h0008:  out = 32'b00010111111111111111111111111001; // B -7
			16'h0009:  out = 32'b10110100000000000000000001100001; // CBZ X1, 3
			16'h000a:  out = 32'b11101011000000100000000000111111; // SUBS XZR, X1, X2
			16'h000b:  out = 32'b01010100000000000000000000100011; // B.LO 1
			16'h000c:  out = 32'b11111000000000001000001111100001; // STUR X1, [XZR, 8]
			16'h000d:  out = 32'b11111000010000001000001111100110; // LDUR X6, [XZR, 8]
			16'h000e:  out = 32'b11010010000000000000010011100111; // EORI X7, X7, 1
			16'h000f:  out = 32'b00010111111111111111111111111110; // B -2
			16'h0010:  out = 32'b10010001000000000000100000100001; // ADDI X1, X1, 2
			16'h0011:  out = 32'b11010001000000000000010001000010; // SUBI X2, X2, 1
			16'h0012:  out = 32'b11010110000000000000001111000000; // BR X30
			default: out=32'hD60003E0; //BR XZR
		endcase
	end
endmodule
*/
/*
C code for above asm:
X1 = 1;
X2 = 2;
while(1) {
	X4 = X1 + X2;
	M[16] = X4;
	X5 = M[16];
	IncDec();
	if(X2 == 0) {
		break;
	}
}
if(X1 != 0) {
	if(X1 > X2) {
		M[8] = X1;
	}
}
X6 = M[8]
while(1){
	X7 = X7 ^ 1;
}

void IncDec(void) {
	X1 = X1 + 1;
	X2 = X2 - 1
}
*/
/*
// Initial core test
module rom_case(out, address);
    output reg [31:0] out;
    input [15:0] address;
    always @ (address) begin
        case (address)
            16'd0: out = 32'b11010010100001100000000000000000;
            16'd1: out = 32'b11010010100001100000000001000001;
            16'd2: out = 32'b11010010100000000000101010000010;
            16'd3: out = 32'b11111000000000000000000000100010;
            16'd4: out = 32'b10010001000000000000010000100001;
            16'd5: out = 32'b10010001000000000000010001000010;
            16'd6: out = 32'b11110001001100001000000000100011;
            16'd7: out = 32'b10110101111111111111111101100011;
            default: out = 32'hD60003E0; // BR XZR
        endcase
    end
endmodule
*/
