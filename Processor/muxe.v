module muxe (OrigALU, Dados_leitura2, imediato, saida_muxe);

input OrigALU;
input [31:0] Dados_leitura2;
input [31:0] imediato;

output reg [31:0] saida_muxe;

always @(*)
begin
	if (OrigALU) saida_muxe = imediato;
	else saida_muxe = Dados_leitura2;

end

endmodule

