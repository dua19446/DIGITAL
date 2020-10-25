module contador(input wire clk,reset,En,load,
input wire [11:0]load2,
output reg [11:0]q);

always @(posedge clk or posedge reset or load or load2) begin
  if(reset)
  q <= 12'b000000000000;
  else if(load)
  q <= load2;
  else if(En)
  q <= q + 1;
  end
endmodule
