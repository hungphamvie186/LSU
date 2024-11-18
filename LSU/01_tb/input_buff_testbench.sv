module design_test();

    // Declare inputs to the module as reg
    reg [31:0] i_io_sw;
    reg [3:0] i_io_btn;
    reg i_clk, i_rst;
    reg addr;

    // Declare outputs from the module as wire
    wire [31:0] input_buffer_out;

    // Instantiate the input_buffer module
    input_buffer dut (
        .i_io_sw(i_io_sw),
        .i_io_btn(i_io_btn),
        .i_clk(i_clk),
        .i_rst(i_rst),
        .addr(addr),
        .input_buffer_out(input_buffer_out)
    );

    initial begin
        $fsdbDumpfile("design_test.fsdb");
        $fsdbDumpvars(0, design_test, "+all","+mda");
    end

     // Clock generation
    always #5 i_clk = ~i_clk;  // 10ns clock period

    // Initial block for test stimulus
    initial begin
        // Initialize inputs
        i_clk = 0;
        i_rst = 1;
        i_io_sw = 32'b0;
        i_io_btn = 4'b0;
        addr = 0;

        // Apply reset
        #10 i_rst = 0;

        // Test 1: Apply some inputs to switches and buttons
        #10 i_io_sw = 32'h1;  // Switch input
            i_io_btn = 4'h2;      // Button input
            addr = 0;                // Select buttons buffer (addr = 0)
        #10 addr = 1;                // Select switches buffer (addr = 1)

        // Test 2: Change button and switch inputs
        #20 i_io_sw = 32'h3;
            i_io_btn = 4'b100;      
            addr = 0;                // Select buttons buffer

        // Test 3: Check reset behavior
        #30 i_rst = 1;  // Assert reset
        #10 i_rst = 0;  // Deassert reset

        // Finish the simulation
        #50 $finish;
    end

    // Monitor output values
    initial begin
        $monitor("At time %t, input_buffer_out = %h", $time, input_buffer_out);
    end
endmodule

