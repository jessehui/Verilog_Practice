module even_parity_verify;
reg[31:0] addr;
reg parity;

initial
begin
		addr = 32'h3456_789a;
	#10 addr = 32'hc464_78ff;
	#10 addr = 32'hac54_871f;
	#10 addr = 32'h3faa_a2c8;
end

always @ (addr)
begin
	parity = cal_par(addr);
	$disply("Parity of the address %x is %b",addr,parity);
end

function cal_par;
input[31:0] address;
//C风格定义函数：
//fuction cal_par(input[31:0] address);
begin
	cal_par = ^address;
end
endfunction

endmodule
