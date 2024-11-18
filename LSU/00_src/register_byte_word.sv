module register_byte_word 

( 
    input wire clk, rst, wb_sel,
    input wire wr_en,	// Cho phep ghi
    input wire [1:0]  byte_sel,
    input wire [7:0]  D_byte,
    input wire [31:0] D_word,
    output reg [31:0] Q_load, Q_store
);
    wire [3:0] sel;
    wire [3:0]reg_byte_en;
    wire [7:0]D_byte_in[3:0];
    wire [7:0]D_byte_out[3:0];
    wire [31:0]reg_out;
    wire [31:0]reg_out8[3:0];
    wire [31:0]reg_8sel;
    genvar i;

    decoder_2to4 byte_sel_decode (
                .in(byte_sel),
                .out(sel)
            );

    generate
        for (i = 0; i <= 3; i = i + 1) begin : reg_byte_en_gen
            assign reg_byte_en[i] = (sel[i] | wb_sel) & wr_en; 
        end
    endgenerate

  	generate
        for (i = 0; i <= 3; i = i + 1) begin : mux_2
            mux_2to1 #(.WIDTH(8)) Byte_sel (
                .sel(wb_sel),
                .d0(D_byte),
                .d1(D_word[8*i +: 8]),
                .y(D_byte_in[i])
            );
        end
    endgenerate
	
	generate
        for (i = 0; i <= 3; i = i + 1) begin : reg8
            register_nor #(.WIDTH(8)) Byte_sel (
                .clk(clk),
                .rst(rst),
                .en(reg_byte_en[i]),
                .D(D_byte_in[i]),
                .Q(D_byte_out[i])
            );
            assign reg_out[8*i +: 8] = D_byte_out[i];
        end
    endgenerate
/*
	generate
        for (i = 0; i <= 3; i = i + 1) begin : regout
            assign reg_out8[i] = {24'b0, D_byte_out[i]};
        end
    endgenerate
*/
	mux_4to1 muxout_4to1 (
        .d0({24'b0, D_byte_out[0]}),
        .d1({24'b0, D_byte_out[1]}),
        .d2({24'b0, D_byte_out[2]}),
        .d3({24'b0, D_byte_out[3]}),
        .sel(byte_sel),
        .y(reg_8sel)
    );

    mux_2to1 muxout_2to1 (
        .d0(reg_8sel),
        .d1(reg_out),
        .sel(wb_sel),
        .y(Q_load)
    );

    assign Q_store = reg_out;

		   
endmodule


