module half_adder(
    input logic a_in, 
    input logic b_in, 
    output logic out, 
    output logic carry
); 

    assign out = a_in ^ b_in; 
    assign carry = a_in && b_in; 
    
endmodule

module full_adder(
    input logic a_in, 
    input logic b_in, 
    input logic carry_in, 
    output logic out, 
    output logic carry
); 

    logic ha1_out, ha1_carry; 
    logic ha2_carry; 

    half_adder ha_1(
        .a_in(a_in),
        .b_in(b_in), 
        .out(ha1_out), 
        .carry(ha1_carry)
    ); 

    half_adder ha_2(
        .a_in(carry_in), 
        .b_in(ha1_out), 
        .out(out), 
        .carry(ha2_carry)
    ); 

    assign carry = ha2_carry || ha1_carry; 

endmodule

module adder_nb #(
    parameter DATA_WIDTH = 16
)(
    input logic clk, 
    input logic rst, 
    input logic ebl, 

    input logic [DATA_WIDTH-1:0] a_in,
    input logic [DATA_WIDTH-1:0] b_in,

    output logic [DATA_WIDTH-1:0] out
); 

    wire [DATA_WIDTH-1:0] carry_tmp; 
    logic [DATA_WIDTH-1:0] a_reg, b_reg, out_reg; 

    half_adder ha(
        .a_in(a_reg[0]),
        .b_in(b_reg[0]),
        .out(out_reg[0]), 
        .carry(carry_tmp[0])
    ); 

    genvar i; 
    generate
        for(i=1; i<DATA_WIDTH; i++) begin
            full_adder fa(
                .a_in(a_reg[i]), 
                .b_in(b_reg[i]),
                .carry_in(carry_tmp[i-1]),
                .out(out_reg[i]),
                .carry(carry_tmp[i])
            ); 
        end
    endgenerate

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            a_reg <= {DATA_WIDTH{1'b0}}; 
            b_reg <= {DATA_WIDTH{1'b0}}; 
            out_reg = {DATA_WIDTH{1'b0}};
        end else if (ebl) begin
            a_reg <= a_in; 
            b_reg <= b_in; 
        end
    end

    assign out = out_reg; 

endmodule
