module dff(input [31:0]D,input [31:0]D1,input clk,output reg [31:0]Q,output reg [31:0]Q1); 
always @(posedge clk) 
begin
 Q <= D; 
 Q1<= D1;
end 
endmodule 