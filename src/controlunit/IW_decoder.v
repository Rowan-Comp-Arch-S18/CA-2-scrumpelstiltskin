module IW_decoder(I, state, status, cw_IW, K);
    input [31:0] I;
    input [1:0] state;
    input [4:0] status;

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
    output [63:0] K;

    wire [32:0] cw_MOVK, cw_MOVZ;
    IW_decoder_MOVK IW_decoder_MOVK_inst (I, state, cw_MOVK, K);
    IW_decoder_MOVZ IW_decoder_MOVZ_inst (I, state, cw_MOVZ, K);
    assign cw_IW = op[8] ? cw_MOVK : cw_MOVZ;

endmodule
