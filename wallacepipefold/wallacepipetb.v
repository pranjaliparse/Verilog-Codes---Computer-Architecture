module wallacepipetb();
reg [15:0]a1;
reg [15:0]b1;
wire [31:0]out1;
reg clk;
initial begin
$dumpfile("d9Stest.vcd");
$dumpvars(0,wallacepipetb);


clk=0;
   a1=65535;
   b1=65535;
   #15
  $monitor("a %b %d b %b %d OUTPUT %b %d ",a1,a1,b1,b1,out1,out1);
  
#0 $finish;


end

always
begin
#1 clk=~clk;

end
wallacepipe m(a1,b1,out1,clk);
//dmux8x1S m(d1,s1,o1);
endmodule