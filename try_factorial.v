module try_factorial;
	function[31:0] factorial;
		input[3:0] operand;
		reg[3:0] index;
		begin
			factorial = 1;
			for(index=2;index<operand;index++)
				factorial = factorial * index;
		end
	endfunction

reg[31:0] result;
reg[3:0] n;
initial
begin
	result = 1;
	for(n=2;n<=9;n++)
	begin
		$display("Partial result n = %d result = %d",n,d);
		result = n * factorial(n)/(n*2+1);
	end
	$display("Finalresult = %d",result);
end

endmodule

//***************函数递归方法实现****************
module top

function automatic integer factorial;
	input[31:0] oper;
	integer i;
	begin 
		if(oper >= 2)
			factorial = factorial(oper-1) * oper;
		else 
			factorial = 1;			
		end
endfunction

integer result;
initial
begin
	result = factorial(4);
	$display("factorial of 4 is %d",result);
end

endmodule




