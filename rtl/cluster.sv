// 8 input mac cluster
module mac_cluster #(
    parameter DATA_WIDTH = 8,
    parameter PROD_WIDTH = 16
)(
    input logic clk, 
    input logic rst, 
    input logic ebl, 

    input logic [DATA_WIDTH-1:0] m1_a, 
    input logic [DATA_WIDTH-1:0] m1_b, 

    input logic [DATA_WIDTH-1:0] m2_a, 
    input logic [DATA_WIDTH-1:0] m2_b,

    input logic [DATA_WIDTH-1:0] m3_a, 
    input logic [DATA_WIDTH-1:0] m3_b,

    input logic [DATA_WIDTH-1:0] m4_a,
    input logic [DATA_WIDTH-1:0] m4_b,

    input logic [DATA_WIDTH-1:0] m5_a,
    input logic [DATA_WIDTH-1:0] m5_b,

    input logic [DATA_WIDTH-1:0] m6_a,
    input logic [DATA_WIDTH-1:0] m6_b,

    input logic [DATA_WIDTH-1:0] m7_a,
    input logic [DATA_WIDTH-1:0] m7_b,

    input logic [DATA_WIDTH-1:0] m8_a,
    input logic [DATA_WIDTH-1:0] m8_b,

    output logic [PROD_WIDTH-1:0] out
); 

    logic [DATA_WIDTH-1:0] m1_areg, m1_breg; 
    logic [DATA_WIDTH-1:0] m2_areg, m2_breg;
    logic [DATA_WIDTH-1:0] m3_areg, m3_breg; 
    logic [DATA_WIDTH-1:0] m4_areg, m4_breg; 
    logic [DATA_WIDTH-1:0] m5_areg, m5_breg; 
    logic [DATA_WIDTH-1:0] m6_areg, m6_breg; 
    logic [DATA_WIDTH-1:0] m7_areg, m7_breg; 
    logic [DATA_WIDTH-1:0] m8_areg, m8_breg;

    logic [PROD_WIDTH-1:0] mac1_res;
    logic [PROD_WIDTH-1:0] mac2_res;
    logic [PROD_WIDTH-1:0] mac3_res;
    logic [PROD_WIDTH-1:0] mac4_res;

    reg [PROD_WIDTH-1:0] intm_mac12, intm_mac34; 
    reg [PROD_WIDTH-1:0] out_reg;

    mac_nbit mac_1(
        .clk(clk), 
        .rst(rst), 
        .ebl(ebl), 
        .a_in(m1_areg), 
        .b_in(m1_breg), 
        .c_in(m2_areg), 
        .d_in(m2_breg), 
        .out(mac1_res)
    ); 

    mac_nbit mac_2(
        .clk(clk),
        .rst(rst),
        .ebl(ebl),
        .a_in(m3_areg),
        .b_in(m3_breg),
        .c_in(m4_areg),
        .d_in(m4_breg),
        .out(mac2_res)
    ); 

    mac_nbit mac_3(
        .clk(clk),
        .rst(rst),
        .ebl(ebl),
        .a_in(m5_areg),
        .b_in(m5_breg),
        .c_in(m6_areg),
        .d_in(m6_breg),
        .out(mac3_res)
    );

    mac_nbit mac_4(
        .clk(clk),
        .rst(rst),
        .ebl(ebl),
        .a_in(m7_areg),
        .b_in(m7_breg),
        .c_in(m8_areg),
        .d_in(m8_breg),
        .out(mac4_res)
    );

    adder_nb addr_mac12(
        .clk(clk),
        .rst(rst),
        .ebl(ebl),
        .a_in(mac1_res),
        .b_in(mac2_res),
        .out(intm_mac12)
    ); 

    adder_nb addr_mac34(
        .clk(clk),
        .rst(rst),
        .ebl(ebl),
        .a_in(mac3_res),
        .b_in(mac4_res),
        .out(intm_mac34)
    ); 

    adder_nb addr_out(
        .clk(clk),
        .rst(rst),
        .ebl(ebl),
        .a_in(intm_mac12),
        .b_in(intm_mac34),
        .out(out_reg)
    ); 

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            m1_areg <= {DATA_WIDTH{1'b0}}; 
            m1_breg <= {DATA_WIDTH{1'b0}}; 
            m2_areg <= {DATA_WIDTH{1'b0}}; 
            m2_breg <= {DATA_WIDTH{1'b0}}; 
            m3_areg <= {DATA_WIDTH{1'b0}}; 
            m3_breg <= {DATA_WIDTH{1'b0}}; 
            m4_areg <= {DATA_WIDTH{1'b0}}; 
            m4_breg <= {DATA_WIDTH{1'b0}}; 
            m5_areg <= {DATA_WIDTH{1'b0}}; 
            m5_breg <= {DATA_WIDTH{1'b0}}; 
            m6_areg <= {DATA_WIDTH{1'b0}}; 
            m6_breg <= {DATA_WIDTH{1'b0}}; 
            m7_areg <= {DATA_WIDTH{1'b0}}; 
            m7_breg <= {DATA_WIDTH{1'b0}}; 
            m8_areg <= {DATA_WIDTH{1'b0}}; 
            m8_breg <= {DATA_WIDTH{1'b0}}; 

            mac1_res = {PROD_WIDTH{1'b0}}; 
            mac2_res = {PROD_WIDTH{1'b0}}; 
            mac3_res = {PROD_WIDTH{1'b0}}; 
            mac4_res = {PROD_WIDTH{1'b0}};

            intm_mac12 = {PROD_WIDTH{1'b0}};
            intm_mac34 = {PROD_WIDTH{1'b0}}; 
            out_reg = {PROD_WIDTH{1'b0}}; 
        end else if (ebl) begin
            m1_areg <= m1_a; 
            m1_breg <= m1_b; 
            m2_areg <= m2_a; 
            m2_breg <= m2_b; 
            m3_areg <= m3_a; 
            m3_breg <= m3_b; 
            m4_areg <= m4_a; 
            m4_breg <= m4_b; 
            m5_areg <= m5_a; 
            m5_breg <= m5_b; 
            m6_areg <= m6_a; 
            m6_breg <= m6_b; 
            m7_areg <= m7_a; 
            m7_breg <= m7_b; 
            m8_areg <= m8_a; 
            m8_breg <= m8_b;
        end
    end
    
    assign out = out_reg;

endmodule