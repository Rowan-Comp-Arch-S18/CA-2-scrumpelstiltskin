module mux_5_x_32_decoder(select, out);

    input [4:0] select;
    output [31:0] out;

    assign out[00] = ~select[4] & ~select[3] & ~select[2] & ~select[1] & ~select[0];
    assign out[01] = ~select[4] & ~select[3] & ~select[2] & ~select[1] &  select[0];
    assign out[02] = ~select[4] & ~select[3] & ~select[2] &  select[1] & ~select[0];
    assign out[03] = ~select[4] & ~select[3] & ~select[2] &  select[1] &  select[0];
    assign out[04] = ~select[4] & ~select[3] &  select[2] & ~select[1] & ~select[0];
    assign out[05] = ~select[4] & ~select[3] &  select[2] & ~select[1] &  select[0];
    assign out[06] = ~select[4] & ~select[3] &  select[2] &  select[1] & ~select[0];
    assign out[07] = ~select[4] & ~select[3] &  select[2] &  select[1] &  select[0];

    assign out[08] = ~select[4] &  select[3] & ~select[2] & ~select[1] & ~select[0];
    assign out[09] = ~select[4] &  select[3] & ~select[2] & ~select[1] &  select[0];
    assign out[10] = ~select[4] &  select[3] & ~select[2] &  select[1] & ~select[0];
    assign out[11] = ~select[4] &  select[3] & ~select[2] &  select[1] &  select[0];
    assign out[12] = ~select[4] &  select[3] &  select[2] & ~select[1] & ~select[0];
    assign out[13] = ~select[4] &  select[3] &  select[2] & ~select[1] &  select[0];
    assign out[14] = ~select[4] &  select[3] &  select[2] &  select[1] & ~select[0];
    assign out[15] = ~select[4] &  select[3] &  select[2] &  select[1] &  select[0];

    assign out[16] =  select[4] & ~select[3] & ~select[2] & ~select[1] & ~select[0];
    assign out[17] =  select[4] & ~select[3] & ~select[2] & ~select[1] &  select[0];
    assign out[18] =  select[4] & ~select[3] & ~select[2] &  select[1] & ~select[0];
    assign out[19] =  select[4] & ~select[3] & ~select[2] &  select[1] &  select[0];
    assign out[20] =  select[4] & ~select[3] &  select[2] & ~select[1] & ~select[0];
    assign out[21] =  select[4] & ~select[3] &  select[2] & ~select[1] &  select[0];
    assign out[22] =  select[4] & ~select[3] &  select[2] &  select[1] & ~select[0];
    assign out[23] =  select[4] & ~select[3] &  select[2] &  select[1] &  select[0];

    assign out[24] =  select[4] &  select[3] & ~select[2] & ~select[1] & ~select[0];
    assign out[25] =  select[4] &  select[3] & ~select[2] & ~select[1] &  select[0];
    assign out[26] =  select[4] &  select[3] & ~select[2] &  select[1] & ~select[0];
    assign out[27] =  select[4] &  select[3] & ~select[2] &  select[1] &  select[0];
    assign out[28] =  select[4] &  select[3] &  select[2] & ~select[1] & ~select[0];
    assign out[29] =  select[4] &  select[3] &  select[2] & ~select[1] &  select[0];
    assign out[30] =  select[4] &  select[3] &  select[2] &  select[1] & ~select[0];
    assign out[31] =  select[4] &  select[3] &  select[2] &  select[1] &  select[0];

endmodule
