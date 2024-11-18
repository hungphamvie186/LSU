module out_mux (
	input wire [31:0] ip,   
	input wire [31:0] op,
	input wire [31:0] sram,
 	input wire [31:0] addr,       
	
	output reg [31:0] o_ld_data    
);
	wire [1:0] sel;
	wire 	   ip_en,op_en,sram_en;
	assign ip_en = ~addr[15] & 
								(addr[14] & addr[13] & addr[12] & addr[11]) & 
								(~addr[10] & ~addr[9] & ~addr[8] & ~addr[7] & ~addr[6]);
	assign op_en = ~addr[15] & 
								(addr[14] & addr[13] & addr[12]) & 
								(~addr[11] & ~addr[10] & ~addr[9] & ~addr[8] & ~addr[7] & ~addr[6] );
	assign sram_en = ~addr[15] & ~addr[14] & addr[13];
	assign sel[1] = ~ip_en & ~op_en & sram_en;
	assign sel[0] = ~ip_en &  op_en & ~sram_en;	

mux_4to1 mux_(
    .d0    	(ip),
    .d1    	(op),
    .d2  	(sram),
    .d3    	(ip),
    .sel 	(sel),
    .y 		(o_ld_data)
    );
endmodule
