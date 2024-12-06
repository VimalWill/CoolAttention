module multiplier_8bit #(
    parameter DATA_WIDTH = 8, 
    parameter PROD_WIDTH = DATA_WIDTH * 2
)(
    input logic clk, 
    input logic rst,
    input logic ebl,
    input logic [DATA_WIDTH-1:0] a_in, 
    input logic [DATA_WIDTH-1:0] b_in, 
    output logic [PROD_WIDTH-1:0] out
); 

    logic [PROD_WIDTH-1:0] tmp; 

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            tmp <= {PROD_WIDTH{1'b0}}; 
        end else if (ebl) begin
            tmp <= a_in * b_in;  
        end
    end

    assign out = tmp;

endmodule
