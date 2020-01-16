module Add_B (entrada_AddPC, entrada_Imediato, saida_addB);

	input [31:0] entrada_AddPC, entrada_Imediato;
	output wire [31:0] saida_addB;
	assign saida_addB = entrada_AddPC + entrada_Imediato;
	
endmodule 