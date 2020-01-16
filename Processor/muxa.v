module muxa (Instrucao0_25, Dados_leitura1, JumpR, saida_muxa);

	input [25:0] Instrucao0_25;
	input [31:0] Dados_leitura1;
	input JumpR;
	
	output reg [25:0] saida_muxa;
	
	always @ (*)
	begin
	
		if (JumpR) saida_muxa = Dados_leitura1[25:0];
		else saida_muxa = Instrucao0_25;
		
	end
	


endmodule 