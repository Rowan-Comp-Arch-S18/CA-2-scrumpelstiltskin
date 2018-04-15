module controlunit(instruction, controlword, constant, status, clock, reset);

    input [31:0] instruction;
    input [4:0] status;
    input clock, reset;

    output [30:0] controlword;
    output [63:0] constant;

    wire [32:0] controlword_and_state;

    assign controlword = controlword_and_state[32:2];

    reg [1:0] state;

    always @ (posedge clock or posedge reset) begin
        if (reset) begin
            state <= 2'b0;
        end else begin
            state <= controlword_and_state[1:0];
        end
    end

    // D-Format Decoder
    wire [32:0] d_controlword;
    wire [63:0] d_constant;

    D_decoder d(
        .I(instruction),
        .state(state),
        .status(status),
        .cw_IW(d_controlword),
        .K(d_constant)
    );

    // I-Format Arithmatic Decoder
    wire [32:0] i_arith_controlword;
    wire [63:0] i_arith_constant;

    I_arith_decoder i_arith(
        .I(instruction),
        .state(state),
        .status(status),
        .I_a(i_arith_controlword),
        .k(i_arith_constant)
    );

    // I-Format Logic Decoder
    wire [32:0] i_logic_controlword;
    wire [63:0] i_logic_constant;

    // IW-Format Decoder
    wire [32:0] iw_controlword;
    wire [63:0] iw_constant;

    IW_decoder iw(
        .I(instruction),
        .state(state),
        .status(status),
        .cw_IW(iw_controlword),
        .K(iw_constant)
    );

    // R-Format Decoder
    wire [32:0] r_controlword;
    wire [63:0] r_constant;

    // Choose which of the data formats is correct
    wire [32:0] data_controlword;
    wire [63:0] data_constant;

    mux_8 data_mux(
        .in0({d_controlword, d_constant}),
        .in1({33'b0, 64'b0}),
        .in2({i_arith_controlword, i_arith_constant}),
        .in3({33'b0, 64'b0}),
        .in4({i_logic_controlword, i_logic_constant}),
        .in5({iw_controlword, iw_constant}),
        .in6({r_controlword, r_constant}),
        .in7({33'b0, 64'b0}),
        .out({data_controlword, data_constant}),
        .select(instruction[24:22])
    );

    defparam data_mux.n = 97;

    // B Instruction Decoder
    wire [32:0] b_controlword;
    wire [63:0] b_constant;

    b_decoder b(
        .instruction(instruction),
        .state(state),
        .status(status),
        .controlword(b_controlword),
        .constant(b_constant)
    );

    // B Conditional Instruction Decoder
    wire [32:0] bcond_controlword;
    wire [63:0] bcond_constant;

    b_condition_decoder bcond(
        .instruction(instruction),
        .state(state),
        .status(status),
        .controlword(bcond_controlword),
        .constant(bcond_constant)
    );

    // BL Instruction Decoder
    wire [32:0] bl_controlword;
    wire [63:0] bl_constant;

    BL_decoder bl(
        .I(instruction),
        .state(state),
        .status(status),
        .cw_IW(bl_controlword),
        .K(bl_constant)
    );

    // CBZ/CBNZ Instruction Decoder
    wire [32:0] cb_controlword;
    wire [63:0] cb_constant;

    cbz_cbnz_decoder cb(
        .instruction(instruction),
        .state(state),
        .status(status),
        .controlword(cb_controlword),
        .constant(cb_constant)
    );

    // BR Instruction Decoder
    wire [32:0] br_controlword;
    wire [63:0] br_constant;

    BR_decoder br(
        .I(instruction),
        .state(state),
        .status(status),
        .cw_IW(br_controlword),
        .K(br_constant)
    );

    // Choose which branch format is correct
    wire [32:0] branch_controlword;
    wire [63:0] branch_constant;

    mux_8 branch_mux(
        .in0({b_controlword, b_constant}),
        .in1({33'b0, 64'b0}),
        .in2({bcond_controlword, bcond_constant}),
        .in3({33'b0, 64'b0}),
        .in4({bl_controlword, bl_constant}),
        .in5({cb_controlword, cb_constant}),
        .in6({bcond_controlword, br_constant}),
        .in7({33'b0, 64'b0}),
        .out({branch_controlword, branch_constant}),
        .select(instruction[30:28])
    );

    defparam branch_mux.n = 97;

    assign {controlword_and_state, constant} = instruction[25] ? {branch_controlword, branch_constant} : {data_controlword, data_constant};

endmodule
