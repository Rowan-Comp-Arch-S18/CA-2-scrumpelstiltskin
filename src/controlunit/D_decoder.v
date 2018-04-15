module D_decoder(I, state, status, cw_IW);

    input [31:0] I;
    input [4:0] status;

    wire [10:0] op;
    wire [8:0] zf_address;
    wire [1:0] op2;
    wire [4:0] Rn;
    wire [4:0] Rt;

    assign {op, zf_address, op2, Rn, Rt} = I;
    wire store_load = op[1]; // when op[1]=0, store, when 1 load
    wire bit_size_8_64 = op[10]; // when op[10]=0, 8bit, when 1 64bit


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

    wire alu_en = state == 1'b1; // ALU is enabled
    wire alu_bs = 1; // K is selected for input to ALU

    // ALU FS[4:2]
    //   000   001   010   011   100   101  110 111
    // { and   or    add   xor   left right  0   0 }
    // ALU FS[1] ~b
    // ALU FS[0] ~a
    wire [4:0] alu_fs = (state == 2'b00) ? 5'b000_00 : 5'b001_00; // state 00: ALU selects (A & B), state 01: ALU selects (A | B)

    wire rf_b_en = 1'b0; // B should not be enabled on data bus
    wire [4:0] rf_sa = Rd; // A outputs zero register
    wire [4:0] rf_sb = 5'd31; // B register address don't care
    wire [4:0] rf_da = Rd;
    wire rf_w 1'b1;
    wire ram_en = 1'b0; // disable ram
    wire ram_w = 1'b0; // don't write to ram
    wire [1:0] pc_fs = state == 2'b00 ? 2'b00 : 2'b01; // state 00: PC <= PC, state 01: PC <= PC + 4
    wire pc_is = 64'd0; // pc in is don't care
    wire status_ld = 1'b0; // diable status load
    wire [1:0] next_state = state == 2'b00 ? 2'b01 : 2'b00;

endmodule
