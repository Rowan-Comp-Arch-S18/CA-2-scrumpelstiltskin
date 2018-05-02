module Seven_Seg(in, out);
	input [3:0]in;
	output [6:0]out;
	
	wire A, B, C, D, E, F, G;
	wire W, X, Y, Z;
	
	assign {W, X, Y, Z} = in;
	assign out = {G, F, E, D, C, B, A};

	// A = X'Z' + WX'Y' + W'XZ + WZ' + XY + W'Y
	assign A = ~X & ~Z | W & ~X & ~Y | ~W & X & Z | W & ~Z | X & Y | ~W & Y;
	
	// B = X'Z' + WY'Z + W'YZ + W'Y'Z' + W'X'
	assign B = ~X & ~Z | W & ~Y & Z | ~W & Y & Z | ~W & ~Y & ~Z | ~W & ~X;
	
	// C = W'Y' + WX' + Y'Z + W'X + W'Z
	assign C = ~W & ~Y | W & ~X | ~Y & Z | ~W & X | ~W & Z;
	
	// D = X'YZ + W'X'Z' + WY'Z' + XY'Z + XYZ'
	assign D = ~X & Y & Z | ~W & ~X & ~Z | W & ~Y & ~Z | X & ~Y & Z | X & Y & ~Z;
	
	// E = X'Z' + WX + YZ' + WY
	assign E = ~X & ~Z | W & X | Y & ~Z | W & Y;
	
	// F = Y'Z' + WX' + WY + W'XY' + XZ'
	assign F = ~Y & ~Z | W & ~X | W & Y | ~W & X & ~Y | X & ~Z;
	
	// G = WX' + YZ' + X'Y + WZ + W'XY'
	assign G = W & ~X | Y & ~Z | ~X & Y | W & Z | ~W & X & ~Y;
	
	// need to add C through G	
endmodule

