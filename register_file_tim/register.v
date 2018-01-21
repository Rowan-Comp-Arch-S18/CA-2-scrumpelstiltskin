module register(data_out, data_in, load, reset, clock);
    parameter n = 8;

    output reg [n-1:0] data_out;

    input [n-1:0] data_in;
    input load;
    input reset;
    input clock;

    always @ (posedge clock or posedge reset) begin
        if (reset) begin
            data_out <= 0;
        end else if (load) begin
            data_out <= data_in;
        end else begin
            data_out <= data_out;
        end
    end
endmodule


// Later

register regg (wqrewed);

defparam regg.n = 64;

