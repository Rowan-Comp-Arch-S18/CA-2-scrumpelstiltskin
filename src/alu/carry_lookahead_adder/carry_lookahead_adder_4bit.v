module carry_lookahead_adder_4bit(a, b, cin, cout, G, P, s);
    input [3:0] a;
    input [3:0] b;
    input cin;

    output cout;
    output G;
    output P;
    output [3:0] s;

    wire [3:0] g;
    wire [3:0] p;
    wire [3:0] c;

    assign cout = c[3];

    adder_1bit adder0 (
        .a(a[0]),
        .b(b[0]),
        .c(cin),
        .g(g[0]),
        .p(p[0]),
        .s(s[0])
    );

    adder_1bit adder1 (
        .a(a[1]),
        .b(b[1]),
        .c(c[0]),
        .g(g[1]),
        .p(p[1]),
        .s(s[1])
    );

    adder_1bit adder2 (
        .a(a[2]),
        .b(b[2]),
        .c(c[1]),
        .g(g[2]),
        .p(p[2]),
        .s(s[2])
    );

    adder_1bit adder3 (
        .a(a[3]),
        .b(b[3]),
        .c(c[2]),
        .g(g[3]),
        .p(p[3]),
        .s(s[3])
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
