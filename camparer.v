module camparer(equal,a,b);
	input [1:0] a,b;
	output equal;
		assign equal=(a==b?)? 1:0;
endmodule

		