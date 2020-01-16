module filtroSwitchIO (clk, switch, saida);
	
	input clk, switch;
	output reg saida;
	
	reg [1:0] controle;
	
	always @( posedge clk )
	begin
		
		if(switch == 1'd1 && (controle == 2'd0 || controle == 2'd1)) 
		begin 
			
			saida <= 1'd1;	
			controle <= controle + 2'd1;
			
		end
		
		else if (switch == 1'd1 && controle == 2'd2) 
		begin 
			saida <= 1'd0;	
		end
		
		else
		begin
			saida <= 1'd0;
			controle<=1'd0;
		end
		
	end


endmodule 