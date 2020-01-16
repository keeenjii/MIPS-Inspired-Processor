module muxb (Instrucao21_25, JumpR, saida_muxb);

	input [4:0] Instrucao21_25;
	parameter ra = 5'b11111;
	input JumpR;
	
	output reg [4:0] saida_muxb;
	
	always @ (*)
	begin
	
		if (JumpR) saida_muxb = ra;
		else saida_muxb = Instrucao21_25;
		
	end
	


endmodule 