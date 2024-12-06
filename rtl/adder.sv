module half_adder(
    input logic clk, 
    input logic rst, 
    input logic ebl, 
    input logic a_in, 
    input logic b_in, 

    output logic sum, 
    output logic carry
);
    logic itl_sum; 
    logic itl_carry; 

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            itl_sum <= 1'b0; 
            itl_carry <= 1'b0; 
        end else if (ebl) begin
            itl_sum <= a_in ^ b_in; 
            itl_carry <= a_in && b_in; 
        end
    end

    assign sum = itl_sum; 
    assign carry = itl_carry; 

endmodule

module full_adder(
    input logic clk, 
    input logic rst, 
    input logic ebl, 
    input logic a_in, 
    input logic b_in, 
    input logic crry_in, 

    output logic sum, 
    output logic carry
); 
    logic ha1_sum, ha2_sum; 
    logic ha1_crry, ha2_crry; 

   
    half_adder ha_1(
        .clk(clk), 
        .rst(rst), 
        .ebl(ebl), 
        .a_in(a_in), 
        .b_in(b_in), 
        .sum(ha1_sum), 
        .carry(ha1_crry)
    ); 

    half_adder ha_2(
        .clk(clk), 
        .rst(rst), 
        .ebl(ebl), 
        .a_in(ha1_sum), 
        .b_in(crry_in), 
        .sum(ha2_sum), 
        .carry(ha2_crry)
    ); 

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin 
            sum <= 1'b0; 
            carry <= 1'b0; 
        end else if (ebl) begin
            sum <= ha2_sum; 
            carry <= ha1_crry || ha2_crry; 
        end
    end

endmodule

module adder_16bit #(
    parameter DATA_WIDTH = 16
)(
    input logic clk, 
    input logic rst, 
    input logic ebl,
    input logic [DATA_WIDTH-1:0] a_in, 
    input logic [DATA_WIDTH-1:0] b_in, 
    output logic [DATA_WIDTH-1:0] out,
    output logic carry_out
);

    logic [DATA_WIDTH-1:0] carry;

    half_adder ha_1(
        .clk(clk), 
        .rst(rst), 
        .ebl(ebl), 
        .a_in(a_in[0]), 
        .b_in(b_in[0]), 
        .sum(out[0]), 
        .carry(carry[0])
    );

    genvar i;
    generate
        for (i = 1; i < DATA_WIDTH; i++) begin : full_adders
            full_adder fa_i(
                .clk(clk), 
                .rst(rst), 
                .ebl(ebl), 
                .a_in(a_in[i]), 
                .b_in(b_in[i]), 
                .crry_in(carry[i-1]), 
                .sum(out[i]), 
                .carry(carry[i])
            );
        end
    endgenerate

    assign carry_out = carry[DATA_WIDTH-1];

endmodule
