//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      Naveno
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module ALU_Ctrl(
          funct3_i,
		  funct7_i,
          ALUOp_i,
          ALUCtrl_o
          );
          
//I/O ports 
input      [3-1:0] funct3_i;
input      [7-1:0] funct7_i;
input      [2-1:0] ALUOp_i;

output     [4-1:0] ALUCtrl_o;    
     
//Internal Signals
reg        [4-1:0] ALUCtrl_o;

//Parameter

//Select exact operation
always@(*) 
begin
	case(ALUOp_i)
		2'b10: 
		begin
			case(funct3_i)
				3'b000: 
				begin
					case(funct7_i)
						7'b0000000: 
						begin
							assign ALUCtrl_o = 4'b0010;
						end
						7'b0100000: 
						begin
							assign ALUCtrl_o = 4'b0110;
						end
					endcase
				end
				3'b110: 
				begin
					assign ALUCtrl_o = 4'b0001;
				end
				3'b111: 
				begin
					assign ALUCtrl_o = 4'b0000;
				end
			endcase
		end
		
		2'b00: 
		begin
			case(funct3_i)
				3'b000: 
				begin
					assign ALUCtrl_o = 4'b0010;
				end
				
				3'b010: 
				begin
					assign ALUCtrl_o = 4'b0111;
				end
				
				3'b011: 
				begin
					assign ALUCtrl_o = 4'b0010;
				end
			endcase
		end
		
		2'b01: 
		begin
			assign ALUCtrl_o = 4'b0110;
		end

	endcase
end

endmodule     





                    
                    