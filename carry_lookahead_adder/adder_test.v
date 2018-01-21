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
        a <= 0;
        b <= 0;
        cin <= 0;
    end

    always begin
        #1
        a <= $random%10;
        b <= $random%10;
    end

    always begin
        #20
        $stop;
    end
endmodule

