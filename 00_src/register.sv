module register #(parameter WIDTH = 32)
(
    input logic rst, 
    // input logic set,
    input logic en,  
    input logic clk,    
    input logic [WIDTH-1:0] D,
    output logic [WIDTH-1:0] Q
);

    logic [WIDTH-1:0] D_in;

    // Combinational logic to determine D_in
    always_comb begin
        if (en)
            D_in = D;
        else
            D_in = Q;
    end

    // Sequential logic to update Q on the rising edge of the clock
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 0;
        else
            Q <= D_in;
    end

endmodule

