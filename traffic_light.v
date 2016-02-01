//描述交通灯行为 使用了task 这只是一个行为模块，不能综合成电路网表
module traffic_lights;
	reg clock,red,green,yellow;
	parameter on = 0, off = 1, red_ticks = 350,
			  yellow_ticks = 100, green_ticks = 500;

	initial
		begin
			red = off;
			green = off;
			yellow = off;
		end

	always
		begin
			red = on;
			light(red,red_ticks);
			green = on;
			light(green,green_ticks);
			yellow = on;
			light(yellow,yellow_ticks);
		end

	task light;
		output color;
		input[31:0] tics;

		begin
			repeat(tics)
				@(posedge clock);//等待tics个时钟的上升沿
			color = off;
		end

	always
		begin 
			#100 clock = 0;
			#100 clock = 1;
		end

	endmodule