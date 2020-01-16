module concatenador (entrada_AddPC, entrada_jump, saida_endJump);
	input [31:0] entrada_AddPC;
	input [25:0] entrada_jump;
	
	output wire [31:0] saida_endJump;
	assign saida_endJump = { entrada_AddPC [31:26] , entrada_jump };

endmodule 