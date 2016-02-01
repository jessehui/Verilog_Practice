module tristate_gate (out,in,enable);
	input in,enable;
	output out;
		bufif1 mybuf(out,in,enable);
endmodule

//bufif1 是verilog语言提供的原语库中（primitive library）现存的三态驱动器元件，把它命名为mybuf

module tristate_gate2 (sout,sin,ena);
	input sin,ena;
	output sout;
		mytri tri_inst(.out(sout),.in(sin),.enable(ena));
	//引用由mytri模块定义的实例器件 tri_inst
endmodule

module mytri (out,in,enable);
	output out;
	input in,enable;
		assign out = enable?in:'bz;
endmodule
