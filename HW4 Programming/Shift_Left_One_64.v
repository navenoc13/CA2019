//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Shift_Left_One_64(
    data_i,
    data_o
    );

//I/O ports                    
input [64-1:0] data_i;
output [64-1:0] data_o;

reg [64-1:0] data_o;

always@(*)
begin
	//shift left data_input by 1 and assign it to data_o
	assign data_o = data_i << 1;
end

endmodule
