module decoder_2to4 (
    input wire [1:0] in,    // Đầu vào 2-bit
    output reg [3:0] out    // Đầu ra 4-bit
);

    // Mô tả chức năng của decoder theo flow logic
    always @(*) begin
        // Reset tất cả đầu ra về 0
        out = 4'b0000;
        
        // Bật đầu ra tương ứng với giá trị đầu vào
        case (in)
            2'b00: out = 4'b0001;   // Khi in = 00, bật đầu ra 0
            2'b01: out = 4'b0010;   // Khi in = 01, bật đầu ra 1
            2'b10: out = 4'b0100;   // Khi in = 10, bật đầu ra 2
            2'b11: out = 4'b1000;   // Khi in = 11, bật đầu ra 3
            default: out = 4'b0000; // Giá trị mặc định
        endcase
    end

endmodule

