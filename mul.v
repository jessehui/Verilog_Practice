//********行为描述方法表示4位乘法器************
module mult_4(X,Y,Product);
	input[3:0] X,Y;
	output[7:0] Product;

	assgin Product = X * Y;
endmodule


//***********串行16位乘法器**************
module mult_16(clk,rst,start,done,ain,bin,cout);
	input clk;
	input rst,start;//rst复位信号 0时复位 
	//start使能信号 1表示开始并将乘积结果寄存器清零
	input[15:0] ain,bin;
	output[31:0] cout;
	output done;

	reg[15:0] areg;//乘数a寄存器
	reg[15:0] breg;//乘数b寄存器
	reg[31:0] cout_r;//乘积结果寄存器
	reg done_r;
	reg[4:0] i;//移位次数寄存器 可能用到0-17所以要5位

	//移位次数控制
	always @ (posedge clk | negedge rst)
		if(!rst)
		i <= 5'd0;//'复位
		else if(start && i<5'd17)
		i <= i + 1;//开始工作
		else if(!start)
		i <= 5'd0;//'

	//乘法运算完成标志
	assign done_r = done;

	always @ (posedge clk | negedge rst)
		if(!rst) done_r <= 1'b0;
		else if(i == 5'd16) done_r <= 1'b1;//乘法运算完成标志
		else if(i == 5'd17) done_r <= 1'b0;//标志位归零

	//累加移位计算
	always @ (posedge clk | negedge rst)
		begin
			if(!rst)
				begin
					areg <= 4'h0000;
					breg <= 4'h0000;
					cout_r <= 8'h0000_0000;
				end
			else if(start)//启动运算
				begin
					if(i == 5'd0)
						begin
							areg <= ain;
							breg <= bin;//锁存两个乘数
						end
					else if(i > 5'd0 && i < 5'd16)
						begin
							if(areg[i-1])// == 1
								cout_r = {1‘b0, cout[30:15]+breg, cout_r[14:1]};//累加不移位
							else
								cout_r <= cout_r >> 1;//移位不累加
						end
					else if(i == 5'd16 && areg[15])
						cout_r[31:16] <= cout_r[31:16] + breg;

						end
				end
		end

	assign cout = cout_r;
	endmodule




