module muxc (Instrucao16_20, Instrucao11_15, RegDst, saida_muxc);

	parameter ra = 5'b11111; // ENDERECO DO REGISTRADOR DE ENDERECO: 11111
	input [4:0] Instrucao16_20;
	input [4:0] Instrucao11_15;
	input [1:0] RegDst;
	
	output reg [4:0] saida_muxc;
	
	always @ (*)
	begin
		saida_muxc = 5'b0;
	
		if (RegDst == 2'b00) saida_muxc = Instrucao16_20;
		if (RegDst == 2'b01) saida_muxc = Instrucao11_15;
		if (RegDst == 2'b10) saida_muxc = ra;
	end


endmodule 