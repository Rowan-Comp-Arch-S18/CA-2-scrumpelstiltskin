module register_64_bit (Q, D, load, reset, clock);
    parameter n = 64;

    input [n-1:0] D;
    input load;
    input reset;
    input clock;

    output reg [n-1:0] Q;

    always @ (posedge clock or posedge reset) begin
        if (reset)
            Q <= 0;
        else if (load)
            Q <= D;
    end

endmodule

