//*********hardreg.v测试文件*********
`include 'flop.v'
`include 'hardreg.v'

module hardreg_top; //顶层模块 没有输入和输出
	reg clock,clearb;
	reg[3:0] data;
	reg[3:0] qout;

	`define 	stim 	#100 data = 4'b //'宏定义 后边再次使用可以直接跟4位2进制数
	event end_first_pass;// event变量可以用来触发事件
		hardreg 	reg_4bit(.d(data),.clk(clock),.clrb(clearb),.q(qout));

		initial
		begin
			clock = 0;
			clearb = 1;
		end

		always 
		#50 clock = ~clock;

		always @ (end_first_pass)
			clearb = ~clearb;
		
		always @ (posedge)
		$display ("at time %d, clearb = %b, data = %d, qout = %d ",$time,clearb,data,qout);
		//打印不同时刻的信号值

		initial
		begin
			repeat(4);
			begin
					data = 4'b0000;
					`stim 0001;
					`stim 0010;
					`stim 0011;
					`stim 0100;
					`stim 0101;
					`stim 0110;
					`stim 0111;
					`stim 1000;
					`stim 1001;
					`stim 1010;
					`stim 1011;
					`stim 1100;
					`stim 1101;
					`stim 1110;
					`stim 1111;

					#200 -> end_first_pass; //触发事件end_first_pass

			end
			$finish
		end
endmodule




