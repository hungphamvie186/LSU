module design_test();

   
    // Declare inputs as reg
    reg [31:0] i_lsu_addr;
    reg i_lsu_wren;

    // Declare outputs as wire
    wire output_buf_en;
    wire sdram_buf_en;

    // Instantiate the module under test (MUT)
    decode_buf dut (
        .i_lsu_addr(i_lsu_addr),
        .i_lsu_wren(i_lsu_wren),
        .output_buf_en(output_buf_en),
        .sdram_buf_en(sdram_buf_en)
    );


    initial begin
        $fsdbDumpfile("design_test.fsdb");
        $fsdbDumpvars(0, design_test, "+all","+mda");
    end

    initial begin
        // Test 1: Initialize inputs
        i_lsu_addr = 32'h00000000;
        i_lsu_wren = 1'b0;
        #10;  // Wait for 10 time units

        // Test 2: Check if output_buf_en and sdram_buf_en are disabled when i_lsu_wren is 0
        i_lsu_addr = 32'h0000F000;  // Example address where addr[15] is 0
        i_lsu_wren = 1'b0;          // Write enable is low
        #10;
        $display("Test 2 - Address: %h, Write Enable: %b, Output Buffer Enable: %b, SDRAM Buffer Enable: %b", i_lsu_addr, i_lsu_wren, output_buf_en, sdram_buf_en);

        // Test 3: Enable write and check output signals
        i_lsu_wren = 1'b1;          // Write enable is high
        #10;
        $display("Test 3 - Address: %h, Write Enable: %b, Output Buffer Enable: %b, SDRAM Buffer Enable: %b", i_lsu_addr, i_lsu_wren, output_buf_en, sdram_buf_en);

        // Test 4: Change address to match output_buf_en conditions
        i_lsu_addr = 32'h00007000;  // Set address where addr[15] is 0, addr[14:12] is 111
        #10;
        $display("Test 4 - Address: %h, Write Enable: %b, Output Buffer Enable: %b, SDRAM Buffer Enable: %b", i_lsu_addr, i_lsu_wren, output_buf_en, sdram_buf_en);

        // Test 5: Test SDRAM buffer enable conditions
        i_lsu_addr = 32'h00006000;  // Set address where addr[13] is 1, addr[14:15] is 0
        #10;
        $display("Test 5 - Address: %h, Write Enable: %b, Output Buffer Enable: %b, SDRAM Buffer Enable: %b", i_lsu_addr, i_lsu_wren, output_buf_en, sdram_buf_en);

        // Test 6: Test for disabled conditions
        i_lsu_addr = 32'h00000000;  // Set address to disable both buffers
        i_lsu_wren = 1'b0;          // Write enable is low
        #10;
        $display("Test 6 - Address: %h, Write Enable: %b, Output Buffer Enable: %b, SDRAM Buffer Enable: %b", i_lsu_addr, i_lsu_wren, output_buf_en, sdram_buf_en);

/// Test 6: Test for disabled conditions
        i_lsu_addr = 32'h0000201f;  // Set address to disable both buffers
        i_lsu_wren = 1'b1;          // Write enable is low
        #10;
        $display("Test 6 - Address: %h, Write Enable: %b, Output Buffer Enable: %b, SDRAM Buffer Enable: %b", i_lsu_addr, i_lsu_wren, output_buf_en, sdram_buf_en);

	// Test 6: Test for disabled conditions
        i_lsu_addr = 32'h000030f0;  // Set address to disable both buffers
        i_lsu_wren = 1'b1;          // Write enable is low
        #10;
        $display("Test 6 - Address: %h, Write Enable: %b, Output Buffer Enable: %b, SDRAM Buffer Enable: %b", i_lsu_addr, i_lsu_wren, output_buf_en, sdram_buf_en);
	
	// Test 6: Test for disabled conditions
        i_lsu_addr = 32'h00004000;  // Set address to disable both buffers
        i_lsu_wren = 1'b1;          // Write enable is low
        #10;
        $display("Test 6 - Address: %h, Write Enable: %b, Output Buffer Enable: %b, SDRAM Buffer Enable: %b", i_lsu_addr, i_lsu_wren, output_buf_en, sdram_buf_en);
	// Test 6: Test for disabled conditions
        i_lsu_addr = 32'h000030f0;  // Set address to disable both buffers
        i_lsu_wren = 1'b0;          // Write enable is low
        #10;
        $display("Test 6 - Address: %h, Write Enable: %b, Output Buffer Enable: %b, SDRAM Buffer Enable: %b", i_lsu_addr, i_lsu_wren, output_buf_en, sdram_buf_en);
	
	// Test 6: Test for disabled conditions
        i_lsu_addr = 32'h00004000;  // Set address to disable both buffers
        i_lsu_wren = 1'b0;          // Write enable is low
        #10;
        $display("Test 6 - Address: %h, Write Enable: %b, Output Buffer Enable: %b, SDRAM Buffer Enable: %b", i_lsu_addr, i_lsu_wren, output_buf_en, sdram_buf_en);
	// Test 6: Test for disabled conditions
        i_lsu_addr = 32'h000070f0;  // Set address to disable both buffers
        i_lsu_wren = 1'b1;          // Write enable is low
        #10;
        $display("Test 6 - Address: %h, Write Enable: %b, Output Buffer Enable: %b, SDRAM Buffer Enable: %b", i_lsu_addr, i_lsu_wren, output_buf_en, sdram_buf_en);
	
	// Test 6: Test for disabled conditions
        i_lsu_addr = 32'h00007010;  // Set address to disable both buffers
        i_lsu_wren = 1'b1;          // Write enable is low
        #10;
        $display("Test 6 - Address: %h, Write Enable: %b, Output Buffer Enable: %b, SDRAM Buffer Enable: %b", i_lsu_addr, i_lsu_wren, output_buf_en, sdram_buf_en);

        // Finish the simulation
        $finish;
    end
endmodule

