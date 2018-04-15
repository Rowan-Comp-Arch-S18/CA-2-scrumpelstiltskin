module BL_decoder(I, state, status, cw_IW, K);

    input [31:0] I;
    input [4:0] status;

    wire [5:0] op;
    wire [25:0] se_address;

    assign {op,se_address} = I;

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
    output [63:0] K = {38'b0, se_address};

    wire alu_en = 1'b0; // ALU is disabled
    wire alu_bs = 1'b1; // K is selected for input to ALU

    // ALU FS[4:2]
    //   000   001   010   011   100   101  110 111
    // { and   or    add   xor   left right  0   0 }
    // ALU FS[1] ~b
    // ALU FS[0] ~a
    wire [4:0] alu_fs = 5'b111_11; // ALU is zero to be safe

    wire rf_b_en = 1'b0; // B should not be enabled on data bus
    wire [4:0] rf_sa = 5'd31; // A register address don't care
    wire [4:0] rf_sb = 5'd31; // B register address don't care
    wire [4:0] rf_da = 5'd30;
    wire rf_w =  ~store_load;
    wire ram_en = 1'b1; // enable ram
    wire ram_w = 1'b0;
    wire pc_en = 1'b1;
    wire [1:0] pc_fs = 2'b11; // PC+4*pc_in+4
    wire pc_is = {{38{se_address[25]}},se_address}; // pc in is sign extended address
    wire status_ld = 1'b0; // disable status load
    wire [1:0] next_state = 2'b00;

    assign cw_IW = {alu_en, alu_bs, alu_fs, rf_b_en, rf_sa, rf_sb, rf_da, rf_w, ram_en, ram_w, pc_fs, pc_is, status_ld, next_state};

endmodule
