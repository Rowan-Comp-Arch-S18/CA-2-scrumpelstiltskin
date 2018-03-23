module alu_tb();

    reg [63:0] a_in;
    reg [63:0] b_in;

    reg [4:0] function_select;

    wire [63:0] data_out;
    reg [63:0] expected;

    wire [3:0] status;
    reg [3:0] expected_status;

    reg cin;
    wire cout;
    wire [2:0] func;
    wire [1:0] neg;

    assign func = function_select[4:2];
    assign neg = function_select[1:0];

    reg [63:0] dump;

    alu dut1 (
        function_select,
        a_in,
        b_in,
        cin,
        data_out,
        cout,
        status
    );

    initial begin
        a_in = {$random, $random};
        b_in = {$random, $random};
        cin <= 1'b0;

        function_select <= 5'd0;

        expected <= 64'd0;
        expected_status <= 4'd0;

        #350;
        $stop;
    end

    always begin
        a_in <= {$random, $random};
        b_in <= {$random, $random};
        #10;
        function_select <= function_select + 1;
        #1;
        $display("\FS [%b] FLIP[%b]", function_select[4:2], function_select[1:0]);
        if(data_out != expected)
            $display("ERR: A [%b] [%h]\nB [%b] [%h]\nF [%b] [%h]\nX [%b] [%h]", a_in, a_in, b_in, b_in, data_out, data_out, expected, expected);
        else
            $display("PASS: DATA_OUT");
        if(expected_status != status)
            $display("ERR:  STATUS S [%b]\n\t       X [%b]",expected_status, status);
        else
            $display("PASS: STATUS S");
        $display("\n");
    end

    always @ (*) begin
        case (function_select)
            {3'd0, 2'b00}: expected = a_in & b_in;
            {3'd1, 2'b00}: expected = a_in | b_in;
            {3'd2, 2'b00}: expected = a_in + b_in + cin;
            {3'd3, 2'b00}: expected = a_in ^ b_in;
            {3'd4, 2'b00}: expected = a_in << b_in[5:0];
            {3'd5, 2'b00}: expected = a_in >> b_in[5:0];
            {3'd6, 2'b00}: expected = 64'd0;
            {3'd7, 2'b00}: expected = 64'd0;
            {3'd0, 2'b01}: expected = ~a_in & b_in;
            {3'd1, 2'b01}: expected = ~a_in | b_in;
            {3'd2, 2'b01}: expected = ~a_in + b_in + cin;
            {3'd3, 2'b01}: expected = ~a_in ^ b_in;
            {3'd4, 2'b01}: expected = ~a_in << b_in[5:0];
            {3'd5, 2'b01}: expected = ~a_in >> b_in[5:0];
            {3'd6, 2'b01}: expected = 64'd0;
            {3'd7, 2'b01}: expected = 64'd0;
            {3'd0, 2'b10}: expected = a_in & ~b_in;
            {3'd1, 2'b10}: expected = a_in | ~b_in;
            {3'd2, 2'b10}: expected = a_in + ~b_in + cin;
            {3'd3, 2'b10}: expected = a_in ^ ~b_in;
            {3'd4, 2'b10}: expected = a_in << ~b_in[5:0];
            {3'd5, 2'b10}: expected = a_in >> ~b_in[5:0];
            {3'd6, 2'b10}: expected = 64'd0;
            {3'd7, 2'b10}: expected = 64'd0;
            {3'd0, 2'b11}: expected = ~a_in & ~b_in;
            {3'd1, 2'b11}: expected = ~a_in | ~b_in;
            {3'd2, 2'b11}: expected = ~a_in + ~b_in + cin;
            {3'd3, 2'b11}: expected = ~a_in ^ ~b_in;
            {3'd4, 2'b11}: expected = ~a_in << ~b_in[5:0];
            {3'd5, 2'b11}: expected = ~a_in >> ~b_in[5:0];
            {3'd6, 2'b11}: expected = 64'd0;
            {3'd7, 2'b11}: expected = 64'd0;
        endcase

        case (function_select[1:0])
            2'b00: begin
                expected_status[0] = ~(a_in[63] ^ b_in[63]) & (expected[63] ^ a_in[63]);
                {expected_status[1], dump} = a_in + b_in + cin;
                expected_status[2] = expected[63];
                expected_status[3] = (expected == 64'd0) ? 1'b1 : 1'b0;
            end
            2'b01: begin
                expected_status[0] = ~(~a_in[63] ^ b_in[63]) & (expected[63] ^ ~a_in[63]);
                {expected_status[1], dump} = ~a_in + b_in + cin;
                expected_status[2] = expected[63];
                expected_status[3] = (expected == 64'd0) ? 1'b1 : 1'b0;
            end
            2'b10: begin
                expected_status[0] = ~(a_in[63] ^ ~b_in[63]) & (expected[63] ^ a_in[63]);
                {expected_status[1], dump} = a_in + ~b_in + cin;
                expected_status[2] = expected[63];
                expected_status[3] = (expected == 64'd0) ? 1'b1 : 1'b0;
            end
            2'b11: begin
                expected_status[0] = ~(~a_in[63] ^ ~b_in[63]) & (expected[63] ^ ~a_in[63]);
                {expected_status[1], dump} = ~a_in + ~b_in + cin;
                expected_status[2] = expected[63];
                expected_status[3] = (expected == 64'd0) ? 1'b1 : 1'b0;
            end
        endcase
    end

endmodule
