module mem_Instrucao(endereco_leitura, clk, instrucao);

	input [31:0]endereco_leitura;
	input clk;
	integer programa = 1;
	
	reg [31:0]mem_instrucao[255:0];
	
	output [31:0] instrucao;
	
	always @(posedge clk)
	begin
		if(programa == 1)
			begin
//////////////////////INSTRUCOES DO PROGRAMA//////////////////////////////////////////////

		//FATORIAL
		/*mem_instrucao[2][31:26] = 6'b011110; //IN
		mem_instrucao[2][25:0] = 26'b0;

		mem_instrucao[3][31:26] = 6'b000010; //addi // UTILIZADO COMO LOAD IMEDIATE
		mem_instrucao[3][25:21] = 5'b11010;	//registrador zero
		mem_instrucao[3][20:16] = 5'b00011;	//registrador 3 // destino
		mem_instrucao[3][15:0] = 16'd1;
		
		mem_instrucao[4][31:26] = 6'b000001; //add // utilizado como MOV
		mem_instrucao[4][25:21] = 5'b11010;	//registrador zero
		mem_instrucao[4][20:16] = 5'b11100;	//registrador RE
		mem_instrucao[4][15:11] = 5'b00001;	//registrador 1 // destino
		mem_instrucao[4][10:6] = 5'b0;
		
		mem_instrucao[5][31:26] = 6'b000100; //subi
		mem_instrucao[5][25:21] = 5'b11100;	//registrador RE
		mem_instrucao[5][20:16] = 5'b11100;	//registardor RE// destino
		mem_instrucao[5][15:0] = 16'd1;
		
		mem_instrucao[6][31:26] = 6'b000101; //mult
		mem_instrucao[6][25:21] = 5'b11100;
		mem_instrucao[6][20:16] = 5'b00001;
		mem_instrucao[6][15:0] = 16'b0;
		
		mem_instrucao[7][31:26] = 6'b000001; //add // utilizado como MOV
		mem_instrucao[7][25:21] = 5'b11010;	//registrador zero
		mem_instrucao[7][20:16] = 5'b11101;	//registrador LO
		mem_instrucao[7][15:11] = 5'b00001;	//registrador 1 // destino
		mem_instrucao[7][10:6] = 5'b0;
		
		mem_instrucao[8][31:26] = 6'b011001; //beq para o final do programa
		mem_instrucao[8][25:21] = 5'b11100;
		mem_instrucao[8][20:16] = 5'b00011;
		mem_instrucao[8][15:0] = 16'd1;
		
		mem_instrucao[9][31:26] = 6'b010111; // jump para laço do fatorial
		mem_instrucao[9][25:0] = 26'd5;
		
		mem_instrucao[10][31:26] = 6'b011101; //OUT
		mem_instrucao[10][25:21] = 5'b00001;	
		mem_instrucao[10][20:16] = 5'b11010;	
		mem_instrucao[10][15:0] = 16'b0;	
		
		mem_instrucao[11][31:26] = 6'b011100; // BREAK
		mem_instrucao[11][25:0] = 26'd0;*/
		
		
	// SINTETICO // TESTE DAS INSTRUÇÕES
	
		/*mem_instrucao[2][31:26] = 6'b000010; //addi // UTILIZADO COMO LOAD IMEDIATE
		mem_instrucao[2][25:21] = 5'b11010;	//registrador zero
		mem_instrucao[2][20:16] = 5'b00001;	//registrador 1 // destino
		mem_instrucao[2][15:0] = 16'd13;
		
		mem_instrucao[3][31:26] = 6'b000010; //addi // UTILIZADO COMO LOAD IMEDIATE
		mem_instrucao[3][25:21] = 5'b11010;	//registrador zero
		mem_instrucao[3][20:16] = 5'b00010;	//registrador 2 // destino
		mem_instrucao[3][15:0] = 16'd5;
		
		mem_instrucao[4][31:26] = 6'b000011; // TESTANDO A INSTRUÇÃO SUB
		mem_instrucao[4][25:21] = 5'b00001;	//registrador 1
		mem_instrucao[4][20:16] = 5'b00010;	//registrador 2
		mem_instrucao[4][15:11] = 5'b00011;	//registrador 3 // destino
		mem_instrucao[4][10:6] = 5'b0;
		
		// RESULTADO ESPERADO: 8
		
		mem_instrucao[5][31:26] = 6'b011101; //OUT
		mem_instrucao[5][25:21] = 5'b00011;	
		mem_instrucao[5][20:16] = 5'b11010;	
		mem_instrucao[5][15:0] = 16'b0;
		
		///////
		
		mem_instrucao[6][31:26] = 6'b000010; //addi // UTILIZADO COMO LOAD IMEDIATE
		mem_instrucao[6][25:21] = 5'b11010;	//registrador zero
		mem_instrucao[6][20:16] = 5'b00001;	//registrador 1 // destino
		mem_instrucao[6][15:0] = 16'd25;
		
		mem_instrucao[7][31:26] = 6'b000111; //Testando a instrução div
		mem_instrucao[7][25:21] = 5'b00001;	//registrador 1
		mem_instrucao[7][20:16] = 5'b00010;	//registrador 2
		mem_instrucao[7][15:0] = 16'd0;
		
		// RESULTADO ESPERADO: 5
		
		mem_instrucao[8][31:26] = 6'b011101; //OUT
		mem_instrucao[8][25:21] = 5'b11101;	// Registrador LO
		mem_instrucao[8][20:16] = 5'b11010;	
		mem_instrucao[8][15:0] = 16'b0;
		
		//////
		
		mem_instrucao[9][31:26] = 6'b000010; //addi // UTILIZADO COMO LOAD IMEDIATE
		mem_instrucao[9][25:21] = 5'b11010;	//registrador zero
		mem_instrucao[9][20:16] = 5'b00001;	//registrador 1 // destino
		mem_instrucao[9][15:0] = 16'd3;
	
		mem_instrucao[10][31:26] = 6'b001001; // Testando a instrução sw
		mem_instrucao[10][25:21] = 5'b11010;	
		mem_instrucao[10][20:16] = 5'b00001;	
		mem_instrucao[10][15:0] = 16'd2;  // Guarda o numero 3 na posição 2 da memória
		
		mem_instrucao[11][31:26] = 6'b001000; // Testando a instrução lw
		mem_instrucao[11][25:21] = 5'b11010;	//registrador zero
		mem_instrucao[11][20:16] = 5'b00011;	//registrador 3 // destino
		mem_instrucao[11][15:0] = 16'd2;	//	Carrega no registrador 3 o dado armazenado na posição 2 da memória
		
		// RESULTADO ESPERADO: 3
		
		mem_instrucao[12][31:26] = 6'b011101; //OUT
		mem_instrucao[12][25:21] = 5'b00011;	// Registrador 3
		mem_instrucao[12][20:16] = 5'b11010;	
		mem_instrucao[12][15:0] = 16'b0;
		
		//
		
		mem_instrucao[13][31:26] = 6'b000010; //addi // UTILIZADO COMO LOAD IMEDIATE
		mem_instrucao[13][25:21] = 5'b11010;	//registrador zero
		mem_instrucao[13][20:16] = 5'b00001;	//registrador 1 // destino
		mem_instrucao[13][15:0] = 16'd4;
		
		mem_instrucao[14][31:26] = 6'b001011; //testando a instrução sra
		mem_instrucao[14][25:21] = 5'b00001;
		mem_instrucao[14][20:16] = 5'b00000;
		mem_instrucao[14][15:11] = 5'b00001;
		mem_instrucao[14][10:6] = 5'b00001; // deslocamento de 1 para a direita, dividindo por 2
		
		//Resultado esperado: 2
		
		mem_instrucao[15][31:26] = 6'b011101; //OUT
		mem_instrucao[15][25:21] = 5'b00001;	// Registrador 1
		mem_instrucao[15][20:16] = 5'b11010;	
		mem_instrucao[15][15:0] = 16'b0;
		
		//
		
		mem_instrucao[16][31:26] = 6'b001100; //testando a instrucao sla
		mem_instrucao[16][25:21] = 5'b00001;
		mem_instrucao[16][20:16] = 5'b00000;
		mem_instrucao[16][15:11] = 5'b00001;
		mem_instrucao[16][10:6] = 5'b00010; // deslocamento de 2 para a esquerda, multiplicando por 
		
		// RESULTADO ESPERADO: 8
		
		mem_instrucao[17][31:26] = 6'b011101; //OUT
		mem_instrucao[17][25:21] = 5'b00001;	// Registrador 1
		mem_instrucao[17][20:16] = 5'b11010;	
		mem_instrucao[17][15:0] = 16'b0;
		
		//
		
		mem_instrucao[18][31:26] = 6'b000010; //addi // UTILIZADO COMO LOAD IMEDIATE
		mem_instrucao[18][25:21] = 5'b11010;	//registrador zero
		mem_instrucao[18][20:16] = 5'b00001;	//registrador 1 // destino
		mem_instrucao[18][15:0] = 16'd3;
		
		mem_instrucao[19][31:26] = 6'b000010; //addi // UTILIZADO COMO LOAD IMEDIATE
		mem_instrucao[19][25:21] = 5'b11010;	//registrador zero
		mem_instrucao[19][20:16] = 5'b00010;	//registrador 1 // destino
		mem_instrucao[19][15:0] = 16'd1;
		
		mem_instrucao[20][31:26] = 6'b001101; //Testando a instrução and
		mem_instrucao[20][25:21] = 5'b00001;
		mem_instrucao[20][20:16] = 5'b00010;
		mem_instrucao[20][15:11] = 5'b00001;
		mem_instrucao[20][10:0] = 11'd0;
		
		// RESULTADO ESPERADO: 1
		
		mem_instrucao[21][31:26] = 6'b011101; //OUT
		mem_instrucao[21][25:21] = 5'b00001;	// Registrador 1
		mem_instrucao[21][20:16] = 5'b11010;	
		mem_instrucao[21][15:0] = 16'b0;
		
		//
		
		mem_instrucao[22][31:26] = 6'b000010; //addi // UTILIZADO COMO LOAD IMEDIATE
		mem_instrucao[22][25:21] = 5'b11010;	//registrador zero
		mem_instrucao[22][20:16] = 5'b00001;	//registrador 1 // destino
		mem_instrucao[22][15:0] = 16'd3;
		
		mem_instrucao[23][31:26] = 6'b001111; //Testando a instrução or
		mem_instrucao[23][25:21] = 5'b00001;
		mem_instrucao[23][20:16] = 5'b00010;
		mem_instrucao[23][15:11] = 5'b00001;
		mem_instrucao[23][10:0] = 11'd0;
		
		// RESULTADO ESPERADO: 3
		
		mem_instrucao[24][31:26] = 6'b011101; //OUT
		mem_instrucao[24][25:21] = 5'b00001;	// Registrador 1
		mem_instrucao[24][20:16] = 5'b11010;	
		mem_instrucao[24][15:0] = 16'b0;
		
		//
		
		mem_instrucao[25][31:26] = 6'b010001; //Testando a instrução xor
		mem_instrucao[25][25:21] = 5'b00001;
		mem_instrucao[25][20:16] = 5'b00010;
		mem_instrucao[25][15:11] = 5'b00001;
		mem_instrucao[25][10:0] = 11'd0;
		
		// RESULTADO ESPERADO: 2
		
		mem_instrucao[26][31:26] = 6'b011101; //OUT
		mem_instrucao[26][25:21] = 5'b00001;	// Registrador 1
		mem_instrucao[26][20:16] = 5'b11010;	
		mem_instrucao[26][15:0] = 16'b0;
		
		//
			
		mem_instrucao[27][31:26] = 6'b000100; //subi
		mem_instrucao[27][25:21] = 5'b11010;	//registrador zero
		mem_instrucao[27][20:16] = 5'b00001;	//registardor 1 // destino
		mem_instrucao[27][15:0] = 16'd2;	
		
		mem_instrucao[28][31:26] = 6'b000100; //subi
		mem_instrucao[28][25:21] = 5'b11010;	//registrador zero
		mem_instrucao[28][20:16] = 5'b00010;	//registardor 1 // destino
		mem_instrucao[28][15:0] = 16'd2;
	
		mem_instrucao[29][31:26] = 6'b010011; //Testando a instrução nor
		mem_instrucao[29][25:21] = 5'b00001; // reg 1
		mem_instrucao[29][20:16] = 5'b00010; // reg 2
		mem_instrucao[29][15:11] = 5'b00001;
		mem_instrucao[29][10:0] = 11'd0;
		
		// RESULTADO ESPERADO: 1
		
		mem_instrucao[30][31:26] = 6'b011101; //OUT
		mem_instrucao[30][25:21] = 5'b00001;	// Registrador 1
		mem_instrucao[30][20:16] = 5'b11010;	
		mem_instrucao[30][15:0] = 16'b0;
		
		//
		
		mem_instrucao[31][31:26] = 6'b010100; //Testando a instrução slt
		mem_instrucao[31][25:21] = 5'b00011;
		mem_instrucao[31][20:16] = 5'b00001;
		mem_instrucao[31][15:11] = 5'b00011;
		mem_instrucao[31][10:0] = 11'd0;
		
		// RESULTADO ESPERADO: 0
		
		mem_instrucao[32][31:26] = 6'b011101; //OUT
		mem_instrucao[32][25:21] = 5'b00011;	// Registrador 3
		mem_instrucao[32][20:16] = 5'b11010;	
		mem_instrucao[32][15:0] = 16'b0;
		
		//
		
		mem_instrucao[33][31:26] = 6'b010110; //Testando a instrução not
		mem_instrucao[33][25:21] = 5'b00010;
		mem_instrucao[33][20:16] = 5'b00000;
		mem_instrucao[33][15:11] = 5'b00001;
		mem_instrucao[33][10:0] = 11'd0;
		
		// RESULTADO ESPERADO: 1
		
		mem_instrucao[34][31:26] = 6'b011101; //OUT
		mem_instrucao[34][25:21] = 5'b00001;	// Registrador 1
		mem_instrucao[34][20:16] = 5'b11010;	
		mem_instrucao[34][15:0] = 16'b0;
		
		//
			
		mem_instrucao[35][31:26] = 6'b011011; // testando a instrução jal
		mem_instrucao[35][25:0] = 26'd37;
	
		mem_instrucao[36][31:26] = 6'b011100; // BREAK
		mem_instrucao[36][25:0] = 26'd0;
		
		//RESULTADO ESPERADO: 35
		
		mem_instrucao[37][31:26] = 6'b011101; //OUT
		mem_instrucao[37][25:21] = 5'b11111;	// Registrador RA
		mem_instrucao[37][20:16] = 5'b11010;	
		mem_instrucao[37][15:0] = 16'b0;
		
		//
		
		mem_instrucao[38][31:26] = 6'b000010; //addi // UTILIZADO COMO LOAD IMEDIATE
		mem_instrucao[38][25:21] = 5'b11010;	//registrador zero
		mem_instrucao[38][20:16] = 5'b11111;	//registrador RA // destino
		mem_instrucao[38][15:0] = 16'd41;
		
		mem_instrucao[39][31:26] = 6'b011000; // testando a instrução jr
		mem_instrucao[39][25:0] = 26'd0;
		
		mem_instrucao[40][31:26] = 6'b011100; // BREAK
		mem_instrucao[40][25:0] = 26'd0;
		
		//RESULTADO ESPERADO: 41
		
		mem_instrucao[41][31:26] = 6'b011101; //OUT
		mem_instrucao[41][25:21] = 5'b11111;	// Registrador RA
		mem_instrucao[41][20:16] = 5'b11010;	
		mem_instrucao[41][15:0] = 16'b0;
		
		//
		
		mem_instrucao[42][31:26] = 6'b000010; //addi // UTILIZADO COMO LOAD IMEDIATE
		mem_instrucao[42][25:21] = 5'b11010;	//registrador zero
		mem_instrucao[42][20:16] = 5'b00001;	//registrador 1 // destino
		mem_instrucao[42][15:0] = 16'd3;
		
		mem_instrucao[43][31:26] = 6'b000010; //addi // UTILIZADO COMO LOAD IMEDIATE
		mem_instrucao[43][25:21] = 5'b11010;	//registrador zero
		mem_instrucao[43][20:16] = 5'b00010;	//registrador 2 // destino
		mem_instrucao[43][15:0] = 16'd2;
		
		mem_instrucao[44][31:26] = 6'b011010; //testando instruçao bne
		mem_instrucao[44][25:21] = 5'b00001;
		mem_instrucao[44][20:16] = 5'b00010;
		mem_instrucao[44][15:0] = 16'd1;
		
		mem_instrucao[45][31:26] = 6'b011100; // BREAK
		mem_instrucao[45][25:0] = 26'd0;
		
		//RESULTADO ESPERADO: 3
		
		mem_instrucao[46][31:26] = 6'b011101; //OUT
		mem_instrucao[46][25:21] = 5'b00001;	// Registrador 1
		mem_instrucao[46][20:16] = 5'b11010;	
		mem_instrucao[46][15:0] = 16'b0;
		
		
		mem_instrucao[47][31:26] = 6'b011100; // BREAK
		mem_instrucao[47][25:0] = 26'd0;*/
		
		/* FIBONACCI f(0) = 0  f(1) = 1 f(2) = 1 f(3) = 2
		
		mem_instrucao[2][31:26] = 6'b011110; //IN
		mem_instrucao[2][25:0] = 26'b0;
		
		mem_instrucao[3][31:26] = 6'b000010; //addi // UTILIZADO COMO LOAD IMEDIATE
		mem_instrucao[3][25:21] = 5'b11010;	//registrador zero
		mem_instrucao[3][20:16] = 5'b00001;	//registrador 1 // destino
		mem_instrucao[3][15:0] = 16'd0;
		
		mem_instrucao[4][31:26] = 6'b000010; //addi // UTILIZADO COMO LOAD IMEDIATE
		mem_instrucao[4][25:21] = 5'b11010;	//registrador zero
		mem_instrucao[4][20:16] = 5'b00010;	//registrador 2 // destino
		mem_instrucao[4][15:0] = 16'd1;
		
		mem_instrucao[5][31:26] = 6'b000100; //subi
		mem_instrucao[5][25:21] = 5'b11100;	//registrador RE
		mem_instrucao[5][20:16] = 5'b11100;	//registardor RE// destino
		mem_instrucao[5][15:0] = 16'd1;
		
		//INICIO DO LAÇO// 
		
		mem_instrucao[6][31:26] = 6'b000001; //add // 
		mem_instrucao[6][25:21] = 5'b00001;	//registrador 1
		mem_instrucao[6][20:16] = 5'b00010;	//registrador 2
		mem_instrucao[6][15:11] = 5'b00011;	//registrador 3 // destino
		mem_instrucao[6][10:6] = 5'b0;
		
		mem_instrucao[7][31:26] = 6'b000100; //subi
		mem_instrucao[7][25:21] = 5'b11100;	//registrador RE
		mem_instrucao[7][20:16] = 5'b11100;	//registardor RE// destino
		mem_instrucao[7][15:0] = 16'd1;
		
		mem_instrucao[8][31:26] = 6'b000001; //add // utilizado como MOV
		mem_instrucao[8][25:21] = 5'b11010;	//registrador ZERO
		mem_instrucao[8][20:16] = 5'b00010;	//registrador 2
		mem_instrucao[8][15:11] = 5'b00001;	//registrador 1 // destino
		mem_instrucao[8][10:6] = 5'b0;
		
		mem_instrucao[9][31:26] = 6'b000001; //add // utilizado como MOV
		mem_instrucao[9][25:21] = 5'b11010;	//registrador ZERO
		mem_instrucao[9][20:16] = 5'b00011;	//registrador 3
		mem_instrucao[9][15:11] = 5'b00010;	//registrador 2 // destino
		mem_instrucao[9][10:6] = 5'b0;
		
		mem_instrucao[10][31:26] = 6'b011001; //beq para o final do programa
		mem_instrucao[10][25:21] = 5'b11010;
		mem_instrucao[10][20:16] = 5'b11100;
		mem_instrucao[10][15:0] = 16'd1;
		
		mem_instrucao[11][31:26] = 6'b010111; // jump para laço do fatorial
		mem_instrucao[11][25:0] = 26'd6;
		
		mem_instrucao[12][31:26] = 6'b011101; //OUT
		mem_instrucao[12][25:21] = 5'b00011;	// Registrador 3
		mem_instrucao[12][20:16] = 5'b11010;	
		mem_instrucao[12][15:0] = 16'b0;
		
		mem_instrucao[13][31:26] = 6'b011100; // BREAK
		mem_instrucao[13][25:0] = 26'd0;*/
		
		// Media de dois numeros
		
		mem_instrucao[2][31:26] = 6'b011110; //IN
		mem_instrucao[2][25:0] = 26'b0;
		
		mem_instrucao[3][31:26] = 6'b000001; //add // utilizado como MOV
		mem_instrucao[3][25:21] = 5'b11010;	//registrador zero
		mem_instrucao[3][20:16] = 5'b11100;	//registrador RE
		mem_instrucao[3][15:11] = 5'b00001;	//registrador 1 // destino
		mem_instrucao[3][10:6] = 5'b0;
		
		mem_instrucao[5][31:26] = 6'b011110; //IN
		mem_instrucao[5][25:0] = 26'b0;
		
		mem_instrucao[6][31:26] = 6'b000001; //add // utilizado como MOV
		mem_instrucao[6][25:21] = 5'b11010;	//registrador zero
		mem_instrucao[6][20:16] = 5'b11100;	//registrador RE
		mem_instrucao[6][15:11] = 5'b00010;	//registrador 2 // destino
		mem_instrucao[6][10:6] = 5'b0;
		
		mem_instrucao[7][31:26] = 6'b000001; //add //
		mem_instrucao[7][25:21] = 5'b00001;	//registrador 1
		mem_instrucao[7][20:16] = 5'b00010;	//registrador 2
		mem_instrucao[7][15:11] = 5'b00001;	//registrador 1 // destino
		mem_instrucao[7][10:6] = 5'b0;
		
		mem_instrucao[8][31:26] = 6'b000010; //addi // UTILIZADO COMO LOAD IMEDIATE
		mem_instrucao[8][25:21] = 5'b11010;	//registrador zero
		mem_instrucao[8][20:16] = 5'b00010;	//registrador 2 // destino
		mem_instrucao[8][15:0] = 16'd2;
		
		mem_instrucao[9][31:26] = 6'b000111; //Testando a instrução div
		mem_instrucao[9][25:21] = 5'b00001;	//registrador 1
		mem_instrucao[9][20:16] = 5'b00010;	//registrador 2
		mem_instrucao[9][15:0] = 16'd0;
		
		mem_instrucao[10][31:26] = 6'b011101; //OUT
		mem_instrucao[10][25:21] = 5'b11101; // Registrador LO
		mem_instrucao[10][20:16] = 5'b11010;	
		mem_instrucao[10][15:0] = 16'b0;
		
		mem_instrucao[11][31:26] = 6'b011100; // BREAK
		mem_instrucao[11][25:0] = 26'd0;
		
//////////////////////////////////////////////////////////////////////////////////////////			

	 programa = 0;
	end
	end
	assign instrucao = mem_instrucao[endereco_leitura];

endmodule 
