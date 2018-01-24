module register_file_32_x_64(out_a, out_b, select_a, select_b, data_in, address, write, reset, clock);
    output [63:0] out_a;
    output [63:0] out_b;

    input [4:0] select_a;
    input [4:0] select_b;

    input [63:0] data_in;
    input [4:0] address;

    input write, reset, clock;

    wire [31:0] address_select;
    wire [31:0] load_enable;

    decoder write_decoder (data_address, address_select);

    assign load_enable = address_select & {write, write, write, write, write, write, write, write, write, write, write, write, write, write, write, write, write, write, write, write, write, write, write, write, write, write, write, write, write, write, write, write};

    wire [31:0] register_out00;
    wire [31:0] register_out01;
    wire [31:0] register_out02;
    wire [31:0] register_out03;
    wire [31:0] register_out04;
    wire [31:0] register_out05;
    wire [31:0] register_out06;
    wire [31:0] register_out07;
    wire [31:0] register_out08;
    wire [31:0] register_out09;
    wire [31:0] register_out10;
    wire [31:0] register_out11;
    wire [31:0] register_out12;
    wire [31:0] register_out13;
    wire [31:0] register_out14;
    wire [31:0] register_out15;
    wire [31:0] register_out16;
    wire [31:0] register_out17;
    wire [31:0] register_out18;
    wire [31:0] register_out19;
    wire [31:0] register_out20;
    wire [31:0] register_out21;
    wire [31:0] register_out22;
    wire [31:0] register_out23;
    wire [31:0] register_out24;
    wire [31:0] register_out25;
    wire [31:0] register_out26;
    wire [31:0] register_out27;
    wire [31:0] register_out28;
    wire [31:0] register_out29;
    wire [31:0] register_out30;
    wire [31:0] register_out31;
    assign register_out31 = 64'b0;

    register_64_bit reg00 (register_64_bit_out00, data_in, load_enable[00], reset, clock);
    register_64_bit reg01 (register_64_bit_out01, data_in, load_enable[01], reset, clock);
    register_64_bit reg02 (register_64_bit_out02, data_in, load_enable[02], reset, clock);
    register_64_bit reg03 (register_64_bit_out03, data_in, load_enable[03], reset, clock);
    register_64_bit reg04 (register_64_bit_out04, data_in, load_enable[04], reset, clock);
    register_64_bit reg05 (register_64_bit_out05, data_in, load_enable[05], reset, clock);
    register_64_bit reg06 (register_64_bit_out06, data_in, load_enable[06], reset, clock);
    register_64_bit reg07 (register_64_bit_out07, data_in, load_enable[07], reset, clock);
    register_64_bit reg08 (register_64_bit_out08, data_in, load_enable[08], reset, clock);
    register_64_bit reg09 (register_64_bit_out09, data_in, load_enable[09], reset, clock);
    register_64_bit reg10 (register_64_bit_out10, data_in, load_enable[10], reset, clock);
    register_64_bit reg11 (register_64_bit_out11, data_in, load_enable[11], reset, clock);
    register_64_bit reg12 (register_64_bit_out12, data_in, load_enable[12], reset, clock);
    register_64_bit reg13 (register_64_bit_out13, data_in, load_enable[13], reset, clock);
    register_64_bit reg14 (register_64_bit_out14, data_in, load_enable[14], reset, clock);
    register_64_bit reg15 (register_64_bit_out15, data_in, load_enable[15], reset, clock);
    register_64_bit reg16 (register_64_bit_out16, data_in, load_enable[16], reset, clock);
    register_64_bit reg17 (register_64_bit_out17, data_in, load_enable[17], reset, clock);
    register_64_bit reg18 (register_64_bit_out18, data_in, load_enable[18], reset, clock);
    register_64_bit reg19 (register_64_bit_out19, data_in, load_enable[19], reset, clock);
    register_64_bit reg20 (register_64_bit_out20, data_in, load_enable[20], reset, clock);
    register_64_bit reg21 (register_64_bit_out21, data_in, load_enable[21], reset, clock);
    register_64_bit reg22 (register_64_bit_out22, data_in, load_enable[22], reset, clock);
    register_64_bit reg23 (register_64_bit_out23, data_in, load_enable[23], reset, clock);
    register_64_bit reg24 (register_64_bit_out24, data_in, load_enable[24], reset, clock);
    register_64_bit reg25 (register_64_bit_out25, data_in, load_enable[25], reset, clock);
    register_64_bit reg26 (register_64_bit_out26, data_in, load_enable[26], reset, clock);
    register_64_bit reg27 (register_64_bit_out27, data_in, load_enable[27], reset, clock);
    register_64_bit reg28 (register_64_bit_out28, data_in, load_enable[28], reset, clock);
    register_64_bit reg29 (register_64_bit_out29, data_in, load_enable[29], reset, clock);
    register_64_bit reg30 (register_64_bit_out30, data_in, load_enable[30], reset, clock);
    register_64_bit reg31 (register_64_bit_out31, data_in, load_enable[31], reset, clock);

    defparam reg00.n = 64;
    defparam reg01.n = 64;
    defparam reg02.n = 64;
    defparam reg03.n = 64;
    defparam reg04.n = 64;
    defparam reg05.n = 64;
    defparam reg06.n = 64;
    defparam reg07.n = 64;
    defparam reg08.n = 64;
    defparam reg09.n = 64;
    defparam reg10.n = 64;
    defparam reg11.n = 64;
    defparam reg12.n = 64;
    defparam reg13.n = 64;
    defparam reg14.n = 64;
    defparam reg15.n = 64;
    defparam reg16.n = 64;
    defparam reg17.n = 64;
    defparam reg18.n = 64;
    defparam reg19.n = 64;
    defparam reg20.n = 64;
    defparam reg21.n = 64;
    defparam reg22.n = 64;
    defparam reg23.n = 64;
    defparam reg24.n = 64;
    defparam reg25.n = 64;
    defparam reg26.n = 64;
    defparam reg27.n = 64;
    defparam reg28.n = 64;
    defparam reg29.n = 64;
    defparam reg30.n = 64;
    defparam reg31.n = 64;

    mux mux_a (out_a, select_a, register_out00, register_out01, register_out02, register_out03, register_out04, register_out05, register_out06, register_out07, register_out08, register_out09, register_out10, register_out11, register_out12, register_out13, register_out14, register_out16, register_out17, register_out18, register_out19, register_out20, register_out21, register_out22, register_out23, register_out24, register_out25, register_out26, register_out27, register_out28, register_out29, register_out30, register_out31);


    mux mux_b (out_b, select_b, register_out00, register_out01, register_out02, register_out03, register_out04, register_out05, register_out06, register_out07, register_out08, register_out09, register_out10, register_out11, register_out12, register_out13, register_out14, register_out16, register_out17, register_out18, register_out19, register_out20, register_out21, register_out22, register_out23, register_out24, register_out25, register_out26, register_out27, register_out28, register_out29, register_out30, register_out31);

endmodule


