module banco_Registradores (Reg_leitura1, Reg_leitura2, Reg_escrita, Dados_entrada, Dados_escrita, Dados_leitura1,
Dados_leitura2, RS, EscreveReg, WriteHILO, In, ResultadoHILO, clk, Out);

// ENDEREÇO DO RESGISTRADOR DE ENDEREÇO: 11111 ($ra)
// ENDEREÇO DO RESIGTRADOR HI: 11110
// ENDEREÇO DO REGISTRADOR LO: 11101
// Registradores temporarios: 0 a 9
// Registradores de uso geral: 10 a 19
// Registradores argumentos de funçao: 20 a 23
// Registradores resultados de funçao: 24 e 25
// Registrador $zero: 26
// Registrador topo de pilha: 27
// Registrador de entrada $RE: 28
// Registrador LO: 29
// Registrador HI: 30
// Registrador de endereço: 31

parameter RA = 5'b11111;
parameter HI = 5'b11110;
parameter LO = 5'b11101;
parameter RE = 5'b11100;
parameter ZERO = 5'b11010;

input [4:0] Reg_leitura1;
input [4:0] Reg_leitura2;
input [31:0] Dados_escrita;
input [31:0] Dados_entrada;
input clk;
input EscreveReg, WriteHILO, Out, In;
input [63:0] ResultadoHILO;
input [4:0] Reg_escrita;

output wire [31:0] Dados_leitura1;
output wire [31:0] Dados_leitura2;
output reg [31:0] RS;
//output reg [31:0] saidaTeste; /// Usado somente para testar o processador


reg [31:0] registradores_banco [31:0];

assign Dados_leitura1 = registradores_banco[Reg_leitura1]; // LEITURA DOS REGISTRADORES
assign Dados_leitura2 = registradores_banco[Reg_leitura2];

always @ (negedge clk) // ESCRITA NOS REGISTRADORES
begin
	registradores_banco[ZERO] = 0;
	
	if(WriteHILO) 
		begin
		registradores_banco[HI] = ResultadoHILO[63:32];
		registradores_banco[LO] = ResultadoHILO[31:0];
		end
	if(EscreveReg) registradores_banco[Reg_escrita] = Dados_escrita;
	if (Out) RS = Dados_escrita;
	if (In) registradores_banco[RE] = Dados_entrada;
	//saidaTeste = registradores_banco[1]; usado para testes
end
endmodule 
