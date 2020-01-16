module Add_PC (entrada_PC, saida_addPC);

	input [31:0] entrada_PC;
	output wire [31:0] saida_addPC;
	assign saida_addPC = entrada_PC + 1;

endmodule 