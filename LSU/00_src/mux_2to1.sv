module mux_2to1   #(parameter WIDTH = 32)
(

    input wire [WIDTH-1:0]  d0,    // Đầu vào dữ liệu 0
    input wire [WIDTH-1:0]  d1,    // Đầu vào dữ liệu 1
    input wire sel,   // Đầu vào chọn
    output reg [WIDTH-1:0] y      // Đầu ra

);

always @(*) begin

    case (sel)
        1'b0: y = d0; // Nếu sel là 0, y nhận giá trị của d0
        1'b1: y = d1; // Nếu sel là 1, y nhận giá trị của d1
        default: y = d0; // Mặc định (dù không cần thiết ở đây), y nhận giá trị của d0
    endcase

end

endmodule
