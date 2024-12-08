module mac_8bit #(
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
    output logic [PROD_WIDTH-1:0] out,
    output logic carry_out
);

    logic [PROD_WIDTH-1:0] mul1_res, mul2_res;
    logic [PROD_WIDTH-1:0] sum_res;
    logic adder_carry_out;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            out <= '0;
            carry_out <= 1'b0;
        end else if (ebl) begin
            out <= sum_res;
            carry_out <= adder_carry_out;
        end
    end

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
        .ebl(ebl),
        .a_in(mul1_res),
        .b_in(mul2_res),
        .out(sum_res),
        .carry_out(adder_carry_out)
    );

endmodule