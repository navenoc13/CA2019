`timescale 1ns/1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:47:13 13/12/2019
// Design Name: 
// Module Name:    alu_top 
// Project Name:   ALU 32-BIT 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module alu_top(
               src1,       //1 bit source 1 (input)
               src2,       //1 bit source 2 (input)
               less,       //1 bit less     (input)
               A_invert,   //1 bit A_invert (input)
               B_invert,   //1 bit B_invert (input)
               cin,        //1 bit carry in (input)
               operation,  //operation      (input)
               result,     //1 bit result   (output)
               cout       //1 bit carry out(output)
               );

input         src1;
input         src2;
input         less;
input         A_invert;
input         B_invert;
input         cin;
input [2-1:0] operation;

output        result;
output        cout;

reg           result, cout;
reg	      a_in, b_in;
reg done;

always@(*)begin

done =0 ;

if(done == 0)begin
	a_in = src1 ^ A_invert;
	b_in = src2 ^ B_invert;
	
	case(operation)
		2'b00:	begin		// AND operstion
				result = a_in & b_in;
				cout = 0;
			end
			
		2'b01:	begin		//Or
				result = a_in | b_in;
				cout = 0;
			end
		
		2'b10:	begin		//Add operation
				result = a_in ^ b_in ^ cin;
				cout = (a_in&b_in) + (a_in&cin) + (b_in&cin); 
			end
	endcase
	
	done = 1;
	
end
else begin
		result = result;
		cout = cout;
end
	
end

endmodule