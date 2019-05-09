module CLAAPtb();
reg [15:0]a1;
reg [15:0]b1;
wire[16:0]out1;
reg clk;
initial begin
$dumpfile("d9Stest.vcd");
$dumpvars(0,CLAAPtb);
clk=0;
  a1=65535;
  b1=65535;
  #7
  $monitor("time=%2d clk=%b a %b %d b %b %d sum with carry  %b %d ",$time,clk,a1,a1,b1,b1,out1,out1);
  #0 $finish;  
 
end
always
begin
#1 clk=~clk;

end

clapipe m(a1,b1,out1,clk);
endmodule