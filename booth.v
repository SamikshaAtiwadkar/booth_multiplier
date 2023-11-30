module boothmul(ac,m,q);
output reg [7:0]ac;
input [3:0]m,q;
integer n;
reg q1;
reg[3:0]m1;
reg [1:0]temp;

always@(m,q)
begin
 ac=8'd0;
 q1=1'b0;
 m1=-m;
 for(n=0;n<4;n=n+1)
 begin
  temp={q[n],q1};
  case(temp)
  2'b10 : ac[7:4]=ac[7:4]+m1;
  2'b01 : ac[7:4]=ac[7:4]+m;
  endcase
  ac=ac>>1;
  ac[7]=ac[6];
  q1=q[n];
 end
end
endmodule


module tb;
reg[3:0]m,q;
wire [7:0]ac;
boothmul multi1(ac,m,q);
initial begin
$display("\t\t\t M       Q         Accummulator");
$monitor($time," %b       %b         %d ",m,q,ac);
#0 m=4'd7;q=4'd3;
#10 m=4'd4;q=4'd6;
#10 m=4'd7;q=4'd2;
end
endmodule
