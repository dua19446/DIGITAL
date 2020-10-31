module flip_flop(input clk, reset,En, D, output reg Q);
  always @ (posedge clk or posedge reset)begin
    if (reset)
      Q <= 1'b0;
    else if (En)
      Q <= D;
  end
endmodule

module flip_flop_4(input clk, reset, En, input wire [3:0]D, output[3:0]Q);

  flip_flop a(clk, reset, En, D[3], Q[3]);
  flip_flop b1(clk, reset, En, D[2], Q[2]);
  flip_flop b2(clk, reset, En, D[1], Q[1]);
  flip_flop b3(clk, reset, En, D[0], Q[0]);

endmodule
