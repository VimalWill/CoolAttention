module matmul_controller(
    input logic clk, 
    input logic rst, 
    input logic ebl, 
);

    typedef enum {
        IDEL, 
        FILL, 
        COMPUTE, 
        DONE, 
        FINISH
    } state_t; 

    reg [7:0] a_in = 8'b0; 
    reg [7:0] b_in = 8'b0; 
    reg [15:0] out = 16'b0; 

    state_t state; 
    always @(posedge clk) begin
        case (state)
        
        IDEL: begin 
            if (ebl == 1'b1) begin 
                state = FILL
            end
        end

        FILL: begin
            
        end 
        endcase
    end
endmodule 