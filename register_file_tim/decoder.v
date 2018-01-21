module decoder(select, out);

    input [4:0] select;
    output [31:0] out;

    assign m[ 0] = ~select[0] & ~select[1] & ~select[2] & ~select[3] & ~select[4];
    assign m[ 1] = ~select[0] & ~select[1] & ~select[2] & ~select[3] &  select[4];
    assign m[ 2] = ~select[0] & ~select[1] & ~select[2] &  select[3] & ~select[4];
    assign m[ 3] = ~select[0] & ~select[1] & ~select[2] &  select[3] &  select[4];
    assign m[ 4] = ~select[0] & ~select[1] &  select[2] & ~select[3] & ~select[4];
    assign m[ 5] = ~select[0] & ~select[1] &  select[2] & ~select[3] &  select[4];
    assign m[ 6] = ~select[0] & ~select[1] &  select[2] &  select[3] & ~select[4];
    assign m[ 7] = ~select[0] & ~select[1] &  select[2] &  select[3] &  select[4];

    assign m[ 8] = ~select[0] &  select[1] & ~select[2] & ~select[3] & ~select[4];
    assign m[ 9] = ~select[0] &  select[1] & ~select[2] & ~select[3] &  select[4];
    assign m[10] = ~select[0] &  select[1] & ~select[2] &  select[3] & ~select[4];
    assign m[11] = ~select[0] &  select[1] & ~select[2] &  select[3] &  select[4];
    assign m[12] = ~select[0] &  select[1] &  select[2] & ~select[3] & ~select[4];
    assign m[13] = ~select[0] &  select[1] &  select[2] & ~select[3] &  select[4];
    assign m[14] = ~select[0] &  select[1] &  select[2] &  select[3] & ~select[4];
    assign m[15] = ~select[0] &  select[1] &  select[2] &  select[3] &  select[4];

    assign m[16] =  select[0] & ~select[1] & ~select[2] & ~select[3] & ~select[4];
    assign m[17] =  select[0] & ~select[1] & ~select[2] & ~select[3] &  select[4];
    assign m[18] =  select[0] & ~select[1] & ~select[2] &  select[3] & ~select[4];
    assign m[19] =  select[0] & ~select[1] & ~select[2] &  select[3] &  select[4];
    assign m[20] =  select[0] & ~select[1] &  select[2] & ~select[3] & ~select[4];
    assign m[21] =  select[0] & ~select[1] &  select[2] & ~select[3] &  select[4];
    assign m[22] =  select[0] & ~select[1] &  select[2] &  select[3] & ~select[4];
    assign m[23] =  select[0] & ~select[1] &  select[2] &  select[3] &  select[4];

    assign m[24] =  select[0] &  select[1] & ~select[2] & ~select[3] & ~select[4];
    assign m[25] =  select[0] &  select[1] & ~select[2] & ~select[3] &  select[4];
    assign m[26] =  select[0] &  select[1] & ~select[2] &  select[3] & ~select[4];
    assign m[27] =  select[0] &  select[1] & ~select[2] &  select[3] &  select[4];
    assign m[28] =  select[0] &  select[1] &  select[2] & ~select[3] & ~select[4];
    assign m[29] =  select[0] &  select[1] &  select[2] & ~select[3] &  select[4];
    assign m[30] =  select[0] &  select[1] &  select[2] &  select[3] & ~select[4];
    assign m[31] =  select[0] &  select[1] &  select[2] &  select[3] &  select[4];

endmodule
