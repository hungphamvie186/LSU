module mux_4to1 #(parameter WIDTH = 32)
(
    input wire [WIDTH-1:0] d0,    // Đầu vào dữ liệu 0
    input wire [WIDTH-1:0] d1,    // Đầu vào dữ liệu 1
    input wire [WIDTH-1:0] d2,    // Đầu vào dữ liệu 2
    input wire [WIDTH-1:0] d3,    // Đầu vào dữ liệu 3
    input wire [1:0] sel,         // Đầu vào chọn 2-bit
    output reg [WIDTH-1:0] y      // Đầu ra
);

always @(*) begin
    case (sel)
        2'b00: y = d0; // Khi sel là 00, y nhận giá trị của d0
        2'b01: y = d1; // Khi sel là 01, y nhận giá trị của d1
        2'b10: y = d2; // Khi sel là 10, y nhận giá trị của d2
        2'b11: y = d3; // Khi sel là 11, y nhận giá trị của d3
        default: y = d0; // Giá trị mặc định (không bắt buộc)
    endcase
end

endmodule

