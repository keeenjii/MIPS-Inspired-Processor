module Program_counter (breakk, entrada_PC, saida_PC, clk, reset, in, out, switchIO);

	input breakk, clk, reset, in, out;
	input switchIO;
	input [31:0] entrada_PC;

	output reg [31:0] saida_PC;
	
	integer inicio = 1;
	integer paradaIO = 0;
	
	
	always @(negedge clk)
	begin
		if(inicio == 1)
			begin
			saida_PC = 1;
			inicio = 0;
			end
			
		if (in | out) paradaIO = 1;
		
		if (switchIO) paradaIO = 0;
	
		if (paradaIO == 0)
			begin
			if(breakk == 0)	saida_PC = entrada_PC;
			end
			
		if(reset) saida_PC = 1;
	end

endmodule 
