module IW_decoder_MOVZ (I, state, status, cw_IW, k);

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
    output [63:0] k;
    assign k =( sh_16[1] == 1'b1 ? ( sh_16[0] == 1'b1 ? ({immediate,48'b0}) : ({16'b0, immediate,32'b0}) ) : ( sh_16[0] == 1'b1 ? ({48'b0, immediate, 16'b0}) : ({48'b0, immediate}) ) );

    wire alu_en = 1'b1; // ALU is disabled
    wire alu_bs = 1'b1; // K is selected for input to ALU

    // ALU FS[4:2]
    //   000   001   010   011   100   101  110 111
    // { and   or    add   xor   left right  0   0 }
    // ALU FS[1] ~b
    // ALU FS[0] ~a
    wire [4:0] alu_fs = 5'b001_00; // ALU selects (A | B)

    wire rf_b_en = 1'b0; // B should not be enabled on data bus
    wire [4:0] rf_sa = 5'd31; // A outputs zero register
    wire [4:0] rf_sb = 5'b11111; // B register address don't care
    wire [4:0] rf_da = Rd;
    wire rf_w = 1'b1;
    wire ram_en = 1'b0; // disable ram
    wire ram_w = 1'b0; // don't write to ram
    wire pc_en = 1'b0; // disable pc data bus
    wire [1:0] pc_fs = 2'b01; // PC <= PC + 4
    wire pc_is = 1'b0; // pc in is don't care
    wire status_ld = 1'b0; // disable status load
    wire [1:0] next_state = 2'b0;

    assign cw_IW = {alu_en, alu_bs, alu_fs, rf_b_en, rf_sa, rf_sb, rf_da, rf_w, ram_en, ram_w, pc_en, pc_fs, pc_is, status_ld, next_state};

endmodule
