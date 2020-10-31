module flipflop(input clk, reset,En, D, output reg Q);
  always @ (posedge clk, posedge reset)
    if (reset)
      Q <= 1'b0;
    else if (En)
      Q <= D;
endmodule

module FLIPT(input clk, reset, En, output Q);

  wire clb;

  assign clb = ~Q;

  flipflop c(clk, reset, En, clb, Q);

endmodule
