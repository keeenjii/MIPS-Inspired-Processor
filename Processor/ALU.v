module ALU (Resultado, slt, zero, codigo_entrada, operador1, operador2, shift);

	output reg [63:0] Resultado;
	output reg slt, zero;
	
	//reg[63:0] Resultado_reg;
	//reg slt_reg, zero_reg;
	reg[31:0] HIdiv;
	reg[31:0] LOdiv;
	
	input [3:0] codigo_entrada;
	input [31:0] operador1;
	input [31:0] operador2;
	input [4:0] shift;
	 
	always @(*)
	begin
	
		Resultado = 64'b0;
		slt = 0;
		zero = 0;
		HIdiv = 32'b0;
		LOdiv = 32'b0;
		case(codigo_entrada)
			
			4'b0001: Resultado = operador1 + operador2;
			
			4'b0010:
				begin
				Resultado= operador1 - operador2;
				if ($signed(Resultado) < 0) slt = 1;
				//else slt = 0;
				zero = Resultado == 0 ? 1:0 ;
				end
				
			4'b0011: Resultado = operador1 * operador2;
			
			4'b0100: 
				begin
				HIdiv = operador1 % operador2;
				LOdiv = operador1 / operador2;
				Resultado = {HIdiv, LOdiv};
				end
				
			4'b0101: Resultado = operador1 << shift;
			
			4'b0110: Resultado = operador1 >> shift;
			
			4'b0111: Resultado = operador1 & operador2;
			
			4'b1000: Resultado = operador1 | operador2;
			
			4'b1001: Resultado = operador1 ^ operador2;
			
			4'b1010: Resultado = ~(operador1 | operador2);
			
			4'b1011: Resultado = ~operador1;
			
			default: Resultado = 64'b0;

		endcase
	end
	
	
	
endmodule
	