module rom(out,address);
    output reg [31:0] out;
    intput [15:0] address;
    always @(address) begin
        case (address)
            16'h0000: out = 32'h91002841; // ADDI X1, X2, 10
            16'h0001: out = 32'h91002841; // STUR X1, [X3, 1]
            16'h0002: out = 32'h91002841; // LDUR X9, [XZR, 1]
            16'h0003: out = 32'h91002841; // LSL X12, X1, 17
            16'h0004: out = 32'h91002841; // ADDI X7, XZR, 0
            16'h0005: out = 32'h91002841; // SUBIS XZR, X7, 50
            16'h0006: out = 32'h91002841; // B.HS 4
        end
endmodule
