module testebench();

  reg clk, [0:3] D,set,async_reset;

  wire [0:3]Q;

initial begin
  $display("clk D set");
  $monitor("%b %b %b %b", clk, D, set, async_reset);
  
endmodule
