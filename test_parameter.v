module Decoder(A,F);
	parameter Width = 1, Polarity = 1;
	...
	...
endmodule

module Top;
	wire[3:0] A4;
	wire[4:0] A5;
	wire[15:0] F16;
	wire[31:0] F32;
	Decoder  #(4,0) D1(A4,F16);//实例D1引用的是参数为Width为4,
	//polarity为0的Decoder模块
	Decoder  #(5) D2(A5,F16);//实例D2实际引用的是参数Width为5,
	//polarity仍为1的Decoder模块
endmodule

parameter	wordsize = 16;
			memsize = 256;
reg [wordsize-1:0] mem[memsize-1:0],writereg,readreg;//同时定义存储器类型数据和reg型数据