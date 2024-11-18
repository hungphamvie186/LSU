module design_test();

    reg [31:0] i_st_data;
    reg [31:0] i_lsu_addr;
    reg i_lsu_wren;
    reg wb_sel;
    reg i_clk, i_rst;
    reg output_buf_en;
    wire [31:0] o_ld_data;
    wire [31:0] o_io_ledr;
    wire [31:0] o_io_ledg;

    wire [6:0] o_io_hex0;
    wire [6:0] o_io_hex1;
    wire [6:0] o_io_hex2;
    wire [6:0] o_io_hex3;
    wire [6:0] o_io_hex4;
    wire [6:0] o_io_hex5;
    wire [6:0] o_io_hex6;
    wire [6:0] o_io_hex7;

    wire [31:0] o_io_lcd;

    // Instantiate the DUT
    output_buffer dut (
        .i_st_data(i_st_data),
        .i_lsu_addr(i_lsu_addr),
        .i_lsu_wren(i_lsu_wren),
        .wb_sel(wb_sel),
        .i_clk(i_clk),
        .i_rst(i_rst),
        .output_buf_en(output_buf_en),
        .o_ld_data(o_ld_data),
        .o_io_ledr(o_io_ledr),
        .o_io_ledg(o_io_ledg),
        .o_io_hex0(o_io_hex0),
        .o_io_hex1(o_io_hex1),
        .o_io_hex2(o_io_hex2),
        .o_io_hex3(o_io_hex3),
        .o_io_hex4(o_io_hex4),
        .o_io_hex5(o_io_hex5),
        .o_io_hex6(o_io_hex6),
        .o_io_hex7(o_io_hex7),
        .o_io_lcd(o_io_lcd)
    );

    initial begin
        $fsdbDumpfile("design_test.fsdb");
        $fsdbDumpvars(0, design_test, "+all", "+mda");
    end

    always #5 i_clk = ~i_clk;  // 10ns clock period

    // Initial block for test stimulus
    initial begin
        // Initialize inputs
        i_clk = 0;
        i_rst = 1;
        output_buf_en = 0;
        i_st_data = 32'h00000000;
        i_lsu_addr = 32'h00000000;
        i_lsu_wren = 0;
        wb_sel = 0;

        // Release reset
        #10 i_rst = 0;

        // Enable output buffer
        output_buf_en = 1;

        // Test 1: Write to `red` register at address 0x7000
        i_lsu_addr = 32'h7000;
        i_st_data = 32'h4f5b063f;
        i_lsu_wren = 1;
        wb_sel = 0; // Write as word
        #10;
		i_lsu_addr = 32'h7020;
		#10;
		i_lsu_addr = 32'h7021;
		#10;

		i_lsu_addr = 32'h7022;
		#10;
		i_lsu_addr = 32'h7023;
		#10;
		i_lsu_addr = 32'h7024;
		#10;
		i_lsu_addr = 32'h7030;
		#10;

        // End simulation
        $finish;
    end

    // Monitor output
   initial begin
    $monitor("Time=%0t | Addr=%h | Data=%h | wren=%b | wb_sel=%b | ld Data=%h | LEDR=%h | LEDG=%h | HEX7=%h | HEX6=%h | HEX5=%h | HEX4=%h | HEX3=%h | HEX2=%h | HEX1=%h | HEX0=%h | LCD=%h",
             $time, i_lsu_addr, i_st_data, i_lsu_wren, wb_sel, o_ld_data, o_io_ledr, o_io_ledg, 
             o_io_hex7, o_io_hex6, o_io_hex5, o_io_hex4, o_io_hex3, o_io_hex2, o_io_hex1, o_io_hex0, o_io_lcd);
end






endmodule

