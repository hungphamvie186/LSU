
module LSU (
	input wire [31:0] i_io_sw,   
	input wire [3:0] i_io_btn,    
	input wire i_clk, i_rst, i_lsu_wren, i_lsu_rden, wb_sel,
	input wire [2:0] funct3,
	input wire [31:0] i_lsu_addr,
	input wire [31:0] i_st_data,

	output reg [31:0] o_ld_data,
	output reg [31:0] o_io_ledr,
	output reg [31:0] o_io_ledg,

	output reg [6:0] o_io_hex0,
	output reg [6:0] o_io_hex1,
	output reg [6:0] o_io_hex2,
	output reg [6:0] o_io_hex3,
	output reg [6:0] o_io_hex4,
	output reg [6:0] o_io_hex5,
	output reg [6:0] o_io_hex6,
	output reg [6:0] o_io_hex7,

	output reg [31:0] o_io_lcd
/*
	output reg [17:0] sram_addr,
	inout  wire [15:0] sram_dq,
	output reg 	  sram_ce_n,
	output reg 	  sram_oe_n,
	output reg 	  sram_we_n,
	output reg 	  sram_lb_n,
	output reg 	  sram_ub_n*/



);
	wire [31:0] addr ;
    	assign addr= i_lsu_addr;
	
	wire [31:0] input_buffer_out;

input_buffer input_buff(
    .i_io_sw   		(i_io_sw),
    .i_io_btn   	(i_io_btn),
    .i_clk 		(i_clk),
    .i_rst  		(i_rst),
    .i_lsu_wren 	(i_lsu_wren),
    .read_en  		(i_lsu_rden),
    .o_ACK  		(o_ACK),
    .addr  		(addr),
    .input_buffer_out   (input_buffer_out)
	);
	wire output_buf_en ;
	wire sram_buf_en  ;
decode_buf sel_buf(
    .i_lsu_addr    (i_lsu_addr),
    .i_lsu_wren    (i_lsu_wren),
    .output_buf_en (output_buf_en),
    .sram_buf_en  (sram_buf_en)
	);

	wire [31:0] o_ld_data_op ;
output_buffer output_buf(
    .i_st_data    (i_st_data),
    .i_lsu_addr   (i_lsu_addr),   
    .i_lsu_wren   (i_lsu_wren),
    .wb_sel   	  (wb_sel),
    .i_clk (i_clk),
    .i_rst (i_rst),
    .output_buf_en (output_buf_en),
    .o_ld_data (o_ld_data_op),
    .o_io_ledr (o_io_ledr),
    .o_io_ledg (o_io_ledg),

    .o_io_hex0 (o_io_hex0),
    .o_io_hex1 (o_io_hex1),
    .o_io_hex2 (o_io_hex2),
    .o_io_hex3 (o_io_hex3),
    .o_io_hex4 (o_io_hex4),
    .o_io_hex5 (o_io_hex5),
    .o_io_hex6 (o_io_hex6),
    .o_io_hex7 (o_io_hex7),

    .o_io_lcd  (o_io_lcd)
	);
	
	wire [31:0] o_RDATA;
/*
	wire  o_ACK;
	wire sram_read_en = ~addr[15] & ~addr[14] & addr[13] & i_lsu_rden;
sram_IS61WV25616_controller_32b_5lr sram_buf(
    .i_ADDR     (i_lsu_addr),
    .i_clk      (i_clk),
    .i_reset    (~i_rst),
    .i_WDATA    (i_st_data),
    .i_BMASK	    (4'b1111),
    .i_WREN	    (sram_buf_en),
    .i_RDEN	    (sram_read_en),
    .o_ACK	    (o_ACK),
    .o_RDATA	    (o_RDATA),

    .SRAM_ADDR	    (sram_addr),
    .SRAM_DQ	    (sram_dq),
    .SRAM_CE_N	    (sram_ce_n),
    .SRAM_WE_N	    (sram_we_n),
    .SRAM_LB_N	    (sram_lb_n),
    .SRAM_UB_N	    (sram_ub_n),
    .SRAM_OE_N	 
   (sram_oe_n)
	); */
	wire dmem_read_en = ~addr[15] & ~addr[14] & addr[13] & i_lsu_rden;
dmem dmem_bank(
    .clk(i_clk),
	.rst(~i_rst),
    .addr(i_lsu_addr),
    .write_en(sram_buf_en),
    .read_en(dmem_read_en),
    .wdata(i_st_data),
    .funct3(funct3),
    .rdata(o_RDATA)
    );

out_mux mux_out_data(
    .addr(addr),
	.ip(input_buffer_out),
    .op(o_ld_data_op),
    .sram(o_RDATA),
    .o_ld_data(o_ld_data)
    );
endmodule
