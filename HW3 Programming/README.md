# Homework 3: 32-bit ALU

## Goal
The goal of this LAB is to implement a 32-bit ALU (Arithmetic Logic Unit). ALU is the basic computing component of a CPU. Its operations include AND, OR, addition, subtraction, etc. This homework will help you understand the CPU architecture.  The function of testbench is to read input data automatically and output erroneous data.

## HW Requirement
  a.	Please use Xilinx ISE or ModelSim as your HDL simulator. (ModelSim is preferred, we will test your result 
      on ModelSim) 
  b.	Please zip the archive (not including testcase and testbench.v) and name it as "ID.zip" (e.g., R08922XXX.zip). 
  c.	Plagiarism will get 0 point 
  d.	The names of top module and IO ports must be named as follows: 

    Top module: alu.v  
    
    module alu(  
              rst_n, 	// negative reset (input) 
              src1, 	// 32 bits source 1 (input) 
              src2, 	// 32 bits source2 (input) 
              ALU_control, 	// 4 bits ALU control input (input) 
              result, 	// 32 bits result(output) 
              zero, 	// 1 bit when the output is 0, zero must be set (output) 
              cout, 	// 1 bit carry out (output) 
              overflow 	// 1 bit overflow(output)
            ); 
 
    ALU starts to work when the signal rst_n is 1, and then catches the data from src1 and src2. 
    In order to have a good coding style, please obey the rules below: . One module in one file.  . Module name and file name must be the same. 
 
    For example: The file "alu.v" only contains the module "alu". 

  e.	instruction set: basic operation instruction (60%) 
 
   | ALU action   |     Name         | ALU control input |
   |    :---:     |     :---:        |     :---:         |
   | And          | And              | 0000              |
   | Or           | Or               | 0001              |
   | Add          | Addition         | 0010              |
   | Sub          | Subtract         | 0110              |
   | Nor          | Nor              | 1100              |
   | Slt          | Set less than    | 0111              |

   - zcv three control signal : zero、carry out、overflow (40%) zero must be set when the result is 0.
   - cout must be set when carry out. 
   - overflow must be set when overflow. 

