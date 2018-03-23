module register_file_32_x_64(A, B, AA, AB, D, DA, w, reset, clock);
    input [4:0] AA;
    input [4:0] AB;

    input [63:0] D;
    input [4:0] DA;

    input w, reset, clock;

    output [63:0] A;
    output [63:0] B;

    wire [31:0] address_select;
    wire [31:0] load_enable;
    mux_5_x_32_decoder w_decoder (DA, address_select);

    assign load_enable = address_select & {32{w}};

    wire [63:0] register_out00;
    wire [63:0] register_out01;
    wire [63:0] register_out02;
    wire [63:0] register_out03;
    wire [63:0] register_out04;
    wire [63:0] register_out05;
    wire [63:0] register_out06;
    wire [63:0] register_out07;
    wire [63:0] register_out08;
    wire [63:0] register_out09;
    wire [63:0] register_out10;
    wire [63:0] register_out11;
    wire [63:0] register_out12;
    wire [63:0] register_out13;
    wire [63:0] register_out14;
    wire [63:0] register_out15;
    wire [63:0] register_out16;
    wire [63:0] register_out17;
    wire [63:0] register_out18;
    wire [63:0] register_out19;
    wire [63:0] register_out20;
    wire [63:0] register_out21;
    wire [63:0] register_out22;
    wire [63:0] register_out23;
    wire [63:0] register_out24;
    wire [63:0] register_out25;
    wire [63:0] register_out26;
    wire [63:0] register_out27;
    wire [63:0] register_out28;
    wire [63:0] register_out29;
    wire [63:0] register_out30;
    wire [63:0] register_out63;

    register_64_bit reg00 (register_out00, D, load_enable[00], reset, clock);
    register_64_bit reg01 (register_out01, D, load_enable[01], reset, clock);
    register_64_bit reg02 (register_out02, D, load_enable[02], reset, clock);
    register_64_bit reg03 (register_out03, D, load_enable[03], reset, clock);
    register_64_bit reg04 (register_out04, D, load_enable[04], reset, clock);
    register_64_bit reg05 (register_out05, D, load_enable[05], reset, clock);
    register_64_bit reg06 (register_out06, D, load_enable[06], reset, clock);
    register_64_bit reg07 (register_out07, D, load_enable[07], reset, clock);
    register_64_bit reg08 (register_out08, D, load_enable[08], reset, clock);
    register_64_bit reg09 (register_out09, D, load_enable[09], reset, clock);
    register_64_bit reg10 (register_out10, D, load_enable[10], reset, clock);
    register_64_bit reg11 (register_out11, D, load_enable[11], reset, clock);
    register_64_bit reg12 (register_out12, D, load_enable[12], reset, clock);
    register_64_bit reg13 (register_out13, D, load_enable[13], reset, clock);
    register_64_bit reg14 (register_out14, D, load_enable[14], reset, clock);
    register_64_bit reg15 (register_out15, D, load_enable[15], reset, clock);
    register_64_bit reg16 (register_out16, D, load_enable[16], reset, clock);
    register_64_bit reg17 (register_out17, D, load_enable[17], reset, clock);
    register_64_bit reg18 (register_out18, D, load_enable[18], reset, clock);
    register_64_bit reg19 (register_out19, D, load_enable[19], reset, clock);
    register_64_bit reg20 (register_out20, D, load_enable[20], reset, clock);
    register_64_bit reg21 (register_out21, D, load_enable[21], reset, clock);
    register_64_bit reg22 (register_out22, D, load_enable[22], reset, clock);
    register_64_bit reg23 (register_out23, D, load_enable[23], reset, clock);
    register_64_bit reg24 (register_out24, D, load_enable[24], reset, clock);
    register_64_bit reg25 (register_out25, D, load_enable[25], reset, clock);
    register_64_bit reg26 (register_out26, D, load_enable[26], reset, clock);
    register_64_bit reg27 (register_out27, D, load_enable[27], reset, clock);
    register_64_bit reg28 (register_out28, D, load_enable[28], reset, clock);
    register_64_bit reg29 (register_out29, D, load_enable[29], reset, clock);
    register_64_bit reg30 (register_out30, D, load_enable[30], reset, clock);
    register_64_bit reg31 (register_out31, D, load_enable[31], reset, clock);

    mux_5_x_32 mux_a (A, AA, register_out00, register_out01, register_out02, register_out03, register_out04, register_out05, register_out06, register_out07, register_out08, register_out09, register_out10, register_out11, register_out12, register_out13, register_out14, register_out15, register_out16, register_out17, register_out18, register_out19, register_out20, register_out21, register_out22, register_out23, register_out24, register_out25, register_out26, register_out27, register_out28, register_out29, register_out30, register_out31);

    mux_5_x_32 mux_b (B, AB, register_out00, register_out01, register_out02, register_out03, register_out04, register_out05, register_out06, register_out07, register_out08, register_out09, register_out10, register_out11, register_out12, register_out13, register_out14, register_out15, register_out16, register_out17, register_out18, register_out19, register_out20, register_out21, register_out22, register_out23, register_out24, register_out25, register_out26, register_out27, register_out28, register_out29, register_out30, register_out31);

    defparam mux_b.n = 64;

endmodule


