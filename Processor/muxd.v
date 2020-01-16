module muxd (PC, Dados_escrita, WriteRa, saida_muxd);

input [31:0] PC;
input [31:0] Dados_escrita;
input WriteRa;

output reg [31:0] saida_muxd;

always @(*)
begin

	if (WriteRa) saida_muxd = PC;
	else saida_muxd = Dados_escrita;

end

endmodule 