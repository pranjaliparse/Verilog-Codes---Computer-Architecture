`include "skgp.v"
`include "kgp1.v"
`include "fa.v"
`include "Dff.v"
module clapipe(input[15:0] a,input[15:0] b,output[16:0] s,input clk);

wire[1:0] X1[16:0];
wire[1:0] Y1[16:0];
wire[1:0] Z1[16:0];
wire[1:0] T[16:0];
wire[1:0] U[16:0];
wire[1:0] Y12[16:0];
wire[1:0] Z12[16:0];
wire[1:0] T1[16:0];
wire[1:0] U1[16:0];
assign X1[0]=2'b0;

genvar i;
generate

for(i=0;i<=15;i=i+1)
begin
   kgp k1(a[i],b[i],X1[i+1]);
end

assign Y1[0]=X1[0];

for(i=0;i<=15;i=i+1)
begin
   skgp s1(X1[i+1],X1[i],Y1[i+1]);
end


generate
for(i=0;i<=16;i=i+1)
dff a(Y1[i][0], Y1[i][1],clk, Y12[i][0], Y12[i][1]);
endgenerate

assign Z1[1]=Y12[1];
assign Z1[0]=Y12[0];

for(i=0;i<=14;i=i+1)
begin
   skgp s2(Y12[i+2],Y12[i],Z1[i+2]);
end

generate
for(i=0;i<=16;i=i+1)
dff a(Z1[i][0], Z1[i][1],clk, Z12[i][0], Z12[i][1]);
endgenerate

assign T[3]=Z12[3];
assign T[2]=Z12[2];
assign T[1]=Z12[1];
assign T[0]=Z12[0];

for(i=0;i<=12;i=i+1)
begin
   skgp s3(Z12[i+4],Z12[i],T[i+4]);
end

generate
for(i=0;i<=16;i=i+1)
dff a(T[i][0],T[i][1],clk, T1[i][0], T1[i][1]);
endgenerate

assign U[7]=T1[7];
assign U[6]=T1[6];
assign U[5]=T1[5];
assign U[4]=T1[4];
assign U[3]=T1[3];
assign U[2]=T1[2];
assign U[1]=T1[1];
assign U[0]=T1[0];

for(i=0;i<=8;i=i+1)
begin
   skgp s4(T1[i+8],T1[i],U[i+8]);
end


generate
for(i=0;i<=16;i=i+1)
dff a(U[i][0],U[i][1],clk, U1[i][0], U1[i][1]);
endgenerate

for(i=0;i<=15;i=i+1)
begin
   fulladd f0(a[i],b[i],U1[i][0],s[i]);
end
fulladd f16(1'b0,1'b0,U1[16][0],s[16]);
endgenerate

endmodule
