module muxtwo(out,a,b,sl);
	input a,b,sl;
	output out;
	reg out;
		always @ (sl or a or b)
			if(! sl) out = a;
			else out = b;

endmodule
//逻辑行为描述
//二选一多路器 输出out与a还是b一致 取决于sl

module muxtwo(out,a,b,sl);
	input a,b,sl;
	output out;
	reg out;
	wire nsl,sela,selb;
		assign nsl = ~sl;//sl取反
		assign sela = a&nsl;
		assign selb = b&sl;
		assign out = sela|selb;

endmodule
//逻辑表达式来描述

module muxtwo(out,a,b,sl);
	input a,b,sl;
	output out;
		not    u1(nsl,sl);
		and #1 u2(sela,a,nsl);
		and #1 u3(selb,b,sl);
		or  #2 u4(out,sela,selb);
endmodule

