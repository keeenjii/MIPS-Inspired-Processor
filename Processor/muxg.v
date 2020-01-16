module muxg (entrada_muxf, entrada_jump, Jump, saida_muxg);

	input [31:0]entrada_muxf;
	input [31:0]entrada_jump;
	input Jump;
	
	output reg [31:0]saida_muxg;
	
	always @(*)
	begin
		if (Jump) saida_muxg = entrada_jump;
		else saida_muxg = entrada_muxf;
	
	end
	


endmodule 