##Problem
Use the divide-and-conquer (D&C) approach to design a combinational multi-bit left-shifting circuit with inputs that are an n-bit number X (the shiftee) and a log2 n bit # m (the shift amount), and which outputs a (2n − 1)-bit number Z that is X shifted m times. E.g., if X = 11000111, and m = 110 = 6, then X needs to be shifted by 6 bits and Z = 011000111000000. Such a shifter is called an (n, log2 n), shifter—an (n, k) shifter shifts n bits of some input X by the shift value encoded in k bits. As part of your design derivation, you need to clearly show the following aspects of your D&C approach.

 (a)

  The breakup of the root problem (i.e., the first level breakup) for an n-bit X into two or more subproblems, including a clear description of what those subproblems are. 

 
(b)


 • If there is a stitch-up function for this problem derive the design. If the stitch-up function is a well-known or at least well-defined mathematical or logical function that you can describe mathematically and/or logically, then you need not derive the truth table (TT) or exact logic expressions and gate-level implementation of this function. Otherwise, you can just give the TT or logic expressions of the function. Note also, that in the former case, the stitch-up function can either be one well-defined function or a composition of two or more welldefined functions. 

 
• If there is subproblem dependency for your breakup, specify what it is, and if so, discuss if it makes sense to use the Wait or the DAC strategy to resolve the dependency, and do accordingly in your design. 


(c)

 The leaf function, which is the function that is needed at the bottom of the D&C tree. Again, the leaf function should be described in a similar way as specified for the stitch-up function. Note that the level of the D&C tree at which the leaf function’s realization is appropriate is dependent on the design problem, and can typically range from a problem of size 1 to 4 bits. In this case, you need to judiciously determine this level so that it makes sense for the current problem. 

 
(d)

 The schematic of the final design for an (8, 3) shifter, clearly identifying whichever of the following are there in your design: the leaf function, the stitch-up functions, the subproblem dependencies. The structure of the circuit should be complete and clearly understandable.

 
(e)

 Determine the delay of this circuit as a function of n, assuming that the delay of some welldefined basic function(s)/block(s) with a small constant number of inputs (i.e., whose number of inputs is not a function of n) that you use is 1 unit. Identify all your basic blocks. Show the critical path of your design for the schematic for the (8, 3) shifter 

 
(f)

 Analyze the hardware cost of your designs in terms of the number of the aforementioned welldefined basic function blocks (each with a constant number of inputs), i.e., assuming the cost of each such basic block is 1 unit. 




##Solution
(a)
Break the problem into  levels. We already know that for an n bit operand, the output is (2n-1) bits. So let’s assume the original input is a (2n-1) bit operand, 0 bit to n-1 bit is the operand itself and n bit to (2n-1) bit are 0s. For the 1st level, we can use (2n-1) MUX to select whether to left-shift for 20 = 1 bit or 0 (e.g. If m0 = 1, MUX will choose 0, D10, D11, D12…. ). For the 2nd level, we get (2n-1) outputs from 1st level. And since 21 = 2, we need to duplicate all the output of 1st level and left-shift for 2 bits as other inputs for the 2nd level. For the 3rd level, we also get (2n-1) outputs from 2nd level. 22 = 4, we duplicate all the output of 2nd level and left-shift for 4 bits as other inputs for 3rd level. And etc. 

(b)
As we break the problem in levels, the output of the final level will be the result. So there is no stitch-up function.
As we break the problem in levels, for a latter level, it will use the output of the former level. So there will be delay between each levels. We can use DAC strategy but the possibility of each bit to shift or not is equal, so I think we can just use the Wait strategy.

(c)
Leaf function: There will be (2n-1) MUX in the 1st level, and there are 2*(2n-1) inputs. For the upper pins which will be selected if m0 = 0, the inputs will be X0, X1, … Xn-1, 0,0,0, …,0 (there are
 (n-1) 0s.) in sequence. And the lower pins which will selected if m0 = 1, the inputs will be 0, X0, X1, … Xn-1, 0,0,0, …,0 (there are (n-2) 0s) in sequence. 

(d)
Image:

![](https://github.com/jessehui/Verilog_Practice/blob/master/Digital_Logic_Design/shifter.png)

> 8-3 shifter

(e)
Each MUX is a basic block. Each block has 2 inputs. Since we define basic block with a small constant number of inputs is 1 unit, there are  levels of block. For each level, the delay is the same. Thus for an n-bit left shifter, the delay of the circuit will be  units. Critical path is shown in the schematic. 

(f)
Each MUX is a basic block. Each block has 2 inputs. Since we define basic block with a small constant number of inputs is 1 unit, there are  levels of block. For each level, we need (2n-1) block. Thus the hardware cost will be  units.



