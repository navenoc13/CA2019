//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      Naveno
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Decoder(
    instr_op_i,
	RegWrite_o,
	ALU_op_o,
	ALUSrc_o,
	Branch_o,
	MemRead_o,
	MemWrite_o,
	MemtoReg_o
	);
     
//I/O ports
input	[7-1:0]	instr_op_i;

output			RegWrite_o;
output	[2-1:0]	ALU_op_o;
output			ALUSrc_o;
output			Branch_o;
output			MemRead_o;
output			MemWrite_o;
output			MemtoReg_o;
 
//Internal Signals
reg	[2-1:0]		ALU_op_o;
reg				ALUSrc_o;
reg				RegWrite_o;
reg				Branch_o;
reg				MemRead_o;
reg				MemWrite_o;
reg				MemtoReg_o;

//Parameter

//Main function
always@(*) 
begin
	case(instr_op_i)
		//For LD
		7'b0000011: 
		begin 
			assign ALU_op_o = 2'b00;
			assign ALUSrc_o = 1'b1;
			assign RegWrite_o = 1'b1;
			assign Branch_o = 1'b0;
			assign MemRead_o = 1'b1;
			assign MemWrite_o = 1'b0;
			assign MemtoReg_o = 1'b1;
		end 
		//For Addi, slti
		7'b0010011: 
		begin
			assign ALU_op_o = 2'b00;
			assign ALUSrc_o = 1'b1;
			assign RegWrite_o = 1'b1;
			assign Branch_o = 1'b0;
			assign MemRead_o = 1'b0;
			assign MemWrite_o = 1'b0;
			assign MemtoReg_o = 1'b0;
		end
		//For SD
 		7'b0100011: 
 		begin 
 			assign ALU_op_o = 2'b00;
			assign ALUSrc_o = 1'b1;
			assign RegWrite_o = 1'b0;
			assign Branch_o = 1'b0;
			assign MemRead_o = 1'b0;
			assign MemWrite_o = 1'b1;
			assign MemtoReg_o = 1'bX;
 		end
		//R-type Instructions
		7'b0110011: 
		begin
			assign ALU_op_o = 2'b10;
			assign ALUSrc_o = 1'b0;
			assign RegWrite_o = 1'b1;
			assign Branch_o = 1'b0;
			assign MemRead_o = 1'b0;
			assign MemWrite_o = 1'b0;
			assign MemtoReg_o = 1'b0;
		end
 		//For Beq
 		7'b1100011: 
 		begin 
 			assign ALU_op_o = 2'b01;
			assign ALUSrc_o = 1'b0;
			assign RegWrite_o = 1'b0;
			assign Branch_o = 1'b1;
			assign MemRead_o = 1'b0;
			assign MemWrite_o = 1'b0;
			assign MemtoReg_o = 1'bX;
 		end
	endcase
end
endmodule





                    
                    