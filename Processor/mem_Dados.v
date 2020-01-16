module mem_Dados
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=32)
(
	input [(DATA_WIDTH-1):0] Dados_escrita,
	input [(ADDR_WIDTH-1):0] endereco,
	input EscreveMem, LeMem, read_clock, write_clock,
	output reg [(DATA_WIDTH-1):0] Dados_leitura, //saidaMem1 // saidaMem1 sera utilizado apenas para teste
	output reg [31:0] dadosmem
);
	
	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[2**8:0];
	
	always @ (negedge write_clock)
	begin
		// Write
		if (EscreveMem)
			ram[endereco] <= Dados_escrita;
		//saidaMem1 <= ram[2];
	end
	
	always @ (posedge read_clock)
	begin
		// Read 
		Dados_leitura <= ram[endereco];
		//dadosmem <= ram[2];
	end
	
endmodule

