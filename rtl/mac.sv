module mac_8bit #(
    parameter DATA_WIDTH = 8, 
    parameter PROD_WIDTH = 16, 
)(
    input logic clk, 
    input logic rst, 
    input logic ebl, 
    input logic [DATA_WIDTH-1:0] a_in, 
    input logic [DATA_WIDTH-1:0] b_in, 
    input logic [DATA_WIDTH-1:0] c_in, 
    input logic [DATA_WIDTH-1:0] d_in, 
    output logic [PROD_WIDTH-1:0] out, 
    output logic [PROD_WIDTH-1:0] carry_out
); 

    logic [PROD_WIDTH-1:0] mul1_res, mul2_res; 
    logic [PROD_WIDTH-1:0] tmp_sum, tmp_crry; 

    multiplier_8bit mul_1(
        .clk(clk), 
        .rst(rst), 
        .ebl(ebl), 
        .a_in(a_in), 
        .b_in(b_in), 
        .out(mul1_res)
    ); 

    multiplier_8bit mul_2(
        .clk(clk), 
        .rst(rst), 
        .ebl(ebl), 
        .a_in(c_in), 
        .b_in(d_in), 
        .out(mul2_res)
    ); 

    adder_16bit adder(
        .clk(clk), 
        .rst(rst), 
        .a_in(mul1_res), 
        .b_in(mul2_res), 
        .sum(tmp_sum), 
        .carry_out(tmp_crry)
    ); 

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            mul1_res <= 16'b0; 
            mul2_res <= 16'b0; 
            tmp_sum <= 16'b0; 
            tmp_crry <= 16'b0; 
        end 

    assign out = tmp_sum; 
    assign carry_out = tmp_crry; 
    end 

    

endmodule