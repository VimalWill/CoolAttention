module mul_8bit(
    input logic rst, 
    input logic clk, 
    input logic [7:0] a_in, 
    input logic [7:0] b_in, 
    input logic mul_st, 
    input logic mul_dn, 

    output logic [15:0] out
); 

    always @(posedge clk) begin
        if (mul_st == 1'b1) begin
            for(int i = 0; i < $size(out); i++) {
                
            }
        end
    end

endmodule