include "muxtwo.v"
	module t;
	reg ain,bin,select;
	reg clock;
	wire outw;

	initial //寄存器变量初始化为确定值
	begin 
	ain = 0;
	bin = 0;
	select = 0;
	clock = 0;
	end

	always #50 clock = ~clock;
	//产生一个不断重复周期为100的时钟信号clock

	always @(posedge clock)
		begin
		#1ain = {%random} %2;
		#3bin = {%random} %2;
	end

	always #10000 select =! select;//产生选通信号
		muxtwo m (.out(outw),.a(ain),.b(bin),.sl(select));
		//.表示端口后边紧跟端口名，其名称需与muxtwo中定义的一样
		//括号内的信号名为与该端口连接的信号线名 但必须在t中定义

	endmodule