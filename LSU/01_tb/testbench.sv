
module design_test();

   // Testbench Signals
    reg [31:0] i_io_sw;
    reg [3:0] i_io_btn;
    reg i_clk;
    reg i_rst;
    reg i_lsu_wren;
    reg wb_sel;
    reg [31:0] i_lsu_addr;
    reg [31:0] i_st_data;

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
    wire [17:0] sram_addr;
    wire [15:0] sram_dq;
    wire sram_ce_n;
    wire sram_oe_n;
    wire sram_we_n;
    wire sram_lb_n;
    wire sram_ub_n;

    // Instantiate the DUT (Device Under Test)
    LSU dut (
        .i_io_sw(i_io_sw),
        .i_io_btn(i_io_btn),
        .i_clk(i_clk),
        .i_rst(i_rst),
        .i_lsu_wren(i_lsu_wren),
        .wb_sel(wb_sel),
        .i_lsu_addr(i_lsu_addr),
        .i_st_data(i_st_data),
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
        .o_io_lcd(o_io_lcd),
        .sram_addr(sram_addr),
        .sram_dq(sram_dq),
        .sram_ce_n(sram_ce_n),
        .sram_oe_n(sram_oe_n),
        .sram_we_n(sram_we_n),
        .sram_lb_n(sram_lb_n),
        .sram_ub_n(sram_ub_n)
    );


    initial begin
        $fsdbDumpfile("design_test.fsdb");
        $fsdbDumpvars(0, design_test, "+all", "+mda");
    end

   // Clock Generation
    initial begin
        i_clk = 0;
        forever #5 i_clk = ~i_clk; // 10ns clock period
    end

    // Reset and Stimulus Generation
    initial begin
        // Initialize Inputs
        i_rst = 0; // Active high reset
        i_io_sw = 32'h00000000;
        i_io_btn = 4'b0000;
        i_lsu_wren = 0;
        wb_sel = 0;
        i_lsu_addr = 32'h00000000;
        i_st_data = 32'h00000000;

        // Wait for global reset
        #10;
		 i_rst = 1; // Release reset
		#10;
        i_rst = 0; // Release reset
		i_io_sw = 32'h0000005f;
        // Apply some test vectors
        // Test case 1: Writing to LSU
        i_lsu_wren = 0;
        i_lsu_addr = 32'h00007800; // Example address
		#10
		i_lsu_wren = 1;
		wb_sel 	   =0;
        i_lsu_addr = 32'h00007022; // Example address
        i_st_data = 32'h0000005f; // Example data
        #10; // Wait for a few clock cycles
		i_lsu_wren = 1;
		wb_sel 	   =1;
        i_lsu_addr = 32'h00007030; // Example address
        i_st_data = 32'h0000665f; // Example data
        #10; // Wait for a few clock cycles
        

        // End simulation
        #100;
        $finish;
    end

    // Monitoring Outputs
    initial begin
    $monitor("Time=%0t | Addr=%h | Data=%h | wren=%b | wb_sel=%b | ld Data=%h | LEDR=%h | LEDG=%h | HEX7=%h | HEX6=%h | HEX5=%h | HEX4=%h | HEX3=%h | HEX2=%h | HEX1=%h | HEX0=%h | LCD=%h",
             $time, i_lsu_addr, i_st_data, i_lsu_wren, wb_sel, o_ld_data, o_io_ledr, o_io_ledg, 
             o_io_hex7, o_io_hex6, o_io_hex5, o_io_hex4, o_io_hex3, o_io_hex2, o_io_hex1, o_io_hex0, o_io_lcd);
end

endmodule
