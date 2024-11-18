module output_buffer (
	input wire [31:0] i_st_data,   
	input wire [31:0] i_lsu_addr,    
	input wire 	  i_lsu_wren,    // cho phep ghi
	input wire 	  wb_sel,    // =1 la ghi, =0 la doc
	input wire 	  i_clk, i_rst,
	input wire 	  output_buf_en,

	output reg [31:0] o_ld_data, //Q_load    
	output reg [31:0] o_io_ledr,    
	output reg [31:0] o_io_ledg,

	output reg [6:0]  o_io_hex0,
	output reg [6:0]  o_io_hex1,
	output reg [6:0]  o_io_hex2,
	output reg [6:0]  o_io_hex3,
	output reg [6:0]  o_io_hex4,
	output reg [6:0]  o_io_hex5,
	output reg [6:0]  o_io_hex6,
	output reg [6:0]  o_io_hex7,
	output reg [31:0] o_io_lcd    
);
	wire [31:0] D_word;
	wire [31:0] addr;
	wire [7:0] D_byte;
	assign D_word = i_st_data;
	assign addr = i_lsu_addr;
	assign D_byte = i_st_data[7:0];
	wire [3:0] io_sel; //00 red 01 green 10 hex 11 LCD
	genvar i;
decoder_2to4 decode_stage(
    .in	    (i_lsu_addr[5:4]),
    .out    (io_sel)
	);

	wire   red_en, green_en, hex_en, lcd_en;
	assign red_en   = io_sel[0];
	assign green_en = io_sel[1];
	assign hex_en   = io_sel[2];
	assign lcd_en   = io_sel[3];

	////////////  red_sel  ////////// Chon thanh red
	wire red_sel;
	assign red_sel= red_en & ( ~addr[3] & ~addr[2]); 

	wire red_reg_en;
	wire [31:0]Q_load_red;
	assign red_reg_en= red_sel & i_lsu_wren & output_buf_en; 
register_byte_word red_reg(
    .clk    	(i_clk),
    .rst    	(i_rst),
    .wr_en  	(red_reg_en),
    .wb_sel	(wb_sel),
    .byte_sel 	(addr[1:0]),
    .D_byte 	(D_byte),
    .D_word 	(D_word),
    .Q_load 	(Q_load_red),
    .Q_store 	(o_io_ledr)
	);
	/////////////////////////////////////
	///////////  green_sel  ////////// Chon thanh green
	wire green_sel;
	assign green_sel= green_en & ( ~addr[3] & ~addr[2] ); 

	wire green_reg_en;
	wire [31:0]Q_load_green;
	assign green_reg_en= green_sel & i_lsu_wren & output_buf_en; 
register_byte_word green_reg(
    .clk    	(i_clk),
    .rst    	(i_rst),
    .wr_en  	(green_reg_en),
    .wb_sel	(wb_sel),
    .byte_sel 	(addr[1:0]),
    .D_byte 	(D_byte),
    .D_word 	(D_word),
    .Q_load 	(Q_load_green),
    .Q_store 	(o_io_ledg)
	);
	/////////////////////////////////////
	///////////  hex1_sel  ////////// Chon thanh 7seg1 0x7020
	wire hex1_sel;
	assign hex1_sel= hex_en & ( ~addr[3] & ~addr[2] ); 

	wire hex1_reg_en;
	wire [31:0]Q_load_hex1;
	wire [31:0]Q_store_hex1;  ///***************************//////
	assign hex1_reg_en= hex1_sel & i_lsu_wren & output_buf_en; 
register_byte_word hex1_reg(
    .clk    	(i_clk),
    .rst    	(i_rst),
    .wr_en  	(hex1_reg_en),
    .wb_sel	(wb_sel),
    .byte_sel 	(addr[1:0]),
    .D_byte 	(D_byte),
    .D_word 	(D_word),
    .Q_load 	(Q_load_hex1),
    .Q_store 	(Q_store_hex1)
	);
    
    	    assign o_io_hex0 = Q_store_hex1[0 +: 7]; 
    	    assign o_io_hex1 = Q_store_hex1[8 +: 7]; 
    	    assign o_io_hex2 = Q_store_hex1[16 +: 7]; 
    	    assign o_io_hex3 = Q_store_hex1[24 +: 7]; 

	/////////////////////////////////////
	///////////  hex2_sel  ////////// Chon thanh 7seg1 0x7024
	wire hex2_sel;
	assign hex2_sel= hex_en & ( ~addr[3] & addr[2]);  //chu y dia chi

	wire hex2_reg_en;
	wire [31:0]Q_load_hex2;
	wire [31:0]Q_store_hex2;  ///***************************//////
	assign hex2_reg_en= hex2_sel & i_lsu_wren & output_buf_en; 
register_byte_word hex2_reg(
    .clk    	(i_clk),
    .rst    	(i_rst),
    .wr_en  	(hex2_reg_en),
    .wb_sel	(wb_sel),
    .byte_sel 	(addr[1:0]),
    .D_byte 	(D_byte),
    .D_word 	(D_word),
    .Q_load 	(Q_load_hex2),
    .Q_store 	(Q_store_hex2)
	);

    	    assign o_io_hex4 = Q_store_hex2[0 +: 7]; 
    	    assign o_io_hex5 = Q_store_hex2[8 +: 7]; 
    	    assign o_io_hex6 = Q_store_hex2[16 +: 7]; 
    	    assign o_io_hex7 = Q_store_hex2[24 +: 7]; 
	/////////////////////////////////////
	///////////  lcd_sel  ////////// Chon thanh lcd 0x7030
	wire lcd_sel;
	assign lcd_sel= lcd_en & ( ~addr[3] & ~addr[2] ); 

	wire lcd_reg_en;
	wire [31:0]Q_load_lcd;
	assign lcd_reg_en= lcd_sel & i_lsu_wren & output_buf_en; 
register_byte_word lcd_reg(
    .clk    	(i_clk),
    .rst    	(i_rst),
    .wr_en  	(lcd_reg_en),
    .wb_sel	(wb_sel),
    .byte_sel 	(addr[1:0]),
    .D_byte 	(D_byte),
    .D_word 	(D_word),
    .Q_load 	(Q_load_lcd),
    .Q_store 	(o_io_lcd)
	);
 	/////////////////////////////////////
	///////// Chon ngo ra cho o_ld_data
	wire [31:0]Q_load_hex;
mux_2to1 mux_hex(
    .d0(Q_load_hex1),
    .d1(Q_load_hex2),
    .sel(addr[2]),
    .y(Q_load_hex)
    );
mux_4to1 mux_io_ld(
    .d0(Q_load_red),
    .d1(Q_load_green),
    .d2(Q_load_hex),
    .d3(Q_load_lcd),
    .sel(addr[5:4]),
    .y(o_ld_data)
    );
endmodule
