module mux_8 (out, select, in0, in1, in2, in3, in4, in5, in6, in7);
    parameter n = 64;
    input [n-1:0] = in0, in1, in2, in3, in4, in5, in6, in7;
    input [2:0] select;
    output [n-1:0] out;

    always @ (*) begin
        case (select)
            3'd0: out <= in0;
            3'd1: out <= in1;
            3'd2: out <= in2;
            3'd3: out <= in3;
            3'd4: out <= in4;
            3'd5: out <= in5;
            3'd6: out <= in6;
            3'd7: out <= in7;
        endcase
    end
endmodule
