module dff(input D,input D1,input clk,output reg Q,output reg Q1); 
always @(posedge clk) 
begin
 Q <= D; 
 Q1<= D1;
end 
endmodule 