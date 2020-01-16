module controle_ALU (OpAlu, Opcode, controle_ULA);

	input [1:0] OpAlu;
	input [5:0] Opcode;
	
	output reg [3:0] controle_ULA;
	
	always @(*)
	begin
	
		controle_ULA = 4'b0;
	
		if (OpAlu == 2'b00) controle_ULA = 4'b0001;
		if (OpAlu == 2'b01) controle_ULA = 4'b0010;
	
		if (OpAlu == 2'b10) begin
		
			case (Opcode)
				6'b000101: controle_ULA = 4'b0011;
				6'b000111: controle_ULA = 4'b0100;
				6'b001011: controle_ULA = 4'b0110;
				6'b001100: controle_ULA = 4'b0101;
				6'b001101: controle_ULA = 4'b0111;
				6'b001110: controle_ULA = 4'b0111;
				6'b001111: controle_ULA = 4'b1000;
				6'b010000: controle_ULA = 4'b1000;
				6'b010001: controle_ULA = 4'b1001;
				6'b010010: controle_ULA = 4'b1001;
				6'b010011: controle_ULA = 4'b1010;
				6'b010110: controle_ULA = 4'b1011;
				default: controle_ULA = 4'b0000;		
			endcase
		end
	
	end

endmodule 
