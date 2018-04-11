`define CW_BITS 94

module cu(instruction, status, reset, clock, control_word, constant);
    input [31:0] instruction;
    input [4:0] status;
    input reset, clock;
    output [`CW_BITS-1-64:0] control_word;
    output [63:0] constant;

    wire [10:0] opcode;
    assign opcode = instruction[31:21];

    wire [`CW_BITS:0] branch_cw, other_cw;
    wire [`CW_BITS:0] d_format_cw, i_arith_cw, i_logic_cw, iw_cw, r_alu_cw;
    wire [`CW_BITS:0] b_cw, b_cond_cw, bl_cw, cbz_cw, br_cw;

    wire ns;
    reg state;

    always @(posedge clock or posedge reset) begin
        if(reset)
            state <= 1'b0;
        else
            state <= ns;
    end

    d_decoder dec0_000 (instruction, d_format_cw);
    i_arith_decoder dec0_010(instruction, i_arith_cw);
    i_logic_decoder dec0_100 (instruction, i_logic_cw);
    iw_decoder dec0_101 ( instruction, state, iw_cw);
    r_alu_decoder dec0_110 (instruction, r_alu_cw);
    b_decoder (instruction, b_cw);
    b_cond_decoder dec1_000 (instruction, status[4:1], b_cond_cw);
    bl_decoder dec1_010 (instruction,);
//    br_decoder;

    assign {ns, constant, control_word} = opcode[5] ? branch_cw : other_cw;

    mux_8_to_1_nbit branch_mux (branch_cw, opcode[10:8],
        b_Cw, 0, b_cond_cw, 0 , bl_cw, cbz_cw, br_cw, 0);



endmodule
