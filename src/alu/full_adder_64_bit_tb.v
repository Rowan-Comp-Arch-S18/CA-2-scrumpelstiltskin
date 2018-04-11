module full_adder_64_bit_tb();

    reg [63:0] a, b;
    reg cin;

    reg [63:0] expected_F;
    reg expected_Cout;
    wire [63:0] F;
    wire Cout;

    full_adder_64_bit dut_01(a, b, cin, F, Cout);

    initial begin
        a <= 64'b0;
        b <= 64'b0;
        cin <= 1'b0;
        expected_F <= 64'b0;
        expected_Cout <= 0;

        #100;
        $stop;
    end

    always begin
        a <= {$random, $random};
        b <= {$random, $random};
        cin <= a[5];
        {expected_Cout, expected_F} = a + b + cin;

        if(expected_F != F || expected_Cout != Cout)
            $display("ERR:\tCin[%064b]\n\tA  [%064b]\n\tB  [%064b]\n\tF  [%064b]\n\tXF [%064b]\n\tCout  [%01b]\n\tXCout [%01b]\n\n",cin,a,b,F,expected_F,Cout,expected_Cout);
        else
            $display("PASS\n");
        #10;
    end
endmodule
