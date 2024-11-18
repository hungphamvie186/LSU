module design_test();

    reg clk;
    reg rst;
    reg wb_sel;
    reg wr_en;
    reg [1:0] byte_sel;
    reg [7:0] D_byte;
    reg [31:0] D_word;
    wire [31:0] Q_load, Q_store;

    // Instantiate the DUT (Device Under Test)
    register_byte_word dut (
        .clk(clk),
        .rst(rst),
        .wb_sel(wb_sel),
        .wr_en(wr_en),
        .byte_sel(byte_sel),
        .D_byte(D_byte),
        .D_word(D_word),
        .Q_load(Q_load),
        .Q_store(Q_store)
    );

    initial begin
        $fsdbDumpfile("design_test.fsdb");
        $fsdbDumpvars(0, design_test, "+all", "+mda");
    end

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        wb_sel = 0;
        wr_en = 0;
        byte_sel = 2'b00;
        D_byte = 8'h00;
        D_word = 32'h00000000;

        // Reset sequence
        #10 rst = 0;
		wr_en = 1;
    
		wb_sel = 1; // Select word mode
        D_word = 32'h12345678;
        // End of simulation
	//
        #10;
        // Test case 1: Byte-wise write with `byte_sel` = 2'b00, writing 8'hAA
        wr_en = 1;
        wb_sel = 0; // Select byte mode
        byte_sel = 2'b00;
        D_byte = 8'hAA;
        #10;

        // Test case 2: Byte-wise write with `byte_sel` = 2'b01, writing 8'hBB
        byte_sel = 2'b01;
        D_byte = 8'hBB;
        #10;

        // Test case 3: Byte-wise write with `byte_sel` = 2'b10, writing 8'hCC
        byte_sel = 2'b10;
        D_byte = 8'hCC;
        #10;
	
	wr_en = 0;
	rst=0;
	#6
	rst=0;
        // Test case 4: Byte-wise write with `byte_sel` = 2'b11, writing 8'hDD
        byte_sel = 2'b11;
        D_byte = 8'hDD;
        #10;

        // Test case 5: Word-wise write, writing 32'h12345678
        wb_sel = 1; // Select word mode
        D_word = 32'hFF345678;
        #11;

	wr_en = 1;

 // Test case 3: Byte-wise write with `byte_sel` = 2'b10, writing 8'hCC
        byte_sel = 2'b00;
        D_byte = 8'hCC;
        #10;

        // Disable write enable
        wr_en = 0;
        #10;
	wb_sel = 1; // Select word mode
        D_word = 32'h12345678;
        // End of simulation
	//
        #10;




        // Disable write enable
        wr_en = 0;
        #10;
	wb_sel = 0; // Select word mode
        D_word = 32'h12345678;
        // End of simulation
	//
        #10;
#10;

        // Disable write enable
        wr_en = 1;
        #10;
	wb_sel = 1; // Select word mode
        D_word = 32'h123fe678;
        // End of simulation
	//
        #10;
#10;
        // Disable write enable
        wr_en = 1;
        #10;
	wb_sel = 0; // Select word mode
       D_byte = 8'hEE;
        // End of simulation
	//
        #10;
#10;

        // Disable write enable
        wr_en = 0;
        #10;
	wb_sel = 1; // Select word mode
        D_word = 32'h12345678;
        // End of simulation
	//
        #10;
        #10;
        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t | wr_en=%b | wb_sel=%b | byte_sel=%b | D_byte=%h | D_word=%h | Q_load=%h | Q_store=%h", 
                 $time, wr_en, wb_sel, byte_sel, D_byte, D_word, Q_load, Q_store);
    end

endmodule

