module datapath(control_word, k, clk, reset,  status);

input clk, reset;
input [63:0] k;
input [26:0] control_word;

output [3:0] status;

wire [4:0] ALU_FS;
wire [63:0] ALU_A, ALU_B;
wire ALU_Cin;
wire [3:0] ALU_status;
wire [63:0] ALU_F;

wire RF_w, RF_reset, RF_clock;
wire [4:0] RF_AA, RF_AB, RF_DA;
wire [63:0] RF_A, RF_B, RF_D;



wire [63:0] RAM_in, RAM_out;
wire [12:0] RAM_address;
wire RAM_clock, RAM_write;

wire EN_RAM, EN_ALU, B_sel;
wire [63:0] DATA_BUS;

assign {ALU_FS, ALU_Cin, RF_AA, RF_BB, RF_DA, RF_w, RAM_write, EN_ALU, EN_RAM, B_sel} = control_word;

alu alu_inst(
    .FS(ALU_FS), .A(ALU_A), .B(ALU_B), .Cin(ALU_Cin),   // inputs
    .F(ALU_F), .status(ALU_status)                     // outputs
);

register_file register_file_ins(
    .A(RF_A), .B(RF_B), .AA(RF_AA), .AB(RF_AB), .DA(RF_DA), .w(RF_w), .reset(RF_reset), .clock(RF_clock),   // inputs
    .D(RF_D)                                                        // outputs
);

ram ram_inst(
    .in(RAM_in), .address(RAM_address), .write(RAM_write), .clock(RAM_clock),  // inputs
    .out(RAM_out)                                  // outputs
);

assign DATA_BUS = EN_ALU ? ALU_F : {64{1'bz}};
assign DATA_BUS = EN_RAM ? RAM_out : {64{1'bz}};
assign status = ALU_status;


///
////
//

pc pc_inst (pc, pc4, in, ps, clock, reset);
endmodule
