module #(
    parameter IN_DATA_WIDTH = 64,
    parameter PE_DATA_WIDTH = 8,
    parameter PE_OUT_WIDTH = 16
)(
    input logic clk,
    input logic rst,
    input logic ebl,

    input logic [IN_DATA_WIDTH-1:0] cl1_a_in,
    input logic [IN_DATA_WIDTH-1:0] cl1_b_in,

    input logic [IN_DATA_WIDTH-1:0] cl2_a_in,
    input logic [IN_DATA_WIDTH-1:0] cl2_b_in,

    input logic [IN_DATA_WIDTH-1:0] cl3_a_in,
    input logic [IN_DATA_WIDTH-1:0] cl3_b_in,

    input logic [IN_DATA_WIDTH-1:0] cl4_a_in,
    input logic [IN_DATA_WIDTH-1:0] cl4_b_in,

    output logic [IN_DATA_WIDTH-1:0] out
);

    reg [PE_DATA_WIDTH-1:0] cl1_m1_a, cl1_m1_b; 
    reg [PE_DATA_WIDTH-1:0] cl1_m2_a, cl1_m2_b;
    reg [PE_DATA_WIDTH-1:0] cl1_m3_a, cl1_m3_b;
    reg [PE_DATA_WIDTH-1:0] cl1_m4_a, cl1_m4_b; 
    reg [PE_DATA_WIDTH-1:0] cl1_m5_a, cl1_m5_b;
    reg [PE_DATA_WIDTH-1:0] cl1_m6_a, cl1_m6_b; 
    reg [PE_DATA_WIDTH-1:0] cl1_m7_a, cl1_m7_b; 
    reg [PE_DATA_WIDTH-1:0] cl1_m8_a, cl1_m8_b; 

    reg [PE_DATA_WIDTH-1:0] cl2_m1_a, cl2_m1_b; 
    reg [PE_DATA_WIDTH-1:0] cl2_m2_a, cl2_m2_b;
    reg [PE_DATA_WIDTH-1:0] cl2_m3_a, cl2_m3_b;
    reg [PE_DATA_WIDTH-1:0] cl2_m4_a, cl2_m4_b; 
    reg [PE_DATA_WIDTH-1:0] cl2_m5_a, cl2_m5_b;
    reg [PE_DATA_WIDTH-1:0] cl2_m6_a, cl2_m6_b; 
    reg [PE_DATA_WIDTH-1:0] cl2_m7_a, cl2_m7_b; 
    reg [PE_DATA_WIDTH-1:0] cl2_m8_a, cl2_m8_b; 

    reg [PE_DATA_WIDTH-1:0] cl3_m1_a, cl3_m1_b; 
    reg [PE_DATA_WIDTH-1:0] cl3_m2_a, cl3_m2_b;
    reg [PE_DATA_WIDTH-1:0] cl3_m3_a, cl3_m3_b;
    reg [PE_DATA_WIDTH-1:0] cl3_m4_a, cl3_m4_b; 
    reg [PE_DATA_WIDTH-1:0] cl3_m5_a, cl3_m5_b;
    reg [PE_DATA_WIDTH-1:0] cl3_m6_a, cl3_m6_b; 
    reg [PE_DATA_WIDTH-1:0] cl3_m7_a, cl3_m7_b; 
    reg [PE_DATA_WIDTH-1:0] cl3_m8_a, cl3_m8_b;

    reg [PE_DATA_WIDTH-1:0] cl4_m1_a, cl4_m1_b; 
    reg [PE_DATA_WIDTH-1:0] cl4_m2_a, cl4_m2_b;
    reg [PE_DATA_WIDTH-1:0] cl4_m3_a, cl4_m3_b;
    reg [PE_DATA_WIDTH-1:0] cl4_m4_a, cl4_m4_b; 
    reg [PE_DATA_WIDTH-1:0] cl4_m5_a, cl4_m5_b;
    reg [PE_DATA_WIDTH-1:0] cl4_m6_a, cl4_m6_b; 
    reg [PE_DATA_WIDTH-1:0] cl4_m7_a, cl4_m7_b; 
    reg [PE_DATA_WIDTH-1:0] cl4_m8_a, cl4_m8_b;

    reg [PE_OUT_WIDTH-1:0] cl1_out, cl2_out; 
    reg [PE_OUT_WIDTH-1:0] cl3_out, cl4_out; 

    mac_cluster cl1(
        .clk(clk), 
        .rst(rst),
        .ebl(ebl),
        .m1_a(cl1_m1_a),
        .m1_b(cl1_m1_b),
        .m2_a(cl1_m2_a),
        .m2_b(cl1_m2_b),
        .m3_a(cl1_m3_a),
        .m3_b(cl1_m3_b),
        .m4_a(cl1_m4_a),
        .m4_b(cl1_m4_b),
        .m5_a(cl1_m5_a),
        .m5_b(cl1_m5_b),
        .m6_a(cl1_m6_a),
        .m6_b(cl1_m6_b),
        .m7_a(cl1_m7_a),
        .m7_b(cl1_m7_b),
        .m8_a(cl1_m8_a),
        .m8_b(cl1_m8_b),
        .out(cl1_out)
    );

    mac_cluster cl2(
        .clk(clk), 
        .rst(rst),
        .ebl(ebl),
        .m1_a(cl2_m1_a),
        .m1_b(cl2_m1_b),
        .m2_a(cl2_m2_a),
        .m2_b(cl2_m2_b),
        .m3_a(cl2_m3_a),
        .m3_b(cl2_m3_b),
        .m4_a(cl2_m4_a),
        .m4_b(cl2_m4_b),
        .m5_a(cl2_m5_a),
        .m5_b(cl2_m5_b),
        .m6_a(cl2_m6_a),
        .m6_b(cl2_m6_b),
        .m7_a(cl2_m7_a),
        .m7_b(cl2_m7_b),
        .m8_a(cl2_m8_a),
        .m8_b(cl2_m8_b),
        .out(cl2_out)
    );3

    mac_cluster cl3(
        .clk(clk), 
        .rst(rst),
        .ebl(ebl),
        .m1_a(cl3_m1_a),
        .m1_b(cl3_m1_b),
        .m2_a(cl3_m2_a),
        .m2_b(cl3_m2_b),
        .m3_a(cl3_m3_a),
        .m3_b(cl3_m3_b),
        .m4_a(cl3_m4_a),
        .m4_b(cl3_m4_b),
        .m5_a(cl3_m5_a),
        .m5_b(cl3_m5_b),
        .m6_a(cl3_m6_a),
        .m6_b(cl3_m6_b),
        .m7_a(cl3_m7_a),
        .m7_b(cl3_m7_b),
        .m8_a(cl3_m8_a),
        .m8_b(cl3_m8_b),
        .out(cl3_out)
    ); 

    mac_cluster cl4(
        .clk(clk), 
        .rst(rst),
        .ebl(ebl),
        .m1_a(cl4_m1_a),
        .m1_b(cl4_m1_b),
        .m2_a(cl4_m2_a),
        .m2_b(cl4_m2_b),
        .m3_a(cl4_m3_a),
        .m3_b(cl4_m3_b),
        .m4_a(cl4_m4_a),
        .m4_b(cl4_m4_b),
        .m5_a(cl4_m5_a),
        .m5_b(cl4_m5_b),
        .m6_a(cl4_m6_a),
        .m6_b(cl4_m6_b),
        .m7_a(cl4_m7_a),
        .m7_b(cl4_m7_b),
        .m8_a(cl4_m8_a),
        .m8_b(cl4_m8_b),
        .out(cl4_out)
    ); 

    always_ff @(posedge rst or posedge clk) begin
        if (rst) begin
            cl1_m1_a <= {PE_DATA_WIDTH{1'b0}}; 
            cl1_m1_b <= {PE_DATA_WIDTH{1'b0}}; 
            cl1_m2_a <= {PE_DATA_WIDTH{1'b0}};
            cl1_m2_b <= {PE_DATA_WIDTH{1'b0}};
            cl1_m3_a <= {PE_DATA_WIDTH{1'b0}};
            cl1_m3_b <= {PE_DATA_WIDTH{1'b0}};
            cl1_m4_a <= {PE_DATA_WIDTH{1'b0}};
            cl1_m4_b <= {PE_DATA_WIDTH{1'b0}};
            cl1_m5_a <= {PE_DATA_WIDTH{1'b0}};
            cl1_m5_b <= {PE_DATA_WIDTH{1'b0}};
            cl1_m6_a <= {PE_DATA_WIDTH{1'b0}};
            cl1_m6_b <= {PE_DATA_WIDTH{1'b0}};
            cl1_m7_a <= {PE_DATA_WIDTH{1'b0}};
            cl1_m7_b <= {PE_DATA_WIDTH{1'b0}};
            cl1_m8_a <= {PE_DATA_WIDTH{1'b0}};
            cl1_m8_b <= {PE_DATA_WIDTH{1'b0}};

            cl2_m1_a <= {PE_DATA_WIDTH{1'b0}}; 
            cl2_m1_b <= {PE_DATA_WIDTH{1'b0}}; 
            cl2_m2_a <= {PE_DATA_WIDTH{1'b0}};
            cl2_m2_b <= {PE_DATA_WIDTH{1'b0}};
            cl2_m3_a <= {PE_DATA_WIDTH{1'b0}};
            cl2_m3_b <= {PE_DATA_WIDTH{1'b0}};
            cl2_m4_a <= {PE_DATA_WIDTH{1'b0}};
            cl2_m4_b <= {PE_DATA_WIDTH{1'b0}};
            cl2_m5_a <= {PE_DATA_WIDTH{1'b0}};
            cl2_m5_b <= {PE_DATA_WIDTH{1'b0}};
            cl2_m6_a <= {PE_DATA_WIDTH{1'b0}};
            cl2_m6_b <= {PE_DATA_WIDTH{1'b0}};
            cl2_m7_a <= {PE_DATA_WIDTH{1'b0}};
            cl2_m7_b <= {PE_DATA_WIDTH{1'b0}};
            cl2_m8_a <= {PE_DATA_WIDTH{1'b0}};
            cl2_m8_b <= {PE_DATA_WIDTH{1'b0}};

            cl3_m1_a <= {PE_DATA_WIDTH{1'b0}}; 
            cl3_m1_b <= {PE_DATA_WIDTH{1'b0}}; 
            cl3_m2_a <= {PE_DATA_WIDTH{1'b0}};
            cl3_m2_b <= {PE_DATA_WIDTH{1'b0}};
            cl3_m3_a <= {PE_DATA_WIDTH{1'b0}};
            cl3_m3_b <= {PE_DATA_WIDTH{1'b0}};
            cl3_m4_a <= {PE_DATA_WIDTH{1'b0}};
            cl3_m4_b <= {PE_DATA_WIDTH{1'b0}};
            cl3_m5_a <= {PE_DATA_WIDTH{1'b0}};
            cl3_m5_b <= {PE_DATA_WIDTH{1'b0}};
            cl3_m6_a <= {PE_DATA_WIDTH{1'b0}};
            cl3_m6_b <= {PE_DATA_WIDTH{1'b0}};
            cl3_m7_a <= {PE_DATA_WIDTH{1'b0}};
            cl3_m7_b <= {PE_DATA_WIDTH{1'b0}};
            cl3_m8_a <= {PE_DATA_WIDTH{1'b0}};
            cl3_m8_b <= {PE_DATA_WIDTH{1'b0}};

            cl4_m1_a <= {PE_DATA_WIDTH{1'b0}}; 
            cl4_m1_b <= {PE_DATA_WIDTH{1'b0}}; 
            cl4_m2_a <= {PE_DATA_WIDTH{1'b0}};
            cl4_m2_b <= {PE_DATA_WIDTH{1'b0}};
            cl4_m3_a <= {PE_DATA_WIDTH{1'b0}};
            cl4_m3_b <= {PE_DATA_WIDTH{1'b0}};
            cl4_m4_a <= {PE_DATA_WIDTH{1'b0}};
            cl4_m4_b <= {PE_DATA_WIDTH{1'b0}};
            cl4_m5_a <= {PE_DATA_WIDTH{1'b0}};
            cl4_m5_b <= {PE_DATA_WIDTH{1'b0}};
            cl4_m6_a <= {PE_DATA_WIDTH{1'b0}};
            cl4_m6_b <= {PE_DATA_WIDTH{1'b0}};
            cl4_m7_a <= {PE_DATA_WIDTH{1'b0}};
            cl4_m7_b <= {PE_DATA_WIDTH{1'b0}};
            cl4_m8_a <= {PE_DATA_WIDTH{1'b0}};
            cl4_m8_b <= {PE_DATA_WIDTH{1'b0}};

            cl1_out = {PE_OUT_WIDTH{1'b0}};  
            cl2_out = {PE_OUT_WIDTH{1'b0}}; 
            cl3_out = {PE_OUT_WIDTH{1'b0}};
            cl4_out = {PE_OUT_WIDTH{1'b0}}; 
        end else if (ebl) begin
            cl1_m1_a <= cl1_a_in[7:0]; 
            cl1_m1_b <= cl1_b_in[7:0]; 
            cl1_m2_a <= cl1_a_in[15:8]; 
            cl1_m2_b <= cl1_b_in[15:8]; 
            cl1_m3_a <= cl1_a_in[23:16]; 
            cl1_m3_b <= cl1_b_in[23:16]; 
            cl1_m4_a <= cl1_a_in[31:24]; 
            cl1_m4_b <= cl1_b_in[31:24]; 
            cl1_m5_a <= cl1_a_in[39:32]; 
            cl1_m5_b <= cl1_b_in[39:32]; 
            cl1_m5_b <= cl1_a_in[47:40]; 
            cl1_m6_b <= cl1_b_in[47:40]; 
            cl1_m7_a <= cl1_a_in[55:48]; 
            cl1_m7_b <= cl1_b_in[55:48]; 
            cl1_m8_a <= cl1_a_in[63:56]; 
            cl1_m8_b <= cl1_b_in[63:56]; 

            cl2_m1_a <= cl2_a_in[7:0]; 
            cl2_m1_b <= cl2_b_in[7:0]; 
            cl2_m2_a <= cl2_a_in[15:8]; 
            cl2_m2_b <= cl2_b_in[15:8]; 
            cl2_m3_a <= cl2_a_in[23:16]; 
            cl2_m3_b <= cl2_b_in[23:16]; 
            cl2_m4_a <= cl2_a_in[31:24]; 
            cl2_m4_b <= cl2_b_in[31:24]; 
            cl2_m5_a <= cl2_a_in[39:32]; 
            cl2_m5_b <= cl2_b_in[39:32]; 
            cl2_m5_b <= cl2_a_in[47:40]; 
            cl2_m6_b <= cl2_b_in[47:40]; 
            cl2_m7_a <= cl2_a_in[55:48]; 
            cl2_m7_b <= cl2_b_in[55:48]; 
            cl2_m8_a <= cl2_a_in[63:56]; 
            cl2_m8_b <= cl2_b_in[63:56]; 

            cl3_m1_a <= cl3_a_in[7:0]; 
            cl3_m1_b <= cl3_b_in[7:0]; 
            cl3_m2_a <= cl3_a_in[15:8]; 
            cl3_m2_b <= cl3_b_in[15:8]; 
            cl3_m3_a <= cl3_a_in[23:16]; 
            cl3_m3_b <= cl3_b_in[23:16]; 
            cl3_m4_a <= cl3_a_in[31:24]; 
            cl3_m4_b <= cl3_b_in[31:24]; 
            cl3_m5_a <= cl3_a_in[39:32]; 
            cl3_m5_b <= cl3_b_in[39:32]; 
            cl3_m5_b <= cl3_a_in[47:40]; 
            cl3_m6_b <= cl3_b_in[47:40]; 
            cl3_m7_a <= cl3_a_in[55:48]; 
            cl3_m7_b <= cl3_b_in[55:48]; 
            cl3_m8_a <= cl3_a_in[63:56]; 
            cl3_m8_b <= cl3_b_in[63:56]; 

            cl4_m1_a <= cl4_a_in[7:0]; 
            cl4_m1_b <= cl4_b_in[7:0]; 
            cl4_m2_a <= cl4_a_in[15:8]; 
            cl4_m2_b <= cl4_b_in[15:8]; 
            cl4_m3_a <= cl4_a_in[23:16]; 
            cl4_m3_b <= cl4_b_in[23:16]; 
            cl4_m4_a <= cl4_a_in[31:24]; 
            cl4_m4_b <= cl4_b_in[31:24]; 
            cl4_m5_a <= cl4_a_in[39:32]; 
            cl4_m5_b <= cl4_b_in[39:32]; 
            cl4_m5_b <= cl4_a_in[47:40]; 
            cl4_m6_b <= cl4_b_in[47:40]; 
            cl4_m7_a <= cl4_a_in[55:48]; 
            cl4_m7_b <= cl4_b_in[55:48]; 
            cl4_m8_a <= cl4_a_in[63:56]; 
            cl4_m8_b <= cl4_b_in[63:56]; 
        end
    end

    assign out = {cl4_out, cl3_out, cl2_out, cl1_out}; 
    
endmodule