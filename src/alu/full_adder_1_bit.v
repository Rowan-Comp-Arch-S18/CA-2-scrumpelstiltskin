module full_adder_1_bit (
    a, b, cin,  // inputs
    s, cout     // outputs
);

input a, b;
input cin;

output s;
output cout;

assign s = ~a & ~b &  cin |
           ~a &  b & ~cin |
            a & ~b & ~cin |
            a &  b &  cin ;
assign cout = a & b   |
              a & cin |
              b & cin ;

endmodule
//
//  a   b   cin |   s   cout
//  0   0   0       0   0
//  0   0   1       1   0
//  0   1   0       1   0
//  0   1   1       0   1
//  1   0   0       1   0
//  1   0   1       0   1
//  1   1   0       0   1
//  1   1   1       1   1
//
