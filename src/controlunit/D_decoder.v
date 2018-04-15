module D_decoder(I, state, status, cw_IW, K);

    input [31:0] I;
    input [1:0] state;
    input [4:0] status;

    wire [10:0] op;
    wire [8:0] zf_address;
    wire [1:0] op2;
    wire [4:0] Rn;
    wire [4:0] Rt;

    assign {op, zf_address, op2, Rn, Rt} = I;
    wire store_load = op[1]; // when op[1]=0, store, when 1 load
    wire bit_size_8_64 = op[10]; // when op[10]=0, 8bit, when 1 64bit NOT SUPPORTED ONLY 64bit WILL WORK


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
    output [63:0] K ;
    assign K = {55'b0,zf_address};

    wire alu_en = ~store_load; // ALU is disabled
    wire alu_bs = 1; // K is selected for input to ALU

    // ALU FS[4:2]
    //   000   001   010   011   100   101  110 111
    // { and   or    add   xor   left right  0   0 }
    // ALU FS[1] ~b
    // ALU FS[0] ~a
    wire [4:0] alu_fs = 5'b010_00; // ALU adds A+K

    wire rf_b_en = 1'b0; // B should not be enabled on data bus
    wire [4:0] rf_sa = Rn; // A outputs zero register
    wire [4:0] rf_sb = 5'd31; // B register address don't care
    wire [4:0] rf_da = Rt;
    wire rf_w =  ~store_load;
    wire ram_en = store_load; // enable ram
    wire ram_w = store_load;
    wire pc_en = 1'b0;
    wire [1:0] pc_fs = 2'b01; // PC+4
    wire pc_is = 1'b0; // pc in is don't care
    wire status_ld = 1'b0; // disable status load
    wire [1:0] next_state = 2'b00;

    assign cw_IW = {alu_en, alu_bs, alu_fs, rf_b_en, rf_sa, rf_sb, rf_da, rf_w, ram_en, ram_w, pc_en, pc_fs, pc_is, status_ld, next_state};

endmodule
