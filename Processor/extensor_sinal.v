module extensor_sinal (sin_entrada, sin_saida);

input [15:0] sin_entrada;

output wire [31:0] sin_saida;


assign sin_saida = sin_entrada[15] == 0 ? {16'b0000000000000000, sin_entrada}: {16'b1111111111111111, sin_entrada};

endmodule 
