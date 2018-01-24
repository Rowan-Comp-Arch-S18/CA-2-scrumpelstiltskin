module carry_lookahead_adder_64bit(a, b, cin, cout, G, P, s);
    input [63:0] a;
    input [63:0] b;
    input cin;

    output cout;
    output G;
    output P;
    output [63:0] s;

    wire [3:0] g;
    wire [3:0] p;
    wire [3:0] c;

    assign cout = c[3];

    carry_lookahead_adder_16bit adder0 (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(cin),
        .G(g[0]),
        .P(p[0]),
        .s(s[15:0])
    );

    carry_lookahead_adder_16bit adder1 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(c[0]),
        .G(g[1]),
        .P(p[1]),
        .s(s[31:16])
    );

    carry_lookahead_adder_16bit adder2 (
        .a(a[47:32]),
        .b(b[47:32]),
        .cin(c[1]),
        .G(g[2]),
        .P(p[2]),
        .s(s[47:32])
    );

    carry_lookahead_adder_16bit adder3 (
        .a(a[63:48]),
        .b(b[63:48]),
        .cin(c[2]),
        .G(g[3]),
        .P(p[3]),
        .s(s[63:48])
    );

    carry_lookahead_logic_4bit lookahead_logic (
        .Cin(cin),
        .Cout(c),
        .g(g),
        .p(p),
        .G(G),
        .P(P)
    );

endmodule
