module carry_lookahead_logic_4bit(Cin, Cout, g, p, G, P);
    input Cin;
    input [3:0] g;
    input [3:0] p;

    output [3:0] Cout;
    output G;
    output P;

    assign Cout[0] = g[0] | p[0] & Cin;
    assign Cout[1] = g[1] | p[1] & g[0] | p[1] & p[0] & Cin;
    assign Cout[2] = g[2] | p[2] & g[1] | p[2] & p[1] & g[0] | p[2] & p[1] & p[0] & Cin;
    assign Cout[3] = g[3] | p[3] & g[2] | p[3] & p[2] & g[1] | p[3] & p[2] & p[1] & g[0] | p[3] & p[2] & p[1] & p[0] & Cin;

    assign G = g[3] | p[3] & g[2] | p[3] & p[2] & g[1] | p[3] & p[2] & p[1] & g[0];
    assign P = p[3] & p[2] & p[1] & p[0];

endmodule
