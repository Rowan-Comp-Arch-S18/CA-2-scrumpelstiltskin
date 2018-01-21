module carry_lookahead_adder_16bit(a, b, cin, cout, G, P, s);
    input [15:0] a;
    input [15:0] b;
    input cin;

    output cout;
    output G;
    output P;
    output [15:0] s;

    wire [3:0] g;
    wire [3:0] p;
    wire [3:0] c;

    assign cout = c[3];

    carry_lookahead_adder_4bit adder0 (
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .G(g[0]),
        .P(p[0]),
        .s(s[3:0])
    );

    carry_lookahead_adder_4bit adder1 (
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(c[0]),
        .G(g[1]),
        .P(p[1]),
        .s(s[7:4])
    );

    carry_lookahead_adder_4bit adder2 (
        .a(a[11:8]),
        .b(b[11:8]),
        .cin(c[1]),
        .G(g[2]),
        .P(p[2]),
        .s(s[11:8])
    );

    carry_lookahead_adder_4bit adder3 (
        .a(a[15:12]),
        .b(b[15:12]),
        .cin(c[2]),
        .G(g[3]),
        .P(p[3]),
        .s(s[15:12])
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
