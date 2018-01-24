module adder_test();
    reg [63:0] a;
    reg [63:0] b;
    reg cin;

    wire cout;
    wire G;
    wire P;
    wire [63:0] s;

    carry_lookahead_adder_64bit adder (
        .a(a),
        .b(b),
        .cin(cin),
        .cout(cout),
        .G(G),
        .P(P),
        .s(s)
    );

    initial begin
        // (64^2)/2 - 50
        a <= 64'd9223372036854775758;
        b <= 64'd9223372036854775758;
        cin <= 1'b1;
    end

    always begin
        #1
        if (a < 64'd9223372036854775858) begin
            a <= a + 64'd1;
        end else begin
            a <= 64'd9223372036854775758;
        end
    end

    always begin
        #100;
        b <= b + 64'd1;
    end

    always begin
        #10000
        $stop;
    end
endmodule

