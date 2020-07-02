//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Imm_Gen(
    instr_i,
    signed_extend_o
    );
               
//I/O ports
input   [32-1:0] instr_i;
output  [64-1:0] signed_extend_o;

//Internal Signals
reg     [64-1:0] signed_extend_o;

//Sign extended
always@(*)
begin
	if (instr_i[6:0] == 7'b0100011)
		begin
			signed_extend_o <= {{52{instr_i[31]}}, {instr_i[31:25]}, {instr_i[11:7]}};
		end

	else if(instr_i[6:0] == 7'b0010011)	 
		begin
			signed_extend_o <= {{52{instr_i[31]}}, {instr_i[31:20]}};
		end
end
          
endmodule      
     