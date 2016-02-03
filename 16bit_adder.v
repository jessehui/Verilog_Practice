//*************行为描述*******
module adder_16bit(X,Y,C,S);
input[15:0]		X,Y;
output[15:0]	S;
output 			C;

assign {C,S} = X+Y;

endmodule

//************超前进位加法器*******
module adder_serial(rset,clk,cin,a,b,sum);
parameter		size = 8;

input rset,clk;
input [size-1 : 0] a,b;
input cin;

output [size : 0] sum;//sum多一位符号位

reg[size-1 : 0] a_r,b_r;
reg cin_r;

wire [size:0] sum_temp;
wire [size-1 : 0] cout_temp;

reg [size:0] sum;

always @ (posedge clk)
	if(!rset)
		begin
			a_r <= 8'd0;
			b_r <= 8'd0;
			cin_r <= 1'b0;
		end
	else begin
		a_r <= a;
		b_r <= b;
		cin_r <= cin;
	end

always @ (posedge clk)
	if(!rst_n)
		begin
			sum <= 9'd0;
		end
	else
		begin
			sum <= sum_temp;//有符号
			//sum <= {cout_temp[7],sum_temp};无符号
		end

//计算部分
//算法参照：令Gi = Xi·Yi,     Pi = Xi+Yi
//则Ci+1  = Gi + Pi·Ci

assign G[0] = a_r[0] & b_r[0];
assign P[0] = a_r[0] | b_r[0];
assign sum_temp[0] = a_r[0] ^ b_r[0] ^ cin_r;
assign cout_temp[0] = G[0] | (P[0] & cin_r;

assign G[1] = a_r[1] & b_r[1];
assign P[1] = a_r[1] & b_r[1];
assign sum_temp[1] = a_r[1] ^ b_r[1] ^ cin_temp[0];
assign cout_temp[1] = G[1] | (P[1] & cin_temp[1]);

assign G[2] =  a_r[2] & b_r[2];        //第2bit加法
assign P[2] =  a_r[2] | b_r[2];
assign sum_temp[2] = a_r[2] ^ b_r[2] ^ cout_temp[1];
assign cout_temp[2] =  G[2] | P[2] & cout_temp[1];     
 
assign G[3] =  a_r[3] & b_r[3];        //第3bit加法
assign P[3] =  a_r[3] | b_r[3];
assign sum_temp[3] = a_r[3] ^ b_r[3] ^ cout_temp[2];
assign cout_temp[3] =  G[3] | P[3] & cout_temp[2]; 

assign G[4] =  a_r[4] & b_r[4];        //第4bit加法
assign P[4] =  a_r[4] | b_r[4];
assign sum_temp[4] = a_r[4] ^ b_r[4] ^ cout_temp[3];
assign cout_temp[4] =  G[4] | P[4] & cout_temp[3]; 
 
assign G[5] =  a_r[5] & b_r[5];        //第5bit加法
assign P[5] =  a_r[5] | b_r[5];
assign sum_temp[5] = a_r[5] ^ b_r[5] ^ cout_temp[4];
assign cout_temp[5] =  G[5] | P[5] & cout_temp[4];
 
assign G[6] =  a_r[6] & b_r[6];        //第6bit加法
assign P[6] =  a_r[6] | b_r[6];
assign sum_temp[6] = a_r[6] ^ b_r[6] ^ cout_temp[5];
assign cout_temp[6] =  G[6] | P[6] & cout_temp[5];
 
assign G[7] =  a_r[7] & b_r[7];        //第7bit加法
assign P[7] =  a_r[7] | b_r[7];
assign sum_temp[7] = a_r[7] ^ b_r[7] ^ cout_temp[6];
assign cout_temp[7] =  G[7] | P[7] & cout_temp[6];

//sum多一位符号位
assign sum_temp[8] = a_r[7] ^ b_r[7] ^ count_temp[7];

endmodule


