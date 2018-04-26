module I_logic(state, status, I, I_logic, k);

    input[31:0] I;
    input[4:0] status;
    input[1:0] state;
    output[32:0] I_logic;
    output [63:0] k;

    wire [11:0] zf;
    wire [9:0] op;
    wire [4:0] Rn;
    wire [4:0] Rd;

    assign {op, zf, Rn, Rd} = I;

    wire alu_enable;
    wire alu_bs;
    wire [4:0] alu_fs;

    wire databus_register_file_b_enable;
    wire [4:0] register_sa;
    wire [4:0] register_sb;
    wire [4:0] register_wa;
    wire register_w;

    wire databus_ram_enable;
    wire ram_w;

    wire databus_pc_enable;
    wire [1:0] pc_fs;
    wire pc_input_select;

    wire status_load;
    wire [1:0] NS;

    assign k = zf;

    assign I_logic = {
        alu_enable,
        alu_bs,
        alu_fs,
        databus_register_file_b_enable,
        register_sa,
        register_sb,
        register_wa,
        register_w,
        databus_ram_enable,
        ram_w,
        databus_pc_enable,
        pc_fs,
        pc_input_select,
        status_load,
        NS
    };

    assign alu_enable = 1'b1;
    //assign alu_bs = 1'b1;
    assign alu_bs = I[28];
    //   000   001   010   011   100   101  110 111
    // { and   or    add   xor   left right  0   0 }
    assign alu_fs = {1'b0,op[9:8],2'b00 }; // bit 9:8 is the determine the function
    assign databus_register_file_b_enable = 1'b0;
    assign register_sa = Rn;
    //assign register_sb = 5'b00000;
    assign register_sb = I[20:16];
    assign register_wa = Rd;
    assign register_w = 1'b1;
    assign databus_ram_enable = 1'b0;
    assign ram_w = 1'b0;
    assign databus_pc_enable = 1'b0;
    assign pc_fs = 2'b1;
    assign pc_input_select = 1'b1;
    assign status_load = op[9:8] == 2'b11 ? 1'b1 : 1'b0;  //bit 9:8 at 11 determines the status_load
    assign NS = 2'b00;

endmodule
