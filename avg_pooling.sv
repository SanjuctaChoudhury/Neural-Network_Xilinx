`timescale 1ns / 1ps





module avg_pooling(
    input clk,
    input pool_en,
    input [7:0] in1,
    input [7:0] in2,
    input [7:0] in3,
    input [7:0] in4,
    output [7:0] out,
    output  pool_done
    );
    
    reg [15:0] pool_out;
    reg done;
    
    always @(posedge clk) begin
        if(pool_en == 1) begin
            pool_out <= (in1+in2+in3+in4)>> 2;
            done<=1;
        end
        else
            done<=0;
          
        
    end
    
    assign out = pool_out[7:0];
    //assign pool_done = (pool_out==(in1+in2+in3+in4)>> 2)? 1:0;
    assign pool_done=done;

endmodule
