module entrada (switches_fpga, In, saida_RE);

input [9:0] switches_fpga;
input In;

output reg [31:0] saida_RE;

always @(*)
begin
saida_RE = 32'b0;
if(In) saida_RE = switches_fpga;
end

endmodule 