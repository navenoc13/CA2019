//Subject:     CO project 2 - ALU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      Naveno
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module ALU(
    src1_i,
	src2_i,
	ctrl_i,
	result_o,
	zero_o
	);
     
//I/O ports
input signed [64-1:0]  src1_i;
input signed [64-1:0]  src2_i;
input  [4-1:0]   ctrl_i;

output signed [64-1:0]	 result_o;
output           zero_o;

//Internal signals
reg  signed  [64-1:0]  result_o;
wire             zero_o;	

//Main function
assign zero_o = (result_o == 0); //if result_o == 0

always @(ctrl_i, src1_i, src2_i) begin
  case (ctrl_i)
    4'b0000: 
    begin
        result_o <= src1_i & src2_i;
    end
    4'b0001  : 
    begin
        result_o <= src1_i | src2_i;
    end
    4'b0010 : 
    begin
    result_o <= src1_i + src2_i;
    end
    4'b0110 : 
    begin
        result_o <= src1_i - src2_i;
    end
    4'b1100 : 
    begin
        result_o <= ~(src1_i & src2_i);
    end
    4'b0111 : 
    begin
        result_o <= (src1_i < src2_i) ? 1 : 0;
    end
    default : result_o <= 0;
  endcase
end


endmodule





                    
                    