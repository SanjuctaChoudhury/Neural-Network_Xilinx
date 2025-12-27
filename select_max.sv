module select_max #(
    parameter NEURON_NB = 10,
    parameter WIDTH = 8
)(
    input  clk,
    input  enable,
    input  reset,
    input  signed [2*WIDTH-1:0] in_data [0:NEURON_NB-1],
    output reg [WIDTH-1:0] digit,
    output reg layer_done
);

    integer j;
    reg signed [2*WIDTH-1:0] max_val;

    always @(posedge clk) begin
        if (reset) begin
            digit      <= 0;
            max_val    <= 0;
            layer_done <= 0;
        end 
        else if (enable) begin
           
            max_val = in_data[0];
            digit   = 0;

            for (j = 1; j < NEURON_NB; j = j + 1) begin
                if (in_data[j] >= max_val) begin
                    max_val = in_data[j];
                    digit   = j;
                end
            end

            
            layer_done <= 1;
        end
    end

endmodule
