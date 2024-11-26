module multiplier #(
    parameter DATA_WIDTH = 8, 
    parameter PRODUCT_WIDTH = DATA_WIDTH * 2 
)(
    input logic clk,
    input logic reset,
    input logic valid,                        
    input logic signed [DATA_WIDTH-1:0] a,   
    input logic signed [DATA_WIDTH-1:0] b,    
    output logic signed [PRODUCT_WIDTH-1:0] product 
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            product <= 0;
        end else if (valid) begin
            product <= a * b;
            // https://en.wikipedia.org/wiki/Booth%27s_multiplication_algorithm
        end
    end

endmodule