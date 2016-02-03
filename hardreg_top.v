//*********hardreg.v测试文件*********
`include 'flop.v'
`include 'hardreg.v'

module hardreg_top; //顶层模块 没有输入和输出
	reg clock,clearb;
	reg[3:0] data;
	reg[3:0] qout;

	`define 	stim 	#100 data = 4'b0
	event end_first_pass;//定义事件

