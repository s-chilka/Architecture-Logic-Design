/****************************************************
 * Common System Verilog Primitive Definitions
 * Author: schilka
 ****************************************************/
 
 //`A_DFF_P: Asynchronous Reset DFF. Posedge Capture
 `define A_DFF_P(q, d, clk, rst_b) \
    always_ff(posedge clk or negedge rst_b) begin \
        if(~rst_b) q <= '0; \
         else q <= d; \
    end
         
 //`A_DFF_N: Asynchronous Reset DFF. Negedge Capture
 `define A_DFF_P(q, d, clk, rst_b) \
    always_ff(negedge clk or negedge rst_b) begin \
        if(~rst_b) q <= '0; \
         else q <= d; \
    end
    
 //`A_META_FF: Asynchronous METASTABLE FF
 `define A_META_FF(q, d, clk, rst_b) \
    logic [$bits(q):0] q_int; \
    `A_DFF_P(q_int, d, clk, rst_b) \
    `A_DFF_P(q, q_int, clk, rst_b)
