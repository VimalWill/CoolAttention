// 32 input mac cluster
module mac_cluster #(
    parameter DATA_WIDTH = 8
    parameter PROD_WIDTH = 16
)(
    input logic clk, 
    input logic rst, 
    input logic ebl, 

    input logic [DATA_WIDTH-1:0] m1_a, 
    input logic [DATA_WIDTH-1:0] m1_b, 

    input logic [DATA_WIDTH-1:0] m2_a, 
    input logic [DATA_WIDTH-1:0] m2_b,
); 

    logic [PROD_WIDTH-1:0] m1_res, m2_res; 
    logic [PROD_WIDTH-1:0] res_12; 
    logic crry_12; 

    multiplier_8bit mul_1(
        .clk(clk), 
        .rst(rst), 
        .ebl(ebl), 
        .a_in(m1_a), 
        .b_in(m1_b), 
        .out(m1_res)
    ); 

       multiplier_8bit mul_1(
        .clk(clk), 
        .rst(rst), 
        .ebl(ebl), 
        .a_in(m2_a), 
        .b_in(m2_b), 
        .out(m2_res)
    );

    adder_16bit add_1(
        .clk(clk),
        .rst(rst), 
        .ebl(ebl), 
        .a_in(m1_res),
        .b_in(m2_res), 
        .out(res_12); 
        .carry_out(crry_12)
    ); 

endmodule