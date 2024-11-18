module input_buffer (
    input wire [31:0] i_io_sw, addr, 
    input wire [3:0] i_io_btn,    
    input wire i_clk, i_rst,  i_lsu_wren, read_en, o_ACK,  
    output reg [31:0] input_buffer_out    
);

    wire [31:0] i_io_btn_in;
    assign i_io_btn_in = {28'b0, i_io_btn};
    
    wire [31:0] bottons_buf_out;
    wire [31:0] swiches_buf_out;
    wire [31:0] flag_buf_out;

    register bottons_buf(
        .clk    (i_clk),
        .rst    (i_rst),
        .en     (1'b1),
        .D      (i_io_btn_in),
        .Q      (bottons_buf_out)
    );

    register swiches_buf(
        .clk    (i_clk),
        .rst    (i_rst),
        .en     (1'b1),
        .D      (i_io_sw),
        .Q      (swiches_buf_out)
    );

    register flag_buf(
        .clk    (i_clk),
        .rst    (i_rst | i_lsu_wren | read_en),
        .en     (o_ACK),
        .D      ({31'b0, o_ACK}),
        .Q      (flag_buf_out)
    );
    wire [31:0] ready;
    assign ready = flag_buf_out | {31'b0, o_ACK};

    wire sw_en, btn_en, flag_en;
    wire [1:0] sel; // Declare sel as a 2-bit wire

    assign sw_en = ~addr[15] & 
                   (addr[14] & addr[13] & addr[12] & addr[11]) & 
                   (~addr[10] & ~addr[9] & ~addr[8] & ~addr[7] & ~addr[6] & ~addr[5] & ~addr[4] & ~addr[3] & ~addr[2]);
    assign btn_en = ~addr[15] & 
                    (addr[14] & addr[13] & addr[12] & addr[11]) & 
                    (~addr[10] & ~addr[9] & ~addr[8] & ~addr[7] & ~addr[6] & ~addr[5] & addr[4] & ~addr[3] & ~addr[2]);
    assign flag_en = ~addr[15] & 
                     (addr[14] & addr[13] & addr[12] & addr[11]) & 
                     (~addr[10] & ~addr[9] & ~addr[8] & ~addr[7] & ~addr[6] & addr[5] & ~addr[4] & ~addr[3] & ~addr[2]);

    assign sel[0] = ~flag_en & btn_en & ~sw_en;
    assign sel[1] = flag_en & ~btn_en & ~sw_en;

    mux_4to1 mux(
        .d0(swiches_buf_out),
        .d1(bottons_buf_out),
        .d2(ready),
        .d3(swiches_buf_out),
        .sel(1'b0),           // Connect sel as a 2-bit wire
        .y(input_buffer_out)
    );
endmodule

