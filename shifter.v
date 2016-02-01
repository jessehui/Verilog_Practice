module shifter;
	`define Left_shift 		1'b0
	`define Right_shift 	1'b1
	//宏定义
	reg[31:0] addr,left_addr,right_addr;
	reg control;

	always @ (addr)
	begin
		left_addr = shift(addr,`Left_shift);
		right_addr = shift(addr,`Right_shift);
	end

	function[31:0] shift;
		input[31:0] address;
		input control;
		shift = (control == `Left_shift)?(address << 1) : (address >> 1);
		end
	endfunction
endmodule