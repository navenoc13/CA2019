//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
module Simple_Single_CPU(
        clk_i,
		nrst_i
		);
		
//I/O port
input			clk_i;
input			nrst_i;  // negative reset

//Internal Signles
wire [32-1:0]		ins;
wire [32-1:0]		pc_o;
wire [32-1:0]		mux_pc_scr_o;
wire [64-1:0]		mux_write_back_o;
wire				branch, MemRead, MemWrite, MemToReg, RegWrite;
wire [2-1:0]		ALU_op;
wire				ALU_src;
wire [4-1:0]		ac_o;
wire [64-1:0]		ins_ex;
wire				zero;
wire [64-1:0]		rslt;
wire [64-1:0]		rsdata_o, rtdata_o;
wire [64-1:0]		mux_alu_scr_o;
wire [64-1:0]		data_mem_o;
wire [64-1:0]		shifter_o;
wire [32-1:0]		adder1_o, adder2_o;

// decoder

//Greate componentes
ProgramCounter PC(
        .clk_i(clk_i),      
	    .nrst_i (nrst_i),     
	    .pc_in_i(mux_pc_scr_o) ,   
	    .pc_out_o(pc_o) 
	    );

// adder for program counter
Adder Adder1(
        .src1_i(pc_o),     
	    .src2_i(4),     
	    .sum_o(adder1_o)    
	    );
	
Instr_Memory IM(
        .pc_addr_i(pc_o),  
	    .instr_o(ins)    
	    );
		
Reg_File Registers(
        .clk_i(clk_i),      
	    .nrst_i(nrst_i),     
        .RSaddr_i(ins[19:15]),  
        .RTaddr_i(ins[24:20]),  
        .RDaddr_i(ins[11:7]),  
        .RDdata_i(mux_write_back_o), 
        .RegWrite_i(RegWrite),
        .RSdata_o(rsdata_o),  
        .RTdata_o(rtdata_o)   
        );
	
Decoder Decoder(
        .instr_op_i(ins[6:0]), 
	    .RegWrite_o(RegWrite), 
	    .ALU_op_o(ALU_op),   
	    .ALUSrc_o(ALU_src),      
		.Branch_o(branch),
		.MemRead_o(MemRead),
		.MemWrite_o(MemWrite),
		.MemtoReg_o(MemToReg)
	    );

ALU_Ctrl AC(
        .funct3_i(ins[14:12]),
		.funct7_i(ins[31:25]),		
        .ALUOp_i(ALU_op),   
        .ALUCtrl_o(ac_o) 
        );
	
Imm_Gen IG(
    .instr_i(ins),
    .signed_extend_o(ins_ex)
    );

MUX_2to1 #(.size(64)) Mux_ALUSrc(
        .data0_i(rtdata_o),
        .data1_i(ins_ex),
        .select_i(ALU_src),
        .data_o(mux_alu_scr_o)
        );	
		
ALU ALU(
        .src1_i(rsdata_o),
	    .src2_i(mux_alu_scr_o),
	    .ctrl_i(ac_o),
	    .result_o(rslt),
		.zero_o(zero)
	    );
	
Data_Memory Data_Memory(
	.clk_i(clk_i),
	.addr_i(rslt),
	.data_i(rtdata_o),
	.MemRead_i(MemRead),
	.MemWrite_i(MemWrite),
	.data_o(data_mem_o)
	);
	
Adder Adder2(
        .src1_i(pc_o),     
	    .src2_i(shifter_o),     
	    .sum_o(adder2_o)      
	    );
		
Shift_Left_One_64 Shifter(
        .data_i(ins_ex),
        .data_o(shifter_o)
        ); 		

		
MUX_2to1 #(.size(32)) Mux_PC_Source(
        .data0_i(adder1_o),
        .data1_i(adder2_o),
        .select_i(branch & zero),
        .data_o(mux_pc_scr_o)
        );	

MUX_2to1 #(.size(64)) Mux_Write_Back(
        .data0_i(rslt),
        .data1_i(data_mem_o),
        .select_i(MemToReg),
        .data_o(mux_write_back_o)
        );	

endmodule
		  


