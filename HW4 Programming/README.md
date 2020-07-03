# Homework 4: Single Cycle CPU

## Goal
Utilizing the ALU in hw3 to implement a 32-bit single cycle CPU supporting RV64I. The CPU reads 32-bit instructions and operates on 64-bit registers and data memory. 

## Requirements
  - Please use Modelsim or Xinlinx as your HDL simulator. 
  - Extend your ALU in hw3 to 64-bit to support 64-bit registers in RV64I. 
  - Cout and Overflow ports of ALU wouldn’t be used in this assignment. 
  - ProgramCounter, InstructionMemory, DataMemory, RegisterFile, Adder and testbench are supplied. 
  - Instruction set: the following instructions need to be supported by your CPU 
      R-type: add, sub, and, or, slt (50%) 
      I-type: addi, slti, ld         (30%) 
      S-type: sd                     (10%) 
      B-type: beq                    (10%) 
	    J-type: jal 	 	               (20%) (bonus) 
  - All x1 - x31 registers are assumed to be general-purpose registers. (The register x0 is hardwired to the constant 0) 
  - Your CPU should read machine code rather than assembly code. 
  - We provide two testcases for testing. If you want to change the testcase, please modify the 38-th line of InstructionMemory.v
  
		$readmemb("test/test1.txt", Instr_Mem); //Read instruction from "test1.txt"
      - beq rs1, rs2, offset if rs1 == rs2, then PC = PC + (signed_extend(offset) << 1) 
      - jal rd, offset 
        PC = PC + (signed_extend(offset) << 1), rd = PC + 4 
        
 ## Architecture Diagram
   Please refer to hw4.pdf
   The components for J-type instructions are not included in this diagram. You need to design by yourself. 
   
## Grade
  a. Total: 100 points + 20 bonus (plagiarism will get 0 point) 
  b. No late submission
  
## Hand in
  - These files don’t need to submit 
    -	Data_Memory.v 
    -	Instr_Memory.v 
    -	Reg_File.v 
    -	ProgramCounter.v 
    -	testbench.v 
    -	Adder.v 
    -	test directory, testcast1.txt, testcase2.txt 
  - Please zip the archive, name it as "ID.zip" and upload the assignment to ceiba 

## Q&A 
For any questions regarding hw4, please contact 范航熏 (rr1155001100@gmail.com) 

