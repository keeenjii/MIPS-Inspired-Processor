module muxf (entradaOR, PCplus4, PCplusBranch, saida_muxf );

input [31:0] PCplus4;
input [31:0] PCplusBranch;
input entradaOR;

output reg [31:0] saida_muxf;

always @(*)
begin
	if (entradaOR) saida_muxf = PCplusBranch;
	else saida_muxf = PCplus4;
end


endmodule
