module mac_nbit #(
    parameter DATA_WIDTH = 8, 
    parameter PROD_WIDTH = 16
)(
    input logic clk, 
    input logic rst, 
    input logic ebl, 

    input logic [DATA_WIDTH-1:0] a_in, 
    input logic [DATA_WIDTH-1:0] b_in, 

    input logic [DATA_WIDTH-1:0] c_in, 
    input logic [DATA_WIDTH-1:0] d_in, 

    output logic[PROD_WIDTH-1:0] out
); 

    logic [DATA_WIDTH-1:0] a_reg, b_reg, c_reg, d_reg; 
    wire [PROD_WIDTH-1:0] ab_out, cd_out; 
    logic [PROD_WIDTH-1:0] add_out; 

    multiplier_8bit mul_a(
        .clk(clk), 
        .rst(rst), 
        .ebl(ebl), 
        .a_in(a_in), 
        .b_in(b_in), 
        .out(ab_out)
    ); 

    multiplier_8bit mul_b(
        .clk(clk), 
        .rst(rst), 
        .ebl(ebl), 
        .a_in(c_in), 
        .b_in(d_in), 
        .out(cd_out)
    ); 

    adder_nb adder(
        .clk(clk), 
        .rst(rst), 
        .ebl(ebl), 
        .a_in(ab_out), 
        .b_in(cd_out), 
        .out(add_out)
    ); 

    always_ff @( posedge clk or posedge rst) begin
        if (rst) begin
            a_reg <= {DATA_WIDTH{1'b0}}; 
            b_reg <= {DATA_WIDTH{1'b0}}; 
            c_reg <= {DATA_WIDTH{1'b0}}; 
            d_reg <= {DATA_WIDTH{1'b0}}; 

            add_out = {PROD_WIDTH{1'b0}}; 
        end if (ebl) begin
            a_reg <= a_in; 
            b_reg <= b_in; 
            c_reg <= c_in; 
            d_reg <= d_in; 
        end
    end

    assign out = add_out; 

endmodule