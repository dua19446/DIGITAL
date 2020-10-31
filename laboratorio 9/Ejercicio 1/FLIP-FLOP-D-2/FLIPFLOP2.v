module flip_flop(input clk, reset,En, D, output reg Q);
  always @ (posedge clk or posedge reset)begin
    if (reset)
      Q <= 1'b0;
    else if (En)
      Q <= D;
  end
endmodule



module flip_flop_2(input clk, reset, En, input wire [1:0]D, output [1:0]Q);

  flip_flop a(clk, reset, En, D[1], Q[1]);
  flip_flop a1(clk, reset, En, D[0], Q[0]);

endmodule
