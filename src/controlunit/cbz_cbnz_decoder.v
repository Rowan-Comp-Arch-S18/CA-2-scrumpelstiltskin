
module cbz_cbnz_decoder(instruction, state, status, controlword, constant); // double check if correct
    
    input [31:0] instruction;
    input [1:0] state;
    input [4:0] status;
    output [32:0] controlword;
    output [63:0] constant;

    wire databus_alu_enable;
    wire alu_b_select;
    wire [4:0] alu_function_select;

    wire databus_register_file_b_enable;
    wire [4:0] register_file_select_a;
    wire [4:0] register_file_select_b;
    wire [4:0] register_file_address;
    wire register_file_write;

    wire databus_ram_enable;
    wire ram_write;
    wire [1:0] next_state;

    wire databus_program_counter_enable;
    wire [1:0] program_counter_function_select;
    wire program_counter_input_select;

    wire status_load;

    assign constant = {{45{instruction[23]}}, instruction[23:5]};

    assign controlword = {
        databus_alu_enable,
        alu_b_select,
        alu_function_select,
        databus_register_file_b_enable,
        register_file_select_a,
        register_file_select_b,
        register_file_address,
        register_file_write,
        databus_ram_enable,
        ram_write,
        databus_program_counter_enable,
        program_counter_function_select,
        program_counter_input_select,
        status_load,
        next_state
    };

    assign databus_alu_enable = 1'b0;
    assign alu_b_select = 1'b0;
    assign alu_function_select = 5'b00100;
    assign databus_register_file_b_enable = 1'b0;
    assign register_file_select_a = instruction[4:0];
    assign register_file_select_b = 5'd31;
    assign register_file_address = 5'b0;
    assign register_file_write = 1'b0;
    assign databus_ram_enable = 1'b0;
    assign ram_write = 1'b0;
    assign databus_program_counter_enable = 1'b1;
    assign program_counter_function_select = 2'b11;
    assign program_counter_input_select = 1'b1;
    assign status_load = 1'b0;
    assign next_state = 2'b00;

endmodule
