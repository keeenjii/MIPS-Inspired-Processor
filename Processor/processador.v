module processador (Reset, readClk, Chaves, switch, display1, display2, display3, display4, display5, display6, display7, display8, saida_Display, 
saidaPC, dadomem, Resultado_ULA);

	input Reset, readClk, switch;
	input [9:0] Chaves;
	output wire [31:0] saida_Display, saidaPC, dadomem; ////
	output wire [6:0] display1, display2, display3, display4, display5, display6, display7, display8;
	
	//SINAIS DE CONTROLE////////////////////////////////////////////////////////
	wire WriteHILOwire, EscreveRegwire, OrigALUwire,
	LeMemwire, EscreveMemwire, MemparaRegwire, WriteRawire, BifNotwire, Sltwire,
	Jumpwire, JumpRwire, Outwire, Inwire, Breakwire, Branchwire;
	
	wire [1:0] RegDstwire;
	
	wire[3:0] controleALU;
	
	//////////////////////////////////////////////////////////////////////////
	
	output wire [63:0] Resultado_ULA;
	
	wire [31:0] Saida_addPC, saida_moduloEntrada, saida_leitura2, saida_leitura1,
	saida_Concatenador, saida_AddB, saida_MemData, saida_Muxg, saida_Muxf,
	Instrucao, saida_Extensor, saida_Muxe, saida_Muxk, saida_Muxd;
	
	wire [4:0] saida_Muxc;
	
	wire [25:0] saida_Muxa;
	
	wire [4:0] saida_Muxb;
	
	wire [3:0] display1b, display2b, display3b, display4b, display5b, display6b, display7b, display8b;
	
	wire slt_ula, zero_ula, saida_branch_logic, switchIO, clk_dividido;
	
	freqDiv4 divisorClk(
			.clk_in(readClk),
			.clk_out(clk_dividido)
	
	);
	
	unidade_Controle UndControle(
			.Opcode(Instrucao[31:26]),
			.WriteHILO(WriteHILOwire),
			.EscreveReg(EscreveRegwire),
			.OrigALU(OrigALUwire),
			.LeMem(LeMemwire),
			.EscreveMem(EscreveMemwire),
			.MemparaReg(MemparaRegwire),
			.WriteRa(WriteRawire),
			.BifNot(BifNotwire),
			.Slt(Sltwire),
			.Jump(Jumpwire),
			.JumpR(JumpRwire),
			.Out(Outwire),
			.In(Inwire),
			.Break(Breakwire),
			.Branch(Branchwire),
			.RegDst(RegDstwire),
			.controleALU(controleALU)
			
	);
	
	Program_counter pc(
			.breakk(Breakwire),
			.entrada_PC(saida_Muxg),
			.saida_PC(saidaPC),
			.clk(clk_dividido),
			.reset(Reset),
			.in(Inwire),
			.out(Outwire),
			.switchIO(switchIO)
	);
	
	filtroSwitchIO filtro(
		.clk(clk_dividido),
		.switch(switch),
		.saida(switchIO)
	);
	
	mem_Instrucao mInst(
		.endereco_leitura(saidaPC),
		.clk(clk_dividido),
		.instrucao(Instrucao)
	
	);
	
	Add_PC addPC (
		.entrada_PC(saidaPC),
		.saida_addPC(Saida_addPC)
	
	);
	
	muxa MuxA(
		.Instrucao0_25(Instrucao[25:0]),
		.Dados_leitura1(saida_leitura1),
		.JumpR(JumpRwire),
		.saida_muxa(saida_Muxa)
		
	);
	
	muxb MuxB(
		.Instrucao21_25(Instrucao[25:21]),
		.JumpR(JumpRwire),
		.saida_muxb(saida_Muxb)
	
	);

	muxc MuxC (
		.Instrucao16_20(Instrucao[20:16]),
		.Instrucao11_15(Instrucao[15:11]),
		.RegDst(RegDstwire),
		.saida_muxc(saida_Muxc)
	
	);
	
	muxd MuxD(
		.PC(saidaPC),
		.Dados_escrita(saida_Muxk),
		.WriteRa(WriteRawire),
		.saida_muxd(saida_Muxd)
		
	);
	
	banco_Registradores bancoR(
		.Reg_leitura1(saida_Muxb),
		.Reg_leitura2(Instrucao[20:16]),
		.Reg_escrita(saida_Muxc),
		.Dados_entrada(saida_moduloEntrada),
		.Dados_escrita(saida_Muxd),
		.Dados_leitura1(saida_leitura1),
		.Dados_leitura2(saida_leitura2),
		.RS(saida_Display),
		.EscreveReg(EscreveRegwire), // EscreveRegwire
		.WriteHILO(WriteHILOwire),
		.In(Inwire),
		.ResultadoHILO(Resultado_ULA),
		.clk(clk_dividido),
		.Out(Outwire)
		
	);
	
	binParaBCD decod(
		.bin(saida_Display[25:0]),
		.dezmilhao(display8b),
		.milhao(display7b),
		.cemmil(display6b),
		.dezmil(display5b),
		.mil(display4b),
		.cem(display3b),
		.dez(display2b),
		.um(display1b)
	);
	
	decodificadorDisplay decodSaida8(
		.A(display8b[3]),
		.B(display8b[2]),
		.C(display8b[1]),
		.D(display8b[0]),
		.a(display8[6]),
		.b(display8[5]),
		.c(display8[4]),
		.d(display8[3]),
		.e(display8[2]),
		.f(display8[1]),
		.g(display8[0])
	);
	
	decodificadorDisplay decodSaida7(
		.A(display7b[3]),
		.B(display7b[2]),
		.C(display7b[1]),
		.D(display7b[0]),
		.a(display7[6]),
		.b(display7[5]),
		.c(display7[4]),
		.d(display7[3]),
		.e(display7[2]),
		.f(display7[1]),
		.g(display7[0])
	);
	
	decodificadorDisplay decodSaida6(
		.A(display6b[3]),
		.B(display6b[2]),
		.C(display6b[1]),
		.D(display6b[0]),
		.a(display6[6]),
		.b(display6[5]),
		.c(display6[4]),
		.d(display6[3]),
		.e(display6[2]),
		.f(display6[1]),
		.g(display6[0])
	);
	
	decodificadorDisplay decodSaida5(
		.A(display5b[3]),
		.B(display5b[2]),
		.C(display5b[1]),
		.D(display5b[0]),
		.a(display5[6]),
		.b(display5[5]),
		.c(display5[4]),
		.d(display5[3]),
		.e(display5[2]),
		.f(display5[1]),
		.g(display5[0])
	);
	
	decodificadorDisplay decodSaida4(
		.A(display4b[3]),
		.B(display4b[2]),
		.C(display4b[1]),
		.D(display4b[0]),
		.a(display4[6]),
		.b(display4[5]),
		.c(display4[4]),
		.d(display4[3]),
		.e(display4[2]),
		.f(display4[1]),
		.g(display4[0])
	);
	
	decodificadorDisplay decodSaida3(
		.A(display3b[3]),
		.B(display3b[2]),
		.C(display3b[1]),
		.D(display3b[0]),
		.a(display3[6]),
		.b(display3[5]),
		.c(display3[4]),
		.d(display3[3]),
		.e(display3[2]),
		.f(display3[1]),
		.g(display3[0])
	);
	
	decodificadorDisplay decodSaida2(
		.A(display2b[3]),
		.B(display2b[2]),
		.C(display2b[1]),
		.D(display2b[0]),
		.a(display2[6]),
		.b(display2[5]),
		.c(display2[4]),
		.d(display2[3]),
		.e(display2[2]),
		.f(display2[1]),
		.g(display2[0])
	);
	
	decodificadorDisplay decodSaida1(
		.A(display1b[3]),
		.B(display1b[2]),
		.C(display1b[1]),
		.D(display1b[0]),
		.a(display1[6]),
		.b(display1[5]),
		.c(display1[4]),
		.d(display1[3]),
		.e(display1[2]),
		.f(display1[1]),
		.g(display1[0])
	);
	
	entrada Entrada (
		.switches_fpga(Chaves),
		.In(Inwire),
		.saida_RE(saida_moduloEntrada)
	
	);
	
	extensor_sinal Extensor(
		.sin_entrada(Instrucao[15:0]),
		.sin_saida(saida_Extensor)
	
	);
	
	concatenador Concat(
		.entrada_AddPC(Saida_addPC),
		.entrada_jump(saida_Muxa),
		.saida_endJump(saida_Concatenador)
	
	);
	
	muxe Muxe ( 
		.OrigALU(OrigALUwire),
		.Dados_leitura2(saida_leitura2),
		.imediato(saida_Extensor),
		.saida_muxe(saida_Muxe)
	
	);
	
	ALU Alu ( 
		.Resultado(Resultado_ULA),
		.slt(slt_ula),
		.zero(zero_ula),
		.codigo_entrada(controleALU),
		.operador1(saida_leitura1),
		.operador2(saida_Muxe),
		.shift(Instrucao[10:6])
	
	);
	
	Add_B Add_b(
		.entrada_AddPC(Saida_addPC),
		.entrada_Imediato(saida_Extensor),
		.saida_addB(saida_AddB)
	);
	
	mem_Dados memData (
		.Dados_escrita(saida_leitura2),
		.endereco(Resultado_ULA[31:0]),
		.EscreveMem(EscreveMemwire),
		.LeMem(LeMemwire),
		.read_clock(readClk),
		.write_clock(clk_dividido),
		.Dados_leitura(saida_MemData),
		.dadosmem(dadomem)
	);
	
	muxk Muxk(
		.Dados_leitura(saida_MemData),
		.Slt_resultado(slt_ula),
		.Resultado_ula(Resultado_ULA[31:0]),
		.Slt(Sltwire),
		.MemparaReg(MemparaRegwire),
		.saida_muxk(saida_Muxk)
		
	);
	
	branch_logic Branch(
		.Zero_ula(zero_ula),
		.BifNot(BifNotwire),
		.Branch(Branchwire),
		.saida_para_muxf(saida_branch_logic)
	
	);
	
	muxf Muxf(
		.entradaOR(saida_branch_logic),
		.PCplus4(Saida_addPC),
		.PCplusBranch(saida_AddB),
		.saida_muxf(saida_Muxf)
		
	);
	
	muxg Muxg(
		.entrada_muxf(saida_Muxf),
		.entrada_jump(saida_Concatenador),
		.Jump(Jumpwire),
		.saida_muxg(saida_Muxg)
		
	);
	
	
	
endmodule 