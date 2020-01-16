module binParaBCD(
	input [25:0] bin,
	output reg [3:0] dezmilhao,
	output reg [3:0] milhao,
	output reg [3:0] cemmil,
	output reg [3:0] dezmil,
	output reg [3:0] mil,
	output reg [3:0] cem,
	output reg [3:0] dez,
	output reg [3:0] um

);

	integer i;
	
	always @(bin)
	begin
			dezmilhao = 4'd0;
			milhao = 4'd0;
			cemmil = 4'd0;
			dezmil = 4'd0;
			mil = 4'd0;
			cem = 4'd0;
			dez = 4'd0;
			um = 4'd0;
			
			for (i = 25; i >= 0; i = i-1)
			begin
				// Adicionar 3 as colunas maiores que 5
				if (dezmilhao >= 5) dezmilhao = dezmilhao + 3;
				if (milhao >= 5) milhao = milhao + 3;
				if (cemmil >= 5) cemmil = cemmil + 3;
				if (dezmil >= 5) dezmil = dezmil + 3;
				if (mil >= 5) mil = mil+3;
				if (cem >= 5) cem = cem+3;
				if (dez >= 5) dez = dez+3;
				if (um >= 5) um = um+3;
				
				//deslocamento esquerdo de 1
				dezmilhao = dezmilhao << 1;
				dezmilhao[0] = milhao[3];
				milhao = milhao << 1;
				milhao[0] = cemmil[3];
				cemmil = cemmil << 1;
				cemmil[0] = dezmil [3];
				dezmil = dezmil << 1;
				dezmil[0] = mil[3];
				mil = mil << 1;
				mil[0] = cem[3];
				cem = cem << 1;
				cem[0] = dez[3];
				dez = dez << 1;
				dez[0] = um[3];
				um = um << 1;
				um[0] = bin[i];
			end
	end

endmodule 