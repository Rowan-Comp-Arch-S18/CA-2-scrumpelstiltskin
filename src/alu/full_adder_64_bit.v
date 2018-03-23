module full_adder_64_bit (
    a, b, Cin,  // inputs
    F, Cout     // outputs
);

input [63:0] a, b;
input Cin;

output [63:0] F;
output Cout;

wire [62:0] Couts;

full_adder_1_bit fa_00 (.a(a[00]), .b(b[00]), .cin(Cin)      , .cout(Couts[00]), .s(F[00]));
full_adder_1_bit fa_01 (.a(a[01]), .b(b[01]), .cin(Couts[00]), .cout(Couts[01]), .s(F[01]));
full_adder_1_bit fa_02 (.a(a[02]), .b(b[02]), .cin(Couts[01]), .cout(Couts[02]), .s(F[02]));
full_adder_1_bit fa_03 (.a(a[03]), .b(b[03]), .cin(Couts[02]), .cout(Couts[03]), .s(F[03]));
full_adder_1_bit fa_04 (.a(a[04]), .b(b[04]), .cin(Couts[03]), .cout(Couts[04]), .s(F[04]));
full_adder_1_bit fa_05 (.a(a[05]), .b(b[05]), .cin(Couts[04]), .cout(Couts[05]), .s(F[05]));
full_adder_1_bit fa_06 (.a(a[06]), .b(b[06]), .cin(Couts[05]), .cout(Couts[06]), .s(F[06]));
full_adder_1_bit fa_07 (.a(a[07]), .b(b[07]), .cin(Couts[06]), .cout(Couts[07]), .s(F[07]));
full_adder_1_bit fa_08 (.a(a[08]), .b(b[08]), .cin(Couts[07]), .cout(Couts[08]), .s(F[08]));
full_adder_1_bit fa_09 (.a(a[09]), .b(b[09]), .cin(Couts[08]), .cout(Couts[09]), .s(F[09]));
full_adder_1_bit fa_10 (.a(a[10]), .b(b[10]), .cin(Couts[09]), .cout(Couts[10]), .s(F[10]));
full_adder_1_bit fa_11 (.a(a[11]), .b(b[11]), .cin(Couts[10]), .cout(Couts[11]), .s(F[11]));
full_adder_1_bit fa_12 (.a(a[12]), .b(b[12]), .cin(Couts[11]), .cout(Couts[12]), .s(F[12]));
full_adder_1_bit fa_13 (.a(a[13]), .b(b[13]), .cin(Couts[12]), .cout(Couts[13]), .s(F[13]));
full_adder_1_bit fa_14 (.a(a[14]), .b(b[14]), .cin(Couts[13]), .cout(Couts[14]), .s(F[14]));
full_adder_1_bit fa_15 (.a(a[15]), .b(b[15]), .cin(Couts[14]), .cout(Couts[15]), .s(F[15]));
full_adder_1_bit fa_16 (.a(a[16]), .b(b[16]), .cin(Couts[15]), .cout(Couts[16]), .s(F[16]));
full_adder_1_bit fa_17 (.a(a[17]), .b(b[17]), .cin(Couts[16]), .cout(Couts[17]), .s(F[17]));
full_adder_1_bit fa_18 (.a(a[18]), .b(b[18]), .cin(Couts[17]), .cout(Couts[18]), .s(F[18]));
full_adder_1_bit fa_19 (.a(a[19]), .b(b[19]), .cin(Couts[18]), .cout(Couts[19]), .s(F[19]));
full_adder_1_bit fa_20 (.a(a[20]), .b(b[20]), .cin(Couts[19]), .cout(Couts[20]), .s(F[20]));
full_adder_1_bit fa_21 (.a(a[21]), .b(b[21]), .cin(Couts[20]), .cout(Couts[21]), .s(F[21]));
full_adder_1_bit fa_22 (.a(a[22]), .b(b[22]), .cin(Couts[21]), .cout(Couts[22]), .s(F[22]));
full_adder_1_bit fa_23 (.a(a[23]), .b(b[23]), .cin(Couts[22]), .cout(Couts[23]), .s(F[23]));
full_adder_1_bit fa_24 (.a(a[24]), .b(b[24]), .cin(Couts[23]), .cout(Couts[24]), .s(F[24]));
full_adder_1_bit fa_25 (.a(a[25]), .b(b[25]), .cin(Couts[24]), .cout(Couts[25]), .s(F[25]));
full_adder_1_bit fa_26 (.a(a[26]), .b(b[26]), .cin(Couts[25]), .cout(Couts[26]), .s(F[26]));
full_adder_1_bit fa_27 (.a(a[27]), .b(b[27]), .cin(Couts[26]), .cout(Couts[27]), .s(F[27]));
full_adder_1_bit fa_28 (.a(a[28]), .b(b[28]), .cin(Couts[27]), .cout(Couts[28]), .s(F[28]));
full_adder_1_bit fa_29 (.a(a[29]), .b(b[29]), .cin(Couts[28]), .cout(Couts[29]), .s(F[29]));
full_adder_1_bit fa_30 (.a(a[30]), .b(b[30]), .cin(Couts[29]), .cout(Couts[30]), .s(F[30]));
full_adder_1_bit fa_31 (.a(a[31]), .b(b[31]), .cin(Couts[30]), .cout(Couts[31]), .s(F[31]));
full_adder_1_bit fa_32 (.a(a[32]), .b(b[32]), .cin(Couts[31]), .cout(Couts[32]), .s(F[32]));
full_adder_1_bit fa_33 (.a(a[33]), .b(b[33]), .cin(Couts[32]), .cout(Couts[33]), .s(F[33]));
full_adder_1_bit fa_34 (.a(a[34]), .b(b[34]), .cin(Couts[33]), .cout(Couts[34]), .s(F[34]));
full_adder_1_bit fa_35 (.a(a[35]), .b(b[35]), .cin(Couts[34]), .cout(Couts[35]), .s(F[35]));
full_adder_1_bit fa_36 (.a(a[36]), .b(b[36]), .cin(Couts[35]), .cout(Couts[36]), .s(F[36]));
full_adder_1_bit fa_37 (.a(a[37]), .b(b[37]), .cin(Couts[36]), .cout(Couts[37]), .s(F[37]));
full_adder_1_bit fa_38 (.a(a[38]), .b(b[38]), .cin(Couts[37]), .cout(Couts[38]), .s(F[38]));
full_adder_1_bit fa_39 (.a(a[39]), .b(b[39]), .cin(Couts[38]), .cout(Couts[39]), .s(F[39]));
full_adder_1_bit fa_40 (.a(a[40]), .b(b[40]), .cin(Couts[39]), .cout(Couts[40]), .s(F[40]));
full_adder_1_bit fa_41 (.a(a[41]), .b(b[41]), .cin(Couts[40]), .cout(Couts[41]), .s(F[41]));
full_adder_1_bit fa_42 (.a(a[42]), .b(b[42]), .cin(Couts[41]), .cout(Couts[42]), .s(F[42]));
full_adder_1_bit fa_43 (.a(a[43]), .b(b[43]), .cin(Couts[42]), .cout(Couts[43]), .s(F[43]));
full_adder_1_bit fa_44 (.a(a[44]), .b(b[44]), .cin(Couts[43]), .cout(Couts[44]), .s(F[44]));
full_adder_1_bit fa_45 (.a(a[45]), .b(b[45]), .cin(Couts[44]), .cout(Couts[45]), .s(F[45]));
full_adder_1_bit fa_46 (.a(a[46]), .b(b[46]), .cin(Couts[45]), .cout(Couts[46]), .s(F[46]));
full_adder_1_bit fa_47 (.a(a[47]), .b(b[47]), .cin(Couts[46]), .cout(Couts[47]), .s(F[47]));
full_adder_1_bit fa_48 (.a(a[48]), .b(b[48]), .cin(Couts[47]), .cout(Couts[48]), .s(F[48]));
full_adder_1_bit fa_49 (.a(a[49]), .b(b[49]), .cin(Couts[48]), .cout(Couts[49]), .s(F[49]));
full_adder_1_bit fa_50 (.a(a[50]), .b(b[50]), .cin(Couts[49]), .cout(Couts[50]), .s(F[50]));
full_adder_1_bit fa_51 (.a(a[51]), .b(b[51]), .cin(Couts[50]), .cout(Couts[51]), .s(F[51]));
full_adder_1_bit fa_52 (.a(a[52]), .b(b[52]), .cin(Couts[51]), .cout(Couts[52]), .s(F[52]));
full_adder_1_bit fa_53 (.a(a[53]), .b(b[53]), .cin(Couts[52]), .cout(Couts[53]), .s(F[53]));
full_adder_1_bit fa_54 (.a(a[54]), .b(b[54]), .cin(Couts[53]), .cout(Couts[54]), .s(F[54]));
full_adder_1_bit fa_55 (.a(a[55]), .b(b[55]), .cin(Couts[54]), .cout(Couts[55]), .s(F[55]));
full_adder_1_bit fa_56 (.a(a[56]), .b(b[56]), .cin(Couts[55]), .cout(Couts[56]), .s(F[56]));
full_adder_1_bit fa_57 (.a(a[57]), .b(b[57]), .cin(Couts[56]), .cout(Couts[57]), .s(F[57]));
full_adder_1_bit fa_58 (.a(a[58]), .b(b[58]), .cin(Couts[57]), .cout(Couts[58]), .s(F[58]));
full_adder_1_bit fa_59 (.a(a[59]), .b(b[59]), .cin(Couts[58]), .cout(Couts[59]), .s(F[59]));
full_adder_1_bit fa_60 (.a(a[60]), .b(b[60]), .cin(Couts[59]), .cout(Couts[60]), .s(F[60]));
full_adder_1_bit fa_61 (.a(a[61]), .b(b[61]), .cin(Couts[60]), .cout(Couts[61]), .s(F[61]));
full_adder_1_bit fa_62 (.a(a[62]), .b(b[62]), .cin(Couts[61]), .cout(Couts[62]), .s(F[62]));
full_adder_1_bit fa_63 (.a(a[63]), .b(b[63]), .cin(Couts[62]), .cout(Cout),      .s(F[63]));


endmodule
