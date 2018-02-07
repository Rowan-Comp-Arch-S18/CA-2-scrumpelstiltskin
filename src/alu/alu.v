module alu(a, b, function_select, cin, f, status);
    input [63:0] a, b;
    input [4:0] function_select;
    input cin;

    output [63:0] f;
    output [3:0] status;

    wire [63:0] a_signal, b_signal;
    wire [63:0] and_out, or_out, xor_out, add_out, left_out, right_out;

    wire z, n, c, v;
    assign status = {v, c, n, z};

    assign a_signal = function_select[0] ? ~a : a;
    assign b_signal = function_select[1] ? ~b : b;

    assign n = f[63];
    assign z = (f == 64'd0) ? 1'b1 : 1'b0;
    assign v = ~(a_signal[63] ^ b_signal[63]) & (f[63] ^ a_signal[63]);

    assign and_out = a_signal & b_signal;
    assign or_out = a_signal | b_signal;
    assign xor_out = a_signal ^ b_signal;

    carry_lookahead_adder_64bit adder (
        .a(a_signal),
        .b(b_signal),
        .cin(cin),
        .cout(c),
        .s(add_out)
    );

    shifter shift (
        .data_in(a),
        .shift(b[5:0]),
        .left(left_out),
        .right(right_out)
    );

    mux_8 out_mux (
        .out(f),
        .select(function_select[4:2]),
        .in0(and_out),
        .in1(or_out),
        .in2(add_out),
        .in3(xor_out),
        .in4(left_out),
        .in5(right_out),
        .in6(64'd0),
        .in7(64'd0)
    );

endmodule
