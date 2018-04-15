module IW_decoder(I, state, cw_IW){
    input [31:0] I;

    wire [8:0] op;
    wire [1:0] sh_16;
    wire [15:0] immediate;
    wire [4:0] Rd;

    assign {op, sh_16, immediate, Rd} = I;

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

    wire alu_en = 1;
    wire alu_bs = 1;
    wire [4:0] alu_fs;
    wire rf_b_en;
    wire [4:0] rf_as, rf_bs, rf_wa;
    wire rf_w;
    wire ram_en, ram_w;
    wire [1:0] pc_fs;
    wire pc_is;
    wire status_ld;
    wire [1:0] next_state;

    wire [63:0] bit_mask = sh_16[1] ? ( sh_16[0] ? (64'h0000_ffff_ffff_ffff) : (64'hffff_0000_ffff_ffff) ) : ( sh_16[0] ? (64'hffff_ffff_0000_ffff) : (64'hffff_ffff_ffff_0000) )

    assign cw_IW = {alu_en, alu_bs, alu_fs, rf_b_en, rf_as, rf_bs, rf_wa, rf_w, ram_en, ram_w, pc_fs, pc_is, status_ld, next_state};
}
