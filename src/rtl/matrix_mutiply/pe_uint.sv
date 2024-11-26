module PE (
    input logic clk, 
    input logic rst, 
    input logic [DATA_WIDTH-1:0] a, 
    input logic [DATA_WIDTH-1:0] b, 
    input logic valid, 
    output logic [ACC_WIDTH-1:0] c
); 

    parameter DATA_WIDTH = 8; 
    parameter ACC_WIDTH = 32; 

    // todo: mac operation
    // https://chatgpt.com/c/6745ad11-89b8-8002-8b4c-5ee071bff0d0
    
endmodule