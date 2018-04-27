module R_decoder(I, state, status, cw_IW, K);

    input [31:0] I;
    input [4:0] status;
    input [1:0] state;

    wire [10:0] op;
    wire [4:0] Rm;
    wire [5:0] shamt;
    wire [4:0] Rn;
    wire [4:0] Rd;

    assign {op, Rm, shamt, Rn, Rd} = I;

    // Control Word includes:
    // [1] Databus ALU Enable
    // [1] ALU B Select
    // [5] ALU Function Select
    // [1] Databus Register File B Enable
    // [5] Register File Select A
    // [5] Register File Select B
    // [5] Register File Write Address
    // [1] Register File Write
    // [1] Databus RAM Enable
    // [1] RAM Write
    // [1] Databus Program Counter Enable
    // [2] Program Counter Function Select
    // [1] Program Counter Input Select
    // [1] Status Load
    // [2] next_state
    // 33 in total
    output [32:0] cw_IW;
    output [63:0] K;
    assign K = op[1] && op[3] ? {58'b0, shamt} : {64'b0};

    wire alu_en = 1'b1; // ALU is enabled
    wire alu_bs = op[1] && op[3] ? 1'b1 : 1'b0; // B is selected for input to ALU

    // ALU FS[4:2]
    //   000   001   010   011   100   101  110 111
    // { and   or    add   xor   left right  0   0 }
    // ALU FS[1] ~b
    // ALU FS[0] ~a
    wire [4:0] alu_fs = op[1] ? ({2'b10, ~op[0], 2'b00}) :
     (
        {
            1'b0,
            op[3] | (op[9]&op[8]),
            (~op[9]&op[8]&op[3]) | (op[9]&~op[8]&~op[3]),
            (op[9]&~op[8]&op[3]) | (op[9]&op[8]&op[3]),
            1'b0
        }
     );

    wire rf_b_en = 1'b0; // B should not be enabled on data bus
    wire [4:0] rf_sa = Rn; // A register address is Rn
    wire [4:0] rf_sb = Rm; // B register address is Rm
    wire [4:0] rf_da = Rd; // DA register address is Rd
    wire rf_w = 1'b1;
    wire ram_en = 1'b0; // disable ram
    wire ram_w = 1'b0;
    wire pc_en = 1'b0;
    wire [1:0] pc_fs = 2'b01; // PC+pc_in+4
    wire pc_is = 1'b0; // pc_is is disabled
    wire status_ld = op[8];
    wire [1:0] next_state = 2'b00;

    assign cw_IW = {alu_en, alu_bs, alu_fs, rf_b_en, rf_sa, rf_sb, rf_da, rf_w, ram_en, ram_w, pc_en, pc_fs, pc_is, status_ld, next_state};

endmodule
