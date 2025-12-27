

module relu #(parameter WIDTH = 8)(
    input signed [4*WIDTH-1:0] data_in,
    output signed [2*WIDTH-1:0] data_out
    );
    
    wire signed [4*WIDTH-1:0] temp;
    
    assign temp = (data_in > 0)? data_in:0;
    assign data_out = temp>>16  ;
    
endmodule
