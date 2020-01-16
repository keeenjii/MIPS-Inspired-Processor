module muxk (Dados_leitura, Slt_resultado, Resultado_ula, Slt, MemparaReg, saida_muxk);
	
	input [31:0] Dados_leitura;
	input Slt_resultado, Slt, MemparaReg;
	input [31:0] Resultado_ula;
	
	output reg [31:0] saida_muxk;
	
	always @(*)
	begin
		if (Slt) saida_muxk = Slt_resultado;
		else if (MemparaReg) saida_muxk = Dados_leitura;
		else saida_muxk = Resultado_ula;
	
	end


endmodule 
