module branch_logic (Zero_ula, BifNot, Branch, saida_para_muxf);

input Zero_ula, BifNot, Branch;
output reg saida_para_muxf;

	always @(*)
	begin
	saida_para_muxf = (Zero_ula & Branch) | (~Zero_ula & BifNot);
	end

endmodule 