module unidade_Controle(Opcode, WriteHILO, EscreveReg, OrigALU, LeMem, EscreveMem, MemparaReg,
WriteRa, BifNot, Slt, Jump, JumpR, Out, In, Break, Branch, RegDst, controleALU);

	input [5:0] Opcode;
	
	output reg WriteHILO, EscreveReg, OrigALU, LeMem, EscreveMem, MemparaReg,
	WriteRa, BifNot, Slt, Jump, JumpR, Out, In, Break, Branch;
	
	output reg [1:0] RegDst;
	
	output reg [3:0] controleALU;
	
	always @(*)
	begin
	
		WriteHILO = 0;
		EscreveReg = 0;
		OrigALU = 0;
		LeMem = 0;
		EscreveMem = 0;
		MemparaReg = 0;
		WriteRa = 0;
		BifNot = 0;
		Slt = 0;
		Jump = 0;
		JumpR = 0;
		Out = 0;
		In = 0;
		Break = 0;
		Branch = 0;
		RegDst = 2'b00;
		controleALU = 4'b0000;
					
		case(Opcode)
		
			6'b000001:
				begin
					WriteHILO = 0;
					EscreveReg = 1;
					OrigALU = 0;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;
					RegDst = 2'b01;
					controleALU = 4'b0001;
				end
			
			6'b000010 :
				begin
					RegDst = 2'b00;
					WriteHILO = 0;
					EscreveReg = 1;
					OrigALU = 1;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;
					controleALU = 4'b0001;
				end
				
				6'b000011 :
				begin
					RegDst = 2'b01;
					WriteHILO = 0;
					EscreveReg = 1;
					OrigALU = 0;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;
					controleALU = 4'b0010;
				end
		
				6'b000100 :
				begin
					RegDst = 2'b00;
					WriteHILO = 0;
					EscreveReg = 1;
					OrigALU = 1;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;
					controleALU = 4'b0010;
				end
				
				6'b000101 :
				begin
					RegDst = 2'b01;
					WriteHILO = 1;
					EscreveReg = 0;
					OrigALU = 0;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;	
					controleALU = 4'b0011;
				end
				
				6'b000111 :
				begin
					RegDst = 2'b01;
					WriteHILO = 1;
					EscreveReg = 0;
					OrigALU = 0;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;	
					controleALU = 4'b0100;
				end
				
				6'b001000 :
				begin
					RegDst = 2'b00;
					WriteHILO = 0;
					EscreveReg = 1;
					OrigALU = 1;
					LeMem = 1;
					EscreveMem = 0;
					MemparaReg = 1;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;
					controleALU = 4'b0001;	
				end
				
				6'b001001 :
				begin
					RegDst = 2'b00;
					WriteHILO = 0;
					EscreveReg = 0;
					OrigALU = 1;
					LeMem = 0;
					EscreveMem = 1;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;
					controleALU = 4'b0001;	
				end
				
				6'b001011 :
				begin
					RegDst = 2'b01;
					WriteHILO = 0;
					EscreveReg = 1;
					OrigALU = 0;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;
					controleALU = 4'b0110;	
				end
				
				6'b001100 :
				begin
					RegDst = 2'b01;
					WriteHILO = 0;
					EscreveReg = 1;
					OrigALU = 0;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;
					controleALU = 4'b0101;	
				end
				
				6'b001101 :
				begin
					RegDst = 2'b01;
					WriteHILO = 0;
					EscreveReg = 1;
					OrigALU = 0;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;
					controleALU = 4'b0111;		
				end
				
				6'b001110 :
				begin
					RegDst = 2'b00;
					WriteHILO = 0;
					EscreveReg = 1;
					OrigALU = 1;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;
					controleALU = 4'b0111;		
				end
				
				6'b001111 :
				begin
					RegDst = 2'b01;
					WriteHILO = 0;
					EscreveReg = 1;
					OrigALU = 0;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;
					controleALU = 4'b1000;		
				end
				
				6'b010000 :
				begin
					RegDst = 2'b00;
					WriteHILO = 0;
					EscreveReg = 1;
					OrigALU = 1;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;
					controleALU = 4'b1000;		
				end
				
				6'b010001 :
				begin
					RegDst = 2'b01;
					WriteHILO = 0;
					EscreveReg = 1;
					OrigALU = 0;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;
					controleALU = 4'b1001;		
				end
				
				6'b010010 :
				begin
					RegDst = 2'b00;
					WriteHILO = 0;
					EscreveReg = 1;
					OrigALU = 1;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;
					controleALU = 4'b1001;		
				end
				
				6'b010011 :
				begin
					RegDst = 2'b01;
					WriteHILO = 0;
					EscreveReg = 1;
					OrigALU = 0;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;
					controleALU = 4'b1010;		
				end
				
				6'b010100 :
				begin
					RegDst = 2'b01;
					WriteHILO = 0;
					EscreveReg = 1;
					OrigALU = 0;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 1;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;
					controleALU = 4'b0010;		
				end
				
				6'b010101 :
				begin
					RegDst = 2'b00;
					WriteHILO = 0;
					EscreveReg = 1;
					OrigALU = 1;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 1;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;
					controleALU = 4'b0010;		
				end
					
				6'b010110 :
				begin
					RegDst = 2'b01;
					WriteHILO = 0;
					EscreveReg = 1;
					OrigALU = 0;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;
					controleALU = 4'b1011;	
				end
				
				6'b010111:
				begin
					RegDst = 2'b00;
					WriteHILO = 0;
					EscreveReg = 0;
					OrigALU = 0;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 1;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;
					controleALU = 4'b0000;	
				end
				
				6'b011000:
				begin
					RegDst = 2'b00;
					WriteHILO = 0;
					EscreveReg = 0;
					OrigALU = 0;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 1;
					JumpR = 1;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;
					controleALU = 4'b0000;	
				end
				
				6'b011001:
				begin
					RegDst = 2'b00;
					WriteHILO = 0;
					EscreveReg = 0;
					OrigALU = 0;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 1;
					controleALU = 4'b0010;
				end
				
				
				6'b011010:
				begin
					RegDst = 2'b00;
					WriteHILO = 0;
					EscreveReg = 0;
					OrigALU = 0;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 1;
					Slt = 0;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;
					controleALU = 4'b0010;	
				end
				
				6'b011011:
				begin
					RegDst = 2'b10;
					WriteHILO = 0;
					EscreveReg = 1;
					OrigALU = 0;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 1;
					BifNot = 0;
					Slt = 0;
					Jump = 1;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;
					controleALU = 4'b0000;	
				end
					
				6'b011100:
				begin
					RegDst = 2'b00;
					WriteHILO = 0;
					EscreveReg = 0;
					OrigALU = 0;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 1;
					Branch = 0;
					controleALU = 4'b0000;	
				end
				
				6'b011101:
				begin
					RegDst = 2'b01;
					WriteHILO = 0;
					EscreveReg = 0;
					OrigALU = 0;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 0;
					JumpR = 0;
					Out = 1;
					In = 0;
					Break = 0;
					Branch = 0;
					controleALU = 4'b0001;	
				end
						
				6'b011110:
				begin
					RegDst = 2'b00;
					WriteHILO = 0;
					EscreveReg = 0;
					OrigALU = 0;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 1;
					Break = 0;
					Branch = 0;
					controleALU = 4'b0000;	
				end	
				
				default:
				begin
					WriteHILO = 0;
					EscreveReg = 0;
					OrigALU = 0;
					LeMem = 0;
					EscreveMem = 0;
					MemparaReg = 0;
					WriteRa = 0;
					BifNot = 0;
					Slt = 0;
					Jump = 0;
					JumpR = 0;
					Out = 0;
					In = 0;
					Break = 0;
					Branch = 0;
					controleALU = 4'b0000;
					RegDst = 2'b10;			
				end
			
				
				
					
		endcase
	
	
	end


endmodule 