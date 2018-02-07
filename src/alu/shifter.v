module shifter(data_in, shift, left, right);
    input [63:0] data_in;
    input [5:0] shift;

    output [63:0] left, right;

    assign left = data_in << shift;
    assign right = data_in >> shift;

endmodule

