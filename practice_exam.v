//**********(1)************
module AOI(A,B,C,D,F);
	input A,B,C,D;
	output F;
	assign F=(A&B)&(C&D);
endmodule


//***********(3)*************
module TestFixture;
MUX2M(SEL,A,B,F)
reg A,B,SEL;
wire F;

initial
begin
	SEL = 0; A = 0; B = 0;
	#10		A = 1;
	#10		SEL = 1;
	#10	    B =1;
end

initial
$monitor (SEL,A,B,F);

endmodule
