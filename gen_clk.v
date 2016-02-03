//testbench
module gen_clk(clk,reset);
	output		clk;
	output 		reset;
	reg 		clk,reset;

	initial 
	begin
		reset = 1;
		clk = 0;
		#3 reset = 0;
		#5 reset = 1;
	end

	always
		#5 clk = ~clk;

endmodule
