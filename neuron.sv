module neuron #(parameter IN_SIZE=196, WIDTH=8)(
    input clk,
    input en,
    input reset,
    input signed [2*WIDTH-1:0] in_data [0:IN_SIZE-1],
    input signed [WIDTH-1:0] weight [0:IN_SIZE-1],
    input signed [WIDTH-1:0] bias,
    output signed [4*WIDTH-1:0] neuron_out,
    output neuron_done
    );

    integer addr = 0;
    reg done = 0;

    wire signed [4*WIDTH-1:0] product_w;
    reg signed  [4*WIDTH-1:0] out = 0;

    assign product_w = in_data[addr] * weight[addr];

    always @(posedge clk) begin
        if (reset) begin
            done <= 0;
            addr <= 0;
            out  <= 0;
        end
        else if (en) begin

            if (addr < IN_SIZE) begin
                out <= out + product_w;

               // $display("NEURON: addr=%0d, in=%d, weight=%d, product=%d, running_sum=%d",
                    //addr, in_data[addr], weight[addr], product_w, out);

                addr <= addr + 1;
                done <= 0;

            end else if (addr == IN_SIZE) begin
                done <= 1;
            end
        end
    end

    assign neuron_out  = out + bias;
    assign neuron_done = done;

endmodule
